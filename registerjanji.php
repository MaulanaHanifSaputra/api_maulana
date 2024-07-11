<?php
header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['selectedDoctor'], $data['selectedImunisasi'], $data['selectedImunisasiJenis'])) {
    // Database connection settings
    $servername = "localhost"; // Change if your database server is different
    $username = "mobw7774_user_maulana";
    $password = "Lele123456!.,";
    $dbname = "mobw7774_api_maulana";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die(json_encode(['status' => 'error', 'message' => 'Database connection failed: ' . $conn->connect_error]));
    }

    $doctor = $data['selectedDoctor'];
    $imunisasi = $data['selectedImunisasi'];
    $imunisasiJenis = $data['selectedImunisasiJenis'];

    $nama_dokter = $conn->real_escape_string($doctor['nama_dokter']);
    $spesialis = $conn->real_escape_string($doctor['spesialis']);
    $jenis_imunisasi = $conn->real_escape_string($imunisasiJenis);

    // SQL query to insert data into database
    $sql = "INSERT INTO janji (nama_dokter, spesialis, jenis_imunisasi) VALUES ('$nama_dokter', '$spesialis', '$jenis_imunisasi')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Database insert failed: ' . $conn->error]);
    }

    $conn->close();
} else {
    echo json_encode(['status' => 'error', 'message' => 'Incomplete data']);
}
?>
