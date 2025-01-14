# optional homebrew line: 
# export PATH=/opt/homebrew/bin:$PATH

alias ll='ls -al'

alias gs='git status'
alias gc='git commit'
alias gd='git diff'
alias gch='git checkout'
alias gcp='git cherry-pick'
alias gl='git log --first-parent'
alias ga='git add'
alias gb='git branch'

# fix so we do 'git push -u' if we are creating the branch, so we automatically track branches
# this is taken from https://stackoverflow.com/a/19021888/249871
alias gpush='[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && 
           git push -u origin $(git symbolic-ref --short HEAD) || 
           git push'

alias sd='say done'

# fix git autocomplete
autoload -Uz compinit && compinit
