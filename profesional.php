<?php
  $name = $_POST['name'];
  session_start();

  //conexion a la base de datos
  $conn = new mysqli("localhost", "root", "", "gimnasio1");
  $sql = "insert into trabajadores (nombre) values ('$name')";
  echo $sql;
  $conn->query($sql);
  $conn->close();
  $_SESSION['nompro'] = $name;
?>
