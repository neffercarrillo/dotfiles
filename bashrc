# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

## environment
export BROWSER='firefox'
export EDITOR='emacs'
export VISUAL='emacs'
export PAGER='less'
export MYDOCS='workspace'
export GITHUB_USER='nocd'


## aliases
# safety
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# list stuff
alias l='ls --color=always'
alias ll='ls -l'
alias l.='ls -a'
alias ll.='ls -la'

# reload bashrc
alias r='source ~/.bashrc'

# navigation 
alias ..='cd ..'

# generate random string
alias rstr16='date | sha256sum | head -c 16 ; echo'
alias rstr10='date | sha256sum | head -c 10 ; echo'

# update
alias yuup='sudo dnf update -y'
alias yush='sudo dnf update -y;shutdown -h now'
alias yure='sudo dnf update -y;shutdown -r now'

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


## autoexecute
# clear history on log in
cat /dev/null > ~/.bash_history && history -c


