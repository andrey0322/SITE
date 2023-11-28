SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



CREATE TABLE `authors` 
(
  `id` smallint NOT NULL,
  `login` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `rights` enum('U','A') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `authors` (`id`, `login`, `password`, `rights`) VALUES
(1, 'ROOT', 'PAS', 'U'),
(2, '1111', 'PAS', 'U');



CREATE TABLE `comments` 
(
  `id` smallint NOT NULL,
  `created` date NOT NULL,
  `author_id` smallint NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `art_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `comments` (`id`, `created`, `author_id`, `comment`, `art_id`) VALUES
(1, '2022-09-04', 1, 'sdfhgsdhsdfhsdfh\r\n\r\n', 3);



CREATE TABLE `notes` 
(
  `id` smallint NOT NULL,
  `created` date NOT NULL,
  `title` varchar(20) NOT NULL,
  `article` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `notes` (`id`, `created`, `title`, `article`) VALUES
(3, '2023-09-05', 'sdfgsdfhg', 'sdfhgsdfhsdfhsdfgsdfgsdfg  \r\n'),
(4, '2023-10-01', 'sdfgsdfh', 'sdfhsdhsdfhsdfg');


ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `связь со статьей` (`art_id`),
  ADD UNIQUE KEY `2 связь со статьей` (`author_id`);


ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `authors`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `comments`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `notes`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
