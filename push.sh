#!/bin/bash

echo "Adding changes"
git add .

MESSAGE=${1:-"Auto commit: $(date +'%Y-%m-%d %H:%M:%S')"}
git commit -m "$MESSAGE"
git push origin main
echo "Push complete!"
