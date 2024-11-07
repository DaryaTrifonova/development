-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_2440_exam
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('573232f29333');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_book_visits`
--

DROP TABLE IF EXISTS `all_book_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_book_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_all_book_visits_book_id_books` (`book_id`),
  KEY `fk_all_book_visits_user_id_users` (`user_id`),
  CONSTRAINT `fk_all_book_visits_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_all_book_visits_user_id_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_book_visits`
--

LOCK TABLES `all_book_visits` WRITE;
/*!40000 ALTER TABLE `all_book_visits` DISABLE KEYS */;
INSERT INTO `all_book_visits` VALUES (26,17,1,'2024-06-14 08:43:30'),(27,18,1,'2024-06-14 08:44:43'),(28,19,1,'2024-06-14 08:46:08'),(29,17,1,'2024-06-14 08:46:14'),(30,20,1,'2024-06-14 08:48:24'),(31,21,1,'2024-06-14 08:49:14'),(32,22,1,'2024-06-14 08:50:54'),(33,23,1,'2024-06-14 08:52:09'),(34,24,1,'2024-06-14 09:06:10'),(35,25,1,'2024-06-14 09:07:14'),(36,26,1,'2024-06-14 09:08:01'),(37,27,1,'2024-06-14 09:10:05'),(38,17,1,'2024-06-14 12:32:25'),(39,17,1,'2024-06-14 12:32:50'),(40,18,1,'2024-06-14 12:33:01'),(41,17,1,'2024-06-14 12:33:10'),(42,17,NULL,'2024-06-14 17:20:46'),(43,17,NULL,'2024-06-14 17:23:03'),(44,17,NULL,'2024-06-14 17:24:18'),(45,17,NULL,'2024-06-14 17:25:23');
/*!40000 ALTER TABLE `all_book_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `short_desc` text NOT NULL,
  `year_release` int(11) NOT NULL,
  `publisher` varchar(256) NOT NULL,
  `author` varchar(256) NOT NULL,
  `pages_volume` int(11) NOT NULL,
  `image_id` varchar(256) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `rating_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_books_image_id_images` (`image_id`),
  CONSTRAINT `fk_books_image_id_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (17,'Если бы она знала','«ЕСЛИ БЫ ОНА ЗНАЛА» – это первая книга в новой серии психологических триллеров от популярного автора Блейка Пирса, чей бестселлер «Когда она ушла» (книга #1) (доступен для бесплатного скачивания) получил более 1000 отзывов с высшей оценкой.\n\nЕй 55, её дети давно выросли и разъехались, к тому же она сама недавно вышла на пенсию после службы в ФБР, но спокойная жизнь в тихом пригороде заканчивается для Кейт Уайз тогда, когда дочь её подруги убивают в собственном доме, а её саму умоляют помочь с расследованием.\n\nКейт казалось, что после 30 лет успешной службы агентом она навсегда оставила ФБР, где её уважали за острый ум, навыки выживания в суровых условиях городских улиц и уникальную способность выслеживать серийных убийц. Уставшая от тихого города и оказавшаяся на жизненном перепутье, Кейт не может отказать подруге в её просьбе.\n\nОтправившись на поиски убийцы, Кейт оказывается в первых рядах большого расследования, потому что появляются новые жертвы – счастливые мамы и жёны, жительницы пригорода, – и становится ясно, что тихий городок оказался во власти серийного убийцы. Она узнаёт тайны и секреты соседей, которые предпочла бы не знать, осознавая, что жизнь идеальных улочек и красивых районов вовсе не такая, какой кажется. Здесь царят измены и ложь, и Кейт должна разобраться в подноготной городка, если хочет остановить убийцу.\n\nА он оказывается всегда на шаг впереди, и вот уже самой Кейт грозит опасность.\n\nДинамичный и захватывающий триллер «ЕСЛИ БЫ ОНА ЗНАЛА» – это книга #1 в новой увлекательной серии романов, от чтения которых просто невозможно оторваться.',2019,' Lukeman Literary Management Ltd','Блейк Пирс',211,'6ea1f31b-e606-45be-adc8-74b298cf3abd',5,1),(18,'Если бы она увидела','Гениальный триллер и детектив. Блейк Пирс проделал отличную работу, создав героев и так хорошо раскрыв психологическую составляющую их натуры, что мы оказываемся внутри их мыслей, следуем за их страхами и радуемся их успехам. Книга полна неожиданных поворотов и не даст вам заснуть, пока вы не дочитаете её до конца.\n\nBooks and Movie Reviews, Роберто Маттос (о Когда она ушла) ЕСЛИ БЫ ОНА УВИДЕЛА (Загадки Кейт Уайз) – это книга #2 в новой серии психологических триллеров от популярного автора Блейка Пирса, чей бестселлер Когда она ушла (книга #1) (доступен для бесплатного скачивания) получил более 1000 отзывов с высшей оценкой.Когда убивают женатую пару, и у полиции нет подозреваемых, 55-летнюю пенсионерку Кейт Уайз, за плечами у которой 30 лет службы в ФБР, приглашают прервать свой отдых (и отвлечься от тихой жизни в пригороде), чтобы вернуться и снова работать на Бюро.Острый ум и уникальная способность Кейт понимать ход мыслей серийных убийц жизненно необходимы ФБР в этом запутанном деле. Почему две пары были убиты одним способом, но в 50 милях друг от друга? Что у них может быть общего?\n\nКейт понимает, что убийца торопится: она уверена, что он вот-вот нападёт вновь.В последующей опасной игре в кошки-мышки Кейт, проникнув в мрачные подвалы разума безумного убийцы, боится, что, как бы она ни старалась, она уже не сможет никому помочь.Динамичный и захватывающий триллер ЕСЛИ БЫ ОНА УВИДЕЛА – это книга #2 в новой увлекательной серии романов, от чтения которых просто невозможно оторваться.В скором времени выйдет книга #3 из серии ЗАГАДКИ КЕЙТ УАЙЗ!',2019,' Lukeman Literary Management Ltd','Блейк Пирс',201,'c52a9eba-83e4-4e63-b6c8-a82edc3feae9',0,0),(19,'Когда связь крепка','Шедевральный триллер и детектив. Пирс проделал потрясающую работу, проработав психологию персонажей, описывая их так хорошо, что мы можем ярко их представить, разделяем их страхи и вместе с ними надеемся на успех. Сюжет тщательно продуман, ваш интерес не стихнет во время всего чтения. Полная неожиданных поворотов, эта книга заставит вас не спать ночами, пока вы не дочитаете до последней страницы. Отзывы о книгах и фильмах, Роберто Маттос (про Когда она ушла) КОГДА СВЯЗЬ КРЕПКА – это книга №12 в серии бестселлеров Загадки Райли Пейдж, которая начинается с бестселлера КОГДА ОНА УШЛА – доступного для бесплатного скачивания и получившего более 1000 отзывов с наивысшей оценкой! В этом волнующем триллере женщин находят мёртвыми на железнодорожных путях по всей стране, а ФБР бросается в безумную гонку со временем, пытаясь поймать серийного убийцу. Специальный агент ФБР Райли Пейдж наконец встретила достойного соперника – маньяка-убийцу, с истинным садизмом привязывающего своих жертв к железнодорожным путям перед приближающимся поездом. Этот убийца оказался достаточно умён, чтобы не быть пойманным во многих штатах – и достаточно обаятельным, чтобы оставаться незамеченным. Очень скоро агент понимает, что ей потребуются все её способности, чтобы проникнуть в больной разум этого убийцы, чего делать ей совершенно не хочется. А развязка расследования будет настолько шокирующей, что этого не ожидает даже Райли! Тёмный психологический триллер с волнующей интригой, КОГДА ВРЕМЯ НЕ ЖДЁТ, это книга №12 в захватывающей серии (с любимой героиней! ), которая заставит вас переворачивать страницы до самой ночи. Книга №13 в серии Райли Пейдж скоро в продаже!',2019,' Lukeman Literary Management Ltd','Блейк Пирс',241,'1b3c59a7-8cd0-4f20-8da9-a758be323e82',0,0),(20,'451 градус по Фаренгейту','451° по Фаренгейту – температура, при которой воспламеняется и горит бумага. Философская антиутопия Брэдбери рисует беспросветную картину развития постиндустриального общества: это мир будущего, в котором все письменные издания безжалостно уничтожаются специальным отрядом пожарных, а хранение книг преследуется по закону, интерактивное телевидение успешно служит всеобщему оболваниванию, карательная психиатрия решительно разбирается с редкими инакомыслящими, а на охоту за неисправимыми диссидентами выходит электрический пес… Роман, принесший своему творцу мировую известность.',2018,' Эксмо','Рэй Брэдбери',200,'97376c60-a222-4bc6-b737-bb1d6467b292',0,0),(21,'Марсианские хроники','Хотите покорить Марс, этот странный изменчивый мир, населенный загадочными, неуловимыми обитателями и не такой уж добрый к человеку? Дерзайте. Но только приготовьтесь в полной мере испить чашу сожалений и тоски – тоски по зеленой планете Земля, на которой навсегда останется ваше сердце. Цикл удивительных марсианских историй Рэя Брэдбери– классическое произведение, вошедшее в золотой фонд мировой литературы.',2013,'Эксмо','Рэй Брэдбери',230,'c4ad3d19-629f-4617-ab3e-fd130613717d',0,0),(22,'Кэрри','Шестнадцатилетняя Кэрри – изгой. Ее мать – верующая фанатичка, считающая дочь падшей грешницей и воплощением зла, поэтому постоянно угнетающая и избивающая ее. Одноклассники издеваются над ней и вечно устраивают ей неприятности.\n\nКэрри не у кого просить помощи. Она совсем одна. А еще время от времени, когда ее мать перестает контролировать агрессию, в ней пробуждается странное и страшное нечто, с помощью которого она может передвигать предметы и не только.\n\nИ вот однажды и одноклассники, и мать ломают психику девочки окончательно, и катастрофическая сила телекинеза вырывается на свободу, уничтожая все на своем пути…',1974,'АСТ','Стивен Кинг',221,'9f3a0a31-12bc-4e3d-aecd-33e7d0ca3a19',0,0),(23,'Темная Башня','Роланд Дискейн – последний представитель древнего ордена стрелков. Вместе с верными сторонниками он совершает поход по постапокалиптической земле. Его цель – дойти до центра всех миров – Темной Башни. Если ему удастся добраться до ее вершины, он сможет понять, кто управляет всем и восстановить равновесие.\n\nНа пути к вершине герой встречает множество препятствий. Роланд и его спутники посещают другие миры и временные эпохи. Перед ними предстает Нью-Йорк 20 века и Америка старого Запада. Каждый новый мир открывает им завесу тайны. Как долго будет длиться путешествие и удастся ли Роланду встретится с Мирозданием?',2004,'АСТ','Стивен Кинг',986,'b0e5afff-c1d0-4e38-bf89-ab7f57972e08',0,0),(24,'Головоломка','Где проходит граница, отделяющая реальность от вымысла? Узнать это предстоит охотникам за сокровищами – Илану и Хлоэ, прошедшим отбор в засекреченную игру под названием «Паранойя». Никто не знает, по каким правилам ведется игра, представляющая собой парадоксальную смесь виртуальной и реальной жизни, и чем она должна закончиться. Тому, кто пройдет ее от начала и до конца, организаторы обещают крупное вознаграждение – триста тысяч евро. Но что на самом деле ждет победителя, сумевшего собрать десять хрустальных лебедей? И что произойдет с теми, кто так и не смог взглянуть своим страхам в глаза?\n\nИгра проходит в заброшенной психиатрической лечебнице, расположенной среди живописных французских Альп. Ровно год назад, накануне Рождества здесь было найдено восемь трупов… Пятеро мужчин и три женщины были хладнокровно убиты во сне. Теперь игроков снова восемь. Кто из них останется в живых? И останется ли?',2013,'Азбука-Аттикус','Франк Тилье',379,'c166b2a5-a8c3-4492-aec4-3c1d7905b0b1',0,0),(25,'Сновидение','Абигэль – выдающийся психолог, специалист, которого полиция часто призывает на помощь в серьезных расследованиях. Однако ее жизнь с давних пор омрачает нарколепсия – таинственная болезнь, из-за которой сны перепутаны с действительностью. Теперь Абигэль идет по следу человека, который уже похитил троих детей, и, похоже, вскоре у полиции будет четвертая жертва… Вопросы множатся, похититель где-то совсем рядом. Но кто он? Ответ хранится в памяти Абигэль – памяти, где реальность неотвратимо сжимается, как шагреневая кожа…',2016,'Азбука-Аттикус','Франк Тилье',442,'414c4d06-e495-49fe-9706-5f89263dda69',0,0),(26,'Лента Мёбиуса','Неопытный полицейский Вик Маршаль преследует маньяка-убийцу, очередной жертвой которого стала молодая девушка. Рядом с телом было найдено восемнадцать статуэток, одна из которых, изображающая ребенка, находилась в жутком, истерзанном состоянии. Маршаль пытается разгадать послание убийцы. Следователь хочет показать, на что способен его пытливый ум и раскрыть загадочное преступление.\n\nВ это время Стефану Кисмете видится жуткий ночной кошмар: труп молодой девушки и ребенка. Возможно, создание муляжей для съемок ужастиков, подавленные воспоминания и капризы подсознания повлияли на его психику. Но почему кошмары так пугают своей реалистичностью? И что общего у молодого полицейского и создателя муляжей?',2008,'Азбука-Аттикус','Франк Тилье',485,'30a8727c-bb72-4dee-8bc0-9f08d257885c',0,0),(27,'Язык как инстинкт','Книга известного канадского лингвиста и нейропсихолога «Язык как инстинкт» была написана в 1994 году и с тех пор стала признанным бестселлером. Предназначенная для самого широкого круга читателей, она также служит введением в науку о языке для многих профессионалов. Стивену Пинкеру удалось совместить в ней энтузиазм яркого рассказчика и скрупулезность подхода истинного ученого.\n\nОпираясь на постулаты Дарвина и Хомского, Пинкер идет дальше и выдвигает идею о том, что человек с рождения имеет способность к языку. Ребенок спонтанно усваивает грамматику даже в смешанной культурной среде, для развития речи ему не нужны формальные правила или исправления со стороны родителей.\n\nОгромный круг проблем, поднимаемых автором, не оставляет равнодушным никого, кто пользуется языком. В чем суть языка? Как он устроен? Разрушают ли его слова, проникающие в нашу жизнь с каждым новым поколением? Как связаны язык и мышление? Эти и многие другие вопросы, рассматриваемые Пинкером в книге, часто задавались и отрабатывались в ходе его лекций, ставших для публики знаковыми. Занимательные примеры из современного английского, в том числе поэзии, песен, сленга, делают повествование легким и живым.',2007,' Альпина нон-фикшн',' Стивен Пинкер',842,'67d4667d-c7dd-416c-b9fc-14e775f77305',0,0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_genres`
--

DROP TABLE IF EXISTS `books_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_genres` (
  `book_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  KEY `fk_books_genres_book_id_books` (`book_id`),
  KEY `fk_books_genres_genre_id_genres` (`genre_id`),
  CONSTRAINT `fk_books_genres_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_books_genres_genre_id_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_genres`
--

LOCK TABLES `books_genres` WRITE;
/*!40000 ALTER TABLE `books_genres` DISABLE KEYS */;
INSERT INTO `books_genres` VALUES (17,1),(18,1),(19,1),(20,2),(21,2),(22,1),(23,2),(24,1),(25,2),(26,2),(27,3);
/*!40000 ALTER TABLE `books_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_genres_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (4,'Роман'),(3,'Учебная литература'),(2,'Фантастика'),(1,'Хоррор');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` varchar(256) NOT NULL,
  `file_name` varchar(256) NOT NULL,
  `mime_type` varchar(256) NOT NULL,
  `md5_hash` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_images_md5_hash` (`md5_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('1b3c59a7-8cd0-4f20-8da9-a758be323e82','1b3c59a7-8cd0-4f20-8da9-a758be323e82.webp','image/webp','790f9810459e635354699502603888b3'),('30a8727c-bb72-4dee-8bc0-9f08d257885c','30a8727c-bb72-4dee-8bc0-9f08d257885c.webp','image/webp','95dd6fbe7277403d9dd7f4a43752744d'),('414c4d06-e495-49fe-9706-5f89263dda69','414c4d06-e495-49fe-9706-5f89263dda69.webp','image/webp','9386277b9854910033391fbf047e0758'),('67d4667d-c7dd-416c-b9fc-14e775f77305','67d4667d-c7dd-416c-b9fc-14e775f77305.webp','image/webp','9a50c20846d1799828e5be95eded84f9'),('6ea1f31b-e606-45be-adc8-74b298cf3abd','6ea1f31b-e606-45be-adc8-74b298cf3abd.webp','image/webp','85053620ab31921186e7300453b94469'),('97376c60-a222-4bc6-b737-bb1d6467b292','97376c60-a222-4bc6-b737-bb1d6467b292.webp','image/webp','42f9619a827374e4d3cc0e553a5bbcf7'),('9f3a0a31-12bc-4e3d-aecd-33e7d0ca3a19','9f3a0a31-12bc-4e3d-aecd-33e7d0ca3a19.webp','image/webp','e13b747f41658f0dc9472c7f2f8bf766'),('b0e5afff-c1d0-4e38-bf89-ab7f57972e08','b0e5afff-c1d0-4e38-bf89-ab7f57972e08.webp','image/webp','8ad89010df9c9727c7b8f6106ed188c4'),('c166b2a5-a8c3-4492-aec4-3c1d7905b0b1','c166b2a5-a8c3-4492-aec4-3c1d7905b0b1.webp','image/webp','1772c01d98aed7d78a2ec588fbca09a8'),('c4ad3d19-629f-4617-ab3e-fd130613717d','c4ad3d19-629f-4617-ab3e-fd130613717d.webp','image/webp','4ede2ccf4f37616ec237211921080616'),('c52a9eba-83e4-4e63-b6c8-a82edc3feae9','c52a9eba-83e4-4e63-b6c8-a82edc3feae9.webp','image/webp','f0cc66bb03fcfba16e56353762c42eea');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `last_book_visits`
--

DROP TABLE IF EXISTS `last_book_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `last_book_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_last_book_visits_book_id_books` (`book_id`),
  KEY `fk_last_book_visits_user_id_users` (`user_id`),
  CONSTRAINT `fk_last_book_visits_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_last_book_visits_user_id_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `last_book_visits`
--

LOCK TABLES `last_book_visits` WRITE;
/*!40000 ALTER TABLE `last_book_visits` DISABLE KEYS */;
INSERT INTO `last_book_visits` VALUES (18,17,1,'2024-06-14 15:33:09'),(19,18,1,'2024-06-14 15:33:01'),(20,19,1,'2024-06-14 08:46:08'),(21,20,1,'2024-06-14 08:48:24'),(22,21,1,'2024-06-14 08:49:14'),(23,22,1,'2024-06-14 08:50:54'),(24,23,1,'2024-06-14 08:52:09'),(25,24,1,'2024-06-14 09:06:10'),(26,25,1,'2024-06-14 09:07:14'),(27,26,1,'2024-06-14 09:08:01'),(28,27,1,'2024-06-14 09:10:05');
/*!40000 ALTER TABLE `last_book_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_book_id_books` (`book_id`),
  KEY `fk_reviews_user_id_users` (`user_id`),
  CONSTRAINT `fk_reviews_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_reviews_user_id_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (3,5,'**Отличная книга**','2024-06-14 12:32:43',17,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор','суперпользователь, имеет полный доступ к системе, в том числе к созданию и удалению книг'),(2,'Модератор','может редактировать данные книг и производить модерацию рецензий'),(3,'Пользователь','может оставлять рецензии');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(256) NOT NULL,
  `password_hash` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `first_name` varchar(256) NOT NULL,
  `middle_name` varchar(256) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_login` (`login`),
  KEY `fk_users_role_id_roles` (`role_id`),
  CONSTRAINT `fk_users_role_id_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','scrypt:32768:8:1$jkmrfkBRokGVzjZO$b312c53a02a14d83d45d47bb2973814fbc1c63d2b0e45d63408e22795eb77141728865b312394b6e919798db5a2aa25aae937d5b300ad444a6f8699564881faa','Trifonova','Darya',NULL,1),(2,'moderator','scrypt:32768:8:1$jkmrfkBRokGVzjZO$b312c53a02a14d83d45d47bb2973814fbc1c63d2b0e45d63408e22795eb77141728865b312394b6e919798db5a2aa25aae937d5b300ad444a6f8699564881faa','Ivanov','Ivan',NULL,2),(3,'user','scrypt:32768:8:1$jkmrfkBRokGVzjZO$b312c53a02a14d83d45d47bb2973814fbc1c63d2b0e45d63408e22795eb77141728865b312394b6e919798db5a2aa25aae937d5b300ad444a6f8699564881faa','Petrov','Petr','Petrovich',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-15 20:35:25
