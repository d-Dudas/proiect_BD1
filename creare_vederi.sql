-- DROP VIEW comment;

CREATE VIEW comment (username, article, comment)
 AS SELECT acc.username, art.id, com.comment
    FROM accounts acc, articles art, comments com
    WHERE acc.id = com.userId AND art.id = com.articleId;

-- SELECT * FROM comment;

-- SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'comment';

-- DROP VIEW article_contact;

CREATE VIEW article_contact (tiltu_articol, autor_articol, incarcat_de, email_contact, admin, data_incarcare)
 AS SELECT art.titlu, art.autor, acc.username, acc.email, acc.ifAdmin, art.uploadDate
    FROM accounts acc, articles art
    WHERE acc.id = art.uploadedBy;

-- SELECT * FROM article_contact;

-- SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'article_contact';

-- DROP VIEW recommended_article_contact;

CREATE VIEW recommended_article_contact(titlu_articol, incarcat_de, email_contact, admin, data_incarcare)
    AS SELECT rec.titlu, acc.username, acc.email, acc.ifAdmin, rec.dataTrimitere
        FROM accounts acc JOIN suggested_articles rec ON acc.id = rec.trimisDe;

-- SELECT * FROM recommended_article_contact;

-- SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'recommended_article_contact';
