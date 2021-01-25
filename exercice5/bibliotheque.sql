-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 25 jan. 2021 à 15:08
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `Bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `Auteur`
--

CREATE TABLE `Auteur` (
  `numAuteur` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Caracterise`
--

CREATE TABLE `Caracterise` (
  `numOuvrage` int(11) NOT NULL,
  `numMot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Ecrit`
--

CREATE TABLE `Ecrit` (
  `numAuteur` int(11) NOT NULL,
  `numOuvrage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Editeur`
--

CREATE TABLE `Editeur` (
  `numEditeur` int(11) NOT NULL,
  `nomEditeur` varchar(20) NOT NULL,
  `adresseEditeur` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Emprunte`
--

CREATE TABLE `Emprunte` (
  `numExemplaire` int(11) NOT NULL,
  `numEmprunteur` int(11) NOT NULL,
  `dateEmprunt` date NOT NULL,
  `dateRetour` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Emprunteur`
--

CREATE TABLE `Emprunteur` (
  `numEmprunteur` int(11) NOT NULL,
  `nomEmprunteur` varchar(45) NOT NULL,
  `adresseEmprunteur` text NOT NULL,
  `telephone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Exemplaire`
--

CREATE TABLE `Exemplaire` (
  `numExemplaire` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `dateAchat` date NOT NULL,
  `numOuvrage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Motcle`
--

CREATE TABLE `Motcle` (
  `numMot` int(11) NOT NULL,
  `mot` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Ouvrage`
--

CREATE TABLE `Ouvrage` (
  `numOuvrage` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `numEditeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Auteur`
--
ALTER TABLE `Auteur`
  ADD PRIMARY KEY (`numAuteur`);

--
-- Index pour la table `Caracterise`
--
ALTER TABLE `Caracterise`
  ADD KEY `idx_fk_numOuvrage` (`numOuvrage`),
  ADD KEY `idx_fk_numMot` (`numMot`);

--
-- Index pour la table `Ecrit`
--
ALTER TABLE `Ecrit`
  ADD KEY `idx_fk_numAuteur` (`numAuteur`),
  ADD KEY `idx_fk_numOuvrage` (`numOuvrage`);

--
-- Index pour la table `Editeur`
--
ALTER TABLE `Editeur`
  ADD PRIMARY KEY (`numEditeur`);

--
-- Index pour la table `Emprunte`
--
ALTER TABLE `Emprunte`
  ADD KEY `idx_fk_numExemplaire` (`numExemplaire`),
  ADD KEY `idx_fk_numEmprunteur` (`numEmprunteur`);

--
-- Index pour la table `Emprunteur`
--
ALTER TABLE `Emprunteur`
  ADD PRIMARY KEY (`numEmprunteur`);

--
-- Index pour la table `Exemplaire`
--
ALTER TABLE `Exemplaire`
  ADD PRIMARY KEY (`numExemplaire`),
  ADD KEY `idx_fk_numOuvrage` (`numOuvrage`);

--
-- Index pour la table `Motcle`
--
ALTER TABLE `Motcle`
  ADD PRIMARY KEY (`numMot`);

--
-- Index pour la table `Ouvrage`
--
ALTER TABLE `Ouvrage`
  ADD PRIMARY KEY (`numOuvrage`),
  ADD KEY `idx_fk_numEditeur` (`numEditeur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Auteur`
--
ALTER TABLE `Auteur`
  MODIFY `numAuteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Editeur`
--
ALTER TABLE `Editeur`
  MODIFY `numEditeur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Emprunteur`
--
ALTER TABLE `Emprunteur`
  MODIFY `numEmprunteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Exemplaire`
--
ALTER TABLE `Exemplaire`
  MODIFY `numExemplaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Motcle`
--
ALTER TABLE `Motcle`
  MODIFY `numMot` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Ouvrage`
--
ALTER TABLE `Ouvrage`
  MODIFY `numOuvrage` int(11) NOT NULL AUTO_INCREMENT;
