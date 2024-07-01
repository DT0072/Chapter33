<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ToastiesCustomizationPage.aspx.cs" Inherits="Chapter33.User.ToastiesCustomizationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
    <div class="container">
        <div class="heading_container">
            <h2>Toasties Customization</h2>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form_container">
                    <asp:Label runat="server" ID="lblProductName" Font-Bold="true" Font-Size="Large" style="text-align: center;"></asp:Label>                    <br />
                    <asp:Image runat="server" ID="imgProductImage" Width="200" Height="200" />
                </div>
            </div>

            <div class="col-md-6">
                <div class="form_container">
                    <div>
                        <div></div>
                    </div>
                </div>
            </div>
        </div>


    </div>

</section>
</asp:Content>
