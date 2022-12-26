<%-- 
    Document   : takencallsredirect
    Created on : 25 Ara 2022, 20:32:50
    Author     : sedat
--%>
<%@page import="com.mycompany.akasya.Calls" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
            String driversName=(String)session.getAttribute("driversName");
            String id=request.getParameter("callid");
            if(request.getParameter("callid")==null)
            {
                response.sendRedirect(request.getContextPath()+"/displaycalls_driver.jsp");
            }
            else
            {
                Calls tc= new Calls();
                tc.addDriver(driversName,Integer.parseInt(id));
                response.sendRedirect(request.getContextPath()+"/displaycalls_driver.jsp");
            }
        %>
</body>
</html>
