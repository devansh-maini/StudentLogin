<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Destroy the current session.
    session.invalidate();

    // Prevent cached authenticated pages from being displayed.
    response.setHeader("Cache-Control",
                       "no-cache, no-store, must-revalidate");

    response.setHeader("Pragma", "no-cache");

    response.setDateHeader("Expires", 0);

    // Return to login page.
    response.sendRedirect("login.jsp");
%>