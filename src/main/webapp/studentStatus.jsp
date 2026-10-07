<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.project.servlet.DBConnection" %>

<%

    if(session == null || session.getAttribute("student") == null){

        response.sendRedirect("login.jsp");
        return;

    }

    String studentEmail = (String)session.getAttribute("student");

%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Dashboard - Complaint System</title>

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


        .welcome-section {
            margin-bottom: 35px;
        }

        .welcome-section h1 {
            font-size: 32px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 8px;
        }

        .welcome-section p {
            color: #6b7280;
            margin: 0;
            font-size: 15px;
        }


        /* ================= CARDS ================= */

        .dashboard-card {
            background: #ffffff;
            border: 1px solid #e5eaf1;
            border-radius: 14px;
            padding: 28px;
            height: 100%;
        }


        .card-header-custom {
            display: flex;
            align-items: center;
            gap: 13px;
            margin-bottom: 25px;
        }


        .card-icon {
            width: 46px;
            height: 46px;

            background: #eaf1ff;
            color: #155eef;

            border-radius: 10px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 20px;
        }


        .card-header-custom h4 {
            margin: 0;
            font-size: 19px;
            font-weight: 700;
            color: #1f2937;
        }


        .card-header-custom p {
            margin: 3px 0 0;
            font-size: 13px;
            color: #8a93a1;
        }


        /* ================= FORM ================= */

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }


        .form-control {
            border: 1px solid #dce2ea;
            padding: 12px;
            border-radius: 8px;
        }


        .form-control:focus {
            border-color: #155eef;
            box-shadow: 0 0 0 3px rgba(21, 94, 239, 0.10);
        }


        .submit-btn {
            background: #155eef;
            border: none;
            color: #ffffff;

            padding: 12px 22px;
            border-radius: 8px;

            font-weight: 600;
            transition: 0.2s;
        }


        .submit-btn:hover {
            background: #0f4dcc;
            color: white;
        }


        /* ================= COMPLAINT ================= */

        .complaint-item {
            border: 1px solid #e6ebf2;
            border-radius: 10px;
            padding: 18px;
            margin-bottom: 12px;
            background: #ffffff;
        }


        .complaint-top {
            display: flex;
            justify-content: space-between;
            align-items: center;

            margin-bottom: 12px;
        }


        .complaint-id {
            font-size: 13px;
            color: #6b7280;
            font-weight: 600;
        }


        .complaint-subject {
            font-size: 15px;
            font-weight: 600;
            color: #1f2937;

            margin: 0;

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


        .status-resolved {
            background: #e8f7ee;
            color: #18864b;
        }


        .status-pending {
            background: #fff4df;
            color: #b76b00;
        }


        /* ================= EMPTY STATE ================= */

        .empty-state {
            text-align: center;
            padding: 45px 20px;
            color: #8a93a1;
        }


        .empty-state i {
            display: block;
            font-size: 38px;
            color: #c2cad5;
            margin-bottom: 12px;
        }


        .empty-state p {
            margin: 0;
            font-size: 14px;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 767px) {

            .dashboard {
                padding: 30px 15px 50px;
            }

            .welcome-section h1 {
                font-size: 27px;
            }

            .dashboard-card {
                padding: 22px;
            }

            .complaint-top {
                align-items: flex-start;
                gap: 10px;
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



<!-- ================= DASHBOARD ================= -->

<div class="container dashboard">


    <!-- WELCOME -->

    <div class="welcome-section">

        <h1>
            Student Dashboard
        </h1>

        <p>
            Submit your complaint and easily track its status.
        </p>

    </div>



    <div class="row g-4">


        <!-- ================= SUBMIT COMPLAINT ================= -->

        <div class="col-lg-5">

            <div class="dashboard-card">


                <div class="card-header-custom">

                    <div class="card-icon">

                        <i class="bi bi-pencil-square"></i>

                    </div>


                    <div>

                        <h4>
                            Submit Complaint
                        </h4>

                        <p>
                            Tell us about your issue
                        </p>

                    </div>

                </div>



                <form
                    action="ComplaintServlet"
                    method="post">


                    <input
                        type="hidden"
                        name="action"
                        value="add">


                    <div class="mb-3">

                        <label class="form-label">
                            Name
                        </label>

                        <input
                            type="text"
                            name="name"
                            class="form-control"
                            placeholder="Enter your name"
                            required>

                    </div>



                    <div class="mb-4">

                        <label class="form-label">
                            Complaint / Subject
                        </label>

                        <textarea
                            name="subject"
                            class="form-control"
                            rows="6"
                            placeholder="Describe your complaint..."
                            required></textarea>

                    </div>



                    <input
                        type="hidden"
                        name="email"
                        value="<%= studentEmail %>">



                    <button
                        type="submit"
                        class="submit-btn">

                        <i class="bi bi-send"></i>

                        Submit Complaint

                    </button>


                </form>


            </div>

        </div>



        <!-- ================= MY COMPLAINTS ================= -->

        <div class="col-lg-7">

            <div class="dashboard-card">


                <div class="card-header-custom">

                    <div class="card-icon">

                        <i class="bi bi-list-check"></i>

                    </div>


                    <div>

                        <h4>
                            My Complaints
                        </h4>

                        <p>
                            View and track your submitted complaints
                        </p>

                    </div>

                </div>



                <%

                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {

                        con = DBConnection.getConnection();

                        ps = con.prepareStatement(
                            "SELECT * FROM COMPLAINT WHERE EMAIL=? ORDER BY ID DESC"
                        );

                        ps.setString(1, studentEmail);

                        rs = ps.executeQuery();


                        if(!rs.isBeforeFirst()){

                %>


                    <div class="empty-state">

                        <i class="bi bi-inbox"></i>

                        <p>
                            You have not submitted any complaints yet.
                        </p>

                    </div>


                <%

                        }


                        while(rs.next()){

                            String status = rs.getString("STATUS");

                %>


                    <div class="complaint-item">


                        <div class="complaint-top">


                            <span class="complaint-id">

                                Complaint #<%= rs.getInt("ID") %>

                            </span>



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


                        </div>



                        <p class="complaint-subject">

                            <%= rs.getString("SUBJECT") %>

                        </p>


                    </div>


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

</div>


</body>

</html>