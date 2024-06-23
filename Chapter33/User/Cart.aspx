<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Chapter33.User.Cart" MasterPageFile="~/User/User.master" %>
<%@ Register Src="~/User/SliderUserControl.ascx" TagPrefix="uc1" TagName="SliderUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Shopping Cart - Chapter33 Coffee</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU0bPxLCIIfg2y6yG8g38UsM8U5y08PZx1Q" crossorigin="anonymous">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="py-5 text-center">
            <h2>Shopping Cart</h2>
        </div>

        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Your Cart</h4>
                <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Product" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <button type="button" class="btn btn-danger" onclick="removeItem('<%# Eval("ProductId") %>')">Remove</button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <div class="my-3 p-3 bg-body rounded shadow-sm">
                    <h6 class="border-bottom pb-2 mb-0">Cart Total</h6>
                    <div class="d-flex text-muted pt-3">
                        <asp:Label ID="TotalLabel" runat="server" CssClass="total-label">Total: $0.00</asp:Label>
                    </div>
                </div>
            </div>

            <div class="col-md-5 col-lg-4">
                <h4 class="mb-3">Order Summary</h4>
                <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Total</h6>
                        </div>
                        <asp:Label ID="SummaryTotalLabel" runat="server" CssClass="text-muted">$0.00</asp:Label>
                    </li>
                </ul>

                <button class="w-100 btn btn-primary btn-lg" type="button" onclick="checkout()">Proceed to Checkout</button>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRp6b7aP1rRvL1z0sl5I5DQnF8ht/g5+yG4lbjq7A" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js" integrity="sha384-0BQ4/c/mH/xxY/T+zQ0snXtxkGhHSQ/qWjD7ccJov8ipw+uWbDRtDW1eqCpM4VCM" crossorigin="anonymous"></script>
    <script>
        function removeItem(productId) {
            __doPostBack('RemoveButton', productId);
        }

        function checkout() {
            window.location.href = 'Checkout.aspx';
        }
    </script>
</asp:Content>