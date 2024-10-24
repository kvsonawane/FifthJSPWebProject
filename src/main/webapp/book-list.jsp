<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
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
        .book-list {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        caption {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .action-links a {
            text-decoration: none;
            padding: 5px 10px;
            background-color: #28a745;
            color: white;
            border-radius: 3px;
            margin-right: 5px;
        }
        .action-links a:hover {
            background-color: #218838;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            padding: 0;
            list-style: none;
        }
        
        .pagination a {
            color: #007bff; 
            text-decoration: none;
            padding: 10px 15px;
            border: 1px solid #ddd;
            margin: 0 5px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        
        .pagination a:hover {
            background-color: #f1f1f1; 
            color: #007bff; 
        }
        
        .pagination a.active {
            background-color: #007bff; 
            color: white; 
            border-color: #007bff; 
        }
        
        .pagination a:focus,
        .pagination a:active {
            outline: none;
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25); 
         }
         
         .pagination a.disabled {
             color: #ccc; /* Disabled text color */
             pointer-events: none;
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
    <div class="book-list">
        <table>
            <caption>
            <h2>List of Books</h2>
            </caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Book> listBook = (List<Book>) request.getAttribute("listBook");
                if (listBook != null && !listBook.isEmpty()) {
                    for (Book book : listBook) {
                %>
                    <tr>
                        <td><%= book.getId() %></td>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td><%= book.getPrice() %></td>
                        <td class="action-links">
                            <a href="edit?id=<%= book.getId() %>">Edit</a>
                            <a href="delete?id=<%= book.getId() %>">Delete</a>                     
                        </td>
                    </tr>
                <%
                    }
                } else {
                %>
                    <tr>
                        <td colspan="5">No books available</td>
                    </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <div class="pagination">
    <%
        int currentPage = (Integer) request.getAttribute("currentPage");
        int totalPages = (Integer) request.getAttribute("totalPages");
    %>
    
    <% if (currentPage > 1) { %>
        <a href="list?page=<%= currentPage - 1 %>">&laquo; Previous</a>
    <% } %>
    
    <% for (int i = 1; i <= totalPages; i++) { %>
        <a href="list?page=<%= i %>" 
           class="<%= (i == currentPage) ? "active" : "" %>">
           <%= i %>
        </a>
    <% } %>
    
    <% if (currentPage < totalPages) { %>
        <a href="list?page=<%= currentPage + 1 %>">Next &raquo;</a>
    <% } %>
</div>
    </div>   
</body>
</html>