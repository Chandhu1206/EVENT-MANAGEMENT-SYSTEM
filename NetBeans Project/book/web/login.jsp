
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
    <title>Login</title>    
</head> 
<body> 
    <div class="container"> 
        <h2>
 🔑
 Login to Your Account</h2> 
        <form action="login" method="post"> 
            <input type="email" name="email" placeholder="Enter your email" required><br> 
                                                                                                                                                                4 
            <input type="password" name="password" placeholder="Enter your password" 
required><br> 
            <input type="submit" value="Login"> 
        </form> 
        <a href="register.jsp" class="register-link">Don't have an account? Register here</a> 
    </div> 
</body> 
</html> 