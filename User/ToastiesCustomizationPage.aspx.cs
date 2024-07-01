using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chapter33.User
{
    public partial class ToastiesCustomizationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int productId = int.Parse(Request.QueryString["ProductId"]);
                string productName = Request.QueryString["Name"];
                string imageUrl = Request.QueryString["ImageUrl"];

                // Display the product name and image on the page
                lblProductName.Text = productName;
                imgProductImage.ImageUrl = imageUrl;
            }
        }
        protected void rProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "addToCart")
            {
                string[] args = e.CommandArgument.ToString().Split(';');
                int productId = int.Parse(args[0]);
                string productName = args[1];
                string imageUrl = args[2];
                string categoryName = args[3];
            }
        }
    }
}