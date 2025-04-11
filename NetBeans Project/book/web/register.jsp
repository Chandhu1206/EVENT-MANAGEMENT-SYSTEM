<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
    <title>Register</title> 
   </head> 
<body> 
    <div class="container"> 
        <h2>
 📝
 Register for an Account</h2> 
        <form action="register" method="post"> 
            <input type="text" name="name" placeholder="Enter your full name" required><br> 
            <input type="email" name="email" placeholder="Enter your email" required><br> 
            <input type="password" name="password" placeholder="Enter your password" 
required><br> 
            <input type="submit" value="Register"> 
        </form> 
        <a href="login.jsp" class="login-link">Already have an account? Login here</a> 
    </div> 
</body> 
</html>