<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login - Complaint System</title>

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
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f7f9fc;
            color: #1f2937;
        }


        /* NAVBAR */

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


        /* LOGIN AREA */

        .login-section {
            min-height: calc(100vh - 76px);

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 50px 20px;
        }


        .login-card {
            width: 100%;
            max-width: 440px;

            background: white;

            border: 1px solid #e5eaf1;
            border-radius: 16px;

            padding: 40px;

            box-shadow: 0 15px 40px rgba(31, 41, 55, 0.07);
        }


        .login-icon {
            width: 58px;
            height: 58px;

            background: #eaf1ff;
            color: #155eef;

            border-radius: 12px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 25px;

            margin: 0 auto 20px;
        }


        .login-title {
            text-align: center;

            font-size: 28px;
            font-weight: 700;

            color: #111827;

            margin-bottom: 8px;
        }


        .login-subtitle {
            text-align: center;

            color: #6b7280;

            font-size: 14px;

            margin-bottom: 30px;
        }


        .form-label {
            font-weight: 600;

            font-size: 14px;

            color: #374151;
        }


        .input-group-text {
            background: #f8fafc;

            border-color: #dce2ea;

            color: #155eef;
        }


        .form-control {
            border-color: #dce2ea;

            padding: 12px;
        }


        .form-control:focus {
            border-color: #155eef;

            box-shadow: 0 0 0 3px rgba(21, 94, 239, 0.10);
        }


        .login-btn {
            width: 100%;

            background: #155eef;

            border: none;

            color: white;

            padding: 13px;

            border-radius: 8px;

            font-weight: 600;

            font-size: 16px;

            transition: 0.2s;
        }


        .login-btn:hover {
            background: #0f4dcc;
        }


        .footer-note {
            text-align: center;

            margin-top: 25px;

            font-size: 13px;

            color: #8a93a1;
        }


        @media (max-width: 576px) {

            .login-card {
                padding: 30px 22px;
            }

        }

    </style>

</head>


<body>


<!-- NAVBAR -->

<nav class="navbar navbar-custom">

    <div class="container">

        <div class="navbar-brand">

            <span class="brand-icon">

                <i class="bi bi-chat-square-text"></i>

            </span>

            Complaint System

        </div>

    </div>

</nav>

<!-- LOGIN -->

<section class="login-section">

    <div class="login-card">


        <div class="login-icon">

            <i class="bi bi-shield-lock"></i>

        </div>


        <h1 class="login-title">

            Welcome Back

        </h1>


        <p class="login-subtitle">

            Login to access the Complaint Management System

        </p>



        <!-- ERROR MESSAGE -->

        <%

            String error = request.getParameter("error");

            if(error != null){

        %>

            <div class="alert alert-danger">

                <i class="bi bi-exclamation-circle"></i>

                <%= error %>

            </div>

        <%

            }

        %>



        <!-- LOGIN FORM -->

        <form action="LoginServlet" method="post">


            <div class="mb-3">

                <label class="form-label">

                    Email / Username

                </label>


                <div class="input-group">

                    <span class="input-group-text">

                        <i class="bi bi-person"></i>

                    </span>


                    <input
                        type="text"
                        name="username"
                        class="form-control"
                        placeholder="Enter your username"
                        required>

                </div>

            </div>



            <div class="mb-4">

                <label class="form-label">

                    Password

                </label>


                <div class="input-group">

                    <span class="input-group-text">

                        <i class="bi bi-key"></i>

                    </span>


                    <input
                        type="password"
                        name="password"
                        class="form-control"
                        placeholder="Enter your password"
                        required>

                </div>

            </div>



            <button
                type="submit"
                class="login-btn">

                <i class="bi bi-box-arrow-in-right"></i>

                Login

            </button>


        </form>



        <div class="footer-note">

            Secure access to Complaint Management System

        </div>


    </div>

</section>


</body>

</html>