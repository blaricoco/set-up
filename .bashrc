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
source $SCRIPTS_DIR/scripts_diary.sh

## Create new entry
function diary() {
    diary_new_entry $DIARY_DIR    
}

# CONFIGURATION: TASKS

