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

    echo "*COMPLETED: remove_text_block $file*"
}


git_clone_if_not_exists() {
    local repo_url=$1
    local dir_name=$2
    local access_token=$3
    local modified_url=$repo_url

    # Include the access token in the URL if provided
    if [[ -n $access_token ]]; then
        modified_url=${repo_url/https:\/\//https:\/\/$access_token@}
    fi

    # Check if the directory already exists
    if [ ! -d "$dir_name" ]; then
        echo "*COMPLETED: Directory $dir_name does not exist. Cloning...*"
        git clone "$modified_url" "$dir_name"    
    else
        echo "*COMPLETED: Directory $dir_name already exists. Skipping clone.*"
    fi
}
