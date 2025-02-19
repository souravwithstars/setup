#!/usr/bin/env sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -nv true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/souravwithstars/setup/main/Brewfile > Brewfile
curl https://raw.githubusercontent.com/souravwithstars/setup/main/Brewfile.lock.json > Brewfile.lock.json

brew update
brew bundle install
rm Brewfile Brewfile.lock.json

echo "setup completed..."
say "setup completed..."
