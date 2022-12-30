CREATE TABLE sessions
(
  id          serial            NOT NULL,
  name        character varying NOT NULL,
  description text              NOT NULL,
  room        character varying NOT NULL,
  dateTime    timestamptz       NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE sessions_speakers
(
  session_id serial,
  speaker_id serial
);

CREATE TABLE speakers
(
  id         serial            NOT NULL,
  name       character varying NOT NULL,
  bio        character varying NOT NULL,
  email      character varying NOT NULL,
  pictureUrl character varying NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE sessions_speakers
  ADD CONSTRAINT FK_sessions_TO_sessions_speakers
    FOREIGN KEY (session_id)
    REFERENCES sessions (id);

ALTER TABLE sessions_speakers
  ADD CONSTRAINT FK_speakers_TO_sessions_speakers
    FOREIGN KEY (speaker_id)
    REFERENCES speakers (id);

INSERT INTO speakers (name, bio, email, pictureUrl)
VALUES (
  'John Doe',
  'Maître de toutes les choses en JavaScript. Berger de chat. Amoureux d''ECMAScript.',
  'john.doe@todou.com',
  'https://images.unsplash.com/photo-1596981665119-3c67b0a2d6d2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1393&q=80'
);

INSERT INTO speakers (name, bio, email, pictureUrl)
VALUES (
  'Amelia Night',
  'Amelia Night code la nuit et durant la journée. Sa mission est de rendre le web accessible.',
  'laetitia.night@tonight.com',
  'https://images.unsplash.com/photo-1618422168181-177d9d0a1fca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
);

INSERT INTO sessions (name, description, room, dateTime)
VALUES (
  'Le futur du JavaScript',
  'Depuis sa création en 1995, JavaScript est devenu le langage le plus populaire du Web. Avec les nouveaux ajouts à la norme ECMAScript, il n''y a aucun signe de ralentissement à cet égard. Découvrez dans ce discours spectaculaire ce que l''avenir nous réserve.',
  'Porte 7',
  '2023-01-09 10:00:00-05'
);

INSERT INTO sessions (name, description, room, dateTime)
VALUES (
  'Introduction aux composants Web',
  'Avec les composants Web, les développeurs peuvent adopter une véritable architecture basée sur les composants, qui utilise les principales API du navigateur. Cela les rend facilement utilisables sur n''importe quel navigateur moderne. Venez découvrir dans cette session ce que sont les composants Web et comment ils peuvent vous faciliter la vie.',
  'Porte 42',
  '2023-01-09 11:00:00-05'
);

INSERT INTO sessions_speakers (session_id, speaker_id) VALUES (1, 1);
INSERT INTO sessions_speakers (session_id, speaker_id) VALUES (1, 2);
INSERT INTO sessions_speakers (session_id, speaker_id) VALUES (2, 2);

SELECT json_build_object(
  'id', t.id,
  'name', t.name,
  'description', t.description,
  'room', t.room,
  'dateTime', t."datetime",
  'speakers', json_agg(json_build_object(
    'id', s.id,
    'name', s.name,
    'bio', s.bio,
    'pictureUrl', s.pictureurl
    ))
  ) AS session
FROM sessions t
INNER JOIN sessions_speakers ts ON ts.session_id = t.id
INNER JOIN speakers s ON ts.speaker_id = s.id
GROUP BY t.id;