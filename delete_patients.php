<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System - Delete Patient</title>
</head>
<body>

<?php
require 'config.php'; // Include file to connect to the database
include 'menu.php'; // Include the menu list from menu.php

$sql = "SELECT * FROM patients"; // Fetch all records from the 'patients' table
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row if records are found
    echo "<table border='1'>
            <tr>
                <th>Patient ID</th>
                <th>Patient Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Phone Number</th>
                <th>Address</th>
            </tr>";
    
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . htmlspecialchars($row["patient_id"]) . "</td>
                <td>" . htmlspecialchars($row["patient_name"]) . "</td>
                <td>" . htmlspecialchars($row["age"]) . "</td>
                <td>" . htmlspecialchars($row["gender"]) . "</td>
                <td>" . htmlspecialchars($row["phone_number"]) . "</td>
                <td>" . htmlspecialchars($row["address"]) . "</td>
             </tr>";
    }
    echo "</table>";
} else {
    echo "No patient records found.";
}

$conn->close();

// Check if form data is submitted
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["patient_id"])) {
    $patient_id = trim($_POST['patient_id'] ?? '');

    if (!empty($patient_id)) {
        require 'config.php'; // Re-establish database connection for the delete query

        // SQL to delete patient data
        $sql2 = "DELETE FROM patients WHERE patient_id = ?";
        $stmt = $conn->prepare($sql2);
        $stmt->bind_param("i", $patient_id);

        if ($stmt->execute()) {
            echo "<br><br>Record successfully deleted.";
        } else {
            echo "Error: " . htmlspecialchars($stmt->error);
        }

        $stmt->close();
        $conn->close();
    } else {
        echo "<br><br>Please provide a valid Patient ID.";
    }
}
?>

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <table>
        <tr>
            <th colspan="2">Delete Patient Record</th>
        </tr>
        <tr>
            <td>
                <label for="patient_id">Patient ID:</label>
            </td>
            <td>
                <input type="text" name="patient_id" required>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Delete">
                <input type="reset" value="Reset">
            </td>
        </tr>
    </table>
</form>

<?php
include 'footer.php';
?>

</body>
</html>
