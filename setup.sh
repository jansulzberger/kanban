#!/usr/bin/env zsh

./reset.sh

## Setup Kanban from git
if [ ! -d "kanban_git" ]; then
  docker compose run --rm git clone https://github.com/kanboard/kanboard.git /opt/kanban_git
else
  docker compose run --rm git -C /opt/kanban_git pull
fi
rm -rf src
cp -R kanban_git src
docker compose run --rm composer install

if [ ! -d "apache/ssl" ]; then
  mkdir apache/ssl
  openssl req -x509 -out apache/ssl/localhost.crt -keyout apache/ssl/localhost.key \
    -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=localhost' -extensions EXT -config <( \
     printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
fi

if [ ! -f ".env.local" ]; then
  cp .env.example .env.local
fi

./run.sh
