<?
session_start();
$_SESSION[access] = true;

$_SESSION[resp9] = '5';
$_SESSION[resp10] = '2';
$_SESSION[resp11] = '2';
$_SESSION[resp12] = '1';
// echo "OK";

if($_SESSION[resp9]== 5 ) {
 
}
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


	<title>Check Your Understanding-Succeeding</title>

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

	<meta name="description" content="DeSales University is a private, four-year Catholic college for men and women administered by the Oblates of 
		St. Francis de Sales, providing premiere college education" />

	<meta name="keywords" content="DeSales University, university, DeSales, desales" />
 

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 

<link rel="stylesheet" href="http://static.jquery.com/files/rocker/css/reset.css" type="text/css" />
<link rel="stylesheet" href="../main.css" type="text/css" media="all" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />

<script type="text/javascript"   src="js/jquery-1.4.3.js"  language="javascript" >  </script>
<script type="text/javascript" src="js/custom.js"></script>
 

</head>

<body>



<div id="content"> 

		<div id="navigation_pages">
			<ul id="nav">
				<li class="flash_version"><a href="../index.html" title="Flash Version"><img src="../images/main_nav/flash_version.png" alt="Flash Version" /></a></li>

				<li><a href="../home.html" title="Home">Home</a></li>

				<li><a href="../welcome/welcome.html" title="Welcome">Welcome</a></li>
      				
          			<li><a href="../tools/tools.html">Tools</a></li>
				
				<li><a href="../connections/connections.html">Connections</a></li>
				
          			<li class="current"><a href="../succeeding/succeeding.html">Succeeding</a></li>
				
          			<li><a href="../essentials/essentials.html">Essentials</a></li>
				
          			<li><a href="../services/services.html">Services &amp; Amenities</a></li>
			</ul>
		</div>





		
		<p class="first_question">1. Which of the following are methods to enhance the ability to memorize?</p>


<?   
$RadioGroup1 = $_GET['RadioGroup1']    ;
$RadioGroup2 = $_GET['RadioGroup2']    ;
$RadioGroup3 = $_GET['RadioGroup3']    ;
$RadioGroup4 = $_GET['RadioGroup4']    ;
$RadioGroup5 = $_GET['RadioGroup5']    ;

?>

  	<form id="form1" name="form1" method="get" action="#" style="padding-left: 10px">
    		<table width="600">
      			<tr>
        			<td style="width: 25px; height: 25px" >
					<? if ( $RadioGroup1==1 || $_SESSION[uno] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td> 
					<label>
						<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="1" id="RadioGroup1_0" />Chunking.
					</label>  
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup1==2 || $_SESSION[uno] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?>  
				</td>    
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="2" id="RadioGroup1_1" />Mnemonics.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup1==3 || $_SESSION[uno] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="3" id="RadioGroup1_2" />Association.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup1==4 || $_SESSION[uno] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td>
					<label>
  						<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="4" id="RadioGroup1_3" />Using as many of the senses as possible.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup1 > 0 || $_SESSION[uno] == 'si') { echo "<img src='images/si.jpg' alt='Correct'   />" ;}  ?> 
				</td>
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="5" id="RadioGroup1_4" />All of the above.
					</label>
				</td>
      			</tr>
    		</table>
    
    
    		<div class="jq-codeDemo jq-clearfix">
					 
			<input class="apaga" type="image" src="images/boton.png" alt="Click Here" value="Go" style="margin-left: 110px; margin-top: 15px" /> 

			<p style="color:#000;margin-top:6px"  >
				<?  if ( $RadioGroup1  >0 || $_SESSION[uno] == 'si') 
				{ 	 
					$_SESSION[uno] = 'si';
					echo 'All of these are methods to enhance the ability to memorize.'    ;
 					
					echo ' <style type="text/css">
   						.apaga  {
	   						visibility:hidden ;
   						}
   					</style>  ';
				}  
				else if ($_SESSION[uno] == 'si' ) {
						
  					echo  	"jummmmmmmmmmm";  		
				}
				?>						
			</p>             
		</div>
	</form>





		<p class="questions">2. Trying to figure out my learning style is time better spent studying.</p>


		<form id="form2" name="form2" method="get" action="#" style="padding-left: 10px">
    		<table width="600">
      			<tr>
        			<td style="width: 25px; height: 25px" >
					<? if ( $RadioGroup2==1 || $_SESSION[dos] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td> 
					<label>
						<input style="margin-right: 20px" type="radio" name="RadioGroup2" value="1" id="RadioGroup2_0" />True
					</label>  
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup2 > 0 || $_SESSION[dos] == 'si') { echo "<img src='images/si.jpg' alt='Correct'   />" ;}  ?>  
				</td>    
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup2" value="2" id="RadioGroup2_1" />False
					</label>
				</td>
      			</tr>
    		</table>
    
    
    		<div class="jq-codeDemo jq-clearfix">
					 
			<input class="apaga2" type="image" src="images/boton.png" alt="Click Here" value="Go" style="margin-left: 110px; margin-top: 15px" /> 

			<p style="color:#000;margin-top:6px"  >
				<?  if ( $RadioGroup2 > 0 || $_SESSION[dos] == 'si') 
				{ 	 
					$_SESSION[dos] = 'si';
					echo 'The correct answer is False. Taking the time to determine your learning style will allow you to make the most out of time spent learning.'    ;
 					
					echo ' <style type="text/css">
   						.apaga2  {
	   						visibility:hidden ;
   						}
   					</style>  ';
				}  
				else if ($_SESSION[dos] == 'si' ) {
						
  					echo  	"jummmmmmmmmmm";  		
				}
				?>						
			</p>             
		</div>
	</form>




		<p class="questions">3. Reading a textbook is no different than reading the latest New York Times bestseller.</p>


		<form id="form3" name="form3" method="get" action="#" style="padding-left: 10px">
    		<table width="600">
      			<tr>
        			<td style="width: 25px; height: 25px" >
					<? if ( $RadioGroup3==1 || $_SESSION[tres] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td> 
					<label>
						<input style="margin-right: 20px" type="radio" name="RadioGroup3" value="1" id="RadioGroup3_0" />True
					</label>  
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup3 > 0 || $_SESSION[tres] == 'si') { echo "<img src='images/si.jpg' alt='Correct'   />" ;}  ?>  
				</td>    
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup3" value="2" id="RadioGroup3_1" />False
					</label>
				</td>
      			</tr>
    		</table>
    
    
    		<div class="jq-codeDemo jq-clearfix">
					 
			<input class="apaga3" type="image" src="images/boton.png" alt="Click Here" value="Go" style="margin-left: 110px; margin-top: 15px" /> 

			<p style="color:#000;margin-top:6px"  >
				<?  if ( $RadioGroup3 > 0 || $_SESSION[tres] == 'si') 
				{ 	 
					$_SESSION[tres] = 'si';
					echo 'The correct answer is False. Successful reading of a college-level textbookrequires preparation, attentiveness, and reflection.'    ;
 					
					echo ' <style type="text/css">
   						.apaga3  {
	   						visibility:hidden ;
   						}
   					</style>  ';
				}  
				else if ($_SESSION[tres] == 'si' ) {
						
  					echo  	"jummmmmmmmmmm";  		
				}
				?>						
			</p>             
		</div>
	</form>


			

		

		<p class="questions">4. Going to school as an adult is stressful and not meant for the faint of heart.</p>


		<form id="form4" name="form4" method="get" action="#" style="padding-left: 10px">
    		<table width="600">
      			<tr>
        			<td style="width: 25px; height: 25px" >
					<? if ( $RadioGroup4 > 0 || $_SESSION[cuatro] == 'si') { echo "<img src='images/si.jpg' alt='Correct'   />" ;}  ?> 
				</td>
				<td> 
					<label>
						<input style="margin-right: 20px" type="radio" name="RadioGroup4" value="1" id="RadioGroup4_0" />True
					</label>  
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup4==2 || $_SESSION[cuatro] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?>  
				</td>    
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup4" value="2" id="RadioGroup4_1" />False
					</label>
				</td>
      			</tr>
    		</table>
    
    
    		<div class="jq-codeDemo jq-clearfix">
					 
			<input class="apaga4" type="image" src="images/boton.png" alt="Click Here" value="Go" style="margin-left: 110px; margin-top: 15px" /> 

			<p style="color:#000;margin-top:6px"  >
				<?  if ( $RadioGroup4 > 0 || $_SESSION[cuatro] == 'si') 
				{ 	 
					$_SESSION[cuatro] = 'si';
					echo 'The correct answer is True. Practicing good study habits, learning tricks forsuccessful time management, and being good to yourself makes going backto school less stressful.'    ;
 					
					echo ' <style type="text/css">
   						.apaga4  {
	   						visibility:hidden ;
   						}
   					</style>  ';
				}  
				else if ($_SESSION[cuatro] == 'si' ) {
						
  					echo  	"jummmmmmmmmmm";  		
				}
				?>						
			</p>             
		</div>
	</form>		




<br />
<br />
<br />

 
</div>


</body>
</html>
