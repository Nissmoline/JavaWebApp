<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Просмотр заявки</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .ticket-container {
            max-width: 800px;
            margin: 0 auto;
        }
        .ticket-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .ticket-subject {
            font-size: 24px;
            font-weight: bold;
        }
        .ticket-status {
            padding: 5px 10px;
            border-radius: 3px;
            font-size: 0.9em;
        }
        .status-open {
            background-color: #e6f7ff;
            color: #1890ff;
        }
        .status-closed {
            background-color: #f6ffed;
            color: #52c41a;
        }
        .ticket-description {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .messages-container {
            margin-top: 30px;
        }
        .message {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 15px;
        }
        .message-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            color: #666;
            font-size: 0.9em;
        }
        .reply-form {
            margin-top: 30px;
        }
        textarea {
            width: 100%;
            height: 100px;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        button {
            padding: 10px 15px;
            background-color: #1890ff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #1890ff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="ticket-container">
        <a href="Support" class="back-link">← Вернуться к списку заявок</a>
        
        <div class="ticket-header">
            <h1 class="ticket-subject">${ticket.subject}</h1>
            <span class="ticket-status status-${ticket.status.toLowerCase()}">${ticket.status}</span>
        </div>
        
        <div class="ticket-description">
            <p>${ticket.description}</p>
        </div>
        
        <div class="messages-container">
            <h2>Переписка</h2>
            
            <c:if test="${empty ticket.messages}">
                <p>Пока нет сообщений в этой заявке.</p>
            </c:if>
            
            <c:forEach var="message" items="${ticket.messages}">
                <div class="message">
                    <div class="message-header">
                        <span>От: ${message.sender}</span>
                        <span>Время: ${message.timestamp}</span>
                    </div>
                    <div class="message-content">
                        <p>${message.content}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div class="reply-form">
            <h3>Добавить ответ</h3>
            <form action="Support" method="post">
                <input type="hidden" name="action" value="reply">
                <input type="hidden" name="id" value="${ticket.id}">
                
                <textarea name="message" required placeholder="Введите ваше сообщение"></textarea>
                
                <button type="submit">Отправить ответ</button>
            </form>
        </div>
    </div>
</body>
</html>