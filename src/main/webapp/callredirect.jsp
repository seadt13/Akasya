<%-- 
    Document   : callredirect
    Created on : 21 Ara 2022, 18:30:39
    Author     : sedat
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.mycompany.akasya.*" %>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>
        <%
            String email=(String)session.getAttribute("email");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://app.sobiad.com:3306/grup2", "grup2", "grup2");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Users`  WHERE `Email` LIKE '"+email+"'");     
            while(rs.next())
            {
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");  
                LocalDateTime now = LocalDateTime.now();  
                String fullname=rs.getString("Name");
                session.setAttribute("name",fullname);
                String location=request.getParameter("location");
                
                Calls newCall= new Calls();
                
                newCall.callTaxi(fullname,location,dtf.format(now));
                
                response.sendRedirect(request.getContextPath()+"/displaycalls.jsp");
            }
        %>
</body>
</html>
