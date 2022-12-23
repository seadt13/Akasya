<%-- 
    Document   : call
    Created on : 19 Ara 2022, 01:34:19
    Author     : sedat
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.mycompany.akasya.*" %>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="en">
  <head>
    <title>Taksi Çaðýr - Akasya</title>
    <meta name="viewport" content="width=device-width height=device-height initial-scale=1.0">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Work+Sans:300,400,500,700%7CZilla+Slab:300,400,500,700,700i%7CGloria+Hallelujah">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/style.css">
    <style>.ie-panel{display: none;background: #212121;padding: 10px 0;box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3);clear: both;text-align:center;position: relative;z-index: 1;} html.ie-10 .ie-panel, html.lt-ie-10 .ie-panel {display: block;}</style>
  </head>
  <body>
    <div class="ie-panel"><a href="http://windows.microsoft.com/en-US/internet-explorer/"><img src="images/ie8-panel/warning_bar_0000_us.jpg" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
    <div class="preloader">
      <div class="preloader-logo"><a class="brand" href="index.html"><img class="brand-logo-dark" src="images/logo.png" alt="" width="150" height="150"/></a>
      </div>
      <div class="preloader-body">
        <div class="cssload-container">
          <div class="cssload-speeding-wheel"></div>
        </div>
      </div>
    </div>
    <div class="page">
      <header class="page-header">
        <!-- RD Navbar-->
        <div class="rd-navbar-wrap">
          <nav class="rd-navbar rd-navbar-modern" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-fixed" data-xl-layout="rd-navbar-static" data-xl-device-layout="rd-navbar-static" data-body-class="rd-navbar-modern-linked" data-lg-stick-up-offset="46px" data-xl-stick-up-offset="46px" data-xxl-stick-up-offset="46px" data-lg-stick-up="true" data-xl-stick-up="true" data-xxl-stick-up="true">
            <div class="rd-navbar-main-outer">
              <div class="rd-navbar-main">
                <div class="rd-navbar-nav-wrap">
                  <!-- RD Navbar Nav		-->
                  <ul class="rd-navbar-nav">
                    <ul class="rd-navbar-nav">
                    <li class="rd-nav-item active"><a class="rd-nav-link" href="uindex.jsp">Anasayfa</a>
                    </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="displaycalls.jsp">Çaðrýlarýmý Gör</a>
                    </li>
                  </ul>
                  </ul>
                </div>
                  <div class="rd-navbar-nav">
                      <p class="rd-nav-item" ><%
       Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://app.sobiad.com:3306/grup2", "grup2", "grup2");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Users`  WHERE `Email` LIKE '"+session.getAttribute("email")+"'");     
        while(rs.next())
        {
            String fullname=rs.getString("Name");
            String[] arrName=fullname.split(" ");
            out.println("Hoþgeldin "+arrName[0]);
        }  
        %></p>
                  </div>
              </div>
            </div>
            <div class="rd-navbar-aside-outer">
              <div class="rd-navbar-aside">
                <!-- RD Navbar Panel-->
                <div class="rd-navbar-panel">
                  <!-- RD Navbar Toggle-->
                  <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                  <!-- RD Navbar Brand-->
                  <div class="rd-navbar-brand"><a class="brand" href="index.html"><img class="brand-logo-dark" src="images/logo.png" alt="" width="150" height="150"/></a>
                  </div>
                </div>
                <div class="rd-navbar-collapse">
                  <button class="rd-navbar-collapse-toggle" data-rd-navbar-toggle=".rd-navbar-collapse-content"><span></span></button>
                  <div class="rd-navbar-collapse-content">
                    <div class="link-icon-title"><a class="link-icon-1" href="tel:+90 (543) 911 84 36"><span class="icon mdi mdi-phone"></span><span>+90 (543) 911 84 36</span></a></div>
                    <div><a class="link-icon-1" href="mailto:akasya.contact@gmail.com"><span class="icon mdi mdi-email-outline"></span><span>akasya.contact@gmail.com</span></a></div>
                  </div>
                </div>
              </div>
            </div>
          </nav>
        </div>
      </header>
      <!-- FScreen-->
      <section class="section parallax-container section-xl">
        <div class="parallax-content">
            
          <div class="container">
              <p class="heading-1 product-creative-title">Taksi Çaðýr</p> <br/>
              <div class="product-creative-main text-center">
              
             </div>
              <form action="callredirect.jsp" method="post">
                  <input class="form-input" id="autocomplete" type="text" name="location" data-constraints="@Required"> <br/>
                <input class="button button-lg button-primary button-raven" type="submit" value="Çaðýr"/>
              </form>
          </div>
        </div>
      </section>
      <!-- Page Footer--><img src="images/footer.jpg" alt=""/>
      <footer class="section footer-modern bg-gray-950">
        <div class="footer-modern-main">
          <div class="container">
              <div class="col-lg-4">
                <h4 class="font-weight-regular footer-modern-title">Bize ulaþýn</h4>
                <!-- RD Mailform-->
                <form class="rd-form form-sm rd-mailform" data-form-output="form-output-global" data-form-type="contact" method="post" action="bat/rd-mailform.php">
                  <div class="form-wrap">
                    <input class="form-input" id="contact-form-name-3" type="text" name="name" data-constraints="@Required">
                    <label class="form-label" for="contact-form-name-3">Ýsminiz:</label>
                  </div>
                  <div class="form-wrap">
                    <input class="form-input" id="contact-form-email-3" type="email" name="email" data-constraints="@Email @Required">
                    <label class="form-label" for="contact-form-email-3">E-postanýz:</label>
                  </div>
                  <div class="form-wrap">
                    <label class="form-label" for="contact-form-message-3">Mesajýnýz:</label>
                    <textarea class="form-input" id="contact-form-message-3" name="message" data-constraints="@Required"></textarea>
                  </div>
                  <div class="form-wrap">
                    <button class="button button-primary button-raven" type="submit">Gönder</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        <div class="footer-modern-aside">
          <div class="container">
            <div class="layout-2">
              <!-- Rights-->
              <p class="rights"><span>Akasya &copy;&nbsp;</span><span class="copyright-year"></span>. Tüm haklarý saklýdýr.</p>
              <div>
                <div class="group group-middle"><a class="link-social-2 icon mdi mdi-facebook" href="#"></a><a class="link-social-2 icon mdi mdi-twitter" href="#"></a><a class="link-social-2 icon mdi mdi-google" href="#"></a><a class="link-social-2 icon mdi mdi-instagram" href="#"></a><a class="link-social-2 icon mdi mdi-linkedin" href="#"></a></div>
              </div>
            </div>
          </div>
        </div>
      </footer>
    </div>
    <div class="snackbars" id="form-output-global"></div>
    <script src="js/core.min.js"></script>
    <script src="js/script.js"></script>
    <script>
      let autocomplete;
      function initAutocomplete()
      {
          autocomplete= new google.maps.places.Autocomplete(document.getElementById('autocomplete'),
          {
              types: ['establishment'],
              componentRestrictions: {'country':['TR']},
              fields:['place_id','geometry','name'] 
          });
          autocomplete.addListener('place_changed', onPlaceChanged);
      }
      function onPlaceChanged()
      {
          var place= autocomplete.getPlace();

          if(!place.geometry){
              document.getElementById('autocomplete').placeholder='enter a place';
          }
          else{
              document.getElementById('details').innerHTML=place.name;
          }
      }
  </script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDiDC_Tlr8Y5XqhOjv-6wVHLDUQ6om_74c
  &libraries=places&callback=initAutocomplete" async defer></script> 
  </body>
</html>
    
        