using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PhoneStation
{
    public partial class ClientPage : System.Web.UI.Page
    {
        DataTable dtr = new DataTable();
        IsValidContext isvalid1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            RequestDBDataContext dbr = new RequestDBDataContext();

            requesttable tb = new requesttable();

            isvalid1 = new IsValidContext();

            isvalid1 = new IsValidContext();
            if ((isvalid1.IsNotEmptyStrings(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text))
                && isvalid1.IsInt(TextBox1.Text, TextBox5.Text))
            {
                tb.Id = Convert.ToInt16(TextBox1.Text);
                tb.surname = TextBox2.Text;
                tb.name = TextBox3.Text;
                tb.operatorinf = TextBox4.Text;
                tb.internetspeed = Convert.ToInt32(TextBox5.Text);
                tb.sumofperation = (1.6 * Convert.ToInt32(TextBox5.Text)).ToString();

                dbr.requesttables.InsertOnSubmit(tb);
                dbr.SubmitChanges();

                Response.Write("<script>alert('Your request is sucsessfully completed!')</script>");
                //Response.Redirect(Request.RawUrl);
                Response.Redirect("ClientPage.aspx");
            }
            else
            {
                // Response.Redirect(Request.RawUrl);
                Response.Write("<script>alert('Incorrect Data!')</script>");
            }
        }

        protected void ButtonTry_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logout.aspx");
        }
    }
}