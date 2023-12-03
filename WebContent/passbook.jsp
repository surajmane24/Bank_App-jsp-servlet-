<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passbook</title>

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

.passbook-container {
	background-color: #333;
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 1000px;
	margin: 0 auto;
	margin-top: 10px;
}

h1 {
	color: #00bcd4;
}

passbook-details {
	padding: 0;
	text-align: left;
}

transactions-table {
	background-color: #2c2c2c;
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 1000px;
	margin: 0 auto;
	margin-top: 20px;
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

table.table-bordered>thead>tr>th {
	border: 1px solid #fff;
}

table.table-bordered {
	border-collapse: collapse;
}

table.table-bordered td, table.table-bordered th {
	border: 1px solid #fff;
}

table.table-bordered th {
	background-color: #2c2c2c;
	color: #fff;
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
	<div class="passbook-container mt-4">
		<h4>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-bank mx-2 mb-1" viewBox="0 0 16 16">
			<path
				d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.501.501 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89L8 0ZM3.777 3h8.447L8 1 3.777 3ZM2 6v7h1V6H2Zm2 6v7h2.5V6H4Zm3.5 0v7h1V6h-1Zm2 6v7H12V6H9.5ZM13 6v7h1V6h-1Zm2-1V4H1v1h14Zm-.39 9H1.39l-.25 1h13.72l-.25-1Z" />
			</svg>
			NOS BANK
		</h4>
		<hr>
		<div class="header mx-2">
			<h1>
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"> <path
					d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
				</svg>
				Passbook
			</h1>

			<a href="UserController" class="btn btn-primary"><svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-arrow-left mb-1"
					viewBox="0 0 16 16"> <path fill-rule="evenodd"
					d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
				</svg> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-house-fill mx-1 mb-1"
					viewBox="0 0 16 16"> <path
					d="M7.293 1.293a1 1 0 0 1 1.414 0l6 6a1 1 0 0 1-1.414 1.414L8
						3.414 2.293 9.207a1 1 0 1 1-1.414-1.414l6-6z" />
				<path
					d="m3.5 10.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5V14a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5V10.5z" />
				</svg> Home </a>

		</div>
		<hr>

		<div class="details-container">
			<ul class="user-list">
				<hr>
				<h3>
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
						fill="currentColor" class="bi bi-card-text mx-2 mb-1"
						viewBox="0 0 16 16"> <path
						d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
					<path
						d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z" />
					</svg>
					Your Passbook Details
				</h3>
				<hr>

				<li class="passbook-details-item">User ID: ${id }</li>
				<li class="passbook-details-item">Username: ${username }</li>
				<li class="passbook-details-item">First Name: ${firstName }</li>
				<li class="passbook-details-item">Last Name: ${lastName }</li>
				<li class="passbook-details-item">Balance: ${balance }</li>
				<hr>
			</ul>
		</div>

		<div class="transactions-table">
			<hr>
			<h3>Transaction History</h3>
			<hr>

			<table class="table table-dark table-striped table-bordered">
			
					<tr>
						<th>TRANSACTION ID</th>
						<th>FROM USER ID</th>
						<th>TO USER ID</th>
						<th>TRANSACTION TYPE</th>
						<th>TRANSACTION TIME</th>
						<th>AMOUNT</th>
					</tr>
				
					<c:forEach var="transaction"  items= "${userPassbook}">
					<tr>
						<td>${transaction.id}</td>
						<td>${transaction.from_user}</td>
						<td>${transaction.to_user}</td>
						<td>${transaction.transaction_type}</td>
						<td>${transaction.transaction_time}</td>
						<td>${transaction.amount}</td>
					</tr>
				</c:forEach>

			</table>
			<hr>
		</div>
	</div>
</body>
</html>
