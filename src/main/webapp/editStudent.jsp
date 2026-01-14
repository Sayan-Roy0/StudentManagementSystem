<%@ page import="java.sql.*" %>
<%@ page import="com.student.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
<h2>Edit Student</h2>

<%
int rollNo = Integer.parseInt(request.getParameter("roll_no"));
Connection con = DBConnection.getConnection();

PreparedStatement ps =
    con.prepareStatement("SELECT * FROM students WHERE roll_no=?");
ps.setInt(1, rollNo);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<form action="updateStudent" method="post">
    <input type="hidden" name="oldRoll" value="<%= rollNo %>">

    <input type="number" name="roll"
           value="<%= rs.getInt("roll_no") %>" required>

    <input type="text" name="name"
           value="<%= rs.getString("name") %>" required>

    <input type="email" name="email"
           value="<%= rs.getString("email") %>" required>

    <input type="text" name="course"
           value="<%= rs.getString("course") %>" required>

    <button type="submit">Update Student</button>
</form>

<%
con.close();
%>

</div>
</body>
</html>
