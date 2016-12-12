USE `wikizavadi`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 192.168.0.14    Database: wiki
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` varbinary(767) NOT NULL,
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varbinary(255) NOT NULL,
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned DEFAULT NULL,
  `ar_text_id` int(10) unsigned DEFAULT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  KEY `ar_revid` (`ar_rev_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
INSERT INTO `archive` VALUES (1,0,'MySQL','','Karel moved page [[MySQL]] to [[Category:MySQL]]',1,'Karel','20161007001946',0,'',17,15,0,29,9,0,'esqwxxfk6evkjmljfrfkeajrqi37h19',NULL,NULL);
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_passwords`
--

DROP TABLE IF EXISTS `bot_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_passwords` (
  `bp_user` int(11) NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL,
  PRIMARY KEY (`bp_user`,`bp_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_passwords`
--

LOCK TABLES `bot_passwords` WRITE;
/*!40000 ALTER TABLE `bot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'MySQL',3,0,0),(2,'Linux',1,0,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
INSERT INTO `categorylinks` VALUES (10,'MySQL','ALLOWING REMOTE ACCESS TO MYSQL SERVER','','2016-10-06 22:38:27','uppercase','page'),(11,'MySQL','RESTART MYSQL SERVER ON LINUX','','2016-10-06 23:22:30','uppercase','page'),(12,'MySQL','REMOVE ACCESS PERMISSIONS FROM MYSQL USER','','2016-10-06 23:24:43','uppercase','page'),(14,'Linux','BASIC LINUX COMMANDS','','2016-10-10 19:47:05','uppercase','page');
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag` (
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(11) DEFAULT NULL,
  `ct_rev_id` int(11) DEFAULT NULL,
  `ct_tag` varbinary(255) NOT NULL,
  `ct_params` blob,
  UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
INSERT INTO `externallinks` VALUES (1,1,'//meta.wikimedia.org/wiki/Help:Contents','http://org.wikimedia.meta./wiki/Help:Contents'),(2,1,'//meta.wikimedia.org/wiki/Help:Contents','https://org.wikimedia.meta./wiki/Help:Contents'),(3,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings','http://org.mediawiki.www./wiki/Special:MyLanguage/Manual:Configuration_settings'),(4,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings','https://org.mediawiki.www./wiki/Special:MyLanguage/Manual:Configuration_settings'),(5,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ','http://org.mediawiki.www./wiki/Special:MyLanguage/Manual:FAQ'),(6,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ','https://org.mediawiki.www./wiki/Special:MyLanguage/Manual:FAQ'),(7,1,'https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce','https://org.wikimedia.lists./mailman/listinfo/mediawiki-announce'),(8,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources','http://org.mediawiki.www./wiki/Special:MyLanguage/Localisation#Translation_resources'),(9,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources','https://org.mediawiki.www./wiki/Special:MyLanguage/Localisation#Translation_resources'),(10,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam','http://org.mediawiki.www./wiki/Special:MyLanguage/Manual:Combating_spam'),(11,1,'//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam','https://org.mediawiki.www./wiki/Special:MyLanguage/Manual:Combating_spam'),(12,1,'https://meta.wikimedia.org/wiki/Help:Wikitext_examples','https://org.wikimedia.meta./wiki/Help:Wikitext_examples');
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` varbinary(767) DEFAULT '',
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` varbinary(767) DEFAULT NULL,
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varbinary(255) DEFAULT NULL,
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` varbinary(767) NOT NULL,
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varbinary(255) NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
INSERT INTO `imagelinks` VALUES (4,0,'Example.jpg');
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` VALUES ('acronym','http://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),('advogato','http://www.advogato.org/$1','','',0,0),('arxiv','http://www.arxiv.org/abs/$1','','',0,0),('c2find','http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),('cache','http://www.google.com/search?q=cache:$1','','',0,0),('commons','https://commons.wikimedia.org/wiki/$1','https://commons.wikimedia.org/w/api.php','',0,0),('dictionary','http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),('docbook','http://wiki.docbook.org/$1','','',0,0),('doi','http://dx.doi.org/$1','','',0,0),('drumcorpswiki','http://www.drumcorpswiki.com/$1','http://drumcorpswiki.com/api.php','',0,0),('dwjwiki','http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),('elibre','http://enciclopedia.us.es/index.php/$1','http://enciclopedia.us.es/api.php','',0,0),('emacswiki','http://www.emacswiki.org/cgi-bin/wiki.pl?$1','','',0,0),('foldoc','http://foldoc.org/?$1','','',0,0),('foxwiki','http://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),('freebsdman','http://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),('gej','http://www.esperanto.de/dej.malnova/aktivikio.pl?$1','','',0,0),('gentoo-wiki','http://gentoo-wiki.com/$1','','',0,0),('google','http://www.google.com/search?q=$1','','',0,0),('googlegroups','http://groups.google.com/groups?q=$1','','',0,0),('hammondwiki','http://www.dairiki.org/HammondWiki/$1','','',0,0),('hrwiki','http://www.hrwiki.org/wiki/$1','http://www.hrwiki.org/w/api.php','',0,0),('imdb','http://www.imdb.com/find?q=$1&tt=on','','',0,0),('jargonfile','http://sunir.org/apps/meta.pl?wiki=JargonFile&redirect=$1','','',0,0),('kmwiki','http://kmwiki.wikispaces.com/$1','','',0,0),('linuxwiki','http://linuxwiki.de/$1','','',0,0),('lojban','http://www.lojban.org/tiki/tiki-index.php?page=$1','','',0,0),('lqwiki','http://wiki.linuxquestions.org/wiki/$1','','',0,0),('lugkr','http://www.lug-kr.de/wiki/$1','','',0,0),('meatball','http://www.usemod.com/cgi-bin/mb.pl?$1','','',0,0),('mediawikiwiki','https://www.mediawiki.org/wiki/$1','https://www.mediawiki.org/w/api.php','',0,0),('mediazilla','https://bugzilla.wikimedia.org/$1','','',0,0),('memoryalpha','http://en.memory-alpha.org/wiki/$1','http://en.memory-alpha.org/api.php','',0,0),('metawiki','http://sunir.org/apps/meta.pl?$1','','',0,0),('metawikimedia','https://meta.wikimedia.org/wiki/$1','https://meta.wikimedia.org/w/api.php','',0,0),('mozillawiki','http://wiki.mozilla.org/$1','https://wiki.mozilla.org/api.php','',0,0),('mw','https://www.mediawiki.org/wiki/$1','https://www.mediawiki.org/w/api.php','',0,0),('oeis','http://oeis.org/$1','','',0,0),('openwiki','http://openwiki.com/ow.asp?$1','','',0,0),('ppr','http://c2.com/cgi/wiki?$1','','',0,0),('pythoninfo','http://wiki.python.org/moin/$1','','',0,0),('rfc','http://www.rfc-editor.org/rfc/rfc$1.txt','','',0,0),('s23wiki','http://s23.org/wiki/$1','http://s23.org/w/api.php','',0,0),('seattlewireless','http://seattlewireless.net/$1','','',0,0),('senseislibrary','http://senseis.xmp.net/?$1','','',0,0),('shoutwiki','http://www.shoutwiki.com/wiki/$1','http://www.shoutwiki.com/w/api.php','',0,0),('sourcewatch','http://www.sourcewatch.org/index.php?title=$1','http://www.sourcewatch.org/api.php','',0,0),('squeak','http://wiki.squeak.org/squeak/$1','','',0,0),('tejo','http://www.tejo.org/vikio/$1','','',0,0),('theopedia','http://www.theopedia.com/$1','','',0,0),('tmbw','http://www.tmbw.net/wiki/$1','http://tmbw.net/wiki/api.php','',0,0),('tmnet','http://www.technomanifestos.net/?$1','','',0,0),('twiki','http://twiki.org/cgi-bin/view/$1','','',0,0),('uea','http://uea.org/vikio/index.php/$1','http://uea.org/vikio/api.php','',0,0),('uncyclopedia','http://en.uncyclopedia.co/wiki/$1','http://en.uncyclopedia.co/w/api.php','',0,0),('unreal','http://wiki.beyondunreal.com/$1','http://wiki.beyondunreal.com/w/api.php','',0,0),('usemod','http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),('webseitzwiki','http://webseitz.fluxent.com/wiki/$1','','',0,0),('wiki','http://c2.com/cgi/wiki?$1','','',0,0),('wikia','http://www.wikia.com/wiki/$1','','',0,0),('wikibooks','https://en.wikibooks.org/wiki/$1','https://en.wikibooks.org/w/api.php','',0,0),('wikif1','http://www.wikif1.org/$1','','',0,0),('wikihow','http://www.wikihow.com/$1','http://www.wikihow.com/api.php','',0,0),('wikimedia','https://wikimediafoundation.org/wiki/$1','https://wikimediafoundation.org/w/api.php','',0,0),('wikinews','https://en.wikinews.org/wiki/$1','https://en.wikinews.org/w/api.php','',0,0),('wikinfo','http://wikinfo.co/English/index.php/$1','','',0,0),('wikipedia','https://en.wikipedia.org/wiki/$1','https://en.wikipedia.org/w/api.php','',0,0),('wikiquote','https://en.wikiquote.org/wiki/$1','https://en.wikiquote.org/w/api.php','',0,0),('wikisource','https://wikisource.org/wiki/$1','https://wikisource.org/w/api.php','',0,0),('wikispecies','https://species.wikimedia.org/wiki/$1','https://species.wikimedia.org/w/api.php','',0,0),('wikiversity','https://en.wikiversity.org/wiki/$1','https://en.wikiversity.org/w/api.php','',0,0),('wikivoyage','https://en.wikivoyage.org/wiki/$1','https://en.wikivoyage.org/w/api.php','',0,0),('wikt','https://en.wiktionary.org/wiki/$1','https://en.wiktionary.org/w/api.php','',0,0),('wiktionary','https://en.wiktionary.org/wiki/$1','https://en.wiktionary.org/w/api.php','',0,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varbinary(255) NOT NULL DEFAULT '',
  `ipb_reason` varbinary(767) NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iwlinks`
--

DROP TABLE IF EXISTS `iwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `iwl_from` (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iwlinks`
--

LOCK TABLES `iwlinks` WRITE;
/*!40000 ALTER TABLE `iwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `iwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (21,'refreshLinksPrioritized',0,'Basic_Linux_Commands','20161010215008','a:4:{s:16:\"rootJobTimestamp\";s:14:\"20161010215008\";s:23:\"useRecursiveLinksUpdate\";b:0;s:14:\"triggeringUser\";a:2:{s:6:\"userId\";i:1;s:8:\"userName\";s:5:\"Karel\";}s:20:\"triggeringRevisionId\";i:30;}',1522500594,0,'',NULL,'rwsp3t3fxqm2cs1yw1t49g8l32637v1');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_cache`
--

DROP TABLE IF EXISTS `l10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  KEY `lc_lang_key` (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_cache`
--

LOCK TABLES `l10n_cache` WRITE;
/*!40000 ALTER TABLE `l10n_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `l10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_search`
--

DROP TABLE IF EXISTS `log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ls_field_val` (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_search`
--

LOCK TABLES `log_search` WRITE;
/*!40000 ALTER TABLE `log_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_user_text` varbinary(255) NOT NULL DEFAULT '',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment` varbinary(767) NOT NULL DEFAULT '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`),
  KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `type_action` (`log_type`,`log_action`,`log_timestamp`),
  KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  KEY `log_user_text_time` (`log_user_text`,`log_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,'patrol','autopatrol','20161006230010',1,'Karel',0,'Main_Page',1,'','a:3:{s:8:\"4::curid\";i:2;s:9:\"5::previd\";i:1;s:7:\"6::auto\";i:1;}',0),(2,'patrol','autopatrol','20161006230554',1,'Karel',0,'Main_Page',1,'','a:3:{s:8:\"4::curid\";i:3;s:9:\"5::previd\";i:2;s:7:\"6::auto\";i:1;}',0),(3,'patrol','autopatrol','20161006233748',1,'Karel',2,'Karel',2,'','a:3:{s:8:\"4::curid\";i:4;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(4,'patrol','autopatrol','20161006233930',1,'Karel',4,'About',3,'','a:3:{s:8:\"4::curid\";i:5;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(5,'patrol','autopatrol','20161006234413',1,'Karel',0,'MediaWiki',4,'','a:3:{s:8:\"4::curid\";i:6;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(6,'patrol','autopatrol','20161006234951',1,'Karel',0,'Main_Page',1,'','a:3:{s:8:\"4::curid\";i:7;s:9:\"5::previd\";i:3;s:7:\"6::auto\";i:1;}',0),(7,'patrol','autopatrol','20161006235717',1,'Karel',0,'Main_Page',1,'','a:3:{s:8:\"4::curid\";i:8;s:9:\"5::previd\";i:7;s:7:\"6::auto\";i:1;}',0),(8,'patrol','autopatrol','20161007000440',1,'Karel',0,'Main_Page',1,'','a:3:{s:8:\"4::curid\";i:9;s:9:\"5::previd\";i:8;s:7:\"6::auto\";i:1;}',0),(9,'patrol','autopatrol','20161007000522',1,'Karel',1,'Main_Page',5,'','a:3:{s:8:\"4::curid\";i:10;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(10,'patrol','autopatrol','20161007000538',1,'Karel',1,'Main_Page',5,'','a:3:{s:8:\"4::curid\";i:11;s:9:\"5::previd\";i:10;s:7:\"6::auto\";i:1;}',0),(11,'patrol','autopatrol','20161007001849',1,'Karel',0,'Linux',6,'','a:3:{s:8:\"4::curid\";i:12;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(12,'move','move','20161007001900',1,'Karel',0,'Linux',6,'','a:2:{s:9:\"4::target\";s:14:\"Category:Linux\";s:10:\"5::noredir\";s:1:\"0\";}',0),(13,'patrol','autopatrol','20161007001934',1,'Karel',0,'MySQL',8,'','a:3:{s:8:\"4::curid\";i:15;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(14,'move','move','20161007001946',1,'Karel',0,'MySQL',8,'','a:2:{s:9:\"4::target\";s:14:\"Category:MySQL\";s:10:\"5::noredir\";s:1:\"0\";}',0),(15,'patrol','autopatrol','20161007003827',1,'Karel',0,'Allowing_remote_access_to_MySQL_server',10,'','a:3:{s:8:\"4::curid\";i:18;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(16,'patrol','autopatrol','20161007012230',1,'Karel',0,'Restart_MySQL_server_on_linux',11,'','a:3:{s:8:\"4::curid\";i:19;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(17,'patrol','autopatrol','20161007012259',1,'Karel',0,'Restart_MySQL_server_on_linux',11,'','a:3:{s:8:\"4::curid\";i:20;s:9:\"5::previd\";i:19;s:7:\"6::auto\";i:1;}',0),(18,'patrol','autopatrol','20161007012443',1,'Karel',0,'Remove_access_permissions_from_MySQL_user',12,'','a:3:{s:8:\"4::curid\";i:21;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(19,'patrol','autopatrol','20161007012613',1,'Karel',0,'Allowing_remote_access_to_MySQL_server',10,'','a:3:{s:8:\"4::curid\";i:22;s:9:\"5::previd\";i:18;s:7:\"6::auto\";i:1;}',0),(20,'delete','delete','20161007012750',1,'Karel',0,'MySQL',9,'content was: \"#REDIRECT [[:Category:MySQL]]\", and the only contributor was \"[[Special:Contributions/Karel|Karel]]\" ([[User talk:Karel|talk]])','a:0:{}',0),(21,'patrol','autopatrol','20161007013009',1,'Karel',14,'MySQL',8,'','a:3:{s:8:\"4::curid\";i:23;s:9:\"5::previd\";i:16;s:7:\"6::auto\";i:1;}',0),(22,'patrol','autopatrol','20161007013405',1,'Karel',0,'Main_Page',1,'','a:3:{s:8:\"4::curid\";i:24;s:9:\"5::previd\";i:9;s:7:\"6::auto\";i:1;}',0),(23,'patrol','autopatrol','20161010212705',1,'Karel',0,'Set_up_FTP_on_linux',13,'','a:3:{s:8:\"4::curid\";i:25;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(24,'patrol','autopatrol','20161010213743',1,'Karel',0,'Linux_basics',14,'','a:3:{s:8:\"4::curid\";i:26;s:9:\"5::previd\";i:0;s:7:\"6::auto\";i:1;}',0),(25,'move','move','20161010213837',1,'Karel',0,'Linux_basics',14,'','a:2:{s:9:\"4::target\";s:22:\"Linux - basic commands\";s:10:\"5::noredir\";s:1:\"1\";}',0),(26,'patrol','autopatrol','20161010214702',1,'Karel',0,'Linux_-_basic_commands',14,'','a:3:{s:8:\"4::curid\";i:28;s:9:\"5::previd\";i:27;s:7:\"6::auto\";i:1;}',0),(27,'move','move','20161010214904',1,'Karel',0,'Linux_-_basic_commands',14,'','a:2:{s:9:\"4::target\";s:14:\"Basic commands\";s:10:\"5::noredir\";s:1:\"1\";}',0),(28,'move','move','20161010215008',1,'Karel',0,'Basic_commands',14,'','a:2:{s:9:\"4::target\";s:20:\"Basic Linux Commands\";s:10:\"5::noredir\";s:1:\"1\";}',0);
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_deps`
--

DROP TABLE IF EXISTS `module_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  UNIQUE KEY `md_module_skin` (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_deps`
--

LOCK TABLES `module_deps` WRITE;
/*!40000 ALTER TABLE `module_deps` DISABLE KEYS */;
INSERT INTO `module_deps` VALUES ('ext.wikiEditor','vector|en','[\"extensions/WikiEditor/modules/ext.wikiEditor.less\"]'),('ext.wikiEditor.toolbar.styles','vector|en','[\"extensions/WikiEditor/modules/ext.wikiEditor.toolbar.styles.less\"]'),('jquery.spinner','vector|en','[\"resources/src/jquery/images/spinner-large.gif\",\"resources/src/jquery/images/spinner.gif\"]'),('jquery.ui.button','vector|en','[\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_ffffff_256x240.png\"]'),('jquery.ui.core','vector|en','[\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_100_000000_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_15_cd0a0a_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_70_000000_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-hard_100_f2f5f7_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-hard_80_d7ebf9_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_100_e4f1fb_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_100_ffffff_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_25_ffef8f_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_inset-hard_100_f0f0f0_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_2694e8_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_2e83ff_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_3d80b3_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_666666_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_72a7cf_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_ffffff_256x240.png\"]'),('jquery.ui.core.styles','vector|en','[\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_flat_75_ffffff_40x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_55_fbf9ee_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_65_ffffff_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_75_dadada_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_95_fef1ec_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_222222_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_2e83ff_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_454545_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_888888_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_cd0a0a_256x240.png\"]'),('jquery.ui.dialog','vector|en','[\"skins/Vector/skinStyles/jquery.ui/images/close.png\",\"skins/Vector/skinStyles/jquery.ui/images/titlebar-fade.png\"]'),('jquery.wikiEditor','vector|en','[\"extensions/WikiEditor/modules/images/toolbar/loading.gif\",\"extensions/WikiEditor/modules/jquery.wikiEditor.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('jquery.wikiEditor.dialogs','vector|en','[\"extensions/WikiEditor/modules/jquery.wikiEditor.dialogs.less\"]'),('jquery.wikiEditor.dialogs.config','vector|en','[\"extensions/WikiEditor/modules/images/dialogs/insert-disambiguation.png\",\"extensions/WikiEditor/modules/images/dialogs/insert-link-exists.png\",\"extensions/WikiEditor/modules/images/dialogs/insert-link-external.png\",\"extensions/WikiEditor/modules/images/dialogs/insert-link-invalid.png\",\"extensions/WikiEditor/modules/images/dialogs/insert-link-notexists.png\",\"extensions/WikiEditor/modules/jquery.wikiEditor.dialogs.config.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('jquery.wikiEditor.toolbar','vector|en','[\"extensions/WikiEditor/modules/images/toolbar/arrow-down.png\",\"extensions/WikiEditor/modules/images/toolbar/arrow-down.svg\",\"extensions/WikiEditor/modules/images/toolbar/arrow-ltr.png\",\"extensions/WikiEditor/modules/images/toolbar/arrow-ltr.svg\",\"extensions/WikiEditor/modules/images/toolbar/base.png\",\"extensions/WikiEditor/modules/images/toolbar/button-sprite.png\",\"extensions/WikiEditor/modules/images/toolbar/button-sprite.svg\",\"extensions/WikiEditor/modules/jquery.wikiEditor.toolbar.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('mediawiki.ForeignStructuredUpload.BookletLayout','vector|en','[\"resources/src/mediawiki/mediawiki.ForeignStructuredUpload.BookletLayout.less\"]'),('mediawiki.action.view.categoryPage.styles','vector|en','[\"resources/src/mediawiki.action/mediawiki.action.view.categoryPage.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('mediawiki.action.view.postEdit','cologneblue|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.action.view.postEdit','mediawikibootstrap|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.action.view.postEdit','modern|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.action.view.postEdit','monobook|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.action.view.postEdit','vector|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.action.view.redirectPage','vector|en','[\"resources/src/mediawiki.action/images/nextredirect-ltr.png\",\"resources/src/mediawiki.action/images/nextredirect-ltr.svg\",\"resources/src/mediawiki.action/images/nextredirect-rtl.png\",\"resources/src/mediawiki.action/images/nextredirect-rtl.svg\",\"resources/src/mediawiki.action/images/redirect-ltr.png\",\"resources/src/mediawiki.action/images/redirect-ltr.svg\",\"resources/src/mediawiki.action/images/redirect-rtl.png\",\"resources/src/mediawiki.action/images/redirect-rtl.svg\"]'),('mediawiki.feedlink','vector|en','[\"resources/src/mediawiki/images/feed-icon.png\",\"resources/src/mediawiki/images/feed-icon.svg\"]'),('mediawiki.helplink','modern|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/help.png\",\"resources/src/mediawiki/images/help.svg\",\"resources/src/mediawiki/mediawiki.helplink.less\"]'),('mediawiki.helplink','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/help.png\",\"resources/src/mediawiki/images/help.svg\",\"resources/src/mediawiki/mediawiki.helplink.less\"]'),('mediawiki.htmlform.styles','modern|en','[\"resources/src/mediawiki/images/question.png\",\"resources/src/mediawiki/images/question.svg\"]'),('mediawiki.htmlform.styles','vector|en','[\"resources/src/mediawiki/images/question.png\",\"resources/src/mediawiki/images/question.svg\"]'),('mediawiki.icon','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/arrow-collapsed-ltr.png\",\"resources/src/mediawiki/images/arrow-collapsed-ltr.svg\",\"resources/src/mediawiki/images/arrow-expanded.png\",\"resources/src/mediawiki/images/arrow-expanded.svg\",\"resources/src/mediawiki/mediawiki.icon.less\"]'),('mediawiki.legacy.oldshared','cologneblue|en','[\"resources/src/mediawiki.legacy/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.legacy/images/magnify-clip-ltr.svg\"]'),('mediawiki.legacy.shared','cologneblue|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/help-question-hover.gif\",\"resources/src/mediawiki.legacy/images/help-question.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.legacy.shared','mediawikibootstrap|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/help-question-hover.gif\",\"resources/src/mediawiki.legacy/images/help-question.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.legacy.shared','modern|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/help-question-hover.gif\",\"resources/src/mediawiki.legacy/images/help-question.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.legacy.shared','monobook|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/help-question-hover.gif\",\"resources/src/mediawiki.legacy/images/help-question.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.legacy.shared','vector|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/help-question-hover.gif\",\"resources/src/mediawiki.legacy/images/help-question.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.notification','vector|en','[\"skins/Vector/skinStyles/mediawiki.notification.less\",\"skins/Vector/variables.less\"]'),('mediawiki.pager.tablePager','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/arrow-sort-ascending.png\",\"resources/src/mediawiki/images/arrow-sort-ascending.svg\",\"resources/src/mediawiki/images/arrow-sort-descending.png\",\"resources/src/mediawiki/images/arrow-sort-descending.svg\",\"resources/src/mediawiki/images/pager-arrow-disabled-fastforward-ltr.png\",\"resources/src/mediawiki/images/pager-arrow-disabled-fastforward-ltr.svg\",\"resources/src/mediawiki/images/pager-arrow-disabled-fastforward-rtl.png\",\"resources/src/mediawiki/images/pager-arrow-disabled-fastforward-rtl.svg\",\"resources/src/mediawiki/images/pager-arrow-disabled-forward-ltr.png\",\"resources/src/mediawiki/images/pager-arrow-disabled-forward-ltr.svg\",\"resources/src/mediawiki/images/pager-arrow-disabled-forward-rtl.png\",\"resources/src/mediawiki/images/pager-arrow-disabled-forward-rtl.svg\",\"resources/src/mediawiki/images/pager-arrow-fastforward-ltr.png\",\"resources/src/mediawiki/images/pager-arrow-fastforward-ltr.svg\",\"resources/src/mediawiki/images/pager-arrow-fastforward-rtl.png\",\"resources/src/mediawiki/images/pager-arrow-fastforward-rtl.svg\",\"resources/src/mediawiki/images/pager-arrow-forward-ltr.png\",\"resources/src/mediawiki/images/pager-arrow-forward-ltr.svg\",\"resources/src/mediawiki/images/pager-arrow-forward-rtl.png\",\"resources/src/mediawiki/images/pager-arrow-forward-rtl.svg\",\"resources/src/mediawiki/mediawiki.pager.tablePager.less\"]'),('mediawiki.skinning.content.externallinks','monobook|en','[\"resources/src/mediawiki.skinning/images/audio-ltr.png\",\"resources/src/mediawiki.skinning/images/audio-ltr.svg\",\"resources/src/mediawiki.skinning/images/chat-ltr.png\",\"resources/src/mediawiki.skinning/images/chat-ltr.svg\",\"resources/src/mediawiki.skinning/images/document-ltr.png\",\"resources/src/mediawiki.skinning/images/document-ltr.svg\",\"resources/src/mediawiki.skinning/images/external-ltr.png\",\"resources/src/mediawiki.skinning/images/external-ltr.svg\",\"resources/src/mediawiki.skinning/images/ftp-ltr.png\",\"resources/src/mediawiki.skinning/images/ftp-ltr.svg\",\"resources/src/mediawiki.skinning/images/mail.png\",\"resources/src/mediawiki.skinning/images/mail.svg\",\"resources/src/mediawiki.skinning/images/video.png\",\"resources/src/mediawiki.skinning/images/video.svg\"]'),('mediawiki.skinning.interface','mediawikibootstrap|en','[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),('mediawiki.skinning.interface','monobook|en','[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),('mediawiki.skinning.interface','vector|en','[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),('mediawiki.special','vector|en','[\"skins/Vector/skinStyles/mediawiki.special.less\"]'),('mediawiki.special.preferences.styles','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"skins/Vector/images/preferences/break.png\",\"skins/Vector/images/preferences/fade.png\",\"skins/Vector/skinStyles/mediawiki.special.preferences.styles.less\",\"skins/Vector/variables.less\"]'),('mediawiki.special.userlogin.common.styles','vector|en','[\"resources/src/mediawiki.special/images/icon-lock.png\"]'),('mediawiki.special.userlogin.login.styles','vector|en','[\"resources/src/mediawiki.special/images/glyph-people-large.png\"]'),('mediawiki.toolbar','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.toolbar/images/ar/button_bold.png\",\"resources/src/mediawiki.toolbar/images/ar/button_headline.png\",\"resources/src/mediawiki.toolbar/images/ar/button_italic.png\",\"resources/src/mediawiki.toolbar/images/ar/button_link.png\",\"resources/src/mediawiki.toolbar/images/ar/button_nowiki.png\",\"resources/src/mediawiki.toolbar/images/be-tarask/button_bold.png\",\"resources/src/mediawiki.toolbar/images/be-tarask/button_italic.png\",\"resources/src/mediawiki.toolbar/images/be-tarask/button_link.png\",\"resources/src/mediawiki.toolbar/images/de/button_bold.png\",\"resources/src/mediawiki.toolbar/images/de/button_italic.png\",\"resources/src/mediawiki.toolbar/images/en/button_bold.png\",\"resources/src/mediawiki.toolbar/images/en/button_extlink.png\",\"resources/src/mediawiki.toolbar/images/en/button_headline.png\",\"resources/src/mediawiki.toolbar/images/en/button_hr.png\",\"resources/src/mediawiki.toolbar/images/en/button_image.png\",\"resources/src/mediawiki.toolbar/images/en/button_italic.png\",\"resources/src/mediawiki.toolbar/images/en/button_link.png\",\"resources/src/mediawiki.toolbar/images/en/button_media.png\",\"resources/src/mediawiki.toolbar/images/en/button_nowiki.png\",\"resources/src/mediawiki.toolbar/images/en/button_sig.png\",\"resources/src/mediawiki.toolbar/images/fa/button_bold.png\",\"resources/src/mediawiki.toolbar/images/fa/button_headline.png\",\"resources/src/mediawiki.toolbar/images/fa/button_italic.png\",\"resources/src/mediawiki.toolbar/images/fa/button_link.png\",\"resources/src/mediawiki.toolbar/images/fa/button_nowiki.png\",\"resources/src/mediawiki.toolbar/images/ksh/button_italic.png\",\"resources/src/mediawiki.toolbar/images/ru/button_bold.png\",\"resources/src/mediawiki.toolbar/images/ru/button_italic.png\",\"resources/src/mediawiki.toolbar/images/ru/button_link.png\",\"resources/src/mediawiki.toolbar/toolbar.less\"]'),('mediawiki.ui','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/forms.less\",\"resources/src/mediawiki.ui/components/utilities.less\",\"resources/src/mediawiki.ui/default.less\"]'),('mediawiki.ui.button','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/buttons.less\"]'),('mediawiki.ui.checkbox','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/checkbox.less\",\"resources/src/mediawiki.ui/components/images/checked.png\",\"resources/src/mediawiki.ui/components/images/checked.svg\",\"resources/src/mediawiki.ui/components/images/checked_disabled.png\",\"resources/src/mediawiki.ui/components/images/checked_disabled.svg\"]'),('mediawiki.ui.input','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/inputs.less\"]'),('mediawiki.ui.radio','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/images/radio_checked.png\",\"resources/src/mediawiki.ui/components/images/radio_checked.svg\",\"resources/src/mediawiki.ui/components/images/radio_disabled.png\",\"resources/src/mediawiki.ui/components/images/radio_disabled.svg\",\"resources/src/mediawiki.ui/components/radio.less\"]'),('mediawiki.widgets','vector|en','[\"resources/src/mediawiki.widgets/mw.widgets.TitleWidget.less\"]'),('mediawiki.widgets.DateInputWidget','vector|en','[\"resources/src/mediawiki.widgets/mw.widgets.CalendarWidget.less\",\"resources/src/mediawiki.widgets/mw.widgets.DateInputWidget.less\"]'),('mediawiki.widgets.StashedFileWidget','vector|en','[\"resources/src/mediawiki.widgets/mw.widgets.StashedFileWidget.less\"]'),('oojs-ui-core.styles','vector|en','[\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-constructive-deprecated.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-constructive-deprecated.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-invert.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-invert.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/circle-constructive-deprecated.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/circle-constructive-deprecated.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/circle-invert.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/circle-invert.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/textures/pending.gif\",\"skins/Vector/skinStyles/ooui.less\"]'),('oojs-ui-widgets','vector|en','[\"resources/lib/oojs-ui/images/grab.cur\",\"resources/lib/oojs-ui/images/grabbing.cur\"]'),('skins.mediawikibootstrap','mediawikibootstrap|en','[\"skins/MediaWikiBootstrap/fonts/fontawesome-webfont.eot\",\"skins/MediaWikiBootstrap/fonts/fontawesome-webfont.svg\",\"skins/MediaWikiBootstrap/fonts/fontawesome-webfont.ttf\",\"skins/MediaWikiBootstrap/fonts/fontawesome-webfont.woff\",\"skins/MediaWikiBootstrap/fonts/glyphicons-halflings-regular.eot\",\"skins/MediaWikiBootstrap/fonts/glyphicons-halflings-regular.ttf\",\"skins/MediaWikiBootstrap/fonts/glyphicons-halflings-regular.woff\"]'),('skins.modern','modern|en','[\"skins/Modern/resources/images/audio.png\",\"skins/Modern/resources/images/bullet.gif\",\"skins/Modern/resources/images/discussionitem_icon.gif\",\"skins/Modern/resources/images/document.png\",\"skins/Modern/resources/images/external.png\",\"skins/Modern/resources/images/file_icon.gif\",\"skins/Modern/resources/images/footer-grad.png\",\"skins/Modern/resources/images/lock_icon.gif\",\"skins/Modern/resources/images/mail_icon.gif\",\"skins/Modern/resources/images/news_icon.png\",\"skins/Modern/resources/images/video.png\"]'),('skins.monobook.styles','monobook|en','[\"skins/MonoBook/bullet.gif\",\"skins/MonoBook/headbg.jpg\",\"skins/MonoBook/user.gif\"]'),('skins.vector.styles','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.animation.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"skins/Vector/components/common.less\",\"skins/Vector/components/externalLinks.less\",\"skins/Vector/components/footer.less\",\"skins/Vector/components/navigation.less\",\"skins/Vector/components/personalMenu.less\",\"skins/Vector/components/search.less\",\"skins/Vector/components/tabs.less\",\"skins/Vector/components/watchstar.less\",\"skins/Vector/images/arrow-down-focus-icon.png\",\"skins/Vector/images/arrow-down-focus-icon.svg\",\"skins/Vector/images/arrow-down-icon.png\",\"skins/Vector/images/arrow-down-icon.svg\",\"skins/Vector/images/bullet-icon.png\",\"skins/Vector/images/bullet-icon.svg\",\"skins/Vector/images/external-link-ltr-icon.png\",\"skins/Vector/images/external-link-ltr-icon.svg\",\"skins/Vector/images/page-fade.png\",\"skins/Vector/images/portal-break.png\",\"skins/Vector/images/search-fade.png\",\"skins/Vector/images/search-ltr.png\",\"skins/Vector/images/search-ltr.svg\",\"skins/Vector/images/tab-break.png\",\"skins/Vector/images/tab-current-fade.png\",\"skins/Vector/images/tab-normal-fade.png\",\"skins/Vector/images/unwatch-icon-hl.png\",\"skins/Vector/images/unwatch-icon-hl.svg\",\"skins/Vector/images/unwatch-icon.png\",\"skins/Vector/images/unwatch-icon.svg\",\"skins/Vector/images/user-icon.png\",\"skins/Vector/images/user-icon.svg\",\"skins/Vector/images/watch-icon-hl.png\",\"skins/Vector/images/watch-icon-hl.svg\",\"skins/Vector/images/watch-icon-loading.png\",\"skins/Vector/images/watch-icon-loading.svg\",\"skins/Vector/images/watch-icon.png\",\"skins/Vector/images/watch-icon.svg\",\"skins/Vector/screen-hd.less\",\"skins/Vector/screen.less\",\"skins/Vector/variables.less\"]');
/*!40000 ALTER TABLE `module_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` VALUES ('my_wiki:pcache:idhash:1-0!*!*!*!*!*!*','\ÕW\În\€6\Óo=´a\ÿµu±\„&≤c†H\”&C\“xM\“˛h\È\ÿ\Ê\"ëI\≈Òä{Ñ=\„ûdáe\ÀN:¥›ÄUπY<~\Á\„9\'I\'˛ÑJÚ¢\“e•˝§&T≤ó¯\≈\‹k®í\Ë`ˇ ÒG\Âx§¥|>>áå\—˜ÏñëUd\n¿	\„J\”<á¨;\núñ7\n–§	Æ™\\Ω\02¢DS9}\Ë\ﬂLs\ o}\"!?Ùπòâ<K¬ÖÑH	?ä8Hü§9U\Í\–G8 9Õâ6¿\»5˝ (@\”\Ó\—VW\»y`ﬁÇ\»\À7\◊¿µÚ\«\◊\„äºÆX£Äé\…LHÑçø™ô\‡ø+\≈¯\‹5à3Ω§∫6o¥à1%\Â\r†b\ŸY\0\Õr\∆¡\',;Ù_É\÷\Ë\·s!5d˛\ÿ-∑ÄπAÛÒ®X&àU+H\Ì\Œ%ù√°N\'¸\Ë\'8Ù£G\\lèG\¬ÚFU>\Âl¸˛\‚\ƒ.óÀÆÕ©I\∆&Øó%§å\Ê\…˘\ÍåÚyÖÄÉs\ +\\¡d\œÿºí6ü7™é©\ﬂZ\'\Õ:…ô\“\Ê$F˜˛wÙØ^¸Í∑®çØü\r\Ók…ª–∫TIòL®î\Â\ÂVfh\Z¨É\ÈP\ŒE\≈Sh\√E$@cf\ËÚ≠$˜L§±ÿ£ˇ\ÓJRÆÚöî®d\n\»ßdéπú+îì\‹9˙bY”ºò\“˙ûó¥@¯@%\'$Ä$µBb$¶¢\ÿåø5˛QÄW\’ÛFO;‚ΩÅ\ÂdÇgU0ç¯K!µwD\”dD#á\— \n\√A\Ôıˆ\¬ZF\‡ædrïê˝A?Ωó+Nñ\‚∆∂\“%dFs\ﬁ\—\‰\⁄˙¿öÜ\–v\√04ÖELyo¡§aGØ\≈\ƒ\"ûç\¬c∏cäa\·¡|fÄªTfè^Ä®Ã≥≠:7˘¶ª\ ˚e°Ù_¸âPûaÒMÛ\n\’˚\› \‚\‡y¥ì\ÈJÉÚÆ†(ë*@ò´#˚Ñ\ﬁ	õ/@ibù*S`2(ısÙC\Ô¯9†\ÿ`ë5]é\Ã\‚\ÿ2\‰¿Öú\◊È¨è\ƒrÅYWß6YıëøV®g\»\Ÿ\\=\”\ÊO˙¡$~O©ìmüàtHGlé≠M.\Èò¯P©=\◊%\”r+R¨neí“Æ\',\√6ªH¢N¯Ù\Á\Õ1)4®∞1\ÂS¨PÇ9:\ƒ\Œ2y\ƒlo\€y{{\√\È3\∆oï?§	v˝è(ãPvÑ\·ÃÖd∞+8\ÂK©≤-Õ§¿tÕ∏Ä≥¬¶ï\·˚¿l∑≥ç5rôkØ«≠ı”¨%yn∂/\–c[{_±.Ò¶ãã“úk[n=vó~ç``∆õÇ¸\‹\…a»í\√x\ﬁK˛√û\Ëú\Óıø ©iU\Œ\√\0a˝\€6\“D∏ˇe`>£¥7 ˜æ2w[Ö\÷:3\Á∫gπà\Áj\Ïc0ñ\’\Àz<Úá\”$:õ˝2æØ\Õ¯*W[´\'8›ù\‚\ro˘7ú;Yï\√.\”\Í\’\ÀT≤R∑eΩçLØ∂Õå\ËUS\‰ïª7°\…OÑhà\Ã-\ﬁc√©i\‘^uq\Ÿ\’(˘¿0äx?X\–Z§9\‹Aæf^\‚ªw\‹,ÒcÛ£∞≥¨\À\◊\Œ\‰\È\Ó2Øä)6\’\⁄,ÚkWågp\ﬂ^C<3)\nm\nC´(\‹4E¡§\◊\‘o1õ·ù∞†aΩ\Â\ÈB\»\Îëz¯±π˘\«8ªêØ\ƒ-ò∏ß64KÅâ\ƒ\Ó/ıV3VWG\'W\Ág\∆=Bh†`sÖ¥©ê\€ı\‘o‹¢˘1ß\”\‹ i\ÌVØ]\\\\ü6¸â1í\'\Ìˇ¨ûòÚ	˜ë≥t\’⁄æ>P|ëö~\nŸÉä\Ô?\–5ı\Õv®óT”ç\Ê#^\œÃîÒ\÷v∞F◊í#:0«é≤∫ªuR\‘\∆l∏ìµ≠\Ã|é\√mµ%ﬁó=K\"x[Ø,\›\0aFK\\sì%=\ÀE¸©«É°ãp\€z=S<¥\ﬂh\ﬂ\Î\Ì\ÿ\„\ƒQèn\⁄0Cƒñì\–9qSÖuo;iz|3â|éè\›4¨\'	;ùlY\«Œ∫_G\–`XO0\Õ\‰bóG∑èLúãù\√\«1\Ìë!˘n£\È-^©5SR\ÂUN\Áª\≈\Ë∫M\»7\√˙6Ω©l)µà∫Én}•\Ï∞z\ÂÚâ+7z\«v¶≠GÉfı≠õ`N3W¸ˇ','2016-10-07 22:53:50'),('my_wiki:pcache:idoptions:1','Eç¡\n\¬0Dˇe?†\Ï\∆$\‘\…Q<x*ı^l¿™•+b)˝w°x\ﬁf\Z\ÏAá\Óvè\Á4DÇ√¢\Z.\Z˚f|•\ÁC)t`,´¢\Œ\‚\Z\'ÕîÇ\Ê6I\Â+[≤pvˇ•B,»∞xaˆ∆∏ù\„5[\Ô¯\”4SH®Ωe.\ŒoÆç\ÔT^N}Ò\÷/','2016-10-07 22:53:50'),('wiki:page-recent-delete:62a004b95946bb97541afa471dcca73a','À¥2¥\0','2016-10-08 01:27:50');
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` varbinary(767) NOT NULL,
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varbinary(255) NOT NULL,
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,0,'Main_Page','',0,0,0.552357424576,'20161007013405','20161007013420',24,873,'wikitext',NULL),(2,2,'Karel','',0,1,0.084954006995,'20161007000352','20161006233748',4,16,'wikitext',NULL),(3,4,'About','',0,1,0.58466632551,'20161006233930','20161006234011',5,18,'wikitext',NULL),(4,0,'MediaWiki','',0,1,0.235897026898,'20161006235226','20161006235226',6,26,'wikitext',NULL),(5,1,'Main_Page','',0,0,0.192199735532,'20161007000538','20161007000559',11,38,'wikitext',NULL),(6,14,'Linux','',0,0,0.311914858164,'20161010214705','20161007001900',13,4,'wikitext',NULL),(7,0,'Linux','',1,1,0.557204205334,'20161007001900','20161007001904',14,29,'wikitext',NULL),(8,14,'MySQL','',0,0,0.405451108547,'20161007013009','20161007013026',23,30,'wikitext',NULL),(10,0,'Allowing_remote_access_to_MySQL_server','',0,0,0.507857700666,'20161007012613','20161007012613',22,1371,'wikitext',NULL),(11,0,'Restart_MySQL_server_on_linux','',0,0,0.864637037035,'20161007012259','20161007012259',20,171,'wikitext',NULL),(12,0,'Remove_access_permissions_from_MySQL_user','',0,1,0.240915323532,'20161007012443','20161007012443',21,565,'wikitext',NULL),(13,0,'Set_up_FTP_on_linux','',0,1,0.505765558469,'20161010212705','20161010212705',25,2307,'wikitext',NULL),(14,0,'Basic_Linux_Commands','',0,0,0.946349746445,'20161010215008','20161010214911',30,524,'wikitext',NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
INSERT INTO `pagelinks` VALUES (10,0,0,'Remove_access_permissions_from_MySQL_user'),(10,0,0,'Restart_MySQL_server_on_linux'),(7,0,14,'Linux');
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` varbinary(767) DEFAULT NULL,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
INSERT INTO `querycache_info` VALUES ('activeusers','20161117164440');
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varbinary(255) NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment` varbinary(767) NOT NULL DEFAULT '',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` VALUES (1,'20161006230010',1,'Karel',0,'Main_Page','',0,0,0,1,2,1,0,'mw.edit',1,'192.168.0.20',687,701,0,0,NULL,'',''),(2,'20161006230554',1,'Karel',0,'Main_Page','',0,0,0,1,3,2,0,'mw.edit',1,'192.168.0.20',701,707,0,0,NULL,'',''),(3,'20161006233748',1,'Karel',2,'Karel','Created page with \"User \'\'\'Karel\'\'\'\"',0,0,1,2,4,0,1,'mw.new',1,'192.168.0.20',0,16,0,0,NULL,'',''),(4,'20161006233930',1,'Karel',4,'About','Created page with \"about karel\'s wiki\"',0,0,1,3,5,0,1,'mw.new',1,'192.168.0.20',0,18,0,0,NULL,'',''),(5,'20161006234413',1,'Karel',0,'MediaWiki','Created page with \" ---- [[File:Example.jpg]]\"',0,0,1,4,6,0,1,'mw.new',1,'192.168.0.20',0,26,0,0,NULL,'',''),(6,'20161006234951',1,'Karel',0,'Main_Page','',0,0,0,1,7,3,0,'mw.edit',1,'192.168.0.20',707,773,0,0,NULL,'',''),(7,'20161006235717',1,'Karel',0,'Main_Page','',0,0,0,1,8,7,0,'mw.edit',1,'192.168.0.20',773,868,0,0,NULL,'',''),(8,'20161007000440',1,'Karel',0,'Main_Page','',0,0,0,1,9,8,0,'mw.edit',1,'192.168.0.20',868,914,0,0,NULL,'',''),(9,'20161007000522',1,'Karel',1,'Main_Page','Created page with \"talk?\"',0,0,1,5,10,0,1,'mw.new',1,'192.168.0.20',0,5,0,0,NULL,'',''),(10,'20161007000538',1,'Karel',1,'Main_Page','/* toppic */ new section',0,0,0,5,11,10,0,'mw.edit',1,'192.168.0.20',5,38,0,0,NULL,'',''),(11,'20161007001849',1,'Karel',0,'Linux','Created page with \"helo\"',0,0,1,6,12,0,1,'mw.new',1,'192.168.0.20',0,4,0,0,NULL,'',''),(12,'20161007001900',1,'Karel',0,'Linux','',0,0,0,6,0,0,3,'mw.log',1,'192.168.0.20',NULL,NULL,0,12,'move','move','a:2:{s:9:\"4::target\";s:14:\"Category:Linux\";s:10:\"5::noredir\";s:1:\"0\";}'),(14,'20161007001946',1,'Karel',0,'MySQL','',0,0,0,8,0,0,3,'mw.log',1,'192.168.0.20',NULL,NULL,0,14,'move','move','a:2:{s:9:\"4::target\";s:14:\"Category:MySQL\";s:10:\"5::noredir\";s:1:\"0\";}'),(15,'20161007003827',1,'Karel',0,'Allowing_remote_access_to_MySQL_server','Created page with \"Change mysql config Start with editing mysql config file vim /etc/mysql/my.cnf Comment out following lines. #bind-address           = 127.0.0.1 #skip-networking If you do not...\"',0,0,1,10,18,0,1,'mw.new',1,'192.168.0.20',0,2107,0,0,NULL,'',''),(16,'20161007012230',1,'Karel',0,'Restart_MySQL_server_on_linux','Created page with \"run this from command line:  <pre>/etc/init.d/mysql restart</pre>  or  <pre>service mysql restart</pre>  don\'t forget you might need to use \'\'\'sudo\'\'\';  [[Category:MySQL]]\"',0,0,1,11,19,0,1,'mw.new',1,'192.168.0.20',0,171,0,0,NULL,'',''),(17,'20161007012259',1,'Karel',0,'Restart_MySQL_server_on_linux','',0,0,0,11,20,19,0,'mw.edit',1,'192.168.0.20',171,171,0,0,NULL,'',''),(18,'20161007012443',1,'Karel',0,'Remove_access_permissions_from_MySQL_user','Created page with \"Following will revoke all options for USERNAME from all machines:  <source lang=\"sql\">REVOKE ALL PRIVILEGES, GRANT OPTION FROM \'USERNAME\'@\'%\';</source>  Following will revoke...\"',0,0,1,12,21,0,1,'mw.new',1,'192.168.0.20',0,565,0,0,NULL,'',''),(19,'20161007012613',1,'Karel',0,'Allowing_remote_access_to_MySQL_server','',0,0,0,10,22,18,0,'mw.edit',1,'192.168.0.20',2107,1371,0,0,NULL,'',''),(20,'20161007012750',1,'Karel',0,'MySQL','content was: \"#REDIRECT [[:Category:MySQL]]\", and the only contributor was \"[[Special:Contributions/Karel|Karel]]\" ([[User talk:Karel|talk]])',0,0,0,9,0,0,3,'mw.log',1,'192.168.0.20',NULL,NULL,0,20,'delete','delete','a:0:{}'),(21,'20161007013009',1,'Karel',14,'MySQL','',0,0,0,8,23,16,0,'mw.edit',1,'192.168.0.20',5,30,0,0,NULL,'',''),(22,'20161007013405',1,'Karel',0,'Main_Page','',0,0,0,1,24,9,0,'mw.edit',1,'192.168.0.20',914,873,0,0,NULL,'',''),(23,'20161010212705',1,'Karel',0,'Set_up_FTP_on_linux','Created page with \"== vsftpd - FTP Server Installation ==  vsftpd is an FTP daemon available in Ubuntu. It is easy to install, set up, and maintain. To install vsftpd you can run the following c...\"',0,0,1,13,25,0,1,'mw.new',1,'192.168.0.20',0,2307,0,0,NULL,'',''),(24,'20161010213743',1,'Karel',0,'Linux_basics','Created page with \"\'\'\'clear\'\'\' clear the screen  \'\'\'uname -a\'\'\' show basic information about OS and processor architecture \'\'\' pwd\'\'\' print working directory  \'\'\'cd\'\'\'  change (working) director...\"',0,0,1,14,26,0,1,'mw.new',1,'192.168.0.20',0,504,0,0,NULL,'',''),(25,'20161010213837',1,'Karel',0,'Linux_basics','',0,0,0,14,0,0,3,'mw.log',1,'192.168.0.20',NULL,NULL,0,25,'move','move','a:2:{s:9:\"4::target\";s:22:\"Linux - basic commands\";s:10:\"5::noredir\";s:1:\"1\";}'),(26,'20161010214702',1,'Karel',0,'Linux_-_basic_commands','',0,0,0,14,28,27,0,'mw.edit',1,'192.168.0.20',504,524,0,0,NULL,'',''),(27,'20161010214904',1,'Karel',0,'Linux_-_basic_commands','',0,0,0,14,0,0,3,'mw.log',1,'192.168.0.20',NULL,NULL,0,27,'move','move','a:2:{s:9:\"4::target\";s:14:\"Basic commands\";s:10:\"5::noredir\";s:1:\"1\";}'),(28,'20161010215008',1,'Karel',0,'Basic_commands','',0,0,0,14,0,0,3,'mw.log',1,'192.168.0.20',NULL,NULL,0,28,'move','move','a:2:{s:9:\"4::target\";s:20:\"Basic Linux Commands\";s:10:\"5::noredir\";s:1:\"1\";}');
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
INSERT INTO `redirect` VALUES (7,14,'Linux','','');
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` varbinary(767) NOT NULL,
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,'MediaWiki default','20161006225350',0,0,687,0,'d8wxfy88z1e4to5a0a0iwrfhw943fet',NULL,NULL),(2,1,2,'',1,'Karel','20161006230010',0,0,701,1,'bj7sv1hw3e4z1fiay4d6jau914pjycg',NULL,NULL),(3,1,3,'',1,'Karel','20161006230554',0,0,707,2,'j4spqun6j8dkcdoj66c2ou1tmn1gl5r',NULL,NULL),(4,2,4,'Created page with \"User \'\'\'Karel\'\'\'\"',1,'Karel','20161006233748',0,0,16,0,'hv2psg868nat5masox10xau0vbf6j4x',NULL,NULL),(5,3,5,'Created page with \"about karel\'s wiki\"',1,'Karel','20161006233930',0,0,18,0,'sdrmr1ysn3ozqsqddao15se2ytoihmb',NULL,NULL),(6,4,6,'Created page with \" ---- [[File:Example.jpg]]\"',1,'Karel','20161006234413',0,0,26,0,'fcovrrpsxkt4yrta558ccxtt64d9i1o',NULL,NULL),(7,1,7,'',1,'Karel','20161006234951',0,0,773,3,'3w0z2orcnnlj8aiit12zcwko8a8gzou',NULL,NULL),(8,1,8,'',1,'Karel','20161006235717',0,0,868,7,'fiqnb8xty7jvigz8kgms7kxz4fb2zoy',NULL,NULL),(9,1,9,'',1,'Karel','20161007000440',0,0,914,8,'kjlnl5rgj1n4wkz93l3qv0blftcfool',NULL,NULL),(10,5,10,'Created page with \"talk?\"',1,'Karel','20161007000522',0,0,5,0,'kg67qyqpqajpdebkkdq9hh23tnb4oxs',NULL,NULL),(11,5,11,'/* toppic */ new section',1,'Karel','20161007000538',0,0,38,10,'hzjms9vseqxrarb9g1ue34dr2hbu6mc',NULL,NULL),(12,6,12,'Created page with \"helo\"',1,'Karel','20161007001849',0,0,4,0,'n8keyoclfm7xl8kgl6elgei2aldz6b1',NULL,NULL),(13,6,12,'Karel moved page [[Linux]] to [[Category:Linux]]',1,'Karel','20161007001900',1,0,4,12,'n8keyoclfm7xl8kgl6elgei2aldz6b1',NULL,NULL),(14,7,13,'Karel moved page [[Linux]] to [[Category:Linux]]',1,'Karel','20161007001900',0,0,29,0,'3odii6fptpoz1q853z8bxorlhfuf6zm',NULL,NULL),(15,8,14,'Created page with \"mysql\"',1,'Karel','20161007001934',0,0,5,0,'sjnq2div8jppqkvevg1ncl54q056mu3',NULL,NULL),(16,8,14,'Karel moved page [[MySQL]] to [[Category:MySQL]]',1,'Karel','20161007001946',1,0,5,15,'sjnq2div8jppqkvevg1ncl54q056mu3',NULL,NULL),(18,10,16,'Created page with \"Change mysql config Start with editing mysql config file vim /etc/mysql/my.cnf Comment out following lines. #bind-address           = 127.0.0.1 #skip-networking If you do not...\"',1,'Karel','20161007003827',0,0,2107,0,'78a01r37jbk3qqh1ez2n6x8qf9bpnhv',NULL,NULL),(19,11,17,'Created page with \"run this from command line:  <pre>/etc/init.d/mysql restart</pre>  or  <pre>service mysql restart</pre>  don\'t forget you might need to use \'\'\'sudo\'\'\';  [[Category:MySQL]]\"',1,'Karel','20161007012230',0,0,171,0,'lbjb66n0jkhg4uqltbs667pba6pnkt2',NULL,NULL),(20,11,18,'',1,'Karel','20161007012259',0,0,171,19,'6p20z5cmgfoldcb0atvphdluospwksc',NULL,NULL),(21,12,19,'Created page with \"Following will revoke all options for USERNAME from all machines:  <source lang=\"sql\">REVOKE ALL PRIVILEGES, GRANT OPTION FROM \'USERNAME\'@\'%\';</source>  Following will revoke...\"',1,'Karel','20161007012443',0,0,565,0,'o1iwjkarkqsmkg8qoq3vqpd4ywpfubj',NULL,NULL),(22,10,20,'',1,'Karel','20161007012613',0,0,1371,18,'e55vk0adj0mrsysreu9zem58b30re1o',NULL,NULL),(23,8,21,'',1,'Karel','20161007013009',0,0,30,16,'p7ixyircbz6bnigruk7yqlibtvc0z65',NULL,NULL),(24,1,22,'',1,'Karel','20161007013405',0,0,873,9,'7kgprbfj0h2lchfohul319pvar0mkou',NULL,NULL),(25,13,23,'Created page with \"== vsftpd - FTP Server Installation ==  vsftpd is an FTP daemon available in Ubuntu. It is easy to install, set up, and maintain. To install vsftpd you can run the following c...\"',1,'Karel','20161010212705',0,0,2307,0,'kfdgrgs34x3e5a5ptack8s4pe45c7sv',NULL,NULL),(26,14,24,'Created page with \"\'\'\'clear\'\'\' clear the screen  \'\'\'uname -a\'\'\' show basic information about OS and processor architecture \'\'\' pwd\'\'\' print working directory  \'\'\'cd\'\'\'  change (working) director...\"',1,'Karel','20161010213743',0,0,504,0,'246sn7l9z8iavm0s2bru7mby5i9qg6b',NULL,NULL),(27,14,24,'Karel moved page [[Linux basics]] to [[Linux - basic commands]] without leaving a redirect',1,'Karel','20161010213837',1,0,504,26,'246sn7l9z8iavm0s2bru7mby5i9qg6b',NULL,NULL),(28,14,25,'',1,'Karel','20161010214702',0,0,524,27,'nx7hjbbgzvbxmolq7w3m429eum7ab11',NULL,NULL),(29,14,25,'Karel moved page [[Linux - basic commands]] to [[Basic commands]] without leaving a redirect',1,'Karel','20161010214904',1,0,524,28,'nx7hjbbgzvbxmolq7w3m429eum7ab11',NULL,NULL),(30,14,25,'Karel moved page [[Basic commands]] to [[Basic Linux Commands]] without leaving a redirect',1,'Karel','20161010215008',1,0,524,29,'nx7hjbbgzvbxmolq7w3m429eum7ab11',NULL,NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'main page',' karel karel\'su800 first mediawiki. seeu800 special categories list ofu800 categories . addu800 newu800 page addu800 newu800 page addu800 newu800 page type create break nou800 check outu800 wiki editing examples here - consult theu800 metau82ewikimediau82eorgu800 wiki help contents user user\'su800 guide foru800 information onu800 using theu800 wiki software. getting started getting started getting started * wwwu800u82emediawikiu82eorgu800 wiki special mylanguage manual configuration_settings configuration settings list * wwwu800u82emediawikiu82eorgu800 wiki special mylanguage manual faqu800 mediawiki faqu800 * mediawiki release mailing list * wwwu800u82emediawikiu82eorgu800 wiki special mylanguage localisation#translation_resources localise mediawiki foru800 your language * wwwu800u82emediawikiu82eorgu800 wiki special mylanguage manual combating_spam learn howu800 tou800 combat spam onu800 your wiki '),(2,'karel',' user  karel  '),(3,'about',' about karel karel\'su800 wiki '),(4,'mediawiki',' ---- file exampleu82ejpgu800 '),(5,'main page',' talk toppic toppic toppic what tou800 beu800 here '),(6,'linux',' helo '),(7,'linux',' #redirect category linux '),(8,'mysql',' everything about mysql server. '),(10,'allowing remote access tou800 mysql server',' allow remote connections edit mysql config file vimu800 etcu800 mysql myu800u82ecnfu800 comment outu800 following lines #bind-address 127u800u82e0u800u82e0u800u82e1u800 #skip-networking nowu800 restart mysql server onu800 linux restart mysql server. grant access privileges tou800 user su800 grant access privileges tou800 user su800 grant access privileges tou800 user su800 start mysql terminal command-line mysql -hu800 host -uu800 username -ppassword foru800 example mysql -hu800 127u800u82e0u800u82e0u800u82e1u800 -uu800 root -pmypass3000 runu800 sqlu800 query like below tou800 access from allu800 machines grant allu800 privileges onu800 *.* tou800 \'username\' \' \' identified byu800 \'password\' with grant option; runu800 au800 command like below tou800 give access from specific ipu800 grant allu800 privileges onu800 *.* tou800 \'username\' \'1u800u82e2u800u82e3u800u82e4u800\' identified byu800 \'password\' with grant option; youu800 canu800 replace 1u800u82e2u800u82e3u800u82e4u800 with your ipu800. youu800 canu800 runu800 above command many times tou800 grant access from multiple ipsu800. youu800 canu800 also specify au800 separate username & password foru800 remote access. youu800 canu800 check final outcome byu800 select * from information_schemau82euser_privileges where grantee like \"\'username\' \"; finally youu800 mayu800 also need tou800 runu800 flush privileges; revoke access revoke access revoke access ifu800 youu800 accidentally grant access tou800 au800 user then better have remove access permissions from mysql user revoking option handy. category mysql '),(13,'setu800 upu800 ftpu800 onu800 linux',' vsftpd - ftpu800 server installation vsftpd isu800 anu800 ftpu800 daemon available inu800 ubuntu. itu800 isu800 easy tou800 install setu800 upu800 andu800 maintain. tou800 install vsftpd youu800 canu800 runu800 theu800 following command sudo aptu800 install vsftpd anonymous ftpu800 configuration anonymous ftpu800 configuration anonymous ftpu800 configuration byu800 default vsftpd isu800 notu800 configured tou800 allow anonymous download. ifu800 youu800 wish tou800 enable anonymous download edit   etcu800 vsftpdu82econf  byu800 changing anonymous_enable yesu800 during installation au800 ftpu800 user isu800 created with au800 home directory ofu800   srvu800 ftpu800 . this isu800 theu800 default ftpu800 directory. ifu800 youu800 wish tou800 change this location tou800 srvu800 files ftpu800 foru800 example simply create au800 directory inu800 another location andu800 change theu800 ftpu800 user user\'su800 home directory sudo mkdir srvu800 files ftpu800 sudo usermod -du800 srvu800 files ftpu800 ftpu800 after making theu800 change restart vsftpd sudo restart vsftpd finally copy anyu800 files andu800 directories youu800 would like tou800 make available through anonymous ftpu800 tou800 srvu800 files ftpu800 oru800 srvu800 ftpu800 ifu800 youu800 wish tou800 useu800 theu800 default. user authenticated ftpu800 configuration byu800 default vsftpd isu800 configured tou800 authenticate system users andu800 allow them tou800 download files. ifu800 youu800 want users tou800 beu800 able tou800 upload files edit   etcu800 vsftpdu82econf  write_enable yesu800 nowu800 restart vsftpd sudo restart vsftpd nowu800 when system users login tou800 ftpu800 they will start inu800 their home directories where they canu800 download upload create directories etcu800. similarly byu800 default anonymous users areu800 notu800 allowed tou800 upload files tou800 ftpu800 server. tou800 change this setting youu800 should uncomment theu800 following line andu800 restart vsftpd anon_upload_enable yesu800 enabling anonymous ftpu800 upload canu800 beu800 anu800 extreme security risk. itu800 isu800 best tou800 notu800 enable anonymous upload onu800 servers accessed directly from theu800 internet. theu800 configuration file consists ofu800 many configuration parameters. theu800 information about each parameter isu800 available inu800 theu800 configuration file. alternatively youu800 canu800 refer tou800 theu800 manu800 page manu800 5u800 vsftpdu82econf foru800 details ofu800 each parameter. securing ftpu800 there areu800 options inu800 etcu800 vsftpdu82econf tou800 help make vsftpd more secure. foru800 example users canu800 beu800 limited tou800 their home directories byu800 uncommenting chroot_local_user yesu800 youu800 canu800 also limit au800 specific list ofu800 users tou800 just their home directories chroot_list_enable yesu800 '),(11,'restart mysql server onu800 linux',' runu800 this from command line etcu800 initu82edu800 mysql restart oru800 service mysql restart donu800\'tu800 forget youu800 might need tou800 useu800  sudo . category mysql '),(12,'remove access permissions from mysql user',' following will revoke allu800 options foru800 username from allu800 machines revoke allu800 privileges grant option from \'username\' \' \'; following will revoke allu800 options foru800 username from particular ipu800 revoke allu800 privileges grant option from \'username\' \'1u800u82e2u800u82e3u800u82e4u800\'; itsu800 better tou800 check information_schemau82euser_privileges table after running revoke command. ifu800 youu800 seeu800 usage privilege after running revoke command itsu800 fine. itu800 isu800 asu800 good asu800 nou800 privilege atu800 allu800. iu800 amu800 notu800 sure ifu800 itu800 canu800 beu800 revoked. category mysql '),(14,'basic linux commands','  clear  clear theu800 screen  uname -au800  show basic information about osu800 andu800 processor architecture   pwdu800  print working directory  cdu800  change working directory  lsu800 -lu800 -hu800  show list ofu800 folder contents inu800 long listing human readable format  cpu800 -vu800  copy with verbose information   rmu800 andu800 rmdir  delete file andu800 directory  mvu800  rename oru800 move  init 3u800  exit xu800 server  . fileu82ename  runu800 executable file from current diru800  grep  perform regular expression search category linux ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_identifiers`
--

DROP TABLE IF EXISTS `site_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_identifiers` (
  `si_site` int(10) unsigned NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  UNIQUE KEY `site_ids_type` (`si_type`,`si_key`),
  KEY `site_ids_site` (`si_site`),
  KEY `site_ids_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_identifiers`
--

LOCK TABLES `site_identifiers` WRITE;
/*!40000 ALTER TABLE `site_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_edits` bigint(20) unsigned DEFAULT '0',
  `ss_good_articles` bigint(20) unsigned DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_active_users` bigint(20) DEFAULT '-1',
  `ss_images` int(11) DEFAULT '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,25,1,12,1,-1,0);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `sites_global_key` (`site_global_key`),
  KEY `sites_type` (`site_type`),
  KEY `sites_group` (`site_group`),
  KEY `sites_source` (`site_source`),
  KEY `sites_language` (`site_language`),
  KEY `sites_protocol` (`site_protocol`),
  KEY `sites_domain` (`site_domain`),
  KEY `sites_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(11) DEFAULT NULL,
  `ts_rev_id` int(11) DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  KEY `tl_backlinks_namespace` (`tl_from_namespace`,`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<strong>MediaWiki has been installed.</strong>\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(2,'<strong>Karel\'s first MediaWiki has been installed.</strong>\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(3,'<strong>\'\'\'Karel\'s\'\'\' first MediaWiki has been installed.</strong>\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(4,'User \'\'\'Karel\'\'\'','utf-8'),(5,'about karel\'s wiki','utf-8'),(6,'\n----\n[[File:Example.jpg]]','utf-8'),(7,'<strong>\'\'\'Karel\'s\'\'\' first MediaWiki has been installed.</strong>\n\n== Add new page ==\n\n\n<inputbox>\ntype=create\nbreak=no\n</inputbox>\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(8,'<strong>\'\'\'Karel\'s\'\'\' first MediaWiki has been installed.</strong>\n\n== Add new page ==\n\n\n<inputbox>\ntype=create\nbreak=no\n</inputbox>\n\nCheck out Wiki editing examples here - https://meta.wikimedia.org/wiki/Help:Wikitext_examples\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(9,'<strong>\'\'\'Karel\'s\'\'\' first MediaWiki has been installed.</strong>\n\n== Add new page ==\n\n\n<inputbox>\ntype=create\nbreak=no\n</inputbox>\n\n* Bulleted list item\n* Bulleted list item 3\n\n\nCheck out Wiki editing examples here - https://meta.wikimedia.org/wiki/Help:Wikitext_examples\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(10,'talk?','utf-8'),(11,'talk?\n\n== toppic ==\n\nwhat to be here>?','utf-8'),(12,'helo','utf-8'),(13,'#REDIRECT [[:Category:Linux]]','utf-8'),(14,'mysql','utf-8'),(15,'#REDIRECT [[:Category:MySQL]]','utf-8'),(16,'Change mysql config\nStart with editing mysql config file\nvim /etc/mysql/my.cnf\nComment out following lines.\n#bind-address           = 127.0.0.1\n#skip-networking\nIf you do not find skip-networking line, add it and comment out it.\nRestart mysql server.\n~ /etc/init.d/mysql restart\n\nFrom terminal/command-line:\nmysql -h HOST -u USERNAME -pPASSWORD\n\n.mysql -h 127.0.0.1 -u root -p\n\nChange GRANT privilege\nYou may be surprise*.* 300d to see even after above change you are not getting remote access or getting access but not able to all databases.\nBy default, mysql username and password you are using is allowed to access mysql-server locally. So need to update privilege.\nRun a command like below to access from all machines.\nmysql> GRANT ALL PRIVILEGES ON *.* TO \'USERNAME\'@\'%\' IDENTIFIED BY \'PASSWORD\' WITH GRANT OPTION;\nRun a command like below to give access from specific IP.\nmysql> GRANT ALL PRIVILEGES ON *.* TO \'USERNAME\'@\'1.2.3.4\' IDENTIFIED BY \'PASSWORD\' WITH GRANT OPTION;\nYou can replace 1.2.3.4 with your IP. You can run above command many times to GRANT access from multiple IPs.\nYou can also specify a separate USERNAME & PASSWORD for remote access.\nYou can check final outcome by:\nSELECT * from information_schema.user_privileges where grantee like \"\'USERNAME\'%\";\nFinally, you may also need to run:\nmysql> FLUSH PRIVILEGES;\n\nTest Connection\n\nIf you get a mysql shell, don‚Äôt forget to run show databases; to check if you have right privileges from remote machines.\nBonus-Tip: Revoke Access\nIf you accidentally grant access to a user, then better have revoking option handy.\nFollowing will revoke all options for USERNAME from all machines:\nmysql> REVOKE ALL PRIVILEGES, GRANT OPTION FROM \'USERNAME\'@\'%\';Following will revoke all options for USERNAME from particular IP:\n\nmysql> REVOKE ALL PRIVILEGES, GRANT OPTION FROM \'USERNAME\'@\'1.2.3.4\';\nIts better to check information_schema.user_privileges table after running REVOKE command.\n\nIf you see USAGE privilege after running REVOKE command, its fine. It is as good as no privilege at all. I am not sure if it can be revoked.\n\n[[Category:MySQL]]','utf-8'),(17,'run this from command line:\n\n<pre>/etc/init.d/mysql restart</pre>\n\nor\n\n<pre>service mysql restart</pre>\n\ndon\'t forget you might need to use \'\'\'sudo\'\'\';\n\n[[Category:MySQL]]','utf-8'),(18,'run this from command line:\n\n<pre>/etc/init.d/mysql restart</pre>\n\nor\n\n<pre>service mysql restart</pre>\n\ndon\'t forget you might need to use \'\'\'sudo\'\'\'.\n\n[[Category:MySQL]]','utf-8'),(19,'Following will revoke all options for USERNAME from all machines:\n\n<source lang=\"sql\">REVOKE ALL PRIVILEGES, GRANT OPTION FROM \'USERNAME\'@\'%\';</source>\n\nFollowing will revoke all options for USERNAME from particular IP:\n\n<source lang=\"sql\">REVOKE ALL PRIVILEGES, GRANT OPTION FROM \'USERNAME\'@\'1.2.3.4\';</source>\n\nIts better to check information_schema.user_privileges table after running REVOKE command.\n\nIf you see USAGE privilege after running REVOKE command, its fine. It is as good as no privilege at all. I am not sure if it can be revoked.\n\n[[Category:MySQL]]','utf-8'),(20,'== Allow remote connections ==\n\nEdit mysql config file:\n\n<pre>vim /etc/mysql/my.cnf</pre>\n\nComment out following lines:\n\n<pre>\n#bind-address = 127.0.0.1\n#skip-networking\n</pre>\n\nnow [[Restart MySQL server on linux|restart]] mySQL server.\n\n== Grant access privileges to user(s) ==\n\nStart mysql terminal/command-line:\n\n<pre>mysql -h HOST -u USERNAME -pPASSWORD</pre>\n\nfor example:\n\n<pre>mysql -h 127.0.0.1 -u root -pMyPass3000</pre>\n\nRun SQL query like below to access from all machines:\n\n<source lang=\"sql\">GRANT ALL PRIVILEGES ON *.* TO \'USERNAME\'@\'%\' IDENTIFIED BY \'PASSWORD\' WITH GRANT OPTION;</source>\n\nRun a command like below to give access from specific IP:\n\n<source lang=\"sql\">GRANT ALL PRIVILEGES ON *.* TO \'USERNAME\'@\'1.2.3.4\' IDENTIFIED BY \'PASSWORD\' WITH GRANT OPTION;</source>\n\nYou can replace 1.2.3.4 with your IP. You can run above command many times to GRANT access from multiple IPs.\n\nYou can also specify a separate USERNAME & PASSWORD for remote access.\n\nYou can check final outcome by:\n\n<source lang=\"sql\">SELECT * from information_schema.user_privileges where grantee like \"\'USERNAME\'%\";</source>\n\nFinally, you may also need to run:\n\n<source lang=\"sql\">FLUSH PRIVILEGES;</source>\n\n== Revoke Access ==\n\nIf you accidentally grant access to a user, then better have [[Remove access permissions from MySQL user|revoking]] option handy.\n\n[[Category:MySQL]]','utf-8'),(21,'Everything about mySQL server.','utf-8'),(22,'Karel\'s first MediaWiki.\n\nSee [[Special:Categories|list of categories]].\n\n== Add new page ==\n\n<inputbox>\ntype=create\nbreak=no\n</inputbox>\n\nCheck out Wiki editing examples here - https://meta.wikimedia.org/wiki/Help:Wikitext_examples\n\nConsult the [//meta.wikimedia.org/wiki/Help:Contents User\'s Guide] for information on using the wiki software.\n\n== Getting started ==\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Configuration settings list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ MediaWiki FAQ]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce MediaWiki release mailing list]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Localise MediaWiki for your language]\n* [//www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Learn how to combat spam on your wiki]','utf-8'),(23,'== vsftpd - FTP Server Installation ==\n\nvsftpd is an FTP daemon available in Ubuntu. It is easy to install, set up, and maintain. To install vsftpd you can run the following command:\n\n<pre>sudo apt install vsftpd</pre>\n\n== Anonymous FTP Configuration ==\n\nBy default vsftpd is not configured to allow anonymous download. If you wish to enable anonymous download edit \'\'\'/etc/vsftpd.conf\'\'\' by changing:\n\n<pre>anonymous_enable=Yes</pre>\n\nDuring installation a ftp user is created with a home directory of \'\'\'/srv/ftp\'\'\'. This is the default FTP directory.\n\nIf you wish to change this location, to /srv/files/ftp for example, simply create a directory in another location and change the ftp user\'s home directory:\n\n<pre>\nsudo mkdir /srv/files/ftp\nsudo usermod -d /srv/files/ftp ftp \n</pre>\n\nAfter making the change restart vsftpd:\n\n<pre>sudo restart vsftpd</pre>\n\nFinally, copy any files and directories you would like to make available through anonymous FTP to /srv/files/ftp, or /srv/ftp if you wish to use the default.\nUser Authenticated FTP Configuration\n\nBy default vsftpd is configured to authenticate system users and allow them to download files. If you want users to be able to upload files, edit \'\'\'/etc/vsftpd.conf\'\'\':\n\n<pre>write_enable=YES</pre>\n\nNow restart vsftpd:\n\nsudo restart vsftpd\n\nNow when system users login to FTP they will start in their home directories where they can download, upload, create directories, etc.\n\nSimilarly, by default, anonymous users are not allowed to upload files to FTP server. To change this setting, you should uncomment the following line, and restart vsftpd:\n\nanon_upload_enable=YES\n\nEnabling anonymous FTP upload can be an extreme security risk. It is best to not enable anonymous upload on servers accessed directly from the Internet.\n\nThe configuration file consists of many configuration parameters. The information about each parameter is available in the configuration file. Alternatively, you can refer to the man page, man 5 vsftpd.conf for details of each parameter.\nSecuring FTP\n\nThere are options in /etc/vsftpd.conf to help make vsftpd more secure. For example users can be limited to their home directories by uncommenting:\n\nchroot_local_user=YES\n\nYou can also limit a specific list of users to just their home directories:\n\nchroot_list_enable=YES','utf-8'),(24,'\'\'\'clear\'\'\'\nclear the screen\n\n\'\'\'uname -a\'\'\'\nshow basic information about OS and processor architecture\n\'\'\'\npwd\'\'\'\nprint working directory\n\n\'\'\'cd\'\'\' \nchange (working) directory\n\n\'\'\'ls -l -h\'\'\'\nshow list of folder contents in long listing, human readable format\n\n\'\'\'cp -v\'\'\'\ncopy with verbose information\n\'\'\'\nrm and rmdir\'\'\'\ndelete file and directory\n\n\'\'\'mv\'\'\'\nrename or move\n\n\'\'\'init 3\'\'\'\nexit X server\n\n\'\'\'./file.name\'\'\'\nrun executable file from current dir\n\n\'\'\'grep\'\'\'\nperform regular expression search','utf-8'),(25,'\'\'\'clear\'\'\'\nclear the screen\n\n\'\'\'uname -a\'\'\'\nshow basic information about OS and processor architecture\n\'\'\'\npwd\'\'\'\nprint working directory\n\n\'\'\'cd\'\'\' \nchange (working) directory\n\n\'\'\'ls -l -h\'\'\'\nshow list of folder contents in long listing, human readable format\n\n\'\'\'cp -v\'\'\'\ncopy with verbose information\n\'\'\'\nrm and rmdir\'\'\'\ndelete file and directory\n\n\'\'\'mv\'\'\'\nrename or move\n\n\'\'\'init 3\'\'\'\nexit X server\n\n\'\'\'./file.name\'\'\'\nrun executable file from current dir\n\n\'\'\'grep\'\'\'\nperform regular expression search\n\n[[Category:Linux]]','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `transcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` blob,
  `tc_time` binary(14) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcache`
--

LOCK TABLES `transcache` WRITE;
/*!40000 ALTER TABLE `transcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
INSERT INTO `updatelog` VALUES ('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),('image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),('updatelist-1.27.1-14757944300','a:0:{}'),('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),('user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),('user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadstash`
--

DROP TABLE IF EXISTS `uploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadstash`
--

LOCK TABLES `uploadstash` WRITE;
/*!40000 ALTER TABLE `uploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Karel','',':pbkdf2:sha256:10000:128:GZbFez/jSU8Uw8EpZe9QUQ==:y7471b6IJZrcBhynrTQRaF++jUqhWTmQqcXTjKnAHfxXhdAQdZmdCOyvRdv0uumJGamYL+aqdM2I8X0J5vKz7sZoziF1df9c9AgwZqUopVHBmsltp5PwPuxa6awcvxD2IcuPcXRyeciZJ0KvT9PVgVa0FNCpkWvGSLFHOHK4lTA=','',NULL,'karelzav@gmail.com','20161007000357','e7031a4c79a2ff288dc275088c619cf3',NULL,NULL,NULL,'20161006225350',22,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_former_groups`
--

DROP TABLE IF EXISTS `user_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ufg_user_group` (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_former_groups`
--

LOCK TABLES `user_former_groups` WRITE;
/*!40000 ALTER TABLE `user_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ug_user_group` (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'bureaucrat'),(1,'sysop');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newtalk` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `up_user` int(11) NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob,
  UNIQUE KEY `user_properties_user_property` (`up_user`,`up_property`),
  KEY `user_properties_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
INSERT INTO `user_properties` VALUES (1,'previewontop',''),(1,'timecorrection','Offset|0'),(1,'usebetatoolbar','1'),(1,'usebetatoolbar-cgd','1'),(1,'uselivepreview','1');
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_tag`
--

DROP TABLE IF EXISTS `valid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid_tag` (
  `vt_tag` varbinary(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_tag`
--

LOCK TABLES `valid_tag` WRITE;
/*!40000 ALTER TABLE `valid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `wl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (1,1,0,'Main_Page',NULL),(2,1,1,'Main_Page',NULL),(3,1,2,'Karel',NULL),(4,1,3,'Karel',NULL),(5,1,4,'About',NULL),(6,1,5,'About',NULL),(7,1,0,'MediaWiki',NULL),(8,1,1,'MediaWiki',NULL),(9,1,0,'Linux',NULL),(10,1,1,'Linux',NULL),(11,1,14,'Linux',NULL),(12,1,15,'Linux',NULL),(15,1,14,'MySQL',NULL),(16,1,15,'MySQL',NULL),(17,1,0,'Allowing_remote_access_to_MySQL_server',NULL),(18,1,1,'Allowing_remote_access_to_MySQL_server',NULL),(19,1,0,'Restart_MySQL_server_on_linux',NULL),(20,1,1,'Restart_MySQL_server_on_linux',NULL),(21,1,0,'Remove_access_permissions_from_MySQL_user',NULL),(22,1,1,'Remove_access_permissions_from_MySQL_user',NULL),(23,1,0,'Set_up_FTP_on_linux',NULL),(24,1,1,'Set_up_FTP_on_linux',NULL);
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wiki'
--

--
-- Dumping routines for database 'wiki'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-09  0:32:40
