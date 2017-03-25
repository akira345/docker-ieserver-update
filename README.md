Dockerで自宅サーバのDDNS(ieserver)を登録する。
====

Dockerで自宅サーバのDDNS(ieserver)を更新します。

docker-compose.ymlにieserverのアカウント、ドメイン情報を設定してください。

```bash
git clone https://github.com/akira345/docker-ieserver-update.git
cd docker-ieserver-update/
docker-compose up -d

