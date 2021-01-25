-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 25 jan. 2021 à 16:22
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `musee`
--

-- --------------------------------------------------------

--
-- Structure de la table `Artiste`
--

CREATE TABLE `Artiste` (
  `numArtiste` int(11) NOT NULL,
  `nomArtiste` varchar(45) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `dateNaissance` date NOT NULL,
  `dateDeces` date NOT NULL,
  `numNationaliye` int(11) NOT NULL,
  `descriptionArtiste` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Auteur`
--

CREATE TABLE `Auteur` (
  `numOeuvre` int(11) NOT NULL,
  `numArtiste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `CourantArtistique`
--

CREATE TABLE `CourantArtistique` (
  `numCourant` int(11) NOT NULL,
  `nomCourant` varchar(45) NOT NULL,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  `descriptionCourant` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Exemplaire`
--

CREATE TABLE `Exemplaire` (
  `numero` int(11) NOT NULL,
  `numOeuvre` int(11) NOT NULL,
  `numMusee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Matiere`
--

CREATE TABLE `Matiere` (
  `numMat` int(11) NOT NULL,
  `nomMat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Musee`
--

CREATE TABLE `Musee` (
  `numMusee` int(11) NOT NULL,
  `nomMusee` varchar(45) NOT NULL,
  `numVille` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Nationalite`
--

CREATE TABLE `Nationalite` (
  `numNationalite` int(11) NOT NULL,
  `nomNationalite` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Oeuvre`
--

CREATE TABLE `Oeuvre` (
  `numOeuvre` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `annee` date NOT NULL,
  `dimensions` varchar(20) NOT NULL,
  `numType` int(11) NOT NULL,
  `numMat` int(11) NOT NULL,
  `numCourant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Participe`
--

CREATE TABLE `Participe` (
  `numCourant` int(11) NOT NULL,
  `numArtiste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Type`
--

CREATE TABLE `Type` (
  `numType` int(11) NOT NULL,
  `nomtype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Ville`
--

CREATE TABLE `Ville` (
  `numVille` int(11) NOT NULL,
  `nomVille` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Artiste`
--
ALTER TABLE `Artiste`
  ADD PRIMARY KEY (`numArtiste`),
  ADD UNIQUE KEY `idx_fl_numNationalite` (`numNationaliye`);

--
-- Index pour la table `Auteur`
--
ALTER TABLE `Auteur`
  ADD UNIQUE KEY `idx_fk_numOeuvre` (`numOeuvre`),
  ADD UNIQUE KEY `idx_fk_numArtiste` (`numArtiste`);

--
-- Index pour la table `CourantArtistique`
--
ALTER TABLE `CourantArtistique`
  ADD PRIMARY KEY (`numCourant`);

--
-- Index pour la table `Exemplaire`
--
ALTER TABLE `Exemplaire`
  ADD PRIMARY KEY (`numero`),
  ADD UNIQUE KEY `idx_fk_numOeuvre` (`numOeuvre`),
  ADD UNIQUE KEY `idx_fk_numMusee` (`numMusee`);

--
-- Index pour la table `Matiere`
--
ALTER TABLE `Matiere`
  ADD PRIMARY KEY (`numMat`);

--
-- Index pour la table `Musee`
--
ALTER TABLE `Musee`
  ADD PRIMARY KEY (`numMusee`),
  ADD UNIQUE KEY `idx_fk_numVille` (`numVille`);

--
-- Index pour la table `Nationalite`
--
ALTER TABLE `Nationalite`
  ADD PRIMARY KEY (`numNationalite`);

--
-- Index pour la table `Oeuvre`
--
ALTER TABLE `Oeuvre`
  ADD PRIMARY KEY (`numOeuvre`),
  ADD UNIQUE KEY `idx_fk_numType` (`numType`),
  ADD UNIQUE KEY `idx_fk_numMat` (`numMat`),
  ADD UNIQUE KEY `idx_fk_numCourant` (`numCourant`);

--
-- Index pour la table `Participe`
--
ALTER TABLE `Participe`
  ADD UNIQUE KEY `idx_fk_numCourant` (`numCourant`),
  ADD UNIQUE KEY `idx_fk_numArtiste` (`numArtiste`);

--
-- Index pour la table `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`numType`);

--
-- Index pour la table `Ville`
--
ALTER TABLE `Ville`
  ADD PRIMARY KEY (`numVille`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Artiste`
--
ALTER TABLE `Artiste`
  MODIFY `numArtiste` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `CourantArtistique`
--
ALTER TABLE `CourantArtistique`
  MODIFY `numCourant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Exemplaire`
--
ALTER TABLE `Exemplaire`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Matiere`
--
ALTER TABLE `Matiere`
  MODIFY `numMat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Musee`
--
ALTER TABLE `Musee`
  MODIFY `numMusee` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Nationalite`
--
ALTER TABLE `Nationalite`
  MODIFY `numNationalite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Oeuvre`
--
ALTER TABLE `Oeuvre`
  MODIFY `numOeuvre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Type`
--
ALTER TABLE `Type`
  MODIFY `numType` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Ville`
--
ALTER TABLE `Ville`
  MODIFY `numVille` int(11) NOT NULL AUTO_INCREMENT;
