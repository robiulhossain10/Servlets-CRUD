<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Operation Status</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f6fa;
            padding: 50px;
            text-align: center;
        }

        .message-box {
            background: white;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #2d3436;
            margin-bottom: 20px;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            background-color: #636e72;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #b2bec3;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h2>${message}</h2>
        <a href="index.html" class="back-button">← Back to Home</a>
    </div>
</body>
</html>
