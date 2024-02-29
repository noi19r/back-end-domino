<?php
header('Content-type:application/json');
$connect = mysqli_connect("localhost", "root", "", "db-domino");
mysqli_query($connect, "SET NAMES 'utf8'");
