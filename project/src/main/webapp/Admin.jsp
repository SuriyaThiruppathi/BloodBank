<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ include file="nav.jsp" %> 

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<% 
    String driver = "com.mysql.jdbc.Driver"; 
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "bloodbank";
    String username = "root";
    String password = "";

    String[] bloodTypes = {"A+ve", "B+ve", "AB+ve", "O+ve"};

    try {
        Class.forName(driver);
        try (Connection connection = DriverManager.getConnection(connectionUrl + database, username, password)) {
%>

    <div class="container mt-5">
        <div class="row">
            <% 
                for (String bloodType : bloodTypes) {
                    try (Statement statement = connection.createStatement();
                         ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) AS numberofdonors FROM donor WHERE blood = '" + bloodType + "'")) {
                        if (resultSet.next()) {
                            int count = resultSet.getInt("numberofdonors");
            %>
            <div class="col-2 text-center" style="width: 200px; height:100px; border-radius: 10px; background-color: red; color: white;">
                <p class="mt-2"><i class="fa-solid fa-droplet" style="margin-right: 10px;"></i><%= count %> Units</p>
                <p><%= bloodType %> <br>Available Bloods</p>
            </div>
            <div class="col-1"></div>
            <% 
                        }
                    }
                }
            %>
        </div>

        <div class="row mt-5">
            <div class="col-lg-6">
                <img src="./img/Blood test-amico.png" alt="" class="img-fluid" style="width: 400px;">
            </div>
            <div class="col-lg-6 col-md-12">
                <table class="table table-bordered text-center" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;">
                    <thead class="table-primary">
                        <tr>
                            <th>Blood Group</th>
                            <th>Availabilities</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            try (Statement statement = connection.createStatement();
                                 ResultSet resultSet = statement.executeQuery("SELECT blood, COUNT(*) AS numberofdonors FROM donor GROUP BY blood")) {
                                while (resultSet.next()) {
                        %>
                        <tr>
                            <td><%= resultSet.getString("blood") %></td>
                            <td><%= resultSet.getInt("numberofdonors") %></td>
                        </tr>
                        <%      
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row mt-5">
            <% 
                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) AS numberofrequests FROM request")) {
                    if (resultSet.next()) {
                        int totalRequests = resultSet.getInt("numberofrequests");
            %>
            <div class="col">
                <div style="width: 300px; height: 100px; border-radius: 10px; text-align: center; padding: 10px; box-shadow: rgba(6, 24, 44, 0.4) 0px 0px 0px 2px, rgba(6, 24, 44, 0.65) 0px 4px 6px -1px, rgba(255, 255, 255, 0.08) 0px 1px 0px inset;">
                    <h4>Total Requests</h4>
                    <p><%= totalRequests %></p>
                </div>
            </div>
            <% 
                    }
                }

                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) AS numberofdonors FROM donor")) {
                    if (resultSet.next()) {
                        int totalDonors = resultSet.getInt("numberofdonors");
            %>
            <div class="col">
                <div style="width: 300px; height: 100px; border-radius: 10px; text-align: center; padding: 10px; box-shadow: rgba(6, 24, 44, 0.4) 0px 0px 0px 2px, rgba(6, 24, 44, 0.65) 0px 4px 6px -1px, rgba(255, 255, 255, 0.08) 0px 1px 0px inset;">
                    <h4>Total Donors</h4>
                    <p><%= totalDonors %></p>
                </div>
            </div>
            <% 
                    }
                }
            %>
        </div>
    </div>

<%
        }
    } catch (ClassNotFoundException e) {
        out.println("Database driver not found: " + e.getMessage());
    } 
%>
</body>
</html>
