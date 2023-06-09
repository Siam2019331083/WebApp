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

//accept servlet implementation

@WebServlet("/accept")
public class Accept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Accept() {
        super();
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher dispatcher= null;
		Connection con = null;
		PreparedStatement pst = null;
		HttpSession session = request.getSession();
		
		String course_code = request.getParameter("ccode");
		String course_name = request.getParameter("cname");
		String dept = request.getParameter("dept");
		String teacher = request.getParameter("teacher");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
			pst = con.prepareStatement("insert into acourses(ccode,cname,dept,teacher) values(?,?,?,?)");
			
			pst.setString(1, course_code);
			pst.setString(2, course_name);
			pst.setString(3, dept);
			pst.setString(4, teacher);

			int rows = pst.executeUpdate();
			if(rows > 0) {
				request.setAttribute("status", "success");
				response.sendRedirect("homeT.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("homeT.jsp");
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
