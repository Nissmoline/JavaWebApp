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

        String login = request.getParameter("username");
        String password = request.getParameter("password");

        if (login == null || login.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Заполните все поля!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Looking for a user in DAO
        User user = UserDao.findByLogin(login);
        if (user == null) {
            // There is no such login
            request.setAttribute("error", "Пользователь не найден");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (!user.getPassword().equals(password)) {
            request.setAttribute("error", "Неверный пароль");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // If everything is ok, we save the user in the session
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        // 6. Redirect on role
        if ("ADMIN".equals(user.getRole())) {
            response.sendRedirect("admin.jsp");
        } else {
            response.sendRedirect("user.jsp");
        }
    }
}
