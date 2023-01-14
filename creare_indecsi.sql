
-- ALTER TABLE accounts DROP INDEX `acc_username`;

CREATE INDEX acc_username
    ON accounts (username);

-- SELECT * FROM INFORMATION_SCHEMA.STATISTICS WHERE INDEX_NAME = 'acc_username';

-- ALTER TABLE articles DROP INDEX `art_category`;

CREATE INDEX art_category
    ON articles (category);

SELECT * FROM INFORMATION_SCHEMA.STATISTICS WHERE INDEX_NAME = 'art_category';
    
-- SELECT * FROM INFORMATION_SCHEMA.STATISTICS WHERE INDEX_NAME = 'com_usr_art';