#!/bin/bash

# Get the filename from the user
filename=$1

# Check if the file exists
if [ ! -e "$filename" ]; then
    echo "The file does not exist."
else
    # Check if it is an ordinary file
    if [ -f "$filename" ]; then
        echo "The file exists and it is an ordinary file."
        echo "Access permissions: $(stat -c '%A' $filename)"
        echo "Size: $(stat -c '%s' $filename) bytes"
        echo "Last modification time: $(stat -c '%y' $filename)"
    # Check if it is a directory
    elif [ -d "$filename" ]; then
        echo "The file exists and it is a directory."
        num_files=$(find $filename -type f | wc -l)
        num_dirs=$(find $filename -type d | wc -l)
        echo "Number of files: $num_files"
        echo "Number of subdirectories: $((num_dirs-1))"
    else
        echo "The file exists but it is neither an ordinary file nor a directory."
    fi
fi
