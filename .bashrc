# CONFIGURATION: EXPORT
export PATH=$PATH:$SCRIPTS_DIR/filters
export OS=$OS
export NAME=$NAME

# CONFIGURATION: COLOR
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'

# CONFIGURATION: SHORTCUTS
alias src='source ~/.bashrc'
alias notes="cd $NOTES_DIR/notes ; vim README.md"
alias setup="cd $HOME_DIR/set-up; ll"
alias filters="cd $SCRIPTS_DIR/filters ; ll"

# CONFIGURATION: IMPORT FUNCTIONS
source $SCRIPTS_DIR/scripts_filter.sh
source $SCRIPTS_DIR/scripts_diary.sh
source $SCRIPTS_DIR/scripts_task.sh

# CONFIGURATION: PRINT DESCRIPTIONS
function dfilters() {
    print_description_by_keyword "$FILTERS_DIR" "# FILTER"
    cd "$FILTERS_DIR"
}

function dscripts() {
    print_description_by_keyword "$SCRIPTS_DIR" "# SCRIPT"
    cd "$SCRIPTS_DIR"
}

function dfunctions() {
    print_description_by_keyword "$SCRIPTS_DIR" "# FUNCTION"
}

function dtasks() {
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
        cd $TASKS_DIR
    else
        echo "Task does not exist!"
    fi
}
