using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chapter33.User
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("ContactSp", con);
                cmd.Parameters.AddWithValue("@Action", "INSERT");
                cmd.Parameters.AddWithValue("@Name", textName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", textEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Subject", textSubject.Text.Trim());
                cmd.Parameters.AddWithValue("@Message", textMessage.Text.Trim());
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Thanks for reaching us out";
                lblMsg.CssClass = "alert alert-success";
                Clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(' " + ex.Message + " ')</script>");
            }
            finally
            {
                con.Close();
            }
        }
        private void Clear()
        {
            textName.Text = String.Empty;
            textEmail.Text = String.Empty;
            textSubject.Text = String.Empty;
            textMessage.Text = String.Empty;
        }
    }
}