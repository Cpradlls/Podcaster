<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>📻 podcaster</title>
  <meta name="description" content="que personne ne fasse la blaque avec la pod'castor 🦫">
</head>
<body><pre><?php

  // séparer ses identifiants et les protéger, une bonne habitude à prendre
  include "the-podcaster.dbconf.php";

  try {

    // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);

    // Requête de sélection 01
    $requete = "SELECT * FROM `episodes`";
    $prepare = $connexion->prepare($requete);
    $prepare->execute();
    $resultat = $prepare->fetchAll();
    print_r([$requete, $resultat]); // debug & vérification

    // Requête de sélection 02
    $requete = "SELECT *
                FROM `episodes`
                WHERE `episode_id` = :episode_id"; // on cible l'épisode dont l'id est ...
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(":episode_id" => 2)); // on cible l'épisode dont l'id est 2
    $resultat = $prepare->fetchAll();
    print_r([$requete, $resultat]); // debug & vérification

    // Requête d'insertion
    $requete = "INSERT INTO `episodes` (`episode_name`, `episode_description`, `episode_url`, `episode_podcast_id`)
                VALUES (:episode_name, :episode_description, :episode_url, :episode_podcast_id);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":episode_name" => "L'affaire Benalla (1/4) : l'inconnu de la Contrescarpe",
      ":episode_description" => "Mais qui sont ces policiers qui interpellent brutalement deux manifestants le 1er mai 2018, place de la Contrescarpe, à Paris ? Quelques semaines après la diffusion d’une vidéo sur les réseaux sociaux, la journaliste du \"Monde\", Ariane Chemin commence à s’intéresser à l’un d’eux. L’homme porte un brassard de police, mais les apparences peuvent être trompeuses…",
      ":episode_url" => "https://cdn.radiofrance.fr/s3/cruiser-production/2020/11/942a9fa8-8e02-43c7-ad06-3568d8c87099/l_affaire_benalla_episode_1_l_inconnu_de_la_contrescarpe.2020c41407e0005.ite_00111257_rsce.mp3",
      ":episode_podcast_id" => 1,
    ));
    $resultat = $prepare->rowCount(); // rowCount() nécessite PDO::MYSQL_ATTR_FOUND_ROWS => true
    $lastInsertedEpisodeId = $connexion->lastInsertId(); // on récupère l'id automatiquement créé par SQL
    print_r([$requete, $resultat, $lastInsertedEpisodeId]); // debug & vérification

    // Requête de modification
    $requete = "UPDATE `episodes`
                SET `episode_description` = :episode_description
                WHERE `episode_id` = :episode_id;";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
      ":episode_id"   => 4,
      ":episode_description" => "Dans \"Affaires sensibles\", une plongée au cœur de l’une des plus grandes intrigues de l’histoire religieuse : l’énigme de l’Arche d’alliance.\n\nUne affaire qui n'est pas sans rappeler le personnage d'Indiana Jones 🤠"
    ));
    $resultat = $prepare->rowCount();
    print_r([$requete, $resultat]); // debug & vérification

    // Requête de suppression
    $requete = "DELETE FROM `episodes`
                WHERE ((`episode_id` = :episode_id));";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array($lastInsertedEpisodeId)); // on lui passe l'id tout juste créé
    $resultat = $prepare->rowCount();
    print_r([$requete, $resultat, $lastInsertedEpisodeId]); // debug & vérification

  } catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce à notre try/catch
    exit("❌🙀💀 OOPS :\n" . $e->getMessage());

  }

?></pre></body>
</html>