<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Вход</title>
    <!-- Подключаем Bootstrap (CSS) с CDN -->
    <link 
      rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    >
</head>
<body class="bg-light">
<div class="container">
    <h1 class="mt-5">Вход в систему</h1>
    <form class="mt-4" action="login" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Логин</label>
            <input 
                type="text" 
                class="form-control" 
                id="username" 
                name="username" 
                placeholder="Введите логин"
            >
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Пароль</label>
            <input 
                type="password" 
                class="form-control" 
                id="password" 
                name="password" 
                placeholder="Введите пароль"
            >
        </div>
        <button type="submit" class="btn btn-primary">Войти</button>
    </form>

    <!-- Вывод ошибки, если она есть -->
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="alert alert-danger mt-3"><%= error %></div>
    <%
        }
    %>
</div>
</body>
</html>
