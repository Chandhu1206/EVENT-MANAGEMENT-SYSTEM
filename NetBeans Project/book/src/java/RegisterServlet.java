 
import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
 
@WebServlet("/register") 
public class RegisterServlet extends HttpServlet { 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException { 
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter(); 
 
        String name = request.getParameter("name"); 
        String email = request.getParameter("email"); 
        String password = request.getParameter("password"); 
 
        try { 
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection con = 
DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", 
"your_password"); 
 
            String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)"; 
            PreparedStatement ps = con.prepareStatement(query); 
            ps.setString(1, name); 
            ps.setString(2, email); 
            ps.setString(3, password); // You should hash passwords in a real app 
 
            int result = ps.executeUpdate(); 
            if (result > 0) { 
                out.println("<h3>Registration Successful! <a href='login.jsp'>Login Here</a></h3>"); 
            } else { 
                out.println("<h3>Error in Registration</h3>"); 
            } 
        } catch (Exception e) { 
            out.println("<h3>Database Error: " + e.getMessage() + "</h3>"); 
        } 
    } 
} 
 
