<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
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
<h1>Sessions--Welcome Page</h1>
<p>Welcome!  This mini project will unlock some of the
secrets of sessions for you.</p>
<!--the below includes the HTML only if the Java evaluates to true -->
<!--note the difference in accessing session variables
    between Java scriptlet  and Expressions language  -->
<% if (session.getAttribute("username") != null) { %>
    <p>${sessionScope.username}, you are already logged in.</p>
<% }
//    if (session.getAttribute("username") != null) {
//    out.print("<p>" + session.getAttribute("username")
//            + ", you are already logged in.</p>");
//    }
%>

</body>
</html>
