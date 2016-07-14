#!/bin/sh
cp -r public/.well-known ~/.well-known
ssh-agent sh -c 'ssh-add /home/aaron/.ssh/github_id_rsa; git pull origin master'
hexo clean
hexo generate
cp ~/.well-known public/.well-known
