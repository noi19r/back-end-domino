<?php

require_once 'dbconnect.php';

class Notification
{
    public $title;
    public $content;
    public $image;

    public function __construct($title, $content, $image)
    {
        $this->title = $title;
        $this->content = $content;
        $this->image = $image;
    }
}


function getNotionfication()
{
    $connect =  $GLOBALS['connect'];
    $notifications = [];

    $result = mysqli_query($connect, "SELECT * FROM notification");

    while ($row = mysqli_fetch_assoc($result)) {
        $notification = new Notification($row['title'], $row['content'], $row['image']);
        array_push($notifications, $notification);
    }

    return json_encode($notifications);
}

echo getNotionfication();
