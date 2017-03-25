FROM debian:latest

ENV ACCOUNT someaccount
ENV DOMAIN somedomain
ENV PASSWORD password

# cronとwgetをインストール
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y cron wget 

# 更新用Perlスクリプトを準備
COPY ./ddns-update.pl /opt

# 起動用シェルをコピー
COPY ./run_ddns_update.sh /opt
COPY ./run_cron.sh /opt

# 実行権限付与
RUN chmod +x /opt/run_ddns_update.sh && chmod +x /opt/run_cron.sh

# 5分おきに実行
RUN echo '*/5 * * * * root /bin/sh /opt/run_ddns_update.sh' >> /etc/crontab
CMD ["/opt/run_cron.sh"]

