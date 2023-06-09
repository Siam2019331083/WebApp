<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="styles.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
	<div> <input type="hidden" id="status" value="<%= request.getAttribute("status") %>"> </div>
   <!-- navbar -->
    <div class="antialised bg-gradient-to-b from-white to-purple-200 dark-mode:bg-gray-900 h-screen">
        <div class="flex justify-between items-center w-full text-gray-700 bg-purple-600 dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
            <div class="flex flex-row items-center justify-between p-4">
                <a href="/WebTechTask3" class="no-underline text-3xl text-gray-900 me-2 mt-1"><img src="photos/mortarboard.png" class="w-8 h-8"></i>
                </a>
                <a href="/WebTechTask3/homeA.jsp" class="text-xl font-semibold tracking-widest text-white uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
            </div>
            <div>
                <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                    <!-- <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-green-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/courseadd.html"><i class="fa-solid fa-plus"></i>  Add Courses</a> -->
                    <a class="px-4 py-2 mt-2 text-md text-white hover:border-black font-semibold bg-red-500 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline mr-10" href="/WebTechTask3/logout"><i class="fa-solid fa-right-from-bracket"></i>  Log Out</a>
                </nav>
            </div>
        </div>
        <div class="mt-14"> <!-- for body -->
            <div class="flex flex-1 items-center justify-center">
                <div class="rounded-xl sm:border-2 px-4 lg:px-24 py-16 lg:max-w-xl sm:max-w-md w-full text-center shadow-xl">
                    <form class="text-center" method = "post" action = "add">
                        <h1 class="font-bold tracking-wider text-2xl mb-8 w-full text-gray-600">
                            Add A New Course
                        </h1>
                        <div class="py-2 text-left">
                            <input required name = "ccode" type="text" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Course Code" />
                        </div>
                        <div class="py-2 text-left">
                            <input required type="text" name = "cname" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Course Name" />
                        </div>
                        <div class="py-2 text-left">
                            <input required type="text" name = "dept" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Department" />
                        </div>
                        <div class="py-2 text-left">
                            <select name="teacher" id="pos" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 ">
                                <option class="text-gray-600">Select Course Teacher</option>
                                
                                <!-- adds the course information in the database -->
                                <% try{
                                	Class.forName("com.mysql.cj.jdbc.Driver");
                    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root","password");
                    				PreparedStatement pst = con.prepareStatement("select name from teachers");
//                     				PrepareStatement pst2 = con.getPreparedStatement("select count(*) from teachers");
                    				
                    				ResultSet res = pst.executeQuery();
//                     				ResultSet res = pst2.executeStatement();
                                	while(res.next()){ %>
                                		<option value="<%= res.getString("name") %>"><%= res.getString("name") %></option>
                                	<% }
                                }catch(Exception e){
                                	e.printStackTrace();
                                }
                                %>
                                
                            </select>
                        </div>
                        <div class="py-2">
                            <button type="submit" class="border-2 border-gray-100 focus:outline-none bg-purple-600 text-white font-bold tracking-wider block w-full p-2 rounded-lg focus:border-gray-700 hover:bg-purple-700">
                                Add
                            </button>
                        </div>
                    </form>
                    <!-- <div class="text-center">
                        <a href="#" class="hover:underline">Forgot password?</a>
                    </div> -->
                    <!-- <div class="text-center mt-12">
                        <span>
                            Don't have an account?
                        </span>
                        <a href="#" class="font-light text-md text-indigo-600 underline font-semibold hover:text-indigo-800">Create One</a>
                    </div> -->
                </div>
            </div>
        </div>
        
    </div>
    
    <!-- pop up for successfully adding course -->
    <script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "success"){
			swal("Congrats", "Account Created Successfully", "success");
		}
	</script>
</body>
</html>