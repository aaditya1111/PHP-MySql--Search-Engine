-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2016 at 05:25 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EngineX`
--

-- --------------------------------------------------------

--
-- Table structure for table `containstable`
--

CREATE TABLE `containstable` (
  `PageId` int(11) NOT NULL,
  `ChildId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `containstable`
--

INSERT INTO `containstable` (`PageId`, `ChildId`) VALUES
(1, 2),
(1, 3),
(1, 5),
(1, 4),
(1, 6),
(1, 7),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(1, 20),
(3, 21),
(14, 15),
(14, 16),
(17, 18),
(17, 19),
(22, 23),
(22, 24),
(22, 25),
(26, 27),
(26, 28),
(26, 29),
(30, 31),
(30, 32),
(30, 33);

-- --------------------------------------------------------

--
-- Table structure for table `nquerytable`
--

CREATE TABLE `nquerytable` (
  `PageId` int(11) NOT NULL,
  `Keyword` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nquerytable`
--

INSERT INTO `nquerytable` (`PageId`, `Keyword`) VALUES
(1, 'IIITA'),
(1, 'Indian Institute Of Information Technology Allahabad'),
(2, 'Academics'),
(3, 'Placements'),
(4, 'Faculty'),
(5, 'Examcell'),
(6, 'Library'),
(7, 'Campus Life'),
(8, 'Google'),
(9, 'Gmail'),
(10, 'Android'),
(8, 'Search Engine'),
(11, 'Translate'),
(12, 'Maps'),
(13, 'Facebook'),
(13, 'fb'),
(20, 'Location'),
(21, 'Statistics'),
(14, 'irctc'),
(15, 'Flights'),
(16, 'Tourism'),
(17, 'Amazon'),
(19, 'Electronic'),
(19, 'Store'),
(18, 'Todays Deals'),
(22, 'Twitter'),
(23, 'News'),
(24, 'Entertainment'),
(25, 'Sports'),
(26, 'Flipkart'),
(27, 'Sell'),
(28, 'Electronics'),
(28, 'Store'),
(29, 'Help Center'),
(30, 'Dota'),
(30, '2'),
(31, 'Heroes'),
(32, 'Workshop'),
(33, 'Watch');

-- --------------------------------------------------------

--
-- Table structure for table `pagecounttable`
--

CREATE TABLE `pagecounttable` (
  `PageId` int(11) NOT NULL,
  `Inlinks` int(11) NOT NULL,
  `Outlinks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagecounttable`
--

INSERT INTO `pagecounttable` (`PageId`, `Inlinks`, `Outlinks`) VALUES
(1, 10, 6),
(2, 1, 2),
(3, 1, 1),
(4, 1, 0),
(5, 1, 0),
(6, 1, 0),
(7, 1, 0),
(8, 100, 4),
(9, 1, 0),
(10, 1, 0),
(11, 1, 0),
(12, 1, 0),
(13, 55, 2),
(20, 1, 0),
(21, 1, 0),
(14, 10, 2),
(15, 1, 0),
(16, 1, 0),
(17, 25, 2),
(18, 1, 0),
(19, 1, 0),
(22, 40, 3),
(23, 1, 0),
(24, 1, 0),
(25, 1, 0),
(26, 35, 3),
(27, 1, 0),
(28, 1, 0),
(29, 1, 0),
(30, 5, 3),
(31, 1, 0),
(32, 1, 0),
(33, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pageranktable`
--

CREATE TABLE `pageranktable` (
  `PageId` int(11) NOT NULL,
  `PageRank` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pageranktable`
--

INSERT INTO `pageranktable` (`PageId`, `PageRank`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(13, 1),
(20, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(21, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagetable`
--

CREATE TABLE `pagetable` (
  `PageId` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Description` text NOT NULL,
  `Url` varchar(200) NOT NULL,
  `Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagetable`
--

INSERT INTO `pagetable` (`PageId`, `Title`, `Description`, `Url`, `Type`) VALUES
(1, 'Indian Institute of Information Technology Allahabad', 'Indian Institute of Information Technology, Allahabad is a university located in Allahabad, Uttar Pradesh, India, and one of Indian Institutes of Information Technology.', 'http://www.iiita.ac.in', 0),
(2, 'IIIT-Allahabad | Academics', 'IIIT Allahabad offers courses in Undergraduates, Graduates and Doctrate Programmes, realizing the vital significance of information technology in the years to come.', 'http://www.iiita.ac.in/academics/', 0),
(3, 'IIIT-Allahabad | Placement Cell', 'The business environemnt today requires effecient handling of complexity, highly unpredicatble situations.\r\nBy providing an excellent mix of highly qualified faculty and unmatched course content, IIITA ensures that our students are well prepared to step into the corporate world.', 'https://placement.iiita.ac.in', 0),
(4, 'IIIT - Allahabad | Faculty', 'Each and every faculty is a pioneer in his/her own field and is more than well equiped with all the prerequisites to give their students nothing but the zenith in every field of human study they wish to pursue.', 'https://iiita.ac.in/academics/faculty_profile/', 0),
(5, 'IIIT - Allahabad | Exam Cell', 'Welcome to examination and admission cell of IIITA. Following are the various responsibilities of cell :- \r\n1) Admission   2) Examination Results\r\n3)Degree and Convocation 4)Other Tasks.', 'https://examcell.iiita.ac.in', 0),
(6, 'IIIT - Allahabad | Library', 'The IIITA central library has a repository of more than 50000 books concerning myriad disciplines of study such as pure and applied science, computer science, IT, ECE , information security and management.', 'http://library.iiita.ac.in/', 0),
(7, 'IIIT - Allahabad | Campus Life', 'IIITA is still a nascent institute and is rapidly growing. IIITA is one of the few institutes in India where the network is being developed and managed by students under the guidance of the domain.', 'https://www.iiita.ac.in/campus_life/', 0),
(8, 'Google', 'Google is an American multinational technology company specializing in Internet-related services and products. These include online advertising technologies, search, cloud computing, and software.', 'https://www.google.com', 0),
(9, 'Google | Gmail', 'Gmail is a free, advertising-supported email service provided by Google. Users may access Gmail as secure webmail, as well as via POP3 or IMAP4 protocols. Gmail started as an invitation-only beta release on April 1, 2004 and it became available to the general public on February 7, 2007, though still in beta status at that time. The service was upgraded from beta status on July 7, 2009, along with the rest of the Google Apps suite.', 'https://gmail.google.com', 0),
(10, 'Android ', 'Android is a mobile operating system (OS) currently developed by Google, based on the Linux kernel and designed primarily for touchscreen mobile devices such as smartphones and tablets. Android''s user interface is mainly based on direct manipulation, using touch gestures that loosely correspond to real-world actions, such as swiping, tapping and pinching, to manipulate on-screen objects, along with a virtual keyboard for text input. In addition to touchscreen devices, Google has further developed Android TV for televisions, Android Auto for cars, and Android Wear for wrist watches, each with a specialized user interface. Variants of Android are also used on notebooks, game consoles, digital cameras, and other electronics.', 'https://www.android.com/', 0),
(11, 'Google | Translate', 'Google Translate is a free multilingual statistical machine translation service provided by Google to translate text, speech, images, or real-time video from one language into another. It offers a web interface, mobile interfaces for Android and iOS, and an API that developers can use to build browser extensions, applications and other software. As of May 2016, Google Translate supports 103 languages at various levels and serves over 200 million people daily.', 'https://translate.google.co.in/', 0),
(12, 'Google | Maps', 'Google Maps is a desktop web mapping service developed by Google. It offers satellite imagery, street maps, 360° panoramic views of streets (Street View), real-time traffic conditions (Google Traffic), and route planning for traveling by foot, car, bicycle (in beta), or public transportation.', 'https://www.google.co.in/maps?source=tldso', 0),
(13, 'Facebook', 'Facebook is a corporation and online social networking service headquartered in Menlo Park, California, in the United States.', 'https://www.facebook.com', 0),
(14, 'IRCTC', 'Indian Railway Catering and Tourism Corporation, is a subsidiary of the Indian Railways that handles the catering, tourism and online ticketing operations of the railways.', 'https://www.irctc.co.in', 0),
(15, 'IRCTC | Flights', 'Book your flight tickets for a holiday. Government Authorized Agency for the LTC Ticket. Visit Air website of IRCTC now for booking Air/Flight Tickets at cheaper rates', 'http://www.air.irctc.co.in/', 0),
(16, 'IRCTC | Tourism', 'Book your tickets for a holiday. LTC tours at affordable rates. Check the availability of retiring rooms. Visit IRCTC Tourism now for attractive packages.', 'http://www.irctctourism.com/', 0),
(17, 'Amazon', 'Amazon.com, Inc., often referred to as simply Amazon, is an American electronic commerce and cloud computing company with headquarters in Seattle, Washington. It is the largest Internet-based retailer in the United States. Amazon.com started as an online bookstore, later diversifying to sell DVDs, Blu-rays, CDs, video downloads/streaming, MP3 downloads/streaming, audiobook downloads/streaming, software, video games, electronics, apparel, furniture, food, toys and jewelry. The company also produces consumer electronics—notably, Amazon Kindle e-book readers, Fire tablets, and Fire TV —and is the world''s largest provider of cloud infrastructure services (IaaS). Amazon also sells certain low-end products like USB cables under its in-house brand AmazonBasics.', 'http://www.amazon.com/', 0),
(18, 'Amazon | Today''s Deals', 'New deals. Every day. Shop our Deal of the Day, Lightning Deals and more daily deals and limited-time sales. See deals you''re Watching here.', 'http://www.amazon.com/gp/goldbox/ref=nav_cs_gb', 0),
(19, 'Amazon | Electronic''s Store', 'Huge Selection Of The Latest In\r\nElectronics Across Top Brands!', 'http://www.amazon.in/electronics/', 0),
(20, 'IIITA | Location', 'The IIITA campus is located at Devghat Jhalwa (Peepalgaon Road), which is on the outskirts of Allahabad. It is 10 km from the town center and 7 km from the main railway station.', 'http://www.iiita.ac.in/institute/maps_and_directions/', 0),
(21, 'IIITA | Placements | Statistics', 'For the year 2012-2013:\r\n\r\n100% of our students have been placed.\r\n75% have been placed in Dream Jobs (package above 5 lpa).\r\nHighest Package: 65 lpa\r\nAverage Package: 6.6 lpa\r\nNumber of companies that have visited: 69', 'http://www.iiita.ac.in/placements/statistics/', 0),
(22, 'Twitter', 'Twitter is an online social networking service that enables users to send and read short 140-character messages called "tweets". Registered users can read and post tweets, but those who are unregistered can only read them.', 'https://twitter.com/', 0),
(23, 'Twitter | News', 'The latest Tweets from Breaking News. Be the first to know when news breaks.', 'https://twitter.com/i/streams/category/687094923246440476', 0),
(24, 'Twitter | Entertainment', 'Check out the latest Tweets from Entertainment (@Entertainment)', 'https://twitter.com/i/streams/category/687094923246440457', 0),
(25, 'Twitter | Sports', 'The latest Tweets from Sports Illustrated. Breaking news, conversation and original reporting/insights on all sports. ', 'https://twitter.com/i/streams/category/687094923246440462', 0),
(26, 'Flipkart', 'Flipkart is an e-commerce company founded in 2007 by Sachin Bansal and Binny Bansal. The company is registered in Singapore, but has its headquarters in Bangalore, Karnataka, India. Flipkart has launched its own product range under the name "DigiFlip" with products including tablets, USBs, and laptop bags.', 'http://www.flipkart.com/', 0),
(27, 'Flipkart | Sell', 'Register & Grow your business today with best online selling platform for e-commerce solutions. Sell products Online and reach out to millions of customers', 'https://seller.flipkart.com/', 0),
(28, 'Flipkart | Electronics', 'Electronic Accessories - Buy Electronic Accessories Store Online. Free Shipping, Cash on delivery at India''s favourite Online Shop - Flipkart.com.', 'http://www.flipkart.com/mobiles', 0),
(29, 'Flipkart | Help Center', ' Flipkart Customer Care Number, Helpline Number: Flipkart is an Online ... Flipkart provide 24*7 customer care service to their consumers.', 'http://www.flipkart.com/helpcentre', 0),
(30, 'Dota 2', 'Dota 2 is a free-to-play multiplayer online battle arena (MOBA) video game developed and published by Valve Corporation. The game was released for Microsoft Windows, OS X, and Linux in July 2013, following a Windows-only public beta testing phase that began in 2011, and is the stand-alone sequel to Defense of the Ancients (DotA), a mod for Warcraft III: Reign of Chaos and its expansion pack, The Frozen Throne. Dota 2 is one of the most actively played games on Steam, with maximum peaks of over a million concurrent players.', 'http://blog.dota2.com/', 0),
(31, 'Dota2 | Heroes', 'Heroes are the essential element of Dota 2, as the course of the game is dependent on their intervention. During a match, two opposing teams select five heroes that accumulate experience and gold. Once a hero has enough experience, it will level up, growing more powerful and gaining new abilities. Most heroes have a distinct role that defines how they affect the battlefield, though many heroes can perform multiple roles. A hero''s appearance can be modified with Equipment.', 'http://www.dota2.com/heroes/', 0),
(32, 'Dota2 | Workshop', 'Thousands of items have been created and submitted to the Dota 2 Item Workshop by community members like you. If you have Dota 2, the Steam Workshop now makes it easier than ever for you to submit finished 3D models of items or 2D images for a chance to have them accepted and incorporated into the actual game. Not only do makers of chosen items get to see their ideas come to life in Dota 2, they also receive a share of their items'' sales from the Dota 2 store. Additionally, illustrators have the opportunity to create and participate in the revenue of 2D merchandise designs.', 'http://www.dota2.com/workshop/', 0),
(33, 'Dota2 | Watch', 'Watch live streaming Dota 2 matches of the highest possible quality right here!!', 'http://www.dota2.com/watch/', 0);

-- --------------------------------------------------------

--
-- Table structure for table `querytable`
--

CREATE TABLE `querytable` (
  `PageId` int(11) NOT NULL,
  `K1` text NOT NULL,
  `K2` text NOT NULL,
  `K3` text NOT NULL,
  `K4` text NOT NULL,
  `K5` text NOT NULL,
  `OtherKeywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `querytable`
--

INSERT INTO `querytable` (`PageId`, `K1`, `K2`, `K3`, `K4`, `K5`, `OtherKeywords`) VALUES
(1, 'Indian Institute Of Information Technology Allahabad', 'IIITA', 'Information Technology', 'Placements', 'Faculty', 'Institute'),
(2, 'Google', 'Search Engine', 'Gmail', 'Research', 'Alphabet', 'Android'),
(3, 'Facebook', 'fb', 'Social Media', 'Chat', 'Mark Zuckerberg', 'Post'),
(4, 'Youtube', 'Videos', 'Media', 'youtubers', 'viral', 'vevo');

-- --------------------------------------------------------

--
-- Table structure for table `resulttable`
--

CREATE TABLE `resulttable` (
  `Pageid` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Description` text NOT NULL,
  `Url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `Id` int(11) NOT NULL,
  `IP` varchar(20) NOT NULL,
  `Query` text NOT NULL,
  `Time` datetime NOT NULL,
  `Count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`Id`, `IP`, `Query`, `Time`, `Count`) VALUES
(1, '172.19.14.152', 'TOI news', '2016-04-06 06:01:24', 2),
(2, '172.19.14.153', 'Apple iPhone', '2016-04-06 06:02:15', 3),
(3, '172.19.17.57', 'Google', '2016-04-11 10:11:43', 5),
(4, '172.19.18.130', 'IIITA', '2016-04-11 06:28:15', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pagetable`
--
ALTER TABLE `pagetable`
  ADD PRIMARY KEY (`PageId`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pagetable`
--
ALTER TABLE `pagetable`
  MODIFY `PageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
