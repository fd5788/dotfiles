#!/bin/bash
#ref:https://help.github.com/en/articles/changing-author-info
#execute following first, and then execute "git push --force --tags origin 'refs/heads/*'"

git filter-branch -f --env-filter '
CORRECT_NAME="fd5788"
CORRECT_EMAIL="dengzxf@gmail.com"
export GIT_COMMITTER_NAME="$CORRECT_NAME"
export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
export GIT_AUTHOR_NAME="$CORRECT_NAME"
export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
' --tag-name-filter cat -- --branches --tags
