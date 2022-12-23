<%-- 
    Document   : logout.jsp
    Created on : 22 Ara 2022, 01:47:03
    Author     : sedat
--%>

<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        session.invalidate();
        response.sendRedirect("index.html");
    %>
</body>
</html>
