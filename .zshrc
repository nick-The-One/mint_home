# Set up the prompt
fpath+=~/.zfunc
# prompt theme -- currently disabled
#autoload -Uz promptinit
#promptinit
#prompt adam1
PROMPT='%B%F{green}%3~%f%b %# '

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
autoload -Uz n
compinit

# bind navigation
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3D" beginning-of-line
bindkey "^[[1;3C" end-of-line

# flags
# moved to .szhenv
# fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source ~/.zfunc/fzf-tab.plugin.zsh
# zoxide
eval "$(zoxide init zsh --cmd cd)"

# aliases
alias b="bat"
alias c="code ."
alias gm="git checkout master && git pull origin master --prune"
alias gitprune="git fetch --prune --all && git branch --merged | grep -v \* | xargs git branch -D"
alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias json="python3 -m json.tool"
alias ll="eza -alhb -s=name --group-directories-first --no-user --no-permissions --git"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias sclone="git clone --depth=1 "
alias untar="tar -xvf"

# functions
# nnn
nnn_cd()
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi  
}
trap nnn_cd EXIT

# pet snippet manager
function pprev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}