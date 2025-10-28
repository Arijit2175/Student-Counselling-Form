<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Counseling Form</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    min-height: 100vh; 
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
    width: 40%;
    background: rgba(255, 255, 255, 0.9);
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.3);
    margin-top: 50px; 
    margin-bottom: 50px;
    z-index: 1;
    position: relative; 
}
        h2 {
            text-align: center;
            color: #333;
            transition: color 1s ease;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        label {
            font-weight: bold;
            margin-top: 8px;
        }
        input[type="text"],
        select {
            width: 100%;
            height: 38px; 
            box-sizing: border-box;
            padding: 8px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type=submit],
        .view-btn {
            border: none;
            cursor: pointer;
            font-size: 15px;
            font-weight: 700;
            border-radius: 5px;
            margin: 0 auto;
            height: 42px;
            padding: 8px 20px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
        }
        input[type=submit]:hover {
            background-color: #45a049;
            transform: scale(1.07);
            box-shadow: 0 3px 8px rgba(72, 239, 128, 0.5);
        }
        .button-container {
            text-align: center;
            margin-top: 15px;
        }
        .view-btn {
            background-color: #008CBA;
            color: white;
        }
        .view-btn:hover {
            background-color: #0079a6;
            transform: scale(1.07);
            box-shadow: 0 3px 8px rgba(0, 191, 255, 0.5);
        }
    </style>

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
</head>
<body>

<div class="container">
    <h2 id="dynamicTitle">Student Counseling Form</h2>
    <form action="StudentServlet" method="post">
        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Roll Number:</label>
        <input type="text" name="rollNo" required>

        <label>Gender:</label>
        <select name="gender" required>
            <option value="">--Select Gender--</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>

        <label>Branch:</label>
        <input type="text" name="branch" required>

        <label>Year/Semester:</label>
        <input type="text" name="yearSem" required>

        <label>Contact Number:</label>
        <input type="text" name="contactNo" required>
        <br>
        <input type="submit" value="Submit">
    </form>
    <br>
    <div class="button-container">
        <form action="view_students.jsp" method="get">
            <button type="submit" class="view-btn">📋 View Students</button>
        </form>
    </div>
</div>

</body>
</html>
