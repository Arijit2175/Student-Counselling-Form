package dao;

import java.util.*;

import beans.Student;

public interface StudentDAO {
	boolean addStudent(Student student);
	List<Student> getAllStudents();
}
