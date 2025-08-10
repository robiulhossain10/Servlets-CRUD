<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Balance</title>
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
            color: #d63031;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }

        input[type="number"],
        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s;
            background-color: white;
            color: #2d3436;
        }

        input[type="number"]:focus,
        input[type="text"]:focus {
            border-color: #d63031;
            outline: none;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #d63031;
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
            background-color: #ff7675;
        }

        .back-button {
            display: block;
            text-align: center;
            text-decoration: none;
            margin-top: 10px;
            background-color: #636e72;
            color: white;
            padding: 10px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #b2bec3;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Update Customer Balance</h2>

        <% if (request.getAttribute("message") != null) { %>
            <div class="message success"><%= request.getAttribute("message") %></div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <div class="message error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="updateCustomer" method="post">
            <label>Customer ID:</label>
            <input type="number" name="id" required />

            <label>Customer Name:</label>
            <input type="text" name="name" required />

            <label>Customer Email:</label>
            <input type="text" name="email" required />

            <label>New Balance:</label>
            <input type="number" name="balance" step="0.01" required />

            <input type="submit" value="Update Balance" />
        </form>

        <a href="index.html" class="back-button">← Back to Home</a>
    </div>
</body>
</html>
