<?php require_once("MySiteDB.php"); ?>
<?php
$note_id = $_GET['note'];
$query = "SELECT * FROM comments";
$select_comments = mysqli_query($link, $query);
while ($comments = mysqli_fetch_array($select_comments))
{
echo $comments ['created'], "<br>";
echo $comments ['comment'], "<br>";
}
?>