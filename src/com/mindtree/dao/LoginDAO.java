package com.mindtree.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
	
	private String url = "jdbc:mysql://localhost:3306/param";
	private String dbUserName = "root";
	private String dbPassword = "Test@123";
	
	
	public boolean check(String userName, String password) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, dbUserName, dbPassword);
			
			String sql = "SELECT * FROM ADMIN WHERE email='" +userName +"' and password='"+password +"'";
			System.out.println(sql);
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet resultSet = stmt.executeQuery();
			if(resultSet.next()) {
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
