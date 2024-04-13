-- Crea la base de datos si no existe
CREATE DATABASE IF NOT EXISTS Login;

-- Usa la base de datos
USE Login;

-- Crea la tabla de usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    Usuario_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Contraseña VARCHAR(255) NOT NULL
);

-- Agrega una función para cifrar la contraseña con bcrypt
DELIMITER $$

CREATE FUNCTION hash_contraseña(plaintext VARCHAR(100)) RETURNS VARCHAR(255)
BEGIN
    DECLARE hashed_password VARCHAR(255);
    SET hashed_password = crypt(plaintext, CONCAT('$2a$', 10, MD5(RAND())));
    RETURN hashed_password;
END$$

DELIMITER ;
