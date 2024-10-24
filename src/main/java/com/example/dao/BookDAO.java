package com.example.dao;

import com.example.model.Book;
import com.example.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
	
	// Create
    public void addBook(Book book) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO books (title, author, price) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setDouble(3, book.getPrice());
            pstmt.executeUpdate();
        }
    }

    // Read
    public List<Book> getBooksByPage(int pageNumber, int pageSize) throws SQLException, ClassNotFoundException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books LIMIT ?, ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            int start = (pageNumber - 1) * pageSize;
            pstmt.setInt(1, start);
            pstmt.setInt(2, pageSize);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    books.add(new Book(rs.getInt("id"), rs.getString("title"), rs.getString("author"), rs.getDouble("price")));
                }
            }
        }
        return books;
    }


    public int getTotalBooksCount() throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM books";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    
    
    public Book getBookById(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM books WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Book(rs.getInt("id"), rs.getString("title"), rs.getString("author"), rs.getDouble("price"));
                }
            }
        }
        return null;
    }

    // Update
    public void updateBook(Book book) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE books SET title = ?, author = ?, price = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setDouble(3, book.getPrice());
            pstmt.setInt(4, book.getId());
            pstmt.executeUpdate();
        }
    }

    // Delete
    public void deleteBook(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM books WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

}
