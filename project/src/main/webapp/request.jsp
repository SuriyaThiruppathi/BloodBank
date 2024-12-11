<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 

<%@ include file="nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet" 
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Requestor Details</h2>
        <table class="table table-bordered text-center" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;">
            <thead class="table-primary">
                <tr>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Request Blood</th>
                    <th>Accepted</th>
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
                             ResultSet resultSet = statement.executeQuery("select * from request")) {
                            while (resultSet.next()) {
                %>
                                <tr>
                                    <td><%= resultSet.getString("name") %></td>
                                    <td><%= resultSet.getString("number") %></td>
                                    <td><%= resultSet.getString("address") %></td>
                                    <td><%= resultSet.getString("blood") %></td>
                                    <td>
                                        
                                        
                                        <button type="button" style="border:none; width:50px; margin-right:30px; border-radius:10px; background-color:green;">
                                            <a href="complete.jsp?name=<%=resultSet.getString("name")%>" 
                                               style="text-decoration: none; color:white;">
                                               <i class="fa-solid fa-check"></i>
                                            </a>
                                        </button>

                                        
                                        
                                        <button type="button" style="border:none; width:50px; margin-right:30px; border-radius:10px; background-color:red;">
                                            <a href="request.jsp?name=<%=resultSet.getString("name")%>" 
                                               style="text-decoration: none; color:white;">
                                               <i class="fa-solid fa-xmark"></i>
                                            </a>
                                        </button>
                                    </td>
                                 </tr>
                                    
                                    
                                   
                                  
                                   
                                    
                <%
                            }
                        }
                    } catch (ClassNotFoundException e) {
                        out.println("<tr><td colspan='5'>Database driver not found: " + e.getMessage() + "</td></tr>");
                    } catch (SQLException e) {
                        out.println("<tr><td colspan='5'>Database error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
        <%
            String name = request.getParameter("name");
            if (name != null) {
                try {
                    Class.forName(driver);
                    try (Connection connection = DriverManager.getConnection(connectionUrl + database, username, password)) {
                        Statement statement = connection.createStatement();
                        String deleteQuery = "delete from request where name = '" + name + "'"; 
                        int rowsAffected = statement.executeUpdate(deleteQuery);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                }
            }
        %>




    </div>
</body>
</html>
