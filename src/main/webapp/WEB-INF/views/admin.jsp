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

	<nav class="navbar navbar-expand-lg">

		<ul class="navbar-nav mr-auto">
			<li class="nav-item">Welcome ${user.name}</li>
		</ul>

		

		<ul class="navbar-nav ml-auto">
			<c:if test="${username == 1}">
				<li class="nav-item"><a href="/list/${user.id}" class="nav-link">Home
						List</a></li>
			</c:if>
			<li class="nav-item"><a href="/create" class="nav-link">Create
					Tasks</a></li>
			<li class="nav-item"><a href="/logout" class="nav-link">Log
					out</a></li>

		</ul>

	</nav>

	<section class="container">

		<form>

			<table class="table table-striped">
				<tr>
					<th>User</th>
					<th>User Id</th>
					<th>Description</th>
					<th>Due Date</th>
					<th>Status</th>
					<th>Mark Complete</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="task" items="${tasks}">
					<tr>
						<td>${task.users.name}</td>
						<td>${task.users.id}</td>
						<td>${task.description}</td>
						<td>${task.dueDate }</td>
						<c:if test="${task.status}">
							<td>Complete</td>
						</c:if>
						<c:if test="${!task.status}">
							<td>Incomplete</td>
						</c:if>
						<c:if test="${task.status}">
							<td><a href="/complete/${task.id}" class="btn btn-primary">Mark
									Incomplete</a></td>
						</c:if>
						<c:if test="${!task.status}">
							<td><a href="/complete/${task.id}" class="btn btn-primary">Mark
									Complete</a></td>
						</c:if>
						<td><a href="/edit/${task.id}" class="btn btn-primary">Edit</a>
						<td><a href="/delete/${task.id}" class="btn btn-primary">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</section>

</body>
</html>