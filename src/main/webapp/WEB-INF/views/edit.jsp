<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
</head>
<body>


	<div class='container'>
		<form action="/list/edit" method="post">

			<input type="hidden" name="id" value="${task.id }" />
			<div>
				<label>Task</label> <input type="text" id="description"
					name="description" />
			</div>
			<div>
				<label>Due Date</label> <input type="date" id="dueDate"
					name="dueDate" />
			</div>
			<input type="hidden" name="id" value="${task.id }" />
			<input type="hidden" name="users" value="${task.users.id}" />

			<button type="submit" class="btn btn-primary">Submit</button>
			<a class="btn btn-primary" href="/logout">Log out</a>

		</form>
	</div>

</body>
</html>