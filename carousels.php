<?php
require_once 'dbconnect.php';

class Carousel
{

    public $image;

    function __construct($image)
    {
        $this->image = $image;
    }
}

$carousels = [];

$result = mysqli_query($connect, "SELECT * FROM carousel");

while ($row = mysqli_fetch_assoc($result)) {
    $carousel = new Carousel($row['image']);
    array_push($carousels, $carousel);
}

echo json_encode($carousels);
