#!/bin/bash

# Get the current date and time for a default commit message
CURRENT_DATE_TIME=$(date +"%Y-%m-%d %H:%M:%S")

# Check if a commit message is provided as an argument
if [ -n "$1" ]; then
  COMMIT_MESSAGE="$1"
else
  COMMIT_MESSAGE="Automated save on $CURRENT_DATE_TIME"
  echo "No commit message provided. Using default: \"$COMMIT_MESSAGE\""
fi

echo "--- Staging all changes (git add .) ---"
git add .

echo "--- Committing changes with message: \"$COMMIT_MESSAGE\" ---"
git commit -m "$COMMIT_MESSAGE"

# Check if the commit was successful before pushing
if [ $? -eq 0 ]; then
  echo "--- Pushing changes to origin main ---"
  git push origin main
else
  echo "Commit failed. No changes were pushed. Please check for issues (e.g., nothing to commit)."
fi

echo "--- Git save process complete ---"

