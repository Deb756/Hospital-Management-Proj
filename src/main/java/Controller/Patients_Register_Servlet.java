package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bookAppointment")
public class Patients_Register_Servlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");

		// Helper method to retrieve parameter with null safety check
		String name = req.getParameter("patient_name");
		String age = req.getParameter("patient_age");
		String mobile = req.getParameter("patient_mobile");
		String appdate = req.getParameter("appointment_date");
		String gender = req.getParameter("patient_gender");
		String disease = req.getParameter("disease");
		String doc_pre = req.getParameter("doctor_preference");
		String symptoms = req.getParameter("symptoms");

		// Database connection and insertion logic
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital-management-proj1",
					"root", "root");
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO `patiets_tab` (`name`, `age`, `mobile`, `symptoms`, `gender`, `date`, `doc_pre`, `disease`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");

			ps.setString(1, name);
			ps.setString(2, age);
			ps.setString(3, mobile);
			ps.setString(4, symptoms);
			ps.setString(5, gender);
			ps.setString(6, appdate);
			ps.setString(7, doc_pre);
			ps.setString(8, disease);

			int row_aff = ps.executeUpdate();
			if (row_aff > 0) {
				HttpSession ses = req.getSession();
				ses.setAttribute("success", name);
				resp.sendRedirect("BookApointment.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
