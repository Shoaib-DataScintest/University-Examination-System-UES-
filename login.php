
<?php
session_start();
require_once "../config/db.php";

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = trim($_POST["email"]);
    $password = trim($_POST["password"]);

    // Simple validation
    if (empty($email) || empty($password)) {
        die("Email and password are required.");
    }

    // Prepare query
    $sql = "SELECT user_id, full_name, password, role_id, status 
            FROM users 
            WHERE email = ? 
            LIMIT 1";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        // TEMP password check (we will hash later)
        if ($password === $user["password"] && $user["status"] === "active") {

            $_SESSION["user_id"] = $user["user_id"];
            $_SESSION["role_id"] = $user["role_id"];
            $_SESSION["full_name"] = $user["full_name"];

            // Redirect based on role
            switch ($user["role_id"]) {
                case 1:
                    header("Location: ../../admin-dashboard.html");
                    break;
                case 2:
                    header("Location: ../../hod-dashboard.html");
                    break;
                case 3:
                    header("Location: ../../faculty-dashboard.html");
                    break;
                case 4:
                    header("Location: ../../invigilator-dashboard.html");
                    break;
                case 5:
                    header("Location: ../../student-dashboard.html");
                    break;
                default:
                    die("Invalid role.");
            }
            exit;

        } else {
            die("Invalid credentials or inactive account.");
        }
    } else {
        die("User not found.");
    }
}
?>
