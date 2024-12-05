<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Doctor's Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style type="text/css">
/* Styling for the main container */
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
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	max-width: 600px; /* Increased max width */
	width: 100%;
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

	<!-- java code -->

	<%
	String gs = (String) session.getAttribute("msg");

	if (gs != null) {
	%>
	<div class="alert alert-success alert-dismissible fade show"
		role="alert" id="autoDismissAlert">
		<strong>Welcome Dr. <%=gs%></strong> You Registered Successfully <strong>Now You can Login</strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>

	<%
	session.invalidate();
	}
	%>




	<!-- java code -->



	<div class=" container my-3 main_cont">
		<div class="cont">
			<div class="cont2">
				<h1>Doctors Registration</h1>
			</div>
			<form action="Doctorsregistration" method="post">
				<div class="row">
					<!-- Left Section -->
					<div class="col-md-6">
						<div class="mb-3">
							<label for="userName" class="form-label">Enter Name</label> <input
								type="text" class="form-control" id="userName" name="user_name"
								required>
						</div>
						<div class="mb-3">
							<label for="userEmail" class="form-label">Enter Email</label> <input
								type="email" class="form-control" id="userEmail"
								name="user_email" required>
							<div class="form-text">We'll never share your email with
								anyone else.</div>
						</div>
					</div>
					<!-- Right Section -->
					<div class="col-md-6">
						<div class="mb-3">
							<label for="userAge" class="form-label">Enter Age</label> <input
								type="text" class="form-control" id="userAge" name="user_age"
								required>
						</div>
						<div class="mb-3">
							<label for="userMobile" class="form-label">Enter Mobile</label> <input
								type="text" class="form-control" id="userMobile"
								name="user_mobile" required>
						</div>
					</div>
				</div>
				<div class="mb-3">
					<div class="mb-3">
						<label for="userAge" class="form-label">Specialist</label> <input
							type="text" class="form-control" id="userSpe"
							name="user_specialist" required>
					</div>
					<label for="userPassword" class="form-label">Enter Password</label>
					<input type="password" class="form-control" id="userPassword"
						name="user_password" required>
				</div>
				<div class="d-flex justify-content-between flex-column">
					<button type="submit" class="btnn btnn-primary">Register</button>
					<a href="Doctors_page.jsp" class="register-btn">Doctor's Login</a>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
<script>
	// Automatically dismiss the alert after 10 seconds (10000 milliseconds)
	setTimeout(function() {
		var alertElement = document.getElementById('autoDismissAlert');
		var bsAlert = new bootstrap.Alert(alertElement);
		bsAlert.close();
	}, 3000); // 10000 ms = 10 seconds
</script>
</html>
