-- --------------------------------------------------------

/* 
    Creare tabelului pentru conturi
*/
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT, -- Cheie primara
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `vkey` varchar(256) NOT NULL,
  `verified` int(11) NOT NULL DEFAULT 0,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  `ifAdmin` int(11) NOT NULL,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '["international","politic","educatie","sanatate","opinii","infrastructura","administratie","cultura"]' CHECK (json_valid(`preferences`)),
  CONSTRAINT PK_accounts PRIMARY KEY (id)
);

-- --------------------------------------------------------

/* 
    Crearea tabelului pentru articole
*/
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titlu` varchar(128) NOT NULL,
  `autor` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `poster` text NOT NULL,
  `posterPosition` varchar(128) NOT NULL DEFAULT 'center center',
  `uploadedBy` int(11) NOT NULL,
  `uploadDate` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `category` varchar(128) NOT NULL,
  CONSTRAINT PK_articles PRIMARY KEY (id),
  CONSTRAINT FK_articles FOREIGN KEY (uploadedBy) REFERENCES accounts(id)
);

-- --------------------------------------------------------

/*  
    Crearea tabelului folosit la schimbarea parolei
*/

CREATE TABLE `change_password_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `vkey` varchar(256) NOT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `requestDate` datetime NOT NULL DEFAULT current_timestamp(),
  CONSTRAINT PK_change_password_keys PRIMARY KEY (id),
  CONSTRAINT FK_change_password_keys FOREIGN KEY (userId) REFERENCES accounts(id)
);

-- --------------------------------------------------------

/* 
    Crearea tabelului pentru comentarii
*/

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `comment` text NOT NULL,
  `articleId` int(11) NOT NULL,
  `commentDate` datetime NOT NULL DEFAULT current_timestamp(),
  CONSTRAINT PK_comments PRIMARY KEY (id),
  CONSTRAINT FK_comments_articleId FOREIGN KEY (articleId) REFERENCES articles(id),
  CONSTRAINT FK_comments_userId FOREIGN KEY (userId) REFERENCES accounts(id)
);

-- --------------------------------------------------------

/* 
    Crearea tabelului pentru cookies
*/

CREATE TABLE `login_cookies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `cookieKey` varchar(256) NOT NULL,
  CONSTRAINT PK_login_cookies PRIMARY KEY (id),
  CONSTRAINT FK_login_cookies FOREIGN KEY (userId) REFERENCES accounts(id)
);

-- --------------------------------------------------------

/*  
    Crearea tabelului pentru articole trimise de utilizatori
*/

CREATE TABLE `sent_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeAutor` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `titluArticol` varchar(128) NOT NULL,
  `fisierArticol` varchar(128) NOT NULL,
  `dataTrimitere` datetime NOT NULL DEFAULT current_timestamp(),
  CONSTRAINT PK_sent_articles PRIMARY KEY (id)
);

-- --------------------------------------------------------

/* 
    Crearea tabelului pentru mesaje trimise de utilizatori
*/

CREATE TABLE `sent_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nume` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `mesaj` text NOT NULL,
  `dataTrimitere` datetime NOT NULL DEFAULT current_timestamp(),
  CONSTRAINT PK_messages PRIMARY KEY (id)
);

-- --------------------------------------------------------

/*  
    Crearea tabelului pentru articole recomandate pentru utilizatori
*/

CREATE TABLE `suggested_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titlu` varchar(258) NOT NULL,
  `poster` text NOT NULL,
  `link` text NOT NULL,
  `category` varchar(128) NOT NULL,
  `trimisDe` int(11) NOT NULL,
  `dataTrimitere` datetime NOT NULL,
  CONSTRAINT PK_suggested_articles PRIMARY KEY (id),
  CONSTRAINT FK_suggested_articles FOREIGN KEY (trimisDe) REFERENCES accounts(id)
);

-- --------------------------------------------------------

-- Redenumire tabel
RENAME TABLE change_password_keys TO renew_password_keys;
