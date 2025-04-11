package com.event; 
 
import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
import jakarta.servlet.http.HttpSession; 
 
@WebServlet("/login") 
public class LoginServlet extends HttpServlet { 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException { 
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter(); 
 
        String email = request.getParameter("email"); 
        String password = request.getParameter("password"); 
 
        try { 
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection con = 
DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "admin"); 
 
            String query = "SELECT * FROM users WHERE email = ? AND password = ?"; 
            PreparedStatement ps = con.prepareStatement(query); 
            ps.setString(1, email); 
            ps.setString(2, password); 
            ResultSet rs = ps.executeQuery(); 
 
            if (rs.next()) { 
                HttpSession session = request.getSession(); 
                session.setAttribute("user", email); 
                response.sendRedirect("dashboard.jsp"); 
            } else { 
                out.println("<h3>Invalid Email or Password! <a href='login.jsp'>Try Again</a></h3>"); 
            } 
        } catch (Exception e) { 
            out.println("<h3>Database Error: " + e.getMessage() + "</h3>"); 
        } 
    } 
}