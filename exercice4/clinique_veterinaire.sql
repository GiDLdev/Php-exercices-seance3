-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 25 jan. 2021 à 11:24
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `clinique_veterinaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `Animal`
--

CREATE TABLE `Animal` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL,
  `DateNaissance` date NOT NULL,
  `DateDeces` date NOT NULL,
  `idProprietaire` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Chat`
--

CREATE TABLE `Chat` (
  `idAnimal` int(10) UNSIGNED NOT NULL,
  `idRace` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Chien`
--

CREATE TABLE `Chien` (
  `idAnimal` int(11) NOT NULL,
  `taille` varchar(20) NOT NULL,
  `poids` decimal(2,2) NOT NULL,
  `idRace` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Dossier`
--

CREATE TABLE `Dossier` (
  `id` int(10) UNSIGNED NOT NULL,
  `antecedents` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Effectuer`
--

CREATE TABLE `Effectuer` (
  `idGarde` int(10) UNSIGNED NOT NULL,
  `idVeterinaire` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Garde`
--

CREATE TABLE `Garde` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `heure_debut` varchar(5) NOT NULL,
  `heure_fin` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Horaire`
--

CREATE TABLE `Horaire` (
  `id` int(10) UNSIGNED NOT NULL,
  `jour` varchar(8) NOT NULL,
  `heureDebut` varchar(5) NOT NULL,
  `heureFin` varchar(5) NOT NULL,
  `idVeterinaire` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Medicament`
--

CREATE TABLE `Medicament` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL,
  `dosage` varchar(20) NOT NULL,
  `indications` text NOT NULL,
  `effetsSecondaires` text NOT NULL,
  `laboratoire` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Prescrire`
--

CREATE TABLE `Prescrire` (
  `idVisite` int(10) UNSIGNED NOT NULL,
  `idMedicament` int(10) UNSIGNED NOT NULL,
  `posologie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Proprietaire`
--

CREATE TABLE `Proprietaire` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `codepostal` decimal(5,0) NOT NULL,
  `ville` int(45) NOT NULL,
  `telephone` varchar(13) NOT NULL,
  `telephoneMobile` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Race_chat`
--

CREATE TABLE `Race_chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Race_chien`
--

CREATE TABLE `Race_chien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Veterinaire`
--

CREATE TABLE `Veterinaire` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `telephone` varchar(13) NOT NULL,
  `telephoneMobile` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Visite`
--

CREATE TABLE `Visite` (
  `id` int(10) UNSIGNED NOT NULL,
  `dateVisite` date NOT NULL,
  `heureVisite` varchar(5) NOT NULL,
  `raison` text NOT NULL,
  `idDossier` int(10) UNSIGNED NOT NULL,
  `idAnimal` int(10) UNSIGNED NOT NULL,
  `idVeterinaire` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Animal`
--
ALTER TABLE `Animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fk_idProprietaire` (`idProprietaire`);

--
-- Index pour la table `Chat`
--
ALTER TABLE `Chat`
  ADD KEY `idx_fk_idAnimal` (`idAnimal`),
  ADD KEY `idx_fk_idRace` (`idRace`);

--
-- Index pour la table `Chien`
--
ALTER TABLE `Chien`
  ADD KEY `idx_fk_idAnimal` (`idAnimal`),
  ADD KEY `idx_fk_idRace` (`idRace`);

--
-- Index pour la table `Dossier`
--
ALTER TABLE `Dossier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Effectuer`
--
ALTER TABLE `Effectuer`
  ADD KEY `idx_fk_idGarde` (`idGarde`),
  ADD KEY `idx_fk_idVeterinaire` (`idVeterinaire`);

--
-- Index pour la table `Garde`
--
ALTER TABLE `Garde`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Horaire`
--
ALTER TABLE `Horaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fk_idVeterinaire` (`idVeterinaire`);

--
-- Index pour la table `Medicament`
--
ALTER TABLE `Medicament`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Prescrire`
--
ALTER TABLE `Prescrire`
  ADD KEY `idx_fk_idVisite` (`idVisite`),
  ADD KEY `idx_fk_idMedicament` (`idMedicament`);

--
-- Index pour la table `Proprietaire`
--
ALTER TABLE `Proprietaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Race_chat`
--
ALTER TABLE `Race_chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Race_chien`
--
ALTER TABLE `Race_chien`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Veterinaire`
--
ALTER TABLE `Veterinaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Visite`
--
ALTER TABLE `Visite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fk_idDossier` (`idDossier`),
  ADD KEY `idx_fk_idAnimal` (`idAnimal`),
  ADD KEY `idx_fk_idVeterinaire` (`idVeterinaire`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Animal`
--
ALTER TABLE `Animal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
