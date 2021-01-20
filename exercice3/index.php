<?php
try
{
$pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
$db = new PDO('mysql:host=localhost;dbname=test', 'root', 'root');

$sql = 'SELECT UPPER(auteur) AS auteur_maj FROM news ORDER BY id DESC'; 

$requete = $db->query($sql); 

while ($news = $requete->fetch())
{
echo $news['auteur_maj'] . '<br />'; 
}
$requete->closeCursor(); } 
catch(Exception $e)
{
die('Erreur : '.$e->getMessage());
}


?>