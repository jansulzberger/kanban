#!/usr/bin/env zsh

## Setup Kanban from git
if [ ! -d "kanban_git" ]; then
   docker compose run --rm git clone https://github.com/kanboard/kanboard.git /opt/kanban_git
else
  docker compose run --rm git -C /opt/kanban_git pull
fi

if [ ! -d "nginx/ssl" ]; then
  mkdir nginx/ssl
  openssl req -x509 -out nginx/ssl/localhost.crt -keyout nginx/ssl/localhost.key \
    -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=localhost' -extensions EXT -config <( \
     printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
fi
