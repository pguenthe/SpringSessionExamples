<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<h1>Preferences</h1>
Please select your preferences:
<form action="prefsubmit" method="post">
    <strong>Font:</strong>
    <select name="font">
        <option value="${sessionScope.font}">Current: ${sessionScope.font}</option>
        <option value="Arial">Arial</option>
        <option value="Comic Sans MS">Comic Sans</option>
        <option value="Courier New">Courier New</option>
        <option value="Times New Roman">Times New Roman</option>
        <option value="Verdana">Verdana</option>
    </select>

    <strong>Color:</strong>
    <select name="color">
        <option value="${sessionScope.color}">Current: ${sessionScope.color}</option>
        <option value="AntiqueWhite">AntiqueWhite</option>
        <option value="Gold">Gold</option>
        <option value="LightBlue">LightBlue</option>
        <option value="PeachPuff">Peach Puff</option>
        <option value="SeaGreen">SeaGreen</option>
    </select>
    <br>
    <input type="submit" name="submit" value="Save Preferences">
</form>
</body>
</html>
