package com.project.servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Admin login
            if("admin".equals(username) && "admin123".equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("role", "admin");
                response.sendRedirect("viewComplaint.jsp");
                return;
            }

            // Student login
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM STUDENTS WHERE EMAIL=? AND PASSWORD=?"
            );
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("role", "student");
                session.setAttribute("student", username);
                response.sendRedirect("studentStatus.jsp");
            } else {
                response.sendRedirect("login.jsp?error=Invalid credentials");
            }

            con.close();
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error");
        }
    }
}
