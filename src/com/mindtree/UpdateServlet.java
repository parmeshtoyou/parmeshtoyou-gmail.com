package com.mindtree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mindtree.dao.UserDAO;
import com.mindtree.model.User;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setState(request.getParameter("state"));
		user.setCity(request.getParameter("city"));
		user.setEmail(request.getParameter("email"));
		
		System.out.println(user.toString());
		
		int status = UserDAO.update(user);
		if (status == 0) {
			System.out.println("Could not update user");
		} else {
			System.out.println("User updated successfully");
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setState(request.getParameter("state"));
		user.setCity(request.getParameter("city"));
		user.setEmail(request.getParameter("email"));
		
		System.out.println(user.toString());
		
		int status = UserDAO.update(user);
		if (status == 0) {
			System.out.println("Could not update user");
		} else {
			System.out.println("User updated successfully");
		}
	}

}
