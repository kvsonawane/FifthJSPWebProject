<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books Store Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }
        .nav a {
            text-decoration: none;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .nav a:hover {
            background-color: #0056b3;
        }
        .form-container {
            width: 100%;
            max-width: 500px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            text-align: right;
            background-color: #f2f2f2;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        caption {
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>Books Management</h1>
        <nav class="nav">
            <a href="new">Add New Book</a>
            <a href="list">List All Books</a>
        </nav>
    </header>
    <div class="form-container">
        <%
        Book book = (Book) request.getAttribute("book");
        String action = (book != null) ? "update" : "insert";
        String formTitle = (book != null) ? "Edit Book" : "Add New Book";
        %>
        <form action="<%= action %>" method="post">
            <table>
                <caption>
                    <h2><%= formTitle %></h2>
                </caption>
                <% if (book != null) { %>
                    <input type="hidden" name="id" value="<%= book.getId() %>" />
                <% } %>
                <tr>
                    <th>Title: </th>
                    <td>
                        <input type="text" name="title" required
                            value="<%= (book != null) ? book.getTitle() : "" %>"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Author: </th>
                    <td>
                        <input type="text" name="author" required
                            value="<%= (book != null) ? book.getAuthor() : "" %>"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Price: </th>
                    <td>
                        <input type="number" name="price" step="0.01" min="0" required
                            value="<%= (book != null) ? book.getPrice() : "" %>"
                        />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save" />
                    </td>
                </tr>
            </table>
        </form>
    </div>   
</body>
</html>