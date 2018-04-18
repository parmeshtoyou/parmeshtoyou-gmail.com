package com.mindtree.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mindtree.model.User;

public class UserDAO {

	public static int save(User user) {

		int status = 0;

		try {
			Connection con = SinlgetonConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into employee values(?,?,?,?,?)");
			ps.setString(1, user.getFirstName());
			ps.setString(2, user.getLastName());
			ps.setString(3, user.getState());
			ps.setString(4, user.getCity());
			ps.setString(5, user.getEmail());

			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int update(User user) {
		int status = 0;

		try {
			Connection con = SinlgetonConnection.getCon();

			PreparedStatement ps = con.prepareStatement(
					"update employee set firstName=?,lastName=?,state=?,city=?,email=? where email=?");

			ps.setString(1, user.getFirstName());
			ps.setString(2, user.getLastName());
			ps.setString(3, user.getState());
			ps.setString(4, user.getCity());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getEmail());
			status = ps.executeUpdate();

			System.out.println("status:" + status);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public static int delete(String emailId) {
		int status = 0;

		try {

			Connection con = SinlgetonConnection.getCon();
			PreparedStatement ps = con.prepareStatement("delete from employee where email=?");
			ps.setString(1, emailId);
			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public static List<User> findAll() {
		List<User> list = new ArrayList<>();

		try {
			Connection con = SinlgetonConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from employee");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setFirstName(rs.getString(1));
				user.setLastName(rs.getString(2));
				user.setState(rs.getString(3));
				user.setCity(rs.getString(4));
				user.setEmail(rs.getString(5));

				list.add(user);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static User getRecordById(String emailId) {
		User user = null;

		try {
			Connection con = SinlgetonConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from employee where email=?");
			ps.setString(1, emailId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new User();
				user.setFirstName(rs.getString(1));
				user.setLastName(rs.getString(2));
				user.setState(rs.getString(3));
				user.setCity(rs.getString(4));
				user.setEmail(rs.getString(5));

				System.out.println(user);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
}
