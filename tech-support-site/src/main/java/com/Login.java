package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Считываем логин и пароль из формы
        String login = request.getParameter("username");
        String password = request.getParameter("password");

        // 2. Проверяем, что поля не пустые
        if (login == null || login.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Заполните все поля!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // 3. Ищем пользователя в DAO
        User user = UserDao.findByLogin(login);
        if (user == null) {
            // Нет такого логина
            request.setAttribute("error", "Пользователь не найден");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // 4. Проверяем пароль
        if (!user.getPassword().equals(password)) {
            // Пароль не соответствует
            request.setAttribute("error", "Неверный пароль");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // 5. Если всё ок — сохраняем пользователя в сессии
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        // 6. Перенаправляем в зависимости от роли
        if ("ADMIN".equals(user.getRole())) {
            response.sendRedirect("admin.jsp");
        } else {
            response.sendRedirect("user.jsp");
        }
    }
}
