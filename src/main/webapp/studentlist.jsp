<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- this page is for showing students who have enrolled in a course -->
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
    <div class="flex justify-between items-center w-full bg-purple-600 dark-mode:text-gray-200 dark-mode:bg-gray-800 shadow-lg">
        <div class="flex flex-row items-center justify-between p-4">
            <a href="/WebTechTask3" class="no-underline text-3xl text-gray-900 me-2 mt-1"><img src="photos/mortarboard.png" class="w-8 h-8"></i>
            </a>
            <a href="/landing.jsp" class="text-xl font-semibold tracking-widest text-white uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Course Manager</a>
        </div>
        <div>
            <nav :class="{'flex': open, 'hidden': !open}" class="flex-col flex-grow hidden pb-4 md:pb-0 md:flex md:justify-end md:flex-row">
                <!-- <a class="px-4 py-2 mt-2 text-md border border-gray hover:border-black font-semibold bg-green-200 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/courseadd.html"><i class="fa-solid fa-plus"></i>  Add Courses</a> -->
                <a class="px-4 py-2 mt-2 text-md text-white hover:border-black font-semibold bg-red-500 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="/WebTechTask3/logout"><i class="fa-solid fa-right-from-bracket"></i>  Log Out</a>
                <a class="px-4 py-2 mr-6 mt-2 text-md border border-gray hover:border-black font-semibold bg-purple-200 text-purple-800 rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#"><i class="fa-solid fa-user"></i>  <%= session.getAttribute("name") %> </a>
             </nav>
        </div>
    </div>
    
    <!-- showing the information of the students in a table -->
    <div>
        <div class="mx-16 mt-16 py-3 text-purple-800 text-3xl font-semibold tracking-widest shadow-lg shadow-purple-500 text-center">
            Students List for this course
        </div>
        <div class="mx-10 overflow-x-hidden flex justify-center">
        <table class="mt-10 leading-normal rounded-lg">
            <thead>
                <tr>
                    <th
                        class="px-20 py-3 border-b-2 border-gray-200 bg-purple-600 text-white text-center text-s font-semibold uppercase tracking-wider">
                        Name
                    </th>
                    <th
                        class="px-20 py-3 border-b-2 border-gray-200 bg-purple-600 text-white text-center text-s font-semibold uppercase tracking-wider">
                        Email
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr class="odd:bg-purple-100 even:bg-purple-200">
                    <td class="px-20 py-2 border-b border-gray-200 text-sm">
                        <div class="flex justify-left">
                                <div>
                                    <p class="text-gray-900 font-semibold whitespace-no-wrap">
                                        Tasnimul Siam
                                    </p>
                                </div>
                            </div>
                    </td>
                    <td class="px-20 py-5 border-b border-gray-200 text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
                            siam83@gmail.com
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </div>
    
</body>
</html>