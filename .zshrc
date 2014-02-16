# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS=true
DISABLE_UPDATE_PROMPT=true
# HIST_STAMPS="mm/dd/yyyy"

plugins=(rails coffee sublime torrent vi-mode git git-remote-branch ruby battery bundler colored-man colorize )

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
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

function precompile
{
  bundle exec rake assets:precompile; git add --all .; git commit -m $1;
}

function rakeitgood
{
  rake db:drop;rake db:create;rake db:migrate;
}

function lyrics
{
  sh ~/.config/pianobar/lyrics.sh
}

function gc
{
  git add --all .; git commit -m $1;
}

function pushitgood
{
  git push origin master; git push heroku master;
}


alias ll='ls -la'
alias -s html=vim
alias reload='source ~/.zshrc'



# ---------------------
# environment variables for halo media
# ---------------------
export CHECKDIN_CLIENT_ID="7ea26e94d0302a90df576e239120fa53"
export CHECKDIN_SECRET="f5b4b66b091553ab7dfd2990ab97903a"
export CHECKDIN_BRIDGE_SECRET="1ce4e42b0ceec8c6fcc333b8"

# ---------------------
# environment variables for dossier
# ---------------------
export DOSSIER_FACEBOOK_KEY="762893740391021"
export DOSSIER_FACEBOOK_SECRET="cf0277b6889868c93fbc55fba000e38b"

# ---------------------
# environment variables for a little bit weird
# ---------------------
export ALBW_FACEBOOK_KEY="193987087470149"
export ALBW_FACEBOOK_SECRET="40d38cefa9c131dfb24b958c46bf1b34"
export ALBW_SOUNDCLOUD_ID="b6edd495981efe6b57613095aa9aef53"
export ALBW_SOUNDCLOUD_SECRET="fe02a037fe838753293fcfbd611ef838"
export ALBW_S3_BUCKET_NAME="albw"
export ALBW_AWS_ACCESS_KEY_ID="AKIAJNRZOU4TNX25E7GQ"
export ALBW_AWS_SECRET_ACCESS_KEY="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"
export ALBW_FOG_DIRECTORY="albw"

# ---------------------
# environment variables for advertunes
# ---------------------
export ADVERTUNES_SOUNDCLOUD_ID="714aaf1ed3f3eaf2a98301cf85db17bc"
export ADVERTUNES_SOUNDCLOUD_SECRET="375bb1a1c05a970f65efbaac3c2e5677"

# ---------------------
# environment variable for hintr
# ---------------------
export HIREFIRE_EMAIL="the.hintr@gmail.com"
export HIREFIRE_PASSWORD="fFupzWGIbcVICV60nP3"
export REDISTOGO_URL="redis://redistogo:8a72a9e6ab5d65445c8316ac23f112e8@koi.redistogo.com:10279/"
export HINTR_RESQUE_PASSWORD="DOMinators"
export HINTR_GMAIL_PASSWORD="OjAtsmcpUTuF9ZyxzwQpyno3n"
export HINTR_FACEBOOK_KEY="227056587454819"
export HINTR_FACEBOOK_SECRET="5754195624689764ff962b5cf70a0862"

# ---------------------
# environment variable for postgres username
# ---------------------
export PG_USERNAME="fijimunkii"

# ---------------------
# environment variable for google maps api key
# ---------------------
export GOOGLE_API_KEY="AIzaSyA-a8nqFDTgdlhHsVlyez9pQN-e5nuaifA"

# ---------------------
# environment variables kinder
# ---------------------
export KINDER_FACEBOOK_KEY="1416632615239905"
export KINDER_FACEBOOK_SECRET="8bcd5b4ccc9b3357f295e08d2120c26f"
