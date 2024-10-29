# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# clear history on log in
cat /dev/null > ~/.bash_history && history -c

# environment
export BROWSER='firefox'
export EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'
export PAGER='less'
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
export PATH=~/.local/bin:$PATH
export WS_DIR=$HOME'/workspace'
export REPOS_DIR=$WS_DIR'/repos'
export LOCAL_REPOS=$REPOS_DIR'/local'
export GH_REPOS=$REPOS_DIR'/github/neffercarrillo'
export NOTES_DIR=$LOCAL_REPOS'/notes'
export LISTS_DIR=$LOCAL_REPOS'/lists'
export BIN_DIR=$LOCAL_REPOS'/bin'
export TEMPLATES_DIR=$LOCAL_REPOS'/templates'

## aliases

# misc.
alias diff='diff -y'
alias chx='chmod u+x'
alias play-dnb='mpv https://azura.drmnbss.org/public/dnbradio?autoplay='
alias ip='ip -c'
alias p3='python3'
alias python-script='cat ~/workspace/repos/templates/python/script.py'
alias perl-script='cat ~/workspace/repos/templates/perl/script.pl'
alias org-header='cat ~/workspace/repos/templates/org/header.org'
alias grepr='grep -r'
alias sn='search-notes'
alias nn='new-note'
alias org-header='cat ~/workspace/repos/templates/org/header.org'
alias ?vt='search-virustotal'
alias ?='search-duckduckgo'
alias emacs='emacsclient -t'
alias su='su -l'
alias du='du -h'
alias mkdir='mkdir -p'
alias c='clear'
alias ping='ping -c 10'
alias lock='gnome-screensaver-command -l'
alias off='systemctl poweroff'
alias reb='systemctl reboot'
alias semacs='sudo emacs'
alias ppjson='python -m json.tool'
alias tmpvm='virt-clone --connect qemu:///system --original debian12-gnome --name tmpvm --auto-clone && virsh --connect qemu:///system start tmpvm && virt-viewer --connect qemu:///system --attach tmpvm && virsh --connect qemu:///system undefine tmpvm && rm -f ~/.local/share/libvirt/images/tmpvm.qcow2'
alias dig='dig +noall +answer'

# quick edits
alias eb='$EDITOR ~/.bashrc'
alias ev='$EDITOR ~/.vimrc'
alias ee='$EDITOR ~/.emacs'
alias et='$EDITOR ~/.tmux.conf'
alias net+='$EDITOR $NOTES_DIR/network+.org'

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
alias grep='grep -i --color=always'

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
alias gh='cd $GH_REPOS'
alias templates='cd ~/workspace/repos/templates'
alias dot='cd $GH_REPOS/dotfiles'

# generate random string
alias rstr16='date | sha256sum | head -c 16'
alias rstr10='date | sha256sum | head -c 10'

# git
alias gic='git commit -m'
alias gil='git log'
alias gis='git status'
alias gir='git remote'
alias gib='git branch'
alias gia='git add -A'
alias gico='git checkout'
alias gim='git merge'
alias giac='git add -A;git commit -m'

# functions
function search-notes(){
    grep -r $1 $NOTES_DIR
}

PATH="/home/$USER/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/$USER/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/$USER/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/$USER/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/$USER/perl5"; export PERL_MM_OPT;
