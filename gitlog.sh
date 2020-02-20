#!/usr/bin/env bash
for AUTHOR in $GITLOG_USERS
do
  echo ""
  echo "---"
  echo $AUTHOR
  for REPO in $GITLOG_REPOS
  do
    cd ~/code/$REPO
    git --no-pager log --all --since="last month" --author="$AUTHOR" --pretty=format:'%an, %ar, %s'
  done
done

echo ""
