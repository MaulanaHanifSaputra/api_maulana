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

// Fetch data from janji and imunisasi tables
$sql = "SELECT j.id, j.dokter, j.spesialis, j.hari, j.jam, j.jenis, j.manfaat, j.dosis
        FROM janji j";

$result = $conn->query($sql);

if ($result === false) {
    echo json_encode(["success" => false, "message" => "Error fetching data: " . $conn->error]);
    $conn->close();
    exit();
}

$rows = array();
while ($row = $result->fetch_assoc()) {
    $rows[] = $row;
}

echo json_encode(["success" => true, "data" => $rows]);

$conn->close();
?>
