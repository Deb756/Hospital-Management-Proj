package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PatientDetailsServlet")
public class Patients_tab_servlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Loading the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establishing the connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital-management-proj1", "root", "root");

            // SQL query to fetch patient details
            PreparedStatement psPatient = con.prepareStatement("SELECT * FROM patients_tab");
            ResultSet rsPatient = psPatient.executeQuery();

            // HTML Table Header
            out.println("<div class='container my-3'>");
            out.println("<h2>Patient's Details</h2>");
            out.println("<input type='text' id='myInput' onkeyup='myFunction()' placeholder='Search for names..' title='Type in a name'>");
            out.println("<div class='table-responsive'>");
            out.println("<table id='myTable'>");
            out.println("<tr class='header'><th style='width: 15%;'>Name</th><th style='width: 15%;'>Age</th><th style='width: 20%;'>Mobile</th><th style='width: 10%;'>Disease</th><th style='width: 40%;'>Symptoms</th></tr>");

            // Fetching and displaying patient details dynamically
            while (rsPatient.next()) {
                out.println("<tr>");
                out.println("<td>" + rsPatient.getString("name") + "</td>");
                out.println("<td>" + rsPatient.getInt("age") + "</td>");
                out.println("<td>" + rsPatient.getString("mobile") + "</td>");
                out.println("<td>" + rsPatient.getString("disease") + "</td>");
                out.println("<td>" + rsPatient.getString("symptoms") + "</td>");
                out.println("</tr>");
            }

            // Closing table and HTML
            out.println("</table>");
            out.println("</div>");
            out.println("</div>");

            // Closing connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }

}
