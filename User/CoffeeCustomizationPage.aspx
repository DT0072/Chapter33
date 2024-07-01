<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="CoffeeCustomizationPage.aspx.cs" Inherits="Chapter33.User.CoffeeCustomizationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <h2>Coffee Customization</h2>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <asp:Label runat="server" ID="lblProductName" Font-Bold="true" Font-Size="Large"></asp:Label>
                        <br />
                        <asp:Image runat="server" ID="imgProductImage" Width="200" Height="200" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <label>Size</label>
                            <asp:RadioButtonList ID="rblCoffeeSizes" runat="server" DataTextField="SizeNameAndPrice" DataValueField="SizeId" OnSelectedIndexChanged="rblCoffeeSizes_SelectedIndexChanged" AutoPostBack="true"></asp:RadioButtonList>
                        </div>
                        <br />
                        <div>
                            <label>Milk Type</label>
                            <asp:RadioButtonList ID="rblMilkType" runat="server" DataTextField="MilkTypeNameAndPrice" DataValueField="MilkTypeId" OnSelectedIndexChanged="rblMilkType_SelectedIndexChanged" AutoPostBack="true"></asp:RadioButtonList>
                        </div>
                        <br />
                        <div>
                            <label>Addons</label>
                            <asp:CheckBoxList ID="cbAddOns" runat="server" DataTextField="AddOnNameAndPrice" DataValueField="CoffeeAddOnsId" OnSelectedIndexChanged="cbAddOns_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>

                        </div>
                        <br />
                        <div>
                            <label>Price: </label>
                            <asp:Label ID="lblPrice" runat="server"></asp:Label>
                        </div>
                        
                        <br />
                        <div class="btn_box">
                            <asp:Button ID="btnOrder" runat="server" Text="Place Order" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" OnClick="btnOrder_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
