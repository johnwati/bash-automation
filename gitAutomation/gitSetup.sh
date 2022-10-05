# git init

# git remote add origin "git@github.com:johnwati/bash-automation.git"

# git push --set-upstream origin main

echo "Enter your message"
read message
git add .
git commit -m"${message}"
if [ -n "$(git status - porcelain)" ];
then
 echo "IT IS CLEAN l"
 git push -u origin master
else
 git status
 echo "Pushing data to remote server!!!"
 git push -u origin master
fi
echo "bye"
git status
read message