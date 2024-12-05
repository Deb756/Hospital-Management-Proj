<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
* {
	box-sizing: border-box;
}

.container {
	max-width: 900px;
	margin: 0 auto;
	padding: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

#myInput {
	width: 100%;
	padding: 12px 20px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
	transition: all 0.3s ease-in-out;
}

#myInput:focus {
	border-color: #007bff;
	box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
}

#myTable {
	width: 100%;
	border-collapse: collapse;
	font-size: 16px;
	margin-bottom: 20px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
	border-bottom: 1px solid #ddd;
}

#myTable tr.header {
	background-color: #f4f4f4;
}

#myTable tr:hover {
	background-color: #f1f1f1;
}

/* Media Query for Tablets and Smaller Screens */
@media ( max-width : 768px) {
	#myTable th, #myTable td {
		padding: 10px;
		font-size: 14px;
	}
	#myInput {
		font-size: 14px;
		padding: 10px;
	}
}

/* Media Query for Mobile Phones */
@media ( max-width : 480px) {
	#myTable th, #myTable td {
		padding: 8px;
		font-size: 12px;
	}
	#myInput {
		font-size: 12px;
		padding: 8px;
	}
}
/* Ensure the table fits the container */
.table-responsive {
	width: 100%;
	overflow-x: auto;
}

/* Make sure table cells don't overflow */
table {
	width: 100%;
	border-collapse: collapse;
}

table th, table td {
	padding: 10px;
	text-align: left;
	word-wrap: break-word; /* Prevent text overflow */
}

/* Optional: improve the look on mobile */
@media only screen and (max-width: 768px) {
	table, th, td {
		font-size: 14px; /* Adjust font size for smaller screens */
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
					
					<!-- java code -->
					<%
					    Object userObj = session.getAttribute("user");
					
					    if (userObj != null) {
					        int id2 = (int) userObj;
					
					        try {
					            Class.forName("com.mysql.cj.jdbc.Driver");
					            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital-management-proj1", "root", "root");
					            PreparedStatement ps = con.prepareStatement("SELECT * FROM `doctors-tab` WHERE id=?;");
					            ps.setInt(1, id2);
					
					            ResultSet rs = ps.executeQuery();
					            if (rs.next()) {
					%>
					                <div class="d-flex flex-wrap">
					                    <p class="mark text-primary me-2"><b>Doc Id : <%= rs.getInt("id") %></b></p>
					                    <p class="mark text-primary me-2"><b>Name : <%= rs.getString("name") %></b></p>
					                    <p class="mark text-primary me-2"><b>Specialist : <%= rs.getString("specialist") %></b></p>
					                </div>
					<%
					            }
					        } catch (Exception e) {
					            e.printStackTrace();
					        }
					%>
					<!-- java code -->
					
					<a href="DoctorsLogout"><button type="button"
							class="btn btn-sm btn-secondary  mx-1 btn-nav">Logout
							here</button></a>

				</div>
			</div>
		</nav>
	</header>
	<!-- java code -->
		        <div class="alert alert-success alert-dismissible fade show" role="alert" id="autoDismissAlert">
		            <strong>You logged in successfully !! <%= id2 %></strong>
		            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		        </div>

		        <script>
		            setTimeout(function() {
		                var alertElement = document.getElementById('autoDismissAlert');
		                var bsAlert = new bootstrap.Alert(alertElement);
		                bsAlert.close();
		            }, 900);
		        </script>
				<%
				    } else {
				        // If userObj is null, redirect to the landing page
				        response.sendRedirect("LandingPage.jsp");
				    }
				%>

	<!-- java code -->
	<div class="container my-3">
		<h2>Patient's Details</h2>
		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search for names.." title="Type in a name">
			
		<div class="table-responsive">
			<table id="myTable">
				<tr class="header">
					<th style="width: 15%;">Name</th>
					<th style="width: 5%;">Age</th>
					<th style="width: 10%;">Mobile</th>
					<th style="width: 10%;">Disease</th>
					<th style="width: 15%;">Appointment Date</th>
					<th style="width: 40%;">Massage</th>
					<th style="width: 20%;">Action</th>
				</tr>
						
				<!-- java code -->
				
				<%
				 try {
			            Class.forName("com.mysql.cj.jdbc.Driver");
			            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital-management-proj1", "root", "root");
			            PreparedStatement ps = con.prepareStatement("SELECT * FROM `patiets_tab`;");
			
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()) {
				%>
				
				<!-- java code -->
		
				<tr>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("age") %></td>
					<td><%=rs.getString("mobile") %></td>
					<td><%=rs.getString("disease") %></td>
					<td><%=rs.getDate("date") %></td>
					<td><%=rs.getString("symptoms") %></td>
					<td><button class="btn btn-sm btn-success  confirmButton"   onclick="disableButton()">Confirm</button></td>
				</tr>
				
					<%
					     }
					     } catch (Exception e) {
					        e.printStackTrace();
					     }
					%>
			</table>
		</div>
	</div>

	<!-- Add Bootstrap JS and Popper.js dependencies -->
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
					
	<!-- Table filter script -->
	<script>
		document.querySelectorAll('.confirmButton').forEach(function(button) {
		    button.addEventListener('click', function() {
		        button.disabled = true;  
		        button.innerText = 'Confirmed';  
		    });
		});
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>

</body>

</html>