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

//courseadd servlet implementation

@WebServlet("/add")
public class CourseAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CourseAdd() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher= null;
		Connection con = null;
		PreparedStatement pst = null;
		
		String course_code = request.getParameter("ccode");
		String course_name = request.getParameter("cname");
		String dept = request.getParameter("dept");
		String teacher = request.getParameter("teacher");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
			pst = con.prepareStatement("insert into courses(ccode,cname,dept,teacher) values(?,?,?,?)");
			
			pst.setString(1, course_code);
			pst.setString(2, course_name);
			pst.setString(3, dept);
			pst.setString(4, teacher);

			int rows = pst.executeUpdate();
			
			if(rows > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("homeA.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("courseadd.jsp");
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

}
