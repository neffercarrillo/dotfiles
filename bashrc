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

# update
alias yup='sudo dnf update -y'

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


# prompt
# 
# code to show git branch
# 
blue="\033[0;34m"
white="\033[0;37m"
green="\033[0;32m"

# brackets needed around non-printable characters in PS1
git_blue='\['"$blue"'\]'
git_green='\['"$green"'\]'
git_white='\['"$white"'\]'

parse_git_branch() {
    gitstatus=`git status 2> /dev/null`
    if [[ `echo $gitstatus | grep "Changes to be committed"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1***)/'
    elif [[ `echo $gitstatus | grep "Changes not staged for commit"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1**)/'
    elif [[ `echo $gitstatus | grep "Untracked"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1*)/'
    elif [[ `echo $gitstatus | grep "nothing to commit"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    else
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1?)/'
    fi
}

# Echo a non-printing color character depending on whether or not the current git branch is the master    
# Does NOT print the branch name                                                                          
# Use the parse_git_branch() function for that.                                                           
parse_git_branch_color() {
    br=$(parse_git_branch)
    if [[ $br == "(master)" || $br == "(master*)" || $br == "(master**)" || $br == "(master***)" ]]; then
        echo -e "${blue}"
    else
        echo -e "${green}"
    fi
}

# With color:
#export PS1="$git_white[\u@\h $git_white\W\[\$(parse_git_branch_color)\]\$(parse_git_branch)$git_white]\$$git_white "

#export PS1="$git_white\u@\h $git_white\w\$(parse_git_branch_color)\$(parse_git_branch)$git_white\n\$$git_white "

#
# prompt design
#

# prompt
PS1="$git_white\u"
PS1+='@'
PS1+='\h'             # hostname
PS1+=':'              # space after hostname
PS1+="\w$(parse_git_branch_color)\$(parse_git_branch)$git_white"             # current working directory
PS1+=' '              # space after user symbol
# PS1+='\n'           # add a line carriage at the end of the line before cursor
PS1+='\$'             # user symbol ($ for user or # for root)
PS1+=' '              # space after user symbol
export PS1


## autoexecute
# clear history on log in
cat /dev/null > ~/.bash_history && history -c


