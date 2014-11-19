-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Окт 13 2014 г., 03:28
-- Версия сервера: 5.5.34-0ubuntu0.13.04.1
-- Версия PHP: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `testdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `address`
--
drop table if exists `address`;
CREATE TABLE  `address` (
  `id` int(11) NOT NULL,
  `city` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'название города',
  `street` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'название улицы',
  `region` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'название региона',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последних изменений',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  PRIMARY KEY (`id`),
  UNIQUE KEY `region_city_street` (`region`,`city`,`street`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица адресов';

-- --------------------------------------------------------

--
-- Структура таблицы `mc`
--
drop table if exists `mc`;
CREATE TABLE  `mc` (
  `id` int(11) NOT NULL COMMENT 'id УО',
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'тип УО (ТСЖ)',
  `caption` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'краткое название УО',
  `full_caption` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'полное название',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последнего изменения',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица управляющих организаций (УО)';


--
-- Структура таблицы `building`
--
drop table if exists `building`;
CREATE TABLE  `building` (
  `id` int(11) NOT NULL COMMENT 'id здания',
  `number` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'номер здания',
  `address_id` int(11) NOT NULL COMMENT 'id адреса, по которому находится данное здание',
  `mc_id` int(11) NOT NULL COMMENT 'id УО, к которой оно пренадлежит',
  `reg_date` datetime NOT NULL COMMENT 'дата создания здания',
  `update_date` datetime NOT NULL COMMENT 'дата последнего изменения',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  PRIMARY KEY (`id`),
  FOREIGN KEY (address_id) REFERENCES address(id),
  FOREIGN KEY (mc_id) REFERENCES mc(id),
  UNIQUE KEY `address_number` (`address_id`,`number`),
  UNIQUE KEY `address_number_mc` (`address_id`,`number`,`mc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица зданий';

-- --------------------------------------------------------

--
-- Структура таблицы `physical_person`
--
drop table if exists `physical_person`;
CREATE TABLE  `physical_person` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'имя физ лица',
  `surname` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'фамилия физ лица',
  `patronymic` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'отчество физ лица',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'эл. почта физ лица',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'тел. физ лица',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'пароль физ лица',
  `reg_date` datetime NOT NULL COMMENT 'дата регистрации',
  `update_date` datetime NOT NULL COMMENT 'дата последних изменений',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления профайла',
  `avatar_id` int(11) DEFAULT NULL COMMENT 'id файла с аватаром',
  `submit_date` datetime DEFAULT NULL COMMENT 'дата подтверждения регистрации физ лицом',
  `inform_by_sms` tinyint(1) NOT NULL DEFAULT '1',
  `inform_by_email` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='физические лица';

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--
drop table if exists `employee`;
CREATE TABLE  `employee` (
  `id` int(11) NOT NULL COMMENT 'id сотрудника УО',
  `physic_id` int(11) NOT NULL COMMENT 'id физ лица',
  `mc_id` int(11) NOT NULL COMMENT 'id УО, к которой пренадлежит данный сотрудник',
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'должность сотрудника УО',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последних изменений',
  `approve_date` datetime DEFAULT NULL COMMENT 'дата подтверждения заявки на вступление в сотрудники',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  PRIMARY KEY (`id`),
  FOREIGN KEY (mc_id) REFERENCES mc(id),
  FOREIGN KEY (physic_id) REFERENCES physical_person(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица сотрудников УО';

-- --------------------------------------------------------

--
-- Структура таблицы `legal_person`
--
drop table if exists `legal_person`;
CREATE TABLE  `legal_person` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'название юр. лица',
  `inn` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'инн организации',
  `kpp` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'кпп организации',
  `ogrn` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'огрн организации',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'эл. адрес оганизации',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'телефон организации',
  `mailing_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'почтовый адрес',
  `actual_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'фактический адрес',
  `director` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'директор организаци',
  `bank` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'название банка',
  `bic` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'БИК организации',
  `r_account` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'расчет счет организации',
  `k_account` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'кор. счет организации',
  `ogrn_date` datetime DEFAULT NULL COMMENT 'дата выдачи ОГРН',
  `ogrn_giver` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'кем выдан ОГРН',
  `submit_date` datetime DEFAULT NULL COMMENT 'дата подтверждения эл. почты',
  `approve_date` datetime DEFAULT NULL COMMENT 'дата получения подтвержденного профиля',
  `resolve_date` datetime DEFAULT NULL COMMENT 'дата подтверждения сотрудником УО',
  `reg_date` datetime NOT NULL COMMENT 'дата регистрации',
  `update_date` datetime NOT NULL COMMENT 'дата последних изменений',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  `inform_by_sms` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'информировать ли по sms',
  `inform_by_email` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'информировать по эл. почте',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inn_kpp` (`inn`,`kpp`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица юридических лиц';

-- --------------------------------------------------------

--
-- Структура таблицы `premise`
--
drop table if exists `premise`;
CREATE TABLE  `premise` (
  `id` int(11) NOT NULL COMMENT 'id помещения',
  `number` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'номер помещения',
  `account` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'номер лицевого счета',
  `square` decimal(10,0) NOT NULL COMMENT 'площадь помещения',
  `type` enum('квартира','парковка','гараж','дом','таунхауз','нежилое помещение','офис','комната') COLLATE utf8_unicode_ci NOT NULL COMMENT 'тип помещения',
  `is_residential` tinyint(1) NOT NULL COMMENT 'жилое ли',
  `is_privatized` tinyint(1) NOT NULL COMMENT 'приватизировано ли',
  `building_id` int(11) NOT NULL COMMENT 'id  здания, в котором находится данное помещение',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последнего изменения',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  PRIMARY KEY (`id`),
  UNIQUE KEY `building_type_number` (`building_id`,`type`,`number`),
  UNIQUE KEY `building_account` (`building_id`,`account`),
  UNIQUE KEY `building_type_number_account` (`building_id`,`type`,`number`,`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица помещений';

-- --------------------------------------------------------

--
-- Структура таблицы `legal_person_registration`
--
drop table if exists `legal_person_registration`; 
CREATE TABLE  `legal_person_registration` (
  `legal_id` int(11) NOT NULL COMMENT 'id юр. лица',
  `premise_id` int(11) NOT NULL COMMENT 'id помещения',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последних изменений',
  `approve_date` datetime DEFAULT NULL COMMENT 'дата получения подтвержденного профиля',
  `resolve_date` datetime DEFAULT NULL COMMENT 'дата обработки заявки сотрудником УО',
  `is_owner` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'собственник ли',
  `share` decimal(10,0) DEFAULT NULL COMMENT 'процент собственности',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  PRIMARY KEY (`legal_id`,`premise_id`),
  FOREIGN KEY (premise_id) REFERENCES premise(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица отношений юр. лица и помещения';

-- --------------------------------------------------------



--
-- Структура таблицы `physical_person_registration`
--
drop table if exists `physical_person_registration`; 
CREATE TABLE  `physical_person_registration` (
  `physic_id` int(11) NOT NULL COMMENT 'id физического лица',
  `premise_id` int(11) NOT NULL COMMENT 'id помещения',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последнего изменения',
  `approve_date` datetime DEFAULT NULL COMMENT 'дата получения подтвержденного профиля',
  `resolve_date` datetime DEFAULT NULL COMMENT 'дата обработки заявки сотрудником УО',
  `is_hoa_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'член ли ТСЖ',
  `is_owner` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'собственник ли',
  `share` decimal(10,0) DEFAULT NULL COMMENT 'процент собственности',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  PRIMARY KEY (`physic_id`,`premise_id`),
  FOREIGN KEY (premise_id) REFERENCES premise(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица отношений физ лица и помещения';

-- --------------------------------------------------------



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
