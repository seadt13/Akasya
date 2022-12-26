<%-- 
    Document   : displaycalls
    Created on : 19 Ara 2022, 01:34:19
    Author     : sedat
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.akasya.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html class="wide wow-animation" lang="tr">
  <head>
    <title>Anasayfa - Akasya</title>
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
      <div class="preloader-logo"><a class="brand" href="dindex.jsp"><img class="brand-logo-dark" src="images/logo.png" alt="" width="150" height="150"/></a>
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
                      <li class="rd-nav-item"><a class="rd-nav-link" href="call.jsp">Taks� �a��r</a>
                    </li>
                  </ul>
                </div>
                  <div class="rd-navbar-nav">
                      <p class="rd-nav-item" >
                          <%
                                boolean isDriver=(boolean)session.getAttribute("isDriver");
                                String fullname=(String)session.getAttribute("fullname");
                                String name=(String)session.getAttribute("name");
                                if(name==null || isDriver==true)
                                {
                                     response.sendRedirect("login.jsp");
                                }
                                else
                                {
                                   out.println("Ho�geldin "+name);
                                }
                         %>
                      </p><a style="color: #cb2027; margin-left: 20px;" href="logout.jsp">��k�� Yap</a>
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
          <div class="container text-center">
                            <%
                       if(name==null)
                       {
                           response.sendRedirect("login.jsp");
                       }
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection con1 = DriverManager.getConnection(
                               "jdbc:mysql://app.sobiad.com:3306/grup2?useUnicode=yes&characterEncoding=UTF-8", "grup2", "grup2");
                       Statement stmt1 = con1.createStatement();
                       ResultSet rs1 = stmt1.executeQuery("SELECT * FROM `Calls` WHERE `ClientsName` LIKE '"+fullname+"'");    
                       %>
                       <table border=1 align=center style="text-align:center">
                     <tr>
                        <th>ID</th>
                        <th>M��teri Ad�</th>
                        <th>S�r�c� Ad�</th>
                        <th>Konum</th>
                        <th>Tarih ve Saati</th>
                     </tr>
                       <%while(rs1.next())
                       {
                       %>
                       <tr>
                           <td><%=rs1.getInt("ID") %></td>
                           <td><%=rs1.getString("ClientsName") %></td>
                           <td><%=rs1.getString("DriversName") %></td>
                           <td><%=rs1.getString("Location") %></td>
                           <td><%=rs1.getString("Datetime") %></td>
                       </tr>
                       <%}%>
                   </table><br>  
          </div>
        </div>
      </section>
      <!-- Page Footer--><img src="images/footer.jpg" alt=""/>
      <footer class="section footer-modern bg-gray-950">
        <div class="footer-modern-main">
          <div class="container">
              <div class="col-lg-4">
                <h4 class="font-weight-regular footer-modern-title">Bize ula��n</h4>
                <!-- RD Mailform-->
                <form class="rd-form form-sm rd-mailform" data-form-output="form-output-global" data-form-type="contact" method="post" action="bat/rd-mailform.php">
                  <div class="form-wrap">
                    <input class="form-input" id="contact-form-name-3" type="text" name="name" data-constraints="@Required">
                    <label class="form-label" for="contact-form-name-3">�sminiz:</label>
                  </div>
                  <div class="form-wrap">
                    <input class="form-input" id="contact-form-email-3" type="email" name="email" data-constraints="@Email @Required">
                    <label class="form-label" for="contact-form-email-3">E-postan�z:</label>
                  </div>
                  <div class="form-wrap">
                    <label class="form-label" for="contact-form-message-3">Mesaj�n�z:</label>
                    <textarea class="form-input" id="contact-form-message-3" name="message" data-constraints="@Required"></textarea>
                  </div>
                  <div class="form-wrap">
                    <button class="button button-primary button-raven" type="submit">G�nder</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        <div class="footer-modern-aside">
          <div class="container">
            <div class="layout-2">
              <!-- Rights-->
              <p class="rights"><span>Akasya &copy;&nbsp;</span><span class="copyright-year"></span>. T�m haklar� sakl�d�r.</p>
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
  </body>
</html>