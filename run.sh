#!/bin/bash

# Import configurations and functions 
source ./functions.sh
source ./variables.sh

# Make script folder available 

configure_bash_file() {

    remove_text_block "$HOME_DIR/.bashrc" "$CONFIG_BLOCK_BASH"

    echo $CONFIG_BLOCK_BASH >> $HOME_DIR/.bashrc
    cat .bashrc  >> $HOME_DIR/.bashrc
    echo $CONFIG_BLOCK_BASH >> $HOME_DIR/.bashrc
}


# Run
configure_bash_file

# Test
tail  $HOME_DIR/.bashrc

