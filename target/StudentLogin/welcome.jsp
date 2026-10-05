<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Prevent browser caching of the authenticated page.
    response.setHeader("Cache-Control",
                       "no-cache, no-store, must-revalidate");

    response.setHeader("Pragma", "no-cache");

    response.setDateHeader("Expires", 0);


    // Check whether the student is logged in.
    Boolean loggedIn =
        (Boolean) session.getAttribute("loggedIn");


    if (loggedIn == null || !loggedIn) {

        response.sendRedirect("login.jsp");

        return;
    }


    String username =
        (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Welcome</title>

    <link rel="stylesheet"
          href="style.css">

</head>

<body class="welcome-page">

    <div class="background-circle circle-one"></div>
    <div class="background-circle circle-two"></div>


    <div class="welcome-container">

        <div class="welcome-card">

            <!-- Success icon -->

            <div class="success-icon">
                ✓
            </div>


            <div class="success-label">
                LOGIN SUCCESSFUL
            </div>


            <h1>
                Welcome,
                <span><%= username %></span>!
            </h1>


            <p class="welcome-description">

                You have successfully logged in
                to the Student Portal.

            </p>


            <!-- Student information -->

            <div class="student-info">

                <div class="info-row">

                    <span class="info-title">
                        Username
                    </span>

                    <span class="info-value">
                        <%= username %>
                    </span>

                </div>


                <div class="info-row">

                    <span class="info-title">
                        Login Status
                    </span>

                    <span class="status">
                        ● Active
                    </span>

                </div>

            </div>


            <!-- Logout -->

            <a href="logout.jsp"
               class="logout-button">

                Logout

            </a>

        </div>

    </div>

</body>

</html>