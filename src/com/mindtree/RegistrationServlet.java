package com.mindtree;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mindtree.dao.RegistrationDAO;
import com.mindtree.model.AdminModel;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("do post called");
		AdminModel model = new AdminModel();
		model.setFirstName(request.getParameter("fName"));
		model.setLastName(request.getParameter("lName"));
		model.setEmailId(request.getParameter("email"));
		model.setPassword(request.getParameter("password"));
		model.setConfirmPassword(request.getParameter("cPassword"));
		
		boolean isRegistered = new RegistrationDAO().registerUser(model);
		if(isRegistered) {
			request.getRequestDispatcher("login_page.jsp").forward(request, response);
		}
	}

}
