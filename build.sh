#!/bin/bash
# build my blog project and push
bundle exec jekyll build
git add .
[ $# = 0 ] && msg="Build" || msg=$1
git commit -m $msg
git push