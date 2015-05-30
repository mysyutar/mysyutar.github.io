NAME=`git config --local user.name`
EMAIL=`git config --local user.email`
DATE=`date +"%Y/%m/%d %T"`

rm -rf public/
hugo --theme=bootie-docs
cd public

git remote add origin git@github-my.com:mysyutar/mysyutar.github.io.git
git pull
`git config --local --add user.name ${NAME}`
`git config --local --add user.email ${EMAIL}`

git add ./
git commit -m "Deploy at ${DATE}"

git push origin master
