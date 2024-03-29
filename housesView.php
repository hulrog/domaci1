<?php
    require "config.php";
    require "model/house.php";

    session_start();

    if(!isset($_SESSION['user_id'])){
        header('Location: index.php');//kick the user back to the index page if his ID is not set in the session
        exit();
    }
    
    $result = House::getAll($conn); 

    if(!$result){
        echo "Error with the query.<br>";
        die();
    }



?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style/housesView.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/mainHouses.js"></script>
    <script> //javascript that retains the scroll position
        window.addEventListener('scroll',function() {
        localStorage.setItem('scrollPosition',window.scrollY);
        },false); 

        window.addEventListener('load',function() {
        if(localStorage.getItem('scrollPosition') !== null)
            window.scrollTo(0, localStorage.getItem('scrollPosition'));
        },false);  
    </script>
    <title>Houses</title>

</head>

<body>


<h1>A Song of Ice and Fire</h1>
<h2>Houses</h2> 

<table class= "menu_buttons">
    <tr>
        <td><a href="home.php"> <button class="fancyButton"> View characters. </button></a> </td>
        <td><button class="fancyButton" onClick="document.getElementById('createHouseForm').scrollIntoView();"> Create house. </button> </td>
        <td><a href="housesView.php"> <button class="fancyButton"> Refresh. </button></a> </td>
    </tr>
</table>

<div id="region-filter-div">
<input type="checkbox" name="region-checkbox" id="region-checkbox" onclick="regionFilter()"> 
<span> Filter by region: </span>
<span id="region-name">All Regions</span>
</div>

<div id="region-div">
    <img class="region-img" src="sigils/1.svg" onclick="displayRegion(1)">
    <img class="region-img" src="sigils/2.svg" onclick="displayRegion(2)">
    <img class="region-img" src="sigils/3.svg" onclick="displayRegion(3)">
    <img class="region-img" src="sigils/4.svg" onclick="displayRegion(4)">
    <img class="region-img" src="sigils/5.svg" onclick="displayRegion(5)">
    <img class="region-img" src="sigils/6.svg" onclick="displayRegion(6)">
    <img class="region-img" src="sigils/7.svg" onclick="displayRegion(7)">
    <img class="region-img" src="sigils/8.svg" onclick="displayRegion(8)">
    <img class="region-img" src="sigils/9.svg" onclick="displayRegion(9)">
</div>

<table class = "table" id="houses-table">
    <thead>
        <tr>
            <th style="display:none">ID</th>
            <th>Name</th>
            <th>Seat</th>
            <th>Region</th>
            <th>Options</th>
            <th>Sigil</th>
        </tr>
    </thead>
    <tbody>
    <?php 
        //print out the rows only if there is something returned
        if($result->num_rows>0){
        $iterator = 0;
        while($row = $result->fetch_assoc()){

    ?>
        <?php
            if($iterator % 2 == 0){
        ?>
        <tr class="evenRow">
        <?php 
            } else {
        ?>
        <tr class="oddRow">
        <?php
            }
        ?>
            <td style="display:none"> <?php echo $row['houseID']; ?> </td>
            <td> <?php echo $row['name']; ?> </td>
            <td> <?php echo $row['seat']; ?> </td>
            <td> <?php echo $row['region']; ?> </td>
            <td> 
                <div id="row-buttons"> 
                    <a class="editButton" href="handler/updateHouses.php?houseID=<?php echo $row['houseID']; ?>">
                        <img class="row-button" src="icons/edit.png" style="height:40px"></img>
                    </a>
                    <a class="deleteButton" href="handler/deleteHouses.php?houseID=<?php echo $row['houseID']; ?>">
                        <img class="row-button" src="icons/delete.png" style="height:40px"></img> 
                    </a>
                    <a class="editButton" href="members.php?houseID=<?php echo $row['houseID']; ?>">
                        <img class="row-button" src="icons/member.png" style="height:40px"></img>
                    </a>
                </div>
            </td>
            <td>
                <img class="sigil-img" src="sigils/<?php echo $row['houseID']; ?>.svg" alt="Not Found" onerror='this.src="sigils/0.svg"'> 
            </td>
        </tr>

    <?php 
        $iterator++;
        } //ends the while
    ?>
    <?php
        } //ends the if for rows returned
    ?>
    </tbody>
</table>

<form id="createHouseForm" method="post" action="handler/addHouses.php">
    <h3>Create a house</h3>
    <div id="name-region">
    <label>Name</label>
    <input type="text" name="name" autocomplete="off"/>

    <label> Region </label>
    <select name="region" id="region">
        <option value="Crownlands">Crownlands</option>
        <option value="Stormlands">Stormlands</option>
        <option value="Riverlands">Riverlands</option>
        <option value="The Reach">The Reach</option>
        <option value="Westerlands">Westerlands</option>
        <option value="The Vale">The Vale</option>
        <option value="The North">The North</option>
        <option value="Iron Islands">Iron Islands</option>
        <option value="Dorne">Dorne</option>
    </select>
    
    </div>
    
    <div id="seat-label-box">
        <label>Seat</label>
        <input type="text" name="seat" autocomplete="off"/>
    </div>
    <button id="btn-add" type="submit">CREATE</button>

    <div id="attribution">   
        <p> Petar Tomić, Fakultet Organizacionih Nauka. Icons by: <a href="https://icons8.com">Icons8</a> </p>
    </div>

</form>


</body>
</html>