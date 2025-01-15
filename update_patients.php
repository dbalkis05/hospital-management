<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System - Update Patient</title>
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
    $patient_name = trim($_POST['patient_name'] ?? '');
    $age = trim($_POST['age'] ?? '');
    $gender = trim($_POST['gender'] ?? '');
    $phone_number = trim($_POST['phone_number'] ?? '');
    $address = trim($_POST['address'] ?? '');

    // Validate input before processing
    if (!empty($patient_id) && !empty($patient_name) && !empty($age) && !empty($gender) && !empty($phone_number) && !empty($address)) {
        require 'config.php'; // Re-establish database connection for the update query

        // SQL to update patient data
        $sql2 = "UPDATE patients SET patient_name=?, age=?, gender=?, phone_number=?, address=? WHERE patient_id=?";
        $stmt = $conn->prepare($sql2);
        $stmt->bind_param("sisssi", $patient_name, $age, $gender, $phone_number, $address, $patient_id);

        if ($stmt->execute()) {
            echo "<br><br>Record successfully updated.";
        } else {
            echo "Error: " . htmlspecialchars($stmt->error);
        }

        $stmt->close();
        $conn->close();
    } else {
        echo "<br><br>Please fill in all the required fields.";
    }
}
?>

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <table>
        <tr>
            <th colspan="2">Update Patient Information</th>
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
            <td>
                <label for="patient_name">Patient Name:</label>
            </td>
            <td>
                <input type="text" name="patient_name" required>
            </td>
        </tr>
        <tr>
            <td>
                <label for="age">Age:</label>
            </td>
            <td>
                <input type="number" name="age" required>
            </td>
        </tr>
        <tr>
            <td>
                <label for="gender">Gender:</label>
            </td>
            <td>
                <select name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="phone_number">Phone Number:</label>
            </td>
            <td>
                <input type="text" name="phone_number" required>
            </td>
        </tr>
        <tr>
            <td>
                <label for="address">Address:</label>
            </td>
            <td>
                <textarea name="address" required></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Update">
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

