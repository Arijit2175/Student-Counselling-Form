package servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import beans.Student;
import dao.StudentDAO;
import dao.StudentDAOImpl;

public class StudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String rollNo = request.getParameter("rollNo");
        String gender = request.getParameter("gender");
        String branch = request.getParameter("branch");
        String yearSem = request.getParameter("yearSem");
        String contactNo = request.getParameter("contactNo");

        Student student = new Student();
        student.setName(name);
        student.setRollNo(rollNo);
        student.setGender(gender);
        student.setBranch(branch);
        student.setYearSem(yearSem);
        student.setContactNo(contactNo);

        StudentDAO dao = new StudentDAOImpl();
        boolean success = dao.addStudent(student);

        if (success) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}