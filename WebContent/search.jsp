<%@page import="com.mindtree.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>
</head>
<body>
	<h2>Search Result</h2>
	<%
		List<User> users = (List<User>) request.getAttribute("users");
		for (User user : users) {
			out.println("First Name:" + user.getFirstName() +"<br/>");
			out.println("Last Name:" + user.getLastName() +"<br/>");
			out.println("State:" + user.getState() +"<br/>");
			out.println("City:" + user.getCity() +"<br/>");
			out.println("Email:" + user.getEmail() +"<br/>");
			out.println("------------------------------" +"<br/>");
		}
	%>
	
	<a href="userlist.jsp">Go Back</a>

</body>
</html>