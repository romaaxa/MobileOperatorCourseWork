﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PhoneStation
{
    public partial class Login : System.Web.UI.Page
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
            if (TextBox2.Text == db[TextBox1.Text])
            {
                HttpCookie login = new HttpCookie("Login", TextBox1.Text);
                HttpCookie sign = new HttpCookie("sign", Signature.GetSign(TextBox1.Text + "bytepp"));
                Response.Cookies.Add(login);
                Response.Cookies.Add(sign);
                Response.Redirect("Userpage.aspx", false);
            }
        }
        protected void Page_Unload(object sender, EventArgs s)
        {
            if (sqlConnection != null && sqlConnection.State != ConnectionState.Closed)
                sqlConnection.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ClientPage.aspx");
        }
    }
}