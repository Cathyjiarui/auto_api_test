# coding: utf-8
import smtplib
from email.mime.text import MIMEText
from email.header import Header


class SendMailUtil:

    def __init__(self, mail_host):
        self.mail_host = mail_host

    def send(self, title, content, sender, auth_code, receivers):
        message = MIMEText(content, 'html', 'utf-8')
        message['From'] = "{}".format(sender)
        message['To'] = ",".join(receivers)
        message['Subject'] = title
        try:
            smtp_obj = smtplib.SMTP_SSL(self.mail_host, 465)
            # 登录
            smtp_obj.login(sender, auth_code)
            # 发送
            smtp_obj.sendmail(sender, receivers, message.as_string())
            print("Mail 发送成功")
        except Exception as e:
            print(e)
