<%@page import="com.mindtree.dao.UserDAO" %>
<jsp:useBean id="user" class="com.mindtree.model.User"></jsp:useBean>
<jsp:setProperty property="*" name="user" />

<%
	int i = UserDAO.delete(request.getParameter("emailId"));
	response.sendRedirect("userlist.jsp");
%>