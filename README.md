# set-up
Setup a personalized environment  

# Scripts
## variables.sh
* System: These variables are set depending on the current operating system and are set for general purpose use. 
* Personal: These are configured entirely based on the user 
* Blocks: These variables are used as delimiters to capture configurations made by the current setup and will usually only add to current existing configurations 


## functions.sh
* remove_text_block: Removes all text in between the choosen delimeter
* git_clone_if_not_exists: If the folder does not exist, it will clone the specified repo
  
  
## run.sh
This is the main script which will be used for the setup based on the variables specified on variables.sh. The below functions are currently running 

* configure_bash_file
* configure_vim_file
* configure_notes_repo


