<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký và Đăng nhập</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://i.imgur.com/bw7hj0q.jpeg') no-repeat center center fixed; /* Thêm ảnh nền cho toàn trang */
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.8); /* Nền mờ cho form */
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 400px;
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }

        .form-container p {
            text-align: center;
            font-size: 14px;
        }

        .form-container .status {
            color: green;
            text-align: center;
            font-weight: bold;
        }

        .link {
            text-align: center;
            margin-top: 10px;
        }

        .link a {
            color: #007BFF;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="form-container" id="loginForm">
        <h1>Đăng nhập</h1>
        <input type="text" id="loginUsername" placeholder="Tên đăng nhập">
        <input type="password" id="loginPassword" placeholder="Mật khẩu">
        <button onclick="login()">Đăng nhập</button>
        <p class="link">Chưa có tài khoản? <a href="javascript:void(0);" onclick="showRegisterForm()">Đăng ký</a></p>
    </div>

    <div class="form-container" id="registerForm" style="display: none;">
        <h1>Tạo tài khoản</h1>
        <input type="text" id="registerUsername" placeholder="Tên đăng nhập">
        <input type="password" id="registerPassword" placeholder="Mật khẩu">
        <input type="password" id="registerConfirmPassword" placeholder="Xác nhận mật khẩu">
        <button onclick="register()">Tạo tài khoản</button>
        <p class="link">Đã có tài khoản? <a href="javascript:void(0);" onclick="showLoginForm()">Đăng nhập</a></p>
    </div>

    <script>
        // Hiển thị form đăng ký
        function showRegisterForm() {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("registerForm").style.display = "block";
        }

        // Hiển thị form đăng nhập
        function showLoginForm() {
            document.getElementById("registerForm").style.display = "none";
            document.getElementById("loginForm").style.display = "block";
        }

        // Hàm đăng ký tài khoản
        function register() {
            const username = document.getElementById("registerUsername").value;
            const password = document.getElementById("registerPassword").value;
            const confirmPassword = document.getElementById("registerConfirmPassword").value;

            if (username && password && confirmPassword) {
                if (password === confirmPassword) {
                    localStorage.setItem("username", username);
                    localStorage.setItem("password", password);
                    alert("Tạo tài khoản thành công!");
                    showLoginForm();  // Quay lại form đăng nhập
                } else {
                    alert("Mật khẩu không khớp!");
                }
            } else {
                alert("Vui lòng điền đầy đủ thông tin!");
            }
        }

        // Hàm đăng nhập
        function login() {
            const username = document.getElementById("loginUsername").value;
            const password = document.getElementById("loginPassword").value;

            const storedUsername = localStorage.getItem("username");
            const storedPassword = localStorage.getItem("password");

            if (username === storedUsername && password === storedPassword) {
                // Đăng nhập thành công, lưu trạng thái và chuyển trang
                localStorage.setItem("loggedIn", "true");
                window.location.href = "https://xyzduy.github.io/xyz/code.html";  // Chuyển đến trang chính
            } else {
                alert("Tên đăng nhập hoặc mật khẩu không đúng!");
            }
        }

        // Kiểm tra nếu người dùng đã đăng nhập trước đó
        window.onload = function() {
            const loggedIn = localStorage.getItem("loggedIn");
            if (loggedIn === "true") {
                window.location.href = "https://xyzduy.github.io/xyz/code.html";  // Tự động chuyển đến trang chính nếu đã đăng nhập
            }
        }
    </script>

</body>
</html>