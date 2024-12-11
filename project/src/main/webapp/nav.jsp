<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Blood Bank</title>



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

</head>

<style>
    @import url("https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap");

    :root {
        --header-height: 3rem;
        --nav-width: 68px;
        --first-color: #ec1111;
        --first-color-light: #ffffff;
        --white-color: #F7F6FB;
        --body-font: 'Nunito', sans-serif;
        --normal-font-size: 1rem;
        --z-fixed: 100
    }

    *,
    ::before,
    ::after {
        box-sizing: border-box
       
    }

    body {
        position: relative;
        margin: var(--header-height) 0 0 0;
        padding: 0 1rem;
        font-family: var(--body-font);
        font-size: var(--normal-font-size);
        transition: .5s
        text-decoration: none;
    }

    a {
        text-decoration: none
    }

    .header {
        width: 100%;
        height: var(--header-height);
        position: fixed;
        top: 0;
        left: 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 1rem;
        
        z-index: var(--z-fixed);
        transition: .5s
    }

    .header_toggle {
        color: var(--first-color);
        font-size: 1.5rem;
        cursor: pointer
    }

    .header_img {
        width: 35px;
        height: 35px;
        display: flex;
        justify-content: center;
        border-radius: 50%;
        overflow: hidden
    }

    .header_img img {
        width: 40px
    }

    .l-navbar {
        position: fixed;
        top: 0;
        left: -30%;
        width: var(--nav-width);
        height: 100vh;
        background-color: var(--first-color);
        padding: .5rem 1rem 0 0;
        transition: .5s;
        z-index: var(--z-fixed)
    }

    .nav {
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        overflow: hidden
    }

    .nav_logo,
    .nav_link {
        display: grid;
        grid-template-columns: max-content max-content;
        align-items: center;
        column-gap: 1rem;
        padding: .5rem 0 .5rem 1.5rem
    }

    .nav_logo {
        margin-bottom: 2rem
    }

    .nav_logo-icon {
        font-size: 1.25rem;
        color: var(--white-color)
    }

    .nav_logo-name {
        color: var(--white-color);
        font-weight: 700
    }

    .nav_link {
        position: relative;
        color: var(--first-color-light);
        margin-bottom: 1.5rem;
        transition: .3s
    }

    .nav_link:hover {
        color: var(--white-color)
    }

    .nav_icon {
        font-size: 1.25rem
    }

    .show {
        left: 0
    }

    .body-pd {
        padding-left: calc(var(--nav-width) + 1rem)
    }

    .active {
        color: var(--white-color)
    }

    .active::before {
        content: '';
        position: absolute;
        left: 0;
        width: 2px;
        height: 32px;
        background-color: var(--white-color)
    }

    .height-100 {
        height: 100vh
    }

    @media screen and (min-width: 768px) {
        body {
            margin: calc(var(--header-height) + 1rem) 0 0 0;
            padding-left: calc(var(--nav-width) + 2rem)
        }

        .header {
            height: calc(var(--header-height) + 1rem);
            padding: 0 2rem 0 calc(var(--nav-width) + 2rem)
        }

        .header_img {
            width: 40px;
            height: 40px
        }

        .header_img img {
            width: 45px
        }

        .l-navbar {
            left: 0;
            padding: 1rem 1rem 0 0
        }

        .show {
            width: calc(var(--nav-width) + 156px)
        }

        .body-pd {
            padding-left: calc(var(--nav-width) + 188px)
        }
    }
</style>

<body>

    <!-- navbar -->

    <body id="body-pd">
        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
            
        </header>
        <div class="l-navbar" id="nav-bar">
            <nav class="nav" >

                <div> 

                    <div class="nav_list"> <a href="Admin.jsp" class="nav_link active" style="text-decoration: none;"> <i class='bx bx-grid-alt nav_icon'></i>
                            <span class="nav_name">Dashboard</span> </a>
                        
                            <a href="#" class="nav_link" style="text-decoration: none;"> <i class="fa-solid fa-hand-holding-medical" data-bs-toggle="modal" data-bs-target="#myModal2"></i> <span
                                class="nav_name" data-bs-toggle="modal"
                                data-bs-target="#myModal2" >Add New Donor</span> </a> 
                                
                                <a href="donor.jsp" class="nav_link" style="text-decoration: none;"> <i class="fa-solid fa-droplet"></i> 
                                    <span class="nav_name">Donor List</span>
                        
                            </a> <a href="managestock.jsp" class="nav_link" style="text-decoration: none;"> <i class="fa-regular fa-folder-open"></i> <span
                                class="nav_name">Manage Stock</span> </a>
                                
                                
                                <a href="request.jsp" class="nav_link" style="text-decoration: none;"><i class="fa-solid fa-clock-rotate-left"></i></i>
                                     <span class="nav_name">Blood Request</span> </a> 
                                
                                
                                <a href="complete.jsp"
                            class="nav_link" style="text-decoration: none;"> <i class="fa-solid fa-check"></i> <span
                                class="nav_name">Completed Request</span> </a>

                             
                             <a href="#" class="nav_link" style="text-decoration: none;"> <i class="fa-regular fa-user" data-bs-toggle="modal" data-bs-target="#myModal2"></i> <span
                                class="nav_name">Empolyees</span> </a>
                             
                    </div>
                </div> <a href="home.jsp" class="nav_link" style="text-decoration: none;"> <i class='bx bx-log-out nav_icon'></i> <span
                        class="nav_name">SignOut</span> </a>
            </nav>
        </div>


        <!-- navbar -->




        <script>
            document.addEventListener("DOMContentLoaded", function (event) {

                const showNavbar = (toggleId, navId, bodyId, headerId) => {
                    const toggle = document.getElementById(toggleId),
                        nav = document.getElementById(navId),
                        bodypd = document.getElementById(bodyId),
                        headerpd = document.getElementById(headerId)

                    // Validate that all variables exist
                    if (toggle && nav && bodypd && headerpd) {
                        toggle.addEventListener('click', () => {
                            // show navbar
                            nav.classList.toggle('show')
                            // change icon
                            toggle.classList.toggle('bx-x')
                            // add padding to body
                            bodypd.classList.toggle('body-pd')
                            // add padding to header
                            headerpd.classList.toggle('body-pd')
                        })
                    }
                }

                showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')

                /*===== LINK ACTIVE =====*/
                const linkColor = document.querySelectorAll('.nav_link')

                function colorLink() {
                    if (linkColor) {
                        linkColor.forEach(l => l.classList.remove('active'))
                        this.classList.add('active')
                    }
                }
                linkColor.forEach(l => l.addEventListener('click', colorLink))

                // Your code to run since DOM is loaded and ready
            });
        </script>
<!-- navbar -->











<form action="" method="post">
    <div class="modal" tabindex="-1" id="myModal2">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Name :</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1"
                            placeholder="Enter Your Name" required name="dname">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Phone Number:</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1"
                            placeholder="Enter Your Phone Number" required name="dnum">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Blood Group :</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1"
                            placeholder="Enter Your Blood Group" required name="dblood">
                    </div>
                    <div>
                        <label for="exampleFormControlTextarea1" class="form-label">Address :</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1"
                            placeholder="Enter Your Blood Group" required name="dadd">	
                    </div>
                </div>
                <div class="modal-body d-flex justify-content-center">

                    <button type="submit" class="btn btn-danger">Donate <i class="fa-solid fa-droplet"
                            style="margin-left:5px;"></i></button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- model -->



<%
    String dname = request.getParameter("dname");
    String dnum = request.getParameter("dnum");
    String dblood = request.getParameter("dblood");
    String dadd = request.getParameter("dadd");

    if (dname != null && dnum != null && dadd != null && dblood != null) {
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
            Statement stt = con1.createStatement();

            String query = "insert into donor (name, phone,blood,address) values ('" + dname + "', '" + dnum + "', '" + dblood +"', '" + dadd+"')";
            int i = stt.executeUpdate(query);
 
            
            stt.close();
            con1.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        out.println("");
    }
%>













<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      
    </div>
  </div>
</div>


















</body>
</html>