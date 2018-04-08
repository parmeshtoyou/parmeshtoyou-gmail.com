<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

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
	width: 80%;
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
	<button id="myBtn">Add User</button>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			First Name : <input type="text" name="firstName" /> <br/>
			Last Name  : <input type="text" name="lastName" /> <br/>
			State : <input type="text" name="state" /> <br/>
			City : <input type="text" name="city" /> <br/>
			Email : <input type="text" name="email" /> <br/>
			
			<button type="submit">Save</button>
		</div>

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
	<br/>
	<br/>
	User Search
	<br />
	<br /> First Name:*
	<input type="text" name="sFirstName" />
	<br /> Last Name:*
	<input type="text" name="sLastName" />
	<br /> Email:*
	<input type="text" name="sEmail">
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

		<core:forEach items="${rs.rows}" var="user">
			<tr>
				<td><core:out value="${user.firstName}" /></td>
				<td><core:out value="${user.lastName}" /></td>
				<td><core:out value="${user.state}" /></td>
				<td><core:out value="${user.city}" /></td>
				<td><core:out value="${user.email}" />
				<td><input type="button" value="Edit" /></td>
				<td><input type="button" value="Remove" /></td>
			</tr>
		</core:forEach>
	</table>
</body>
</html>