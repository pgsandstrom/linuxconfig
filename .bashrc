alias gs='git status'
alias gc='git commit'
alias gd='git diff'
alias gch='git checkout'
alias gcp='git cherry-pick'
alias gl='git log'
alias ga='git add'
alias gb='git branch'

# Go to master, fetch, rebase. Prune and delete all local branches that were removed on origin.
alias gprune="git checkout master && git fetch && git rebase && git fetch --prune && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -d"