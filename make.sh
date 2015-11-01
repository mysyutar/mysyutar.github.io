#!/bin/sh
set -ex

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
  echo "categories: [misc, cm, work, review]" >> ${FILE}
  echo "tags: [日記]"             >> ${FILE}
  echo "---"                      >> ${FILE}
  echo ""                         >> ${FILE}
  echo "## headline"              >> ${FILE}
elif [ $1 = "build" ]; then
  hugo
elif [ $1 = "serve" ]; then
  HOSTNAME=`hostname`
  hugo server --bind=0.0.0.0 --baseUrl=http://${HOSTNAME} -w --port=4000
elif [ $1 = "deploy" ]; then
  DATE=`date +"%Y/%m/%d %T"`

  git push origin source:source
  rm -rf _site
  git clone -b master git@github.com:mysyutar/mysyutar.github.io.git _site
  hugo
  cd _site

  git add -A
  git commit -m "Deploy at ${DATE}"
  git push origin master:master
else
  echo "Usage: $0 [post|build|serve|deploy]"
fi
