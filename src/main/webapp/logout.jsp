<%
session.invalidate(); //deleting all the session values
response.sendRedirect("login.jsp");
%>>