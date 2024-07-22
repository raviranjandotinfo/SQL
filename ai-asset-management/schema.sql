
--
-- Database: `assetgator-main`
--

--
-- Table structure for table `subscribers`
--
--


CREATE TABLE IF NOT EXISTS `subscribers` (
  `sub_id` int(11) NOT NULL auto_increment,
  `full_name` varchar(64) NOT NULL,
  `phone` int(20) NOT NULL,
  `primary_email` varchar(128) NOT NULL,
  `sub_type` enum('SILVER','GOLD','PLATINUM') NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`sub_id`),
  UNIQUE KEY `primary_email` (`primary_email`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--
--


CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(11) NOT NULL auto_increment,
  `bank_name` varchar(64) NOT NULL,
  `account_type` varchar(64) NOT NULL,
  `person_name` varchar(64) NOT NULL,
  `account_no` int(20) NOT NULL,
  `routing_no` int(20) NOT NULL,
  `branch_address` varchar(128) NOT NULL,
  `swift_no` int(20) NOT NULL,
  `micr_no` int(20) NOT NULL,
  `comments` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `sub_id` (`sub_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--
--


CREATE TABLE IF NOT EXISTS `cards` (
  `card_id` int(11) NOT NULL auto_increment,
  `name_on_card` varchar(64) NOT NULL,
  `card_no` int(20) NOT NULL,
  `cvv_no` int(3) NOT NULL,
  `start_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sub_type` enum('CREDIT','DEBIT','OTHERS') NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `sub_id` (`sub_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--
--


CREATE TABLE IF NOT EXISTS `asset` (
  `asset_id` int(11) NOT NULL auto_increment,
  `symbol` char(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`asset_id`),
  UNIQUE KEY `symbol` (`symbol`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `atomic_market`
--

CREATE TABLE IF NOT EXISTS `atomic_market` (
  `atomic_market_id` int(11) NOT NULL auto_increment,
  `market_id` int(11) default '0',
  `user_id` int(11) default '0',
  `institution_id` int(11) default '0',
  `parent_id` int(11) default '0',
  `internal_id` int(11) default '0',
  `version` int(11) NOT NULL default '1',
  `atomic_market_name` varchar(128) default NULL,
  `atomic_market_description` text,
  `instrument_name` varchar(64) default NULL,
  `instrument_description` text,
  `keyword` text,
  `market_definition` longblob NOT NULL,
  `performance` varchar(255) NOT NULL,
  `status` enum('test','prod') NOT NULL,
  `allowBidOfferLimitOrder` tinyint(1) NOT NULL,
  `allowBuySellLimitIocOrder` tinyint(1) NOT NULL,
  `allowBuySellFillOrKillOrder` tinyint(1) NOT NULL,
  `allowIcebergOrder` tinyint(1) NOT NULL,
  `allowBuySellStopLimitOrder` tinyint(1) NOT NULL,
  `dealing_data_qualifier_id` int(11) default '0',
  `dealing_data_transparency_id` int(11) default '0',
  `market_book_data_transparency_id` int(11) default '0',
  `market_type_id` int(11) default '0',
  `asset_id` int(11) default '0',
  `take_price_defined_as_id` int(11) default '0',
  `perTradeUnit` decimal(10,2) NOT NULL,
  `pipsEnd` tinyint(2) NOT NULL,
  `typicalSpread` decimal(10,3) NOT NULL,
  `wideSpread` decimal(10,3) NOT NULL,
  `marketThreshold` decimal(10,3) NOT NULL,
  `typicalPrice` decimal(10,4) NOT NULL,
  `pipGranularity` tinyint(1) NOT NULL,
  `separatePips` tinyint(1) NOT NULL,
  `pipsStart` tinyint(2) NOT NULL,
  `inputDifferentToDisplay` tinyint(1) NOT NULL,
  `pipsInputStart` tinyint(2) NOT NULL,
  `allPipsMustBeEntered` tinyint(1) NOT NULL,
  `commodityTraded_name` varchar(32) default NULL,
  `commodityTraded_description` varchar(64) default NULL,
  `commodityTraded_decimalPlaces` tinyint(3) NOT NULL,
  `commodityTraded_scaleFactor` tinyint(2) NOT NULL,
  `commodityTraded_lotSizeName` varchar(32) default NULL,
  `commodityTraded_lotSizeNameShort` varchar(64) default NULL,
  `commodityTraded_measurement_type_id` tinyint(11) default '0',
  `commodityTraded_increment` decimal(5,3) NOT NULL,
  `commodityTraded_maximum` decimal(5,3) NOT NULL,
  `commodityTraded_minimum` decimal(5,3) NOT NULL,
  `commodityPayment_name` varchar(32) default NULL,
  `commodityPayment_description` varchar(64) default NULL,
  `commodityPayment_decimalPlaces` tinyint(3) NOT NULL,
  `commodityPayment_scaleFactor` tinyint(2) NOT NULL,
  `commodityPayment_lotSizeName` varchar(32) default NULL,
  `commodityPayment_lotSizeNameShort` varchar(64) default NULL,
  `commodityPayment_measurement_type_id` tinyint(11) default '0',
  `commodityPayment_increment` decimal(5,3) NOT NULL,
  `commodityPayment_maximum` decimal(5,3) NOT NULL,
  `commodityPayment_minimum` decimal(5,3) NOT NULL,
  `is_complete` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `market_data_id` int(11) default '0',
  `filter_id` int(11) default '0',
  `markedForDeletion` tinyint(1) NOT NULL,
  PRIMARY KEY  (`atomic_market_id`),
  KEY `market_id` (`market_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `commodity`
--

CREATE TABLE IF NOT EXISTS `commodity` (
  `commodity_id` int(11) NOT NULL auto_increment,
  `commodity_name` varchar(128) NOT NULL,
  `commodity_description` text NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`commodity_id`)
) ;


-- --------------------------------------------------------

--
-- Table structure for table `component`
--


CREATE TABLE IF NOT EXISTS `component` (
  `component_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `type` enum('DAD','ORP','ARM','MKD','TRC') NOT NULL,
  `region_id` int(11) default NULL,
  `MKD_component_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `max_bandwidth` int(11) default NULL,
  `min_bandwidth` int(11) default NULL,
  `ip_address` varchar(16) NOT NULL,
  `status` varchar(16) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`component_id`),
  UNIQUE KEY `name` (`name`),
  KEY `region_id` (`region_id`),
  KEY `MKD_component_id` (`MKD_component_id`)
) ;


-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dealing_data_transparency` (
  `dealing_data_transparency_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`dealing_data_transparency_id`)
) ;


-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE IF NOT EXISTS `deals` (
  `deal_id` int(11) NOT NULL auto_increment,
  `order_buy_id` int(11) default NULL,
  `order_sell_id` int(11) default NULL,
  `deal_amount` int(11) default NULL,
  `deal_price` decimal(20,2) default NULL,
  `deal_date` int(20) default NULL,
  `settlement_date` datetime default NULL,
  `settlement_type` varchar(32) default NULL,
  `payment_bank_id` int(11) default NULL,
  `receive_bank_id` int(11) default NULL,
  `counterparty_trader_id` int(11) default NULL,
  `institution_id` int(11) default NULL,
  PRIMARY KEY  (`deal_id`)
) ;


-- --------------------------------------------------------

--
-- Table structure for table `institution_types`
--

CREATE TABLE IF NOT EXISTS `institution_types` (
  `institution_type_id` int(11) NOT NULL auto_increment,
  `institution_type` enum('CUST','SUPPLIER') NOT NULL,
  `institution_type_name` varchar(128) NOT NULL,
  `institution_type_desc` text NOT NULL,
  `institution_type_action` varchar(32) NOT NULL,
  PRIMARY KEY  (`institution_type_id`)
) ;


-- --------------------------------------------------------
--
-- Table structure for table `watchlist`
--
--


CREATE TABLE IF NOT EXISTS `watchlist` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `invst_type` varchar(20) NOT NULL,
  `watching_since_months` int(4) NOT NULL,
  `potential_investments` int(12) NOT NULL,
  `notifications` varchar(128) NOT NULL,
  `comments` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `sub_id` (`sub_id`)
) ;

-- --------------------------------------------------------
--
-- Table structure for table `market`
--

CREATE TABLE IF NOT EXISTS `market` (
  `market_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '-1',
  `asset_id` int(11) NOT NULL default '-1',
  `market_type_id` int(11) NOT NULL default '-1',
  `market_name` varchar(128) default NULL,
  `market_description` text,
  `status` enum('test','prod','retired') NOT NULL,
  `market_open` time NOT NULL,
  `market_close` time NOT NULL,
  `is_test` tinyint(1) NOT NULL,
  `organization_level_1_name` varchar(128) NOT NULL,
  `organization_level_1_description` varchar(256) NOT NULL,
  `organization_level_2_name` varchar(128) NOT NULL,
  `organization_level_2_description` varchar(256) NOT NULL,
  `organization_level_3_name` varchar(128) NOT NULL,
  `organization_level_3_description` varchar(256) NOT NULL,
  `organization_level_4_name` varchar(128) NOT NULL,
  `organization_level_4_description` varchar(256) NOT NULL,
  `organization_level_5_name` varchar(128) NOT NULL,
  `organization_level_5_description` varchar(256) NOT NULL,
  `notes` text NOT NULL,
  `extra` text NOT NULL,
  `filter_id` int(11) NOT NULL default '-1',
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY  (`market_id`)
) ;


-- --------------------------------------------------------

--
-- Table structure for table `market_book_data_transparency`
--

CREATE TABLE IF NOT EXISTS `market_book_data_transparency` (
  `market_book_data_transparency_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`market_book_data_transparency_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `market_configuration`
--

CREATE TABLE IF NOT EXISTS `market_configuration` (
  `market_configuration_id` int(11) NOT NULL auto_increment,
  `atomic_market_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `component_name` varchar(32) NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `notes` text NOT NULL,
  PRIMARY KEY  (`market_configuration_id`),
  KEY `atomic_market_id` (`atomic_market_id`,`component_id`)
) ;


-- --------------------------------------------------------

--
-- Table structure for table `market_places`
--

CREATE TABLE IF NOT EXISTS `market_places` (
  `market_place_id` int(11) NOT NULL auto_increment,
  `institution_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `market_place_name` varchar(128) NOT NULL,
  `market_place_description` text NOT NULL,
  `is_live` tinyint(4) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` datetime NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY  (`market_place_id`)
)  ;

--
-- Dumping data for table `market_places`
--
-- --------------------------------------------------------

--
-- Table structure for table `market_type`
--

CREATE TABLE IF NOT EXISTS `market_type` (
  `market_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`market_type_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `measurement_type`
--

CREATE TABLE IF NOT EXISTS `measurement_type` (
  `measurement_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(64) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`measurement_type_id`)
)  ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL auto_increment,
  `order_interruption_reason` int(11) default NULL,
  `order_interruption_result` int(11) default NULL,
  `order_price` decimal(20,2) default NULL,
  `order_status` int(11) default NULL,
  `order_submission_result` int(11) default NULL,
  `order_type` enum('BID/OFFER LIMIT','BUY/SELL IOC','BUY/SELL FILL OR KILL','ICEBERG','BUY/SELL STOP LIMIT') default NULL,
  `order_date` datetime default NULL,
  `order_amount` int(25) default NULL,
  `atomic_market_id` int(11) default NULL,
  `creator_id` int(11) default NULL,
  `institution_id` int(11) default NULL,
  PRIMARY KEY  (`order_id`)
) ;

--
-- Dumping data for table `orders`
--

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `region_id` int(11) NOT NULL auto_increment,
  `region_name` varchar(64) character set armscii8 NOT NULL,
  `country_code` varchar(3) character set armscii8 NOT NULL,
  `time_zone` varchar(16) character set armscii8 NOT NULL,
  PRIMARY KEY  (`region_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `session_id` int(11) NOT NULL auto_increment,
  `component_name` varchar(32) character set armscii8 NOT NULL,
  `started` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ended` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`session_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `take_price_defined_as`
--

CREATE TABLE IF NOT EXISTS `take_price_defined_as` (
  `take_price_defined_as_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`take_price_defined_as_id`)
) ;


-- --------------------------------------------------------

--
-- Table structure for table `traders`
--

CREATE TABLE IF NOT EXISTS `traders` (
  `trader_id` int(11) NOT NULL auto_increment,
  `trading_floor_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `user_id` int(11) default NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`trader_id`),
  UNIQUE KEY `trading_floor_id-user_id` (`trading_floor_id`,`user_id`)
) ;


-- --------------------------------------------------------

--
-- Table structure for table `trading_floors`
--

CREATE TABLE IF NOT EXISTS `trading_floors` (
  `trading_floor_id` int(11) NOT NULL auto_increment,
  `trading_code` varchar(16) default NULL,
  `institution_id` int(11) default '0',
  `trading_floor_name` varchar(128) NOT NULL,
  `trading_floor_description` text NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modification_date` timestamp NULL default NULL,
  `filter_id` int(11) default NULL,
  PRIMARY KEY  (`trading_floor_id`)
) ;

--
-- Dumping data for table `trading_floors`
--


-- --------------------------------------------------------

--
-- Table structure for table `trading_groups`
--


CREATE TABLE IF NOT EXISTS `trading_groups` (
  `trading_group_id` int(11) NOT NULL auto_increment,
  `market_group_name` varchar(64) default NULL,
  `atomic_market_id` int(11) default NULL,
  `trading_floor_id` int(11) default NULL,
  `market_group_description` text,
  `creation_date` datetime default NULL,
  `institution_id` int(11) default NULL,
  `single_prime_broker` int(11) default NULL,
  `trader_id` int(11) default NULL,
  PRIMARY KEY  (`trading_group_id`)
) ;



-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL auto_increment,
  `invited_by` int(11) NOT NULL,
  `institution_id` int(11) default NULL,
  `is_institution_admin` tinyint(1) NOT NULL,
  `child_of_id` int(11) default NULL,
  `user_photo` varchar(256) NOT NULL,
  `first_name` varchar(128) default NULL,
  `middle_name` varchar(64) NOT NULL,
  `last_name` varchar(128) default NULL,
  `title` varchar(32) default NULL,
  `position` varchar(128) NOT NULL,
  `desk` varchar(32) default NULL,
  `email` varchar(128) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `salt` varchar(3) NOT NULL,
  `address_1` varchar(128) default NULL,
  `address_2` varchar(128) default NULL,
  `city` varchar(64) default NULL,
  `state_providence` varchar(64) default NULL,
  `postal_code` varchar(32) default NULL,
  `country_code` varchar(2) default NULL,
  `phone_1` varchar(32) default NULL,
  `phone_2` varchar(32) default NULL,
  `fax` varchar(32) default NULL,
  `cell_area_code` int(4) default NULL,
  `cell_pre_fix` int(3) default NULL,
  `cell_last_four` int(5) default NULL,
  `signup_ip_address` varchar(16) default NULL,
  `activation_date` datetime NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modification_date` datetime NOT NULL,
  `lastlogin_date` datetime NOT NULL,
  `lastlogout_date` datetime NOT NULL,
  `remember_me` tinyint(1) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `filter_id` int(11) default NULL,
  `is_name_private` tinyint(1) default NULL,
  `is_email_private` tinyint(1) default NULL,
  `is_username_private` tinyint(1) NOT NULL,
  `is_email_domain_private` tinyint(1) NOT NULL,
  `is_company_name_private` tinyint(1) default NULL,
  `is_position_private` tinyint(1) NOT NULL,
  `is_address_private` tinyint(1) NOT NULL,
  `is_desk_private` tinyint(1) default NULL,
  `is_phone_1_private` tinyint(1) NOT NULL,
  `is_phone_2_private` tinyint(1) NOT NULL,
  `is_fax_private` tinyint(1) NOT NULL,
  `is_cell_private` tinyint(1) NOT NULL,
  `is_personal_email_private` tinyint(1) NOT NULL,
  `region_id` int(11) default NULL,
  `ranking` int(4) default NULL,
  `personal_emails` varchar(128) default NULL,
  `asset_class` varchar(32) default NULL,
  `company_type` varchar(32) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `filter_id` (`filter_id`),
  KEY `institution_id` (`institution_id`),
  KEY `invited_by` (`invited_by`),
  KEY `child_of_id` (`child_of_id`)
) ;


--
-- Table structure for table `version`
--
--

CREATE TABLE IF NOT EXISTS `version` (
  `number` decimal(5,3) NOT NULL,
  `svn_previous_revision` int(5) NOT NULL,
  `name` varchar(32) NOT NULL,
  `status` enum('DEV','BETA','ALPHA','PRODUCTION') NOT NULL,
  `comment` varchar(255) NOT NULL,
  `added` text NOT NULL,
  `dropped` text NOT NULL,
  `altered` text NOT NULL,
  `sp_log` text NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`number`)
) ;
