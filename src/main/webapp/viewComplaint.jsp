<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.project.servlet.DBConnection" %>

<%

    // Only allow admin to access this page

    if(session == null || session.getAttribute("role") == null
       || !"admin".equals(session.getAttribute("role"))){

        response.sendRedirect("login.jsp");
        return;

    }

%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard - Complaint System</title>


    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- Bootstrap Icons -->

    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <style>

        * {
            box-sizing: border-box;
        }


        body {

            margin: 0;

            background: #f7f9fc;

            color: #1f2937;

            font-family: "Segoe UI", Arial, sans-serif;

        }


        /* ================= NAVBAR ================= */

        .navbar-custom {

            background: #ffffff;

            height: 76px;

            border-bottom: 1px solid #e8edf3;

        }


        .navbar-brand {

            font-size: 21px;

            font-weight: 700;

            color: #155eef !important;

            text-decoration: none;

        }


        .brand-icon {

            width: 40px;

            height: 40px;

            background: #eaf1ff;

            color: #155eef;

            border-radius: 10px;

            display: inline-flex;

            align-items: center;

            justify-content: center;

            margin-right: 10px;

        }


        .logout-link {

            color: #dc3545;

            text-decoration: none;

            font-weight: 600;

            font-size: 14px;

        }


        .logout-link:hover {

            color: #b02a37;

        }


        /* ================= DASHBOARD ================= */

        .dashboard {

            padding: 45px 0 70px;

        }


        .dashboard-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 30px;

        }


        .dashboard-title {

            display: flex;

            align-items: center;

            gap: 14px;

        }


        .dashboard-icon {

            width: 50px;

            height: 50px;

            background: #eaf1ff;

            color: #155eef;

            border-radius: 10px;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 22px;

        }


        .dashboard-title h1 {

            margin: 0;

            font-size: 30px;

            font-weight: 700;

            color: #111827;

        }


        .dashboard-title p {

            margin: 4px 0 0;

            color: #6b7280;

            font-size: 14px;

        }


        .admin-badge {

            background: #eaf1ff;

            color: #155eef;

            padding: 8px 14px;

            border-radius: 20px;

            font-size: 13px;

            font-weight: 600;

        }


        /* ================= TABLE CARD ================= */

        .table-card {

            background: #ffffff;

            border: 1px solid #e5eaf1;

            border-radius: 14px;

            overflow: hidden;

        }


        .table-responsive {

            margin: 0;

        }


        .complaint-table {

            margin: 0;

            min-width: 1000px;

        }


        .complaint-table thead th {

            background: #f5f8ff;

            color: #374151;

            border-bottom: 1px solid #dfe6f0;

            padding: 17px 16px;

            font-size: 13px;

            font-weight: 700;

            white-space: nowrap;

        }


        .complaint-table tbody td {

            padding: 17px 16px;

            vertical-align: middle;

            border-bottom: 1px solid #edf0f4;

            font-size: 14px;

        }


        .complaint-table tbody tr:last-child td {

            border-bottom: none;

        }


        .complaint-table tbody tr:hover {

            background: #fafcff;

        }


        /* ================= TABLE CONTENT ================= */

        .complaint-id {

            color: #155eef;

            font-weight: 700;

        }


        .student-name {

            font-weight: 600;

            color: #1f2937;

        }


        .email-text {

            color: #6b7280;

            font-size: 13px;

        }


        .subject-text {

            max-width: 260px;

            color: #4b5563;

            word-break: break-word;

        }


        /* ================= STATUS ================= */

        .status-badge {

            display: inline-flex;

            align-items: center;

            gap: 5px;

            padding: 6px 12px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: 600;

        }


        .status-pending {

            background: #fff4df;

            color: #b76b00;

        }


        .status-resolved {

            background: #e8f7ee;

            color: #18864b;

        }


        /* ================= ACTIONS ================= */

        .status-select {

            width: 120px;

            border: 1px solid #dce2ea;

            border-radius: 7px;

            padding: 7px 8px;

            font-size: 13px;

            background: #ffffff;

        }


        .status-select:focus {

            border-color: #155eef;

            box-shadow: none;

        }


        .update-btn {

            background: #155eef;

            color: white;

            border: none;

            border-radius: 7px;

            padding: 7px 13px;

            font-size: 13px;

            font-weight: 600;

        }


        .update-btn:hover {

            background: #0f4dcc;

            color: white;

        }


        .delete-btn {

            background: #fff1f2;

            color: #dc3545;

            border: 1px solid #ffd5d9;

            border-radius: 7px;

            padding: 7px 13px;

            font-size: 13px;

            font-weight: 600;

        }


        .delete-btn:hover {

            background: #dc3545;

            color: white;

        }


        /* ================= EMPTY STATE ================= */

        .empty-state {

            text-align: center;

            padding: 70px 20px;

            color: #8a93a1;

        }


        .empty-state i {

            display: block;

            font-size: 42px;

            margin-bottom: 15px;

            color: #c2cad5;

        }


        .empty-state h5 {

            color: #374151;

            font-weight: 700;

        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 767px) {

            .dashboard {

                padding: 30px 15px 50px;

            }


            .dashboard-header {

                align-items: flex-start;

            }


            .dashboard-title h1 {

                font-size: 25px;

            }


            .admin-badge {

                display: none;

            }

        }

    </style>

</head>


<body>




<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-custom">

    <div class="container">

        <div class="navbar-brand">

            <span class="brand-icon">

                <i class="bi bi-chat-square-text"></i>

            </span>

            Complaint System

        </div>


        <a href="LogoutServlet" class="logout-link">

            <i class="bi bi-box-arrow-right"></i>

            Logout

        </a>

    </div>

</nav>

<!-- ================= ADMIN DASHBOARD ================= -->

<div class="container dashboard">


    <!-- HEADER -->

    <div class="dashboard-header">


        <div class="dashboard-title">


            <div class="dashboard-icon">

                <i class="bi bi-speedometer2"></i>

            </div>


            <div>

                <h1>
                    Admin Dashboard
                </h1>

                <p>
                    Manage and resolve student complaints
                </p>

            </div>


        </div>



        <div class="admin-badge">

            <i class="bi bi-person-gear"></i>

            Administrator

        </div>


    </div>



    <!-- TABLE -->

    <div class="table-card">

        <div class="table-responsive">


            <%

                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {

                    con = DBConnection.getConnection();

                    ps = con.prepareStatement(
                        "SELECT * FROM COMPLAINT ORDER BY ID DESC"
                    );

                    rs = ps.executeQuery();


                    if(!rs.isBeforeFirst()){

            %>


                <div class="empty-state">

                    <i class="bi bi-inbox"></i>

                    <h5>
                        No Complaints Yet
                    </h5>

                    <p>
                        No complaints have been submitted by students.
                    </p>

                </div>


            <%

                    } else {

            %>


            <table class="table complaint-table">


                <thead>

                    <tr>

                        <th>ID</th>

                        <th>Name</th>

                        <th>Email</th>

                        <th>Complaint</th>

                        <th>Status</th>

                        <th>Actions</th>

                    </tr>

                </thead>


                <tbody>


                <%

                    while(rs.next()){

                        String status = rs.getString("STATUS");

                %>


                    <tr>


                        <!-- ID -->

                        <td>

                            <span class="complaint-id">

                                #<%= rs.getInt("ID") %>

                            </span>

                        </td>



                        <!-- NAME -->

                        <td>

                            <span class="student-name">

                                <%= rs.getString("NAME") %>

                            </span>

                        </td>



                        <!-- EMAIL -->

                        <td>

                            <span class="email-text">

                                <%= rs.getString("EMAIL") %>

                            </span>

                        </td>



                        <!-- SUBJECT -->

                        <td>

                            <div class="subject-text">

                                <%= rs.getString("SUBJECT") %>

                            </div>

                        </td>



                        <!-- STATUS -->

                        <td>


                            <% if("Resolved".equals(status)) { %>


                                <span class="status-badge status-resolved">

                                    <i class="bi bi-check-circle"></i>

                                    Resolved

                                </span>


                            <% } else { %>


                                <span class="status-badge status-pending">

                                    <i class="bi bi-clock"></i>

                                    Pending

                                </span>


                            <% } %>


                        </td>



                        <!-- ACTIONS -->

                        <td>


                            <!-- UPDATE -->

                            <form
                                action="ComplaintServlet"
                                method="post"
                                class="d-inline-flex align-items-center gap-2">


                                <input
                                    type="hidden"
                                    name="action"
                                    value="update">


                                <input
                                    type="hidden"
                                    name="id"
                                    value="<%= rs.getInt("ID") %>">


                                <select
                                    name="status"
                                    class="status-select">


                                    <option
                                        value="Pending"
                                        <%= "Pending".equals(status) ? "selected" : "" %>>

                                        Pending

                                    </option>


                                    <option
                                        value="Resolved"
                                        <%= "Resolved".equals(status) ? "selected" : "" %>>

                                        Resolved

                                    </option>


                                </select>


                                <button
                                    type="submit"
                                    class="update-btn">

                                    <i class="bi bi-arrow-repeat"></i>

                                    Update

                                </button>


                            </form>



                            <!-- DELETE -->

                            <form
                                action="ComplaintServlet"
                                method="post"
                                class="d-inline">


                                <input
                                    type="hidden"
                                    name="action"
                                    value="delete">


                                <input
                                    type="hidden"
                                    name="id"
                                    value="<%= rs.getInt("ID") %>">


                                <button
                                    type="submit"
                                    class="delete-btn ms-1">

                                    <i class="bi bi-trash"></i>

                                    Delete

                                </button>


                            </form>


                        </td>


                    </tr>


                <%

                    }

                %>


                </tbody>


            </table>


            <%

                    }

                }

                finally {

                    if(rs != null)
                        try { rs.close(); } catch(Exception e) {}

                    if(ps != null)
                        try { ps.close(); } catch(Exception e) {}

                    if(con != null)
                        try { con.close(); } catch(Exception e) {}

                }

            %>


        </div>

    </div>


</div>


</body>

</html>