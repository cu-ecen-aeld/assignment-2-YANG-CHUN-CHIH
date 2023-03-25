#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: both filesdir and searchstr are required parameters."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: filesdir parameter is not a directory."
    exit 1
fi

files=$(find "$1" -type f)
match_count=0

for file in $files; do
    if grep -q "$2" "$file"; then
        match_count=$((match_count + $(grep -c "$2" "$file")))
    fi
done

file_count=$(echo "$files" | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match_count."
