#!/bin/bash

# Check if both arguments are present
if [ -z "$1" ] || [ -z "$2" ] 
then
    echo "Usage $0 <writefile> <writestr>"
    exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname $1)"

# Write the contents to the file
echo "$2" > "$1"

# Check if the file was created successfully
if [ ! -f "$1" ]; then
    echo "Error: Could not create file $1"
    exit 1
fi

# Print success message and exit
echo "File $1 created with content:"
cat "$1"
exit 0


