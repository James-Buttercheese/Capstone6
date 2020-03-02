<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
</head>
<body>

<div class='container'>
	<h1>Please Register</h1>
	<form action="/verify">
	<h3>${message}</h3>



		<table>
		
		


			<tr>
				<th scope="row">Username:</th>
				<td><input type="text" name="name" 	required minlength="4" maxlength="25" /></td>
			</tr>
			<tr>
				<th scope="row">Password:</th>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<th scope="row">Confirm Password:</th>
				<td><input type="password" name="password2" /></td>
			</tr>

		</table>

		<input class="btn btn-primary" type="submit" value="Submit" />
		<a class="btn btn-primary" href="/"> Home </a>
	</form>

</div>

</body>
</html>