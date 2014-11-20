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
  `inform_by_sms` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `inform_by_email` tinyint(1) unsigned NOT NULL DEFAULT '1',
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
  `inform_by_sms` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'информировать ли по sms',
  `inform_by_email` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'информировать по эл. почте',
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
  `is_residential` tinyint(1) unsigned NOT NULL COMMENT 'жилое ли',
  `is_privatized` tinyint(1) unsigned NOT NULL COMMENT 'приватизировано ли',
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
  `is_owner` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'собственник ли',
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
  `is_hoa_member` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'член ли ТСЖ',
  `is_owner` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'собственник ли',
  `share` decimal(10,0) DEFAULT NULL COMMENT 'процент собственности',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  PRIMARY KEY (`physic_id`,`premise_id`),
  FOREIGN KEY (premise_id) REFERENCES premise(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица отношений физ лица и помещения';


drop table if exists `sms_transaction`; 
CREATE TABLE  `sms_transaction` (
  `id` int(11) NOT NULL COMMENT 'id sms транзакции',
  `mc_id` int(11) NULL COMMENT 'id УО которая платит за смс сервис',
  `physic_id` int(11) NOT NULL COMMENT 'id физического лица, который отправил рассылку',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последнего изменения',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  `sum` decimal(10,2) NOT NULL COMMENT 'сумма смс рассылки',
  `caption` varchar(255) NOT NULL COMMENT 'описание о рассылке',
  `message` text NOT NULL COMMENT 'текст рассылки',
  PRIMARY KEY (`id`),
  FOREIGN KEY (mc_id) REFERENCES mc(id),
  FOREIGN KEY (physic_id) REFERENCES physical_person(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица смс рассылок (транзакций)';

drop table if exists `sms_log`; 
CREATE TABLE  `sms_log` (
  `id` int(11) NOT NULL COMMENT 'id sms рассылки',
  `physic_id` int(11) NULL COMMENT 'id физического лица, владельца данного сотового телефона',
  `sms_transaction_id` int(11) NOT NULL COMMENT 'id смс транзакции',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последнего изменения',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  `phone` varchar(13) NOT NULL COMMENT 'номер сотового телефона, на который отправлено смс',
  `is_sent` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'отправлено сообщение или нет',
  PRIMARY KEY (`id`),
  FOREIGN KEY (sms_transaction_id) REFERENCES sms_transaction(id),
  FOREIGN KEY (physic_id) REFERENCES physical_person(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица отсылки одной смс на конкретный номер';

drop table if exists `voting`; 
CREATE TABLE  `voting` (
  `id` int(11) NOT NULL COMMENT 'id госолования',
  `mc_id` int(11) NOT NULL COMMENT 'id УО которая организовала голосование',
  `employee_id` int(11) NOT NULL COMMENT 'id сотрудника, создавшего голосование',
  `start_date` datetime NOT NULL COMMENT 'планируемая дата начала заочного голосования',
  `end_date` datetime NOT NULL COMMENT 'планируемая дата окончания заочного голосования',
  `reg_date` datetime NOT NULL COMMENT 'дата создания',
  `update_date` datetime NOT NULL COMMENT 'дата последнего изменения',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  `complete_date` datetime NULL DEFAULT NULL COMMENT 'дата завершения голосования',
  `who_vote` enum('members', 'owners', 'members_and_owners') NOT NULL COMMENT 'кто могут голосовать: только члены ТСЖ, собственники или и те ,и другие',
  `init_name` varchar(255) NOT NULL COMMENT 'ФИО инициатора голосования',
  `is_hoa_member` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'тип инициатора голосования (члент ТСЖ или собственник)',
  `voting_place` varchar(255) NOT NULL COMMENT 'адрес проведения голосования или название ТСЖ',
  `is_sent` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'отправлено сообщение или нет',
  `caption` varchar(255) NOT NULL COMMENT 'заголовок голосования',
  `description` text NOT NULL COMMENT 'повестка голосования',
  PRIMARY KEY (`id`),
  FOREIGN KEY (mc_id) REFERENCES mc(id),
  FOREIGN KEY (employee_id) REFERENCES employee(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица голосований';

drop table if exists `voting_level`; 
CREATE TABLE  `voting_level` (
  `id` int(11) NOT NULL COMMENT 'id этапа голосования',
  `voting_id` int(11) NOT NULL COMMENT 'id голосования, к которому пренадлежит данный этап',
  `employee_id` int(11) NOT NULL COMMENT 'id сотрудника - автора инициализации уровня (шага) голосования',
  `pre_notice_news_id` int(11) NULL COMMENT 'id сообщения в ленте новостей c предварительным уведомлением о начале голосования',
  `pre_notice_sms_id` int(11) NULL COMMENT 'id sms транзакции c предварительным уведомлением о начале голосования',
  `pre_notice_email_id` int(11) NULL COMMENT 'id email рассылки c предварительным уведомлением о начале голосования',
  `now_notice_news_id` int(11) NULL COMMENT 'id сообщения в ленте новостей c уведомлением о начале голосования в день голосования',
  `now_notice_sms_id` int(11) NULL COMMENT 'id sms транзакции c уведомлением о начале голосования в день голосования',
  `now_notice_email_id` int(11) NULL COMMENT 'id email рассылки c уведомлением о начале голосования в день голосования',
  `remind_notice_news_id` int(11) NULL COMMENT 'id сообщения в ленте новостей c напоминающим уведомлением после начала голосования',
  `remind_notice_sms_id` int(11) NULL COMMENT 'id sms транзакции c напоминающим уведомлением после начала голосования',
  `remind_notice_email_id` int(11) NULL COMMENT 'id email рассылки c напоминающим уведомлением после начала голосования',
  `report_notice_news_id` int(11) NULL COMMENT 'id сообщения в ленте новостей c уведомлением о результатах голосования',
  `report_notice_sms_id` int(11) NULL COMMENT 'id sms транзакции c уведомлением о результатах голосования',
  `report_notice_email_id` int(11) NULL COMMENT 'id email рассылки c уведомлением о результатах голосования',
  
  `reg_date` datetime NOT NULL COMMENT 'Дата перехода на уровень (шаг) голосования',
  `update_date` datetime NOT NULL COMMENT 'дата последнего изменения',
  `del_date` datetime DEFAULT NULL COMMENT 'дата удаления',
  `pre_notice_date` datetime NULL COMMENT 'дата рассылки c предварительным уведомлением о начале голосования',
  `now_notice_date` datetime NULL COMMENT 'дата рассылки c уведомлением о начале голосования в день голосования',
  `remind_notice_date` datetime NULL COMMENT 'дата рассылки c напоминающим уведомлением после начала голосования',
  `report_notice_date` datetime NULL COMMENT 'дата рассылки c уведомлением о результатах голосования',
  `quiz_date` datetime NULL COMMENT 'время сохранения анкеты/бланка',
  `complete_date` datetime NULL COMMENT 'время завершения голосования',
  `report_date` datetime NULL COMMENT 'время формирования протокола',

  `calculating_start_date` datetime NULL DEFAULT NULL COMMENT 'дата и время начала подведения итогов голосования',
  `calculating_end_date` datetime NULL DEFAULT NULL COMMENT 'дата и время окончания подведения итогов голосования',
  `voting_place` varchar(255) NOT NULL COMMENT 'адрес проведения голосования или название ТСЖ',
  `calculating_place` varchar(255) NULL COMMENT 'место подведения итогов голосования',
  `calculating_members` text COMMENT 'члены счетной комиссии',

  `who_count_total` decimal(10,4) unsigned NULL COMMENT 'общая площадь помещений собственников/членов участвующих в голосовании',  
  `who_count_present` decimal(10,4) unsigned NULL COMMENT 'общая площадь помещений собственников/членов, присутствующих на голосовании',
  `who_can_vote_total` decimal(10,4) unsigned NULL COMMENT 'площадь кв. м., которая может голосовать (100%)',
  `who_count_total_tsz` decimal(10,4) unsigned NULL COMMENT 'общая площадь членов ТСЖ, участвующих в голосовании',
  `who_count_present_tsz` decimal(10,4) unsigned NULL COMMENT 'общая площадь членов ТСЖ, присутствующих на голосовании',
  `who_can_vote_total_tsz` decimal(10,4) unsigned NULL COMMENT 'площадь кв. м. членов ТСЖ, которая может голосовать (100%)',

  `has_quorum` tinyint(1) unsigned DEFAULT NULL COMMENT 'есть кворум или нет',
  `has_quorum_tsz` tinyint(1) unsigned DEFAULT NULL COMMENT 'есть кворум или нет для членов ТСЖ, при смешенном голосоваонии',

  `status` enum('pre_quiz', 'offline_vote', 'online_vote') NOT NULL COMMENT 'статус этапа голосования',
  `caption` varchar(255) NOT NULL COMMENT 'заголовок голосования',
  `description` text NOT NULL COMMENT 'повестка голосования',
  
  PRIMARY KEY (`id`),
  FOREIGN KEY (voting_id) REFERENCES voting(id),
  FOREIGN KEY (employee_id) REFERENCES employee(id),
  FOREIGN KEY (pre_notice_news_id) REFERENCES news(id),
  FOREIGN KEY (pre_notice_sms_id) REFERENCES sms_transaction(id),
  FOREIGN KEY (pre_notice_email_id) REFERENCES email_transaction(id),
  FOREIGN KEY (now_notice_news_id) REFERENCES news(id),
  FOREIGN KEY (now_notice_sms_id) REFERENCES sms_transaction(id),
  FOREIGN KEY (now_notice_email_id) REFERENCES email_transaction(id),
  FOREIGN KEY (remind_notice_news_id) REFERENCES news(id),
  FOREIGN KEY (remind_notice_sms_id) REFERENCES sms_transaction(id),
  FOREIGN KEY (remind_notice_email_id) REFERENCES email_transaction(id),
  FOREIGN KEY (report_notice_news_id) REFERENCES news(id),
  FOREIGN KEY (report_notice_sms_id) REFERENCES sms_transaction(id),
  FOREIGN KEY (report_notice_email_id) REFERENCES email_transaction(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='таблица этапов голосования';



-- --------------------------------------------------------



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
