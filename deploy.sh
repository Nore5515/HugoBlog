#!/bin/sh

# If a command fails then the deploy stops
set -ex

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t papercss-hugo-theme # if using a theme, replace with `hugo -t <YOURTHEME>`

# Add changes to git.
git add .

# Commit changes.
git commit -m "$msg"

# pull to be fresh:
git pull -r

# send it away
git push

# cd public

cp -a ./public/ ../Nore5515.github.io/Nore5515.github.io/

cd ../Nore5515.github.io/Nore5515.github.io/

git add .

git commit -m "$msg"

git pull -r

# send it away
git push origin master
