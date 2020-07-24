git config user.name "AC7-cheaters"
git config user.email "yajyuudesu@gmail.com"

cha=`git status -s`
upd=`expr length "$cha"`

if [ upd != 0 ]
then  
  git commit -a -m "Merge"
  git push
else echo 'no change'
fi
