<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update User</title>


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
body {
	background-color: #171717;
	color: #fff;
	font-family: Arial, sans-serif;
}

.updateuser-container {
	background-color: #333;
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 900px;
	margin-top: 10px;
	margin: 0 auto;
}

h1 {
	color: #00bcd4;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	color: #fff;
}

.form-control {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #2c2c2c;
	color: #fff;
	width: 800px;
}

.form-actions {
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
</style>
</head>
<body>
	<div class="updateuser-container mt-4">
		<h4>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-bank mx-2 mb-1" viewBox="0 0 16 16">
			<path
				d="M8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.501.501 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89L8 0ZM3.777 3h8.447L8 1 3.777 3ZM2 6v7h1V6H2Zm2 0v7h2.5V6H4Zm3.5 0v7h1V6h-1Zm2 0v7H12V6H9.5ZM13 6v7h1V6h-1Zm2-1V4H1v1h14Zm-.39 9H1.39l-.25 1h13.72l-.25-1Z">
			</path> </svg>
			NOS BANK
		</h4>
		<hr>
		<div class="header mx-2">
			<h1>Update User Details</h1>
			<a href="login.jsp" class="btn btn-danger"> <svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-reply-fill mx-1 mb-1"
					viewBox="0 0 16 16"> <path
					d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"></path>
				</svg>Logout
			</a>
		</div>
		<hr>
		<form action="UserController" method="get">
			<div class="form-group">
				<label for="password">Password</label> 
				<input type="text" class="form-control" id="password" name="password" value="${theUser.password}" required>
			</div>
			<div class="form-group">
				<label for="firstName">First Name</label> 
				<input type="text" class="form-control" id="firstName" name="firstName" value="${theUser.firstName}" required>
			</div>
			<div class="form-group">
				<label for="lastName">Last Name</label> 
				<input type="text" class="form-control" id="lastName" name="lastName" value="${theUser.lastName}" required>
			</div>
			<div>
				<input  type="hidden" name="action" value="updateUser">
			</div>
			<div>
				<input  type="hidden" name="id" value="${theUser.id}">
			</div>
  		<div>
			<div class="form-actions">
			
  				<button type="submit" class="btn btn-primary my-2" value="Submit">
  					<svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-check2-square mx-1 mb-1"
						viewBox="0 0 16 16"> <path
						d="M3 14.5A1.5 1.5 0 0 1 1.5 13V3A1.5 1.5 0 0 1 3 1.5h8a.5.5 0 0 1 0 1H3a.5.5 0 0 0-.5.5v10a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V8a.5.5 0 0 1 1 0v5a1.5 1.5 0 0 1-1.5 1.5H3z" />
					<path
						d="m8.354 10.354 7-7a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z" />
					</svg>Update Details
  				</button>
			
				<a href="UserController" class="btn btn-secondary">
					<svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-house-door-fill mx-1 mb-1"
						viewBox="0 0 16 16"> <path
						d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5Z" />
					</svg>Home
				</a>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>
