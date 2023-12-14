# CONFIGURATION: EXPORT
export PATH=$PATH:$SCRIPTS_DIR/filters
export OS=$OS
export NAME=$NAME

# CONFIGURATION: COLOR
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'

# CONFIGURATION: BASH
alias src='source ~/.bashrc'
alias notes="cd $NOTES_DIR/notes ; vim README.md"
alias setup="cd $HOME_DIR/set-up; ll"
alias filters="cd $SCRIPTS_DIR/filters ; ll"

# CONFIGURATION: FILTERS

# CONFIGURATION: DIARY

## Create new entry
function entry() {

    CURRENT_YEAR=$(date +"%Y")
    DATE=$(date +%Y-%m-%d)   
    TIME=$(date +"%H:%M")
    CURRENT_DIARY_ENTRY="$DIARY_DIR/$CURRENT_YEAR/$DATE.md"

    # Check current year 
    if [ -d "$DIARY_DIR/$CURRENT_YEAR" ]; then
        echo "Existing year"
        cd "$DIARY_DIR/$CURRENT_YEAR"

    else
        echo "New year!"
        mkdir "$DIARY_DIR/$CURRENT_YEAR"
        cd "$DIARY_DIR/$CURRENT_YEAR"
    fi

    # Check current day 
    if [ -f "$CURRENT_DIARY_ENTRY" ]; then
        echo "Existing diary"
        echo ""          >> "$CURRENT_DIARY_ENTRY"
        echo "### $TIME" >> "$CURRENT_DIARY_ENTRY"
        echo ""          >> "$CURRENT_DIARY_ENTRY"
    else
        echo "New diary!"
        echo "## $DATE"  >> "$CURRENT_DIARY_ENTRY"
        echo ""          >> "$CURRENT_DIARY_ENTRY"
        echo "### $TIME" >> "$CURRENT_DIARY_ENTRY"
        echo ""          >> "$CURRENT_DIARY_ENTRY"
    fi

    vim "$CURRENT_DIARY_ENTRY"
}

# CONFIGURATION: TASKS

