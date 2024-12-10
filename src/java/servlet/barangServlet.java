/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import classes.JDBC;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alghazii
 */
@WebServlet(name = "barangServlet", urlPatterns = {"/product/barangServlet"})
public class barangServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JDBC db = new JDBC(); 
        String action = request.getParameter("action");
        String msg = "";
           
        if (db.isConnected) {
            try {
                if (action.equals("add")) {
                    String nama = request.getParameter("nama");
                    int unit = Integer.parseInt(request.getParameter("unit"));
                    String query = "INSERT INTO barang (nama, unit) VALUES ('" + nama + "', " + unit + ")";
                    db.runQuery(query);
                    msg = db.message;
                } else if (action.equals("edit")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String nama = request.getParameter("nama");
                    int unit = Integer.parseInt(request.getParameter("unit"));
                    String query = "UPDATE barang SET nama='" + nama + "', unit=" + unit + " WHERE id=" + id;
                    db.runQuery(query);
                    msg = db.message;
                }
            } catch (Exception e) {
                msg = "Error: " + e.getMessage();
            } finally {
                db.disconnect();
            }
            
        } else {
            msg = "Tidak dapat terhubung ke database";
        }

        request.getSession().setAttribute("msg", msg);
        response.sendRedirect("http://localhost:8080/Tp13/index.jsp");

   
    }
}

