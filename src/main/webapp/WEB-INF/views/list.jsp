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

	<c:set var="username" scope="session" value="${user.id}" />
	<nav class="navbar navbar-expand-lg">

		<ul class="navbar-nav mr-auto">
			<li class="nav-item">Welcome ${user.name}</li>
		</ul>

		<form method="post" class="form-inline ml-auto">
			<input class="form-control mr-sm-2" name="search" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>

		<ul class="navbar-nav ml-auto">

			<c:if test="${username == 1}">
				<li class="nav-item"><a href="/admin" class="nav-link">Admin
						Tasks</a></li>
			</c:if>
			<li class="nav-item"><a href="/date" class="nav-link">Sort
					by Date</a></li>
			<li class="nav-item"><a href="/status" class="nav-link">Sort
					by Complete</a></li>
			<li class="nav-item"><a href="/create" class="nav-link">Create
					Tasks</a></li>
			<li class="nav-item"><a href="/logout" class="nav-link">Log
					out</a></li>

		</ul>

	</nav>

	<main>
		<c:if test="${username == 1}">
			<section class="container">

				<h5>Welcome Madame CEO</h5>

			</section>
		</c:if>



		<section class="container">

			<form>

				<table class="table table-striped">
					<tr>
						<th>Description</th>
						<th>Due Date</th>
						<th>Status</th>
						<th>Mark Complete</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
					<c:forEach var="task" items="${user.task}">
						<tr>
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



	</main>


</body>
</html>