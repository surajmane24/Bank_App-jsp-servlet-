<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	width: 1000px;
	  margin: 0 auto; /* Center the container horizontally */
            text-align: center; /* Center text within the container */
}

h1 {
	color: #00bcd4;
	text-align: center;
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
	width: 800px;
	
	
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
	max-width: 900px;
	margin: 0 auto;
	text-align: left;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
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
	    <div class="admin-container mt-2">
    <hr>
    <h1>Create user</h1>
    <hr>
        <form action="AdminController" method="get"  class="mb-3">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
             <div class="form-group">
                <label for="balance">Balance:</label>
                <input type="text" class="form-control" id="balance" name="balance" required>
            </div>
            <div>
				<input  type="hidden" name="action" value="createUser">
			</div>

            <button type="submit" class="btn btn-primary mt-2">Create User</button>
        </form>
    </div>
	
</body>
</html>