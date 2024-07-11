<?php
header('Content-Type: application/json');

// Database configuration
$servername = "localhost";
$username = "mobw7774_user_maulana";
$password = "Lele123456!.,";
$dbname = "mobw7774_api_maulana";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}

// Retrieve POST data
$dokter = $_POST['dokter'] ?? '';
$spesialis = $_POST['spesialis'] ?? '';
$hari = $_POST['hari'] ?? '';
$jam = $_POST['jam'] ?? '';
$jenis = $_POST['jenis'] ?? '';
$manfaat = $_POST['manfaat'] ?? '';
$dosis = $_POST['dosis'] ?? '';

// Debugging: Print received data
file_put_contents('php://stderr', print_r($_POST, true));

// Validate POST data
if(empty($dokter) || empty($spesialis) || empty($hari) || empty($jam) || empty($jenis) || empty($manfaat) || empty($dosis)) {
    die(json_encode(["success" => false, "message" => "All fields are required"]));
}

// Prepare and bind
$stmt = $conn->prepare("INSERT INTO janji (dokter, spesialis, hari, jam, jenis, manfaat, dosis) VALUES (?, ?, ?, ?, ?, ?, ?)");
if ($stmt === false) {
    die(json_encode(["success" => false, "message" => "Prepare failed: " . $conn->error]));
}
$stmt->bind_param("sssssss", $dokter, $spesialis, $hari, $jam, $jenis, $manfaat, $dosis);

if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Appointment saved successfully"]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
