SHOW tables;
DESCRIBE users;
SELECT * FROM users;

-- 1. Подсчитайте средний возраст пользователей в таблице users.

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age FROM users;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT 
	DATE_FORMAT (DATE (CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))),'%W') AS day,
    COUNT(*) AS total
FROM
	users
GROUP BY
	day
ORDER BY
	total;
    
-- 3. Подсчитайте произведение чисел в столбце таблицы.
DROP TABLE IF EXISTS multiplication;
CREATE TABLE multiplication (
  id SERIAL,
 `value` INT UNSIGNED);
INSERT INTO multiplication VALUES (1,1),(2,2),(3,3),(4,4),(5,5); 
SELECT  * FROM multiplication;

-- т.к. ф-ции умножения в чистом виде нет, то воспользуемся свойством произведения логарифмов.
-- ln(xy)=ln(x)+ln(y)
SELECT ROUND(EXP(SUM(LN(id)))) as multiplication FROM multiplication;

