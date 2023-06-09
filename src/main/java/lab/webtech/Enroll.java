package lab.webtech;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//enroll servlet implementation
@WebServlet("/enroll")
public class Enroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Enroll() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		RequestDispatcher dispatcher= null;
		Connection con = null;
		PreparedStatement pst = null;
		HttpSession session = request.getSession();
		
		String course_code = request.getParameter("ccode");
		String course_name = request.getParameter("cname");
		String dept = request.getParameter("dept");
		String teacher = request.getParameter("teacher");
		String student = String.valueOf(session.getAttribute("name"));
		String student_email = String.valueOf(session.getAttribute("email"));

		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
			pst = con.prepareStatement("insert into stcourses(ccode,cname,dept,teacher,student,stemail) values(?,?,?,?,?,?)");
			
			pst.setString(1, course_code);
			pst.setString(2, course_name);
			pst.setString(3, dept);
			pst.setString(4, teacher);
			pst.setString(5, student);
			pst.setString(6, student_email);

			int rows = pst.executeUpdate();
			if(rows > 0) {
				request.setAttribute("status", "success");
				response.sendRedirect("homeS.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("homeS.jsp");
			}
			
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
