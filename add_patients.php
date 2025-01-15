<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System</title>
</head>
<body>

<?php
require 'config.php'; // Include file to connect to the database
include 'menu.php'; // Include menu list from menu.php

if (!empty(trim(isset($_POST["patientName"])))) {
    $patientId = trim($_POST['patientId']);
    $patientName = trim($_POST['patientName']);
    $age = trim($_POST['age']);
    $gender = trim($_POST['gender']);
    $phoneNumber = trim($_POST['phoneNumber']);
    $address = trim($_POST['address']);

    // SQL query to insert data into the "patients" table
    $sql = "INSERT INTO patients (patient_id, patient_name, age, gender, phone_number, address) VALUES ('$patientId', '$patientName', '$age', '$gender', '$phoneNumber', '$address')";

    if ($conn->query($sql) === TRUE) {
        echo "<br><br>New patient record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
} else {
    echo "<br><br><br>";
}
?>

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <table>
        <tr>
            <td>
                <label for="patientId">Patient ID:</label>
                <input type="text" name="patientId" required>
            </td>
        </tr>

        <tr>
            <td>
                <label for="patientName">Patient Name:</label>
                <input type="text" name="patientName" required>
            </td>
        </tr>
        
        <tr>
            <td>
                <label for="age">Age:</label>
                <input type="number" name="age" required>
            </td>
        </tr>

        <tr>
            <td>
                <label for="gender">Gender:</label>
                <select name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" name="phoneNumber" required>
            </td>
        </tr>

        <tr>
            <td>
                <label for="address">Address:</label>
                <textarea name="address" required></textarea>
            </td>
        </tr>

        <tr>
            <td>
                <input type="submit" value="Submit">
            </td>
        </tr>
    </table>
</form>

<?php
include 'footer.php';
?>

</body>
</html>

