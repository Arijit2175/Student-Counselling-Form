package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.Student;
import factory.DBConn;

public class StudentDAOImpl implements StudentDAO {

    @Override
    public boolean addStudent(Student student) {
        boolean status = false;
        try {
            Connection con = DBConn.getConn();
            String query = "INSERT INTO students(name, roll_no, gender, branch, year_sem, contact_no) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, student.getName());
            ps.setString(2, student.getRollNo());
            ps.setString(3, student.getGender());
            ps.setString(4, student.getBranch());
            ps.setString(5, student.getYearSem());
            ps.setString(6, student.getContactNo()); 

            int i = ps.executeUpdate();
            if (i > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    @Override
    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        try {
            Connection con = DBConn.getConn();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM students");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Student s = new Student();
                s.setName(rs.getString("name"));
                s.setRollNo(rs.getString("roll_no"));
                s.setGender(rs.getString("gender"));
                s.setBranch(rs.getString("branch"));
                s.setYearSem(rs.getString("year_sem"));
                s.setContactNo(rs.getString("contact_no"));
                list.add(s);
            }
        } catch(Exception e){ e.printStackTrace(); }
        return list;
    }
}
