-- Не понял назначение CONSTRAINT и его синтаксис, могли бы Вы его пояснить.

-- Таблица файлов, которые могут добавлять пользователи.
CREATE TABLE mediafiles (
	id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
	user_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя",
	`name_file` VARCHAR(100) NOT NULL COMMENT "Название файла", 
	type_file_id INT UNSIGNED NOT NULL COMMENT "Идентификатор типа файла",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);
-- Таблица типов файлов
CREATE TABLE type_of_mediafiles (
	id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
	type_file VARCHAR(100) NOT NULL UNIQUE COMMENT "Описание типа файла",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (type_file_id) REFERENCES type_mediafiles(id)
);

-- Таблица лайков.
CREATE TABLE likes (
	id SERIAL PRIMARY KEY COMMENT "Идентификатор строки",
	user_who_like_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя, поставившего лайк",
	user_who_liked_id INT UNSIGNED NOT NULL COMMENT "Идентификатор пользователя, получившего лайк",
	what_liked_id INT UNSIGNED NOT NULL COMMENT "Идентификатор понравившегося файла",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
    FOREIGN KEY (user_who_like_id) REFERENCES users(id),
	FOREIGN KEY (user_who_liked_id) REFERENCES users(id),
	FOREIGN KEY (what_liked_id) REFERENCES mediafiles(id)
);
