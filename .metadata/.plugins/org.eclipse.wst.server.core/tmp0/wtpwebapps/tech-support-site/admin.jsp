<%@ page import="com.User" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Админ-панель</title>
    <!-- Bootstrap -->
    <link 
      rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    >
</head>
<body class="bg-light">
<div class="container mt-5">

    <%
        // Достаём пользователя из session (это уже встроенный объект JSP)
        User user = (User) session.getAttribute("user");
        // Проверяем, что пользователь существует и у него роль ADMIN
        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <h1>Администратор</h1>
    <p>Добро пожаловать, <%= user.getLogin() %>! (роль: <%= user.getRole() %>)</p>

    <!-- Пример: тут может быть вывод таблицы заявок, управление пользователями и т.п. -->
    <p>Тут логика админского кабинета...</p>

    <form action="logout" method="post" class="mt-3">
        <button type="submit" class="btn btn-secondary">Выйти</button>
    </form>
</div>
</body>
</html>
