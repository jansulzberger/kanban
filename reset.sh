#!/usr/bin/env zsh

docker compose down --remove-orphans

if [ -d "nginx/ssl" ]; then
  rm -rf nginx/ssl
fi

if [ -d "kanban_git" ]; then
  rm -rf kanban_git
fi