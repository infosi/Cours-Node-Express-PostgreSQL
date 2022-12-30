# Comment construire une API RestFul avec NodeJS et avec PostgreSQL en base de donnée ?

# Cas pratique Level 1

1 - Cloner le repo - level 1  
```js
//Cloner le repo
Git clone level 1
```
2 - Installer l'extension ERD editor  
3 - Créer les tables dans ERD editor  
```js
//Création des tables
//sessions
id / serial / N-N
name / Character varying / N-N
description / text / N-N
room / Character varying / N-N
dateTime / timestamptz / N-N

//speakers
id / serial / N-N 
name / Character varying / N-N
bio / text / N-N
email / Character varying / N-N
pictureUrl / Character varying / N-N

//sessions_speakers
session_id / serial / N-N
speaker_id / serial / N-N
```
4 - Exporter le script SQL  
5 - Installer PostgreSQL 
```js
//installation
# Création du fichier de configuration du repository :
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import de la clé signé du repository :
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Mise à jour de la liste des packages :
sudo apt-get update

# Installation de PostgreSQL
sudo apt-get -y install postgresql
```
6 - Se connecter à PostgreSQL  
```js
//Accès aux commandes sql de postgres
sudo -u postgres psql

//Lister les bases de données
\l
```

7 - Créer un utilisateur  
```js
//Accéder au commandes CLI postgres en super utilisateur
sudo -s -u postgres

//Créer le nouvel utilisateur
//L’option -d va permettre à notre utilisateur de créer des bases.
// L’option -P va forcer l’affectation d’un mot de passe
createuser -d -P tony
```

8 - Créer une base de donnée  
```js
//Nous allons maintenant créer la base de données en spécifiant que 
//c’est mon utilisateur qui en est le possesseur (owner), d’où le -O
createdb -O tony sessions_conference
//ou depuis psql
create database sessions_conference
```

9 - Créer les tables  
```js
//Reprendre le code sql généré par ERD Editor
CREATE TABLE sessions
(
  id          serial            NOT NULL,
  name        character varying NOT NULL,
  description text              NOT NULL,
  room        character varying NOT NULL,
  dateTime    timestamptz       NOT NULL,
  PRIMARY KEY (id)
);
//...
```

10 - Ajouter les données dans les tables  
```js
//Utiliser les lignes SQL commençant par INSERT INTO, pour insérer les nouvelles données
INSERT INTO speakers (name, bio, email, pictureUrl)
VALUES (
  'John Doe',
  'Maître de toutes les choses en JavaScript. Berger de chat. Amoureux d''ECMAScript.',
  'john.doe@todou.com',
  'https://images.unsplash.com/photo-1596981665119-3c67b0a2d6d2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1393&q=80'
);
//...
```

11 - Contrôler l'ajout des données
```js
//Par exemple afficher le nom de tous les speakers
SELECT * FROM SPEAKERS;

//Par exemple afficher le nom de toutes les sessions
SELECT * FROM SESSIONS;

//...
```

# Cas pratique Level 2

1 - Installer le package NPM dotenv et le configurer  
2 - Ajouter la chaine de connexion à la base de donnée  
3 - Ajouter l'extension chrome JSON Formatter  
4 - Tester la route api/sessions  
5 - Installer l'extension Talend API Tester - Free edition  
6 - Tester de nouveau la route api/sessions  

# Cas pratique Level 3

1 - Implémenter et tester les routes avec Talend API Tester pour ajouter, modifier et supprimer une session  

# Cas pratique Level 4

1 - Adapter la version du projet actuel en ajoutant une table utisateur dans la bases de données  
2 - Implémenter les routes pour créer, modifier ou supprimer un utilisateur mais aussi pour connaître toutes les sessions associés à un visiteur  
3 - Améliorer la strucutre des fichiers et des dossiers  