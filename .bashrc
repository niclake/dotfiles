# Aliases
alias be='bundle exec'
alias be1='bundle exec rails s'
alias be2='bundle exec rails c'
alias be3='bundle exec sidekiq -C config/sidekiq.yml'
alias be4='bundle exec script/delayed_job run'
alias lsa='ls -la'
alias dbnuke='be rake db:drop db:create db:migrate db:seed'
alias python='python3'

# show path before the $ prompt
export PS1='\u:\w $ '



# This is all of Jeremiah's stuff below here

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x '/usr/bin/tput' ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

# Modified from Ubuntu's defaults to include Git prompt
. ~/.local/share/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_STATESEPARATOR=
if [ "$color_prompt" = yes ]; then
    if [ -n "$POWERLINE" ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[30;42m\]\u@\h\[\033[21;32;44m\]\[\033[30m\]\w\[\033[34m\]$(__git_ps1 "\[\033[21;34;105m\]\[\033[30m\]%s\[\033[95m\]")\[\033[49m\]\[\033[0m\]'
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]$(__git_ps1 "@\[\033[1;35m\]%s\[\033[0m\]")\[\033[32m\]\$\[\033[0m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 "@%s")\$ '
fi
unset color_prompt force_color_prompt

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
