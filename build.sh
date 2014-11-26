#!/bin/sh
ssh-agent bash -c 'ssh-add /home/aaron/.ssh/github; git pull origin master --force --recurse-submodules'
hexo clean
hexo generate
