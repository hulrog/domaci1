<?php
class House{
    public $houseID;
    public $name;
    public $seat;
    public $region;

    public function __construct($houseID=null, $name=null, $seat=null, $region=null){
        $this->houseID = $houseID;
        $this->name = $name;
        $this->seat = $seat;
        $this->region = $region;

    }

    public static function getAll(mysqli $conn){

        $sql = "SELECT * FROM houses";
        return $conn->query($sql);

    }

    
    public static function deleteById($houseID, mysqli $conn){

        $sql = "DELETE FROM `houses` WHERE `houseID`=$houseID";
        return $conn->query($sql);

    }

   public static function add(House $house, mysqli $conn){
    //for the apostrophes King's Landing, Storm's End etc.
    $seat = mysqli_real_escape_string($conn, $house->seat);

    $sql = "INSERT INTO `houses` (`name`,`seat`,`region`) 
    VALUES('$house->name', '$seat', '$house->region')";
   
    return $conn->query($sql);

    }


}

?>