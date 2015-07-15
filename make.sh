#!/bin/sh

if [ $1 = "post" ]; then
  DATE=`date +%Y-%m-%dT%T+09:00`
  YEAR=`date +"%Y"`
  MONTH=`date +"%m"`
  DAY=`date +"%d"`
  NAME=$2

  FILE_NAME="${YEAR}-${MONTH}-${DAY}-${NAME}.md"
  FILE="content/post/${FILE_NAME}"

  touch ${FILE}
  echo "created ${FILE}"

  echo "---"                      >> ${FILE}
  echo "date: ${DATE}"            >> ${FILE}
  echo "title: \"${NAME}\""       >> ${FILE}
  echo "slug: \"${NAME}\""        >> ${FILE}
  echo "categories: [misc, work, review]" >> ${FILE}
  echo "tags: [日記]"             >> ${FILE}
  echo "---"                      >> ${FILE}
  echo ""                         >> ${FILE}
  echo "## headline"              >> ${FILE}
elif [ $1 = "serve" ]; then
  hugo server --bind=0.0.0.0 --baseUrl=http://219.94.249.150 -w --port=4000
elif [ $1 = "deploy" ]; then
  NAME=`git config --local user.name`
  EMAIL=`git config --local user.email`
  DATE=`date +"%Y/%m/%d %T"`

  git push origin HEAD

  rm -rf _site/*
  hugo

  cd _site

  git remote add origin git@github-my.com:mysyutar/mysyutar.github.io.git
  git pull
  `git config --local --add user.name ${NAME}`
  `git config --local --add user.email ${EMAIL}`
  git add ./
  git commit -m "Deploy at ${DATE}"

  git push -f origin master
else
  echo "Usage: $0 [post|build|serve|deploy]"
fi
