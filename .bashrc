alias ll='ls -al'

alias gs='git status'
alias gc='git commit'
alias gd='git diff'
alias gch='git checkout'
alias gcp='git cherry-pick'
alias gl='git log'
alias ga='git add'
alias gb='git branch'

alias gpush='[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] && git push -u origin $(git symbolic-ref --short HEAD) || git push'

alias screenfix='xrandr --output eDP-1 --mode 1920x1080 -r 60 --pos 0x420 --output HDMI-1 --mode 1920x1080 -r 60 --pos 1920x420 --output HDMI-2 --mode 1920x1200 -r 60 --pos 3840x0 --rotate left'
alias screenfix2='xrandr --output eDP-1 --mode 1920x1080 -r 60 --pos 0x420 --output DP-1 --mode 1920x1200 -r 60 --pos 1920x420'
