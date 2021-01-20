<?php
$db = new PDO('mysql:host=localhost;dbname=test', 'root', 'root');

//$sql = 'SELECT * FROM `news`';     // ceci est une requête
//$sql = 'SELECT auteur, titre, contenu FROM news';     // ceci est une requête
$sql = 'SELECT id, auteur, titre, contenu, dateAjout, dateModif FROM news ORDER BY id DESC'; // ceci est une requête ---DESC = par ordre Décroissant // ASC = Croissant

$requete = $db->query($sql); // variable pour récupérer le résultat de la requête (en réunissant les infos)

$news = $requete->fetch(); // permet de récupérer un des enregistrements de la requête pour l'afficher

echo $news['auteur'];


?>