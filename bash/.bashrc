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
export EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'
export PAGER='less'
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
export PATH=~/.local/bin:$PATH
export MYSTUFF=$HOME'/workspace'
export WS_DIR=$HOME'/workspace'
export REPOS_DIR=$HOME'/workspace/repos'
export NOTES_DIR=$HOME'/workspace/repos/notes'
export LISTS_DIR=$HOME'/workspace/repos/lists'
export BIN_DIR=$HOME'/workspace/repos/bin'
export DEV_DIR=$BIN_DIR
export EMAIL_IDS_FILE=$NOTES_DIR/'email-ids.org'

## aliases
alias ip='ip -c'
alias p3='python3'
alias emailgen-ncd='echo TODO'
alias emailgen-acs='echo TODO'
alias emailgen-vcs='echo TODO'
alias python-script='cat ~/workspace/repos/templates/python/script.py'
alias perl-script='cat ~/workspace/repos/templates/perl/script.pl'
alias org-header='cat ~/workspace/repos/templates/org/header.org'
alias grepr='grep -r'
alias sn='search-notes'
alias nn='new-note'
alias lab='cd ~/workspace/repos/lab'
alias ws='cd ~/workspace'
alias org-header='cat ~/workspace/repos/templates/org/header.org'
alias ?vt='search-virustotal'
alias ?='search-duckduckgo'
alias emacs='emacsclient -t'
alias dot='cd $REPOS_DIR/dotfiles'
alias eb='$EDITOR ~/.bashrc'
alias ev='$EDITOR ~/.vimrc'
alias ee='$EDITOR ~/.emacs'
alias su='su -l'
alias du='du -h'
alias mkdir='mkdir -p'
alias c='clear'
alias ping='ping -c 1'
alias lock='gnome-screensaver-command -l'
alias off='systemctl poweroff'
alias reb='systemctl reboot'
alias semacs='sudo emacs'
alias ppjson='python -m json.tool'
alias bk='$EDITOR ~/workspace/notes/bookmarks'
alias ai='sudo apt update && sudo apt install -y'
alias au='sudo apt update && sudo apt upgrade -y && sudo apt autoremove'
alias as='apt search'
alias aush='sudo apt update && sudo apt upgrade -y && systemctl poweroff'
alias aure='sudo apt update && sudo apt upgrade -y && systemctl reboot'
alias tmpvm='virt-clone --connect qemu:///system --original debian12-gnome --name tmpvm --auto-clone && virsh --connect qemu:///system start tmpvm && virt-viewer --connect qemu:///system --attach tmpvm && virsh --connect qemu:///system undefine tmpvm && rm -f ~/.local/share/libvirt/images/tmpvm.qcow2'
alias dig='dig +noall +answer'
alias templates='cd ~/workspace/repos/templates'

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
alias r='source ~/.bashrc'

# navigation 
alias ..='cd ..'
alias dev='cd $DEV_DIR'
alias bin='cd $BIN_DIR'
alias notes='cd $NOTES_DIR'
alias lists='cd $LISTS_DIR'
alias dl='cd ~/Downloads'
alias conf='cd ~/.config'
alias vmimages='cd ~/.local/share/libvirt/images'
alias repos='cd $REPOS_DIR'

# generate random string
alias rstr16='date | sha256sum | head -c 16'
alias rstr10='date | sha256sum | head -c 10'

# update debian
alias yuup='sudo apt update && sudo apt upgrade -y && sudo apt autoremove'
alias yush='sudo apt update && sudo apt upgrade -y && sudo apt autoremove && systemctl poweroff'
alias yure='sudo apt update && sudo apt upgrade -y && sudo apt autoremove && systemctl reboot'

# functions
function search-notes(){
    grep -r $1 $NOTES_DIR
}

PATH="/home/ncd/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ncd/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ncd/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ncd/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ncd/perl5"; export PERL_MM_OPT;
