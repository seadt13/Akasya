<%-- 
    Document   : regredirect
    Created on : 21 Ara 2022, 03:29:15
    Author     : sedat
--%>
<%@page import="com.mycompany.akasya.Driver" %>
<%@page import="com.mycompany.akasya.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        String type=request.getParameter("rb");
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String phone=request.getParameter("phone");
        if(email==null || pass==null|| type==null ||name==null || phone==null)
        {
            response.sendRedirect(request.getContextPath()+"/regerror.jsp");
        }
        else
        {
         switch(type){   
            case "user": 
                User us=new User();
                us.setName(name);
                us.setEmail(email);
                us.setPassword(pass);
                us.setPhone(phone);

                if(us.AddUser())
                {
                    response.sendRedirect(request.getContextPath()+"/uindex.jsp");
                }
                else
                {
                    out.println("Kayýt iþleminde hata gerçekleþti!!!");
                    response.sendRedirect(request.getContextPath()+"/regerror.jsp");
                }
            break;
            case "driver":
                String plate=request.getParameter("plate");
                if(plate==null)
                {
                    response.sendRedirect(request.getContextPath()+"/regerror.jsp");
                }
                Driver dr=new Driver();
                dr.setName(name);
                dr.setEmail(email);
                dr.setPassword(pass);
                dr.setPhone(phone);
                dr.setPlate(plate);

                if(dr.AddUser())
                {
                    response.sendRedirect(request.getContextPath()+"/dindex.jsp");
                }
                else
                {
                    out.println("Kayýt iþleminde hata gerçekleþti!!!");
                    response.sendRedirect(request.getContextPath()+"/regerror.jsp");
                }
                break;
            default:
                response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
        }
       
    %>
</body>
</html>
