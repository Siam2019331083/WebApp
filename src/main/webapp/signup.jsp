<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- this is the signup page for teacher,admin or student -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="styles.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
	<div> <input type="hidden" id="status" value="<%= request.getAttribute("status") %>"> </div>
	
	<!-- navbar -->
    <div class="antialised bg-gradient-to-b from-white to-purple-200 dark-mode:bg-gray-900 h-screen">
        <div class="flex justify-between items-center w-full text-white bg-purple-600 dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
            <div class="flex flex-row items-center justify-between p-4">
                <a href="/WebTechTask3" class="no-underline text-3xl text-gray-900 me-2 mt-1"><img src="photos/mortarboard.png" class="w-8 h-8"></i>
                </a>
                <a href="/WebTechTask3/landing.jsp" class="text-xl font-semibold tracking-widest text-white uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
            </div>
            <div>
                <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                    </nav>
            </div>
        </div>
        
        <!-- main section -->
        <div class="mt-14">
            <div class="flex flex-1 items-center justify-center">
                <div class="rounded-xl sm:border-2 px-4 lg:px-24 py-16 lg:max-w-xl sm:max-w-md w-full text-center shadow-xl">
                    <form class="text-center" method="post" action = "register">
                        <h1 class="font-bold tracking-wider text-2xl mb-8 w-full text-gray-600">
                            Create A New Account
                        </h1>
                        <div class="py-2 text-left">
                            <input required type="text" name = "username" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Username" />
                        </div>
                        <div class="py-2 text-left">
                            <input required type="text" name = "name" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Name" />
                        </div>
                        <div class="py-2 text-left">
                            <input required type="email" name = "email" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Email" />
                        </div>
                        <div class="py-2 text-left">
                            <input required type="password" name = "password" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 " placeholder="Password" />
                        </div>
                        <div class="py-2 text-left">
                            <select required name="position" id="pos" class="bg-gray-200 border-2 border-gray-100 focus:outline-none bg-gray-100 block w-full py-2 px-4 rounded-lg focus:border-gray-700 ">
                                <option class="text-gray-600">Select your designation</option>
                                <option value="student">Student</option>
                                <option value="teacher">Teacher</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <div class="py-2">
                            <button type="submit" class="border-2 border-gray-100 focus:outline-none bg-purple-600 text-white font-bold tracking-wider block w-full p-2 rounded-lg focus:border-gray-700 hover:bg-purple-700">
                                Sign Up
                            </button>
                        </div>
                    </form>
                   
                </div>
            </div>
        </div>
        
    </div>
    
    <!-- pop up for wrong input -->
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "success"){
			swal("Congrats", "Account Created Successfully", "success");
		}
	</script>
	
</body>
</html>