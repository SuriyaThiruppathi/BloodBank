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

    <head>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />





        <style>
            nav ul li a:hover {
                text-decoration: underline;
            }

            nav {
                box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            }
        </style>
    </head>

<body>



    <!-- navbar -->

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="./img/Blood Bag Blood Bank Magnet.jpeg" alt="" class="img-fluid"
                    style="width: 40px; margin-top: -8px;">Blood Bank</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active " aria-current="page" href="#"
                            style="text-decoration: underline;">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#" data-bs-toggle="modal"
                            data-bs-target="#myModal">Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#" data-bs-toggle="modal"
                            data-bs-target="#myModal2">Doner</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="reciver.jsp">Reciver</a>
                    </li>
                </ul>

                <i class="fa-brands fa-facebook-f me-2"></i>
                <i class="fa-brands fa-instagram me-2"></i>
                <i class="fa-brands fa-twitter"></i>

            </div>
        </div>
    </nav>
    <!-- navbar -->



    <!-- mymodel -->
    <form action="" method="post">
    <div class="modal" tabindex="-1" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">User Name:</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1"
                            placeholder="Enter your name" required name="Aname">
                    </div>
                    <div>
                        <label for="exampleFormControlTextarea1" class="form-label">Password :</label>
                        <input type="password" class="form-control" id="exampleFormControlInput1"
                            placeholder="Enter your password" required name="Apass">
                    </div>
                </div>
                <div class="modal-body d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary" data-bs-dismiss="modal"
                        style="width: 200px;">Submit</button>

                </div>
            </div>
        </div>
    </div>
</form>

    <!-- mymodel -->


    <!-- model2 -->
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



    <!-- header -->

    <div class="container mt-4">
        <div class="row">
            <div class="col-lg-6 col-md-12 d-flex justify-content-lg-start justify-content-center">
                <img src="./img/Blood donation.gif" alt="" class="img-fluid" style="width: 400px;">
            </div>
            <div class="col-lg-6 col-md-12">
                <h3 class="text-center mt-5" style="color: red;">TYPES OF DONATION</h3>
                <p class="text-center">The average human body contains about five liters of blood, which is made of
                    several cellular and
                    non-cellular components such as Red blood cell, Platelet, and Plasma.</p>
                <p class="text-center">Each type of component has its unique properties and can be used for different
                    indications. The
                    donated blood is separated into these components by the blood centre and one donated unit can save
                    upto four lives depending on the number of components separated from your blood.</p>

                <p class="text-center">Blood Collected straight from the donor into a blood bag and mixed with an
                    anticoagulant is called as
                    whole blood</p>
            </div>
        </div>
    </div>

    <!-- header -->


    <!-- middle -->
    <div class="container mt-5">
        <div class="row">
            <div class="col">
                <h3 class="text-center">Enter Your Details To Request For Blood</h3>
            </div>
        </div>
        <form action="" method="post">
            <div class="row mt-2 d-flex justify-content-center">
                <div class="col-lg-3 mt-2"><input type="text" class="form-control" placeholder="Enter your name"
                        name="Rname"
                        style="box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px; border: radius 20px;">
                </div>
                <div class="col-lg-3 mt-2"><input type="text" class="form-control" placeholder="Enter your Number"
                        name="Rnum"
                        style="box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px; border: radius 20px;">
                </div>
                <div class="col-lg-3 mt-2"><input type="text" class="form-control" placeholder="Enter your Address"
                        name="Radd"
                        style="box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px; border: radius 20px;">
                </div>
                <div class="col-lg-3 mt-2"><input type="text" class="form-control" placeholder="Enter your Blood Group"
                        name="Rblood"
                        style="box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px; border: radius 20px;">
                </div>
            </div>
            <div class="row mt-4">
                <div class="col d-flex justify-content-center">
                    <button class="btn btn-primary" style="width: 150px;" type="submit">Submit</button>
                </div>
            </div>
        </form>
    </div>


    <!-- middle -->

    <!-- middle - after -->

    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-6 col-md-12 d-flex justify-content-lg-start justify-content-center">
                <img src="./img/Blood Bank Management - Birlamedisoft.jpeg" alt="" class="img-fluid" style="width: 500px;">
            </div>
            <div class="col-lg-6 col-md-12">
                <h3 class="text-center mt-5" style="color: red;">LEARN ABOUT DONATION</h3>

                <table class="table table-striped mt-4">

                    <tr>
                        <th class="text-center">Blood Type</th>
                        <th class="text-center">Donate Blood</th>
                        <th class="text-center">Receive Blood</th>
                    </tr>
                    <tr>
                        <td class="text-center" style="color: red;">A+</td>
                        <td class="text-center">A+ AB+</td>
                        <td class="text-center">A+ A- O+ O-</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="color: red;">O+</td>
                        <td class="text-center">O+ A+ B+ AB+</td>
                        <td class="text-center">O+ O-</td>
                    </tr>

                    <tr>
                        <td class="text-center" style="color: red;">B+</td>
                        <td class="text-center">B+ AB+</td>
                        <td class="text-center">B+ B- O+ O-</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="color: red;">AB+</td>
                        <td class="text-center">AB+</td>
                        <td class="text-center">Everyone</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="color: red;">A-</td>
                        <td class="text-center">A+ A- AB+ AB- </td>
                        <td class="text-center">A- O-
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center" style="color: red;">O-</td>
                        <td class="text-center">Everyone</td>
                        <td class="text-center">O-
                        </td>
                    </tr>


                </table>

            </div>
        </div>
    </div>









    <!-- middle - after -->

    <div class="container mt-5">
        <div class="row">
            <div class="col d-flex justify-content-lg-start justify-content-center mt-3">
                <div class="card" style="width: 18rem;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <img src="./img/Blood Bag Blood Bank Magnet.jpeg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text text-center">Blood Collected straight from the donor into a blood bag and
                            mixed with an anticoagulant is called as whole blood.</p>
                    </div>
                </div>
            </div>

            <div class="col d-flex justify-content-lg-start justify-content-center mt-3">
                <div class="card" style="width: 18rem;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <img src="./img/Download Blood Donation Awareness Concept Illustration for free (1).jpeg"
                        class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text text-center">This collected whole blood is then
                            centrifuged and red cell, platelets and plasma are separated is called as whole blood.</p>
                    </div>
                </div>
            </div>

            <div class="col d-flex justify-content-lg-start justify-content-center mt-3">
                <div class="card" style="width: 18rem;box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <img src="./img/Premium Vector _ Illustration of person donating blood.jpeg"
                        class="card-img-top img-fluid" alt="...">
                    <div class="card-body">
                        <p class="card-text text-center">Correction of severe anemia in a number of conditions and blood
                            loss in case of child birth, surgery or trauma settings.</p>
                    </div>
                </div>
            </div>

        </div>
    </div>







    


</body>

</html>







<%
    String Rname = request.getParameter("Rname");
    String Rnum = request.getParameter("Rnum");
    String Radd = request.getParameter("Radd");
    String Rblood = request.getParameter("Rblood");

    if (Rname != null && Rnum != null && Radd != null && Rblood != null) {
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
            Statement st = con.createStatement();

            String query = "insert into request (name, number,address,blood) values ('" + Rname + "', '" + Rnum + "', '" + Radd +"', '" + Rblood+"')";
            int i = st.executeUpdate(query);
 
            
            st.close();
            con.close();
        } catch (Exception e) {
            out.println();
        }
    } else {
        out.println();
    }
%>















<%
    String Aname = request.getParameter("Aname");
    String Apass = request.getParameter("Apass");
    
    
   
    
    Class.forName("com.mysql.jdbc.Driver");

    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");


    Statement st = con.createStatement();
    
    ResultSet rs = st.executeQuery (" select * from admin where name='"+Aname+"' and password='"+Apass+"'");


   

    try {
    	    rs.next();
        
    	     if (rs.getString("name").equals(Aname) && rs.getString("password").equals(Apass)) 
        	           { 
                          response.sendRedirect("Admin.jsp");
                     } 
        	        else 
        	          {
                          
        	        	response.sendRedirect("home.jsp");
                      
                      }
    	     
        	       
    	     

         }
           catch (Exception e) {
            
            out.println();
        }
           
 %>













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
 
            
            st.close();
            con.close();
        } catch (Exception e) {
            out.println();
        }
    } else {
        out.println("");
    }
%>






<div class="container mt-5">
        <h2 class="text-center mb-4">Avaliable Bloods</h2>
        <table class="table table-bordered text-center" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;">
            <thead class="table-success text-light table-hover">
                <tr>
                    <th>Blood Group</th>
                    <th>Avaliblities</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    String driver = "com.mysql.jdbc.Driver"; 
                    String connectionUrl = "jdbc:mysql://localhost:3306/";
                    String database = "bloodbank";
                    String username = "root";
                    String password = "";

                    try {
                        Class.forName(driver);
                        try (Connection connection = DriverManager.getConnection(connectionUrl + database, username, password);
                             Statement statement = connection.createStatement();
                             ResultSet resultSet = statement.executeQuery("select blood, count(*) AS numberofdonors from donor group by blood")) {
                            while (resultSet.next()) {
                %>
                                <tr>
                                    <td><%= resultSet.getString("blood") %></td>
                                    <td><%= resultSet.getInt("numberofdonors") %></td>
                                </tr>
                <%      }
                        }
                    } catch (ClassNotFoundException e) {
                        out.println("<tr><td colspan='2'>Database driver not found: " + e.getMessage() + "</td></tr>");
                    } catch (Exception e) {
                        out.println("<tr><td colspan='2'>Database error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>

    
    
    
       
       
       
       
       <!--footer-->
    <footer class="bg-dark text-white py-4 mt-5 text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>About Us</h5>
                    <p>Each type of component has its unique properties and can be used for different
                    indications. The
                    donated blood is separated into these components by the blood</p>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Home</a></li>
                        <li><a href="#" class="text-white">Admin</a></li>
                        <li><a href="#" class="text-white">Donor</a></li>
                        <li><a href="#" class="text-white">Reciver</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact Us</h5>
                    <ul class="list-unstyled">
                        <li><i class="fas fa-phone"></i> +91 951 435 3150</li>
                        <li><i class="fas fa-envelope"></i> support@bloodbank.com</li>
                        <li><i class="fas fa-map-marker-alt"></i> 123 Main Street, Villangudi, Madurai</li>
                    </ul>
                    <h5>Follow Us</h5>
                    <ul class="list-unstyled d-flex d-flex justify-content-center">
                        <li><a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="#" class="text-white me-3"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a href="#" class="text-white me-3"><i class="fab fa-whatsapp"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="text-center mt-4">
                <p>&copy; 2024 All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- footer --> 
    