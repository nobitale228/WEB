<?php
// config.php

// Cấu hình CORS

header("Content-Type: application/json");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Origin: *");
// Kết nối cơ sở dữ liệu
$host = "localhost";
$db_name = "movie_booking";
$username = "root";
$password = "";
try {
    $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    // Thiết lập chế độ báo lỗi cho PDO
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(["message" => "Connection failed: " . $e->getMessage()]);
    die();
}
?>
