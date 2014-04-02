#!/bin/bash

# README
#
# 1. See config
# 2. enjoy

source config

printf "installing things.."

case $OSTYPE 

  in darwin*)

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

    brew_taps=( phize/cask )
    brew_installs=( brew-cask gpg openssh openssl ack git curl wget tmux tmate
      vagrant bash bash-completion zsh vim irssi pianobar terminal-notifier
      autojump ruby-build rbenv node imagemagick cmatrix mongodb hub cowsay
      'mpd --with-libshout --with-lame --with-twolame --with-flac --with-lastfm --with-yajl'
      mpc pbcopy pass go )
    brew_links=( sqlite )
    cask_installs=( little-snitch flux chromium aurora transmission vlc steam
      istat-menus virtualbox transmit divvy skype sketch postgres clipmenu cloud
      smcfancontrol dash spotify spotifree spotify-notifications spotify-menubar
      sublime-text the-unarchiver trim-enabler heroku-toolbelt electric-sheep )
    
    brew update
    brew doctor
    for that in ${brew_taps[*]}; do brew tap $that; done
    for that in ${brew_installs[*]}; do brew install $that; done
    for that in ${cask_installs[*]}; do brew cask install $that; done

    pushd ~
    gpg --batch --gen-key $GPG_CONFIG
    gpg --no-default-keyring --secret-keyring ./gpgkey.sec \
            --keyring ./gpgkey.pub
    popd

    mkdir -p ~/Projects/go/src
    pushd ~/Projects/go/src
    git clone git@github.com:neeee/mpdviz.git
    cd mpdviz
    go get
    go build
    popd

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

    # Trackpad
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
    defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
    defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

    # Enables keyboard control in OSX dialogs
    defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

    # Screensaver
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0

    # Screenshot
    defaults write com.apple.screencapture location -string "$HOME/Desktop"

    # Finder
    defaults write com.apple.finder AppleShowAllFiles -bool true
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    defaults write com.apple.finder QLEnableTextSelection -bool true
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.frameworks.diskimages skip-verify -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
    defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
    defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
    defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

    # Save
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

    # Printing
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

    # Launching Updating and Crashing Software
    defaults write com.apple.LaunchServices LSQuarantine -bool false
    defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
    defaults write com.apple.CrashReporter DialogType -string "none"
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

    # Trash
    defaults write com.apple.finder WarnOnEmptyTrash -bool false
    defaults write com.apple.finder EmptyTrashSecurely -bool true

    # Enables Airdrop to hackintoshes
    defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

    # Disables the dashboard
    defaults write com.apple.dashboard mcx-disabled -boolean NO

    # Expose Corners
    defaults write com.apple.dock wvous-tl-corner -int 6 # Top-Left: Display Off 
    defaults write com.apple.dock wvous-tr-corner -int 2 # Top-Right: All Windows
    defaults write com.apple.dock wvous-bl-corner -int 5 # Bot-Left: Screensaver
    defaults write com.apple.dock wvous-br-corner -int 4 # Bot-Right: Desktop

    # Safari
    defaults write com.apple.Safari HomePage -string "about:blank"
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
    defaults write com.apple.Safari \
      com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
    defaults write com.apple.Safari ShowFavoritesBar -bool false
    defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
    defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
    defaults write com.apple.Safari ProxiesInBookmarksBar "()"
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari \
      com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
    defaults write com.apple.appstore WebKitDeveloperExtras -bool true

    # Itunes
    defaults write com.apple.iTunes show-store-link-arrows -bool false
    defaults write com.apple.iTunes disableGeniusSidebar -bool true
    defaults write com.apple.iTunes disablePingSidebar -bool true
    defaults write com.apple.iTunes disablePing -bool true
    defaults write com.apple.iTunes disableRadio -bool true
    defaults write com.apple.iTunes NSUserKeyEquivalents \
      -dict-add "Target Search Field" "@F"

    # Time Machine
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

    # TextEdit
    defaults write com.apple.TextEdit RichText -int 0
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

    # Disk Utility
    defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
    defaults write com.apple.DiskUtility advanced-image-options -bool true

  ;; in linux-gnu)

    apt_installs=( vim )
    sudo apt-get update
    for that in ${apt_installs[*]}; do sudo apt-get install $that; done 


  ;; in freebsd*)

  ;; in cygwin)

  ;; in win32)

  ;;
esac

dotfiles=$( ls -d .* )
for dotfile in ${dotfiles[*]}; do cp -r $dotfile ~; done

printf "..all set!  \n\n:)"
