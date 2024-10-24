<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f4f4f4;
        }
        .error-container {
            text-align: center;
            background-color: #fff;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 80%;
        }
        h1 {
            color: #d32f2f;
            margin-bottom: 1rem;
        }
        h2 {
            color: #333;
            font-size: 1.2rem;
            font-weight: normal;
        }
        .back-link {
            display: inline-block;
            margin-top: 1rem;
            padding: 0.5rem 1rem;
            background-color: #2196f3;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .back-link:hover {
            background-color: #1976d2;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Error</h1>
        <h2><%=exception.getMessage()%></h2>
        <a href="javascript:history.back()" class="back-link">Go Back</a>
    </div>
</body>
</html>