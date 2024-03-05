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

$orders = [];

// thực hiện truy vấn để lấy thông tin từ bẳng orders
$result = mysqli_query($connect, "SELECT * FROM orders");


// mysqli_fetch_assoc lặp qua từng dòng trong bảng (orders) kết quả và trả về một mảng $row chứa title, price, image
while ($row = mysqli_fetch_assoc($result)) {

    // tạo một đối tượng order từ thông tin trong mảng $row
    $order = new Order($row['id'], $row['title'], $row['price'], $row['image'], $row['type'], $row['weight'], $row['description']);

    // NOTE: nhớ bỏ comment để xem kết quả, hiểu nó sẽ tạo ra có gì bên trong mảng order
    // print_r($order);    return;


    // thêm đối tượng order vào mảng orders
    array_push($orders, $order);
}


echo json_encode($orders);
