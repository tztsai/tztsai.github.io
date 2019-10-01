#!/bin/bash
# build my blog project and push
bundle exec jekyll build
git add .
git commit -m "Build"
git push