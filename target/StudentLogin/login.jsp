<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // If the student is already logged in, do not show the login page again.
    if (session.getAttribute("loggedIn") != null) {
        response.sendRedirect("welcome.jsp");
        return;
    }

    String error = null;
    String username = "";

    // Process login when the form is submitted.
    if ("POST".equalsIgnoreCase(request.getMethod())) {

        username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty()) {

            error = "Please enter your username.";

        } else if (password == null || password.isEmpty()) {

            error = "Please enter your password.";

        } else if (
            "tuffy2018".equals(username.trim()) &&
            "Devansh@Tuffy".equals(password)
        ) {

            // Create login session.
            session.setAttribute("loggedIn", true);
            session.setAttribute("username", username.trim());

            response.sendRedirect("welcome.jsp");
            return;

        } else {

            error = "Invalid username or password. Please try again.";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Student Login</title>

    <link rel="stylesheet"
          href="style.css">

</head>

<body class="login-page">

    <div class="background-circle circle-one"></div>
    <div class="background-circle circle-two"></div>

    <div class="login-container">

        <div class="login-card">

            <!-- Logo -->
            <div class="logo">
                🎓
            </div>

            <h1>Student Portal</h1>
            <h4>By Devansh Maini 24EARCS044</h4>
            <p class="subtitle">
                Sign in to continue to your account
            </p>


            <% if (error != null) { %>

                <div class="error-message">

                    <span class="error-symbol">!</span>

                    <span>
                        <%= error %>
                    </span>

                </div>

            <% } %>


            <form method="post"
                  action="login.jsp"
                  class="login-form">

                <!-- Username -->

                <div class="form-group">

                    <label for="username">
                        Username
                    </label>

                    <div class="input-box">

                        <span class="input-icon">
                            👤
                        </span>

                        <input
                            type="text"
                            id="username"
                            name="username"
                            placeholder="Enter your username"
                            value="<%= username %>"
                            autocomplete="username"
                        >

                    </div>

                </div>


                <!-- Password -->

                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <div class="input-box">

                        <span class="input-icon">
                            🔒
                        </span>

                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Enter your password"
                            autocomplete="current-password"
                        >

                    </div>

                </div>


                <!-- Login button -->

                <button type="submit"
                        class="login-button">

                    Sign In

                </button>

            </form>


            <div class="login-footer">
                Student Authentication System
            </div>

        </div>

    </div>

</body>

</html>