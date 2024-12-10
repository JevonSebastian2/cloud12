<%-- 
    Document   : view
    Created on : 8 Dec 2024, 23.51.17
    Author     : alghazii
--%>

<%@page import="classes.JDBC, java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Barang</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container my-5">
            <h3 class="text-center">Tabel Daftar Barang</h3>
            <% 
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
            %>
                <div class="alert alert-info" role="alert">
                    <%= msg %>
                </div>
                <%
                session.removeAttribute("msg");
            }
            %>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nama Barang</th>
                        <th>Unit</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                
                <%
                JDBC db = new JDBC();
                if (db.isConnected) {
                    ResultSet rs = db.getData("SELECT * FROM barang");
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("nama") %></td>
                    <td><%= rs.getInt("Unit") %></td>
                    <td>
                        <a href="edit.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary">Edit</a>
                    </td>
                </tr>
                <%
                    }
                    db.disconnect();
                } else {
                %>
                <tr>
                    <td colspan="4" class="text-center text-danger">
                        <%= db.message %>
                    </td>
                </tr>
                <% } %>
            </tbody>
       </table>
       <div class="text-center">
            <a href="add.jsp" class="btn btn-success"> Tambahkan barang</a>
         </div>
       </div>
    
    <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>            
    </body>
</html>

