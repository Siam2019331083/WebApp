<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--This is the landing page of the website 
which page will be loaded first when entering the website -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Manager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/styles.css">
</head>


<body>
    <div class="bg-[url('photos/lbg1.jpg')] bg-cover bg-no-repeat bg-center h-screen">

        <!--navbar containing logo,name and signup option -->
        
        <div class="flex justify-between items-center w-full text-gray-700 dark-mode:text-gray-200 dark-mode:bg-gray-800">
            <div class="flex flex-row items-center justify-between p-4">
                <a href="/WebTechTask3" class="no-underline text-3xl text-white ms-16 me-2 mt-1"><img src="photos/mortarboard.png" class="w-10 h-10"></i>
                </a>
                <a href="/WebTechTask3" class="text-xl font-semibold tracking-widest text-white uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
            </div>
            <div>
                <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                    <a href="/WebTechTask3/signup.jsp" class="inline-flex items-center justify-center px-5 py-3 mr-16 text-base font-medium text-center text-white rounded-lg bg-purple-600 hover:bg-purple-800 focus:ring-4 focus:ring-blue-300 dark-mode:focus:ring-blue-900">SignUp</a>
                    </nav>
            </div>
        </div>

        <!-- main section of landing page -->
        <section class="dark-mode:bg-gray-900 mt-20">
     
            <div class="grid max-w-screen-xl py-8 mx-auto gap-10 lg:py-16 lg:grid-cols-12 ">
                <div class="hidden lg:mt-0 lg:col-span-7 lg:flex">
                
                </div> 
                <div class="ms-20 mt-20 place-self-center lg:col-span-5 w-full">
                    <h1 class="max-w-2xl mb-4 text-3xl font-extrabold leading-none md:text-5xl xl:text-5xl dark-mode:text-white text-purple-800">Manage your courses with ease!</h1>
                    <p class="max-w-2xl mb-6 font-light text-white lg:mb-8 md:text-lg lg:text-xl dark-mode:text-gray-400">Course Manager is a tool for both Students and Teachers. Now you can explore your courses, choose whichever you are looking for and manage them all in one place.</p>
                    <p class="max-w-2xl mb-6 font-bold lg:mb-8 md:text-xl lg:text-xl dark-mode:text-gray-400 text-purple-800">What's your role?</p>

                    <!--student login option-->
                    <a href="/WebTechTask3/homeS.jsp" class="inline-flex items-center justify-center px-5 py-3 mr-3 text-base font-medium text-center text-white rounded-lg bg-purple-600 hover:bg-purple-800 focus:ring-4 focus:ring-blue-300 dark-mode:focus:ring-blue-900">
                        Student
                        
                    </a>

                    <!--teacher login option-->
                    <a href="/WebTechTask3/homeT.jsp" class="inline-flex items-center justify-center px-5 py-3 mr-3 text-base font-medium text-center text-white rounded-lg bg-purple-600 hover:bg-purple-800 focus:ring-4 focus:ring-blue-300 dark-mode:focus:ring-blue-900">
                        Teacher
                    </a>

                    <!--admin login option-->
                    <a href="/WebTechTask3/homeA.jsp" class="inline-flex items-center justify-center px-5 py-3 text-base font-medium text-center text-purple-700 border border-gray-300 bg-white rounded-lg hover:bg-purple-700 hover:text-white focus:ring-4 focus:ring-gray-100 dark-mode:text-white dark-mode:border-gray-700 dark-mode:hover:bg-gray-700 dark-mode:focus:ring-gray-800">
                        Admin
                    </a> 
                </div>
                                
            </div>
        </section>
    </div>

    <!--footer of the landing page--> 
    <footer class="h-24 bg-purple-700 pt-8">
        <div class="text-center text-white">
            <h3> &copy; 2023 Course Manager - All rights reserved</h3>
        </div>
    </footer>
</body>
</html>