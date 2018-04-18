<%@page import="com.mindtree.dao.UserDAO"%>
<jsp:useBean id="user" class="com.mindtree.model.User"></jsp:useBean>
<jsp:setProperty property="*" name="user" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	user = UserDAO.getRecordById(request.getParameter("emailId"));
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update User</title>
</head>
<body>
	<form action="UpdateServlet" method="post">
		<table border="1">
			<tr>
				<td align="right">First Name:</td>
				<td><input type="text" value=<%=user.getFirstName()%>
					name="firstName"></td>
			</tr>
			<tr>
				<td align="right">Last Name:</td>
				<td><input type="text" value=<%=user.getLastName()%>
					name="lastName"></td>
			</tr>
			<tr>
				<td align="right">State:</td>
				<td><input type="text" value=<%=user.getState()%> name="state"></td>
			</tr>
			<tr>
				<td align="right">City:</td>
				<td><input type="text" value=<%=user.getCity()%> name="city"></td>
			</tr>
			<tr>
				<td align="right">Email:</td>
				<td><input type="text" value=<%=user.getEmail()%> name="email"></td>
			</tr>
			<tr>
				<td><button type="submit">Update</button></td>
			</tr>
		</table>
	</form>
</body>
</html>