DROP TABLE suggested_articles; 
DROP TABLE sent_messages;
DROP TABLE sent_articles;
DROP TABLE login_cookies;
DROP TABLE comments;
DROP TABLE change_password_keys;
DROP TABLE articles;
DROP TABLE accounts;

-- Creating the "accounts" table
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

-- Insert values
INSERT INTO `accounts` (`username`, `email`, `password`, `vkey`, `ifAdmin`, `preferences`) VALUES
('David', 'dudasdavid221@gmail.com', '0f96d17905c1c0f0670b5ce4c23f54ca', 'fe748384c7510c30801dc4816de85418', 1, '[\"international\",\"educatie\",\"sanatate\"]');

-- Insert values
INSERT INTO `accounts` (`username`, `email`, `password`, `vkey`, `ifAdmin`, `preferences`) VALUES ('Dudas', 'david.dudas03@e-uvt.ro', '06d902ded9f3adddb13c041fbc631449', 'd97c07a946fa87e56513732f60e58e4c', 0, '[\"international\",\"politic\",\"educatie\",\"sanatate\",\"opinii\",\"infrastructura\",\"administratie\",\"cultura\"]');

-- Create the `articles` table
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

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES
('A trăi bine, a trăi corect', 'Dudas David', '<p>&nbsp; &nbsp; &nbsp;“<i>- […] monstruos mi se pare că noi, cei de la țară, căutăm să ne săturăm cât mai repede, ca să ne putem vedea de treabă, pe când aici ne străduim să nu ne săturăm repede și de aceea mâncăm stridii…</i></p><p><i>- Firește, se grăbi să spună Stepan Arkadici… Dar tocmai ăsta e scopul culturii: să-ți faci din orice o plăcere.</i></p><p><i>- Dacă ăsta e scopul culturii, prefer să fiu un sălbatic</i>.” - Lev Tolstoi, Anna Karenina</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp;În viață sunt două mari categorii de personalități: cei care își trăiesc viața ca și cum ar avea un bilet de aur pentru o singură zi în cel mai special parc de distracții, căutând să-și petreacă fiecare fracțiune de secundă cu cele mai desăvârșite amuzamente, încercând orice îndeletnicire posibilă, având un singur scop, acela de a atinge fericirea maximă; și cei pentru care viața este o sarcină, sau un traseu pe parcursul căreia ei trebuie să realizeze cât mai multe lucruri care au un folos oarecare. Cea de-a doua categorie s-ar putea zice că e formată în mare parte din stoici, care sunt detașați de planul sentimental al vieții, care aspiră spre obiective de rang superior, sau obiective care - în viziunea lor despre lume - au un sens nobil. Acestea par a fi niște luptători incapabili de sentimente, care se uită cu o privire care dictează respect în ochii vieții, și o intimidează; și poate unii chiar sunt așa, dar poate există un strat care mai întâi făcea parte din prima categorie, dar după o mulțime de eșecuri, în locul fericirii ca scop al vieții a pus munca grea - ba chiar suferința -, sau s-a vizionat într-o luptă cu viața, uitând complet de fericire și ajungând în cea de-a doua categorie.</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp;Firește, în viață nu e nimic alb sau negru și deci majoritate oamenilor fac parte și din prima, și din a doua categorie, dar sub forma unor raporturi diferite, și în funcție de acest raport oamenii pot aparține un pic mai mult uneia dintre categorii. Un caz interesant e o personalitate care pare a aparține celei de-a doua categorii, dar totuși să caute un fel sentiment de fericire pe care îl găsește pe urma stilului de viață care coincide cu categoria a doua. Cred că am putea numi acest “un fel de sentiment de fericire” mulțumire de sine, și astfel să nu mai fie un caz special, ci unul destul de comun. Dar închid aici această paranteză.</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp;În citatul cu care am început această scriere sunt înfățișate câte un caracter din fiecare categorie. Unul dintre personaje aspiră spre fericire și acțiunile lui oglindesc foarte bine acest lucru: trăiește în lux, are o slujbă care nu prea îl preocupă, este prieten cu toată lumea și tocmai își înșelase soția. Om de cultură. Celălalt preferă să refuze cultura prietenului său și să rămână în cea de a doua categorie. Acesta e preocupat și stresat și de detalii nesemnificative, dar aspiră la o viață bine trăită, sau mai bine zis: corect trăită. E o foarte mare diferență.</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp;Fiecare dintre aceste două personaje abordează altfel viața. Interesant e că niciunul dintre ei nu au o viață liniștită, sau fericită. Deși viața lui Stepan Arkadici pare a fi mai atrăgătoare din cauza luxului și talentului lui de a-și face timp și pentru sexul opus, amuzamentele lui au și consecințe neplăcute - cum ar fi scena în care soția lui află de aventurile de care nu trebuie să afle, după planurile lui Stepan Arkadici. Iar personajul celălalt își face atâtea griji, încât a ales să se ascundă la țară de problemele societății distinse.&nbsp;</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp;Lev Tolstoi a reușit să lumineze astfel ceea ce face diferența adevărată dintre cele două abordări ale vieții: a trăi o viață bună, sau a trăi o viață corectă.&nbsp;</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp;Nici prin gând nu-mi trece a afirma că nu e corect să fim fericiți, dar fericirea nu trebuie să fie scopul, ci consecința vieții pe care o trăim.&nbsp;</p>', '../images/stepanArkadiciWithlevin.jpg', 'center left', 1, 'opinii');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Copacul', 'Slawomir Mrozek', '<p>&nbsp; &nbsp; &nbsp;Casa în care trăiesc se află lângă un drum. În cotul drumului e un copac.</p><p>&nbsp; &nbsp; &nbsp;Când eram copil, acest drum a fost unul de câmp, unul obișnuit, adică vara acoperit de praf, primăvara și toamna era noroios, iar iarna era acoperit de zăpadă, la fel ca și câmpia. Acum în fiecare anotimp e acoperit de asfalt.</p><p>&nbsp; &nbsp; &nbsp;Când eram tânăr, pe acest drum umblau care cu boi, dar numai din zori până la apusul soarelui. Îi știam pe toți, deoarece au fost de aici. Foarte rar vedeam trăsură de cai. Acum văd doar mașini, fără pauză, chiar și noaptea. Nu cunosc nici măcar unul. Apar de undeva, iar apoi dispar undeva.</p><p>&nbsp; &nbsp; &nbsp;Doar acest copac a rămas neschimbat, de primăvara până toamna stă verde. E pe suprafața mea de pământ.</p><p>&nbsp; &nbsp; &nbsp;Am primit o scrisoare de la Prefectură. “ Există prea multe șanse - se află în scrisoare - ca în orice moment să se întâmple un accident, ca o mașină să intre în copac, deoarece acesta se află în cotul drumului. Copacul trebuie tăiat.”</p><p>&nbsp; &nbsp; &nbsp;M-am întristat. Ce-i drept, copacul într-adevăr se află în cotul drumului, iar mașini sunt din ce în ce mai multe și din ce în ce mai rapide, mai sălbatice. În orice moment poate intra unul în copac.</p><p>Așa că mi-am luat pușca, m-am pus sub copac, și în momentul în care apare prima mașină, am și tras în el. Dar nu l-am nimerit. Dar m-au arestat și m-au dus în fața instanței.&nbsp;</p><p>&nbsp; &nbsp; &nbsp;Încercam să-i explic judecătorului că nu l-am nimerit doar pentru că nu mai văd așa de bine, dar dacă aș avea ochelari, n-aș mai greși. Dar degeaba.</p><p>&nbsp; &nbsp; &nbsp;Nu există dreptate în lume. Căci e adevărat că în orice moment o mașină poate intra în acel copac și îl poate răni. Dar dacă mi-ar da ei ochelari și muniție destulă, aș sta acolo, sub acel copac, cu cel mai mare drag, și aș avea grijă de el. De ce să-l tăi, dacă poți preveni și astfel accidentul?</p><p>Și nici nu ar costa mult. Doar nu pot fi o cheltuială prea mare gloanțele alea?</p>', '../images/R1.jpg', 'top center', 1, 'cultura');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Cafea, ceai', 'Slawomir Mrozek', '<p>&nbsp; &nbsp;- Cafea sau ceai? - întreba gospodina. Îmi place și una, și alta, iar acum sunt obligat să aleg. Așa vor ei să economisească.</p><p>&nbsp; &nbsp;Am fost învățat să fiu politicos, așa că nu am arătat cât de mult mă deranja această atitudine. Tocmai eram adânc implicat într-o discuție cu partenerul meu de masă, &nbsp; &nbsp;Profesorul, pe care încercam să-l fac să înțeleagă că idealismul este cel superior, nu materialismul, așa că m-am prefăcut că nici nu am auzit întrebarea.</p><p>&nbsp; &nbsp;- Ceai - răspunde fără nici o ezitare Profesorul. Un materialist idiot, normal că repede se și bagă în seamă.</p><p>&nbsp; &nbsp;- Dumneata? - mă întreba gospodina.&nbsp;</p><p>&nbsp; &nbsp;- Vă rog să mă iertați, trebuie să mă duc la toaletă.</p><p>&nbsp; &nbsp;Am pus batista pe masă, și m-am dus la closet. Nu aveam deloc nevoie să ies, dar am avut nevoie de timp să mă gândesc.</p><p>&nbsp; &nbsp;Dacă aleg cafea, nu primesc ceai, și vice-versa. Dacă omul se naște liber și egal, atunci asta se aplică la fel la cafea și ceai. Dacă aleg ceaiul, cafeaua va fi într-o situație defavorizată, și invers. Prin Drepturile Naturale ale cafelei și ale ceaiului e imposibil să iau decizia corectă.</p><p>&nbsp; &nbsp;Dar nu pot rămâne până la nesfârșit la closet, nu doar pentru că asta nu era Ideea Pură a Closetului, ci existent, adică un closet obișnuit.</p><p>&nbsp; &nbsp;Când m-am întors în sufragerie, toată lumea își sorbea ceaiul sau cafeaua. Era clar că au uitat de mine.&nbsp;</p><p>&nbsp; &nbsp;Asta m-a jignit până la sânge. Individul nu merită nici un fel de atenție sau toleranță. Nu urăsc nimic mai mult decât o societatea lipsită de suflet, de inimă, așa că în doi timpi și trei mișcări m-am și dus în bucătărie pentru a-mi solicita Drepturile Umane. Pe masă am observat samovarul cu cafetiera lângă și mi-am adus aminte că încă nu am rezolvat problema inițială, dacă doresc cafea sau ceai, adică ceai sau cafea. În mod firesc și una și alta - în loc de a mă împăca&nbsp; cu vreun compromis de orice natură. Fiindcă nu sunt doar bine educat, sunt și plin de tact, am rugat-o cât se putea de politicos pe gospodină, care se ocupa de treburile ei din bucătărie:</p><p>&nbsp; &nbsp;- Aș dori o jumătate de ceașcă de ceai și o jumătate de ceașcă de cafea.</p><p>&nbsp; &nbsp;Apoi am strigat:<br>&nbsp; &nbsp;- Și o bere!</p>', '../images/coffee_tea0.jpg', 'top right', 1, 'cultura');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Dezvoltarea', 'Sławomir Mrożek', '<p>&nbsp; &nbsp;Trăiesc. Ca un mod de relaxare îmi place să mă uit la gândacii de bucătărie. Separat nu sunt interesanți, însă împreună au un potențial extraordinar.</p><p>&nbsp;</p><p>&nbsp; &nbsp;De exemplu, ieri eram în bucătărie, fumam, iar ăștia tot fug dintr-o parte în alta. Și prin fuga lor monotonă dintr-odată se organizează în&nbsp;<i>Cina cea de Taină&nbsp;</i>a lui Leonardo da Vinci. Coincidență? Nu cred. Leagea solidă a dezvoltării, dinamica lui creatoare de grupuri, evoluție. Ajunge dacă societatea aleargă de aici încolo și înapoi, deja și apar rezultate.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Problema e că s-au și despărțit repede. Leonardo nu a durat mai mult de o secundă. Mi-am propus să mă duc după un spray pentru gândaci și apoi să aștept până ce ajung la un nou rezultat, îi omor și îi fixez. Am spray-ul, stau la pândă.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Ăștia nu se opresc. De parcă ar fi apărut Manet,&nbsp;<i>Dejunul pe iarbă.&nbsp;</i>Le-am lăsat să continue. Progresul era vizibil pe planul dezvoltării, cred că acum au ajuns la impresionism. Le-aș fixa, dar am eu dreptul să opresc dezvoltarea? Impresionismul este o realizare serioasă, dar dacă îi opresc, cine știe unde nu mai ajung, dar ar fi ajuns.&nbsp;</p><p>&nbsp;</p><p>&nbsp; &nbsp;Cubismul - să meargă.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Suprarealismul - să meargă.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Stau pregătit cu spray-ul în mână, dar nu acționez. Se știe că după ceva nou ceva și mai nou, adică după ceva bun ceva și mai bune trebuie să urmeze. Așa că, nu trebuie să-mi fac griji că au dispărut Leonardo cu cei ce l-au urmat, chiar din contră, asta-i dezvoltarea.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Deja ne regăsim în prezent. Cel mai superb. De exemplu Warhol. Dar nu mai e ultimul cuvânt, aproape-i clasic. Încă o tură, haideți, realizați ceva ce n-a mai fost. Iar eu aștept modernitatea cea mai la zi, adică ce e cel mai bun.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Dar ce se întâmplă, nu mai văd nimic, doar niște gândaci care tot fug de ici-colo. S-au obosit? Asta-i ceva decadență? Declinul artei? Mă uit cât se poate de concentrat, dar văd doar gândaci.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Vai, ce prost sunt! Cum aș putea să văd orice, dacă nu sunt destul de dezvoltat. Evident că deja au ajuns la secolul al XXV-lea (am trecut de miezul nopții, și aleargă destul de repede), iar eu sunt doar la sfârșitul secolului al XX-lea. Percepția nu poate să țină pasul cu ei, asta-i problema.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Am lăsat spray-ul pe masă și m-am dus la culcare. Revin peste cinci sute de ani.</p>', '../images/3.jpg', 'center right', 1, 'cultura');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Suedia reintroduce serviciul civil', 'Sebastian Jucan', '<p>&nbsp; &nbsp;„Observăm că în prezent aceste servicii nu au dimensiunea necesară în caz de alertă sau de atac armat. Experienţele din Ucraina sunt clare când este vorba despre protejarea populaţiei civile şi a activităţii sub mare presiune a unităţilor de salvare”, a explicat la aceeaşi conferinţă de presă ministrul suedez al apărării civile, Carl-Oskar Bohlin.</p><p>&nbsp;</p><p>&nbsp; &nbsp;„Serviciul civil” înseamnă că cetăţenii suedezi pot fi chemaţi în sprijinul autorităţilor în activităţi medicale sau ale serviciilor de urgenţă, pentru funcţionarea adecvată a acestora în caz de alertă sau de război.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Reintroducerea serviciului civil ar urma să vizeze iniţial între 1.500 şi 2.000 de persoane, care vor trebui să urmeze un program de pregătire.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Un raport elaborat toamna trecute de Agenţia pentru Urgenţe Civile menţiona necesitatea pregătirii a circa 3.000 de persoane în următorii cinci ani.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Suedia a luat în ultimul deceniu mai multe măsuri de consolidare a apărării, invocând tensiunile cu Rusia în regiune, şi a restabilit în anul 2017 serviciul militar obligatoriu ce fusese suspendat şapte ani mai devreme.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Noul guvern de dreapta instalat în urmă cu trei luni la Stockholm şi-a manifestat de asemenea intenţia ca înainte de anul 2026 să crească bugetul apărării la 2% din PIB, conform ţintei NATO, organizaţie la care Suedia şi Finlanda au decis să adere, demers îngreunat de condiţiile puse de Turcia şi asupra cărora.</p>', '../images/gruppbild-lb2.jpg', 'bottom center\r\n    ', 1, 'international');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Guvernul în judecată', 'Radu Striblea', '<p>&nbsp; &nbsp;\"2023 începe cu o veste bună! De peste un an de zile, Guvernul refuză să organizeze alegeri locale în peste 50 de localităţi în care s-a vacantat funcţia de primar. Aceste comunităţi locale sunt conduse de oameni care nu au legitimitatea dată de votul cetăţenilor. Guvernul încalcă grav Constituţia, legile ţării şi cele mai elementare norme de funcţionare a unei democraţii. Practic, Guvernul a interzis dreptul de vot pentru sute de mii de cetăţeni români, care sunt împiedicaţi de Guvern să îşi voteze primarul\", precizează Orban, duminică, într-o postare pe Facebook.</p><p>&nbsp;</p><p>&nbsp; &nbsp;El a arătat că, în calitate de parlamentar, a dat în judecată Guvernul pentru a obţine din partea unei instanţe o decizie care să oblige Executivul să emită hotărârea de guvern de stabilire a datei alegerilor.</p><p>&nbsp;</p><p>&nbsp; &nbsp;\"Văzând nesimţirea partidelor din coaliţie, dispreţul guvernanţilor faţă de dreptul de vot al oamenilor şi refuzul sistematic de a organiza alegeri la oricâte solicitări publice, am formulat ca parlamentar, am luat decizia că nu mai există nicio altă soluţie decât să dau în judecată Guvernul pentru a obţine din partea unei instanţe o decizie care să oblige Guvernul să emită hotărârea de guvern de stabilire a datei alegerilor. După 6 luni de la declanşarea procedurii, Curtea de Apel a stabilit primul termen de judecată pentru data de 6 februarie. Legea este clară. În termen de 90 de zile de la vacantarea postului de primar sau de la dizolvarea consiliului local, Guvernul este obligat să emită hotărârea de guvern de organizare a alegerilor\", a adăugat Orban.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Ludovic Orban a transmis că are încredere că \"judecătorii vor trata speţa cu toată atenţia şi că vor decide cât mai repede să facă dreptate, să determine Guvernul să respecte legea şi dreptul de vot al cetăţenilor români, drept garantat de Constituţie şi de lege\".</p>', '../images/image-2022-11-16-25906982-41-ludovic-orban-declaratii-parlament.jpeg', 'center center\r\n    ', 1, 'politic');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Șpagă sau „atenție”?', 'Andra Mureșan', '<p>&nbsp; &nbsp;Cadourile pe care părinții le oferă profesorilor de sărbători, zile de naștere sau la sfârșit de an școlar nu sunt un lucru tocmai nou. Țin minte și-acum când strângeam bani în clasele primare pentru asta și cât de uzual era acest lucru, fapt care m-a făcut să nu chestionez prea tare practica decât după foarte mult timp.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Discuția legată de darurile primite de cadrele didactice a apărut zilele acestea după ce Andra Berceanu, director executiv al Federației Părinților și Aparținătorilor Legali (FePal), a arătat într-o postare pe pagina sa de Facebook că un magazin online vinde un „Set cadou pentru profesoare” la prețul de 236 lei.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Cadoul este asociat chiar cu numele unui cadru didactic. Este vorba despre Claudia Chiru, profesor pentru învățământul primar și fondator al Saga Kid, un after-school din Titan.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Criticile care au început să apară din partea părinților erau legate de prețul ridicat al acestui pachet, felul în care sunt descrise persoanele cărora le este adresat acest produs, mai exact „pentru profesoare pretențioase și elegante”, dar și practica în sine, aceea de a primi cadouri de la copii.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Am vrut să vedem unde tragem linie între un simplu gest simbolic și mită și cum pot profesorii să pună punct acestui obicei al părinților de a cumpăra cadouri exorbitante pentru a-și arăta recunoștința.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Pentru a vedea și ce înseamnă asocierea unui cadru didactic cu un astfel de produs și cum afectează asta etica profesională, am luat legătura cu un dascăl cunoscut din România, și anume Doru Căstăian, profesor de științe socio-umane în Galați la Liceul de Artă „Dimitrie Cuclin”.</p>', '../images/image-2022-12-17-25970564-41-deschidere-scolar-romania-fotografie-ilustrativa.jpg', 'bottom right\r\n    ', 1, 'educatie');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Tratament împotriva bolii Alzheimer', 'Catalin Stanescu', '<p>&nbsp; &nbsp;Noul tratament, lecanemab, care va fi comercializat sub numele de Leqembi, este acum recomandat de Agenția Americană pentru Medicamente (FDA) pentru pacienții care nu au ajuns încă într-un stadiu foarte avansat al bolii.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Astfel, lecanemab, dezvoltat de Eisai Co Ltd 4523.T și Biogen Inc BIIB.O, este recomandat pentru pacienții aflați în stadiile incipiente ale bolii.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Accesul inițial al pacienților va fi limitat de o serie de factori, inclusiv deciziile de rambursare din partea Medicare, programul de asigurare guvernamental al SUA pentru americanii cu vârsta de 65 de ani și peste, care reprezintă aproximativ 90% dintre persoanele susceptibile de a fi eligibile pentru Leqembi.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Medicamentul este destinat pacienților cu tulburări cognitive ușoare sau cu demență Alzheimer precoce, o populație despre care medicii cred că reprezintă un segment mic din cei aproximativ 6 milioane de americani care trăiesc în prezent cu această boală care implică pierderea memoriei.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Leqembi a fost aprobat în cadrul procesului accelerat de revizuire al FDA.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Oficialii Eisai au spus că intenționează, de asemenea, să trimită date dintr-un studiu clinic recent pe 1.800 de pacienți, ca bază pentru o revizuire standard completă a Leqembi.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Acest studiu a constatat că Leqembi, care este administrat prin perfuzie, a încetinit rata declinului cognitiv la pacienții cu Alzheimer precoce cu 27%, comparativ cu un placebo.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp; &nbsp;Dar studiul a scos la iveală și efecte adverse grave: unii dintre pacienții tratați au suferit de hemoragii cerebrale. În plus, cel puțin o persoană care a primit tratamentul a murit, potrivit AFP.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Reuters scrie că aproape 13% dintre pacienții tratați cu Leqembi în cadrul studiului au prezentat edem cerebral. Autopsia unui pacient în vârstă de 65 de ani, care lua lecanemab și care a suferit un accident vascular cerebral a arătat că tratamentul de urgență cu un medicament standard pentru eliminarea cheagurilor a dus la hemoragie cerebrală fatală. Cel puțin un alt pacient dintr-un studiu ulterior cu lecanemab a murit din cauza hemoragiilor cerebrale, stârnind îngrijorarea că anticoagulantele pot crește riscul de umflare periculoasă a creierului.</p>', '../images/shutterstock_1111126898.jpg', 'center left\r\n    ', 1, 'sanatate');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Are zmeul drepturi?', 'Radu Rizoiu', '<p><i>&nbsp; &nbsp;– He says, ‘For Orcs, war solves everything’.</i>”</p><p>&nbsp;</p><p>&nbsp;</p><p><i>&nbsp; &nbsp;Warcraft</i>, Legendary Pictures, 2016</p><p>&nbsp;</p><p>&nbsp; &nbsp;Nu știu alții cum sunt, dar mie în tinerețe îmi plăceau jocurile video. Mă rog, și acum îmi plac, dar nu mai am timp pentru ele... Iar unul dintre jocurile favorite era <i>Warcraft</i>. Așa că am așteptat cu nerăbdare lansarea filmului omonim. Trebuie să mărturisesc că mi-a plăcut și filmul, deși nu este o capodoperă. Dar îmi amintea de vremurile când aveam timp să mă joc... Ei bine, filmul arată (în tușe destul de groase, dar când este vorba despre ființe nedelicate este de așteptat) cum și orcii sunt oameni. Un fel de Shreck... Iar oamenii pot fi mai răi decât orcii. În film (ca și în joc), orcii nu sunt ființe umane (ei provin dintr-un alt univers). Totuși, ei acționează după tiparul societății umane: sunt organizați social (în hoarde), au obiective pe termen lung (să cucerească teritoriul uman) și reguli după care se conduc (un fel de cod al onoarei vânătorești). În rest, orcii (cel puțin soldații) sunt mult mai puternici decât oamenii și sunt plasați într-o relație antagonică.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Imaginați-vă o ipoteză de „război în miniatură”; un meci de box (sau orice alt sport de contact). Înaintea meciului, cei doi pugiliști sunt angrenați într-un ritual prin care își desconsideră adversarul ca fiind un sportiv (dacă nu cumva și o ființă) inferior. Echipele tehnice construiesc această rivalitate pentru ca lupta din ring să fie cât mai apropiată de o bătălie reală. Apoi, însă, lupta începe și... se aplică un set de reguli. Cei doi luptători au un mișcări permise și mișcări nepermise, lupta este segmentată în reprize, există un juriu care apreciază punctele corect câștigate de fiecare sportiv. În momentul în care aceste reguli sunt încălcate, există o sancțiune. De exemplu, atunci când Mike Tyson l-a mușcat de ureche pe Evander Holyfield în celebrul meci de box din 1997, Tyson a fost descalificat și a pierdut meciul.</p><p>&nbsp;</p><p>&nbsp; &nbsp;La fel ar trebui să se întâmple și în război. Cel ce folosește mijloace care sunt considerate neoneste, ar trebui să fie penalizat. De către cine? De către arbitri. Cine sunt aceștia? Aici intervin dificultățile în practica internațională. Un răspuns simplu ar fi că este vorba despre marile puteri care ocupă locurile permanente în cadrul Consiliului de Securitate al Organizației Națiunilor Unite. Dar istoria a demonstrat că acești arbitri nu sunt atât de imparțiali pe cât ar trebui. Și totuși, comunitatea internațională poate să opereze în acest rol. Uneori este manipulată (a se vedea cazul armelor de distrugere în masă de care a fost acuzat Irakul înainte de războiul din 2003), alteori refuză să intervină (ocuparea Crimeii din 2014), dar, de regulă, după o analiză atentă (fie ea și <i>post factum</i>), comunitatea internațională are o reacție. Să nu uităm că în spații geografice aflate la antipozi, atât codul cavaleresc european, cât și Codul Bushido japonez implicau și ele anumite reguli. Astăzi ele se reflectă într-o serie de tratate internaționale cu privire la situația prizonierilor de război sau a victimelor civile.</p>', '../images/image-2022-03-24-25455772-41-radu-rizoiu.jpg', 'top center\r\n    ', 1, 'opinii');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Probleme pentru Centura Cluj', 'Sebastian Ion', '<p>&nbsp; &nbsp;Ambele proiecte ale Clujului au fost aprobate de Guvern în iunie, respectiv octombrie 2022, însă au rămas blocate în sertare. Din informațiile mele, guvernanții PSD-PNL nu au de gând să pornească licitațiile de lucrări în această iarnă”, spune fostul secretar de stat USR din timpul mandatului lui Cătălin Drulă la conducerea Transporturilor.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Potrivit acestuia, Studiul de fezabilitate pentru centura Cluj a fost contractat în 2018 și ar fi trebuit să fie gata în 12 luni.</p><p>&nbsp;</p><p>&nbsp; &nbsp;„După 4 ani de întârzieri și promisiuni nerespectate aflăm de la primarul Emil Boc că nu sunt bani europeni pentru tot proiectul și că etapa 1 care beneficiază de fonduri europene nu include și ocolirea celei mai mari și mai aglomerate comune din România, Florești”, explică Cosma.</p><p>&nbsp;</p><p>&nbsp; &nbsp;„În același timp, edilul Clujului ne mai spune persiflant că 50% din proiect e deja gata, se laudă că a semnat un al doilea protocol de colaborare cu CNAIR după cel din 2017, însă despre momentul lansării licitației de lucrări tace mâlc”, mai spune Cosma.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Acesta mai spune că și drumul expres de 5 km A3-Tureni, care reprezintă o veritabilă centură civilizată pentru extrem de aglomeratul Municipiu Turda, are probleme în implementare.</p><p>„Proiectarea „la cheie” trebuia să fie gata pe final de 2021, însă nici până astăzi nu e aprobat proiectul tehnic și lansată licitația de lucrări. Clujenii merită decidenți competenți și responsabili în guvernarea centrală și locală care să facă să se întâmple pe bune marile proiecte de infrastructură ale regiunii”, spune Cosma.</p>', '../images/image-2022-12-19-25973924-41-a3-centura-cluj-napoca.jpg', 'center center\r\n    ', 1, 'infrastructura');

INSERT INTO `articles` (`titlu`, `autor`, `text`, `poster`, `posterPosition`, `uploadedBy`, `category`) VALUES ('Periferia Bucureștiului', 'Catiușa Ivanov', '<p>&nbsp; &nbsp;În anii de haiducie imobiliară de după Revoluție, centrul orașului, unde puteai demola fără probleme clădiri vechi și ridica un bloc de până la 10 etaje, a fost ca un magnet pentru dezvoltatorii imobiliari. La fel s-a întâmplat și în cartierele de fițe ale orașului, Primăverii, Nordului sau Floreasca.</p><p>&nbsp;</p><p>&nbsp; &nbsp;După 2010 însă, când legislația pentru protecția patrimoniului s-a înăsprit, au apărut ONG-uri care apărau patrimoniul și spațiile verzi și a devenit mai greu de făcut ilegalități pe zona de urbanism. În plus, a crescut populația orașului și nevoia de locuințe ieftine, iar dezvoltatorii imobiliari au descoperit periferiile. Fostele platforme industriale, dar și fostele câmpuri ale orașului.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Practic aici, în ultimii 10 ani au apărut orașe noi. Este vorba despre fosta platformă industrială Pipera și câmpurile de la limita cu Voluntari, fosta platformă industrială de la ieșirea spre Autostrada Soarelui și câmpurile din spatele ei, toată zona din spatele bd. Metalurgiei, până la ieșirea din oraș, toată Prelungirea Ghencea, până la limita cu Chiajna, Bucureștii Noi, în zona lacurilor, dar și pe Șos. Sisești, până la Șoseaua de Centură, apoi zona Jandarmeriei.</p><p>&nbsp;</p><p>&nbsp; &nbsp;Din păcate însă, de cele mai multe ori, s-a construit haotic, cu străzi înguste, fără spațiu suficient între clădiri, fără trotuare, fără spații verzi, fără școli, grădinițe, spitale. Singurul care a dictat a fost interesul dezvoltatorului imobiliar și profitul acestuia. Iar autoritățile locale, care au aprobat fiecare proiect imobiliar din acest oraș au fost uneori nepricepute, alteori corupte (vezi dosarele DNA pentru șpăgile la PUZ-uri), alteori prea slabe pentru a apăra interesul public.</p>', '../images/image-2023-01-5-26005076-0-periferia-bucurestiului-11.webp', 'bottom center', 1, 'administratie');

-- --------------------------------------------------------

--
-- Table structure for table `change_password_keys`
--

CREATE TABLE `change_password_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `vkey` varchar(256) NOT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `requestDate` datetime NOT NULL DEFAULT current_timestamp(),
  CONSTRAINT PK_change_password_keys PRIMARY KEY (id),
  CONSTRAINT FK_change_password_keys FOREIGN KEY (userId) REFERENCES accounts(id)
);

--
-- Dumping data for table `change_password_keys`
--

INSERT INTO `change_password_keys` (`userId`, `vkey`) VALUES (1, '7a4d3e32722b910a857e9657866a5606');

INSERT INTO `change_password_keys` (`userId`, `vkey`) VALUES (1, 'dfc99d202599d96c7b3c66dcbc0551ef');

INSERT INTO `change_password_keys` (`userId`, `vkey`) VALUES (1, '46e00f0ebd0cae066f4394ccdee1738e');

INSERT INTO `change_password_keys` (`userId`, `vkey`) VALUES (1, '47eb6c3ce00a31d0c8573d2547a8cd6a');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

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

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`userId`, `comment`, `articleId`) VALUES (1, 'comment test 2', 11);

INSERT INTO `comments` (`userId`, `comment`, `articleId`) VALUES (1, 'În opinia mea ar fi fost mai bine dacă autorul ar fi dezvoltat partea din mijloc.', 11);

INSERT INTO `comments` (`userId`, `comment`, `articleId`) VALUES (1, 'În primul rând, ana nu mai are mere. În al doilea rând, ana nici nu avea mere. Ea e fan pere.', 11);

INSERT INTO `comments` (`userId`, `comment`, `articleId`) VALUES (1, 'Se putea si mai rau', 11);

-- --------------------------------------------------------

--
-- Table structure for table `login_cookies`
--

CREATE TABLE `login_cookies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `cookieKey` varchar(256) NOT NULL,
  CONSTRAINT PK_login_cookies PRIMARY KEY (id),
  CONSTRAINT FK_login_cookies FOREIGN KEY (userId) REFERENCES accounts(id)
);

--
-- Dumping data for table `login_cookies`
--

INSERT INTO `login_cookies` (`userId`, `cookieKey`) VALUES
(1, 'cfd8e46a7f8127d292e9834a0eff0397'),
(2, '9880c35db0db977a88796ae180af1099'),
(2, 'aa4f21c841d99a71832d0cade2fd0cde'),
(1, '94c245771545e4af1434b0360144cdc5'),
(1, '3e0b4cf4041ae9c18adf278f1d6584c5'),
(1, '422fff80a6c90b2c2a5bd4446432b928');

-- --------------------------------------------------------

--
-- Table structure for table `sent_articles`
--

CREATE TABLE `sent_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeAutor` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `titluArticol` varchar(128) NOT NULL,
  `fisierArticol` varchar(128) NOT NULL,
  `dataTrimitere` datetime NOT NULL DEFAULT current_timestamp(),
  CONSTRAINT PK_sent_articles PRIMARY KEY (id)
);

--
-- Dumping data for table `sent_articles`
--

INSERT INTO `sent_articles` (`numeAutor`, `email`, `titluArticol`, `fisierArticol`) VALUES
('David Patric Dudas', 'dudasdavid221@gmail.com', 'Ana are mere', '../sentArticles/David Dudas - CV0.pdf'),
('Dudas David', 'dudasdavid221@gmail.com', 'Ana are mere', '../sentArticles/David Dudas - Scrisoare de intenția - Unicarm.pdf'),
('Dmitri Karamazov', 'dudasdavid221@gmail.com', 'Ana are mere', '../sentArticles/David Dudas - Cover Letter.pdf'),
('Dmitri Karamazov', 'dudasdavid221@gmail.com', 'Ana are mere', '../sentArticles/David Dudas - Cover Letter0.pdf'),
('David Patric Dudas', 'dudasdavid221@gmail.com', 'Ana are mere si nu vrea sa le imparta cu Maria, mama lor de fete plictisite', '../sentArticles/David Dudas - CV1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `sent_messages`
--

CREATE TABLE `sent_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nume` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `mesaj` text NOT NULL,
  `dataTrimitere` datetime NOT NULL DEFAULT current_timestamp(),
  CONSTRAINT PK_messages PRIMARY KEY (id)
);

--
-- Dumping data for table `sent_messages`
--

INSERT INTO `sent_messages` (`nume`, `email`, `mesaj`) VALUES
('David Patric Dudas', 'dudasdavid221@gmail.com', 'Test'),
('David Patric Dudas', 'david.dudas03@e-uvt.ro', 'dsa');

-- --------------------------------------------------------

--
-- Table structure for table `suggested_articles`
--

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

--
-- Dumping data for table `suggested_articles`
--

INSERT INTO `suggested_articles` (`titlu`, `poster`, `link`, `category`, `trimisDe`) VALUES
('Alegeri în SUA, ultimele rezultate', 'https://media.hotnews.ro/media_server1/image-2022-11-8-25891893-41-miza-alegerilor-jumatate-mandat-din-sua-prin-prisma-rusiei.jpg', 'https://www.hotnews.ro/stiri-international-25892097-alegeri-sua-cele-mai-recente-proiectii-ale-rezultatelor-arata-avantaj-pentru-republicani-camera-cursa-stransa-pentru-controlul-senatului.htm', 'politic', 1),
('România primește un împrumut de 3 miliarde de dolari de la SUA pentru reactoarele 3 și 4 de la Cernavodă', 'https://media.hotnews.ro/media_server1/image-2022-03-25-25457271-41-reactoare-candu-cernavoda.jpg', 'https://economie.hotnews.ro/stiri-energie-25892462-romania-primeste-imprumut-3-miliarde-dolari-sua-pentru-reactoarele-3-4-cernavoda.htm', 'politic', 1),
('Ministrul de externe al Belarusului, Vladimir Makei, a murit „subit”, anunță presa de stat', 'https://mediacdn.libertatea.ro/unsafe/1260x708/smart/filters:format(webp):contrast(8):quality(75)/https://static4.libertatea.ro/wp-content/uploads/2022/11/10545433.jpg', 'https://www.libertatea.ro/stiri/vladimir-makei-ministrul-de-externe-belarus-a-murit-4360389', 'politic', 1),
('Ludovic Orban: „Nu exclud ca PNL s-o susțină pe Gabriela Firea pentru Primăria Capitalei”', 'https://mediacdn.libertatea.ro/unsafe/1260x708/smart/filters:format(webp):contrast(8):quality(75)/https://static4.libertatea.ro/wp-content/uploads/2022/11/hepta5688213.jpg', 'https://www.libertatea.ro/stiri/ludovic-orban-nu-exclud-pnl-sustine-gabriela-firea-primaria-capitalei-nicolae-ciuca-chin-imens-premier-4359784', 'politic', 1),
('Balcanii in secolul XX. O istorie postimperiala', 'https://media.hotnews.ro/media_server1/image-2021-12-17-25248534-41-balcanii-secolul.jpg', 'https://www.hotnews.ro/stiri-recomandare_de_lectura-25248540-balcanii-secolul-istorie-postimperiala.htm', 'cultura', 1),
('Jair Bolsonaro a fost spitalizat în SUA', 'https://media.hotnews.ro/media_server1/image-2022-12-30-25995651-41-jair-bolsonaro.jpg', 'https://www.hotnews.ro/stiri-international-26011438-jair-bolsonaro-fost-spitalizat-sua-confirma-sotia.htm', 'international', 1),
('Propunere controversată: Elevii să fie mustrați în fața clasei de profesori, când încalcă regulile', 'https://media.hotnews.ro/media_server1/image-2022-10-24-25862527-41-sala-clasa.jpg', 'https://www.hotnews.ro/stiri-educatie-25980870-propunere-controversata-elevii-fie-mustrati-fata-clasei-profesori-cand-incalca-regulile-explicatiile-ministerului-educatiei.htm', 'educatie', 1),
('Primul deces din România la o pacientă cu Flurona', 'https://media.hotnews.ro/media_server1/image-2022-10-5-25829395-41-gripa.jpg', 'https://www.hotnews.ro/stiri-sanatate-26011095-primul-deces-din-romania-pacienta-flurona-femeie-din-iasi-murit-din-cauza-coinfectiei-simultane-gripa-covid.htm', 'sanatate', 1),
('Când banii nu au miros, gazele lui Aliyev miros mai bine decât cele ale lui Putin!', 'https://media.hotnews.ro/media_server1/image-2020-05-25-24015997-41-cosmin-gabriel-pacuraru.jpg', 'https://www.hotnews.ro/stiri-opinii-26010812-cand-banii-nu-miros-gazele-lui-aliyev-miros-mai-bine-decat-cele-ale-lui-putin.htm', 'opinii', 1),
('Tronsonul blestemat din Autostrada Transilvania', 'https://media.hotnews.ro/media_server1/image-2021-03-15-24666489-41-viaductul-nefinalizat-bechtel-suplacu-barcau.jpg', 'https://monitorizari.hotnews.ro/stiri-infrastructura_articole-26004679-tronsonul-blestemat-din-autostrada-transilvania-noua-licitatie-lansata-pentru-lotul-construit-deja-jumatate-bechtel.htm', 'infrastructura', 1),
('Bucureștiul va avea două parcuri nou-nouțe în 2023', 'https://media.hotnews.ro/media_server1/image-2022-05-2-25530981-41-amenajare-parc-strada-liniei-20.jpeg', 'https://www.hotnews.ro/stiri-administratie_locala-25996212-foto-bucurestiul-avea-doua-parcuri-noi-noute-2023-parcuri-vechi-vor-modernizate.htm', 'administratie', 1);

SELECT b.username, c.comment, c.articleId, a.category
FROM articles a, comments c, accounts b
  WHERE a.id = c.articleId AND c.userId = b.id
