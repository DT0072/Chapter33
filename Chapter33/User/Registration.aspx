<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Chapter33.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        /*For disappearing alert message*/
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                ErrorMessage="Name is required" ControlToValidate="textName"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" runat="server"
                                ErrorMessage="Name must be in characters only"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                                ControlToValidate="textName"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="textName" runat="server" CssClass="form-control" placeholder="Enter Full Name"
                                ToolTip="Full Name"></asp:TextBox>

                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                                ErrorMessage="Username is required" ControlToValidate="textUsername"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="textUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
                                ToolTip="Username"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                ErrorMessage="Email is required" ControlToValidate="textEmail"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ErrorMessage="Name must be in characters only"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                                ControlToValidate="textEmail"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="textEmail" runat="server" CssClass="form-control" placeholder="Enter Email"
                                ToolTip="Email"></asp:TextBox>

                        </div>

                        <div>

                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                                ErrorMessage="Mobile No. is required" ControlToValidate="textMobile"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server"
                                ErrorMessage="Mobile No. must have 10 digits"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{0}$"
                                ControlToValidate="textMobile"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="textMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"
                                ToolTip="Mobile Number"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">
                        <div>

                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                                ErrorMessage="Address is required" ControlToValidate="textAddress"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="textAddress" runat="server" CssClass="form-control" placeholder="Enter Address"
                                ToolTip="Address" TextMode="MultiLine"></asp:TextBox>
                        </div>

                        <div>

                            <asp:RequiredFieldValidator ID="rfvPostcode" runat="server"
                                ErrorMessage="Postcode is required" ControlToValidate="textPostcode"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPostcode" runat="server"
                                ErrorMessage="Postcode must contain 5 digits"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{5}$"
                                ControlToValidate="textPostcode"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="textPostcode" runat="server" CssClass="form-control" placeholder="Enter Postcode"
                                ToolTip="Postcode" TextMode="Number"></asp:TextBox>
                        </div>

                        <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onchange="ImagePreview(this);" />
                        </div>

                        <div>

                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                ErrorMessage="Password is required" ControlToValidate="textPassword"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="textPassword" runat="server" CssClass="form-control" placeholder="Enter Password"
                                ToolTip="Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row pl-4">
                    <div class="btn_box">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" />

                        <asp:Label ID="lblAlreadyUser" runat="server" Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here..</a>">

                        </asp:Label>
                    </div>
                </div>

                <div class="row p-5">
                    <div style="align-items: center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
