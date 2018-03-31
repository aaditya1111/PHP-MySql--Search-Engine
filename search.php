<?php include_once('includes/header.php'); ?>
<link rel="stylesheet" type="text/css" href="includes/css/second.css">
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
<div id = "top_box">
  
  <form action="search.php" method="get" id = "top_form">
    <a href="index.php"> <img src="includes/css/logo1.png" id="photo"> </a>
    <input type="text" name="search_box" value = <?php echo $_GET['search_box']; ?> >
    <input type = "submit" value="Search" />
  </form>
</div>

<?php
  if( !isset($_GET['search_box']) ){
    //redirect to index.php

  }

  $keywords_string = $_GET['search_box']; 
  $keywords_string = ltrim( $keywords_string ); //remove while space at beginning
  $keywords = explode(" ", $keywords_string); //slicing keywords for keyword_string
  $count_keywords = count( $keywords ); //total no of keywords
  
  $temp_table = " Create TEMPORARY TABLE t1 ( `PageId`  INT, `Keyword` varchar(150),`KeyCount` INT); "; //this table will store the result of query
  $temp_result1 = $handler->query( $temp_table );

  $result = nQuery($handler,$keywords[0]);
  if( count($result) > 0 ){
    while( $row = $result->fetch() ){
      $temp_insert = " INSERT INTO t1  VALUES ";
      $ranking = eFactor( $handler,$row['PageId'],1 );
      $temp_insert .= "('{$row['PageId']}' , '{$row['Keyword']}', '{$ranking}' ); ";
      $resulto = $handler->query( $temp_insert );

      $childs = getChilds( $handler, $row['PageId'] ); //got all the ChildId and their keywords
      
      while( $temp=$childs->fetch() ) {
        //echo "while count " . $ff . "<br/>";
        //echo "temp child id " . $temp['ChildId'] . "<br/>";
        //$ff = $ff+1;
        $temp_insert = " INSERT INTO t1  VALUES ";
        $temp_insert .= "('{$temp['ChildId']}' , '{$temp['Keyword']}' , 0 ); ";
        $resulto = $handler->query( $temp_insert );
        //echo "ChildID : ". $temp['ChildId'] ."<br/>";
      }
    }
  }

  if( count($result) > 0){
    for($i = 1; $i<$count_keywords;$i++) { //take care of count of respective results
      
      $result1 = matcht1($handler,$keywords[$i]); //this contains (i+1)th level
      
      //echo "count of result1 " . count($result1) . "<br/>";
      //$rrr = $result1->fetch();
      //echo "value for result " . $rrr['PageId'] . "<br/>";
      while( $row = $result1->fetch() ){
        //echo "found in " . $i ."th iteration " . $row['PageId'] . "<br/>";
        $temp_insert = " UPDATE t1 SET KeyCount = " . eFactor($handler,$row['PageId'],$i+1). " where PageId = '{$row['PageId']}'";
        //$temp_insert .= "('{$row['PageId']}' , '{$row['Keyword']}', $i+1 ); ";
        $resulto = $handler->query( $temp_insert );
        //echo "Page Id found " . $row['Keyword'] . "<br/>";
        /*
        if( strtolower( $keywords[$i] ) == strtolower( $row['Keyword']) ){
          $temp_insert = " INSERT INTO t1  VALUES ";
          $temp_insert .= "('{$row['PageId']}' , '{$row['Keyword']}', $i+1 ); ";
          $resulto = $handler->query( $temp_insert );
        }*/

        $childs = getChilds($handler,$row['PageId']); 
        while( $temp = $childs->fetch()) {
          $temp_insert = " INSERT INTO t1  VALUES ";
          $temp_insert .= "('{$temp['ChildId']}' , '{$temp['Keyword']}', $i+1 ); ";
          $resulto = $handler->query( $temp_insert );
          //echo "ChildID : ". $temp['ChildId'] ."<br/>";
        }
      }
    }
  }

  //$time = microtime(true) - $time;
  //echo "<br/>Total time taken " . ($time*1000) . " ms<br/><br/>";

  //Only select distinct pages
  $q = "SELECT DISTINCT pagetable.PageId, Title,Description,Url  FROM t1,pagetable WHERE pagetable.PageId = t1.PageId ORDER BY KeyCount DESC ";
  $resu = $handler->query($q);



  /*Making some changes*/
  ?>
  <div id="wrapper">
    <div id="columns">
      <?php 
        while( $row = $resu->fetch() ){ 
            ?>  <a href= "<?php echo $row['Url']; ?> ">
              <div class="pin">
                <div class = "heading">
                  <?php echo $row['Title'] ?>
                </div>
                <div class="content"><p> <?php 
                  $string = $row['Description'];
                  //if( strlen($string) > 200 )
                  //  $string = substr($string, 0, 150 ) . "...";
                  echo $string; 
                  ?>  
                </p></div>
                <div class="url">
                  <h5><?php echo $row['Url']; ?></h5>
                </div>
              </div>
              </a>
            <?php
        }
      ?>
    </div>
  </div>
  <?php
  /*End of changes*/
  

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
        <a href="#" class="btn btn-default newbutton3">
          <i class="fa fa-2x fa-dashboard"></i>  General Search
        </a>
        <a href="<?php echo $wiki_link; ?>" class="btn btn-default newbutton2">
          <i class="fa fa-2x fa-wikipedia-w"></i>  Wikipedia Search
        </a>
        <a href="search_image.php?search_box=<?php echo $keywords[0]?>" class="btn btn-default newbutton2">
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