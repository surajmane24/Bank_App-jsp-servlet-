<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Page</title>
<!-- Include your CSS and Bootstrap links here -->
<!-- Make sure to include the same CSS as in your original JSP -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>
<style>
/* Dark mode styles go here */
body {
	background-color: #171717;
	color: #fff;
	font-family: Arial, sans-serif;
}

.user-container {
	background-color: #333;
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 1000px;
	margin-top: 10px;
	margin: 0 auto;
}

h1 {
	color: #00bcd4;
}

.user-list {
	list-style: none;
	padding: 0;
	text-align: left;
}

.user-list-item {
	margin: 10px 0;
}

.action-buttons {
	text-align: center;
	margin-top: 20px;
}

.btn {
	margin: 0 10px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.details-container {
	background-color: #2c2c2c;
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 600px;
	margin-top: 10px;
	margin: 0 auto;
}
</style>
</head>
<body>
<%
		String user = null;
		if(session.getAttribute("username") == null){
			response.sendRedirect("login.jsp");
		}
		else {
			user = (String) session.getAttribute("username");
		}

	%>


	<div class="user-container mt-4">

		<h4>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-bank mx-2 mb-1" viewBox="0 0 16 16">
			<path
				d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.501.501 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89L8 0ZM3.777 3h8.447L8 1 3.777 3ZM2 6v7h1V6H2Zm2 0v7h2.5V6H4Zm3.5 0v7h1V6h-1Zm2 0v7H12V6H9.5ZM13 6v7h1V6h-1Zm2-1V4H1v1h14Zm-.39 9H1.39l-.25 1h13.72l-.25-1Z" />
			</svg>
			NOS BANK
		</h4>
		<hr>
		<div class="header mx-2">
			<h1>
				Welcome,
				<%=user%></h1>

			<a href="LogoutController" class="btn btn-danger"><svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-reply-fill mx-1 mb-1"
					viewBox="0 0 16 16"> <path
					d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z" />
				</svg>Logout</a>

		</div>
		<hr>

		<div class="details-container" >
        <ul class="user-list">
            <hr>
            <h3>Here are your details,</h3>
            <hr>
            	<c:forEach var="user" items="${userData}">
	                <li class="user-list-item">User ID:  ${user.id}</li>
	                <li class="user-list-item">UserName: ${user.username}</li>
	                <li class="user-list-item">First Name: ${user.firstName}</li>
	                <li class="user-list-item">Last Name: ${user.lastName}</li>
	                <li class="user-list-item">Balance: ${user.balance}</li>
                </c:forEach>
            <hr>
        </ul>
    </div>
		<hr>
		<div class="action-buttons">
		<c:forEach var="user" items="${userData}">
			<c:url var="makeTransaction" value="UserController">
				<c:param name="action" value="makeTransaction" />
				<c:param name="id" value="${user.id}" />
				<c:param name="username" value="${user.username}" />								
				<c:param name="balance" value="${user.balance}" />
			</c:url>
			<a href="${makeTransaction}" class="btn btn-primary">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-currency-rupee mx-1 mb-1"
					viewBox="0 0 16 16"> <path
					d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4v1.06Z" />
				</svg>
				Make transaction
			</a>
			<c:url var="passbook" value="UserController">
				<c:param name="action" value="passbook" />
				<c:param name="id" value="${user.id}" />
				<c:param name="username" value="${user.username}" />								
				<c:param name="firstName" value="${user.firstName}" />
				<c:param name="lastName" value="${user.lastName}" />
				<c:param name="balance" value="${user.balance}" />
			</c:url>
			<a href="${passbook}" class="btn btn-success">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-card-list mb-1 mx-2"
					viewBox="0 0 16 16"> <path
					d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
				<path
					d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
				</svg>
				View Passbook
			</a>
			<c:url var="updateuser" value="UserController">
				<c:param name="action" value="load_update" />
				<c:param name="id" value="${user.id}" />
			</c:url>
			<a href="${updateuser}" class="btn btn-warning">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-pencil-square mx-2 mb-1"
					viewBox="0 0 16 16"> <path
					d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
				<path fill-rule="evenodd"
					d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
				</svg>
				Update details
			</a>
		</c:forEach>
		</div>
		<hr>
	</div>
</body>
</html>
