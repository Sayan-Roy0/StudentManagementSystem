package com.student.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.student.util.DBConnection;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int oldRoll = Integer.parseInt(request.getParameter("oldRoll"));
        int newRoll = Integer.parseInt(request.getParameter("roll"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE students SET roll_no=?, name=?, email=?, course=? WHERE roll_no=?"
            );

            ps.setInt(1, newRoll);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, course);
            ps.setInt(5, oldRoll);

            ps.executeUpdate();
            con.close();

            response.sendRedirect("index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

