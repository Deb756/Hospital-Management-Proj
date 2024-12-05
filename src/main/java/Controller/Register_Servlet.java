package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.exceptions.RSAException;


@WebServlet("/Doctorsregistration")
public class Register_Servlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");

//		getting data from input fields
		String name = req.getParameter("user_name");
		String email = req.getParameter("user_email");
		String age = req.getParameter("user_age");
		String mobile = req.getParameter("user_mobile");
		String specialist = req.getParameter("user_specialist");
		String password = req.getParameter("user_password");

//		database
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital-management-proj1", "root", "root");
			PreparedStatement ps = con.prepareStatement("INSERT INTO `doctors-tab` (name, age, email, password, mobile, specialist) VALUES (?, ?, ?, ?, ?, ?);");
			ps.setString(1, name);
			ps.setString(2, age);
			ps.setString(3, email);
			ps.setString(4, password);
			ps.setString(5, mobile);
			ps.setString(6, specialist);

			
			int row_aff = ps.executeUpdate();
			if(row_aff > 0)
			{
				HttpSession ses = req.getSession();
				ses.setAttribute("msg", name);
				resp.sendRedirect("Register.jsp");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
