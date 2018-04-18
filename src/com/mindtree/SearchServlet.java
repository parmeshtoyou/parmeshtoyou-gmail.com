package com.mindtree;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mindtree.dao.UserDAO;
import com.mindtree.model.User;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("sFirstName");
		String lastName = request.getParameter("sLastName");
		String email = request.getParameter("sEmail");
		
		List<User> usersList = UserDAO.searchUser(firstName, lastName, email); 
		request.setAttribute("users", usersList);
		request.getRequestDispatcher("search.jsp").forward(request, response);
	}

}
