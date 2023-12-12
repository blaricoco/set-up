#!/bin/bash

# Variable configuration
OS="Unknown"
NAME=""
NEWID=""

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
        NEWID=$(uuidgen)
        ;;
    macOS)
        # macOS-specific command
        NAME=$(whoami)
        NEWID=$(uuidgen)
        ;;
    Windows)
        # Windows-specific command (assuming you're in a Unix-like environment on Windows)
        NAME=$(cmd.exe /c 'echo %USERNAME%')
        NEWID=$(powershell.exe -Command "[guid]::NewGuid().toString()")
        ;;
    *)
        echo "Operating System not identified or not supported."
        ;;
esac


echo "Operating System: $OS"
echo "Username        : $NAME"
echo "NEWID           : $NEWID"
