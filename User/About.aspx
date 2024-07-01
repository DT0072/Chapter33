<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Chapter33.User.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">

      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="../TemplateFiles/images/about-img.png" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                We Are Chapter33 Coffee
              </h2>
            </div>
            <p>
              "Welcome to Chapter33 Coffee Shop, where every cup is a new story. 
                Nestled in the heart of the city, we pride ourselves on blending tradition with innovation to create a unique coffee experience. 
                Our expert baristas meticulously craft each beverage using the finest beans sourced from around the world, ensuring rich flavors and aromas in every sip. 
                Beyond coffee, we offer a warm, inviting atmosphere perfect for catching up with friends, diving into a good book, or finding inspiration for your next big idea. 
                At Chapter33, we believe that great coffee and great company go hand in hand, making each visit a memorable chapter in your day."
            </p>
            <a href="">
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->
</asp:Content>

