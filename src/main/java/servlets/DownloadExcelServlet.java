package servlets;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import beans.Student;
import dao.StudentDAO;
import dao.StudentDAOImpl;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class DownloadExcelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAOImpl();
        List<Student> students = dao.getAllStudents();

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Students");

        Row header = sheet.createRow(0);
        String[] columns = {"Name", "Roll No", "Gender", "Branch", "Year/Sem", "Contact No"};
        for(int i=0; i<columns.length; i++){
            header.createCell(i).setCellValue(columns[i]);
        }

        int rowNum = 1;
        for(Student s : students){
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(s.getName());
            row.createCell(1).setCellValue(s.getRollNo());
            row.createCell(2).setCellValue(s.getGender());
            row.createCell(3).setCellValue(s.getBranch());
            row.createCell(4).setCellValue(s.getYearSem());
            row.createCell(5).setCellValue(s.getContactNo());
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=students.xlsx");
        OutputStream out = response.getOutputStream();
        workbook.write(out);
        workbook.close();
        out.close();
    }
}
