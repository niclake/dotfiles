source $HOME/.zshenv
eval "$(rbenv init - zsh)"

# Aliases
alias be='bundle exec'
alias be1='bundle exec rails s'
alias be2='bundle exec rails c'
alias be3='bundle exec sidekiq -C config/sidekiq.yml'
alias be4='bundle exec script/delayed_job run'
alias lsa='ls -la'
alias dbnuke='be rake db:drop db:create db:migrate db:seed'
alias python='python3'
alias displays='displayplacer "id:A3A1D2BC-173A-C0A3-982D-80DBCAD81789 res:1792x1120 hz:59 color_depth:4 scaling:on origin:(0,0) degree:0" "id:7BA2C2B2-441E-62F6-80F3-1F39973DFE6A res:1920x1080 hz:60 color_depth:8 scaling:off origin:(-1020,-1080) degree:0" "id:73E9140B-E9E4-A1D0-CF3F-A25229D81644 res:1920x1080 hz:60 color_depth:8 scaling:off origin:(900,-1080) degree:0"'

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
# Left side prompt
# Output: "niclake@[compname]>[current_dir]>[git status]> "
if [ "$color_prompt" = yes ]; then
    if [ -n "$POWERLINE" ]; then
        PROMPT='POWERLINE - config in .zlogin'
    else
        PROMPT='%K{green}%F{black}%n@%m%K{blue}%F{green}%f%k%K{blue}%~%f%k%s%K{magenta}%F{blue}%F{black}$(__git_ps1 "%s")%K{default}%F{magenta}%f%k '
    fi
else
    PROMPT='color_prompt=no - config in .zlogin'
fi
unset color_prompt force_color_prompt
