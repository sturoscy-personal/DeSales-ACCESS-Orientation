<?
session_start();
$_SESSION[access] = true;

$_SESSION[resp1] = '5';
$_SESSION[resp2] = '5';
$_SESSION[resp3] = '1';
$_SESSION[resp4] = '1';
// echo "OK";

if($_SESSION[resp1]== 5 ) {
 
}
?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


	<title>Check Your Understanding-Essentials</title>

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
				
          			<li><a href="../succeeding/succeeding.html">Succeeding</a></li>
				
          			<li class="current"><a href="../essentials/essentials.html">Essentials</a></li>
				
          			<li><a href="../services/services.html">Services &amp; Amenities</a></li>
			</ul>
		</div>



		<p class="first_question">1. WebAdvisor allows me to do all of the following <b>except:</b></p>


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
						<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="1" id="RadioGroup1_0" />register for courses.
					</label>  
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup1==2 || $_SESSION[uno] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?>  
				</td>    
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="2" id="RadioGroup1_1" />view grades.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup1==3 || $_SESSION[uno] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="3" id="RadioGroup1_2" />view my schedule.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup1==4 || $_SESSION[uno] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td>
					<label>
  						<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="4" id="RadioGroup1_3" />track my progress toward my goal.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup1 > 0 || $_SESSION[uno] == 'si') { echo "<img src='images/si.jpg' alt='Correct'   />" ;}  ?> 
				</td>
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup1" value="5" id="RadioGroup1_4" />request a new parking sticker.
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
					echo 'You can do all of these things with WebAdvisor, except request a parking sticker. <a href="http://www.desales.edu/default.aspx?pageid=9959" target="_blank">Learn more about WebAdvisor>></a>'    ;
 					
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





		<p class="questions">2. I'm eligible to defer tuition until after the end of the session if:</p>


		<form id="form2" name="form2" method="get" action="#" style="padding-left: 10px">
    		<table width="600">
      			<tr>
        			<td style="width: 25px; height: 25px" >
					<? if ( $RadioGroup2==1 || $_SESSION[dos] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td> 
					<label>
						<input style="margin-right: 20px" type="radio" name="RadioGroup2" value="1" id="RadioGroup2_0" />my employer reimburses me for course work.
					</label>  
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup2==2 || $_SESSION[dos] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?>  
				</td>    
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup2" value="2" id="RadioGroup2_1" />I have applied for financial aid.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup2==3 || $_SESSION[dos] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup2" value="3" id="RadioGroup2_2" />I'm eligible for military benefits.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup2==4 || $_SESSION[dos] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?> 
				</td>
				<td>
					<label>
  						<input style="margin-right: 20px" type="radio" name="RadioGroup2" value="4" id="RadioGroup2_3" />I have set up a payment plan with the Office of the Bursar.
					</label>
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup2 > 0 || $_SESSION[dos] == 'si') { echo "<img src='images/si.jpg' alt='Correct'   />" ;}  ?> 
				</td>
				<td>
					<label>
          					<input style="margin-right: 20px" type="radio" name="RadioGroup2" value="5" id="RadioGroup2_4" />All of the above.
					</label>
				</td>
      			</tr>
    		</table>
    
    
    		<div class="jq-codeDemo jq-clearfix">
					 
			<input class="apaga2" type="image" src="images/boton.png" alt="Click Here" value="Go" style="margin-left: 110px; margin-top: 15px" /> 

			<p style="color:#000;margin-top:6px"  >
				<?  if ( $RadioGroup2  >0 || $_SESSION[dos] == 'si') 
				{ 	 
					$_SESSION[dos] = 'si';
					echo 'The correct answer is "All of the above." Click <a href="http://admissions.desales.edu/lifelong-learning/financial-aid/billing-and-payment/tuition-deferment.aspx" target="_blank">here</a> to get more informationabout tuition deferment.</a>';
 					
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









		<p class="questions">3. Advanced Placement, CLEP testing, portfolio assessment, and military <br />
		training are some ways to earn credit through prior learning assessment.</p>


 		<form id="form3" name="form3" method="get" action="#" style="padding-left: 10px">
    		<table width="600">
      			<tr>
        			<td style="width: 25px; height: 25px" >
					<? if ( $RadioGroup3 > 0 || $_SESSION[tres] == 'si') { echo "<img src='images/si.jpg' alt='Correct'   />" ;}  ?> 
				</td>
				<td> 
					<label>
						<input style="margin-right: 20px" type="radio" name="RadioGroup3" value="1" id="RadioGroup3_0" />True
					</label>  
				</td>
      			</tr>
      			<tr>
        			<td style="width: 25px; height: 25px">
					<? if ( $RadioGroup3==2 || $_SESSION[tres] == 'si') { echo "<img src='images/no.jpg' alt='Incorrect'   />" ;}  ?>  
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
					echo 'The correct answer is True. These are all ways to earn credit through priorlearning.'    ;
 					
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



<br />
<br />
<br />

 
</div>


</body>
</html>
