<?php
class Person{
    public $personID;
    public $name;
    public $houseID;
    public $title;
    public $gender;

    public function __construct($personID=null, $name=null, $houseID=null,
                                $title=null, $gender=null){
        $this->personID = $personID;
        $this->name = $name;
        $this->houseID = $houseID;
        $this->title = $title;
        $this->gender = $gender;

    }

    public static function getAll(mysqli $conn){

        //$sql = "SELECT * FROM `persons`";
        //we want the full result, including the name of the house not just the id, need data from both tables
        $sql = "SELECT p.personID as ppersonID, p.name as pname, h.name as hname, p.title as ptitle, p.gender as pgender, h.houseID as hhouseID 
        FROM persons as p INNER JOIN houses as h
        ON p.house = h.houseID
        ORDER BY ppersonID";        
        return $conn->query($sql);

    }

    public static function getById($personID, mysqli $conn){
        $sql = "SELECT * FROM `persons` WHERE `personID`=$personID";

        $myArray = array();
        $result = $conn->query($sql);

        if($result){
            while($row=$result->fetch_array()){
                $myArray[] = $row; //append the array, put the row to the end
            }
        }

        return $myArray;
    }

    public static function deleteById($personID, mysqli $conn){

        $sql = "DELETE FROM `persons` WHERE `personID`=$personID";
        return $conn->query($sql);

    }


    public static function add(Person $person, mysqli $conn){
         
         $sql = "INSERT INTO `persons` (`name`,`house`,`title`,`gender`) 
         VALUES('$person->name', '$person->houseID', '$person->title', '$person->gender')";
        
         return $conn->query($sql);

    }

public function update(mysqli $conn){
    $sql = "UPDATE persons 
        SET `name` = '$this->name',
        `houseID` = '$this->houseID', 
        `title` = '$this->title', 
        `gender` = '$this->gender'";

        return $conn->query($sql);
}


}

?>