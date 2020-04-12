# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29)
# Database: crater_two
# Generation Time: 2020-04-10 16:22:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_country_id_foreign` (`country_id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;

INSERT INTO `addresses` (`id`, `name`, `address_street_1`, `address_street_2`, `city`, `state`, `country_id`, `zip`, `phone`, `fax`, `type`, `user_id`, `created_at`, `updated_at`)
VALUES
	(4,NULL,'Rua Sobral',NULL,'Guarulhos','São Paulo',30,'07230360',NULL,NULL,NULL,1,'2020-02-23 17:04:10','2020-02-23 17:04:10'),
	(5,'Polo Printer','Rua Américo Brasiliense, 2171 - Conjunto 102',NULL,'São Paulo','São Paulo',30,'04715-005','11 3791-2965',NULL,'shipping',2,'2020-02-23 17:11:35','2020-02-23 17:11:35'),
	(6,'Polo Printer','Rua Américo Brasiliense, 2171 - Conjunto 102',NULL,'São Paulo','São Paulo',30,'04715-005','11 3791-2965',NULL,'billing',2,'2020-02-23 17:11:35','2020-02-23 17:11:35'),
	(9,NULL,'Morumbi Shopping','Av. Roque Petroni Júnior, 1089\nLoja 236S\nÁrea de Expansão','São Paulo','São Paulo',30,'04707900',NULL,NULL,'shipping',3,'2020-04-01 21:11:01','2020-04-01 21:11:01'),
	(10,NULL,'Morumbi Shopping','Av. Roque Petroni Júnior, 1089\nLoja 236S\nÁrea de Expansão','São Paulo','São Paulo',30,'04707900',NULL,NULL,'billing',3,'2020-04-01 21:11:01','2020-04-01 21:11:01');

/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;

INSERT INTO `companies` (`id`, `name`, `logo`, `unique_hash`, `created_at`, `updated_at`)
VALUES
	(1,'Tupy S & C',NULL,'LnUm3acaNuuANNkpU4TXdovk7JDeowAHaEWce9aAsfiQPfEEo8mWsqttrLWY','2020-01-19 16:55:27','2020-01-19 16:55:27');

/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table company_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company_settings`;

CREATE TABLE `company_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_settings_company_id_foreign` (`company_id`),
  CONSTRAINT `company_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `company_settings` WRITE;
/*!40000 ALTER TABLE `company_settings` DISABLE KEYS */;

INSERT INTO `company_settings` (`id`, `option`, `value`, `company_id`, `created_at`, `updated_at`)
VALUES
	(1,'notification_email','aguinaldo.tupy@gmail.com',1,'2020-01-19 16:55:27','2020-01-19 16:55:27'),
	(2,'currency','21',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(3,'time_zone','Europe/Lisbon',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(4,'language','pt_BR',1,'2020-01-19 16:56:00','2020-02-21 00:19:16'),
	(5,'carbon_date_format','d M Y',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(6,'moment_date_format','DD MMM YYYY',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(7,'fiscal_year','1-12',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(8,'invoice_auto_generate','YES',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(9,'invoice_prefix','INV',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(10,'estimate_prefix','ORC',1,'2020-01-19 16:56:00','2020-02-21 00:28:47'),
	(11,'estimate_auto_generate','YES',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(12,'payment_prefix','PAY',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(13,'payment_auto_generate','YES',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(14,'primary_text_color','#323a46',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(15,'heading_text_color','#323a46',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(16,'section_heading_text_color','#040405',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(17,'border_color','#EAF1FB',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(18,'body_text_color','#323a46',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(19,'footer_text_color','#323a46',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(20,'footer_total_color','#323a46',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(21,'footer_bg_color','#F9FBFF',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(22,'date_text_color','#A5ACC1',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(23,'invoice_primary_color','#323a46',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(24,'invoice_column_heading','#55547A',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(25,'invoice_field_label','#55547A',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(26,'invoice_field_value','#040405',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(27,'invoice_body_text','#040405',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(28,'invoice_description_text','#595959',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(29,'invoice_border_color','#EAF1FB',1,'2020-01-19 16:56:00','2020-01-19 16:56:00'),
	(30,'notify_invoice_viewed','YES',1,'2020-01-19 16:58:58','2020-01-19 16:58:58'),
	(31,'notify_estimate_viewed','YES',1,'2020-01-19 16:59:02','2020-01-19 16:59:02');

/*!40000 ALTER TABLE `company_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phonecode` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `code`, `name`, `phonecode`)
VALUES
	(1,'AF','Afghanistan',93),
	(2,'AL','Albania',355),
	(3,'DZ','Algeria',213),
	(4,'AS','American Samoa',1684),
	(5,'AD','Andorra',376),
	(6,'AO','Angola',244),
	(7,'AI','Anguilla',1264),
	(8,'AQ','Antarctica',0),
	(9,'AG','Antigua And Barbuda',1268),
	(10,'AR','Argentina',54),
	(11,'AM','Armenia',374),
	(12,'AW','Aruba',297),
	(13,'AU','Australia',61),
	(14,'AT','Austria',43),
	(15,'AZ','Azerbaijan',994),
	(16,'BS','Bahamas The',1242),
	(17,'BH','Bahrain',973),
	(18,'BD','Bangladesh',880),
	(19,'BB','Barbados',1246),
	(20,'BY','Belarus',375),
	(21,'BE','Belgium',32),
	(22,'BZ','Belize',501),
	(23,'BJ','Benin',229),
	(24,'BM','Bermuda',1441),
	(25,'BT','Bhutan',975),
	(26,'BO','Bolivia',591),
	(27,'BA','Bosnia and Herzegovina',387),
	(28,'BW','Botswana',267),
	(29,'BV','Bouvet Island',0),
	(30,'BR','Brazil',55),
	(31,'IO','British Indian Ocean Territory',246),
	(32,'BN','Brunei',673),
	(33,'BG','Bulgaria',359),
	(34,'BF','Burkina Faso',226),
	(35,'BI','Burundi',257),
	(36,'KH','Cambodia',855),
	(37,'CM','Cameroon',237),
	(38,'CA','Canada',1),
	(39,'CV','Cape Verde',238),
	(40,'KY','Cayman Islands',1345),
	(41,'CF','Central African Republic',236),
	(42,'TD','Chad',235),
	(43,'CL','Chile',56),
	(44,'CN','China',86),
	(45,'CX','Christmas Island',61),
	(46,'CC','Cocos (Keeling) Islands',672),
	(47,'CO','Colombia',57),
	(48,'KM','Comoros',269),
	(49,'CG','Congo',242),
	(50,'CD','Congo The Democratic Republic Of The',242),
	(51,'CK','Cook Islands',682),
	(52,'CR','Costa Rica',506),
	(53,'CI','Cote D Ivoire (Ivory Coast)',225),
	(54,'HR','Croatia (Hrvatska)',385),
	(55,'CU','Cuba',53),
	(56,'CY','Cyprus',357),
	(57,'CZ','Czech Republic',420),
	(58,'DK','Denmark',45),
	(59,'DJ','Djibouti',253),
	(60,'DM','Dominica',1767),
	(61,'DO','Dominican Republic',1809),
	(62,'TP','East Timor',670),
	(63,'EC','Ecuador',593),
	(64,'EG','Egypt',20),
	(65,'SV','El Salvador',503),
	(66,'GQ','Equatorial Guinea',240),
	(67,'ER','Eritrea',291),
	(68,'EE','Estonia',372),
	(69,'ET','Ethiopia',251),
	(70,'XA','External Territories of Australia',61),
	(71,'FK','Falkland Islands',500),
	(72,'FO','Faroe Islands',298),
	(73,'FJ','Fiji Islands',679),
	(74,'FI','Finland',358),
	(75,'FR','France',33),
	(76,'GF','French Guiana',594),
	(77,'PF','French Polynesia',689),
	(78,'TF','French Southern Territories',0),
	(79,'GA','Gabon',241),
	(80,'GM','Gambia The',220),
	(81,'GE','Georgia',995),
	(82,'DE','Germany',49),
	(83,'GH','Ghana',233),
	(84,'GI','Gibraltar',350),
	(85,'GR','Greece',30),
	(86,'GL','Greenland',299),
	(87,'GD','Grenada',1473),
	(88,'GP','Guadeloupe',590),
	(89,'GU','Guam',1671),
	(90,'GT','Guatemala',502),
	(91,'XU','Guernsey and Alderney',44),
	(92,'GN','Guinea',224),
	(93,'GW','Guinea-Bissau',245),
	(94,'GY','Guyana',592),
	(95,'HT','Haiti',509),
	(96,'HM','Heard and McDonald Islands',0),
	(97,'HN','Honduras',504),
	(98,'HK','Hong Kong S.A.R.',852),
	(99,'HU','Hungary',36),
	(100,'IS','Iceland',354),
	(101,'IN','India',91),
	(102,'ID','Indonesia',62),
	(103,'IR','Iran',98),
	(104,'IQ','Iraq',964),
	(105,'IE','Ireland',353),
	(106,'IL','Israel',972),
	(107,'IT','Italy',39),
	(108,'JM','Jamaica',1876),
	(109,'JP','Japan',81),
	(110,'XJ','Jersey',44),
	(111,'JO','Jordan',962),
	(112,'KZ','Kazakhstan',7),
	(113,'KE','Kenya',254),
	(114,'KI','Kiribati',686),
	(115,'KP','Korea North',850),
	(116,'KR','Korea South',82),
	(117,'KW','Kuwait',965),
	(118,'KG','Kyrgyzstan',996),
	(119,'LA','Laos',856),
	(120,'LV','Latvia',371),
	(121,'LB','Lebanon',961),
	(122,'LS','Lesotho',266),
	(123,'LR','Liberia',231),
	(124,'LY','Libya',218),
	(125,'LI','Liechtenstein',423),
	(126,'LT','Lithuania',370),
	(127,'LU','Luxembourg',352),
	(128,'MO','Macau S.A.R.',853),
	(129,'MK','Macedonia',389),
	(130,'MG','Madagascar',261),
	(131,'MW','Malawi',265),
	(132,'MY','Malaysia',60),
	(133,'MV','Maldives',960),
	(134,'ML','Mali',223),
	(135,'MT','Malta',356),
	(136,'XM','Man (Isle of)',44),
	(137,'MH','Marshall Islands',692),
	(138,'MQ','Martinique',596),
	(139,'MR','Mauritania',222),
	(140,'MU','Mauritius',230),
	(141,'YT','Mayotte',269),
	(142,'MX','Mexico',52),
	(143,'FM','Micronesia',691),
	(144,'MD','Moldova',373),
	(145,'MC','Monaco',377),
	(146,'MN','Mongolia',976),
	(147,'MS','Montserrat',1664),
	(148,'MA','Morocco',212),
	(149,'MZ','Mozambique',258),
	(150,'MM','Myanmar',95),
	(151,'NA','Namibia',264),
	(152,'NR','Nauru',674),
	(153,'NP','Nepal',977),
	(154,'AN','Netherlands Antilles',599),
	(155,'NL','Netherlands The',31),
	(156,'NC','New Caledonia',687),
	(157,'NZ','New Zealand',64),
	(158,'NI','Nicaragua',505),
	(159,'NE','Niger',227),
	(160,'NG','Nigeria',234),
	(161,'NU','Niue',683),
	(162,'NF','Norfolk Island',672),
	(163,'MP','Northern Mariana Islands',1670),
	(164,'NO','Norway',47),
	(165,'OM','Oman',968),
	(166,'PK','Pakistan',92),
	(167,'PW','Palau',680),
	(168,'PS','Palestinian Territory Occupied',970),
	(169,'PA','Panama',507),
	(170,'PG','Papua new Guinea',675),
	(171,'PY','Paraguay',595),
	(172,'PE','Peru',51),
	(173,'PH','Philippines',63),
	(174,'PN','Pitcairn Island',0),
	(175,'PL','Poland',48),
	(176,'PT','Portugal',351),
	(177,'PR','Puerto Rico',1787),
	(178,'QA','Qatar',974),
	(179,'RE','Reunion',262),
	(180,'RO','Romania',40),
	(181,'RU','Russia',70),
	(182,'RW','Rwanda',250),
	(183,'SH','Saint Helena',290),
	(184,'KN','Saint Kitts And Nevis',1869),
	(185,'LC','Saint Lucia',1758),
	(186,'PM','Saint Pierre and Miquelon',508),
	(187,'VC','Saint Vincent And The Grenadines',1784),
	(188,'WS','Samoa',684),
	(189,'SM','San Marino',378),
	(190,'ST','Sao Tome and Principe',239),
	(191,'SA','Saudi Arabia',966),
	(192,'SN','Senegal',221),
	(193,'RS','Serbia',381),
	(194,'SC','Seychelles',248),
	(195,'SL','Sierra Leone',232),
	(196,'SG','Singapore',65),
	(197,'SK','Slovakia',421),
	(198,'SI','Slovenia',386),
	(199,'XG','Smaller Territories of the UK',44),
	(200,'SB','Solomon Islands',677),
	(201,'SO','Somalia',252),
	(202,'ZA','South Africa',27),
	(203,'GS','South Georgia',0),
	(204,'SS','South Sudan',211),
	(205,'ES','Spain',34),
	(206,'LK','Sri Lanka',94),
	(207,'SD','Sudan',249),
	(208,'SR','Suriname',597),
	(209,'SJ','Svalbard And Jan Mayen Islands',47),
	(210,'SZ','Swaziland',268),
	(211,'SE','Sweden',46),
	(212,'CH','Switzerland',41),
	(213,'SY','Syria',963),
	(214,'TW','Taiwan',886),
	(215,'TJ','Tajikistan',992),
	(216,'TZ','Tanzania',255),
	(217,'TH','Thailand',66),
	(218,'TG','Togo',228),
	(219,'TK','Tokelau',690),
	(220,'TO','Tonga',676),
	(221,'TT','Trinidad And Tobago',1868),
	(222,'TN','Tunisia',216),
	(223,'TR','Turkey',90),
	(224,'TM','Turkmenistan',7370),
	(225,'TC','Turks And Caicos Islands',1649),
	(226,'TV','Tuvalu',688),
	(227,'UG','Uganda',256),
	(228,'UA','Ukraine',380),
	(229,'AE','United Arab Emirates',971),
	(230,'GB','United Kingdom',44),
	(231,'US','United States',1),
	(232,'UM','United States Minor Outlying Islands',1),
	(233,'UY','Uruguay',598),
	(234,'UZ','Uzbekistan',998),
	(235,'VU','Vanuatu',678),
	(236,'VA','Vatican City State (Holy See)',39),
	(237,'VE','Venezuela',58),
	(238,'VN','Vietnam',84),
	(239,'VG','Virgin Islands (British)',1284),
	(240,'VI','Virgin Islands (US)',1340),
	(241,'WF','Wallis And Futuna Islands',681),
	(242,'EH','Western Sahara',212),
	(243,'YE','Yemen',967),
	(244,'YU','Yugoslavia',38),
	(245,'ZM','Zambia',260),
	(246,'ZW','Zimbabwe',263);

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table currencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precision` int(11) NOT NULL,
  `thousand_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `swap_currency_symbol` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `swap_currency_symbol`, `created_at`, `updated_at`)
VALUES
	(1,'US Dollar','USD','$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(2,'British Pound','GBP','£',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(3,'Euro','EUR','€',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(4,'South African Rand','ZAR','R',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(5,'Danish Krone','DKK','kr',2,'.',',',1,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(6,'Israeli Shekel','ILS','NIS ',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(7,'Swedish Krona','SEK','kr',2,'.',',',1,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(8,'Kenyan Shilling','KES','KSh ',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(9,'Kuwaiti Dinar','KWD','KWD ',3,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(10,'Canadian Dollar','CAD','C$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(11,'Philippine Peso','PHP','P ',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(12,'Indian Rupee','INR','₹',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(13,'Australian Dollar','AUD','$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(14,'Singapore Dollar','SGD','S$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(15,'Norske Kroner','NOK','kr',2,'.',',',1,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(16,'New Zealand Dollar','NZD','$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(17,'Vietnamese Dong','VND','₫',0,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(18,'Swiss Franc','CHF','Fr.',2,'\'','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(19,'Guatemalan Quetzal','GTQ','Q',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(20,'Malaysian Ringgit','MYR','RM',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(21,'Brazilian Real','BRL','R$',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(22,'Thai Baht','THB','฿',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(23,'Nigerian Naira','NGN','₦',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(24,'Argentine Peso','ARS','$',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(25,'Bangladeshi Taka','BDT','Tk',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(26,'United Arab Emirates Dirham','AED','DH ',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(27,'Hong Kong Dollar','HKD','HK$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(28,'Indonesian Rupiah','IDR','Rp',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(29,'Mexican Peso','MXN','$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(30,'Egyptian Pound','EGP','E£',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(31,'Colombian Peso','COP','$',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(32,'West African Franc','XOF','CFA ',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(33,'Chinese Renminbi','CNY','RMB ',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(34,'Rwandan Franc','RWF','RF ',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(35,'Tanzanian Shilling','TZS','TSh ',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(36,'Netherlands Antillean Guilder','ANG','NAƒ',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(37,'Trinidad and Tobago Dollar','TTD','TT$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(38,'East Caribbean Dollar','XCD','EC$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(39,'Ghanaian Cedi','GHS','‎GH₵',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(40,'Bulgarian Lev','BGN','Лв.',2,' ','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(41,'Aruban Florin','AWG','Afl. ',2,' ','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(42,'Turkish Lira','TRY','TL ',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(43,'Romanian New Leu','RON','RON',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(44,'Croatian Kuna','HRK','kn',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(45,'Saudi Riyal','SAR','‎SِAR',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(46,'Japanese Yen','JPY','¥',0,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(47,'Maldivian Rufiyaa','MVR','Rf',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(48,'Costa Rican Colón','CRC','₡',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(49,'Pakistani Rupee','PKR','Rs ',0,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(50,'Polish Zloty','PLN','zł',2,' ',',',1,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(51,'Sri Lankan Rupee','LKR','LKR',2,',','.',1,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(52,'Czech Koruna','CZK','Kč',2,' ',',',1,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(53,'Uruguayan Peso','UYU','$',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(54,'Namibian Dollar','NAD','$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(55,'Tunisian Dinar','TND','‎د.ت',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(56,'Russian Ruble','RUB','₽',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(57,'Mozambican Metical','MZN','MT',2,'.',',',1,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(58,'Omani Rial','OMR','ر.ع.',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(59,'Ukrainian Hryvnia','UAH','₴',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(60,'Macanese Pataca','MOP','MOP$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(61,'Taiwan New Dollar','TWD','NT$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(62,'Dominican Peso','DOP','RD$',2,',','.',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(63,'Chilean Peso','CLP','$',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(64,'Serbian Dinar','RSD','RSD',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(65,'Kyrgyzstani som','KGS','С̲ ',2,'.',',',0,'2020-02-20 22:27:54','2020-02-20 22:27:54');

/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table estimate_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estimate_items`;

CREATE TABLE `estimate_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint(20) unsigned DEFAULT NULL,
  `price` bigint(20) unsigned NOT NULL,
  `tax` bigint(20) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `estimate_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estimate_items_item_id_foreign` (`item_id`),
  KEY `estimate_items_estimate_id_foreign` (`estimate_id`),
  KEY `estimate_items_company_id_foreign` (`company_id`),
  CONSTRAINT `estimate_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `estimate_items_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `estimate_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `estimate_items` WRITE;
/*!40000 ALTER TABLE `estimate_items` DISABLE KEYS */;

INSERT INTO `estimate_items` (`id`, `name`, `description`, `discount_type`, `quantity`, `discount`, `discount_val`, `price`, `tax`, `total`, `item_id`, `estimate_id`, `company_id`, `created_at`, `updated_at`)
VALUES
	(17,'WIREFRAME & DESIGN','Layout de elementos fundamentais na interface da aplicação.\nLayout com responsividade para mobile, desktop e tablet.','fixed',16.00,0.00,0,8000,0,128000,3,1,1,'2020-03-06 23:39:28','2020-03-06 23:39:28'),
	(18,'Desenvolvimento Web','- Implementação da regra de negócio e estruturação dos processos (Flow do orçamento).\n- Criação de gestão de acesso por perfis (Admin, Produção, Cliente)','fixed',20.00,0.00,0,8000,0,160000,2,1,1,'2020-03-06 23:39:28','2020-03-06 23:39:28'),
	(19,'Domínio & Host','Hospedagem do site nos serviços da digitalOcean (DGO)','fixed',4.00,0.00,0,5400,0,21600,6,1,1,'2020-03-06 23:39:28','2020-03-06 23:39:28'),
	(24,'Calculadora (Layout existente)',NULL,'fixed',3.00,0.00,0,5400,0,16200,NULL,2,1,'2020-03-10 01:55:12','2020-03-10 01:55:12'),
	(25,'Painel Administrativo',NULL,'fixed',4.00,0.00,0,5400,0,21600,NULL,2,1,'2020-03-10 01:55:12','2020-03-10 01:55:12'),
	(26,'Integração com AR',NULL,'fixed',2.00,0.00,0,5400,0,10800,NULL,2,1,'2020-03-10 01:55:12','2020-03-10 01:55:12'),
	(27,'Mecanismos de SEO',NULL,'fixed',2.00,0.00,0,5400,0,10800,NULL,2,1,'2020-03-10 01:55:12','2020-03-10 01:55:12'),
	(28,'Manutenção (Site)',NULL,'fixed',1.00,0.00,0,8000,0,8000,5,3,1,'2020-04-01 21:11:55','2020-04-01 21:11:55');

/*!40000 ALTER TABLE `estimate_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table estimate_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estimate_templates`;

CREATE TABLE `estimate_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `estimate_templates` WRITE;
/*!40000 ALTER TABLE `estimate_templates` DISABLE KEYS */;

INSERT INTO `estimate_templates` (`id`, `name`, `view`, `path`, `created_at`, `updated_at`)
VALUES
	(1,'Template 1','estimate1','/assets/img/PDF/Template1.png','2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(2,'Template 2','estimate2','/assets/img/PDF/Template2.png','2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(3,'Template 3','estimate3','/assets/img/PDF/Template3.png','2020-02-20 22:27:54','2020-02-20 22:27:54');

/*!40000 ALTER TABLE `estimate_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table estimates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estimates`;

CREATE TABLE `estimates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estimate_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `estimate_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_val` bigint(20) unsigned DEFAULT NULL,
  `sub_total` bigint(20) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `tax` bigint(20) unsigned NOT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `estimate_template_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estimates_user_id_foreign` (`user_id`),
  KEY `estimates_estimate_template_id_foreign` (`estimate_template_id`),
  KEY `estimates_company_id_foreign` (`company_id`),
  CONSTRAINT `estimates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `estimates_estimate_template_id_foreign` FOREIGN KEY (`estimate_template_id`) REFERENCES `estimate_templates` (`id`),
  CONSTRAINT `estimates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `estimates` WRITE;
/*!40000 ALTER TABLE `estimates` DISABLE KEYS */;

INSERT INTO `estimates` (`id`, `estimate_date`, `expiry_date`, `estimate_number`, `status`, `reference_number`, `tax_per_item`, `discount_per_item`, `notes`, `discount`, `discount_type`, `discount_val`, `sub_total`, `total`, `tax`, `unique_hash`, `user_id`, `estimate_template_id`, `company_id`, `created_at`, `updated_at`)
VALUES
	(1,'2020-02-21','2020-02-28','ORC-000574','DRAFT',NULL,'NO','NO','*** Maiores informação no detalhe do projeto',956.00,'fixed',95600,309600,214000,0,'hJ6qjSXtNn1qNIjETpsHs9Inj0HBKCe8PHO1VdFS8vfsk0FOG1usvE3zsp0z',2,1,1,'2020-02-21 01:05:47','2020-03-06 23:39:28'),
	(2,'2019-10-14','2019-10-14','ORC-000575','DRAFT',NULL,'NO','NO',NULL,0.00,'fixed',0,59400,59400,0,'Uceq3xSSmGIQj666YkarbbOWDBxkgPtDyfXBq0XytyYg5mSwvQFfm2Ag5Ark',2,1,1,'2020-03-10 01:54:07','2020-03-10 01:55:12'),
	(3,'2020-04-01','2020-04-01','ORC-000576','ACCEPTED',NULL,'NO','NO',NULL,0.00,'fixed',0,8000,8000,0,'ojtskcLBX8XnEW6Z3g3IEw3r70WdsAyCrbxdmQihDE0oGr2Yp4oSlXx2Lgp9',3,1,1,'2020-04-01 21:11:55','2020-04-01 21:12:31');

/*!40000 ALTER TABLE `estimates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table expense_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expense_categories`;

CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `expense_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table expenses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `attachment_receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` bigint(20) unsigned NOT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense_category_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  KEY `expenses_company_id_foreign` (`company_id`),
  CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table invoice_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice_items`;

CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` bigint(20) unsigned NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint(20) unsigned NOT NULL,
  `tax` bigint(20) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_item_id_foreign` (`item_id`),
  KEY `invoice_items_company_id_foreign` (`company_id`),
  CONSTRAINT `invoice_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;

INSERT INTO `invoice_items` (`id`, `name`, `description`, `discount_type`, `price`, `quantity`, `discount`, `discount_val`, `tax`, `total`, `invoice_id`, `item_id`, `company_id`, `created_at`, `updated_at`)
VALUES
	(2,'Certificado digital','Atualização / Renovação de certificado digital','fixed',8000,1.00,0.00,0,0,8000,1,1,1,'2020-01-19 18:31:04','2020-01-19 18:31:04'),
	(7,'Calculadora (Layout existente)',NULL,'fixed',5400,3.00,0.00,0,0,16200,2,NULL,1,'2020-03-10 01:55:31','2020-03-10 01:55:31'),
	(8,'Painel Administrativo',NULL,'fixed',5400,4.00,0.00,0,0,21600,2,NULL,1,'2020-03-10 01:55:31','2020-03-10 01:55:31'),
	(9,'Integração com AR',NULL,'fixed',5400,2.00,0.00,0,0,10800,2,NULL,1,'2020-03-10 01:55:31','2020-03-10 01:55:31'),
	(10,'Mecanismos de SEO',NULL,'fixed',5400,2.00,0.00,0,0,10800,2,NULL,1,'2020-03-10 01:55:31','2020-03-10 01:55:31'),
	(12,'Manutenção (Site)',NULL,'fixed',8000,1.00,0.00,0,0,8000,3,5,1,'2020-04-01 21:13:37','2020-04-01 21:13:37');

/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoice_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice_templates`;

CREATE TABLE `invoice_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `invoice_templates` WRITE;
/*!40000 ALTER TABLE `invoice_templates` DISABLE KEYS */;

INSERT INTO `invoice_templates` (`id`, `name`, `view`, `path`, `created_at`, `updated_at`)
VALUES
	(1,'Template 1','invoice1','/assets/img/PDF/Template1.png','2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(2,' Template 2','invoice2','/assets/img/PDF/Template2.png','2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(3,'Template 3','invoice3','/assets/img/PDF/Template3.png','2020-02-20 22:27:54','2020-02-20 22:27:54');

/*!40000 ALTER TABLE `invoice_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paid_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint(20) unsigned DEFAULT NULL,
  `sub_total` bigint(20) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `tax` bigint(20) unsigned NOT NULL,
  `due_amount` bigint(20) unsigned NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_template_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_invoice_template_id_foreign` (`invoice_template_id`),
  KEY `invoices_user_id_foreign` (`user_id`),
  KEY `invoices_company_id_foreign` (`company_id`),
  CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_invoice_template_id_foreign` FOREIGN KEY (`invoice_template_id`) REFERENCES `invoice_templates` (`id`),
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;

INSERT INTO `invoices` (`id`, `invoice_date`, `due_date`, `invoice_number`, `reference_number`, `status`, `paid_status`, `tax_per_item`, `discount_per_item`, `notes`, `discount_type`, `discount`, `discount_val`, `sub_total`, `total`, `tax`, `due_amount`, `sent`, `viewed`, `unique_hash`, `invoice_template_id`, `user_id`, `company_id`, `created_at`, `updated_at`)
VALUES
	(1,'2020-01-19','2020-01-28','INV-000573',NULL,'DRAFT','UNPAID','NO','NO','Atualização / renovação do certificado digital\nDomínios\n- poloumauma\n- poloprinter\n- clinicafatimadonayre\n- poloeditora\n- piwik.poloeditora\n- digital.poloprinter (O site está fora do ar, com isso não foi instalado certificado)','fixed',0.00,0,8000,8000,0,8000,0,0,'LZhAfurqeWe1J6UZCsfafr8SuPIOzrm9XhBLVZiUj2ZLwbJnFa8K18D9hzgT',3,2,1,'2020-01-19 17:42:25','2020-01-19 18:31:04'),
	(2,'2019-10-14','2019-10-21','INV-000574',NULL,'DRAFT','UNPAID','NO','NO',NULL,'fixed',0.00,0,59400,59400,0,59400,0,0,'hA0ro062WyREr3wTUMJyPmhoGozDNAIv1auqwU0Y3aZ16RFNVZC0ogSXkHWk',1,2,1,'2020-03-10 01:55:27','2020-03-10 01:55:31'),
	(3,'2020-04-01','2020-04-08','INV-000575',NULL,'SENT','UNPAID','NO','NO',NULL,'fixed',0.00,0,8000,8000,0,8000,1,0,'juHLW6zt1b0vruNUE6lyX4rgXOb0PYrvfkZ9ZM0qCdHas7BEU5SUzJbGgm91',2,3,1,'2020-04-01 21:12:38','2020-04-01 21:22:18');

/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint(20) unsigned NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `unit_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_company_id_foreign` (`company_id`),
  KEY `items_unit_id_foreign` (`unit_id`),
  CONSTRAINT `items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`id`, `name`, `description`, `unit`, `price`, `company_id`, `unit_id`, `created_at`, `updated_at`)
VALUES
	(1,'Certificado digital','Atualização / Renovação de certificado digital',NULL,8000,1,12,'2020-01-19 17:39:34','2020-01-19 17:39:34'),
	(2,'Desenvolvimento Web',NULL,NULL,8000,1,12,'2020-02-21 00:33:07','2020-02-21 00:33:07'),
	(3,'WIREFRAME & DESIGN','Layout de elementos fundamentais na interface.',NULL,8000,1,12,'2020-02-21 01:13:32','2020-02-21 01:13:32'),
	(4,'Código',NULL,NULL,8000,1,12,'2020-02-21 01:14:01','2020-02-21 01:14:01'),
	(5,'Manutenção (Site)',NULL,NULL,8000,1,12,'2020-02-21 01:14:30','2020-02-21 01:14:30'),
	(6,'Domínio & Host',NULL,NULL,8000,1,12,'2020-02-21 01:14:50','2020-02-21 01:14:50');

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `collection_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `manipulations` text COLLATE utf8_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8_unicode_ci NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`)
VALUES
	(2,'Crater\\User',1,'admin_avatar','medialibraryIqiSrP','tupy-copy.jpeg','image/png','public',93512,'[]','[]','[]',1,'2020-04-05 15:51:05','2020-04-05 15:51:05');

/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(121,'2014_10_11_071840_create_companies_table',1),
	(122,'2014_10_11_125754_create_currencies_table',1),
	(123,'2014_10_12_000000_create_users_table',1),
	(124,'2014_10_12_100000_create_password_resets_table',1),
	(125,'2016_05_13_060834_create_settings_table',1),
	(126,'2017_04_11_064308_create_units_table',1),
	(127,'2017_04_11_081227_create_items_table',1),
	(128,'2017_04_11_140447_create_invoice_templates_table',1),
	(129,'2017_04_12_090759_create_invoices_table',1),
	(130,'2017_04_12_091015_create_invoice_items_table',1),
	(131,'2017_05_04_141701_create_estimate_templates_table',1),
	(132,'2017_05_05_055609_create_estimates_table',1),
	(133,'2017_05_05_073927_create_notifications_table',1),
	(134,'2017_05_06_173745_create_countries_table',1),
	(135,'2017_10_02_123501_create_estimate_items_table',1),
	(136,'2017_12_02_204902_create_permission_tables',1),
	(137,'2018_11_02_133825_create_ expense_categories_table',1),
	(138,'2018_11_02_133956_create_expenses_table',1),
	(139,'2019_08_30_072639_create_addresses_table',1),
	(140,'2019_09_02_053155_create_payment_methods_table',1),
	(141,'2019_09_03_135234_create_payments_table',1),
	(142,'2019_09_14_120124_create_media_table',1),
	(143,'2019_09_21_052540_create_tax_types_table',1),
	(144,'2019_09_21_052548_create_taxes_table',1),
	(145,'2019_09_26_145012_create_company_settings_table',1),
	(146,'2016_06_01_000001_create_oauth_auth_codes_table',2),
	(147,'2016_06_01_000002_create_oauth_access_tokens_table',2),
	(148,'2016_06_01_000003_create_oauth_refresh_tokens_table',2),
	(149,'2016_06_01_000004_create_oauth_clients_table',2),
	(150,'2016_06_01_000005_create_oauth_personal_access_clients_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('0a938713366cf60ea2d819079b9c3efd70ca7836a5869373c821814214b011447310c6b63420ac1b',1,2,NULL,'[]',0,'2020-02-23 17:03:19','2020-02-23 17:03:19','2021-02-23 17:03:19'),
	('32a7a68b247035ed6516c9a79e6972dcc76b2f5e9d8e9ecf7f36592963958e444198280e2bf1e3fa',1,3,'password','[]',0,'2020-02-21 00:18:29','2020-02-21 00:18:29','2021-02-21 00:18:29'),
	('8c720bdcf3b784cf67355e42ab44e0a55f731491f0db85144e75f2be555f9b6eee38868b058a9ed4',1,2,NULL,'[]',0,'2020-03-10 01:49:50','2020-03-10 01:49:50','2021-03-10 01:49:50'),
	('984e6fc73f36d686c91178417a8120cbc0e8816989235b3da3fe7febb7d15162694812d86e12bf86',1,2,NULL,'[]',0,'2020-04-04 21:48:43','2020-04-04 21:48:43','2021-04-04 21:48:43');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Crater Personal Access Client','YNez5tsLSIJn7T1pMoiXZm6JHmoHJaYUWL8Lxj7J','http://localhost',1,0,0,'2020-02-20 22:27:56','2020-02-20 22:27:56'),
	(2,NULL,'Crater Password Grant Client','aephE0A2uQfNKJX0V5OBlAQoxgUrUlTVAePonIPy','http://localhost',0,1,0,'2020-02-20 22:27:56','2020-02-20 22:27:56'),
	(3,NULL,'Crater Personal Access Client','gxYJW0bjnfhRsL3YApyDVtCluElz1HctpckxrQW6','http://localhost',1,0,0,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(4,NULL,'Crater Password Grant Client','0LiRHES2zQWGMVatNp88KDwcSk4Exjkh0HfXbhSz','http://localhost',0,1,0,'2020-02-21 00:18:29','2020-02-21 00:18:29');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2020-02-20 22:27:56','2020-02-20 22:27:56'),
	(2,3,'2020-02-21 00:18:29','2020-02-21 00:18:29');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('922d4cb24586736d452d2c8efc7eb39fe33f30567e7b88a04e2484a31a4db5f9797c83766b4b838b','0a938713366cf60ea2d819079b9c3efd70ca7836a5869373c821814214b011447310c6b63420ac1b',0,'2021-02-23 17:03:19'),
	('a4d459f345dd0adc01fb58042f6a740c1a4397da9b1b707571c4f42073621a07724a4748d9e5964a','984e6fc73f36d686c91178417a8120cbc0e8816989235b3da3fe7febb7d15162694812d86e12bf86',0,'2021-04-04 21:48:43'),
	('c5923ded3cf9039ce78e188a094888eb10bc9e3d55ca4951ad88cc7d09c2001ca888619e79585b81','8c720bdcf3b784cf67355e42ab44e0a55f731491f0db85144e75f2be555f9b6eee38868b058a9ed4',0,'2021-03-10 01:49:50');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table payment_methods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_methods`;

CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_company_id_foreign` (`company_id`),
  CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;

INSERT INTO `payment_methods` (`id`, `name`, `company_id`, `created_at`, `updated_at`)
VALUES
	(1,'Cash',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(2,'Check',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(3,'Credit Card',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(4,'Bank Transfer',1,'2020-02-21 00:18:29','2020-02-21 00:18:29');

/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `amount` bigint(20) unsigned NOT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_invoice_id_foreign` (`invoice_id`),
  KEY `payments_company_id_foreign` (`company_id`),
  KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','api','2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(2,'contact','api','2020-02-20 22:27:54','2020-02-20 22:27:54'),
	(3,'staff','api','2020-02-20 22:27:54','2020-02-20 22:27:54');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `option`, `value`, `created_at`, `updated_at`)
VALUES
	(1,'profile_complete','COMPLETED','2020-02-20 22:27:54','2020-02-21 00:18:28'),
	(2,'version','3.0.0','2020-02-21 00:18:28','2020-02-21 00:18:28');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tax_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax_types`;

CREATE TABLE `tax_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  `compound_tax` tinyint(4) NOT NULL DEFAULT '0',
  `collective_tax` tinyint(4) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_types_company_id_foreign` (`company_id`),
  CONSTRAINT `tax_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table taxes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxes`;

CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_type_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `estimate_id` int(10) unsigned DEFAULT NULL,
  `invoice_item_id` int(10) unsigned DEFAULT NULL,
  `estimate_item_id` int(10) unsigned DEFAULT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` bigint(20) unsigned NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  `compound_tax` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxes_tax_type_id_foreign` (`tax_type_id`),
  KEY `taxes_invoice_id_foreign` (`invoice_id`),
  KEY `taxes_estimate_id_foreign` (`estimate_id`),
  KEY `taxes_invoice_item_id_foreign` (`invoice_item_id`),
  KEY `taxes_estimate_item_id_foreign` (`estimate_item_id`),
  KEY `taxes_item_id_foreign` (`item_id`),
  KEY `taxes_company_id_foreign` (`company_id`),
  CONSTRAINT `taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `taxes_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_estimate_item_id_foreign` FOREIGN KEY (`estimate_item_id`) REFERENCES `estimate_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_tax_type_id_foreign` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table units
# ------------------------------------------------------------

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_company_id_foreign` (`company_id`),
  CONSTRAINT `units_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;

INSERT INTO `units` (`id`, `name`, `company_id`, `created_at`, `updated_at`)
VALUES
	(1,'box',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(2,'cm',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(3,'dz',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(4,'ft',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(5,'g',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(6,'in',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(7,'kg',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(8,'km',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(9,'lb',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(10,'mg',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(11,'pc',1,'2020-02-21 00:18:29','2020-02-21 00:18:29'),
	(12,'Hora',1,'2020-01-19 17:05:35','2020-01-19 17:05:35'),
	(13,'Un',1,'2020-02-23 16:45:15','2020-02-23 16:45:15');

/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `github_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_portal` tinyint(1) DEFAULT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_currency_id_foreign` (`currency_id`),
  KEY `users_company_id_foreign` (`company_id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role`, `remember_token`, `facebook_id`, `google_id`, `github_id`, `contact_name`, `company_name`, `website`, `enable_portal`, `currency_id`, `company_id`, `created_at`, `updated_at`)
VALUES
	(1,'Aguinaldo Tupy','aguinaldo.tupy@gmail.com',NULL,'$2y$10$HhY9mAqPmuWHacE7hn6rDeJVkoJ8Ubp90FmJJtsX/gGXPs3JplOUq','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-01-19 16:53:26','2020-01-19 16:55:27'),
	(2,'Polo Printer','ivo.donayre@poloprinter.com.br',NULL,'$2y$10$GwfgzRg1LUzgfLPyziSELu9i8iaQgjolbpgIJ1UM4ie92rNu1KWIW','customer',NULL,NULL,NULL,NULL,'Ivo Donayre',NULL,'https://www.poloprinter.com.br',NULL,21,1,'2020-01-19 17:01:07','2020-02-23 17:11:35'),
	(3,'Metro Company U.S.A.',NULL,NULL,'$2y$10$Nmc6TnzsVrQ4KX6wYx6jreKr3y.5KcXQQO6EHC9w3fTCquUnr8rsi','customer',NULL,NULL,NULL,NULL,'Metro Kids Company Comércio de Roupas LTDA',NULL,NULL,NULL,21,1,'2020-04-01 21:10:52','2020-04-01 21:10:52');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
