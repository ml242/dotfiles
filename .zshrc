# VIMCONTROL
bindkey -v

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS=true
DISABLE_UPDATE_PROMPT=true
# HIST_STAMPS="mm/dd/yyyy"

plugins=(brew rails coffee sublime torrent vi-mode git git-remote-branch ruby battery bundler colored-man colorize )

source $ZSH/oh-my-zsh.sh

setopt CORRECT CORRECT_ALL

RPROMPT='$(battery_pct_remaining)'

# sets the title
case $TERM in
  xterm*)
  precmd () {print -Pn "\e]0;%n@%m: %~\a"}
  ;;
esac

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '>'
}

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
  hg prompt --angle-brackets "\
  < on %{$fg[magenta]%}<branch>%{$reset_color%}>\
  < at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
  %{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
  patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

function precompile
{
  bundle exec rake assets:precompile; git add --all .; git commit -m $1;
}

function install
{
  sudo apt-get install $1;
}

alias rakeitgood='rake db:drop;rake db:create;rake db:migrate;rake db:migrate RAILS_ENV=test;rake db:seed; rake db:seed RAILS_ENV=test;'
alias lyrics='sh ~/.config/pianobar/lyrics.sh'
alias pushitgood='git push origin master; git push heroku master;'
alias ll='ls -la'
alias reload='source ~/.zshrc'
alias pair='tmux new-session -s pair'
alias mysql='/usr/local/Cellar/mysql/5.6.15/support-files/mysql.server start'
alias sleep='osascript ~/Projects/automate/sleep.scpt'

