using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chapter33.User
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    getUserDetails();
                }
                else if (Session["UserId"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        private void getUserDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                textName.Text = dt.Rows[0]["Name"].ToString();
                textUsername.Text = dt.Rows[0]["Username"].ToString();
                textMobile.Text = dt.Rows[0]["Mobile"].ToString();
                textEmail.Text = dt.Rows[0]["Email"].ToString();
                textPostcode.Text = dt.Rows[0]["Postcode"].ToString();
                textAddress.Text = dt.Rows[0]["Address"].ToString();
                imgUser.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString())
                    ? "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                imgUser.Height = 200;
                imgUser.Width = 200;
                textPassword.Text = dt.Rows[0]["Password"].ToString();
                textPassword.TextMode = TextBoxMode.SingleLine;
            }
            lblHeaderMsg.Text = "<h2>Edit Profile<h2>";
            btnRegister.Text = "Update";
            lblAlreadyUser.Text = "";
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int userId = Convert.ToInt32(Request.QueryString["id"]);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", userId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Name", textName.Text.Trim());
            cmd.Parameters.AddWithValue("@Username", textUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@Mobile", textMobile.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", textEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", textPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", textAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@Postcode", textPostcode.Text.Trim());
            if (fuUserImage.HasFile)
            {
                if (Utils.IsValidExtension(fuUserImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuUserImage.FileName);
                    imagePath = "Images/User/" + obj.ToString() + fileExtension;
                    fuUserImage.PostedFile.SaveAs(Server.MapPath("~/Images/User/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg .jpeg or .png image";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;
            }

            if (isValidToExecute)
            {   
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = userId == 0 ?
                        "registration is successful! <b><a href='Login.aspx'>Click here to login</a></b>" :
                        "details updated successful! <b><a href='Profile.aspx'>Can check here</a></b>";
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + textUsername.Text.Trim() + "</b>" + actionName;
                    lblMsg.CssClass = "alert alert-success";
                    if (userId != 0)
                    {
                        Response.AddHeader("REFRESH", "1;URL=Profile.aspx");
                    }
                    Clear();
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "<b>" + textUsername.Text.Trim() + "</b> Username already exist!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error- " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }
        private void Clear()
        {
            textName.Text = String.Empty;
            textUsername.Text = String.Empty;
            textMobile.Text = String.Empty;
            textEmail.Text = String.Empty;
            textAddress.Text = String.Empty;
            textPassword.Text = String.Empty;
            textPostcode.Text = String.Empty;
        }
    }
}
