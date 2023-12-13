#!/bin/bash

# System Variables
OS="Unknown"
NAME=""
HOME_DIR=""
NEWID=""
DATE=""
TIME=""

# Find current operating system
case "$(uname -s)" in
    Linux*)     OS=Linux;;
    Darwin*)    OS=macOS;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*) OS=Windows;;
    *)          OS="UNKNOWN:${unameOut}"
esac



# Operating system based commands
case "$OS" in
    Linux)
        # Linux-specific command
        NAME=$(whoami)
        HOME_DIR=$HOME
        NEWID=$(uuidgen)
        DATE=$(date +%Y-%m-%d)
        TIME=$(date +"%H:%M")
        ;;
    macOS)
        # macOS-specific command
        NAME=$(whoami)
        HOME_DIR=$HOME
        NEWID=$(uuidgen)
        DATE=$(date +%Y-%m-%d)
        TIME=$(date +"%H:%M")
        ;;
    Windows)
        # Windows-specific command (assuming you're in a Unix-like environment on Windows)
        NAME=$(cmd.exe /c 'echo %USERNAME%')
        HOME_DIR=$HOME
        NEWID=$(powershell.exe -Command "[guid]::NewGuid().toString()")
        DATE=$(date +%Y-%m-%d)
        TIME=$(date +"%H:%M")
        ;;
    *)
        echo "Operating System not identified or not supported."
        ;;
esac

# Personal Variables
NOTES_DIR="$HOME_DIR/Home_$NAME"
INDEX_DIR="$HOME_DIR/Home_$NAME/notes/index"
DIARY_DIR="$INDEX_DIR/diary"
SCRIPTS_DIR="$INDEX_DIR/scripts"
TASKS_DIR="$INDEX_DIR/tasks"
BOOKS_DIR="$INDEX_DIR/books"
NOTES_GIT_URL="https://github.com/blaricoco/Notes.git"

# Configuration blocks
CONFIG_BLOCK_BASH="### BASH_$NAME ###"

echo ------- Configuration -----------
echo "Operating System  : $OS"
echo "Username          : $NAME"
echo "NewGuid           : $NEWID"
echo "Date              : $DATE"
echo "Time              : $TIME"
echo "Home Directory    : $HOME_DIR"
echo "Notes Directory   : $NOTES_DIR"
echo "Index Directory   : $INDEX_DIR"
echo "Diary Directory   : $DIARY_DIR"
echo "Script Directory  : $SCRIPTS_DIR"
echo "Task Directory    : $TASKS_DIR"
echo "Book Directory    : $BOOKS_DIR"
echo "Notes Git Url     : $NOTES_GIT_URL"
echo "Config Block Bash : $CONFIG_BLOCK_BASH"
echo ---------------------------------

