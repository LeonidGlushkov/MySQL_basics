-- Записи created_at и updated_at были заданы типом VARCHAR. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
-- Создал БД для упр. 2
CREATE DATABASE dz5upr2;
USE dz5upr2;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

DESCRIBE users;
INSERT INTO users(created_at,updated_at) VALUE("20.10.2017 8:10", "20.10.2017 8:10");
SELECT created_at,updated_at from users;

-- добавил две коллонки для переноса данных из created_at, updated_at и воспользовался функцией STR_TO_DATE(str, format)
ALTER TABLE users 
	ADD COLUMN created_at_new DATETIME, ADD COLUMN updated_at_new DATETIME;
UPDATE users 
	SET created_at_new = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
		updated_at_new = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i');
-- удаляю колонки created_at, updated_at. 
ALTER TABLE users DROP created_at, DROP updated_at,
	RENAME COLUMN created_at_new TO created_at, RENAME COLUMN updated_at_new TO updated_at;