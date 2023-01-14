-- Sa se identifice toti administratorii din baza de date si pentru fiecare sa se 
-- afiseze numarul articolelor publicate in prima jumatate a lunii

/* SELECT acc.username, COUNT(art.titlu) "articole_publicate"
    FROM accounts acc JOIN articles art ON acc.id = art.uploadedBy
    WHERE DAY(art.uploadDate) <= 15
    GROUP BY acc.username; */

-- -----------------------------------------------------

-- Sa se identifice toti administratorii din baza de data si pentru fiecare sa se
-- afiseze numarul articolelor recomandate si categoria in care a recomandat cele mai multe articole

/* SELECT username, SUM(nr_articole_sugerate) 'Articole in total', category 'Top category', MAX(nr_articole_sugerate) 'Articole din top category'
FROM (SELECT username, category, COUNT(titlu) nr_articole_sugerate
        FROM suggested_articles rec JOIN accounts acc ON rec.trimisDe = acc.id 
        GROUP BY trimisDe, category) temp
    GROUP BY username; */

-- -----------------------------------------------------

-- Sa se afiseze pentru fiecare administrator cate vizualizari au avut
-- articolele publicate de acesta pe 2022 in total, si in ce luna
-- a strans cele mai multe vizualizari

/* SELECT a.username, a.total_views, b.month, b.views_in_month 
    FROM (
        SELECT acc.username, SUM(art.views) "total_views"
            FROM accounts acc JOIN articles art ON acc.id = art.uploadedBy
            WHERE year(art.uploadDate) = 2022
            GROUP BY acc.username
    ) a JOIN (
        SELECT acc.username, MONTH(art.uploadDate) "month", SUM(art.views) 'views_in_month'
            FROM accounts acc, articles art
            WHERE acc.id = art.uploadedBy
            GROUP BY MONTH(art.uploadDate), acc.username
    ) b ON a.username = b.username
    GROUP BY a.username, total_views
    HAVING MAX('views_in_month') = 'views_in_month'; */

-- ----------------------------------------------------- 

-- Pentru fiecare articol sa se afiseze usernameul celui care l-a publicat,
-- titlu, autorul si pentru fiecare comentariu sa se afiseze o *. Daca articolul
-- nu are comentarii, atunci sa se afiseze: no comment;

/* SELECT acc.username, art.titlu, art.autor, 
    CASE
        WHEN COUNT(com.id) > 0 THEN LPAD(' ', COUNT(com.id), '*')
        ELSE "No comment"
    END "Nr. comentarii"
    FROM articles art LEFT JOIN comments com on art.id = com.articleId, accounts acc
    WHERE acc.id = art.uploadedBy
    GROUP BY art.titlu, art.autor; */

-- ----------------------------------------------------- 

-- Sa se afiseze luna in care au fost trimise cele mai multe
-- articole si mesaje de la utilizatori si numarul lunii, pe anul 2022. 
-- Sa se mai afiseze si luna a caror articole publicate au strans
-- cele mai multe vizualizari pe anul 2022.

SELECT luna, nr_mesaje_si_articole_trimise
    FROM (
        SELECT art.luna, (COALESCE(art.nr_articole_trimise, 0) + COALESCE(msg.nr_mesaje_trimise, 0)) 'nr_mesaje_si_articole_trimise' 
            FROM (
                SELECT MONTH(dataTrimitere) 'Luna', COUNT(id) 'nr_articole_trimise'
                    FROM sent_articles
                    GROUP BY MONTH(dataTrimitere)
            ) art LEFT JOIN (
                SELECT MONTH(dataTrimitere) 'Luna', COUNT(id) 'nr_mesaje_trimise'
                    FROM sent_messages
                    GROUP BY MONTH(dataTrimitere)
            ) msg ON art.luna = msg.luna
        UNION
        SELECT art.luna, (COALESCE(art.nr_articole_trimise, 0) + COALESCE(msg.nr_mesaje_trimise, 0)) 'nr_mesaje_si_articole_trimise' 
            FROM (
                SELECT MONTH(dataTrimitere) 'Luna', COUNT(id) 'nr_articole_trimise'
                    FROM sent_articles
                    GROUP BY MONTH(dataTrimitere)
            ) art RIGHT JOIN (
                SELECT MONTH(dataTrimitere) 'Luna', COUNT(id) 'nr_mesaje_trimise'
                    FROM sent_messages
                    GROUP BY MONTH(dataTrimitere)
            ) msg ON art.luna = msg.luna
    ) stat
    ORDER BY nr_mesaje_si_articole_trimise DESC LIMIT 1;




    