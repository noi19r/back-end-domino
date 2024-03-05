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

$carts = [];

$result = mysqli_query($connect, "SELECT * FROM cart WHERE user_id = 1 ORDER BY created_at DESC");


while ($row = mysqli_fetch_assoc($result)) {

    $cart = new Cart($row['card_id'], $row['user_id'], $row['product_id'], $row['quantity'], $row['price'], $row['title'], $row['image_url'], $row['description'], $row['created_at']);
    array_push($carts, $cart);
}


echo json_encode($carts);
