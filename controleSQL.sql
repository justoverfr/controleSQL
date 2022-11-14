-- 1]
-- -Sélectionnez tous les champs des films sortis après 1960.
-- -Sélectionnez le titre des films sortis avant 1960.

SELECT * FROM `film` WHERE YEAR(`date_sortie`) > '1960';
SELECT `titre` FROM `film` WHERE YEAR(`date_sortie`) < '1960';

-- 2]
-- -Changez la description du film dont l'ID est 35
UPDATE `film` SET `description`= 'Its Matrix time!' WHERE `id`='35';

-- 3]
-- -Insérez un nouveau film - Qu'il soit rattaché à au moins trois catégories. Donnez les requêtes SQL utilisées.
INSERT INTO `film` (`id`, `titre`, `slug`, `image`, `prix`, `description`, `date_sortie`) VALUES
(69, 'Avatar', 'avatar', 'avatar.jpg', 420, 'film le plus lucratif', '2009-12-16');

INSERT INTO `categorie` (`id`, `nom`, `slug`) VALUES
(42, 'Action', 'action');

INSERT INTO `films_categs` (`id_film`, `id_categorie`) VALUES
(69, 42),
(69, 49),
(69, 52);

-- 4]
-- -récupérez dans la même requête tous les commentaires du film dont l'ID est 43,
-- tous les champs du film 43, et tous les champs des utilisateurs ayant mis ces commentaires
SELECT c.commentaire, f.*, u.* FROM `commentaire` AS c
INNER JOIN film AS f ON c.id_film = f.id
INNER JOIN user AS u ON c.id_user = u.id;

-- 5]
-- -Supprimez le film dont le slug commence par "t"
DELETE FROM `film` WHERE `slug` LIKE 'T%';

-- 6]
-- -Récupérez tous les champs des utilisateurs qui ont mis des commentaires.
SELECT DISTINCT u.* FROM `commentaire` AS c
INNER JOIN `user` AS u WHERE c.id_user = u.id;

-- 7]
-- -Récupérez tous les champs des films de la catégorie dont l'ID est 51
SELECT DISTINCT f.* FROM `film` AS f
INNER JOIN `films_categs` AS fc ON fc.id_film = f.id AND fc.id_categorie = '51';

-- 8]
-- -faites la moyenne des notes des films du site
SELECT AVG(`note`) FROM `commentaire`;

-- 9]
-- -Récupérez tous les films sortis au mois de juin
SELECT * FROM `film` WHERE MONTH(`date_sortie`) = '06';

-- 10]
-- -Récupérez tous les utilisateurs dont le role est 1 et qui ont postés des commentaires.
-- Il ne doit pas y avoir de doublon.
SELECT DISTINCT u.* FROM `commentaire` AS c
INNER JOIN `user` AS u WHERE c.id_user = u.id AND u.role = '1';