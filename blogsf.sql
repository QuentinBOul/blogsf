-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 21 mars 2022 à 08:27
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blogsf`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_crea` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526C4B89032C` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `post_id`, `username`, `text`, `date_crea`) VALUES
(5, 155, 'test1', 'je test la fonction commentaire', '2022-03-20 16:23:41'),
(6, 155, 'test1', 'je retest', '2022-03-20 16:57:37');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220317181708', '2022-03-17 18:18:16', 300),
('DoctrineMigrations\\Version20220319172316', '2022-03-19 17:23:45', 1625),
('DoctrineMigrations\\Version20220319185826', '2022-03-19 18:58:37', 318),
('DoctrineMigrations\\Version20220320134929', '2022-03-20 13:49:49', 885);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `auteur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datecrea` datetime NOT NULL,
  `lien_img` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `title`, `text`, `auteur`, `datecrea`, `lien_img`) VALUES
(153, 'Ceci est mon premier article', 'Je test un premier article', 'Admin', '2022-03-20 15:29:00', 'https://www.stockvault.net/data/2012/10/07/136244/preview16.jpg'),
(154, 'Ceci est un deuxieme article', 'Je fais ce 2e article a des fins de test', 'Admin', '2022-03-20 16:08:00', 'https://img-19.commentcamarche.net/cI8qqj-finfDcmx6jMK6Vr-krEw=/1500x/smart/b829396acc244fd484c5ddcdcb2b08f3/ccmcms-commentcamarche/20494859.jpg'),
(155, 'Ceci est mon dernier test', 'Je fais un dernier test concernant les articles du blog', 'Admin', '2022-03-20 17:19:00', 'https://static.wamiz.com/images/upload/17127142_2244568545769182_7436378995601440768_n(1).jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'Quenthan', '[]', '$2y$13$kBBTOcb4GBImknC6e6OAveEAHE.6p.EEuTPFeN1g4sSglfyLBkUY2'),
(2, 'testeur', '[]', '$2y$13$CxQad1EudtbD6/5IwTUdVuWUssq3pjlIWBv9h5Q/tNOdyK00Nho/m'),
(3, 'test', '[]', '$2y$13$L16e9R1eDu6DTnHzuatJze/6/UzvceuUpde/yf/DWinBiCFHOyKQ6'),
(4, 'test2', '[]', '$2y$13$9QIMRA2Ijp8GNeiGvcIzxuWgFAbY.j0KSIWuYr0R52dgo.4iwj2u6'),
(5, 'test4', '[]', '$2y$13$mSLEiBr8qnEX4NzKnFY6qOn9BhN3yTYELDrokHS..K63AC1w8J6PK'),
(6, 'test30', '[]', '$2y$13$kgx/7ZZqRMHx.I4ibmvMWeFYgB2vBeBT4pFGJpZ2Rn9d3SWQi02OS');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
