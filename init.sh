#!/bin/bash


printf "installing things.."

case $OSTYPE 

  in darwin*)

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

    brew_taps=( phize/cask )
    brew_installs=( 
      automake cmake coreutils gpg openssh openssl ack tmux tmate vagrant 
      brew-cask git curl wget bash bash-completion zsh vim irssi pianobar 
      terminal-notifier autojump ruby-build rbenv node imagemagick cmatrix
      sqlite hub cowsay pbcopy )
    brew_links=( sqlite )
    cask_installs=(
      little-snitch flux chromium aurora transmission vlc steam istat-menus
      virtualbox transmit mou skype sketch postgres clipmenu cloud dash divvy 
      smcfancontrol spotify spotifree spotify-notifications spotify-menubar
      sublime-text the-unarchiver trim-enabler heroku-toolbelt electric-sheep )
    
    brew update
    brew doctor
    for that in ${brew_taps[*]}; do brew tap $that; printf "."; done
    for that in ${brew_installs[*]}; do brew install $that; printf "."; done
    for that in ${cask_installs[*]}; do brew cask install $that; printf "."; done

    curl -L http://install.ohmyz.sh | sh

    easy_install pip

    npm install -g grunt-cli bower yo

    rbenv install 2.1.1
    rbenv global 2.1.1
    gem install bundler
    gem install lolcat
    gem install sass

    vagrant plugin install vagrant-omnibus
    gem install test-kitchen
    gem install berkshelf


  ;; in linux-gnu)

    apt_installs=( vim )
    sudo apt-get update
    for that in ${apt_installs[*]}; do sudo apt-get install $that; printf "."; done 


  ;; in freebsd*)

  ;; in cygwin)

  ;; in win32)

esac

dotfiles=$( ls -d .* )
for dotfile in ${dotfiles[*]}; do cp -r .$dotfile ~; printf "."; done

printf "..all set!  \n\n:)"
