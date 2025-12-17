# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# clear history on log in
cat /dev/null > ~/.bash_history && history -c

## environment

# global
export BROWSER='firefox'
export EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'
export PAGER='less --use-color --color=dm'
export PATH=$PATH:~/.local/bin
export PS1_COLOR_USER='\[\e[1;33m\]'
export PS1_COLOR_AT='\[\e[1;33m\]'
export PS1_COLOR_HOST='\[\e[32m\]'
export PS1_COLOR_COLON='\[\e[01m\]'
export PS1_COLOR_PWD='\[\e[36m\]'
export PS1_COLOR_GIT='\[\e[1;35m\]'
export PS1_COLOR_PRIVS='\[\e[1m\]'
export PS1_COLOR_STOP='\[\e[00m\]'
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
    export PS1=$PS1_COLOR_USER'\u'$PS1_COLOR_AT'@'$PS1_COLOR_HOST'\h'$PS1_COLOR_COLON':'$PS1_COLOR_PWD'\w'$PS1_COLOR_GIT'$(__git_ps1)\n'$PS1_COLOR_PRIVS'\$ '$PS1_COLOR_STOP
else
    export PS1=$PS1_COLOR_USER'\u'$PS1_COLOR_AT'@'$PS1_COLOR_HOST'\h'$PS1_COLOR_COLON':'$PS1_COLOR_PWD'\w\n'$PS1_COLOR_PRIVS'\$ '$PS1_COLOR_STOP
fi

# local
if [ -f ~/workspace/repos/local/config/bash/local.bash ]; then
    source ~/workspace/repos/local/config/bash/local.bash
fi

## aliases

# misc.
alias internet?='ping -c 10 8.8.8.8'
alias python='python3'
alias new-ssh-key='ssh-keygen -t ecdsa -b 521'
alias diff='diff -y'
alias chx='chmod u+x'
alias play-dnb='mpv https://azura.drmnbss.org/public/dnbradio?autoplay='
alias ip='ip -c'
alias p3='python3'
alias sn='search-notes'
alias nn='new-note'
alias ?perl='perldoc -q'
alias ?='search-duckduckgo'
alias emacs='emacsclient -t'
alias su='su -l'
alias du='du -h'
alias mkdir='mkdir -p'
alias c='clear'
alias ping='ping -c 10'
alias lock='gnome-screensaver-command -l'
alias ppjson='python -m json.tool'
alias tmpvm='virt-clone --connect qemu:///session --original debian-gnome --name tmpvm --auto-clone && virsh --connect qemu:///session start tmpvm && virt-viewer --connect qemu:///session --attach tmpvm && virsh --connect qemu:///session undefine tmpvm && rm -f ~/.local/share/libvirt/images/tmpvm.qcow2'
alias dig='dig +noall +answer'
alias ts='tmux new-session -A -s'
alias dd='dd status=progress'

# quick edits
alias eb='$EDITOR ~/.bashrc'
alias ev='$EDITOR ~/.vimrc'
alias ee='$EDITOR ~/.emacs'
alias et='$EDITOR ~/.tmux.conf'

# apt
alias ai='sudo apt update && sudo apt install -y'
alias au='sudo apt update && sudo apt upgrade -y && sudo apt autoremove'
alias as='apt search'
alias aush='sudo apt update && sudo apt upgrade -y && systemctl poweroff'
alias aure='sudo apt update && sudo apt upgrade -y && systemctl reboot'

# safety
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# list stuff
alias ls='ls -Fh --color=always --group-directories-first'
alias l='ls'
alias l.='ls -a'
alias ll='ls -l'
alias ll.='ls -la'

# grep
alias grepr='grep -r'

# reload bashrc
alias r='source ~/.bashrc;echo ".bashrc reloaded."'

# navigation 
alias ..='cd ..'
alias dev='cd $BIN_DIR'
alias bin='cd $BIN_DIR'
alias notes='cd $NOTES_DIR'
alias lists='cd $LISTS_DIR'
alias dl='cd ~/Downloads'
alias conf='cd ~/.config'
alias vmimages='cd ~/.local/share/libvirt/images'
alias repos='cd $REPOS_DIR'
alias lab='cd $GH_REPOS/lab'
alias ws='cd $WS_DIR'
alias rgh='cd $GH_REPOS'
alias rlo='cd $LOCAL_REPOS'
alias templates='cd $LOCAL_REPOS/templates'
alias dot='cd $GH_REPOS/dotfiles'
alias books='cd $WS_DIR/books'
alias ref='cd $WS_DIR/reference'

# generate random string
alias rstr16='date | sha256sum | head -c 16 | wl-copy'
alias rstr10='date | sha256sum | head -c 10 | wl-copy'

# git
alias gic='git commit -m'
alias gil='git log'
alias gis='git status'
alias gir='git remote'
alias gib='git branch'
alias gia='git add -A'
alias gico='git checkout -b'
alias gim='git merge'
alias giac='git add -A;git commit -m'
alias gip='git push'

# functions
function search-notes(){
    grep -r $1 $NOTES_DIR
}
