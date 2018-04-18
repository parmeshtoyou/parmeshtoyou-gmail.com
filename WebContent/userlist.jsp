<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.mindtree.dao.UserDAO"%>
<%@page import="com.mindtree.model.*"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	List<User> userList = UserDAO.findAll();
	request.setAttribute("userList", userList);
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserList</title>

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>


</head>
<body>

	<!-- Trigger/Open The Modal -->
	<form action="addUser"></form>
	<button id="myBtn">Add User</button>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<form action="AddUserServlet" method="post">

			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<center>
					<table>
						<tr>
							<td align="right">First Name:</td>
							<td><input type="text" name="firstName" /></td>
						</tr>
						<tr>
							<td align="right">Last Name:</td>
							<td><input type="text" name="lastName" /></td>
						</tr>
						<tr>
							<td align="right">State:</td>
							<td><input type="text" name="state" /></td>
						</tr>
						<tr>
							<td align="right">City:</td>
							<td><input type="text" name="city" /></td>
						</tr>
						<tr>
							<td align="right">Email:</td>
							<td><input type="text" name="email" /></td>
						</tr>
					</table>
				</center>
				<br />
				<center>
					<button type="submit">Save</button>
				</center>
			</div>
		</form>

	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/param" user="root"
		password="Test@123" />
	<sql:query var="rs" dataSource="${db}">select * from employee</sql:query>
	<br />
	<br /> User Search
	<br />
	<br />
	<table>
		<tr>
			<td align="right">First Name:*</td>
			<td><input type="text" name="sFirstName" /></td>
		</tr>
		<tr>
			<td align="right">Last Name:*</td>
			<td><input type="text" name="sLastName" /></td>
		</tr>
		<tr>
			<td align="right">Email:*</td>
			<td><input type="text" name="sEmail"></td>
		</tr>
	</table>

	<br />
	<br />

	<table>
	</table>
	<table border="1">
		<!-- here should go some titles... -->
		<tr bgcolor="gray">
			<th>First Name</th>
			<th>Last Name</th>
			<th>State</th>
			<th>City</th>
			<th>Email</th>
			<th>Edit</th>
			<th>Remove</th>
		</tr>

		<core:forEach items="${userList}" var="list">
			<tr>
				<td><core:out value="${list.getFirstName()}" /></td>
				<td><core:out value="${list.getLastName()}" /></td>
				<td><core:out value="${list.getState()}" /></td>
				<td><core:out value="${list.getCity()}" /></td>
				<td><core:out value="${list.getEmail()}" />
				<td><a href="updateuser.jsp?emailId=${list.getEmail()}">Update</a></td>
				<td><a href="deleteuser.jsp?emailId=${list.getEmail()}">Delete</a></td>
			</tr>
		</core:forEach>

	</table>
</body>
</html>