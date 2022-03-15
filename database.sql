#创建数据库
CREATE DATABASE IF NOT EXISTS api_auto_test DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

#创建测试case表
CREATE TABLE `case` (
    `id`            int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
    `app`           varchar(128)  DEFAULT NULL COMMENT '业务应⽤',
    `module`        varchar(128)  DEFAULT NULL COMMENT '模块',
    `title`         varchar(128)  DEFAULT NULL COMMENT '⽤例名称',
    `method`        varchar(128)  DEFAULT NULL COMMENT 'Http提交⽅法',
    `url`           varchar(128)  DEFAULT NULL COMMENT '接 ⼝',
    `run`           varchar(32)   DEFAULT NULL COMMENT '是否运⾏ yes/no',
    `headers`       varchar(128)  DEFAULT '{}' COMMENT '请求头',
    `pre_case_id`   int(11)       DEFAULT '-1' COMMENT '是否有前置⽤例id',
    `pre_fields`    varchar(128)  DEFAULT '[]' COMMENT '前置的字段, 获取请求结果的哪个字段，⽤于当前case的header还是body,双&name& 替代值',
    `request_body`  varchar(128)  DEFAULT '{}' COMMENT '请求内容,$XX⽤于替换',
    `except_result` varchar(1024) DEFAULT NULL COMMENT '预期结果',
    `assert_type`   varchar(64)   DEFAULT NULL COMMENT '断⾔类型, 判断状态码、data内容或数组⻓度',
    `pass`          varchar(64)   DEFAULT NULL COMMENT '是否通过，yes, no',
    `msg`           varchar(128)  DEFAULT NULL COMMENT '测试⽤例额外描述新',
    `update_time`   datetime      DEFAULT NULL COMMENT '更新时间',
    `response`      text COMMENT '实际结果',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4;

#创建配置表
CREATE TABLE `config`(
    `id`         int(11) unsigned NOT NULL AUTO_INCREMENT,
    `app`        varchar(128) DEFAULT NULL COMMENT '所 属app',
    `dict_key`   varchar(64)  DEFAULT NULL COMMENT '字典key',
    `dict_value` varchar(256) DEFAULT NULL COMMENT '字典值',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4;