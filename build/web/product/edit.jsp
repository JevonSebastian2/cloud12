<%-- 
    Document   : edit
    Created on : 8 Dec 2024, 23.51.12
    Author     : alghazii
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, intial-scale=1.0">
        <title>Edit Barang</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container my-5">
            <div class="card">
                <div class="card-header text-center">
                    <h3>Edit Barang</h3>
                </div>
                <div class="card-body">
                    <form method="POST" action="barangServlet?action=edit">
                        <!-- Hidden Input for ID -->
                        <input type="hidden" id="id" name="id" value="<%= request.getParameter("id") %>">
                        
                        <!-- Nama Input -->
                        <div class="mb-3">
                            <label for="nama" class="form-label">Nama</label>
                            <input type="text" id="nama" name="nama" class="form-control" required>
                        </div>
                        
                        <!-- Unit Input -->
                        <div class="mb-3">
                            <label for="unit" class="form-label">Unit</label>
                            <input type="text" id="unit" name="unit" class="form-control" required>
                        </div>
                        
                        <!-- Submit Button -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <a href="view.jsp" class="btn btn-secondary">Cancel</a> </div>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>            
    </body>
</html>
