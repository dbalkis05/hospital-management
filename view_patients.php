<!DOCTYPE html>
<html>
<head>
    <title>Patient List - Hospital Management System</title>
</head>
<body>

<?php
require 'config.php'; // Include file to connect to the database
include 'menu.php'; // Include menu list from menu.php, you can edit accordingly

// SQL query to get all patient records
$sql = "SELECT * FROM patients"; 
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data for each patient in a table
    echo "<table border='1'>
        <tr>
            <th>Patient ID</th>
            <th>Patient Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Phone Number</th>
        </tr>";
    
    // Loop through all patients and display their data
    while($row = $result->fetch_array()) {
        echo "<tr>
            <td>" . $row["patient_id"] . "</td>
            <td>" . $row["patient_name"] . "</td>
            <td>" . $row["age"] . "</td>
            <td>" . $row["gender"] . "</td>
            <td>" . $row["phone_number"] . "</td>
        </tr>";
    }
    echo "</table>";
} else {
    echo "No results found.";
}

$conn->close(); // Close the database connection
include 'footer.php'; // Include the footer file
?>

</body>
</html>

