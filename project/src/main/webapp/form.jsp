<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Uploaded Files</title>
</head>
<body>
    <form method="post" action="staff.jsp" enctype="multipart/form-data">
        <label for="file">Choose File:</label>
        <input type="file" id="file" name="file" required>
        <button type="submit">Upload</button>
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            
            String uploadPath = application.getRealPath("/") + "uploadimg/";
            File uploadDir = new File(uploadPath);

            
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Get the uploaded file
            Part filePart = request.getPart("file"); // Retrieve the file as a Part object
            String fileName = filePart.getSubmittedFileName(); // Extract the file name

            // Save the file in the uploads folder
            try (InputStream input = filePart.getInputStream();
                 FileOutputStream output = new FileOutputStream(uploadPath + fileName)) {

                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = input.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }

                
            } catch (Exception e) {
                out.println( e.getMessage());
            }

           
            Connection conn = null;
            Statement stmt = null;

            try {
               
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
                stmt = conn.createStatement();

          
                String insertQuery = "INSERT INTO uploaded_files (filename) VALUES ('uploadimg/" + fileName + "')";
                stmt.executeUpdate(insertQuery);
                out.println("<p>Filename saved to database: " + fileName + "</p>");
            } catch (Exception e) {
                out.println("<p>Error saving filename to database: " + e.getMessage() + "</p>");
            } finally {
                if (stmt != null) try { stmt.close(); } catch (Exception ignore) {}
                if (conn != null) try { conn.close(); } catch (Exception ignore) {}
            }
        }

            %>
</body>
</html>
