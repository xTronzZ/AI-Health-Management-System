/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : db_health

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 15/03/2025 20:03:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sport_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `disease` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `method` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `notes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES (1, 'Gymnastics', 'Heart Disease', 'Moderate exercise, avoid intense activity, maintain a cheerful mood', 'Avoid exercising in extremely high or low temperatures');
INSERT INTO `detail` VALUES (2, 'Tai Chi', 'Hypertension', 'Gentle movements, slow and steady breathing', 'Maintain emotional stability, avoid excessive tension');
INSERT INTO `detail` VALUES (3, 'Sprint', 'Arthritis', 'Choose running tracks or soft surfaces, warm up properly', 'Avoid excessive impact, pay attention to diet, maintain a healthy weight');
INSERT INTO `detail` VALUES (4, 'Jogging', 'Asthma', 'Avoid exercising in smoggy weather or extreme temperatures', 'Control breathing, use appropriate protective gear');
INSERT INTO `detail` VALUES (6, 'Diabolo', 'Eye Disease', 'Rest and protect the eyes, avoid staring at the diabolo for too long', 'Avoid playing in dimly lit environments');
INSERT INTO `detail` VALUES (7, 'Top Spinning', 'Hypertension', 'Avoid intense activity, do not exercise in high-altitude or steep areas', 'Avoid exercising in extremely high or low temperatures');
INSERT INTO `detail` VALUES (8, 'Tug of War', 'Heart Disease', 'Avoid excessive exertion, maintain stable breathing', 'Ensure balanced team numbers, avoid too few or too many participants');
INSERT INTO `detail` VALUES (9, 'Volleyball', 'Sprain', 'Warm up properly, keep muscles flexible', 'Avoid hard or slippery surfaces, pay attention to landing posture');
INSERT INTO `detail` VALUES (10, 'Kite Flying', 'Allergic Rhinitis', 'Avoid flying kites during high pollen seasons or in heavily polluted areas', 'Choose clean air locations, avoid flying in strong winds');
INSERT INTO `detail` VALUES (11, 'Rugby', 'Fracture', 'Use proper protective gear, avoid overly rigid balls', 'Follow standard game procedures, avoid intense physical confrontations');
INSERT INTO `detail` VALUES (12, 'Swimming', 'Heart Disease, Arrhythmia, Asthma, Hypertension', 'Swimming is a full-body exercise, but for individuals with heart disease, arrhythmia, or asthma, it may worsen the condition or trigger sudden episodes and should be avoided. Those with hypertension may swim moderately, but duration and intensity should be limited.', 'Ensure safety while swimming to prevent drowning; maintain pool hygiene to avoid infections');
INSERT INTO `detail` VALUES (13, 'Ice Skating', 'Fracture, Arthritis, Heart Disease, Hypertension', 'Ice skating is high-risk and may cause fractures or arthritis. People with heart disease or hypertension should protect themselves and avoid intense activity.', 'Wear protective gear, monitor physical condition, avoid overexertion');
INSERT INTO `detail` VALUES (14, 'Mountain Climbing', 'Hypertension, Heart Disease, Cerebrovascular Disease', 'Choose gentle slopes, avoid steep paths; master proper breathing techniques to prevent hypoxia', 'Avoid overexertion, stay hydrated and energized; monitor weather conditions and avoid climbing in fog, wind, or thunderstorms');
INSERT INTO `detail` VALUES (15, 'Yoga', 'Spinal Disease, Knee Injury, Joint Disorders', 'Choose poses suitable for your physical condition; breathe naturally, avoid breath-holding or over-breathing; perform movements accurately to prevent unnecessary strain or injury', 'Pay attention to diet and bowel movements before practice; avoid practicing on an empty or full stomach; maintain a quiet environment; rest appropriately after practice');
INSERT INTO `detail` VALUES (16, 'Basketball', 'Heart Disease, Cerebrovascular Disease, Fracture', 'Maintain moderate physical activity, avoid overexertion; learn proper basketball techniques to prevent injury; follow rules and prioritize safety during games', 'Schedule training reasonably, avoid overtraining; use protective gear; ensure adequate nutrition');
INSERT INTO `detail` VALUES (17, 'Tennis', 'Shoulder Injury, Wrist Pain, Dislocation', 'Master correct serving and hitting techniques; strengthen muscles to improve joint flexibility; rest adequately to avoid fatigue', 'Choose suitable rackets and shoes; keep the court dry to prevent slipping; get regular checkups to detect issues early');
INSERT INTO `detail` VALUES (18, 'Badminton', 'Muscle Strain', 'Gradually increase training intensity, warm up and rest adequately, avoid overexertion', 'Ensure proper nutrition and sleep, avoid fatigue and hypoxia');
INSERT INTO `detail` VALUES (19, 'Trail Running', 'Knee Pain', 'Choose soft surfaces, strengthen muscles around the knee joint', 'Maintain balanced nutrition and diet, avoid excessive weight loss and hypoxia');
INSERT INTO `detail` VALUES (20, 'Soccer', 'Knee Pain', 'Choose soft surfaces, strengthen muscles around the knee joint', 'Maintain balanced nutrition and diet, avoid excessive weight loss and hypoxia');
INSERT INTO `detail` VALUES (21, 'Taekwondo', 'Sprain, Strain', 'Gradually increase training intensity, warm up and rest adequately, avoid overexertion', 'Ensure proper nutrition and sleep, avoid fatigue and hypoxia');
INSERT INTO `detail` VALUES (22, 'Running', 'Knee Pain', 'Choose soft surfaces, strengthen muscles around the knee joint', 'Maintain balanced nutrition and diet, avoid excessive weight loss and hypoxia');
INSERT INTO `detail` VALUES (23, 'Diving', 'Spinal Injury', 'Pay attention to technical details, gradually increase difficulty, avoid overexertion', 'Consider spinal strength training, strengthen back and waist muscles');
INSERT INTO `detail` VALUES (24, 'Rubber Band Jumping', 'Muscle Strain', 'Gradually increase training intensity, warm up and rest adequately, avoid overexertion', 'Ensure proper nutrition and sleep, avoid fatigue and hypoxia');
INSERT INTO `detail` VALUES (25, 'Jump Rope', 'Knee or Ankle Pain, Muscle Soreness, Sports Injury', 'Hold the rope and alternate foot jumps; the winner is the one with the most jumps in a set time', 'Pay attention to posture and breathing during jump rope');
INSERT INTO `detail` VALUES (26, 'High Jump', 'Sprain, Muscle Strain, Lumbar Disc Herniation, Arthritis', 'Also known as high jump bar; athletes run up and jump over a horizontal bar at increasing heights. Those who fail to clear are eliminated.', 'Pay attention to the runway, approach, and jumping posture');
INSERT INTO `detail` VALUES (27, 'Shuttlecock Kicking', 'Sprain, Strain', 'Kick the shuttlecock and perform a series of moves in the air; the winner is the one with the most moves in a set time', 'Pay attention to shuttlecock quality and weather conditions');
INSERT INTO `detail` VALUES (28, 'Long-distance Running', 'Heart Disease, Hypertension, Asthma, COPD', 'An aerobic endurance sport; participants must complete a set distance within a specified time', 'Pay attention to breathing and hydration during long-distance running');
-- ----------------------------
-- Table structure for j_body
-- ----------------------------
DROP TABLE IF EXISTS `j_body`;
CREATE TABLE `j_body`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `height` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `bloodSugar` float NULL DEFAULT NULL,
  `bloodPressure` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bloodLipid` float NULL DEFAULT NULL,
  `heart_rate` decimal(10, 0) NULL DEFAULT NULL,
  `vision` int NULL DEFAULT NULL,
  `sleep_duration` decimal(10, 0) NULL DEFAULT NULL,
  `sleep_quality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `smoking` tinyint(1) NULL DEFAULT NULL,
  `drinking` tinyint(1) NULL DEFAULT NULL,
  `exercise` tinyint(1) NULL DEFAULT NULL,
  `food_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `water_consumption` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of j_body
-- ----------------------------
INSERT INTO `j_body` VALUES (1, 'admin', 18, 'male', 1.8, 50, 25, '16', 25, 80, 220, 8, 'Good', 0, 0, 0, 'Vegetables', 1500);
INSERT INTO `j_body` VALUES (13, 'Alice', 18, 'male', 1.8, 50, 20, '24', 15, 65, 200, 8, 'Good', 0, 0, 0, 'Fruits', 1500);
INSERT INTO `j_body` VALUES (33, 'aaa', 18, 'male', 181, 60, 60, '60', 60, 60, 30, 3, 'Good', 0, 0, 0, 'Beans', 20);

-- ----------------------------
-- Table structure for j_body_notes
-- ----------------------------
DROP TABLE IF EXISTS `j_body_notes`;
CREATE TABLE `j_body_notes`  (
  `notes_id` int NOT NULL AUTO_INCREMENT,
  `id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `height` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `bloodSugar` float NULL DEFAULT NULL,
  `bloodPressure` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bloodLipid` float NULL DEFAULT NULL,
  `heart_rate` decimal(10, 0) NULL DEFAULT NULL,
  `vision` int NULL DEFAULT NULL,
  `sleep_duration` decimal(10, 0) NULL DEFAULT NULL,
  `sleep_quality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `smoking` tinyint(1) NULL DEFAULT NULL,
  `drinking` tinyint(1) NULL DEFAULT NULL,
  `exercise` tinyint(1) NULL DEFAULT NULL,
  `food_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `water_consumption` decimal(10, 0) NULL DEFAULT NULL,
  `Date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notes_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of j_body_notes
-- ----------------------------
INSERT INTO `j_body_notes` VALUES (20, 13, 'Alice', 25, 'male', 1.8, 80, 20, '20', 20, 100, 100, 9, 'Good', 0, 0, 0, 'Beans', 3000, '2025-02-15 06:01:06');
INSERT INTO `j_body_notes` VALUES (21, 13, 'Alice', 25, 'male', 1.8, 80, 20, '25', 23, 80, 120, 9, 'Good', 0, 0, 0, 'Beans', 3000, '2025-02-16 06:01:52');
INSERT INTO `j_body_notes` VALUES (25, 1, 'admin', 20, 'male', 1.7, 56, 10, '15', 20, 80, 20, 10, 'Good', 1, 1, 1, '鱼类', 1500, '2025-02-18 17:36:29');
INSERT INTO `j_body_notes` VALUES (26, 1, 'admin', 20, 'male', 1.7, 56, 8, '13', 20, 120, 50, 10, 'Good', 1, 1, 1, '鱼类', 1500, '2025-02-25 17:36:31');
INSERT INTO `j_body_notes` VALUES (27, 1, 'admin', 20, 'male', 1.7, 56, 15, '20', 20, 70, 65, 10, 'Good', 1, 1, 1, '鱼类', 1500, '2025-03-01 17:36:32');
INSERT INTO `j_body_notes` VALUES (28, 1, 'admin', 20, 'male', 1.7, 56, 21, '8', 20, 80, 75, 10, 'Good', 1, 1, 1, '鱼类', 1500, '2025-03-03 17:36:34');
INSERT INTO `j_body_notes` VALUES (29, 1, 'admin', 20, 'male', 1.7, 56, 15, '10', 20, 110, 80, 10, 'Good', 1, 1, 1, '鱼类', 1500, '2025-03-06 17:36:38');
INSERT INTO `j_body_notes` VALUES (30, 1, 'admin', 20, 'male', 1.7, 56, 17, '16', 20, 75, 120, 10, 'Good', 1, 1, 1, '鱼类', 1500, '2025-03-07 17:36:40');
INSERT INTO `j_body_notes` VALUES (31, 1, 'admin', 20, 'male', 1.7, 56, 8, '25', 20, 130, 150, 10, 'Good', 1, 1, 1, '鱼类', 1500, '2025-03-08 17:36:43');
INSERT INTO `j_body_notes` VALUES (32, 1, 'admin', 20, 'male', 1.7, 56, 11, '7', 20, 80, 150, 10, 'Good', 0, 0, 0, '鱼类', 1500, '2025-03-09 17:36:45');
INSERT INTO `j_body_notes` VALUES (38, 13, 'Alice', 25, 'male', 1.8, 80, 26, '21', 23, 90, 140, 9, 'Good', 0, 0, 0, 'Beans', 3000, '2025-03-10 06:01:52');
INSERT INTO `j_body_notes` VALUES (39, 13, 'Alice', 25, 'male', 1.8, 80, 26, '16', 18, 79, 160, 9, 'Good', 0, 0, 0, 'Beans', 3000, '2025-03-11 06:01:52');
INSERT INTO `j_body_notes` VALUES (40, 13, 'Alice', 18, 'male', 1.8, 50, 20, '24', 15, 65, 200, 8, 'Good', 0, 0, 0, 'Fruits', 1500, '2025-03-12 15:15:17');
INSERT INTO `j_body_notes` VALUES (41, 1, 'admin', 18, 'male', 1.8, 50, 25, '16', 25, 80, 220, 8, 'Good', 0, 0, 0, 'Vegetables', 1500, '2025-03-13 15:23:27');
INSERT INTO `j_body_notes` VALUES (44, 33, 'aaa', 18, 'male', 180, 50, 50, '50', 50, 100, 50, 6, 'Good', 0, 0, 0, 'Grains', 50, '2025-03-15 19:07:39');
INSERT INTO `j_body_notes` VALUES (45, 33, 'aaa', 18, 'male', 181, 60, 60, '60', 60, 60, 30, 3, 'Good', 0, 0, 0, 'Beans', 20, '2025-03-16 19:08:25');

-- ----------------------------
-- Table structure for j_menu
-- ----------------------------
DROP TABLE IF EXISTS `j_menu`;
CREATE TABLE `j_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  `is_leaf` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hidden` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of j_menu
-- ----------------------------
INSERT INTO `j_menu` VALUES (1, 'Layout', '/sys', '/sys/user', 'sysManage', 'System Management', 'el-icon-s-order\r\n', 0, 'N', 0);
INSERT INTO `j_menu` VALUES (2, 'sys/user', 'user', NULL, 'userList', 'User Management', 'user', 1, 'Y', 0);
INSERT INTO `j_menu` VALUES (3, 'sys/role', 'role', NULL, 'roleList', 'Role Management', 'el-icon-user', 1, 'Y', 0);
INSERT INTO `j_menu` VALUES (4, 'Layout', '/test', '/test/test1', 'test', 'System Functions', 'form', 0, 'N', 0);
INSERT INTO `j_menu` VALUES (5, 'test/test1', 'test1', '', 'test1', 'Body Information Upload', 'form', 4, 'Y', 0);
INSERT INTO `j_menu` VALUES (6, 'test/test2', 'test2', '', 'test2', 'Health Assessment', 'el-icon-first-aid-kit', 4, 'Y', 0);
INSERT INTO `j_menu` VALUES (7, 'test/test3', 'test3', '', 'test3', 'Exercise Knowledge', 'el-icon-s-opportunity\r\n', 4, 'Y', 0);
INSERT INTO `j_menu` VALUES (8, 'sys/sportDetails', 'sportDetails', '', 'sportDetails', 'Exercise Knowledge管理', 'el-icon-s-opportunity\r\nel-icon-s-custom', 1, 'Y', 0);
INSERT INTO `j_menu` VALUES (9, 'sys/DetailsManage', 'DetailsManage', NULL, 'DetailsManage', 'Exercise Details Management', 'el-icon-s-check', 1, 'Y', 0);
INSERT INTO `j_menu` VALUES (10, 'sys/userBodyManage', 'userBodyManage', NULL, 'userBodyManage', 'User Body Information Management', 'el-icon-s-check', 1, 'Y', 0);
INSERT INTO `j_menu` VALUES (11, 'test/bodyManage', 'bodyManage', NULL, 'bodyManage', 'Body Information Management', 'el-icon-s-check', 4, 'Y', 0);
INSERT INTO `j_menu` VALUES (12, 'ai/assistant', 'assistant', NULL, '\'aiAssistant', 'AI Assistant', 'el-icon-s-help', 0, 'Y', 0);

-- ----------------------------
-- Table structure for j_role
-- ----------------------------
DROP TABLE IF EXISTS `j_role`;
CREATE TABLE `j_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of j_role
-- ----------------------------
INSERT INTO `j_role` VALUES (1, 'admin', 'Administrator');
INSERT INTO `j_role` VALUES (3, 'normal', 'User');

-- ----------------------------
-- Table structure for j_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `j_role_menu`;
CREATE TABLE `j_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL,
  `menu_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of j_role_menu
-- ----------------------------
INSERT INTO `j_role_menu` VALUES (179, 3, 4);
INSERT INTO `j_role_menu` VALUES (180, 3, 5);
INSERT INTO `j_role_menu` VALUES (181, 3, 6);
INSERT INTO `j_role_menu` VALUES (182, 3, 7);
INSERT INTO `j_role_menu` VALUES (183, 3, 11);
INSERT INTO `j_role_menu` VALUES (184, 1, 1);
INSERT INTO `j_role_menu` VALUES (185, 1, 2);
INSERT INTO `j_role_menu` VALUES (186, 1, 3);
INSERT INTO `j_role_menu` VALUES (187, 1, 8);
INSERT INTO `j_role_menu` VALUES (188, 1, 9);
INSERT INTO `j_role_menu` VALUES (189, 1, 10);
INSERT INTO `j_role_menu` VALUES (190, 1, 4);
INSERT INTO `j_role_menu` VALUES (191, 1, 5);
INSERT INTO `j_role_menu` VALUES (192, 1, 6);
INSERT INTO `j_role_menu` VALUES (193, 1, 7);
INSERT INTO `j_role_menu` VALUES (194, 1, 11);

-- ----------------------------
-- Table structure for j_user
-- ----------------------------
DROP TABLE IF EXISTS `j_user`;
CREATE TABLE `j_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of j_user
-- ----------------------------
INSERT INTO `j_user` VALUES (1, 'java1234', '123456', '13343243242', NULL, 'super@aliyun.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (2, 'zhangsan', '123456', NULL, NULL, 'zhangsan@gmail.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 1);
INSERT INTO `j_user` VALUES (3, 'lisi', '123456', NULL, NULL, 'lisi@gmail.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 1);
INSERT INTO `j_user` VALUES (4, 'wangwu', '123456', NULL, NULL, 'wangwu@gmail.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 1);
INSERT INTO `j_user` VALUES (5, 'zhaoer', '123456', NULL, NULL, 'zhaoer@gmail.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 1);
INSERT INTO `j_user` VALUES (6, 'songliu', '123456', '4322432434', NULL, 'songliu@gmail.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (13, 'Alice', '123456', '234532111', NULL, 'alice@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (14, 'Bob', '123456', '13564736363', NULL, 'bob@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (15, 'Charlie', '123456', '25323626', NULL, 'charlie@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (16, 'David1', '123456', '145256264', NULL, 'david@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (17, 'Emma', '123456', '152334445', NULL, 'emma@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (18, 'Frank', '123456', '1566543646', NULL, 'frank@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (19, 'Grace', '123456', '1435253535', NULL, 'grace@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (20, 'Henry', '123456', '15325363463', NULL, 'henry@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (21, 'Isabella', '123456', '15353435', NULL, 'isabella@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (22, 'Jacob', '123456', '114523424', NULL, 'jacob@example.com', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);
INSERT INTO `j_user` VALUES (32, 'text', '123456', '11111111111', NULL, '1111111111@163.com', 'https://bpic.51yuansu.com/pic2/cover/00/35/43/58119f542530c_610.jpg', 0);
INSERT INTO `j_user` VALUES (33, 'aaa', '123456', NULL, NULL, '', 'https://img2.baidu.com/it/u=3618236253,1028428296&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 0);

-- ----------------------------
-- Table structure for j_user_role
-- ----------------------------
DROP TABLE IF EXISTS `j_user_role`;
CREATE TABLE `j_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of j_user_role
-- ----------------------------
INSERT INTO `j_user_role` VALUES (12, 11, 3);
INSERT INTO `j_user_role` VALUES (13, 12, 1);
INSERT INTO `j_user_role` VALUES (45, 54, 3);
INSERT INTO `j_user_role` VALUES (46, 55, 3);
INSERT INTO `j_user_role` VALUES (47, 56, 3);
INSERT INTO `j_user_role` VALUES (49, 1, 1);
INSERT INTO `j_user_role` VALUES (50, 6, 1);
INSERT INTO `j_user_role` VALUES (51, 13, 3);
INSERT INTO `j_user_role` VALUES (52, 14, 1);
INSERT INTO `j_user_role` VALUES (53, 29, 3);
INSERT INTO `j_user_role` VALUES (56, 31, 3);
INSERT INTO `j_user_role` VALUES (58, 32, 1);
INSERT INTO `j_user_role` VALUES (59, 33, 1);

-- ----------------------------
-- Table structure for sport_info
-- ----------------------------
DROP TABLE IF EXISTS `sport_info`;
CREATE TABLE `sport_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sport_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `suitable_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `suitable_heart_rate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `suitable_frequency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recommended_speed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sport_info
-- ----------------------------
INSERT INTO `sport_info` VALUES (1, 'Trail Running', '33 minutes', '130-160 times/min', '3-4 times/week', '8km/h');
INSERT INTO `sport_info` VALUES (3, 'Yoga', '60 minutes', '90-110 times/min', '1-2 times/week', 'None');
INSERT INTO `sport_info` VALUES (4, 'Badminton', '120 minutes', '130-150 times/min', '3-4 times/week', 'None');
INSERT INTO `sport_info` VALUES (5, 'Jogging', '60 minutes', '130-150 times/min', '3-4 times/week', '8km/h');
INSERT INTO `sport_info` VALUES (10, 'Running', '45 minutes', '140-160 times/min', '4-5 times/week', '10km/h');
INSERT INTO `sport_info` VALUES (13, 'Tai Chi', '60 minutes', '80-100 times/min', '3-4 times/week', 'None');
INSERT INTO `sport_info` VALUES (14, 'Soccer', '90minutes', '130-150times/min', '2-3times/week', 'None');
INSERT INTO `sport_info` VALUES (15, 'Sprint', '30minutes', '130-150times/min', '5-6times/week', '13km/h');
INSERT INTO `sport_info` VALUES (16, 'Mountain Climbing', '60minutes', '130-150times/min', '2-3times/week', '5km/h');
INSERT INTO `sport_info` VALUES (18, 'Swimming', '45minutes', '120-140times/min', '3-4times/week', '2.5km/h');
INSERT INTO `sport_info` VALUES (19, 'Basketball', '120minutes', '130-150times/min', '1-2times/week', 'None');
INSERT INTO `sport_info` VALUES (20, 'Volleyball', '1小时', '100-120次/minutes', '2-3times/week', 'None');
INSERT INTO `sport_info` VALUES (21, 'Tennis', '1.5小时', '100-130次/minutes', '2-3times/week', 'None');
INSERT INTO `sport_info` VALUES (22, 'Ice Skating', '1小时', '100-120次/minutes', '2-3times/week', '10-15千米/小时');
INSERT INTO `sport_info` VALUES (23, 'Long-distance Running', '30minutes-1小时', '120-160次/minutes', '3-4times/week', '10-15千米/小时');
INSERT INTO `sport_info` VALUES (24, 'Rugby', '1.5-2小时', '100-120次/minutes', '2-3times/week', 'None');
INSERT INTO `sport_info` VALUES (25, 'Taekwondo', '1小时', '120-140次/minutes', '3-4times/week', 'None');
INSERT INTO `sport_info` VALUES (26, 'Gymnastics', '1-2小时', '100-120次/minutes', '3-4times/week', 'None');
INSERT INTO `sport_info` VALUES (27, 'High Jump', '1小时', '120-160次/minutes', '2-3times/week', 'None');
INSERT INTO `sport_info` VALUES (28, 'Diving', '1小时', '120-160次/minutes', '2-3times/week', 'None');
INSERT INTO `sport_info` VALUES (29, 'Rubber Band Jumping', '30minutes-1小时', '100-120次/minutes', '3-4times/week', 'None');
INSERT INTO `sport_info` VALUES (30, 'Jump Rope', '30minutes-1小时', '120-160次/minutes', '3-4times/week', 'None');
INSERT INTO `sport_info` VALUES (31, 'Shuttlecock Kicking', '30minutes-1小时', '100-120次/minutes', '3-4times/week', 'None');
INSERT INTO `sport_info` VALUES (32, 'Kite Flying', '1-2小时', '80-100次/minutes', '1-2times/week', 'None');
INSERT INTO `sport_info` VALUES (33, 'Tug of War', '30minutes-1小时', '100-120次/minutes', '2-3times/week', 'None');
INSERT INTO `sport_info` VALUES (34, 'Top Spinning', '30minutes-1小时', '80-100次/minutes', '1-2times/week', 'None');
INSERT INTO `sport_info` VALUES (35, 'Diabolo', '30minutes-1小时', '80-100次/minutes', '1-2times/week', 'None');
INSERT INTO `sport_info` VALUES (36, 'Sandbag Throwing', '30minutes-1小时', '100-120次/minutes', '2-3times/week', 'None');

SET FOREIGN_KEY_CHECKS = 1;
