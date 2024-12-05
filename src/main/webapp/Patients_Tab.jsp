<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Details</title>
</head>
<body>
	<div class="container my-3">
		<h2>Patient's Details</h2>

		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search for names.." title="Type in a name">

		<%
		Object userObj = session.getAttribute("user");
		    String name = null;
	        String age = null;
	        String mobile = null;
	        String symptoms = null;
	        String gender = null;
	        java.sql.Date date = null;
	        String disease = null;
	        
		if (userObj != null) {
			int id2 = (int) userObj;

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital-management-proj1", "root",
				"root");

				// Fetch doctor details
				PreparedStatement psDoctor = con.prepareStatement("SELECT * FROM `doctors-tab` WHERE id=?;");
				psDoctor.setInt(1, id2);
				ResultSet rsDoctor = psDoctor.executeQuery();

				if (rsDoctor.next()) {
		%>
		<div class="d-flex flex-wrap">
			<p class="mark text-primary me-2">
				<b>Doc Id : <%=rsDoctor.getInt("id")%></b>
			</p>
			<p class="mark text-primary me-2">
				<b>Name : <%=rsDoctor.getString("name")%></b>
			</p>
			<p class="mark text-primary me-2">
				<b>Specialist : <%=rsDoctor.getString("specialist")%></b>
			</p>
		</div>
		<%
		}

		// Fetch patient details
		PreparedStatement psPatient = con
				.prepareStatement("SELECT * from patiets_tab");
		ResultSet rsPatient = psPatient.executeQuery();
		%>

		<div class="table-responsive">
			<table id="myTable">
				<tr class="header">
					<th style="width: 15%;">Name</th>
					<th style="width: 15%;">Age</th>
					<th style="width: 20%;">Mobile</th>
					<th style="width: 10%;">Disease</th>
					<th style="width: 40%;">Message</th>
				</tr>
				<%
				while (rsPatient.next()) {
				%>
				<tr>
					<td><%=rsPatient.getString("name")%></td>
					<td><%=rsPatient.getInt("age")%></td>
					<td><%=rsPatient.getString("mobile")%></td>
					<td><%=rsPatient.getString("disease")%></td>
					<td><%=rsPatient.getString("symptoms")%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>

		<%
		} catch (Exception e) {
		e.printStackTrace();
		}
		}
		%>
	</div>
</body>
</html>
