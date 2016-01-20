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

SELECT *
FROM tasks
WHERE completed_at IS NULL;

