<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
$( document ).ready(function() {
    $("#kmeans_image").hide()
    console.log( "ready!" );
	$("#axes").hide();
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
                                        console.log(data["filename"]);
										$("#kmeans_image").attr("src", "./static/"+data["filename"])
                                        $("#kmeans_image").show()
                                		$("#axes").show()
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
<table>
<tr>{% for i in total_points %}
<td>{{i}}
</tr>
{% endfor %}</table>
</body>
</html>

