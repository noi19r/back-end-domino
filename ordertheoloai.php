<?php
require_once 'dbconnect.php';

class Order
{
    public $id;
    public $title;
    public $price;
    public $image;
    public $type;
    public $weight;
    public $description;


    function __construct($id, $title, $price, $image, $type, $weight, $description)
    {
        $this->id = $id;
        $this->title = $title;
        $this->price = $price;
        $this->image = $image;
        $this->type = $type;
        $this->weight = $weight;
        $this->description = $description;
    }
}



function orders($type)
{
    $connect =  $GLOBALS['connect'];
    $orders = [];

    // thực hiện truy vấn để lấy thông tin từ bẳng orders theo loại (type) được truyền vào từ biến $type
    $result = mysqli_query($connect, "SELECT * FROM orders WHERE type = '$type'");


    while ($row = mysqli_fetch_assoc($result)) {

        $order = new Order($row['id'], $row['title'], $row['price'], $row['image'], $row['type'], $row['weight'], $row['description']);

        array_push($orders, $order);
    }
    return json_encode($orders);
}

/*
- $_GET['type'] là 1 siêu biến, nó lấy thông tin được truyền vào tham số type qua url( hay còn gọi là thông qua query parameters).

  ví dụ localhost/ordertheoloai.php?type=huybeo   
  tức là  $_GET['type'] có giá trị là `huybeo`

- isset($_GET['type']) là kiểm tra giá trị tham số 'type' có tồn tại hay không, nếu tồn tại thì trả về true, ngược lại trả về false

*/


if (isset($_GET['type'])) {
    echo orders($_GET['type']);
} else {
    echo "Chưa có thông tin loại đồ ăn cần tìm kiếm!";
}
