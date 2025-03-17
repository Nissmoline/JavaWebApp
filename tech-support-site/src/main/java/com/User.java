package com;

public class User {
    private String login;
    private String password;
    private String role;  // "ADMIN" или "USER"

    public User(String login, String password, String role) {
        this.login = login;
        this.password = password;
        this.role = role;
    }

    // Getters / Setters
    public String getLogin() {
        return login;
    }
    public String getPassword() {
        return password;
    }
    public String getRole() {
        return role;
    }
}
