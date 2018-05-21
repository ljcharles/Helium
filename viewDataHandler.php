<?php
/**
 * Created by PhpStorm.
 * User: fresh
 * Date: 2018-03-25
 * Time: PM 23:15
 */

require_once 'viewData.php';

/*
* Pour ajouter une expression dans Adobe After Effect, il faut cliquer sur Alt et sur le chronomètre à côté de la propriété texte source.
* Un exemple de code d'expression :
* drive = "C:/wamp/www/Helium/js/model.js"; Le chemin ne peut pas être relatif.
* $.evalFile (drive); // évalue et charge un fichier donné.
* setting.name; // permet d'afficher le texte.
*
* Aerender est le programme qui active le rendu de la vidéo
* - project ici le chemin absolu du projet after effect
* - compo le nom de la composition à rendre
* - output le chemin absolu vers la destination du fichier. Le rendu se fait en .avi ici pour le test la vidéo dure 8 secondes
*         et le rendu total à duré 2 min et 39 secondes avec un poids de 1.19 Go
* En ajoutant mon modele en parametre la vidéo pèse maintenant 8 Mo :) et le rendu à duré 1min.
* La commande à exécuter pour le rendu
* aerender -project C:\wamp\www\Helium\projet\fresh.aep -comp freshcompo -output C:\wamp\www\Helium\projet\test.avi
*
* ATTENTION : ne pas utiliser de guillemets pour les chemins
*
* Le lien vers l'exécutable aerender sur Windows
* C:\Program Files\Adobe\Adobe After Effects CC 2015\Support Files
*/
//can be used to temporarily extend the time limit
ini_set('max_execution_time', 300); //300 seconds = 5 minutes

if(isset($_GET)){
    $myData = new viewData();
    $result = $myData->getTexte();

    $text = 'var setting = { name: "' . $myData->getTexte() . '" };';
    $file = 'js\model.js';
    file_put_contents($file, $text,LOCK_EX);


    $cheminAdobe = '"C:\Program Files\Adobe\Adobe After Effects CC 2015\Support Files';
    $cheminProjet = __DIR__ . '"\projet\fresh.aep"';
    $nomComposition = '"FreshCompo"';
    $cheminSortie = __DIR__ . '"\projet\video.avi"';
    $increment = intval(4);
    $template = '"Rendu optimal"';

    $params = '-i ' . $increment . ' -reuse -mp';

    $commande = $cheminAdobe . '\aerender.exe" -project ' . $cheminProjet
        . ' -comp ' . $nomComposition
        . ' -RStemplate ' . $template
        . ' ' . $params
        . ' -output ' . $cheminSortie
        . ';';

    $videoSortiePath = "projet/video.mp4";
    if (file_exists($videoSortiePath)) unlink($videoSortiePath);

    // J'utilise ffmpeg un outil en ligne de commande pour convertir la vidéo en mp4 pour être lisible sur le web
    // On ne peut convertir qu'en avi directement depuis les versions cc de Adobe

    $commande2 = '"projet/FFmpeg/bin/ffmpeg.exe" -i "projet/video.avi" -sameq "projet/video.mp4"';

    $result .=  ' ' . utf8_encode(exec($commande)) . ' ' . exec($commande2) . ' ';

    usleep(1000000);
    $videoAvi = "projet/video.avi";
    if (file_exists($videoAvi)) unlink($videoAvi);

    echo $result;
}