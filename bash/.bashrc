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
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export MYSTUFF=$HOME'/workspace'
export PATH=~/.local/bin:$PATH

## aliases
alias eb='$EDITOR ~/.bashrc'
alias ev='$EDITOR ~/.vimrc'
alias ee='$EDITOR ~/.emacs'

# safety
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# list stuff
alias ls='ls --color=always'
alias l='ls --color=always --group-directories-first'
alias ll='ls -lh --color=always --group-directories-first'
alias l.='ls -a --color=always --group-directories-first'
alias ll.='ls -lah --color=always --group-directories-first'

# grep
alias grep='grep -i --color=always'

# reload bashrc
alias r='source ~/.bashrc'

# navigation 
alias ..='cd ..'
alias dev='cd $MYSTUFF/repos'
alias notes='cd $MYSTUFF/repos/notes'
alias dl='cd ~/Downloads'
alias bin='cd $MYSTUFF/repos/bin'
alias conf='cd ~/.config'
alias vmimages='cd ~/.local/share/libvirt/images'
alias repos='cd $MYSTUFF/repos'

# generate random string
alias rstr16='date | sha256sum | head -c 16'
alias rstr10='date | sha256sum | head -c 10'

# update debian
alias yuup='sudo apt update && sudo apt upgrade -y && sudo apt autoremove'
alias yush='sudo apt update && sudo apt upgrade -y && sudo apt autoremove && systemctl poweroff'
alias yure='sudo apt update && sudo apt upgrade -y && sudo apt autoremove && systemctl reboot'

# uncategorized
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
