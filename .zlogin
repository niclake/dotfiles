# Aliases
alias be='bundle exec'
alias be1='bundle exec rails s'
alias be2='bundle exec rails c'
alias be3='bundle exec sidekiq -C config/sidekiq.yml'
alias be4='bundle exec script/delayed_job run'
alias lsa='ls -la'
alias dbnuke='be rake db:drop db:create db:migrate db:seed'
alias python='python3'

# zsh options
setopt no_case_glob
setopt auto_cd
setopt extended_history
SAVEHIST=5000
HISTSIZE=2000
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt correct
setopt correct_all
unsetopt histverify
autoload -Uz compinit && compinit

# Right side prompt
# Show time on inverted background
RPROMPT='%S%*%s'

# Git prompt

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability
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

source ~/.local/share/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
setopt prompt_subst
if [ "$color_prompt" = yes ]; then
    if [ -n "$POWERLINE" ]; then
        # PS1='${debian_chroot:+($debian_chroot)}\[\033[30;42m\]\u@\h\[\033[21;32;44m\]\[\033[30m\]\w\[\033[34m\]$(__git_ps1 "\[\033[21;34;105m\]\[\033[30m\]%s\[\033[95m\]")\[\033[49m\]\[\033[0m\]'
        PROMPT='test'
    else
        # PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]$(__git_ps1 "@\[\033[1;35m\]%s\[\033[0m\]")\[\033[32m\]\$\[\033[0m\] '
        PROMPT='%K{green}%F{black}%n@%m%K{blue}%F{green}%f%k%K{blue}%~%f%k%s%K{magenta}%F{blue}%F{black}$(__git_ps1 "%s")%K{default}%F{magenta}%f%k '
    fi
else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 "@%s")\$ '
    PROMPT='test3'
fi
unset color_prompt force_color_prompt

# Left side prompt
# niclake@Normandy:~/Documents/github@master*%=$
# export PS1='%B%K{green}%~%k%b $ '
# export PS1='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%~%f%b %# '
# PROMPT='%K{green}%F{black}%n@%m%K{blue}%F{green}%f%k%K{blue}:%~%K{default}%F{blue}%f%k%s$(__git_ps1 "@%K{magenta}%s%K{default}%F{magenta}%f%k") %(?.%F{green}$.%F{red}?%?)%f '
