<?php
require_once 'dbconnect.php';



function orders($id)
{
    $connect =  $GLOBALS['connect'];



    $result = mysqli_query($connect, "SELECT * FROM orders WHERE id = '$id'");


    $row = $result->fetch_assoc();

    if ($row == null) {
        return "Không tìm thấy đồ ăn!";
    }
    return json_encode($row);
}



if (isset($_GET['id'])) {
    echo orders($_GET['id']);
} else {
    echo "Chưa có thông tin loại đồ ăn cần tìm kiếm!";
}
