<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

.admin-container {
	background-color: #333;
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #00bcd4;
}

label, input, select {
	display: block;
	margin: 10px 0;
}

select, input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #2c2c2c;
	color: #fff;
}

input[type="submit"] {
	background-color:#2c2c2c;
	color: #fff;
	padding: 8px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.admin-container {
	max-width: 1200px;
	margin: 0 auto;
	text-align: left;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.search-form {
	display: flex;
	align-items: center;
	
}

.search-input {
	width: 300px;
	flex: 1;
	background-color: #e6e0e0 !important;
    color: #171717!important;
	
} 

.search-select {
	width: 250px;
	background-color:  #e6e0e0!important;
	color : #333;
}

.btn-success {
	margin-left: 10px;
}

table {
	width: 100%;
	border-spacing: 10 30px; /* Increase spacing between rows */
	background-color: #2a2a2a !important;
	color: #ffffff !important;
	border-radius: 20px !important;
}

  .toggle-switch {
    display: none;
  }
  
  .toggle-label {
    cursor: pointer;
    text-indent: -9999px;
    width: 50px;
    height: 25px;
    background:  #bada55;
    display: block;
    border-radius: 25px;
    position: relative;
  }
  .toggle-switch:checked + .toggle-label {
    background: grey;
  }
  
  .toggle-switch:checked + .toggle-label:after {
    left: calc(100% - 5px);
    transform: translateX(-100%);
  }
  
  .toggle-label:after {
    content: '';
    position: absolute;
    top: 5px;
    left: 5px;
    width: 15px;
    height: 15px;
    background: #fff;
    border-radius: 50%;
    transition: 0.3s;
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
	<div class="admin-container">
	
	<h4><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-bank2 mx-2 mb-2" viewBox="0 0 16 16">
  <path d="M8.277.084a.5.5 0 0 0-.554 0l-7.5 5A.5.5 0 0 0 .5 6h1.875v7H1.5a.5.5 0 0 0 0 1h13a.5.5 0 1 0 0-1h-.875V6H15.5a.5.5 0 0 0 .277-.916l-7.5-5zM12.375 6v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zM8 4a1 1 0 1 1 0-2 1 1 0 0 1 0 2zM.5 15a.5.5 0 0 0 0 1h15a.5.5 0 1 0 0-1H.5z"/>
</svg>NOS BANK</h4>
		<hr>
		<div class="header mx-2">
			<h1> Welcome, <%=user%></h1>
			<a href="LogoutController" class="btn btn-danger" type="submit"
				value="Logout"> <svg xmlns="http://www.w3.org/2000/svg"
					width="16" height="16" fill="currentColor"
					class="bi bi-reply-fill mx-1 mb-1" viewBox="0 0 16 16"> <path
					d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z" />
				</svg>Logout
			</a>
		</div>

		<hr>
		<div class="container">
			<div class="container">
				<a href="createUser.jsp" name="action" value="createUser"
					class="btn btn-primary mx-4"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-fill-add mx-1 mb-1"
						viewBox="0 0 16 16"> <path
						d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
					<path
						d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z" />
					</svg>Create user
				</a>
				<form action="AdminController" method="GET" class="mb-3 search-form">
					<select name="searchBasedOn" id="searchBasedOn"
						class="search-select mx-4">
						<option selected disabled>Choose search parameter</option>
						<option value="id">ID</option>
						<option value="firstName">First Name</option>
						<option value="lastName">Last Name</option>
						<option value="username">Username</option>
					</select> 
					<input type="text" class="search-input" name="searchInput" placeholder="Search value">
					<button type="submit" class="btn btn-success" value="submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search mx-1 mb-1"
							viewBox="0 0 16 16"> <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
						</svg>
						Search
					</button>
				</form>

				<div style="overflow-y: scroll; max-height: 400px;">

					<p>User List</p>

					<table class="table table-bordered" style="color: #fff;">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">FIRST NAME</th>
							<th scope="col">LAST NAME</th>
							<th scope="col">BALANCE</th>
							<th scope="col">ACTIONS</th>
							<th scope="col">USER block/unblock</th>

						</tr>
						<c:forEach var="user" items="${userData}">
							<c:url var="viewlog" value="AdminController">
								<c:param name="action" value="viewlog" />
								<c:param name="id" value="${user.id}" />
								<c:param name="username" value="${user.username}" />
								<c:param name="firstName" value="${user.firstName}" />
								<c:param name="lastName" value="${user.lastName}" />
								<c:param name="balance" value="${user.balance}" />
							</c:url>
							<c:url var="userStatus" value="AdminController">
								<c:param name="action" value="userStatus" />
								<c:param name="id" value="${user.id}" />
							</c:url>
							<tr>
								<td>${user.id}</td>
								<td>${user.firstName}</td>
								<td>${user.lastName}</td>
								<td>${user.balance}</td>
								<td>
								<a href="${viewlog}" class="btn btn-primary mx-2">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-eye-fill mx-1 mb-1"
											viewBox="0 0 16 16"> <path
											d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" /> <path
											d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
										</svg>View log
								</a> 
								</td>
								<td>
								<form action="AdminController" method="GET" class="mb-3 search-form">
									<input type="checkbox" class="toggle-switch" name="userStatusToggle" value="deactivate"  id="toggle-${user.id}">						        	
						        	<label class="toggle-label" for="toggle-${user.id}"></label>
						        	<input type="hidden" name="id" value="${user.id}">
									<button type="submit" class="btn btn-success" name="action" value="userStatus">							
										conform
									</button>
								</form>
							    
							    </td>
							</tr>
						</c:forEach>

					</table>

				</div>
			</div>
		</div>
	</div>


</body>
</html>