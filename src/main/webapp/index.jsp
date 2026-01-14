<%@ page import="java.sql.*" %>
<%@ page import="com.student.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
<h2>Student Management System</h2>

<nav>
    <a href="addStudent.jsp">Add Student</a>
</nav>

<hr><br>

<table>
<tr>
    <th>Roll No</th>
    <th>Name</th>
    <th>Email</th>
    <th>Course</th>
    <th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();
if(con != null){
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(
        "SELECT * FROM students ORDER BY roll_no ASC"
    );

    while(rs.next()){
%>
<tr>
    <td><%= rs.getInt("roll_no") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("course") %></td>
    <td class="action">
        <a href="editStudent.jsp?roll_no=<%= rs.getInt("roll_no") %>">Edit</a>
        <a href="deleteStudent?roll_no=<%= rs.getInt("roll_no") %>"
   			onclick="return confirm('Delete student: <%= rs.getString("name") %>?');">
   			Delete
		</a>

    </td>
</tr>
<%
    }
    con.close();
}
%>

</table>
</div>

</body>
</html>
