<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make Transaction, </title>

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

.maketransaction-container {
	background-color: #333; border-radius : 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 1000px;
	margin-top: 10px;
	margin: 0 auto;
	border-radius: 20px;
}

h1 {
	color: #00bcd4;
}

h4 {
	color: #fff;
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

.details-container {
	background-color: #2c2c2c; border-radius : 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 900px;
	margin-top: 10px;
	margin: 0 auto;
	height: 350px;
	border-radius: 20px;
}

.transfer-container {
	background-color: #2c2c2c;
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 900px;
	margin-top: 10px;
	margin: 0 auto;
	height: 450px;
}

.form-control {
	background-color: #e6e0e0;
}

h3 {
	text-align: center;
}

h2 {
	text-align: center;
}
</style>
<script>
  function validateForm(form) {
    var amount = form.elements["depositAmount"].value;
    var balance = form.elements["balance"].value;
    if (isNaN(amount) || amount <= 0 || Number.isInteger(amount)) {
      alert("Please enter a valid positive amount to deposit.");
      return false;
    }
    return true;
  }
  function validateWithdrawForm(form){
	  var amount = form.elements["withdrawAmount"].value;
	    var balance = form.elements["balance"].value;
	    if (isNaN(amount) || amount <= 0 || Number.isInteger(amount)) {
	      alert("Please enter a valid positive amount to withdraw.");
	      return false;
	    }
	    if ((parseFloat(amount) - parseFloat(balance)) > 0) {
	      alert("The withdraw amount cannot exceed your balance.");
	      return false;
	    }
	    return true;
  }

  function validateTransferForm(form) {
    var toUserId = form.elements["toUserId"].value;
    var transferAmount = form.elements["transferAmount"].value;
    var balance = form.elements["balance"].value;
    var idExist = allUserId.includes(toUserId);
    console.log(idExist);
    if (!idExist) {
      alert("Please enter the valid User ID.");
      return false;
    }
    if (isNaN(transferAmount) || transferAmount <= 0) {
      alert("Please enter a valid positive amount to transfer.");
      return false;
    }
    if (parseFloat(transferAmount) > parseFloat(balance)) {
      alert("You do not have sufficient funds to make this transfer.");
      return false;
    }
    return true;
  }
</script>

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
	<div class="maketransaction-container mt-4">
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
			<h1>Make a Transaction, <%=user%></h1>
			<a href="UserController" class="btn btn-danger"> <svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-house-door-fill mx-1 mb-1"
					viewBox="0 0 16 16"> <path
					d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5Z" />
				</svg>Back Home
			</a>
		</div>
		<hr>
		<h2>
			Your Account Balance: ${balance}
			</h4>
			<hr>

			<div class="details-container">
				<form action="UserController" method="get" onsubmit="validateForm(this)">
					<hr>
					<h3>Deposit Money</h3>
					<hr>
					<div class="form-group">
						<label for="depositAmount">Amount</label> 
						<input type="number" value="depositAmount" class="form-control" id="depositAmount" name="depositAmount"
							required>
						<input type="hidden" name="action" value="depositMoney">
						<input type="hidden" name="id" value="${id}">
						<input type="hidden" name="balance" value="${balance}">
					</div>
					<div class="form-actions">
						<button type="submit" value="submit" class="btn btn-primary" ">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-window-plus mx-1 mb-1"
								viewBox="0 0 16 16"> <path
								d="M2.5 5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1ZM4 5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1Zm2-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Z" />
							<path
								d="M0 4a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v4a.5.5 0 0 1-1 0V7H1v5a1 1 0 0 0 1 1h5.5a.5.5 0 0 1 0 1H2a2 2 0 0 1-2-2V4Zm1 2h13V4a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2Z" />
							<path
								d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 0 0 1 0v-1h1a.5.5 0 0 0 0-1h-1v-1a.5.5 0 0 0-.5-.5Z" />
							</svg>
							Deposit
						</button>
					</div>
				</form>
			</div>

			<hr>
			<div class="details-container">
				<form action="UserController" method="get" onsubmit="validateWithdrawForm(this)">
					<hr>
					<h3>Withdraw Money</h3>
					<hr>
					<div class="form-group">
						<label for="withdrawAmount">Amount</label> 
						<input type="number" value="submit" class="form-control" id="withdrawAmount" name="withdrawAmount"
							required>
						<input type="hidden" name="action" value="withdrawMoney">
						<input type="hidden" name="id" value="${id}">
						<input type="hidden" name="balance" value="${balance}">
						
					</div>
					<div class="form-actions">
						<button type="submit" value="submit" class="btn btn-primary" onclick="${withdraw}">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-window-dash mx-1 mb-1"
								viewBox="0 0 16 16"> <path
								d="M2.5 5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1ZM4 5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1Zm2-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Z" />
							<path
								d="M0 4a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v4a.5.5 0 0 1-1 0V7H1v5a1 1 0 0 0 1 1h5.5a.5.5 0 0 1 0 1H2a2 2 0 0 1-2-2V4Zm1 2h13V4a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2Z" />
							<path
								d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-5.5 0a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Z" />
							</svg>
							Withdraw
						</button>
					</div>
				</form>
			</div>
			<hr>
			<div class="transfer-container">
				<form action="UserController" method="get" onsubmit="return validateTransferForm(this);">
					<hr>
					<h3>Transfer Money</h3>
					<hr>

					<div class="form-group">
						<label for="toUserId">To User ID</label> 
						<input type="number" class="form-control" id="toUserId" name="toUserId" required>
					</div>
					<div class="form-group">
						<label for="transferAmount">Amount</label> 
						<input type="number" class="form-control" id="transferAmount" name="transferAmount"
							required>
						<input type="hidden" name="action" value="transferMoney">
						<input type="hidden" name="id" value="${id}">
						<input type="hidden" name="balance" value="${balance}">
						<input type="hidden" name="allUserId" value="${allUserId}">
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary"
							onclick="validateTransferForm()" name="transferButton">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-send-check-fill mx-1 mb-1"
								viewBox="0 0 16 16"> <path
								d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 1.59 2.498C8 14 8 13 8 12.5a4.5 4.5 0 0 1 5.026-4.47L15.964.686Zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471-.47 1.178Z" />
							<path
								d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-1.993-1.679a.5.5 0 0 0-.686.172l-1.17 1.95-.547-.547a.5.5 0 0 0-.708.708l.774.773a.75.75 0 0 0 1.174-.144l1.335-2.226a.5.5 0 0 0-.172-.686Z" />
							</svg>
							Transfer
						</button>
					</div>
					
					<div>
							
					
					</div>
				</form>
			</div>
			<hr>
	</div>
</body>
</html>
