<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Doctors page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style type="text/css">/* Styling for the main container */
body, html {
	height: 100%;
	margin: 0;
	font-family: 'Arial', sans-serif;
	background: linear-gradient(135deg, #42a5f5, #7986cb);
	/* display: flex;
	justify-content: center;
	align-items: center; */
}

/* Styling for the login form container */
.main_cont {
	display: grid;
	place-content: center;
}

.cont {
	background-color: #fff;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	max-width: 400px;
	width: 50vw;
	text-align: center;
}

/* Styling for the title */
.cont2 h1 {
	font-size: 28px;
	color: #333;
	margin-bottom: 20px;
}

/* Input fields styling */
.form-control {
	border-radius: 30px;
	border: 1px solid #ddd;
	padding: 12px 20px;
	margin-bottom: 15px;
	transition: all 0.3s;
}

.form-control:focus {
	border-color: #42a5f5;
	box-shadow: 0 0 5px rgba(66, 165, 245, 0.5);
}

/* Button styling */
.btnn {
	border-radius: 30px;
	padding: 10px 20px;
	background-color: #42a5f5;
	border: none;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btnn:hover {
	background-color: #1e88e5;
}

.btnn-primary {
	margin-top: 20px;
	width: 100%;
}

/* Register button styling */
.register-btn {
	display: inline-block;
	margin-top: 15px;
	color: #42a5f5;
	font-weight: bold;
	text-decoration: none;
}

.register-btn:hover {
	text-decoration: underline;
}

/* Text color and styling */
.form-text {
	color: #666;
}

/* Media query for smaller devices */
@media ( max-width : 768px) {
	.cont {
		width: 100%;
	}
}
</style>
</head>
<body>
	<header data-bs-theme="dark">
		<nav class="navbar navbar-expand-lg bg-body-tertiary nav-bc "
			data-bs-theme="dark">
			<div class="container-fluid text-light">
				<a class="navbar-brand" href="#">MEDIN</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="LandingPage.jsp">Home</a></li>

					</ul>

				</div>
			</div>
		</nav>
	</header>
	
	<div class=" container my-3 main_cont">
		<div class="cont">
			<div class="cont2">
				<h1>Doctor's Login</h1>
				<!-- java code -->
					<%
					String msg =(String) session.getAttribute("msg");
					if("invalid".equalsIgnoreCase(msg))
					{
					%>
						<b class="mark text-danger">Invalid Email OR Password</b>
					<%
					session.invalidate();
					}
					%>
			    <!-- java code -->
			</div>
			<form action="Doctorslogin" method="post">
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Email
						address</label> <input type="email" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp"
						name="user_email" required="required">
					<div id="emailHelp" class="form-text">We'll never share your
						email with anyone else.</div>
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">Password</label>
					<input type="password" class="form-control"
						id="exampleInputPassword1" name="user_password"
						required="required">
				</div>
				<button type="submit" class="btnn btnn-primary">Login</button>
				<a href="Register.jsp" class="register-btn">Doctor's Register</a>
			</form>
		</div>
	</div>
<!-- Add Bootstrap JS and Popper.js dependencies -->
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</body>
</html>