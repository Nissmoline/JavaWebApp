<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Техподдержка - Мои заявки</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .ticket {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }
        .ticket-header {
            display: flex;
            justify-content: space-between;
        }
        .ticket-subject {
            font-weight: bold;
        }
        .ticket-status {
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 0.8em;
        }
        .status-open {
            background-color: #e6f7ff;
            color: #1890ff;
        }
        .status-closed {
            background-color: #f6ffed;
            color: #52c41a;
        }
        .new-ticket-btn {
            margin: 20px 0;
            padding: 10px 15px;
            background-color: #1890ff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Мои заявки в техподдержку</h1>
        <div>
            <span>Добро пожаловать, ${username}! | </span>
            <a href="mainpage.jsp">Выйти</a>
        </div>
    </div>
    
    <button class="new-ticket-btn" onclick="location.href='Support?action=new'">Создать новую заявку</button>
    
    <c:choose>
        <c:when test="${empty tickets}">
            <p>У вас пока нет заявок. Создайте новую заявку для обращения в техподдержку.</p>
        </c:when>
        <c:otherwise>
            <c:forEach var="ticket" items="${tickets}">
                <div class="ticket" onclick="location.href='Support?action=view&id=${ticket.id}'">
                    <div class="ticket-header">
                        <span class="ticket-subject">${ticket.subject}</span>
                        <span class="ticket-status status-${ticket.status.toLowerCase()}">${ticket.status}</span>
                    </div>
                    <div class="ticket-description">
                        <p>${ticket.description}</p>
                    </div>
                    <div class="ticket-footer">
                        <small>Создано: ${ticket.createdTime}</small>
                        <small>Сообщений: ${ticket.messages.size()}</small>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</body>
</html>