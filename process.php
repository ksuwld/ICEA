<?php
$host = '127.0.0.1';
$port = '8889'; 
$db   = 'ICEA'; 
$user = 'root';
$pass = 'root';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');
    $task = htmlspecialchars($_POST['task'] ?? '');

    if (!empty($name) && !empty($email)) {
        try {
            $pdo = new PDO($dsn, $user, $pass, $options);
            $stmt = $pdo->prepare("INSERT INTO feedback_requests (name, email, message) VALUES (?, ?, ?)");
            $stmt->execute([$name, $email, $task]);
            
            echo "success";
        } catch (\PDOException $e) {
            http_response_code(500);
            echo "error";
        }
    } else {
        http_response_code(400);
        echo "error";
    }
} else {
    http_response_code(405);
    echo "error";
}
?>