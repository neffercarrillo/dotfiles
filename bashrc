# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


## autoexecute
# clear history on log in
cat /dev/null > ~/.bash_history && history -c


## environment
export BROWSER='firefox'
export EDITOR='emacs'
export VISUAL='emacs'
export PAGER='less'
export MYDOCS='workspace'
export GITHUB_USER='nocd'
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


## aliases
# safety
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# list stuff
alias l='ls --color=always'
alias ll='ls -l --color=always'
alias l.='ls -a --color=always'
alias ll.='ls -la --color=always'

# reload bashrc
alias r='source ~/.bashrc'

# navigation 
alias ..='cd ..'

# generate random string
alias rstr16='date | sha256sum | head -c 16 ; echo'
alias rstr10='date | sha256sum | head -c 10 ; echo'

## update fedora
# alias yuup='sudo dnf update -y'
# alias yush='sudo dnf update -y;shutdown -h now'
# alias yure='sudo dnf update -y;shutdown -r now'

# update debian
alias yuup='sudo apt update && sudo apt upgrade -y'
alias yush='sudo apt update && sudo apt upgrade -y && sudo shutdown -h now'
alias yure='sudo apt update && sudo apt upgrade -y && sudo shutdown -r now'

# uncategorized
alias su='su -l'
alias du='du -h'
alias mkdir='mkdir -p'
alias c='clear'
alias ping='ping -c 1'
alias lock='gnome-screensaver-command -l'
alias off='sudo shutdown -h now'
alias reb='sudo shutdown -r now'
alias semacs='sudo emacs'
alias ct='crontab `$MYDOCS/config/crontab`'
alias ppjson='python -m json.tool'
