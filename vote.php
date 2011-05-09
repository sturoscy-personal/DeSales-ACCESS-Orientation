<?
//User, password & database
$choice =$_POST['choice'];
$user="Your user";
$password="Your password";
$database="Your database";;
mysql_connect(localhost,$user,$password);
@mysql_select_db($database) or die( "Unable to connect to database");
// what choice did the user choose in flash?
if($choice == 1){
$query="UPDATE votesystem SET vote1=vote1+1";
}
if($choice == 2){
$query="UPDATE votesystem SET vote2=vote2+1";
}
if($choice == 3){
$query="UPDATE votesystem SET vote3=vote3+1";
}
if($choice == 4){
$query="UPDATE votesystem SET vote4=vote4+1";
}
mysql_query($query);
//Get values from the database
$query="SELECT * FROM votesystem";
$result=mysql_query($query);
mysql_close();
//What are the values from the database?
$vote1_out=mysql_result($result,0,"vote1");
$vote2_out=mysql_result($result,0,"vote2");
$vote3_out=mysql_result($result,0,"vote3");
$vote4_out=mysql_result($result,0,"vote4");
//Votes in total
$total=$vote1_out+$vote2_out+$vote3_out+$vote4_out;
//Info to send back to flash:
$values="&totalVotes=$total&vote1total=$vote1_out&vote2total=$vote2_out&vote3total=$vote3_out&vote4total=$vote4_out";
echo "$values";
?>
