<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%
	if(session.getAttribute("name")==null || !session.getAttribute("role").equals("admin")){
		response.sendRedirect("loginA.jsp");
	}
%>

<!-- this is the homepage for admin -->

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
<body class="overflow-x-hidden">

  <!-- navbar -->
    <div class="flex justify-between items-center w-full text-gray-700 bg-purple-700 dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
        <div class="flex flex-row items-center justify-between p-4">
            <a href="/WebTechTask3" class="no-underline text-3xl text-gray-900 me-2 mt-1"><img src="photos/mortarboard.png" class="w-8 h-8"></i>
            </a>
            <a href="/WebTechTask3/homeA.jsp" class="text-xl font-semibold tracking-widest text-white uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
        </div>
        <div>
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-purple-200 text-purple-800 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/courseadd.jsp"> Add Courses</a>
                <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-purple-200 text-purple-800 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/logout"> Log Out</a>
                <a class="px-4 py-2 mr-6 mt-2 text-md border border-gray hover:border-black font-semibold bg-purple-200 text-purple-800 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#"><i class="fa-solid fa-user"></i>  <%= session.getAttribute("name") %> </a>
            </nav>
        </div>
    </div>
    
    <!-- showing information of all the students who have created account-->
    <div>
        <div class="mx-16 mt-16 mb-6 text-2xl text-center py-2 shadow-lg shadow-purple-500 text-purple-800 font-semibold tracking-widest">
            Students
        </div>
        <div class="px-20 h-60 overflow-x-hidden overflow-y-auto">
        <table class="mt-6 w-full leading-normal">
            <thead>
                <tr>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-purple-600 text-center text-s font-semibold text-white uppercase tracking-wider">
                        Name
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-purple-600 text-center text-s font-semibold text-white uppercase tracking-wider">
                        Username
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-purple-600 text-center text-s font-semibold text-white uppercase tracking-wider">
                        Email
                    </th>
                    <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-purple-600 text-center text-s font-semibold text-white uppercase tracking-wider">
                        Password
                    </th>
                    
                </tr>
            </thead>
            <tbody>
            
            <!-- gets student information from the database -->
            <% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
                    				PreparedStatement pst = con.prepareStatement("select * from students");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet res = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(res.next()){ %>
                <tr class="odd:bg-purple-100 even:bg-purple-200">
                    <td class="px-5 py-2 border-b border-gray-200 text-sm">
                        <div class="flex justify-center">
                                <div>
                                    <p class="text-gray-900 font-semibold whitespace-no-wrap">
                                        <%= res.getString("name") %>
                                    </p>
                                </div>
                            </div>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm text-center">
                        <p class="text-gray-900 whitespace-no-wrap"><%= res.getString("username") %></p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm text-center">
                        <p class="text-gray-900 whitespace-no-wrap">
							<%= res.getString("email") %>
                        </p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm text-center">
                        <p class="text-gray-900 whitespace-no-wrap">
                            <%= res.getString("password") %>
                        </p>
                    </td>
                    
                </tr>
                <%}
            		}catch(Exception e){
            			e.printStackTrace();
            		}
                %>
            </tbody>
        </table>
    </div>
    </div>
</div>
</div>
    </div>
    
    <!-- showing information of all the teachers who have acocunt -->
    <div>
        <div class="mx-16 mt-16 mb-6 text-2xl py-2 shadow-lg shadow-purple-500 font-semibold tracking-widest text-center text-purple-800">
            Teachers
        </div>
        <div class="px-20 h-60 overflow-x-hidden overflow-y-auto">
            <table class="mt-6 w-full leading-normal">
                <thead>
                    <tr>
                        <th
                            class="px-5 py-3 border-b-2 border-gray-200 bg-purple-600 text-center text-s font-semibold text-white uppercase tracking-wider">
                            Name
                        </th>
                        <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-purple-600 text-center text-s font-semibold text-white uppercase tracking-wider">
                            Username
                        </th>
                        <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-purple-600 text-center text-s font-semibold text-white uppercase tracking-wider">
                            Email
                        </th>
                        <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-purple-600 text-center text-s font-semibold text-white uppercase tracking-wider">
                            Password
                        </th>
                       
                    </tr>
                </thead>
                <tbody class="overflow-y-auto">
                
                <!-- gets teachers information from the database -->
                    <% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
                    				PreparedStatement pst = con.prepareStatement("select * from teachers");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet rs = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(rs.next()){ %>
                <tr class="odd:bg-purple-100 even:bg-purple-200">
                    <td class="px-5 py-2 border-b border-gray-200 text-sm">
                        <div class="flex justify-center">
                                <div>
                                    <p class="text-gray-900 font-semibold whitespace-no-wrap">
                                        <%= rs.getString("name") %>
                                    </p>
                                </div>
                            </div>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm text-center">
                        <p class="text-gray-900 whitespace-no-wrap"><%= rs.getString("username") %></p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm text-center">
                        <p class="text-gray-900 whitespace-no-wrap">
							<%= rs.getString("email") %>
                        </p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm text-center">
                        <p class="text-gray-900 whitespace-no-wrap">
                            <%= rs.getString("password") %>
                        </p>
                    </td>
                    
                </tr>
                <%}
            		}catch(Exception e){
            			e.printStackTrace();
            		}
                %>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- showing all the courses avaible -->
    <div>
        <div class="mx-16 mt-16 py-4 text-2xl font-semibold tracking-widest text-purple-800 text-center shadow-lg shadow-purple-500">
            ALL The Courses
        </div>
            <div class="flex flex-col md:flex-row space-x-0 md:space-x-8 gap-2 space-y-12  md:space-y-0 justify-left items-center mx-16 pt-10 pb-16 overflow-x-auto overflow-y-hidden">
                
                <!-- gets all the course information from the database -->
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
                        <div class="mt-3 font-semibold text-lg text-purple-800"><%= rs.getString("cname") %></div>
                        <div class="text-sm font-light">Dept. of  <span class="font-semibold text-purple-800"><%= rs.getString("dept") %></span></div>
                        <div class="my-3">
                            <span class="font-light text-base">Course Teacher:</span>
                            <span class="font-semibold text-md text-purple-800"><%= rs.getString("teacher") %></span>
                        </div>
                      </div>
                        <div class="flex justify-around">
                            <button class="bg-blue-500 px-4 py-2 rounded-lg shadow-xl mt-4 hover:bg-blue-600 text white">
                                Edit
                            </button>
                            <a href="WebTechTask3/delete">
                            <button type="submit" id = "delButton" class="bg-red-500 px-3 py-2 rounded-lg shadow-xl mt-4 hover:bg-red-600">
                                 Delete
                            </button>
                            </a> 
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
       <script>
        	var button = document.getElementById("delButton");
        	button.onclick = function(){
        		console.log("clicked!");
        	}
        </script>    
</body>
</html>