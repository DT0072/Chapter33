using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chapter33.User
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

            private void BindCart()
            {
                //Example Data
                DataTable dt = new DataTable();
                dt.Columns.Add("ProductId", typeof(int));
                dt.Columns.Add("ProductName", typeof(string));
                dt.Columns.Add("Price", typeof(decimal));
                dt.Columns.Add("Quantity", typeof(int));
                dt.Columns.Add("Total", typeof(decimal));

                dt.Rows.Add(1, "Product 1", 2, 10.00m, 20.00m);
                dt.Rows.Add(2, "Product 2", 3, 15.00m, 15.00m);
                dt.Rows.Add(3, "Product 3", 4, 7.00m, 21.00m);

                CartGridView.DataSource = dt;
                CartGridView.DataBind();

                //Calculate Total
                decimal total = 0;
                foreach (DataRow row in dt.Rows)
                {
                    total += Convert.ToDecimal(row["Total"]);
                }
                TotalLabel.Text = "Total:" + total.ToString("C");
                SummaryTotalLabel.Text = total.ToString("C");
            }

            protected void RemoveButton_Click(object sender, EventArgs e)
            {
                int productId = Convert.ToInt32((sender as Button).CommandArgument);

                // Remove Item From Cart Logic and Example
                DataTable dt = (DataTable)CartGridView.DataSource;
                DataRow row = dt.Select($"ProductID = {productId}")[0];
                if(row != null)
                dt.Rows.Remove(row);

            BindCart();
            }

            protected void CheckoutButton_Click(object sender, EventArgs e)
            {
                // Handle Checkout Logic
                Response.Redirect("Checkout.aspx");
            }
    }
}