/* attach a submit handler to the form */
$("#createHouseForm").submit(function (event) {

    // stop form from refreshing
    event.preventDefault();


    var name = $("#name").val();
    var region = $("#region").val();
    var seat = $("#seat").val();

    if (name == '' || region == '' || seat == '') {
        alert("Please fill all fields.");
        return false;
    }

    $.ajax({
        type: "POST",
        url: "handler/addHouses.php",
        data: {
            name: name,
            seat: seat,
            region: region
        },
        cache: false,
        success: function (data) {
            alert(data);
        },
        error: function (xhr, status, error) {
            console.error(xhr);
        }
    });
});

// Checkbox za region
function regionFilter() {
    var checked = document.getElementById("region-checkbox").checked;
    var regionDiv = document.getElementById("region-div");
    if (checked == true) {
        regionDiv.style.display = "flex";
    } else {
        regionDiv.style.display = "none";
        displayRegion(0); // All regions - pada u default dole
    }

}

// Ne postoji regionID ali kao da postoji
//isti brojevi kao prvih 9 sigil.svg
function displayRegion(regionID) {
    var region;

    switch (regionID) {
        case 1: region = "Crownlands";
            break;
        case 2: region = "Stormlands";
            break;
        case 3: region = "Riverlands";
            break;
        case 4: region = "The Reach";
            break;
        case 5: region = "Westerlands";
            break;
        case 6: region = "The Vale";
            break;
        case 7: region = "The North";
            break;
        case 8: region = "Iron Islands";
            break;
        case 9: region = "Dorne";
            break;
        default: region = "All Regions";
    }

    var regionName = document.getElementById("region-name");
    regionName.innerHTML = region;

    var housesTable = document.getElementById("houses-table");
    var rows = housesTable.rows;
    var currentRow, currentRowRegion, i;
    var colorIterator = 1;

    for (i = 1; i < rows.length; i++) {

        currentRow = rows[i];
        currentRowRegion = currentRow.getElementsByTagName("td")[3].innerHTML.trim();

        // 0 is id , 1 is name , 2 is seat, 3 is region
        if (currentRowRegion == region || region == "All Regions") {
            currentRow.style.display = "";
            if (colorIterator % 2 == 0) {
                currentRow.style.backgroundColor = "#debc89";
            } else {
                currentRow.style.backgroundColor = "#efdabd";
            }
            colorIterator++;
        } else {
            currentRow.style.display = "none";
        }

    }

}
