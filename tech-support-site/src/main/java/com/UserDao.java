package com;

import java.util.HashMap;
import java.util.Map;

public class UserDao {
    // Храним пользователей в статической карте
    private static Map<String, User> users = new HashMap<>();

    static {
        users.put("admin", new User("Константин Павлович", "admin123", "ADMIN"));
        users.put("user", new User("Пользователь", "user123", "USER")); 
        users.put("Myuser", new User("My User", "user123", "USER")); 
        users.put("wert", new User("Wert", "q1w2e3r4", "USER")); 
    }

    public static User findByLogin(String login) {
        return users.get(login);
    }
}
