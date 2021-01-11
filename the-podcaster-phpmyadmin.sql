-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `podcasts`;
CREATE TABLE `podcasts` (
  `podcast_id` int NOT NULL AUTO_INCREMENT,
  `podcast_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `podcast_description` text COLLATE utf8mb4_bin NOT NULL,
  `podcast_url` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`podcast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `podcasts` (`podcast_id`, `podcast_name`, `podcast_description`, `podcast_url`) VALUES
(1,	'Mécaniques du journalisme',	'Après Mécaniques du complotisme qui révélait les ressorts et les modes de propagation des rumeurs complotistes, France Culture plonge dans les coulisses de grandes enquêtes contemporaines pour mettre au jour la réalité du travail des journalistes, loin des idées toutes faites. Comment le quatrième pouvoir exerce-t-il son devoir d’inventaire de la démocratie ? Comment découvre-t-on un sujet d’enquête ? Comment se mène une investigation ? Comment convaincre des témoins de parler ? Elise Karlin dévoile, avec la contribution indispensable de leurs auteurs, les dessous de plusieurs grandes affaires récentes et leurs conséquences. Ce podcast, construit comme un thriller, est aussi une réflexion sur le métier de journaliste.\r\n« Affaires » Cahuzac, Benalla, Fillon, Lux Leaks … Quatre grandes enquêtes racontées à la première personne par des journalistes dont le travail a eu un impact sur la vie démocratique.',	'https://radiofrance-podcast.net/podcast09/rss_21810.xml'),
(2,	'Affaires sensibles',	'Les grandes affaires, les aventures et les procès qui ont marqué les cinquante dernières années.',	'http://radiofrance-podcast.net/podcast09/rss_13940.xml'),
(3,	'Les pieds sur terre',	'Tous les jours, une demi-heure de reportage sans commentaire.\r\n\r\nInspirés par la célébrissime émission de radio américaine This American Life, \"Les Pieds sur Terre\" s’organisent désormais autour de récits, d’histoires vraies, une, deux ou trois par émission, qui tournent autour d’un même thème. Ces histoires sont racontées à la première personne et nourries d’éléments de reportage.',	'http://radiofrance-podcast.net/podcast09/rss_10078.xml');

DROP TABLE IF EXISTS `episodes`;
CREATE TABLE `episodes` (
  `episode_id` int NOT NULL AUTO_INCREMENT,
  `episode_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `episode_description` text COLLATE utf8mb4_bin,
  `episode_url` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `episode_podcast_id` int NOT NULL,
  PRIMARY KEY (`episode_id`),
  KEY `episode_podcast_id` (`episode_podcast_id`),
  CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`episode_podcast_id`) REFERENCES `podcasts` (`podcast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `episodes` (`episode_id`, `episode_name`, `episode_description`, `episode_url`, `episode_podcast_id`) VALUES
(1,	'Cold case : l\'avocate des oubliés',	'Corinne est avocate, elle traite des affaires complexes et anciennes, non résolues. Avec ses collaborateurs, ils ne travaillent que pour les victimes, qui longtemps après le crime, peuvent toujours espérer trouver justice.',	'https://media.radiofrance-podcast.net/podcast09/10078-07.01.2021-ITEMA_22534695-2021C6612S0007.mp3',	3),
(2,	'Mes parents, ces complotistes',	'Leurs parents sont complotistes. Camille et Emma ne le sont pas ou, libérés de leur emprise, ne le sont plus. Ils témoignent des mécanismes qui les ont éloigné de leurs parents et de dialogues presque impossibles avec, au centre, le coronavirus qui a mis en lumière un certain nombre de théories.',	'https://media.radiofrance-podcast.net/podcast09/18722-21.12.2020-ITEMA_22520631-2020C6612S0356.mp3',	3),
(3,	'L\'affaire Cahuzac (1/4) : de l\'affaire Woerth à l\'affaire Cahuzac',	'Le 19 mars 2013, Jérôme Cahuzac, visé par une enquête pour blanchiment de fraude fiscale, démissionne du gouvernement. Ministre du Budget et fer de lance de la lutte contre les fraudeurs, il est soupçonné d’en être un lui-même, de fraudeur. Un délinquant en col blanc. Il dément avec véhémence, accuse Médiapart, le site qui a révélé l’affaire le 4 décembre 2012, de publier de fausses informations. Mais l’enquête est solide : elle s’appuie sur plusieurs mois de travail. Pourtant, le journaliste Fabrice Arfi a commencé à s’intéresser à Jérôme Cahuzac totalement par hasard…',	'https://cdn.radiofrance.fr/s3/cruiser-production/2020/10/276c702c-c09b-4e15-8b6d-27e7716fee92/l_affaire_cahuzac_episode_1_de_l_affaire_betancourt_a_l_affaire_cahuzac.2020c41407e0001.net_mfc_d85b2ea8-28bc-4a32-8af9-0e476a18ad0e.mp3',	1),
(4,	'L’Arche d’Alliance',	'Dans \"Affaires sensibles\", une plongée au cœur de l’une des plus grandes intrigues de l’histoire religieuse : l’énigme de l’Arche d’alliance',	'https://media.radiofrance-podcast.net/podcast09/13940-01.01.2021-ITEMA_22529004-2021F22805S0001.mp3',	2);

