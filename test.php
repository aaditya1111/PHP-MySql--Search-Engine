<!--
<img src = "naruto.jpg"/>
-->
<link rel="stylesheet" type="text/css" href="images_css.css">
<link rel="stylesheet" type="text/css" href="includes/css/second.css">
<link rel="stylesheet" type="text/css" href="images/cards.css">
<!-- Put logo here -->

<form action="test.php" method="get">
	<center>
		<input type = "text"  name="search_keyword" value = <?php echo $_GET['search_keyword']; ?> /> 
		<input type = "submit" value="Submit" />
	</center>
</form>

<?php
	$q = $_GET['search_keyword'];
	$q = explode(" ", $q);
	echo "Result for " . $q[0] . "<br/>";
	$path = "images/" . $q[0];
	?>
	<div id="wrapper">
	<div id="columns">

	<?php 
		if( $opendir = opendir($path)){
			while( ($file = readdir($opendir)) !== FALSE ){
				if( $file == '.' || $file == "..") continue;
				?>
				<div class="pin">
					<?php $pp = $path . "/" . $file?>
					<?php echo "<img src=\"$pp\"/>"; ?>
				</div>
				<?php		
			}
		}
	 ?>
	</div>
	</div>
	<?php
?>
