<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
	<body>
		
		<form ID = "login" action = "LoginServlet" method = "get">
			<div >
				<label for = "username">username</label>
				<input type = "text" ID = "username" name = "username"></input>
			</div>
			<div>
				<label for = "password">password</label>
				<input type = "text" ID = "password" name = "password"></input>
			</div>
			<div ID = "controlPanel">
				<button type = "submit" ID = "submit">login</button>
			</div>
		</form>

	</body>
</html>