<?php include_once('includes/header.php'); ?>
<link rel="stylesheet" type="text/css" href="includes/css/cardsv2.css">
<?php
  /* utility functions*/
  function eFactor( $handler,$pageid,$count ){
    $q=" SELECT PageRank from pageranktable WHERE PageId = ".$pageid;
    $res=$handler->query($q);
    $re=$res->fetch();
    return 10*$count + $re['PageRank'];
  }

  function nQuery($handler, $keyword ){
    $query = " SELECT DISTINCT PageId, Keyword FROM nquerytable WHERE Keyword LIKE '{$keyword}%' ";
    $result = $handler->query( $query );
    return $result;
  }

  function getChilds($handler, $PageId ){ //It will return all the children along with their keywords
    $query = " SELECT ChildId, Keyword from containstable, nquerytable WHERE containstable.PageId = '{$PageId}' AND nquerytable.PageId = containstable.ChildId ";
    $result = $handler->query( $query );
    return $result;
  }

  function matcht1($handler, $keyword ){
    //echo "Keyword " . $keyword . "<br/>";
    $query = " SELECT PageId, Keyword from t1 WHERE Keyword LIKE '{$keyword}%' ";
    $result = $handler->query( $query );

    //if( count($result) <=0 ) echo "bhai dekh yarr";
    //$row = $result->fetch();
    //echo "Page Id " . $row['PageId'] . "<br/>";
    return $result; 
  }
?>
 
<?php
  try{
    $handler = new PDO('mysql:host=127.0.0.1;dbname=EngineX', 'root', '');
  } catch (PDOException $e) {
    die('Sorry, database problem');
  }
?>   
    
<body>
  <div class="row bcolor">
    <div class="col-xs-12 col-sm-6">
        <div class="col-xs-12 col-sm-2">
            <a href="index.php"> <img src="includes/css/logo1.png" style="height:37px" id="photo"> </a>
        </div>
        <form action="search_image.php" method="get">
            <div class="col-xs-12 col-sm-8">
                <input class="form-control" type="text" name="search_box" value=<?php echo $_GET['search_box']; ?> id="query">
            </div>
            <div class="col-xs-12 col-sm-2">
                <button type="submit" class="newbutton1"><i class="fa fa-search" aria-hidden="true"><b>Search</b></i></button>
            </div>
        </form>
    </div>
  </div> 



<?php
  if( !isset($_GET['search_box']) ){
    //redirect to index.php

  }

  $keywords_string = $_GET['search_box']; 
  $keywords_string = ltrim( $keywords_string ); //remove white space at beginning
  $keywords = explode(" ", $keywords_string); //slicing keywords for keyword_string
  
  $path = "images/" . strtolower( $keywords[0] );
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

<?php 
  $wiki_link = "https://en.wikipedia.org/wiki/Special:Search/" . $_GET['search_box'];
?>
  <div class="navbar navbar-default navbar-nav navbar-fixed-bottom bcolor">
  <center>
    <div class="container">

      <div class="btn-group ">
        <a href="index.php" class="btn btn-default newbutton2">
          <i class="fa fa-2x fa-home"></i>  Home
        </a>
        <a href="search.php?search_box=<?php echo $_GET['search_box'];?>" class="btn btn-default newbutton2">
          <i class="fa fa-2x fa-dashboard"></i>  General Search
        </a>
        <a href="<?php echo $wiki_link; ?>" class="btn btn-default newbutton2">
          <i class="fa fa-2x fa-wikipedia-w"></i>  Wikipedia Search
        </a>
        <a href="#" class="btn btn-default newbutton3">
          <i class="fa fa-2x fa-picture-o"></i>  Image Search
        </a>
        <a href="#" class="btn btn-default newbutton2">
          <i class="fa fa-2x fa-video-camera"></i>  Videos Search
        </a>
        <a   href="#" class="btn btn-default newbutton2">
          <i class="fa fa-2x fa-link"></i>Other Links
        </a>
      </div>
    </div>
  </center>
  </div><!--footer-->

</body>
</html>