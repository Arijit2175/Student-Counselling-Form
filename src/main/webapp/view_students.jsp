<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, beans.Student, dao.StudentDAO, dao.StudentDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            overflow-y: auto; 
            display: flex;
            justify-content: center;
            align-items: flex-start; 
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #ff3b30, #ff9500, #34c759, #007aff, #af52de, #5ac8fa);
            background-size: 600% 600%;
            animation: gradientShift 20s ease infinite;
            filter: blur(30px);
            z-index: -1;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            width: 80%;
            background: rgba(255, 255, 255, 0.9);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            margin-top: 50px;
            z-index: 1;
            position: relative;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            transition: color 1s ease;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .button-container {
            text-align: center;
            margin-top: 15px;
        }

        .download-btn, .back-btn {
            border: none;
            cursor: pointer;
            font-size: 15px;
            font-weight: 700;
            border-radius: 5px;
            margin: 0 5px;
            height: 42px;
            padding: 8px 20px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }

        .download-btn {
            background-color: #008CBA;
            color: white;
        }

        .download-btn:hover {
            background-color: #0079a6;
            transform: scale(1.07);
            box-shadow: 0 3px 8px rgba(0, 191, 255, 0.5);
        }

        .back-btn {
            background-color: #4CAF50;
            color: white;
        }

        .back-btn:hover {
            background-color: #45a049;
            transform: scale(1.07);
            box-shadow: 0 3px 8px rgba(72, 239, 128, 0.5);
        }
    </style>
</head>
<body>

<div class="container">
    <h2 id="dynamicTitle">📋 Student Records</h2>

    <%
        StudentDAO dao = new StudentDAOImpl();
        List<Student> students = dao.getAllStudents();
    %>

    <table>
        <tr>
            <th>Name</th>
            <th>Roll No</th>
            <th>Gender</th>
            <th>Branch</th>
            <th>Year/Sem</th>
            <th>Contact No</th>
        </tr>
        <%
            for(Student s : students){
        %>
        <tr>
            <td><%= s.getName() %></td>
            <td><%= s.getRollNo() %></td>
            <td><%= s.getGender() %></td>
            <td><%= s.getBranch() %></td>
            <td><%= s.getYearSem() %></td>
            <td><%= s.getContactNo() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="button-container">
        <form action="DownloadExcelServlet" method="post" style="display:inline;">
            <button type="submit" class="download-btn">⬇️ Download Excel</button>
        </form>
        <form action="student_form.jsp" method="get" style="display:inline;">
            <button type="submit" class="back-btn">⬅️ Back to Form</button>
        </form>
    </div>
</div>

<script>
    const colors = ["#ff3b30", "#ff9500", "#34c759", "#007aff", "#af52de", "#5ac8fa"];
    let index = 0;

    function changeTitleColor() {
        const title = document.getElementById("dynamicTitle");
        title.style.color = colors[index];
        index = (index + 1) % colors.length;
    }

    window.onload = function() {
        changeTitleColor();
        setInterval(changeTitleColor, 3000);
    };
</script>

</body>
</html>
