/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.28 : Database - db_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_blog`;

/*Table structure for table `t_blog` */

DROP TABLE IF EXISTS `t_blog`;

CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客类型',
  `title` varchar(200) NOT NULL COMMENT '博客题目',
  `summary` varchar(400) DEFAULT NULL COMMENT '博客摘要',
  `releaseDate` datetime DEFAULT NULL COMMENT '发布日期',
  `clickHit` int(11) DEFAULT NULL COMMENT '评论次数',
  `replyHit` int(11) DEFAULT NULL COMMENT '回复次数',
  `content` text COMMENT '博客内容',
  `keyWord` varchar(200) DEFAULT NULL COMMENT '关键字',
  `type_id` int(11) DEFAULT NULL COMMENT '外键关联博客类别',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_blog_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `t_blog` */

insert  into `t_blog`(`id`,`title`,`summary`,`releaseDate`,`clickHit`,`replyHit`,`content`,`keyWord`,`type_id`) values (36,'JAVA面试中的小知识点','JAVA面试中的小知识点2018-01-23','2018-01-23 00:28:53',1,0,'<p>JAVA面试中的小知识点<br/></p><p><br/></p><p>2018-01-23<br/></p>','JAVA',1),(37,'JAVA面试中的小知识点','JAVA面试中的小知识点2018-01-23','2018-01-23 00:28:59',0,0,'<p>JAVA面试中的小知识点<br/></p><p><br/></p><p>2018-01-23<br/></p>','JAVA',1),(45,'关于延迟发放2017年12月份工资的通知','123','2018-01-24 19:50:29',0,0,'<p>123<br/></p>','',1),(46,'实习第五周32','4321423','2018-01-24 19:54:57',1,0,'<p>4321423<br/></p>','',1),(50,'aaa12','eeeeeaa','2018-01-25 15:50:25',3,0,'<p>eeeeeaa</p>','',1),(55,'333','333222','2018-01-29 15:09:39',7,1,'<p>333222<br/></p>','',1);

/*Table structure for table `t_blogger` */

DROP TABLE IF EXISTS `t_blogger`;

CREATE TABLE `t_blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博主id',
  `username` varchar(50) NOT NULL COMMENT '博主姓名',
  `password` varchar(100) NOT NULL COMMENT '博主密码',
  `profile` text COMMENT '博主信息',
  `nickname` varchar(50) DEFAULT NULL COMMENT '博主昵称',
  `sign` varchar(100) DEFAULT NULL COMMENT '博主签名',
  `imagename` varchar(100) DEFAULT NULL COMMENT '博主头像路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_blogger` */

insert  into `t_blogger`(`id`,`username`,`password`,`profile`,`nickname`,`sign`,`imagename`) values (1,'徐丙鹏','32a311f6c004c62d1e662d5fe900f79b','<p>我是山东交通学院一名学生<br/></p>','小鹏','我的博客啦啦啦','20180122023943.png');

/*Table structure for table `t_blogtype` */

DROP TABLE IF EXISTS `t_blogtype`;

CREATE TABLE `t_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `typeName` varchar(30) DEFAULT NULL COMMENT '博客类别',
  `orderNum` int(11) DEFAULT NULL COMMENT '博客排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_blogtype` */

insert  into `t_blogtype`(`id`,`typeName`,`orderNum`) values (1,'个人',1);

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

insert  into `t_comment`(`id`,`user_ip`,`content`,`comment_date`,`state`,`blog_id`) values (1,'127.0.0.1','魂牵梦萦','2018-01-22 00:00:00',1,35),(2,'127.0.0.1','123123','2018-01-22 16:40:03',2,35),(3,'127.0.0.1','123123','2018-01-22 16:40:44',1,35),(4,'127.0.0.1','3333','2018-01-22 16:46:05',1,35),(5,'127.0.0.1','333222','2018-01-29 16:46:29',1,55);

/*Table structure for table `t_link` */

DROP TABLE IF EXISTS `t_link`;

CREATE TABLE `t_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_link` */

insert  into `t_link`(`id`,`link_name`,`link_url`,`order_num`) values (1,'首页','index.jsp',2),(2,'百度','https://www.baidu.com',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
