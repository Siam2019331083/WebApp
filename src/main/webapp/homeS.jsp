<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("name")==null || !session.getAttribute("role").equals("student")){
		response.sendRedirect("loginS.jsp");
	}
%>

<!-- this is the homepage for student -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/2494fc36bc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
   <!-- navbar -->
    <div class="flex justify-between bg-purple-600 items-center w-full text-gray-700 dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
        <div class="flex flex-row items-center justify-between p-4">
            <a href="/WebTechTask3" class="no-underline text-3xl text-gray-900 me-2 mt-1"><img src="photos/mortarboard.png" class="w-8 h-8"></i>
            </a>
            <a href="/WebTechTask3/homeS.jsp" class="text-xl font-semibold tracking-widest text-white uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
        </div>
        <div>
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                <!-- <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-green-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/logint.html"><i class="fa-solid fa-plus"></i>  Add Courses</a> -->
                <a class="px-4 py-2 mt-2 text-md text-white hover:border-black font-semibold bg-red-500 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/logout"><i class="fa-solid fa-right-from-bracket"></i>  Log Out</a>
                <a class="px-4 py-2 mr-6 mt-2 text-md text-purple-800 bg-purple-200 hover:border-black font-semibold rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#"><i class="fa-solid fa-user"></i>  <%= session.getAttribute("name") %> </a>
            </nav>
        </div>
    </div>
    
    <!-- showing all the courses the student has enrolled in -->
    <div>
        <div class="mx-16 mt-16 py-2 text-center text-purple-800 text-2xl font-semibold tracking-widest shadow-lg shadow-purple-500">
            Your Courses
        </div>
            <div class="flex flex-col md:flex-row space-x-0 md:space-x-8 space-y-12 gap-2 md:space-y-0 justify-left items-center mx-16 pt-10 pb-16 overflow-x-auto overflow-y-hidden">
				
				<!-- gets all the enrolled course information from the database -->
				<% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
                    				PreparedStatement pst = con.prepareStatement("select * from stcourses where student = ?");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				pst.setString(1, String.valueOf(session.getAttribute("name")));
                    				
                    				ResultSet rs = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(rs.next()){ %>
                <div class="bg-purple-600 rounded-xl">
                    <div class="flex flex-col p-8 rounded-xl bg-purple-200 shadow-xl shadow-purple-400 translate-x-4 translate-y-4 w-96 h-80 md:w-64 justify-between">
                        <!-- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Ice_logo.svg/138px-Ice_logo.svg.png?20191213230535" class="w-8"> -->
                        <div>
                            <div class="text-md"><%= rs.getString("ccode") %></div>
                        <div class="mt-3 font-semibold text-purple-800 text-lg"><%= rs.getString("cname") %></div>
                        <div class="text-sm font-light">From dept. of  <span class="font-semibold text-purple-800"><%= rs.getString("dept") %></span></div>
                        <div class="my-3">
                            <span class="font-light text-base">Course Teacher:</span>
                            <span class="font-bold text-purple-800 text-md"> <%= rs.getString("teacher") %></span>
                        </div>

                        </div>
                        <div>
                            <button class="bg-green-500 font-semibold text-black px-4 py-3 rounded-lg shadow-xl mt-4 cursor-text">
                                Enrolled
                            </button>
                        </div>
                        
                    </div>
                </div>
                <%}
            		}catch(Exception e){
            			e.printStackTrace();
            		}
                %>
            </div>
        </div>

    <!-- showing all the courses available to take -->
    <div>
        <div class="mx-16 text-center mt-16 py-2 text-2xl text-purple-800 font-semibold tracking-widest shadow-lg shadow-purple-500">
            ALL The Courses
        </div>
            <div class="flex flex-col md:flex-row space-x-0 md:space-x-8 space-y-12  md:space-y-0 justify-left items-center gap-2 mx-16 pt-10 pb-20 overflow-x-auto overflow-y-hidden">
                <!-- gets all the courses information from the database -->
                <% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
                    				PreparedStatement pst = con.prepareStatement("select * from courses");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet rs = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(rs.next()){ %>
                <div class="bg-purple-600 rounded-xl">
                    <div class="flex flex-col p-8 rounded-xl bg-purple-200 shadow-xl shadow-purple-400 translate-x-4 translate-y-4 w-96 h-80 md:w-64 justify-between">
                        <!-- <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Ice_logo.svg/138px-Ice_logo.svg.png?20191213230535" class="w-8"> -->
                      <div>
                        <div class="text-md"><%= rs.getString("ccode") %></div>
                        <div class="mt-3 font-semibold text-purple-800 text-lg"><%= rs.getString("cname") %></div>
                        <div class="text-sm font-light">From dept. of  <span class="font-semibold text-purple-800"><%= rs.getString("dept") %></span></div>
                        <div class="my-3">
                            <span class="font-light text-base">Course Teacher:</span>
                            <span class="font-bold text-purple-800 text-md"> <%= rs.getString("teacher") %></span>
                        </div>
                        
                      </div> 
                        
			<a href="/WebTechTask3/enroll?ccode=<%= rs.getString("ccode") %>&cname=<%= rs.getString("cname") %>&dept=<%= rs.getString("dept") %>&teacher=<%= rs.getString("teacher") %>">
                        <button class="bg-green-500 px-4 py-3 font-semibold rounded-lg shadow-xl mt-4 hover:bg-green-400">
                            <i class="fa-solid fa-file-pen"></i>  Enroll
                        </button>						
                        </a>
                        
                    </div>
                </div>
                <%}
            		}catch(Exception e){
            			e.printStackTrace();
            		}
                %>
            </div>
        </div>
             
</body>
</html>
