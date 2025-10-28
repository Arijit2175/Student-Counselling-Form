<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submission Successful</title>
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
        position: relative;
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
        z-index: -2;
    }

    @keyframes gradientShift {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    .box {
        width: 40%;
        background: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0,0,0,0.3);
        margin-top: 100px;
        text-align: center;
        position: relative;
        z-index: 1;
    }

    h2 {
        margin-bottom: 20px;
        transition: color 1s ease;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        padding: 10px 20px;
        border-radius: 5px;
        font-weight: 700;
        transition: all 0.3s ease-in-out;
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }

    a:hover {
        background-color: #45a049;
        transform: scale(1.05);
        box-shadow: 0 3px 8px rgba(72, 239, 128, 0.5);
    }

    .confetti {
        position: fixed;
        z-index: 9999;
        pointer-events: none;
    }

    @keyframes fall {
        0% { transform: translateY(0) rotate(0deg); opacity: 1; }
        100% { transform: translateY(100vh) rotate(360deg); opacity: 0.7; }
    }

</style>
</head>
<body>

<div class="box">
    <h2 id="dynamicTitle">🎉 Form Submitted Successfully!</h2>
    <p>Your details have been recorded in the database.</p>
    <a href="student_form.jsp">Go Back</a>
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
        launchConfetti();
    };

    function launchConfetti() {
        const confettiColors = ["#ff3b30", "#ff9500", "#34c759", "#007aff", "#af52de", "#f5e663"];
        setInterval(() => {
            const confetti = document.createElement('div');
            confetti.classList.add('confetti');

            const size = Math.random() * 10 + 5;
            confetti.style.width = `${size}px`;
            confetti.style.height = `${size * (Math.random() * 0.5 + 0.5)}px`;
            confetti.style.backgroundColor = confettiColors[Math.floor(Math.random() * confettiColors.length)];
            confetti.style.borderRadius = Math.random() > 0.5 ? '50%' : '0%';

            confetti.style.left = `${Math.random() * window.innerWidth}px`;
            confetti.style.top = `-${size}px`;

            const fallDuration = Math.random() * 3 + 3; 
            const drift = (Math.random() - 0.5) * 200; 

            confetti.style.animation = `fall ${fallDuration}s linear forwards`;
            confetti.style.transform = `translateX(${drift}px) rotate(${Math.random() * 360}deg)`;

            document.body.appendChild(confetti);

            setTimeout(() => confetti.remove(), fallDuration * 1000);
        }, 100);
    }
</script>

</body>
</html>
