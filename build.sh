#!/bin/sh
ssh-agent sh -c 'ssh-add /home/aaron/.ssh/github_id_rsa; git pull origin master'
hexo clean
hexo generate
mkdir public/.well-known
cp ~/keybase.txt public/.well-known/keybase.txt
