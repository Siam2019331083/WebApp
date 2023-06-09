package lab.webtech;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//loginpage servlet implementation

@WebServlet("/sasadf")
public class LoginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public LoginPage() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher dispatcher = null;
		Connection con = null;
		PreparedStatement pst = null;
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
			if(session.getAttribute("role").equals("student")) {
				pst = con.prepareStatement("select * from students where username = ? and password = ?");
			}
			else if(session.getAttribute("role").equals("teacher")) {
				pst = con.prepareStatement("select * from teachers where username = ? and password = ?");
			}
			else {
				pst = con.prepareStatement("select * from admins where username = ? and password = ?");
			}
			
			pst.setString(1, username);
			pst.setString(2, password);
			
			ResultSet res = pst.executeQuery();
			
			if(res.next()) 
			{
				session.setAttribute("name", res.getString("name"));
				session.setAttribute("email", res.getString("email"));
				
				if(session.getAttribute("role").equals("student")) {
					dispatcher = request.getRequestDispatcher("homeS.jsp");
				}
				else if(session.getAttribute("role").equals("teacher")) {
					dispatcher = request.getRequestDispatcher("homeT.jsp");
				}
				else {
					dispatcher = request.getRequestDispatcher("homeA.jsp");
				}
			}
			else 
			{
				request.setAttribute("status", "failed");
				if(session.getAttribute("role").equals("student")) {
					dispatcher = request.getRequestDispatcher("loginS.jsp");
				}
				else if(session.getAttribute("role").equals("teacher")) {
					dispatcher = request.getRequestDispatcher("loginT.jsp");
				}
				else {
					dispatcher = request.getRequestDispatcher("loginA.jsp");
				}			}
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
