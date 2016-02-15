# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

#bash_history
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

#Add keys
#. $HOME/.ssh/ssh-login

cd


