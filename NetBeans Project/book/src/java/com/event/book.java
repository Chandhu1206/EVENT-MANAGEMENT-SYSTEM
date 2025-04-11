
package com.event; 
import java.io.IOException; 
import java.sql.*; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.*; 
 
@WebServlet("/book") 
public class book extends HttpServlet { 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException { 
        int eventId = Integer.parseInt(request.getParameter("event_id")); 
        String seatNumber = request.getParameter("seat_number"); 
        HttpSession session = request.getSession(); 
        String user = (String) session.getAttribute("user"); 
 
        try { 
            Connection con = 
DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "admin"); 
            PreparedStatement ps = con.prepareStatement("INSERT INTO bookings (user_id, event_id, seat_number) VALUES ((SELECT id FROM users WHERE email=?), ?, ?)"); 
            ps.setString(1, user); 
            ps.setInt(2, eventId); 
            ps.setString(3, seatNumber); 
            ps.executeUpdate(); 
            response.sendRedirect("tickets.jsp"); 
        } catch (Exception e) { 
            e.printStackTrace(); 
        } 
    } 
} 
        