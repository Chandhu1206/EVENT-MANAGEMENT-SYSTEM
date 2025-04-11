<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %> 
<% 
    // Session validation 
    String user = (String) session.getAttribute("user"); 
    if (user == null) { 
        response.sendRedirect("login.jsp"); 
        return; 
    } 
%> 
<!DOCTYPE html> 
<html> 
<head> 
    <title>Dashboard</title> 
    </head> 
<body> 
    <div class="dashboard"> 
        <h2>Welcome, <%= user %> 
�
�
 </h2> 
        <div class="menu"> 
            <a href="events.jsp">View Events</a> 
            <a href="logout.jsp" class="logout" onclick="return confirm('Are you sure you want to 
logout?');">Logout</a> 
        </div> 
    </div> 
</body> 
<