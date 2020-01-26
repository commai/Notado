<!DOCTYPE html>
<html>
    <head>
        <title>Notado</title>
        <script src="https://kit.fontawesome.com/df59a89bb6.js" crossorigin="anonymous"></script>
        <link href="style.css" rel = "stylesheet" type = "text/css">
        <link href='https://fonts.googleapis.com/css?family=Bad Script' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Capriola' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Bungee Shade' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Ewert' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Gudea' rel='stylesheet'>
        <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
        <script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol?callback=GetMap&key=Amz7sVmy4DZti1eXGEDm9ojQIrhHeujP11II_dHSjriH6uH_U75TT7RcgofOyitn' async defer></script>
        <script type='text/javascript'>
            var notado = {};
        
            function GetMap()
            {
                //var map = new Microsoft.Maps.Map('#map');
                
                notado.map = new Microsoft.Maps.Map('#map');
                
                navigator.geolocation.getCurrentPosition(function (position) {
                    var loc = new Microsoft.Maps.Location(
                        position.coords.latitude,
                        position.coords.longitude);

                    //Add a pushpin at the user's location.
                    var pin = new Microsoft.Maps.Pushpin(loc, {title: 'Current Location'});
                    notado.map.entities.push(pin);
                    pin.title = 'Current Location';
                    Microsoft.Maps.Events.addHandler(pin, 'click', function (e) {
						showratings('ratingsdisplay', pin.title); 
						e.target.setOptions({ color: 'red' });
					});
                    //Center the map on the user's location.
                    notado.map.setView({ center: loc, zoom: 14 });
                });
                //Add your post map load code here.
            }
            
            function showratings(classname, title){
                document.getElementsByClassName(classname)[0].style.visibility = "visible";
				document.getElementById("studyspace").innerHTML = title;
            }
        </script>
    </head>
    <body>
        <section id = "HOME">
            <div class="title">
                <h1>Notado</h1>
            </div>
            
            <div id = "map"> </div>
			
			<div class= "grid-container">
				<div class="inputloc">
					<form>
						Add Name of Location:<br>
					<input type="text" id="location" value=""><br>
						Latitude:<br>
					<input type="text" id="lat" value=""><br>
						Longitude:<br>
					<input type="text" id="long" value=""><br><br>
					</form>
					<button type="button" class = "button" onclick="getlocdata()"> Submit Location </button>
				</div>
            
				<div class="inputrating">
					<form>
						Rate Noise:<br>
					<input type="text" id="ratenoise" value=""><br>
						Rate Food Access:<br>
					<input type="text" id="ratefood" value=""><br>
						Rate Business/Availability:<br>
					<input type="text" id="ratebusiness" value=""><br><br>
					</form>
					<button type="button" class = "button" onclick="getratedata()"> Submit Review </button>
				</div>
            
			
			</div>
            
			<div class="ratingsdisplay">
					<p id = "studyspace"> </p>
					<p id= "noise"> Noise Rating: </p>
					<p id= "foodaccess"> Food Access Rating:</p>
					<p id= "businessavail"> Business/Availability Rating:</p>
			</div>
            
            
            <script>
                function newpin(x, y, name) {
                    var loc = new Microsoft.Maps.Location(
                        x,
                        y);
                    
                    
                    var pin = new Microsoft.Maps.Pushpin(loc, {title: name});
                    notado.map.entities.push(pin);
                    notado.map.setView({ center: loc, zoom: 14 });
					
					pin.title = name;
					
					Microsoft.Maps.Events.addHandler(pin, 'click', function (e) { 
						showratings('ratingsdisplay', pin.title); 
						e.target.setOptions({ color: 'red' });
					});
                }
                
                function getlocdata() {
                    var loc = document.getElementById("location").value
                    var lat = document.getElementById("lat").value
                    var long_ = document.getElementById("long").value
                    document.getElementById("location").value = "";
                    
                    newpin(lat, long_, loc);
                }
                
                function getratedata() {
                    var noise = document.getElementById("ratenoise").value
                    var food = document.getElementById("ratefood").value
                    var business = document.getElementById("ratebusiness").value
                }
            </script>
            
            
            
        </section>
        
    </bodystyle="background-image: background.jpeg;">
</html>


