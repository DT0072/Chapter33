<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SliderUserControl.ascx.cs" Inherits="Chapter33.User.SliderUserControl" %>

    <section class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                      Welcome to Chapter33 Coffee
                    </h1>
                    <p>
At Chapter33 Coffee, every cup tells a story. Our expertly roasted beans and carefully crafted blends ensure that each sip delivers a moment of pure delight. Whether you’re a coffee connoisseur or just starting your journey, we have something special for you.                    </p>
                    <div class="btn-box">
                      <a href="menu.aspx" class="btn1">
                        Order Now
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item ">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                      Sourced with Care
                    </h1>
                    <p>
 We believe in quality and sustainability. Our beans are sourced from the finest coffee farms around the world, ensuring fair trade practices and exceptional flavor. Pair your favorite brew with one of our delicious, freshly made toasties for the ultimate café experience.                    <div class="btn-box">
                      <a href="menu.aspx" class="btn1">
                        Order Now
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                     More Than Just Coffee                    
                    </h1>
                    <p>
Chapter33 Coffee is more than a coffee shop; it’s a community hub. Join us for live music, art events, and workshops. Enjoy a cozy atmosphere where you can connect, create, and relax with the perfect cup of coffee and a delectable toastie                    </p>
                    <div class="btn-box">
                      <a href="menu.aspx" class="btn1">
                        Order Now
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>
          </ol>
        </div>
      </div>
    </section>