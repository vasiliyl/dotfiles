# The following lines were added by compinstall

zstyle ':completion:*' add-space true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _prefix _list
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' match-original both
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true
# ignore CVS & SVN files
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)SVN'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#SVN'

zstyle :compinstall filename '/home/laz/.zshrc'

autoload -Uz compinit
compinit

# colors
autoload colors
colors

# my emacs sets TERM to `eterm-color' , so check if I'm in emacs
#if [ $TERM = 'eterm-color' ]; then
#    zmodload -u zsh/zle
#fi



HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

####
### various options
##
## Changing directories
# If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory
setopt AUTO_CD
# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS
# Make cd push the old directory onto the directory stack
setopt AUTO_PUSHD
# Do not print the directory stack after pushd or popd
setopt PUSHD_SILENT
##
## Completion
# Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly
setopt AUTO_MENU
# If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space
setopt AUTO_PARAM_SLASH
# When the last character resulting from a completion is a slash and the next character typed is a word delimiter, a slash, or a character that ends a command (such as a semicolon or  an  ampersand), remove the slash
setopt AUTO_REMOVE_SLASH
# in completion, recognize exact matches even if they are ambiguous
setopt NO_REC_EXACT
##
## Expansion and globbing
# If a pattern for filename generation has no matches, delete the pattern from the argument list; do not report an error unless all the patterns in a command have no matches
setopt CSH_NULL_GLOB
# This option works when AUTO_LIST or BASH_AUTO_LIST is also set.  If there is an unambiguous prefix to insert on the command line, that is done without a completion  list  being  displayed;  in other words, auto-listing behaviour only takes place when nothing would be inserted.
setopt LIST_AMBIGUOUS
# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.  (An initial unquoted ‘~’ always produces named directory expansion.)
setopt EXTENDED_GLOB
# Append a trailing ‘/’ to all directory names resulting from filename generation (globbing)
setopt MARK_DIRS
# If numeric filenames are matched by a filename generation pattern, sort the filenames numerically rather than lexicographically
setopt NUMERIC_GLOB_SORT
##
## History
# If  this  is set, zsh sessions will append their history list to the history file, rather than replace it
setopt APPEND_HISTORY
# If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event)
setopt HIST_IGNORE_ALL_DUPS
# Remove superfluous blanks from each command line being added to the history list
setopt HIST_REDUCE_BLANKS
# When writing out the history file, older commands that duplicate newer ones are omitted
setopt HIST_SAVE_NO_DUPS
##
## Input/Output
# Do not correct anything
setopt NO_CORRECT_ALL
# Allow comments even in interactive shells
setopt INTERACTIVE_COMMENTS
# Whenever a command name is hashed, hash the directory containing it, as well as all directories that occur earlier in the path
setopt HASH_DIRS
# Allow the short forms of for, repeat, select, if, and function constructs
setopt SHORT_LOOPS
# Perform a path search even on command names with slashes in them
setopt PATH_DIRS
##
## Job control
#if you've got a simple command suspened, say 'mutt', and you forgot that you have already got a mutt running and try to start another mutt, the old running mutt is resumed, rather than starting a new process
setopt AUTO_RESUME
# With this option set, stopped jobs that are removed from the job table with the disown builtin command are automatically sent a CONT signal to make them running
setopt AUTO_CONTINUE
# Do not dend the HUP signal to running jobs when the shell exits
setopt NO_HUP
# Make the echo builtin compatible with the BSD echo(1) command. This disables backslashed escape sequences in echo strings unless the `-e' option is specified.
setopt BSD_ECHO

DIRSTACKSIZE=20


# disable flow control
stty -ixon

####
# Autocomplete

compctl -c sudo


#Prompting

# If the PROMPT_SUBST option is set, the prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion.
setopt PROMPT_SUBST

autoload -Uz promptinit
promptinit

function my_git_current_branch () {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

function my_git_email () {
    git config user.email
}

function my_git_repository_name () {
    basename "$(git rev-parse --show-toplevel 2>/dev/null)"
}

export PROMPT="$prompt_newline%K{16}%E [%!] [%*] [\$(my_git_repository_name)@\$(my_git_current_branch)] [\$(my_git_email)] %k$prompt_newline  %~$prompt_newline> "



# load locale
source ~/.locale


#load aliases
source ~/.alias

#complist module
zmodload zsh/complist
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script "$(which stack)")"

# keyboard setup

#misc bindkeys
bindkey -M menuselect \^N accept-and-hold
bindkey -M menuselect \^F accept-and-infer-next-history
bindkey -M menuselect \^Z undo

bindkey '\eOc' emacs-forward-word  # ctrl cursor right
bindkey '\eOd' emacs-backward-word # ctrl cursor left

bindkey ${terminfo[khome]} beginning-of-line
bindkey ${terminfo[kend]} end-of-line
bindkey ${terminfo[kdch1]} delete-char


#export WORDCHARS=' /'
#export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'





#bindkey '\e[A' history-beginning-search-backward
#bindkey '\e[B' history-beginning-search-forward



source ~/.env

# функция грепа по списку процессов
function pag () {
    PIDLIST=$(pgrep -d, -f "$@")
    if [ -n "$PIDLIST" ] ; then
        ps -f -p "$PIDLIST" ;
    fi
}

# TODO: убирать escape-последовательности
function set_vt_title () {
    # уберём переводы строк из команды
    cmd="`echo -e "$*" | head -n 1`"
    case $TERM in
        sun-cmd)
            print -Pn "\e]l$cmd\e\\"
            ;;
        *xterm*|rxvt*|(dt|k|E)term)
            print -Pn "\e]2;$cmd\a"
            ;;
    esac
}

function shell_name_to_title () {
    if [ -z "$SHELL_NAME" ]; then
        new_title="%~"
    else
        new_title="$SHELL_NAME"
    fi
    set_vt_title "$new_title"
}

function cur_cmd_to_title () {
    if [ -z "$SHELL_NAME" ]; then
        new_title="$2"
    else
        new_title="$SHELL_NAME - $2"
    fi
    set_vt_title "$new_title"
}

add-zsh-hook precmd shell_name_to_title
add-zsh-hook preexec cur_cmd_to_title

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
