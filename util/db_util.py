# coding: utf-8
import pymysql
from warnings import filterwarnings

# 忽略mysql告警信息
filterwarnings("ignore", category=pymysql.Warning)


class MysqlDb:

    def __init__(self):
        # 建立数据库连接
        self.conn = pymysql.connect(host='39.96.20.187', port=3636, user='root', password='Cathy051229*',
                                    db='api_auto_test')
        # 使用 cursor方法获取操作游标，得到一个可以执行sql语句，并且操作结果作为字典返回的游标
        self.cursor = self.conn.cursor(cursor=pymysql.cursors.DictCursor)

    def __del__(self):
        # 关闭游标
        self.cursor.close()
        # 关闭连接
        self.conn.close()

    def query(self, sql, state="all"):
        """
        查询
        :param sql:
        :param state: all默认查询全部
        :return:
        """
        self.cursor.execute(sql)

        if state == "all":
            # 查询全部
            data = self.cursor.fetchall()
        else:
            # 查询单条
            data = self.cursor.fetchone()
        return data

    def exexute(self, sql):
        """
        增加、修改、删除
        :param sql:
        :return:
        """
        try:
            # 使用execute操作sql
            rows = self.cursor.execute(sql)
            # 提交事物
            self.conn.commit()
            return rows
        except Exception as e:
            print("查询语句执行异常 {0}".format(e))
            # 回滚修改
            self.conn.rollback()
