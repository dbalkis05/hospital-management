<?php
/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$servername = "sql12.freemysqlhosting.net";
$username = "sql12756932";
$password = "zR56np5wdd";
$dbname = "sql12756932";
 
/* Attempt to connect to MySQL database */
$conn = new mysqli($servername, $username, $password, $dbname);
$conn2 = new mysqli($servername, $username, $password, $dbname); 
 
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($conn2->connect_error) {
    die("Connection failed: " . $conn2->connect_error);
}
?>
