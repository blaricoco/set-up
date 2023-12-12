#!/bin/bash

# Variable configuration
OS="Unknown"
NAME=""
HOMEDIR=""
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
        HOMEDIR=$HOME
        NEWID=$(uuidgen)
        DATE=$(date +%Y-%m-%d)
        TIME=$(date +"%H:%M")
        ;;
    macOS)
        # macOS-specific command
        NAME=$(whoami)
        HOMEDIR=$HOME
        NEWID=$(uuidgen)
        DATE=$(date +%Y-%m-%d)
        TIME=$(date +"%H:%M")
        ;;
    Windows)
        # Windows-specific command (assuming you're in a Unix-like environment on Windows)
        NAME=$(cmd.exe /c 'echo %USERNAME%')
        HOMEDIR=$HOME
        NEWID=$(powershell.exe -Command "[guid]::NewGuid().toString()")
        DATE=$(date +%Y-%m-%d)
        TIME=$(date +"%H:%M")
        ;;
    *)
        echo "Operating System not identified or not supported."
        ;;
esac


echo "Operating System : $OS"
echo "Username         : $NAME"
echo "Home Directory   : $HOMEDIR"
echo "NewGuid          : $NEWID"
echo "Date             : $DATE"
echo "Time             : $TIME"
