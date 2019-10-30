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

# gsearch "My commit" copies commit hash to clipboard
gsearch() {
 	COMMIT_GREPS=$(git log --grep "$1" | grep commit)
 	NUMBER_OF_HITS=$(printf "$COMMIT_GREPS" | wc -l)
 	if (($NUMBER_OF_HITS == 0)); then
 		echo "No commit found"
    fi
    # printf is more 1337 to use when not doing simple output to the user
    # awk prints second word which is git hash
    # tr removes newline at end
    # /dev/clipboard is the clipboard in cygwin (ie git for windows)
 	printf %b "$COMMIT_GREPS" | head -n 1 | awk '{print $2}' | tr -d '\n' > /dev/clipboard
 }