package com.project.servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            Connection con = DBConnection.getConnection();

            if("add".equals(action)) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String subject = request.getParameter("subject");

                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO COMPLAINT (NAME, EMAIL, SUBJECT, STATUS) VALUES (?, ?, ?, ?)"
                );
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, subject);
                ps.setString(4, "Pending");
                ps.executeUpdate();

                response.sendRedirect("studentStatus.jsp");

            } else if("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String status = request.getParameter("status");

                PreparedStatement ps = con.prepareStatement(
                    "UPDATE COMPLAINT SET STATUS=? WHERE ID=?"
                );
                ps.setString(1, status);
                ps.setInt(2, id);
                ps.executeUpdate();

                response.sendRedirect("viewComplaint.jsp");

            } else if("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));

                PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM COMPLAINT WHERE ID=?"
                );
                ps.setInt(1, id);
                ps.executeUpdate();

                response.sendRedirect("viewComplaint.jsp");
            }

        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error");
        }
    }
}
