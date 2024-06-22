#!/usr/bin/env zsh

docker compose down --remove-orphans

if [ -d "apache/ssl" ]; then
  rm -rf apache/ssl
fi

if [ -d "kanban_git" ]; then
  rm -rf kanban_git
fi

if [ -d "src" ]; then
  rm -rf src
fi