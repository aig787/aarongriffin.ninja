#!/bin/sh
ssh-agent bash -c 'ssh-add /home/aaron/.ssh/github; git pull origin master --force'
hexo generate
