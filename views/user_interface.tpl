<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
$( document ).ready(function() {
    $("#kmeans_image").hide()
    console.log( "ready!" );
	$("#axes").hide();
	$("#total").hide();
	$("#total1").hide();
	$("#cent").hide();
	$("#centroid1").hide();
               $( "#show" ).click(function() {
                        var xyObj = {};
                        xyObj["x"] = $( "#x" ).val();
                        xyObj["y"] = $( "#y" ).val();
						xyObj["cluster"] = document.getElementById("no_clusters").value;
						console.log(xyObj);
						var axis = $( "#x" ).val() + " " + "vs" + " " + $( "#y" ).val();
						console.log(axis);
						
						document.getElementById("axes").innerHTML = axis;
               			$.post("/cluster",xyObj,
								function(data, status){
										var json = JSON.parse(data);
                                        console.log(json["filename"]);
										console.log(json);
										$("#kmeans_image").attr("src", "./static/"+json["filename"])
                                        $("#kmeans_image").show()
										document.getElementById("total").innerHTML = json["total_points"];
										document.getElementById("centroid1").innerHTML = json["centroids"];
                                		$("#axes").show()
										$("#total1").show()
										$("#total").show()
										$("#cent").show()
										$("#centroid1").show()
										});
		});

});
</script>

</head>

<body>
<h1> Clustering </h1>
<br />
<b> Enter the number of clusters: </b>
<input type="text" id="no_clusters"></input>
<br /><br />
Select the Parameter1 : 
<select id="x">
<option value='Sepal_length'>Sepal Length</option>
<option value='Sepal_width'>Sepal Width</option>
<option value='Petal_length'>Petal Length</option>
<option value='Petal_width'>Petal Width</option>
</select>
<br><br>
Select the Parameter2:
<select id="y">
<option value='Sepal_length'>Sepal Length</option>
<option value='Sepal_width'>Sepal Width</option>
<option value='Petal_length'>Petal Length</option>
<option value='Petal_width'>Petal Width</option>
</select>
<br><br>
<input type="button" id="show" value="Get Cluster">
<br>
<img id="kmeans_image" src='' ></img>
<h2 id="axes"></h2>
<h6 id ="total1">Total number of points in the clusters:</h6>
<h6 id="total"></h6>
<h6 id ="cent">Centroid points:</h6>
<h6 id="centroid1"></h6>
</body>
</html>

