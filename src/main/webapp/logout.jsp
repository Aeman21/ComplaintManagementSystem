<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Logged Out - Complaint System</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f7f9fc;
            color: #1f2937;
        }

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

        .logout-section {
            min-height: calc(100vh - 76px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }

        .logout-card {
            background: white;
            max-width: 500px;
            width: 100%;
            text-align: center;
            padding: 50px 40px;
            border-radius: 16px;
            border: 1px solid #e5eaf1;
            box-shadow: 0 15px 40px rgba(31, 41, 55, 0.07);
        }

        .success-icon {
            width: 70px;
            height: 70px;
            background: #e8f7ee;
            color: #18864b;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 22px;
            font-size: 32px;
        }

        .logout-title {
            font-size: 28px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 10px;
        }

        .logout-text {
            color: #6b7280;
            margin-bottom: 28px;
        }

        .login-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #155eef;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .login-btn:hover {
            background: #0f4dcc;
            color: white;
        }

    </style>

</head>

<body>


<nav class="navbar navbar-custom">

    <div class="container">

        <a href="index.jsp" class="navbar-brand">

            <span class="brand-icon">
                <i class="bi bi-chat-square-text"></i>
            </span>

            Complaint System

        </a>

    </div>

</nav>


<section class="logout-section">

    <div class="logout-card">

        <div class="success-icon">

            <i class="bi bi-check-lg"></i>

        </div>

        <h1 class="logout-title">
            You have been logged out
        </h1>

        <p class="logout-text">
            Your session has ended successfully.
            Thank you for using the Complaint Management System.
        </p>

        <a href="login.jsp" class="login-btn">

            <i class="bi bi-box-arrow-in-right"></i>

            Login Again

        </a>

    </div>

</section>


</body>

</html>