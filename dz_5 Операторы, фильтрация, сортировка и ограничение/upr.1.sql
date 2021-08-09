-- upr 1 в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
INSERT INTO users(created_at, updated_at) VALUES (now(),now());