#!/bin/sh

hexo clean
hexo generate
mkdir public/.well-known
mv ~/keybase.txt public/.well-known/keybase.txt
