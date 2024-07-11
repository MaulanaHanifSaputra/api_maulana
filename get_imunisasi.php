<?php
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

// Change query to select all rows
$sql = "SELECT jenis, manfaat, dosis FROM imunisasi";

$result = $conn->query($sql);

$imunisasi = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $imunisasi[] = $row;
    }
} else {
    echo json_encode(array("message" => "No records found"));
    exit();
}

echo json_encode($imunisasi);

$conn->close();
?>
