--初始设置
INSERT INTO `usr_user` (`ID`, `USER_NAME`, `REAL_NAME`, `PASSWORD`, `SEX`, `MOBILE`, `EMAIL`, `TELEPHONE`, `ADDRESS`, `POSTCODE`, `STATUS`, `ADD_DATE`, `EDIT_DATE`) VALUES
(0, 'system', '系统', 'D5F416F772B0B6073845712F8D10DA1D', '0', '', 'admin@xukea.com', '', '', '', '', now(), NULL);

INSERT INTO `plugin_info` (`CODE`, `NAME`, `VERSION`, `STATUS`, `LEVEL`, `SETUP_DATE`) VALUES ('000', '系统默认', '1.0.0', '1', '0', now());
INSERT INTO `usr_role` (`CODE`, `NAME`, `SHORT_WORD`, `CAN_EDIT`, `CAN_DELET`, `ORDER_IDX`) VALUES ('000', '通用权限',   'PUBLIC_ROLE', 0, 0, 1);
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`, `ORDER_IDX`) VALUES ('000', '首页',     'MAIN_INDEX', '/index', '000', 1);
INSERT INTO `usr_mdl_group` (`CODE`, `NAME`, `SHORT_WORD`, `PLUGIN_CODE`) VALUES ('000', '通用模块', 'PUBLIC_MODULE', '000');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('000', '000');
INSERT INTO `usr_mdl_group_role` (`ROLE_CODE`, `MDLG_CODE`) VALUES ('000', '000');


--角色
INSERT INTO `usr_role` (`CODE`, `NAME`, `SHORT_WORD`, `CAN_EDIT`, `CAN_DELET`, `ORDER_IDX`) VALUES ('001', '系统管理员', 'SYSTEM_MANAGER', 0, 0, 1);
--用户角色对应关系
INSERT INTO `usr_user_role` (`USER_ID`, `ROLE_CODE`) VALUES (0, '001');

--插件
INSERT INTO `plugin_info` (`CODE`, `NAME`, `VERSION`, `STATUS`, `LEVEL`, `SETUP_DATE`) VALUES ('001', '系统基础框架', '1.0.0', '1', '0', now());

--菜单资源
-- 首级菜单

INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`, `ORDER_IDX`) VALUES ('001', '系统管理', 'MAIN_SYS',    '/main',  '001', 999);

INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001', '系统管理子菜单',   'MAIN_SYS_SUB', '', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002', '系统管理快捷菜单', 'MAIN_SYS_QUK', '', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001003', '系统管理相关资源', 'MAIN_SYS_RSC', '', '001');
-- 子菜单
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001001', '用户管理', 'MAIN_SYS_SUB_USER', '/main/user', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001002', '角色管理', 'MAIN_SYS_SUB_ROLE', '/main/role', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001003', '系统配置', 'MAIN_SYS_SUB_SETING', '/main/setting', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001004', '插件管理', 'MAIN_SYS_SUB_PLUGIN', '/main/plugin', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001005', '系统日志', 'MAIN_SYS_SUB_LOG', '/main/log', '001');
-- 快捷菜单
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002001', '用户权限', 'MAIN_SYS_QUK_UR', '', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002001001', '用户管理', 'MAIN_SYS_QUK_UR_USER', '/main/user', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002001002', '角色管理', 'MAIN_SYS_QUK_UR_ROLE', '/main/role', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002001003', '用户角色', 'MAIN_SYS_QUK_UR_USRL', '', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002001004', '角色权限', 'MAIN_SYS_QUK_UR_RLMD', '', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002002', '系统管理', 'MAIN_SYS_QUK_SYS', '', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002002001', '系统配置', 'MAIN_SYS_QUK_SYS_STN', '/main/setting', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002002002', '插件管理', 'MAIN_SYS_QUK_SYS_PGN', '/main/plugin', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001002002003', '系统日志', 'MAIN_SYS_QUK_SYS_LOG', '/main/log', '001');

-- 系统配置子菜单设置
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001003001', '系统配置子菜单',   'MAIN_SYS_SETING_SUB', '', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001003002', '系统配置快捷菜单', 'MAIN_SYS_SETING_QUK', '', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001003003', '系统配置相关资源', 'MAIN_SYS_SETING_RSC', '', '001');

INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001003001001', '基本设置',   'MAIN_SYS_SETING_SUB_BASI', '/main/setting/basic', '001');
INSERT INTO `usr_mdl_menu` (`CODE`, `NAME`, `SHORT_WORD`, `URL`, `PLUGIN_CODE`) VALUES ('001001003001002', '邮件设置',   'MAIN_SYS_SETING_SUB_MAIL', '/main/setting/email', '001');

--模块分组
INSERT INTO `usr_mdl_group` (`CODE`, `NAME`, `SHORT_WORD`, `PLUGIN_CODE`) VALUES ('001', '系统用户管理', 'MAIN_SYS_USER', '001');
INSERT INTO `usr_mdl_group` (`CODE`, `NAME`, `SHORT_WORD`, `PLUGIN_CODE`) VALUES ('002', '系统插件管理', 'MAIN_SYS_PLUGIN', '001');

--模块资源对应关系
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('001', '001');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('001', '001001001');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('001', '001001002');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('001', '001002001');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('001', '001002001001');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('001', '001002001002');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('001', '001002001003');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('001', '001002001004');

INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001001003');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001001004');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001001005');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001002002');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001002002001');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001002002002');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001002002003');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001001003001001');
INSERT INTO `usr_mdl_group_menu` (`MDLG_CODE`, `MENU_CODE`) VALUES ('002', '001001003001002');

--模块角色对应关系
INSERT INTO `usr_mdl_group_role` (`ROLE_CODE`, `MDLG_CODE`) VALUES ('001', '001');
INSERT INTO `usr_mdl_group_role` (`ROLE_CODE`, `MDLG_CODE`) VALUES ('001', '002');

