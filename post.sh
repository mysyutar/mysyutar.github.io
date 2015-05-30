DATE=`date +%Y-%m-%dT%T+09:00`
YEAR=`date +"%Y"`
MONTH=`date +"%m"`
DAY=`date +"%d"`
NAME=$1

echo $DATE
cp archetypes/default.md "content/post/${YEAR}-${MONTH}-${DAY}-${NAME}.md"
