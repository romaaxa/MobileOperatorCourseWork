using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PhoneStation
{
    public partial class Registration : System.Web.UI.Page
    {
        private SqlConnection sqlConnection = null;
        protected async void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            sqlConnection = new SqlConnection(connectionString);

            await sqlConnection.OpenAsync();
        }

        protected async void Button1_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> db = new Dictionary<string, string>();

            SqlCommand getUsersCmnd = new SqlCommand("SELECT [Login], [Password] FROM [userinfo]", sqlConnection);

            SqlDataReader sqlReader = null;

            try
            {
                sqlReader = await getUsersCmnd.ExecuteReaderAsync();
                while (await sqlReader.ReadAsync())
                {
                    db.Add(Convert.ToString(sqlReader["Login"]), Convert.ToString(sqlReader["Password"]));
                }
            }
            catch { }
            finally
            {
                if (sqlReader != null)
                    sqlReader.Close();
            }
            if(!db.Keys.Contains(TextBox1.Text))
            {
                SqlCommand RegUser = new SqlCommand("INSERT INTO [userinfo] (Login, Password)VALUES(@Login, @Password)", sqlConnection);
                RegUser.Parameters.AddWithValue("Login", TextBox1.Text);
                RegUser.Parameters.AddWithValue("Password", TextBox2.Text);

                await RegUser.ExecuteNonQueryAsync();

                Response.Redirect("Login.aspx");
            }
            else
            {
                string script = "alert('This login has already used!');";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
            }
        }
        protected void Page_Unload(object sender, EventArgs s)
        {
            if (sqlConnection != null && sqlConnection.State != ConnectionState.Closed)
                sqlConnection.Close();
        }
    }
}