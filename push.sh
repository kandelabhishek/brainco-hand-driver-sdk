#!/bin/bash

echo "Adding changes"
git add .

MESSAGE=${1:-"Auto commit: $(date + '5Y-%m-%d %H:%M:%S')"}

if [ -z,"$1" ]
then
	echo "since there were no commit messages, Creating auto commit message"
	echo "$MESSAGE"
	git commit -m "$MESSAGE"

else
	git commit -m "$1"

fi

git push origin main
echo "Push complete!"
