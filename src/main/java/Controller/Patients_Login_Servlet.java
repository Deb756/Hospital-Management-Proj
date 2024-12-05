package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/patietsLogin")
public class Patients_Login_Servlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");

//		getting data from input fields
		String email = req.getParameter("patient_mobile");
		String password = req.getParameter("patient_password");

//		database connection 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital-management-proj1",
					"root", "root");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `patiets_tab` WHERE mobile=? AND id=?;");
			ps.setString(1, email); // Set email instead of name
			ps.setString(2, password); // Set password instead of age

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				HttpSession ses = req.getSession();
				ses.setAttribute("user", rs.getInt("id"));
				resp.sendRedirect("Know_Patients_Status.jsp");
			} else {
				HttpSession ses = req.getSession();
				ses.setAttribute("msg", "invalid");
				resp.sendRedirect("Login.jsp");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
