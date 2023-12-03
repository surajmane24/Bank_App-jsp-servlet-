<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank</title>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
		 <title>Login Page</title>
    <style>
        body {
            background-color: #1e1e1e;
            color: #fff;
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .login-container {
            background-color: #333;
          	border-radius: 20px;
            padding: 70px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: left;
             width: 320px; 
              margin: 0 auto; 
              text-align: center;
        }
        h1 {
            color: #00bcd4;
        }
        label, input, select {
            display: block;
            margin: 10px 0;
            width: 100%;
        }
         label {
            text-align: left;
        }
        select, input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #e6e0e0;
            color: #333;
        }
        input[type="submit"] {
            background-color: #00bcd4;
            color: #fff;
            padding: 8px 20px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
             width: auto;
             display: inline-block;
               margin-top: 10px; 
        }
    </style>
    <script>
        var url = new URLSearchParams(window.location.search);
        if (url.has("error")) {
            alert("Invalid username or password. Please try again.");
        }
        if (url.has("error1")) {
            alert("User is Deactivated by Admin");
        }
    </script>
</head>
<body>

	 <div class="login-container">
	 <h2> <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-bank2 mx-2 mb-2" viewBox="0 0 16 16">
  <path d="M8.277.084a.5.5 0 0 0-.554 0l-7.5 5A.5.5 0 0 0 .5 6h1.875v7H1.5a.5.5 0 0 0 0 1h13a.5.5 0 1 0 0-1h-.875V6H15.5a.5.5 0 0 0 .277-.916l-7.5-5zM12.375 6v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zM8 4a1 1 0 1 1 0-2 1 1 0 0 1 0 2zM.5 15a.5.5 0 0 0 0 1h15a.5.5 0 1 0 0-1H.5z"/>
</svg> NOS BANK</h2>
	 <hr>
        <h1>LOGIN TO BANK</h1>
        <hr>
        <form action="LoginController" method="get">
            <label for="userType"> User Type:</label>
            <select id="userType" name="userType" class="mt-2">
            	<option selected disabled> Select</option>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>
            
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" class="mt-2" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" class="mt-2 mb-6" required>
            
            <input type="submit" value="Login" class="col-md-6">
        </form>
    </div>
	
</body>
</html>