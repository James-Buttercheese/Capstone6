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

	<main>

		<section class="container">

			<div class="card text-center">

				<div class="card-body">
						<h2>Login</h2>
						
						<h3>${message }</h3>

						<form method="post">

							<label>Username</label> <input type="text" name="name" required> 
							<label>Password</label>	<input type="password" name="password" required>

							<button type="submit" class="btn btn-primary">Login</button>
						</form>

					</div>


			</div>

		</section>

	</main>

</body>
</html>