#!/bin/bash
# Copyright (c) 2016-2024 Crave.io Inc. All rights reserved

RELEASETAG=$1
DEVICE=$2
REPONAME=$3
RELEASETITLE=$4
IMG_FILES=""

# Check if token.txt exists
if [ ! -f token.txt ]; then
    echo "token.txt doesn't exist!"
    exit 1
fi

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "gh could not be found. Installing gh..."
    curl -sS https://webi.sh/gh | sh
    source ~/.config/envman/PATH.env
    echo "gh installed."
fi

# Authenticate against github.com by reading the token from a img_file
gh auth login --with-token < token.txt

# Scan Release IMG_FILES
for img_file in out/target/product/$DEVICE/*.img; do
if [[ -n $img_file && $(stat -c%s "$img_file") -le 2147483648 ]]; then # Try to match github releases per size limit
    IMG_FILES+="$img_file "
    echo "Selecting $img_file for Upload"
else
    echo "Skipping $img_file"
fi
done
echo "Image Files to be uploaded: $IMG_FILES"

# Create release	
gh release create $RELEASETAG out/target/product/$DEVICE/*.zip $IMG_FILES --repo $REPONAME --title $RELEASETITLE --generate-notes
