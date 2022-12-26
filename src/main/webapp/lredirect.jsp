<%-- 
    Document   : lredirect
    Created on : 21 Ara 2022, 03:07:41
    Author     : sedat
--%>
<%@page import="com.mycompany.akasya.Driver" %>
<%@page import="com.mycompany.akasya.User" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        String status="true";
        session.setAttribute("status",status);
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String type=request.getParameter("rb");
        switch(type){   
            case "user": 
                User us=new User();
                if(us.CheckUser(email, pass)==true){
                    session.setAttribute("email", email);
                    response.sendRedirect("uindex.jsp");
                }
                else{
                    status="false";
                    response.sendRedirect("loginerror.jsp");
                }
            break;
            case "driver": 
                Driver dr=new Driver();
                if(dr.CheckUser(email, pass)==true){
                    session.setAttribute("email", email);
                    response.sendRedirect("dindex.jsp");
                }
                else{
                    status="false";
                    response.sendRedirect("loginerror.jsp");
                }
                break;
            default:
                status="false";
                response.sendRedirect("loginerror.jsp");
        }
    %>
</body>
</html>
