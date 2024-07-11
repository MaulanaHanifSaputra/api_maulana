<?php
header('Content-Type: application/json');

// Database connection details
$servername = "localhost";
$username = "mobw7774_user_maulana";
$password = "Lele123456!.,";
$dbname = "mobw7774_api_maulana";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch doctor data
$sql = "SELECT dokter, spesialis, hari, jam FROM dokter";
$result = $conn->query($sql);

$doctors = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $doctors[] = $row;
    }
} else {
    // Log if no data found
    error_log("No data found");
}

// Close connection
$conn->close();

// Return data in JSON format
echo json_encode($doctors);
?>
