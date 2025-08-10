<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f6fa;
            padding: 40px;
        }

        .form-container {
            background: white;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #0984e3;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #0984e3;
            outline: none;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #0984e3;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #74b9ff;
        }

        .back-button {
            display: block;
            text-align: center;
            text-decoration: none;
            margin-top: 15px;
            background-color: #636e72;
            color: white;
            padding: 10px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #b2bec3;
        }

        .message-box {
            background-color: #dff9fb;
            color: #0984e3;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #74b9ff;
            border-radius: 6px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <% String msg = (String) request.getAttribute("message"); %>
        <% if (msg != null) { %>
            <div class="message-box"><%= msg %></div>
        <% } %>

        <form action="addCustomer" method="post">
            <h2>Add Customer</h2>

            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required />

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required />

            <label for="balance">Balance:</label>
            <input type="number" name="balance" id="balance" step="0.01" required />

            <input type="submit" value="Add Customer" />
        </form>

        <a href="index.html" class="back-button">← Back to Home</a>
    </div>
</body>
</html>
