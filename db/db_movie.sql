/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : db_movie

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 14/05/2021 21:19:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for movies
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `movieName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影名称',
  `director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导演',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时长',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言',
  `publishDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首映日期',
  `boxOffice` decimal(10, 0) NULL DEFAULT NULL COMMENT '总票房',
  `ticketPrice` decimal(10, 0) NULL DEFAULT NULL COMMENT '票价',
  `session` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场次',
  `videoHall` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放映厅',
  `imgpath` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影简介',
  `hot` int(11) NULL DEFAULT NULL COMMENT '热度',
  `iszsqd` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否最受期待',
  `ishprc` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否好评如潮',
  `isjrpf` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否今日票房',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES (4, '你的婚礼', '韩天', '125分钟', '日语', '2021-05-05', 10000, 88, NULL, NULL, 'https://p1.meituan.net/movie/5778f9b9f2909ba55eb99bec059cb5d22333886.jpg@464w_644h_1e_1c', '那个陪你穿校服的人，最后陪你走到了婚礼吗？电影《你的婚礼》讲述游泳特长生周潇齐与转校生尤咏慈长达15年的爱情故事。高中时，周潇齐（许光汉饰）对尤咏慈（章若楠饰）一见钟情，年少懵懂的纯纯爱恋，男孩默默守护，但女孩却不告而别。此后的人生，15年的爱情长跑。你的婚礼，也是我的成人礼。', NULL, '1', '1', '1', '2021-05-05 18:41:26');
INSERT INTO `movies` VALUES (5, '悬崖之上', '张艺谋', '120分钟', '中文', '2021-04-30中国大陆上映', 74300, 35, NULL, NULL, 'https://p0.meituan.net/movie/3ad18f011110130e927d50046fde86f71038961.jpg@464w_644h_1e_1c', '上世纪三十年代，四位曾在苏联接受特训的共产党特工组成任务小队，回国执行代号为“乌特拉”的秘密行动。由于叛徒的出卖，他们从跳伞降落的第一刻起， 就已置身于敌人布下的罗网之中。同志能否脱身，任务能否完成，雪一直下，立于“悬崖之上”的行动小组面临严峻考验。', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `movies` VALUES (6, '追虎擒龙', '王晶', '105分钟', '粤语', '2021-05-01中国大陆上映', 20000, 38, NULL, NULL, 'https://p0.meituan.net/movie/67a1fe8a23b913b305a37fed1c54b7a35019988.jpg@464w_644h_1e_1c', '故事讲述 1973 年香港警黑勾结， 在英国人指使下贪污巨利，荼毒市民。港督成立廉政公署，最先两位检察官为黑白双煞 （古天乐、林家栋）历尽千辛万苦调查权倾黑白两道的总华探长徐乐（吴镇宇）及跛豪（梁家辉），终把二人绳之以法的故事。', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `movies` VALUES (7, '扫黑·决战', '吕聿来', '112分钟', '中文', '2021-05-01中国大陆上映', 21100, 29, NULL, NULL, 'https://p0.meituan.net/moviemachine/3084e88f63eef2c6a0df576153a3fad0327782.jpg@464w_644h_1e_1c', '该片是国内首部以“扫黑除恶”行动为题材、展现全国扫黑办督办案件的影视化作品，讲述某扫黑专案组组长宋一锐带领组员由一起征地案深入调查，突破层层阻挠，与幕后的黑恶势力展开激烈斗争，最终揭开腐败官员利用公职权力充当犯罪保护伞的虚伪面具，将犯罪分子绳之以法的故事。', NULL, NULL, '1', NULL, '2021-05-11 23:00:48');
INSERT INTO `movies` VALUES (8, '士兵顺溜：兵王争锋', '卢德响', '83分钟', '中文', '2021-05-10中国大陆重映', 5000, 28, NULL, NULL, 'https://p0.meituan.net/movie/4bf6de3489285d56a42044cd36791fea4233338.jpg@464w_644h_1e_1c', '电影改编自现役王牌部队90后新兵的真实故事。自小怀揣“兵王梦”的顺溜，在角逐新一届“特种兵王”的过程中，遭遇了最大的劲敌，争夺兵王之路困难重重，巅峰对决一触即发。危机之时，边境突发武装冲突，以顺溜为首的几人从赛场直接奔赴战场。他们能顺利完成任务吗？谁才是真正的“兵王”？', NULL, '1', '1', '1', '2021-05-11 23:00:46');
INSERT INTO `movies` VALUES (10, '你好，李焕英', '贾玲', '128分钟', '中文', '2021-02-12中国大陆上映', 541300, 29, NULL, NULL, 'https://p0.meituan.net/movie/48774506dc0e68805bc25d2cd087d1024316392.jpg@464w_644h_1e_1c', '2001年的某一天，刚刚考上大学的贾晓玲（贾玲 饰）经历了人生中的一次大起大落。一心想要成为母亲骄傲的她却因母亲突遭严重意外，而悲痛万分。在贾晓玲情绪崩溃的状态下，竟意外的回到了 1981 年，并与年轻的母亲李焕英（张小斐 饰）相遇，二人形影不离，宛如闺蜜。与此同时，也结识了一群天真善良的好朋友。晓玲以为来到了这片“广阔天地”，她可以凭借自己超前的思维，让母亲“大有作为”，但结果却让晓玲感到意外......', NULL, '1', '1', NULL, '2021-05-11 23:00:44');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `publishdate` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '测试', '测试', '2021-05-08 08:03:20', '张安');
INSERT INTO `news` VALUES (2, '四川省邮管局通报快递企业寄递活体物调查情况 已约谈中通快递', '<p class=\"contentFont\" style=\"text-align: justify;\">5<u>月7日，四川省邮政管理局通报</u>了快<b>递企业寄递活体物的调查</b>情况。北青-北京头条记者了解到，四川省邮政管理局、成都市邮政管理局已联合约谈中通快递四川区域总部，要求全面自查、严格整改。</p><p class=\"contentFont\" style=\"text-align: justify;\">根据四川省邮政局通报，2021年5月3日晚19:30，中通快递成都市荷花池网点（四川佳慧物流有限公司）揽收的177件快件（后发现为活体猫36只、狗141只），由成都发往外地。19:50，该批快件被动物保护人士拦截。5月4日凌晨5点，农业农村部门和爱心人士将该批动物运往成都市石板滩宠物市场代管，农业农村部门检疫人员对涉事犬猫进行检疫检查。</p><p class=\"contentFont\" style=\"text-align: justify;\">获悉相关信息后，四川省邮政管理部门高度重视。<a target=\"_self\" href=\"http://www.baidu.com\">http://www.baidu.com<img src=\"http://localhost:803/images/face/1.gif\" alt=\"[嘻嘻]\"><img src=\"http://localhost:803/images/face/1.gif\" alt=\"[嘻嘻]\"></a>henhao</p><p class=\"contentFont\" style=\"text-align: justify;\">由成都市邮政管理局对涉嫌违法寄递的企业进行立案调查，调查处理结果将及时公布。</p><p class=\"contentFont\" style=\"text-align: justify;\">四川省邮政管理局、成都市邮政管理局已联合约谈中通快递四川区域总部，要求全面自查、严格整改。目前中通快递已从以下几方面开展整改：5月5日起，成都市荷花池中通快递网点暂停快件揽收业务，全面自查，并配合相关部门调查；立即对基层网点开展“邮路安全培训”、“三项制度培训”、“《国家保护动物目录》培训”、“邮路禁寄物品目录培训”等专项培训；要求所有网点加大大客户快件检查力度，提高抽检比例；加大网点暗访检查，严格要求网点落实“三项制度”。</p><p class=\"contentFont\" style=\"text-align: justify;\">在全省邮政快递行业开展进一步规范活体动物寄递、严厉打击非法寄递野生动物及其制品行为的专项行动。宣传贯彻《动物防疫法》《禁止寄递物品管理规定》等法律法规，督促企业全面落实禁止限制寄递物品规定，落实安全生产主体责任，严格执行“收寄验视+实名收寄+过机安检”三项制度，加强寄递渠道安全监管。配合农业农村、商务等部门，加强活体动物检疫、销售等环节的监管，保障公共安全。</p><p class=\"contentFont\" style=\"text-align: justify;\">四川省邮政管理局市场监管处提醒，寄递符合相关规定的活体动物，一定要提供检疫证明，并保障活体动物的生命安全，不对社会造成危害。同时，呼吁广大消费者和电商平台，倡导文明健康的消费；寄递企业要担当社会责任，做文明健康消费的促进者，对违背社会公序良俗的消费行为予以坚决抵制。</p><p class=\"contentFont\" style=\"text-align: justify;\">文/北京青年报记者 张鑫</p><p><img border=\"0\" src=\"https://image.ynet.cn/2021/05/07/836d8ec4a9c36245cb394e418c0058b9_480x-_80.jpg\" data-width=\"480px\" data-height=\"318px\" data-index=\"0\"></p>', '2021-05-08 08:30:46', '李四');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `movieid` int(11) NULL DEFAULT NULL COMMENT '电影ID',
  `moviename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影名',
  `seat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座位编号',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已付钱',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 4, '你的婚礼', '2座', '0', '2021-05-13 19:37:13');
INSERT INTO `orders` VALUES (2, 4, '你的婚礼', '4座', '0', '2021-05-13 19:40:26');
INSERT INTO `orders` VALUES (3, 4, '你的婚礼', '9座', '0', '2021-05-13 19:43:10');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `movieid` int(11) NULL DEFAULT NULL COMMENT '电影ID',
  `moviename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影名称',
  `seat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座位编号',
  `occupy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否被占用',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出票状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影票' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (1, 4, '你的婚礼', '1座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (2, 4, '你的婚礼', '2座', '售出座位', '待出票');
INSERT INTO `ticket` VALUES (3, 4, '你的婚礼', '3座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (4, 4, '你的婚礼', '4座', '售出座位', '待出票');
INSERT INTO `ticket` VALUES (5, 4, '你的婚礼', '5座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (6, 4, '你的婚礼', '6座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (7, 4, '你的婚礼', '7座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (8, 4, '你的婚礼', '8座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (9, 4, '你的婚礼', '9座', '售出座位', '待出票');
INSERT INTO `ticket` VALUES (10, 4, '你的婚礼', '10座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (11, 4, '你的婚礼', '11座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (12, 4, '你的婚礼', '12座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (13, 4, '你的婚礼', '13座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (14, 4, '你的婚礼', '14座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (15, 4, '你的婚礼', '15座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (16, 4, '你的婚礼', '16座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (17, 4, '你的婚礼', '17座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (18, 4, '你的婚礼', '18座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (19, 4, '你的婚礼', '19座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (20, 4, '你的婚礼', '20座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (21, 4, '你的婚礼', '21座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (22, 4, '你的婚礼', '22座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (23, 4, '你的婚礼', '23座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (24, 4, '你的婚礼', '24座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (25, 4, '你的婚礼', '25座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (26, 4, '你的婚礼', '26座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (27, 4, '你的婚礼', '27座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (28, 4, '你的婚礼', '28座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (29, 4, '你的婚礼', '29座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (30, 4, '你的婚礼', '30座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (31, 4, '你的婚礼', '31座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (32, 4, '你的婚礼', '32座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (33, 4, '你的婚礼', '33座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (34, 4, '你的婚礼', '34座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (35, 4, '你的婚礼', '35座', '空余座位', '待出票');
INSERT INTO `ticket` VALUES (36, 4, '你的婚礼', '36座', '空余座位', '待出票');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `auth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色：注册用户、管理员',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '123', '管理员', NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'cuihua', '123', '注册用户', NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 'zhangsan', '123', '注册用户', NULL, NULL, NULL);
INSERT INTO `users` VALUES (4, 'lisi', '123', '注册用户', NULL, NULL, NULL);
INSERT INTO `users` VALUES (5, 'wangwu', '123', '注册用户', NULL, NULL, NULL);
INSERT INTO `users` VALUES (6, 'zhaoliu', '123', '注册用户', NULL, NULL, NULL);
INSERT INTO `users` VALUES (7, 'maqi', '123', '注册用户', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
