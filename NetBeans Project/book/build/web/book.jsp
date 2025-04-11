
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% 
    String eventId = request.getParameter("id"); 
%> 
<html> 
<head> 
    <title>Book Seat</title> 
   </head> 
<body> 
    <h2>Book Your Seat</h2> 
    <form action="book" method="post"> 
        <input type="hidden" name="event_id" value="<%= eventId %>"> 
        Seat Number: <input type="text" name="seat_number" required><br> 
        <input type="submit" value="Book"> 
    </form> 
</body> 
</html>
