using Chapter33.Admin;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chapter33.User
{
    public partial class CoffeeCustomizationPage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        private decimal basePrice
        {
            get { return (decimal)ViewState["basePrice"]; }
            set { ViewState["basePrice"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                int productId = int.Parse(Request.QueryString["ProductId"]);
                string productName = Request.QueryString["Name"];
                string imageUrl = Request.QueryString["ImageUrl"];
                basePrice = GetBasePrice(productId);

                // Display the product name and image on the page
                lblProductName.Text = productName;
                imgProductImage.ImageUrl = imageUrl;

                getSizeDetails();
                getMilkTypeDetails();
                getAddOnsDetails();
                UpdateTotalPrice();
            }
        }

        private decimal GetBasePrice(int productId)
        {
            decimal price = 0.0m;

            string query = "SELECT Price FROM Products WHERE ProductId = @ProductId";

            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);

                    try
                    {
                        con.Open();
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            price = Convert.ToDecimal(result);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception as needed
                        Console.WriteLine(ex.Message);
                    }
                }
            }

            return price;
        }

        protected void rblCoffeeSizes_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTotalPrice();
        }

        protected void rblMilkType_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTotalPrice();
        }
        protected void cbAddOns_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTotalPrice();
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

        private void getSizeDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("SizeOptions", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            // Create a new column to display both size and price
            dt.Columns.Add("SizeNameAndPrice", typeof(string));

            // Loop through the rows and format the new column
            foreach (DataRow row in dt.Rows)
            {
                row["SizeNameAndPrice"] = string.Format("{0} - RM{1:F2}", row["SizeName"], row["SizeAdditionalPrice"]);
            }

            // Bind the data to the RadioButtonList
            rblCoffeeSizes.DataSource = dt;
            rblCoffeeSizes.DataTextField = "SizeNameAndPrice";
            rblCoffeeSizes.DataValueField = "SizeId";
            rblCoffeeSizes.DataBind();
        }


        private void getMilkTypeDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("MilkTypeOptions", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            // Create a new column to display both milk type and price
            dt.Columns.Add("MilkTypeNameAndPrice", typeof(string));

            // Loop through the rows and format the new column
            foreach (DataRow row in dt.Rows)
            {
                row["MilkTypeNameAndPrice"] = string.Format("{0} - RM{1:F2}", row["MilkTypeName"], row["MilkAdditonalPrice"]);
            }
            rblMilkType.DataSource = dt;
            rblMilkType.DataTextField = "MilkTypeNameAndPrice";
            rblMilkType.DataValueField = "MilkTypeId";
            rblMilkType.DataBind();
        }

        private void getAddOnsDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("CoffeeAddonsOptions", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            dt.Columns.Add("AddOnNameAndPrice", typeof(string));

            foreach (DataRow row in dt.Rows)
            {
                row["AddOnNameAndPrice"] = string.Format("{0} - RM{1:F2}", row["CoffeeAddOnsName"], row["CoffeeAddOnsPrice"]);
            }

            cbAddOns.DataSource = dt;
            cbAddOns.DataTextField = "AddOnNameAndPrice";
            cbAddOns.DataValueField = "CoffeeAddOnsId";
            cbAddOns.DataBind();
        }

        private decimal totalPrice;
        private void UpdateTotalPrice()
        {
            decimal additionalPrice = 0; // Initialize additionalPrice to 0

            if (rblCoffeeSizes.SelectedItem != null)
            {
                string selectedSizePrice = rblCoffeeSizes.SelectedItem.Text.Split('-')[1].Trim().Substring(2);
                additionalPrice += decimal.Parse(selectedSizePrice);
            }

            if (rblMilkType.SelectedItem != null)
            {
                string selectedMilkPrice = rblMilkType.SelectedItem.Text.Split('-')[1].Trim().Substring(2);
                additionalPrice += decimal.Parse(selectedMilkPrice);
            }

            foreach (ListItem item in cbAddOns.Items)
            {
                if (item.Selected)
                {
                    string addOnPriceText = item.Text.Split('-')[1].Trim().Substring(2);
                    additionalPrice += decimal.Parse(addOnPriceText);
                }
            }
            totalPrice = basePrice + additionalPrice;

            lblPrice.Text = "RM " + totalPrice.ToString("F2");
           
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {

        }
    }
}
