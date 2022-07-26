package com.pluralsight;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Statement;

public class BookDAO {

	private String jdbcURL = "jdbc:mysql://localhost:3306/book_store";
	private String jdbUserName = "root";
	private String jdbcPassword = "265681";
	private Connection jdbcConnection;
	
	public void connect() {
		try {
			if(jdbcConnection == null || jdbcConnection.isClosed()) {
				Class.forName("com.mysql.jdbc.Driver");
				jdbcConnection = DriverManager.getConnection(
						jdbcURL, jdbUserName, jdbcPassword);
				
				System.out.println("MySQL Connection Estabilished");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro in Connection");
		}
	}
	
	public void disconnect() {
		try {
			if(jdbcConnection != null && !jdbcConnection.isClosed()) {
				jdbcConnection.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Book> listAllBooks() {
		connect();
		ArrayList<Book> listBook = new ArrayList<>();
		
		try {
			java.sql.Statement statemant = jdbcConnection.createStatement();
			ResultSet resultSet = statemant.executeQuery("SELECT * FROM book");
			while (resultSet.next()) {
				String title = resultSet.getString("title");
				String author = resultSet.getString("author");
				float price = resultSet.getFloat("price");
				
				Book book = new Book(title, author, price);
				listBook.add(book);
			}
			resultSet.close();
			statemant.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		return listBook;
	}
	
	public boolean insertBook(Book book) {
		connect();
		String sql = "INSERT INTO book (title, author, price) VALUES (?, ?, ?)";
		
		boolean rowInserted = false;
		try {
			PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			statement.setString(1, book.getTitle());
			statement.setString(2, book.getAuthor());
			statement.setFloat(3, book.getPrice());
			
			rowInserted = statement.executeUpdate() > 0;
			statement.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
		return rowInserted;
	}

}
