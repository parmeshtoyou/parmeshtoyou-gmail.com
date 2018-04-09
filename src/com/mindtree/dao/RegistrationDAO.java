package com.mindtree.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;

import com.mindtree.model.AdminModel;

public class RegistrationDAO {
	//insert admin(firstName, lastName, email, password, confirmPassword) value("Parmesh", "Mahore", "param@gmail.com", "Test@123", "Test@123");
	
	private String url = "jdbc:mysql://localhost:3306/param";
	private String dbUserName = "root";
	private String dbPassword = "Test@123";
	
	public boolean registerUser(AdminModel model) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, dbUserName, dbPassword);
			Statement stmt = conn.createStatement();
			
			String sql = "INSERT INTO ADMIN(firstName, lastName, email, password, confirmPassword) " +
	                   "VALUES ('" +model.getFirstName() +"', '" 
	                   			+ model.getLastName() +"', '" +model.getEmailId() +"', '" +model.getPassword() +"', '" +model.getConfirmPassword() +"')";
			
			System.out.println(sql);
	        int count = stmt.executeUpdate(sql);
		
			//private String insertQuery = "insert admin(firstName, lastName, email, password, confirmPassword) values(?, ?, ?, ?, ?)";
			
			//int count = preparedStatement.executeUpdate(insertQuery);
			System.out.println("UPDATED ROWS:"+count);
			if(count > 0) {
				return true;
			} else {
				return false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
