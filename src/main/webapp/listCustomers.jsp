<%@ page import="java.util.List" %>
<%@ page import="com.methods.bank.servletsjsp.resources.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f6fa;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #2d3436;
            margin-bottom: 30px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: red;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .back-button {
            display: block;
            justify-content: center;
            align-content: center;
            align-items: center;
            text-align: center;
            margin: 30px auto;
            padding: 10px 20px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            font-size: 16px;
        }

        .back-button:hover {
            background-color: #7C3AED;
        }
    </style>
</head>
<body>
    <h2>Customer List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Balance</th>
        </tr>

        <%
            List<Customer> customers = (List<Customer>) request.getAttribute("customers");
            if (customers != null && !customers.isEmpty()) {
                for (Customer c : customers) {
        %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getEmail() %></td>
            <td>$<%= String.format("%.2f", c.getBalance()) %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No customers found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <a href="index.html" class="back-button">← Back to Home</a>
</body>
</html>
