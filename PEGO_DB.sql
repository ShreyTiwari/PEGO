-- Database Setup Script

--
-- Table structure for table `category`
--
drop database pego;
create database pego;
use pego;

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(450) NOT NULL,
  PRIMARY KEY (`category_id`)
);

LOCK TABLES `category` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--
DROP TABLE IF EXISTS `users`;

create table  users
	(
		`user_id` varchar(20) primary key,
		`user_name` varchar(30),
		`pw` varchar(20),
		`dob` timestamp,
		`fullname` varchar(20),
		`phone_number` varchar(15),
		`email_id` varchar(40),
		`sex` varchar(10),
		`deleted_flag` boolean,
    `rating` int, 
    constraint check_rating check (`rating` < 6 AND `rating` > 0)
		);

DROP TABLE IF EXISTS `USERADDRESS`;

create table useraddress
	(
		`user_id` varchar(20) primary key,
		`flat_no` varchar(10),
		`street_name` varchar(20),
		`locality` varchar(20),
		`city` varchar(20),
		`state` varchar(20),
		`country` varchar(20),
		`zip_code` varchar(10),
		foreign key(user_id) references `users`(user_id) on delete cascade on update cascade
	);


--
-- Table structure for table `payment`
--
DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `paymenttype` varchar(45) NOT NULL,
   PRIMARY KEY (`paymentid`)
);

LOCK TABLES `payment` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `product`
--
DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `category_id` varchar(20) NOT NULL,
  `picture_url` varchar(300) NOT NULL,
  `description` varchar(400) NOT NULL,
  `cost` varchar(45) NOT NULL,
  `discount` varchar(45) NOT NULL,
  `features` varchar(3000) NOT NULL,
  `ownerid` varchar(20) NOT NULL,
  `available_flag` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `ownerid_idx` (`ownerid`),
  KEY `category id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ownerid` FOREIGN KEY (`ownerid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


LOCK TABLES `product` WRITE;
UNLOCK TABLES;


--
-- Table structure for table `order`
--
DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` varchar(20) NOT NULL,
  `productid` varchar(20) NOT NULL,
  `cust_id` varchar(20) NOT NULL,
  `paymentid` int NOT NULL,
  `shipdate` timestamp ,
  `total_amount` varchar(45) DEFAULT NULL,
  `time_of_order` timestamp ,
  PRIMARY KEY (`order_id`),
  KEY `productid_idx` (`productid`),
  KEY `custid_idx` (`cust_id`),
  KEY `paymentid_idx` (`paymentid`),
  CONSTRAINT `cust_id` FOREIGN KEY (`cust_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paymentid` FOREIGN KEY (`paymentid`) REFERENCES `payment` (`paymentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productid` FOREIGN KEY (`productid`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `order` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--
-- drop table if exists `reviews`;

-- create table `reviews`(
-- 	`product_id` varchar(20),
-- 	`order_id` varchar(20),
-- 	`rating` int ,
-- 	`review_date` timestamp,
-- 	primary key(`product_id`,`order_id`),
-- 	constraint check_rating check (`rating` < 6 AND `rating` > 0),
-- 	foreign key (`order_id`) references `order`(`order_id`) on update cascade,
-- 	foreign key (`product_id`) references `product`(`product_id`) on update cascade

-- );


INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa001', 'Tejas_P' , 'tejurocks' , '01-03-1998' , 'Tejas Prashanth' , '9930291339' , 'tejuprash@gmail.com','M',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa002', 'Megvya' , 'meg1999' , '26-02-1999' , 'Meghana Vyakaranam' , '9930294339' , 'meghanavs@gmail.com','F',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa003', 'taruni' , 'truni45' , '14-05-1998' , 'Taruni Sunder' , '9968292339' , 'tarunisunder@gmail.com','F',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa004', 'tanmudu' , 'tambooks123' , '01-07-1998' , 'Tanmaya Ududpa' , '9834291337' , 'tanmayup@gmail.com','M',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa005', 'vidhuroj' , 'dbmsftw' , '01-03-1979' , 'Vidhita Rojin' , '9936791354' , 'vr@gmail.com','F',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa006', 'dilkum' , 'musicsoul' , '30-07-1998' , 'Dilip Kumar' , '9935551330' ,'dilipk@gmail.com', 'M',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa007', 'ashwini' , 'dancer107' , '27-07-1998' , 'Ashwini Deshpande' , '8730291336' , 'ashdes@gmail.com','F',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa008', 'nidhi' , 'nidhrocks' , '08-03-1998' , 'Nidhi Singh' , '9930254317' ,'nidhi@gmail.com', 'F',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa009', 'nitin' , 'timetoread' , '11-06-1998' , 'Nitin Rao' , '9930267890' ,'nitin@gmail.com', 'M',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa010', 'nikhil' , 'password' , '01-03-1988' , 'Nikhil Gupta' , '993123439' , 'nikhil@gmail.com','M',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa011', 'priya' , 'pppqqq' , '01-09-1999' , 'Priya Rajan' , '9930291839' , 'priya@gmail.com','F',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa012', 'sunder' , 'suninsun' , '17-09-1968' , 'Sunder Chakravarty' , '8730297396' ,'sunderc@gmail.com', 'M',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa013', 'prabha' , 'prabsun' , '03-03-1970' , 'Prabha Sunder' , '9938791351' , 'prabha@gmail.com','F',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa014', 'ramita' , 'ramzshar' , '10-05-1996' , 'Ramita Sharma' , '9450291365' , 'ramita@gmail.com','F',false,1);
INSERT into users(`user_id`,`user_name`,`pw`,`dob`,`fullname`,`phone_number`,`email_id`,`sex`,`deleted_flag`,`rating`) values('uaa015', 'Yashas' , 'yashurocks' , '01-03-1998' , 'Yashas Prashanth' , '9930278339' , 'yashas@gmail.com','M',false,1);

INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa001', '23' , 'lavelle road' , 'gandhinagar' , 'Bangalore' , 'Karnataka' , 'India' ,'560001');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa002', '63' , 'malleshwaram road' , 'malleshwaram' , 'Bangalore' , 'Karnataka' , 'India' ,'560011');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa003', '78' , 'richmond road' , 'jayanagar' , 'Bangalore' , 'Karnataka' , 'India' ,'560041');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa004', '23' , 'wilson road' , 'koramangala' , 'Bangalore' , 'Karnataka' , 'India' ,'560078');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa005', '23' , 'kempegowda road' , 'indiranagar' , 'Bangalore' , 'Karnataka' , 'India' ,'560088');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa006', '23' , 'mekhri road' , 'gandhinagar' , 'Bangalore' , 'Karnataka' , 'India' ,'560001');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa007', '23' , 'bellandur road' , 'bellandur' , 'Bangalore' , 'Karnataka' , 'India' ,'560087');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa008', '23' , 'marathahalli road' , 'marathahalli' , 'Bangalore' , 'Karnataka' , 'India' ,'560037');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa009', '23' , 'mg road' , 'brookfields' , 'Bangalore' , 'Karnataka' , 'India' ,'560091');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa010', '23' , 'whitefield road' , 'whitefield' , 'Bangalore' , 'Karnataka' , 'India' ,'560051');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa011', '23' , 'church road' , 'girinagar' , 'Bangalore' , 'Karnataka' , 'India' ,'560089');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa012', '23' , 'sarjapur road' , 'sarjapur' , 'Bangalore' , 'Karnataka' , 'India' ,'560060');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa013',  '23' , 'sarjapur road' , 'sarjapur' , 'Bangalore' , 'Karnataka' , 'India' ,'560060');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa014', '23' , 'HAL road' , 'banashankari' , 'Bangalore' , 'Karnataka' , 'India' ,'560085');
INSERT into useraddress(`user_id`,`flat_no`,`street_name`,`locality`,`city`,`state`,`country`,`zip_code`) values('uaa015', '23' , 'lavelle road' , 'gandhinagar' , 'Bangalore' , 'Karnataka' , 'India' ,'560001');

INSERT INTO category(`category_id`,`name`,`description`) VALUES('c001','vehicles','Cars,bikes,vehicle parts');
INSERT INTO category(`category_id`,`name`,`description`) VALUES('c002','furniture','Household items');
INSERT INTO category(`category_id`,`name`,`description`) VALUES('c003','electronics','TV,AC, fridge,laptops');
INSERT INTO category(`category_id`,`name`,`description`) VALUES('c004','mobile phones','mobile phones and accessories');
INSERT INTO category(`category_id`,`name`,`description`) VALUES('c005','apparel','men and women clothing');
INSERT INTO category(`category_id`,`name`,`description`) VALUES('c006','misc','misc');

INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po001', 'car', 'c001', '/po001', 'Maruti Suzuki Swift Dzire. About 5 years old', '500000','0','Automatic;Insurance cover of 3 years;Blue in color;Bluetooth;Power steering','uaa001',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po002', 'car', 'c001', '/po002', 'New Audi A10', '2000000','0','Manual;Insurance cover of 3 years;Red in color;Bluetooth;','uaa002',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po003', 'phone', 'c004', '/po003', 'Brand new iPhone10', '70000','0','Grey in color; 64GB storage;1GB RAM','uaa001',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po004', 'bike', 'c001', '/po004', '4 year old Royal Enfield Bullet', '1500000','0','Black color;350CC engine capacity','uaa006',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po005', 'sofa', 'c002', '/po005', 'A new 2 seater-sofa set','75000','0','Black color; Soft cushions; Hard exterior;','uaa007',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po006', 'shirts', 'c005', '/po006', 'Shirts from Levi', '100', '0','Size:M','uaa001',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po007', 'HP laptop', 'c003', '/po007', 'HP x360 pavilion', '55000', '0','1TB HDD + 128GB SSD,8GB RAM,Warranty available;Battery in good condition','uaa014',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po008', 'Asus Zenfone', 'c004', '/po008', 'Asus Zenfone 3', '20000', '0','6GB RAM; 64GB storage; 10MP rear camera','uaa010',1);

INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po100', 'Pant', 'c005', '/po100', 'Pant from Levi', '3200', '10','Size: M; Colour: Blue','uaa001',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po101', 'Pant', 'c005', '/po101', 'Pant from Lee', '4000', '12','Size: M; Colour: Black','uaa001',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po102', 'Hoodie', 'c005', '/po102', 'Winter Hoodie Grey', '3200', '10','Size: L; Colour: Grey; Great condition','uaa001',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po103', 'Shoes', 'c005', '/po103', 'Bata Shoes', '1500', '0','Size: M; Colour: Black; Good condition','uaa001',1);

INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po104', 'Pant', 'c005', '/po104', 'Pant from Levi', '6000', '10','Size: M; Colour: Blue; Skin fit','uaa003',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po105', 'Shrug', 'c005', '/po105', 'Fashionable shrug', '2000', '0','Colour: Blue','uaa003',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po106', 'Hoodie', 'c005', '/po106', 'Winter Hoodie Grey', '1249', '10','Colour: Grey; Great condition','uaa003',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po107', 'Shoes', 'c005', '/po107', 'Heels', '3500', '0','Colour: Black; Good condition; Original Leather','uaa003',1);

INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po108', 'Shorts', 'c005', '/po108', 'Beach Shorts', '1000', '0','Size: M; Cool and fashionable','uaa002',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po109', 'Shrug', 'c005', '/po109', 'Fashionable shrug', '2200', '0','Colour: Blue; Good for winters','uaa002',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po110', 'T-Shirt', 'c005', '/po110', 'Shirt from Pepe jeans', '1249', '10','Colour: Yellow; Great condition','uaa002',1);
INSERT into product(`product_id`,`name`,`category_id`,`picture_url`,`description`,`cost`,`discount`,`features`,`ownerid`,`available_flag`) values('po111', 'Scarf', 'c005', '/po111', 'Scarf for dust protection', '500', '0','Good condition','uaa002',1);
