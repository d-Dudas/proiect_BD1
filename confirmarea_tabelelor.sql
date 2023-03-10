
-- Confirmarea existentei tabelelor
SELECT * FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'test';

-- SELECT * FROM INFORMATION_SCHEMA.TABLES
    -- WHERE TABLE_NAME = 'accounts' AND TABLE_SCHEMA = 'test';

-- SELECT * FROM INFORMATION_SCHEMA.TABLES 
    -- WHERE TABLE_NAME = 'articles' AND TABLE_SCHEMA = 'test';

-- SELECT * FROM INFORMATION_SCHEMA.TABLES
    -- WHERE TABLE_NAME = 'renew_password_keys' AND TABLE_SCHEMA = 'test';

-- SELECT * FROM INFORMATION_SCHEMA.TABLES
    -- WHERE TABLE_NAME = 'comments' AND TABLE_SCHEMA = 'test';

-- SELECT * FROM INFORMATION_SCHEMA.TABLES
    -- WHERE TABLE_NAME = 'login_cookies' AND TABLE_SCHEMA = 'test';

-- SELECT * FROM INFORMATION_SCHEMA.TABLES
    -- WHERE TABLE_NAME = 'sent_articles' AND TABLE_SCHEMA = 'test';

-- SELECT * FROM INFORMATION_SCHEMA.TABLES
    -- WHERE TABLE_NAME = 'sent_messages' AND TABLE_SCHEMA = 'test';

-- SELECT * FROM INFORMATION_SCHEMA.TABLES
    -- WHERE TABLE_NAME = 'suggested_articles' AND TABLE_SCHEMA = 'test';

-- Vizualizarea structurii tabelelor
/* DESC accounts;
DESC articles;
DESC renew_password_keys;
DESC comments;
DESC login_cookies;
DESC sent_articles;
DESC sent_messages;
DESC suggested_articles; */


-- Vizualizarea constrangerilor
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_SCHEMA = 'test';

/* 
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'accounts' AND TABLE_SCHEMA = 'test';

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'articles' AND TABLE_SCHEMA = 'test';

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'renew_password_keys' AND TABLE_SCHEMA = 'test';

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'comments' AND TABLE_SCHEMA = 'test';

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'login_cookies' AND TABLE_SCHEMA = 'test';

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'sent_articles' AND TABLE_SCHEMA = 'test';

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'sent_messages' AND TABLE_SCHEMA = 'test';

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE TABLE_NAME = 'suggested_articles' AND TABLE_SCHEMA = 'test'; 
*/