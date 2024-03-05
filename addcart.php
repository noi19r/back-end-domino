<?php

require_once 'dbconnect.php';
session_start();
$_SESSION['user_id'] = 1;

class Cart
{
    //card_id	user_id	product_id	quantity	price	title	image_url	description	created_at	


    public $card_id;
    public $user_id;
    public $product_id;
    public $quantity;
    public $price;
    public $title;
    public $image_url;
    public $description;
    public $created_at;
    function __construct($card_id, $user_id, $product_id, $quantity, $price, $title, $image_url, $description, $created_at)
    {
        $this->card_id = $card_id;
        $this->user_id = $user_id;
        $this->product_id = $product_id;
        $this->quantity = $quantity;
        $this->price = $price;
        $this->title = $title;
        $this->image_url = $image_url;
        $this->description = $description;
        $this->created_at = $created_at;
    }
}



function addCart($id, $quantity)
{
    $connect =  $GLOBALS['connect'];
    $user_id = $_SESSION['user_id'];
    $product =  mysqli_query($connect, "SELECT * FROM orders WHERE id = $id")->fetch_assoc();

    $product_id = $product['id'];
    $price = $product['price'];
    $title = $product['title'];
    $image_url = $product['image'];
    $description = $product['description'];

    $result = mysqli_query($connect, "Insert into cart (user_id, product_id, quantity, price, title, image_url, description) values ('$user_id', '$product_id', '$quantity', '$price', '$title', '$image_url', '$description')");

    if ($result) {

        mysqli_query($connect, "insert into notification (title,user_id, content, image) values ('Đặt hàng thành công', $user_id ,  'Đơn hàng của bạn đã được đặt thành công', '$image_url')");

        $result = mysqli_query($connect, "SELECT * FROM cart WHERE user_id = $user_id ORDER BY created_at DESC");
        $carts = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $cart = new Cart($row['card_id'], $row['user_id'], $row['product_id'], $row['quantity'], $row['price'], $row['title'], $row['image_url'], $row['description'], $row['created_at']);
            $carts[] = $cart;
        }
        return json_encode($carts);
    } else {
        return "Thêm vào giỏ hàng thất bại!";
    }
}

if (isset($_POST['id']) && isset($_POST['quantity'])) {
    echo addCart($_POST['id'], $_POST['quantity']);
} else {
    echo "Chưa có thông tin sản phẩm cần thêm vào giỏ hàng!";
}
