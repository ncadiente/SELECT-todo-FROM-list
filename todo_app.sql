ALTER DATABASE todo_app OWNER TO nickcadiente;

DROP USER IF EXISTS michael;

CREATE ROLE michael ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app WITH OWNER = nickcadiente;

\c todo_app;

CREATE TABLE tasks (
  id serial NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NULL,
  completed boolean NOT NULL DEFAULT false);

ALTER TABLE tasks
  DROP COLUMN completed,
  ADD COLUMN completed_at timestamp NULL,
  ALTER COLUMN completed_at SET DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
  VALUES('Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
  VALUES('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks(title, description)
  VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks(title, description)
  VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks(title, description)
  VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;





