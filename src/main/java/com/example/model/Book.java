//JavaBean

package com.example.model;

public class Book {
	
	private int id;
    private String title;
    private String author;
    private double price;

    // Constructors
    public Book() {}

    public Book(String title, String author, double price) {
        this.title = title;
        this.author = author;
        this.price = price;
    }

    public Book(int id, String title, String author, double price) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.price = price;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}

/*


create database bookstore;

show databases;

use bookstore;

CREATE TABLE books(
                   id INT AUTO_INCREMENT PRIMARY KEY,
                   title VARCHAR(100) NOT NULL,
                   author VARCHAR(100) NOT NULL,
				   price DECIMAL(10, 2) NOT NULL
                   );
                   
select * from books;

drop table books;


 */
