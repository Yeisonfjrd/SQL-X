DROP DATABASE IF EXISTS twitter_db;
CREATE DATABASE twitter_db;
USE twitter_db;

-- Tabla users
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id INT AUTO_INCREMENT,
    user_handle VARCHAR(50) NOT NULL UNIQUE,
    email_address VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phonenumber CHAR(10) UNIQUE,
    follower_count INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    PRIMARY KEY(user_id)
);

INSERT INTO users(user_handle, email_address, first_name, last_name, phonenumber)
VALUES
('juanperez', 'juanperez@gmail.com', 'Juan', 'Perez', '3876543210'),
('mariagomez', 'mariagomez@gmail.com', 'Maria', 'Gomez', '3571234567'),
('rodrigoz', 'rodrigoz@gmail.com', 'Rodrigo', 'Zapata', '3765432109'),
('analuisa01', 'analuisa01@gmail.com', 'Ana', 'Luisa', '3498765432'),
('camilorivas', 'camilorivas@gmail.com', 'Camilo', 'Rivas', '3987654321');

-- Tabla followers
DROP TABLE IF EXISTS followers;

CREATE TABLE followers (
	follower_id INT NOT NULL,
    following_id INT NOT NULL,
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
	FOREIGN KEY(following_id) REFERENCES users(user_id),
	PRIMARY KEY(follower_id, following_id)
);

-- Trigger para evitar que un usuario se siga a sí mismo
DELIMITER $$
CREATE TRIGGER prevent_self_follow
BEFORE INSERT ON followers
FOR EACH ROW
BEGIN
	IF NEW.follower_id = NEW.following_id THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A user cannot follow themselves';
	END IF;
END $$
DELIMITER ;

INSERT INTO followers(follower_id, following_id)
VALUES
(1, 2), (2, 1), (3, 1), (4, 1), (5, 3);

-- Top 3 usuarios con más seguidores
SELECT users.user_id, users.user_handle, COUNT(followers.follower_id) AS followers
FROM users
JOIN followers ON users.user_id = followers.following_id
GROUP BY users.user_id
ORDER BY followers DESC
LIMIT 3;

-- Tabla tweets
DROP TABLE IF EXISTS tweets;

CREATE TABLE tweets (
	tweet_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    tweet_text VARCHAR(280) NOT NULL,
    num_likes INT DEFAULT 0,
    num_retweet INT DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    PRIMARY KEY (tweet_id)
);

INSERT INTO tweets(user_id, tweet_text)
VALUES
(1, 'HOLA, soy yeison'),
(2, 'Entrando en twitter'),
(3, 'HTML es un lenguaje de programacion'),
(1, 'Sigueme en https');

-- Tabla tweet_likes
DROP TABLE IF EXISTS tweet_likes;

CREATE TABLE tweet_likes (
	user_id INT NOT NULL,
    tweet_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id),
    PRIMARY KEY (user_id, tweet_id)
);

INSERT INTO tweet_likes(user_id, tweet_id)
VALUES (1, 3), (2, 3), (3, 4);

-- Contar likes por tweet
SELECT tweet_id, COUNT(*) AS like_count
FROM tweet_likes
GROUP BY tweet_id;