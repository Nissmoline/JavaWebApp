<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Page</title>
</head>
<body>
    <h1>Welcome, ${name != null ? name : "Guest"}</h1>
    <p><a href="Support">Go to Support Dashboard</a></p>
</body>
</html>