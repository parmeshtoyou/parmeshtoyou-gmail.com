<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register Page</title>
</head>
<body>
	<form method="post" action="RegistrationServlet">
		<table>
			<tr><td align="right">First Name:</td><td><input type="text" name="fName"></td></tr>
			<tr><td align="right">Last Name:</td><td><input type="text" name="lName"></td></tr>
			<tr><td align="right">Email:</td><td><input type="text" name="email"></td></tr>
			<tr><td align="right">Password:</td><td><input type="password" name="password"></td></tr>
			<tr><td align="right">Confirm Password:</td><td><input type="password" name="cPassword"></td></tr>
		</table>	
		<center><input type="submit" value="Register"></center>
	</form>

</body>
</html>