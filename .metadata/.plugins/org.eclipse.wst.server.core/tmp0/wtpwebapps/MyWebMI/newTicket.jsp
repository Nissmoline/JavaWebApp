<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Создание новой заявки</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        textarea {
            height: 150px;
        }
        .button-group {
            margin-top: 20px;
        }
        button {
            padding: 10px 15px;
            background-color: #1890ff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        .cancel-btn {
            background-color: #f5f5f5;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Создание новой заявки</h1>
        
        <form action="Support" method="post">
            <input type="hidden" name="action" value="create">
            
            <div class="form-group">
                <label for="subject">Тема:</label>
                <input type="text" id="subject" name="subject" required>
            </div>
            
            <div class="form-group">
                <label for="description">Описание проблемы:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            
            <div class="button-group">
                <button type="submit">Отправить</button>
                <button type="button" class="cancel-btn" onclick="location.href='Support'">Отмена</button>
            </div>
        </form>
    </div>
</body>
</html>