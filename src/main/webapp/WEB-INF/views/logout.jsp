<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log Out</title>
</head>
<%
    //if session values aren't set, set to default
    if (session.getAttribute("color") == null) {
        session.setAttribute("color", "white");
    }
    if (session.getAttribute("font") == null) {
        session.setAttribute("font", "Times New Roman");
    }
%>
<body style="background-color:${sessionScope.color};font-family:${sessionScope.font}">
<p style="text-align:center">
    <a href="/">Home</a> *
    <a href="/login">Login</a> *
    <a href="/prefs">Preferences</a> *
    <a href="/secret">Secret</a> *
    <a href="/logout">Logout</a>
</p>
<h1>Logged Out</h1>
<p>You are now successfully logged out and all session attributes are reset.</p>
<p>You can verify this on the <a href="/secret">Secret Page</a></p>
<p>Return to the <a href="/login">Login</a> page to log back in.</p>
</body>
</html>
