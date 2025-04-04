<%@ page import="com.User" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Пользователь</title>
    <!-- Bootstrap -->
    <link 
      rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    >
</head>
<body class="bg-light">
<div class="container mt-5">

    <%
        // Точно так же берём пользователя из session
        User user = (User) session.getAttribute("user");
        // Если пользователь не залогинен — отправляем на login.jsp
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

     <h1>Техподдержка</h1>
    <p>Здравствуйте, <%= user.getLogin() %>! (роль: <%= user.getRole() %>)</p>

    <!-- Форма для отправки заявки в поддержку -->
    <form action="#" method="post" class="mt-3">
        <div class="mb-3">
            <label for="issue" class="form-label">Опишите проблему:</label>
            <textarea 
                class="form-control" 
                id="issue" 
                name="issue" 
                rows="5" 
                placeholder="Опишите вашу проблему"
            ></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Отправить</button>
    </form>

    <form action="logout" method="post" class="mt-3">
        <button type="submit" class="btn btn-secondary">Выйти</button>
    </form>
</div>
</body>
</html>
