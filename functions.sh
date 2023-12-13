#!/bin/bash

# Function to remove text between specified markers
remove_text_block() {
    local file=$1
    local marker=$2
    local temp_file="${file}.temp"
    # Using sed to remove text starting and ending with the specified marker
    sed "/$marker/,/$marker/d" "$file" > "$temp_file"
    # Move temporary file to replace original 
    mv "$temp_file" "$file"

    echo "removed :)"
}

