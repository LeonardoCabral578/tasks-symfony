CREATE DATABASE IF NOT EXISTS tasks_symfony;
USE tasks_symfony;

CREATE TABLE IF NOT EXISTS users(
id          INT(255) AUTO_INCREMENT NOT NULL, 
role        VARCHAR(50),
name        VARCHAR(100),
surname     VARCHAR(200),
email       VARCHAR(255),
password    VARCHAR(255),
created_at  DATETIME,
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

INSERT INTO users VALUES (NULL, 'role_user', 'Pepe', 'Cardenal', 'pepe@pepe.com', 'password', CURTIME());
INSERT INTO users VALUES (NULL, 'role_user', 'Manolo', 'Perez', 'manolo@manolo.com', 'password', CURTIME());
INSERT INTO users VALUES (NULL, 'role_user', 'Carlos', 'Sanchez', 'carlos@carlos.com', 'password', CURTIME());

CREATE TABLE IF NOT EXISTS tasks(
id          INT(255) AUTO_INCREMENT NOT NULL,
user_id     INT(255) NOT NULL,
title       VARCHAR(255),
content     TEXT,
priority    VARCHAR(20),
hours       INT(100),
created_at  DATETIME,
CONSTRAINT pk_tasks PRIMARY KEY(id),
CONSTRAINT fk_tasks_user FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;

INSERT INTO tasks VALUES (NULL, 1, 'Tarea 1', 'Contenido de prueba 1', 'high', 40, CURTIME());
INSERT INTO tasks VALUES (NULL, 1, 'Tarea 2', 'Contenido de prueba 2', 'low', 20, CURTIME());
INSERT INTO tasks VALUES (NULL, 2, 'Tarea 3', 'Contenido de prueba 3', 'medium', 10, CURTIME());
INSERT INTO tasks VALUES (NULL, 3, 'Tarea 4', 'Contenido de prueba 4', 'high', 50, CURTIME());