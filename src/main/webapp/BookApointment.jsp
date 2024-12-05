<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Book Appointment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style type="text/css">
/* Styling for the main container */
body, html {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(135deg, #42a5f5, #7986cb);
}

/* Styling for the appointment form container */
.main_cont {
	/* margin: 10px; */
	display: grid;
	place-content: center;
}

.cont {
	background-color: #fff;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	max-width: 80vw;
	width: 100%;
	margin-top: 20px; /* Add some space from the top */
	overflow: auto; /* Prevent overflow */
	text-align: center;
}

/* Styling for the title */
.cont2 h1 {
	font-size: 30px;
	color: #333;
	margin-bottom: 30px;
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

/* Back button styling */
.back-btn {
	display: inline-block;
	margin-top: 15px;
	color: #42a5f5;
	font-weight: bold;
	text-decoration: none;
}

.back-btn:hover {
	text-decoration: underline;
}

/* Media queries for smaller screens */
@media ( max-width : 912px) {
	.cont {
		width: 100%;
		padding: 20px;
	}
	.form-control {
		padding: 10px 15px;
	}
	.cont2 h1 {
		font-size: 24px;
	}
	.btn-primary {
		width: 100%;
	}
}

@media ( max-width : 576px) {
	.cont {
		width: 100%;
		padding: 15px;
	}
	.form-control {
		padding: 8px 12px;
	}
	.cont2 h1 {
		font-size: 20px;
	}
	.btn-primary {
		width: 100%;
		padding: 10px;
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
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="LandingPage.jsp">About Us</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="LandingPage.jsp">Services</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#" onclick="checkDoc()">Doctors</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="LandingPage.jsp">Contact</a></li>
					</ul>
					<a href="Login.jsp"><button type="button"
							class="btn btn-sm btn-secondary  mx-1 btn-nav">Login</button></a>

				</div>
			</div>
		</nav>
	</header>

	<div class=" container my-3 main_cont">
		<div class="cont">
			<div class="cont2">
				<h1>Book Appointment</h1>
				<!-- Java Code -->
				<%
					String msg1 =(String) session.getAttribute("success");
					if(msg1 != null)
					{
				%>
						<p class="mb-3"><b class="mark text-success">Appointment Booked Successfully</b></p>
				<%
					session.invalidate();
					}
				%>
			
				<!-- Java Code -->
			</div>
			<form action="bookAppointment" method="post">
				<div class="row">
					<!-- Left Section -->
					<div class="col-md-4">
						<div class="mb-4">
							<label for="patientName" class="form-label">Patient Name</label>
							<input type="text" class="form-control" id="patientName"
								name="patient_name" required>
						</div>
						<div class="mb-4">
							<label for="patientAge" class="form-label">Age</label> <input
								type="number" class="form-control" id="patientAge"
								name="patient_age" required>
						</div>
					</div>

					<!-- Middle Section -->
					<div class="col-md-4">
						<div class="mb-4">
							<label for="appointmentDate" class="form-label">Preferred
								Appointment Date</label> <input type="date" class="form-control"
								id="appointmentDate" name="appointment_date" required>
						</div>
						<div class="mb-4">
							<label for="patientGender" class="form-label">Gender</label> <select
								class="form-control" id="patientGender" name="patient_gender"
								required>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>
						</div>
					</div>

					<!-- Right Section -->
					<div class="col-md-4">
						<div class="mb-4">
							<label for="patientMobile" class="form-label">Mobile</label> <input
								type="tel" class="form-control" id="patientMobile"
								name="patient_mobile" required>
						</div>
						<div class="mb-4">
							<label for="disease" class="form-label">Disease</label> <select
								class="form-control" id="disease" name="disease" required>
								<option value="General Consultation">General
									Consultation</option>
								<option value="Cardiology">Cardiology</option>
								<option value="Neurology">Neurology</option>
								<option value="Dermatology">Dermatology</option>
								<option value="Other">Other</option>
							</select>
						</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="doctorPreference" class="form-label">Doctor
						Preference</label> <input type="text" class="form-control"
						id="doctorPreference" name="doctor_preference"
						placeholder="Optional">
				</div>

				<div class="mb-3">
					<label for="symptoms" class="form-label">Symptoms /
						Additional Comments</label>
					<textarea class="form-control" id="symptoms" name="symptoms"
						rows="4" placeholder="Describe your symptoms or additional info"
						required></textarea>
				</div>

				<div class="d-flex justify-content-between flex-column">
					<button type="submit" class="btnn btnn-primary">Book
						Appointment</button>
					<a href="LandingPage.jsp" class="back-btn">Back to Home</a>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function checkDoc() {
			let password = 333;
			let confPass;

			// Loop until the user enters a valid integer or cancels
			do {
				confPass = prompt("Enter Your Doctor ID:");

				// If the user cancels (confPass is null), break out of the loop
				if (confPass === null) {
					window.location.href = "BookApointment.jsp";
					return; // Stop further execution
				}

			} while (isNaN(confPass) || !Number.isInteger(Number(confPass))); // Check if input is a valid integer

			// Convert confPass to an integer for comparison
			confPass = parseInt(confPass);

			// Check if input matches the password
			if (password === confPass) {
				window.location.href = "Doctors_page.jsp";
			} else {
				alert("Your not a Doctor Go Back !!!")
			}
		}
	</script>
</body>
</html>
