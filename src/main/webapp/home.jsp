
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Complaint Management System</title>

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
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f7f9fc;
            color: #1f2937;
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
            letter-spacing: 0.2px;
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
            font-size: 19px;
        }

        .nav-link {
            color: #4b5563 !important;
            font-weight: 500;
            margin-right: 25px;
        }

        .nav-link:hover {
            color: #155eef !important;
        }

        .login-btn {
            background: #155eef;
            color: white;
            padding: 10px 23px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.2s;
        }

        .login-btn:hover {
            background: #0f4dcc;
            color: white;
        }

        /* ================= HERO ================= */

        .hero-section {
            background: #ffffff;
            padding: 85px 0 90px;
        }

        .hero-content {
            padding-top: 20px;
        }

        .small-heading {
            display: inline-block;
            background: #eaf1ff;
            color: #155eef;
            padding: 8px 15px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 22px;
        }

        .hero-title {
            font-size: 52px;
            line-height: 1.15;
            font-weight: 750;
            color: #111827;
            margin-bottom: 22px;
        }

        .hero-title span {
            color: #155eef;
        }

        .hero-description {
            font-size: 18px;
            line-height: 1.7;
            color: #6b7280;
            max-width: 570px;
            margin-bottom: 32px;
        }

        .primary-btn {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            background: #155eef;
            color: white;
            padding: 14px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            margin-right: 10px;
            transition: 0.2s;
        }

        .primary-btn:hover {
            background: #0f4dcc;
            color: white;
            transform: translateY(-1px);
        }

        .secondary-btn {
            display: inline-flex;
            align-items: center;
            gap: 9px;
            background: white;
            color: #374151;
            padding: 13px 24px;
            border: 1px solid #d9dee7;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.2s;
        }

        .secondary-btn:hover {
            border-color: #155eef;
            color: #155eef;
        }

        /* ================= HERO RIGHT BOX ================= */

        .dashboard-box {
            background: #f5f8ff;
            border: 1px solid #e0e8f7;
            border-radius: 18px;
            padding: 25px;
            max-width: 470px;
            margin-left: auto;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .dashboard-header h5 {
            font-weight: 700;
            margin: 0;
            color: #1f2937;
        }

        .status-badge {
            background: #e8f7ee;
            color: #18864b;
            padding: 6px 11px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .complaint-item {
            background: white;
            border: 1px solid #e7ebf1;
            padding: 17px;
            border-radius: 10px;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .complaint-icon {
            width: 42px;
            height: 42px;
            border-radius: 9px;
            background: #eaf1ff;
            color: #155eef;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
        }

        .complaint-text {
            flex: 1;
        }

        .complaint-text h6 {
            margin: 0 0 4px;
            font-size: 14px;
            font-weight: 700;
        }

        .complaint-text p {
            margin: 0;
            color: #8a93a1;
            font-size: 12px;
        }

        .resolved {
            color: #16834b;
            font-size: 12px;
            font-weight: 600;
        }

        .pending {
            color: #d97706;
            font-size: 12px;
            font-weight: 600;
        }

        /* ================= FEATURES ================= */

        .features-section {
            padding: 80px 0;
            background: #f7f9fc;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-title h2 {
            font-size: 34px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .section-title p {
            color: #6b7280;
            font-size: 16px;
        }

        .feature-card {
            background: white;
            border: 1px solid #e8edf3;
            border-radius: 12px;
            padding: 30px 25px;
            height: 100%;
            transition: 0.25s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            border-color: #cddafa;
            box-shadow: 0 12px 30px rgba(21, 94, 239, 0.08);
        }

        .feature-icon {
            width: 52px;
            height: 52px;
            background: #eaf1ff;
            color: #155eef;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
            margin-bottom: 20px;
        }

        .feature-card h5 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #1f2937;
        }

        .feature-card p {
            color: #6b7280;
            font-size: 14px;
            line-height: 1.7;
            margin: 0;
        }

        /* ================= STATS ================= */

        .stats-section {
            background: #155eef;
            padding: 50px 0;
        }

        .stat-box {
            text-align: center;
            color: white;
            border-right: 1px solid rgba(255,255,255,0.25);
        }

        .stat-box:last-child {
            border-right: none;
        }

        .stat-number {
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 14px;
            opacity: 0.85;
        }

        /* ================= FOOTER ================= */

        footer {
            background: #ffffff;
            border-top: 1px solid #e8edf3;
            padding: 25px 0;
        }

        .footer-text {
            color: #7b8491;
            font-size: 14px;
            margin: 0;
            text-align: center;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 991px) {

            .hero-title {
                font-size: 42px;
            }

            .dashboard-box {
                margin: 50px auto 0;
            }

            .nav-link {
                margin-right: 0;
                margin-bottom: 10px;
            }
        }

        @media (max-width: 576px) {

            .hero-section {
                padding: 55px 0;
            }

            .hero-title {
                font-size: 35px;
            }

            .hero-description {
                font-size: 16px;
            }

            .primary-btn,
            .secondary-btn {
                width: 100%;
                justify-content: center;
                margin-bottom: 10px;
            }

            .stat-box {
                border-right: none;
                margin-bottom: 25px;
            }
        }

    </style>

</head>

<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-custom">

    <div class="container">

        <!-- Complaint System is now NON-CLICKABLE -->
        <div class="navbar-brand">

            <span class="brand-icon">
                <i class="bi bi-chat-square-text"></i>
            </span>

            Complaint System

        </div>


        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarMenu">

            <span class="navbar-toggler-icon"></span>

        </button>


        <div class="collapse navbar-collapse" id="navbarMenu">

            <ul class="navbar-nav ms-auto align-items-lg-center">

                <li class="nav-item">

                    <a class="nav-link" href="#features">
                        Features
                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link" href="#about">
                        About
                    </a>

                </li>

                <li class="nav-item ms-lg-2">

                    <a href="login.jsp" class="login-btn">

                        <i class="bi bi-box-arrow-in-right"></i>

                        Login

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="hero-section">

    <div class="container">

        <div class="row align-items-center">

            <!-- LEFT SIDE -->

            <div class="col-lg-7">

                <div class="hero-content">

                    <div class="small-heading">

                        <i class="bi bi-shield-check"></i>

                        Simple. Secure. Reliable.

                    </div>


                    <h1 class="hero-title">

                        Your concerns,

                        <span>our responsibility.</span>

                    </h1>


                    <p class="hero-description">

                        A simple and efficient platform for students and
                        staff to submit complaints, track their status,
                        and get timely resolutions.

                    </p>


                    <div>

                        <a href="login.jsp" class="primary-btn">

                            Login to System

                            <i class="bi bi-arrow-right"></i>

                        </a>


                        <a href="#features" class="secondary-btn">

                            Explore Features

                            <i class="bi bi-arrow-down"></i>

                        </a>

                    </div>

                </div>

            </div>


            <!-- RIGHT SIDE -->

            <div class="col-lg-5">

                <div class="dashboard-box">

                    <div class="dashboard-header">

                        <h5>Complaint Overview</h5>

                        <span class="status-badge">

                            System Active

                        </span>

                    </div>


                    <div class="complaint-item">

                        <div class="complaint-icon">

                            <i class="bi bi-file-earmark-text"></i>

                        </div>

                        <div class="complaint-text">

                            <h6>Submit Complaint</h6>

                            <p>Report your issue easily</p>

                        </div>

                        <i class="bi bi-check-circle-fill resolved"></i>

                    </div>


                    <div class="complaint-item">

                        <div class="complaint-icon">

                            <i class="bi bi-clock-history"></i>

                        </div>

                        <div class="complaint-text">

                            <h6>Track Complaint</h6>

                            <p>Check your complaint status</p>

                        </div>

                        <span class="pending">Track</span>

                    </div>


                    <div class="complaint-item">

                        <div class="complaint-icon">

                            <i class="bi bi-person-check"></i>

                        </div>

                        <div class="complaint-text">

                            <h6>Admin Resolution</h6>

                            <p>Manage and resolve complaints</p>

                        </div>

                        <i class="bi bi-check-circle-fill resolved"></i>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= FEATURES ================= -->

<section class="features-section" id="features">

    <div class="container">

        <div class="section-title">

            <h2>Everything you need</h2>

            <p>
                Designed to make complaint management simple and efficient.
            </p>

        </div>


        <div class="row g-4">


            <!-- FEATURE 1 -->

            <div class="col-md-6 col-lg-3">

                <div class="feature-card">

                    <div class="feature-icon">

                        <i class="bi bi-shield-lock"></i>

                    </div>

                    <h5>Secure Login</h5>

                    <p>
                        Secure access for students and administrators
                        using the system login.
                    </p>

                </div>

            </div>


            <!-- FEATURE 2 -->

            <div class="col-md-6 col-lg-3">

                <div class="feature-card">

                    <div class="feature-icon">

                        <i class="bi bi-pencil-square"></i>

                    </div>

                    <h5>Submit Complaints</h5>

                    <p>
                        Submit your complaint online with an easy
                        and user-friendly form.
                    </p>

                </div>

            </div>


            <!-- FEATURE 3 -->

            <div class="col-md-6 col-lg-3">

                <div class="feature-card">

                    <div class="feature-icon">

                        <i class="bi bi-bar-chart"></i>

                    </div>

                    <h5>Track Status</h5>

                    <p>
                        Easily check whether your complaint is pending,
                        in progress, or resolved.
                    </p>

                </div>

            </div>


            <!-- FEATURE 4 -->

            <div class="col-md-6 col-lg-3">

                <div class="feature-card">

                    <div class="feature-icon">

                        <i class="bi bi-person-gear"></i>

                    </div>

                    <h5>Admin Control</h5>

                    <p>
                        Administrators can view, update and resolve
                        complaints efficiently.
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= STATS ================= -->

<section class="stats-section" id="about">

    <div class="container">

        <div class="row">

            <div class="col-md-4 stat-box">

                <div class="stat-number">
                    24/7
                </div>

                <div class="stat-label">
                    Complaint Access
                </div>

            </div>


            <div class="col-md-4 stat-box">

                <div class="stat-number">
                    Easy
                </div>

                <div class="stat-label">
                    Complaint Submission
                </div>

            </div>


            <div class="col-md-4 stat-box">

                <div class="stat-number">
                    Secure
                </div>

                <div class="stat-label">
                    System Access
                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= FOOTER ================= -->

<footer>

    <div class="container">

        <p class="footer-text">

            © 2026 Complaint Management System.
            All rights reserved.

        </p>

    </div>

</footer>


<!-- Bootstrap JavaScript -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>

