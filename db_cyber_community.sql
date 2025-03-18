-- Kiểm tra VERSION
SELECT VERSION();

-- DATABASE
CREATE DATABASE IF NOT EXISTS db_test; -- Tạo database
DROP DATABASE db_test; -- Xoá DATABASE
USE db_cyber_community;

-- TABLE
-- PRIMARY KEY: kết hợp của NOT NULL và UNIQUE

CREATE TABLE `Roles` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    `description` VARCHAR(255),
    `isActive` BOOL,
    
    `deletedBy` INT NOT NULL DEFAULT 0,
    `isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
    `deletedAt` TIMESTAMP NULL DEFAULT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DROP TABLE `Roles` -- Xoá TABLE
-- Đổi kiểu
ALTER TABLE `Roles`
MODIFY COLUMN `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT
-- Thêm dữ liệu
INSERT INTO `Roles`(`name`, `description`)
VALUES 
('ROLE_ADNIN', 'Quản trị hệ thống'),
('ROLE_USER', 'Người dùng hệ thống')

SELECT * FROM `Roles`
CREATE TABLE `Users`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn có
	 `email` VARCHAR(255) NOT NULL UNIQUE,
	 `fullName` VARCHAR(255),
	 `avatar` VARCHAR(255),
	 `password` VARCHAR(255),
	 `facebookId` VARCHAR(255) UNIQUE,
	 `googleId` VARCHAR(255) UNIQUE,
	 `roleId` INT NOT NULL DEFAULT 2,
	 -- mặc định luôn có
	 `deletedBy` INT NOT NULL DEFAULT 0,
    `isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
    `deletedAt` TIMESTAMP NULL DEFAULT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);	 

INSERT INTO `Users` (`email`, `fullName`, `password`) VALUES
('A@gmail.com', 'Trần Văn A', '1234'),
('B@gmail.com', 'Trần Văn B', '1234'),
('C@gmail.com', 'Trần Văn C', '1234'),
('D@gmail.com', 'Trần Văn D', '1234'),
('E@gmail.com', 'Trần Văn E', '1234')

SELECT * FROM `Users`;
SELECT `email` AS 'email_nguoi_dung' FROM `Users`;

CREATE TABLE `Foods`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`foodName` VARCHAR(255),
	`description` VARCHAR(255),
	
	
	-- mặc định luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
    `isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
    `deletedAt` TIMESTAMP NULL DEFAULT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Foods` (`foodName`, `description`) VALUES
('gỏi kem', 'gỏi được làm từ kem'),
('gỏi gà', 'gỏi được làm từ gà'),
('gỏi vịt', 'gỏi được làm từ vịt'),
('gỏi cá', 'gỏi được làm từ cá'),
('gỏi heo', 'gỏi được làm từ heo')
CREATE TABLE `Orders`(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`userId` INT NOT NULL,
	`foodId` INT NOT NULL,
	
	FOREIGN KEY (`userId`) REFERENCES `Users` (`id`),
	FOREIGN KEY (`foodId`) REFERENCES `Foods` (`id`),
	-- mặc định luôn có
	 `deletedBy` INT NOT NULL DEFAULT 0,
    `isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
    `deletedAt` TIMESTAMP NULL DEFAULT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

INSERT INTO `Orders` (`userId`, `foodId`)
VALUES
(1,2),
(3,1),
(2,5),
(1,3),
(3,2)

SELECT * FROM `Orders`
-- INNER JOIN
SELECT `UserId`, `foodId`, `fullName`, `password`
FROM `Orders`
INNER JOIN `Users` ON `Orders`.userId = `Users`.id
-- LEFT JOIN
SELECT `UserId`, `foodId`, `fullName`, `password`
FROM `Users`
LEFT JOIN `Orders` ON `Orders`.userId = `Users`.id
WHERE (`UserId` IS NOT NULL AND `foodId` IS NOT NULL)
