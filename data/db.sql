-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `interventi`;
CREATE TABLE `interventi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pc_id` int(11) NOT NULL,
  `dataintervento` date NOT NULL,
  `descrizione` varchar(200) NOT NULL,
  `spesa` float NOT NULL,
  `ore` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pc_id` (`pc_id`),
  CONSTRAINT `interventi_ibfk_1` FOREIGN KEY (`pc_id`) REFERENCES `pc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `interventi` (`id`, `pc_id`, `dataintervento`, `descrizione`, `spesa`, `ore`) VALUES
(1,	1,	'2017-03-09',	'sostituzione mille valvole',	100,	5),
(2,	2,	'2017-03-09',	'pulizia circuiti interni',	80,	3),
(3,	3,	'2017-03-09',	'backup formattazione e nuovo OS',	75,	3),
(4,	5,	'2017-03-09',	'impacchi di pasta termica ',	50,	2),
(5,	4,	'2017-03-09',	'pulizia ventole',	20,	1),
(6,	3,	'1970-01-29',	'intervento antivirus',	22,	1),
(7,	4,	'1970-01-01',	'sostituzione schermo',	250,	3),
(8,	4,	'1970-01-22',	'antivirus potentissimo',	33,	1);

DROP VIEW IF EXISTS `listainterventi`;
CREATE TABLE `listainterventi` (`id` int(11), `pc_id` int(11), `dataintervento` date, `descrizione` varchar(200), `spesa` float, `ore` int(11), `hostname` varchar(40), `marche_id` int(11), `modello` varchar(40), `sn` varchar(20), `marca` varchar(40));


DROP TABLE IF EXISTS `marche`;
CREATE TABLE `marche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `marche` (`id`, `marca`) VALUES
(1,	'hp'),
(2,	'apple'),
(3,	'samsung'),
(4,	'acer'),
(5,	'sony');

DROP TABLE IF EXISTS `pc`;
CREATE TABLE `pc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(40) NOT NULL,
  `marche_id` int(11) NOT NULL,
  `modello` varchar(40) NOT NULL,
  `sn` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marche_id` (`marche_id`),
  CONSTRAINT `pc_ibfk_2` FOREIGN KEY (`marche_id`) REFERENCES `marche` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pc` (`id`, `hostname`, `marche_id`, `modello`, `sn`) VALUES
(1,	'host1',	1,	'666jjj',	'hp0165'),
(2,	'host2',	2,	'777jjj',	'hp90899'),
(3,	'host3',	3,	'uuuu99',	'acer0165'),
(4,	'host4',	4,	'lololo',	'pie12'),
(5,	'host5',	5,	'123123',	'ss0899'),
(6,	'kkk',	1,	'kkk',	'ss0987'),
(7,	'ggg',	1,	'ggg',	'ss3429'),
(8,	'ggg',	1,	'ggg',	'ss3426'),
(9,	'ggg',	1,	'ggg',	'ss3455');

DROP TABLE IF EXISTS `listainterventi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `listainterventi` AS select `i`.`id` AS `id`,`i`.`pc_id` AS `pc_id`,`i`.`dataintervento` AS `dataintervento`,`i`.`descrizione` AS `descrizione`,`i`.`spesa` AS `spesa`,`i`.`ore` AS `ore`,`p`.`hostname` AS `hostname`,`p`.`marche_id` AS `marche_id`,`p`.`modello` AS `modello`,`p`.`sn` AS `sn`,`m`.`marca` AS `marca` from ((`interventi` `i` join `pc` `p` on((`i`.`pc_id` = `p`.`id`))) left join `marche` `m` on((`p`.`marche_id` = `m`.`id`)));

-- 2017-03-14 21:35:04/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Roz
 * Created: 14-mar-2017
 */

