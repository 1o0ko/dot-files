#!/bin/bash

#install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#instal core utils to replace ls
brew install vim
brew install nvim
brew install coreutils
brew install python3

# install ipython
pip3 install ipython
