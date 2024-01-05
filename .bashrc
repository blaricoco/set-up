# CONFIGURATION: EXPORT
export PATH=$PATH:$SCRIPTS_DIR/filters
export OS=$OS
export NAME=$NAME

# CONFIGURATION: BASH PROMPT
DF='\[\e[0m\]'
BYELLOW='\[\e[1;33m\]'
BGREEN='\[\e[1;32m\]'
BRED='\[\e[1;31m\]'

COMMAND_COUNTER=0
PROMPT_COMMAND='PS1_GIT_BRANCH=$(parse_git_branch); ((COMMAND_COUNTER++)); CURRENT_DATETIME=$(date "+%Y-%m-%d %H:%M:%S")'

PS1="${BYELLOW}[$CURRENT_DATETIME]${DF}[\u]:${BGREEN}\w${BRED}\$PS1_GIT_BRANCH${DF} \n\$ "

export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export CLICOLOR=1

parse_git_branch() {
    # Check if the current directory is in a Git repository
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Get the current Git branch
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    fi
}

# CONFIGURATION: COLOR
alias ls='ls --color=auto -G'
alias ll='ls -Gla --color=auto'

# CONFIGURATION: SHORTCUTS
alias src='source ~/.bashrc'
alias notes="cd $NOTES_DIR/notes ; vim README.md"
alias setup="cd $HOME_DIR/set-up; ll"

# CONFIGURATION: IMPORT FUNCTIONS
source $SCRIPTS_DIR/scripts_filter.sh
source $SCRIPTS_DIR/scripts_diary.sh
source $SCRIPTS_DIR/scripts_task.sh

# CONFIGURATION: PRINT DESCRIPTIONS
function filters() {
    print_description_by_keyword "$FILTERS_DIR" "# FILTER"
    cd "$FILTERS_DIR"
}

function scripts() {
    print_description_by_keyword "$SCRIPTS_DIR" "# SCRIPT"
    cd "$SCRIPTS_DIR"
}

function dfunctions() {
    print_description_by_keyword "$SCRIPTS_DIR" "# FUNCTION"
}

function tasks() {
    print_description_by_keyword "$TASKS_DIR" "TASK"
    cd "$TASKS_DIR"
}

# CONFIGURATION: DIARY

## New Diary
function ndiary() {
    diary_new_entry $DIARY_DIR    
}

# CONFIGURATION: TASKS

## TODO: Move function to tasks scripts_task
## TODO: Create new task if it does not exist
function task() {
    local TASK_NUMBER=$1
    local TASK_NUMBER_DIR="$TASKS_DIR/task/$TASK_NUMBER"

    if [ -d "$TASK_NUMBER_DIR" ]; then
        # print description 
        print_description_by_keyword "$TASK_NUMBER_DIR" "TASK"
        cd "$TASK_NUMBER_DIR"
    else
        echo "Task does not exist!"
    fi
}
