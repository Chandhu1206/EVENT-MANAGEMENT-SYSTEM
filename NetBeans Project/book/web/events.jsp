
<%@ page import="java.sql.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% 
    // Session Validation - Redirect if not logged in 
    String user = (String) session.getAttribute("user"); 
    if (user == null) { 
        response.sendRedirect("login.jsp"); 
        return; 
    } 
%> 
<!DOCTYPE html> 
<html> 
<head> 
                                                                                                                                                                5 
    <title>Events</title> 
    
</head> 
<body> 
    <h2>
 🎉
 Available Events 
�
�
 </h2> 
    <table> 
        <tr> 
            <th>Event Name</th> 
            <th>Date</th> 
            <th>Venue</th> 
            <th>Seats</th> 
            <th>Action</th> 
        </tr> 
        <% 
            Connection con = null; 
            Statement stmt = null; 
            ResultSet rs = null; 
            try { 
                // Database Connection 
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", 
"root", "admin"); 
                stmt = con.createStatement(); 
                rs = stmt.executeQuery("SELECT * FROM events"); 
 
                while (rs.next()) { 
        %> 
        <tr> 
            <td><%= rs.getString("event_name") %></td> 
            <td><%= rs.getDate("event_date") %></td> 
            <td><%= rs.getString("venue") %></td> 
            <td><%= rs.getInt("total_seats") %></td> 
            <td><a href="book.jsp?id=<%= rs.getInt("id") %>" class="book-btn">Book Now</a></td> 
        </tr> 
        <% 
                } 
            } catch (Exception e) { 
                out.println("<tr><td colspan='5' style='color:red; font-weight:bold;'>Error fetching events!</td></tr>"); 
                e.printStackTrace(); 
            } finally { 
                if (rs != null) try { rs.close(); } catch (Exception ignored) {} 
                if (stmt != null) try { stmt.close(); } catch (Exception ignored) {} 
                if (con != null) try { con.close(); } catch (Exception ignored) {} 
            } 
        %> 
    </table> 
</body> 
</html> 
 
 
       