package com.mindtree.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class SinlgetonConnection {

	private static Connection con = null;

	public static Connection getCon() {
		return con;
	}

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/param", "root", "Test@123");
			System.out.println(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
