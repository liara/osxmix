#!/usr/bin/env fish

echo 'start updating ...'

echo 'updating homebrew'
brew update
brew upgrade
brew cleanup
brew doctor
echo 'Ignore greenlet warnings. Had to be installed for neovim python.'
brew cask upgrade
brew cask cleanup

echo 'updating fish shell'
fisher up

# modify the prompt, make it a fish
tail -n 2 "$HOME/.config/fish/functions/fish_prompt.fish" | wc -c | xargs -I {} gtruncate "$HOME/.config/fish/functions/fish_prompt.fish" -s -{}
cat $HOME/.config/fish/functions/alter_prompt.txt >> $HOME/.config/fish/functions/fish_prompt.fish
fish_update_completions

echo 'updating python and pip pkgs'
python -m pip install --upgrade pip setuptools wheel
pip list --outdated
pip list --outdated | awk '{print $1}' | xargs -n1 -p sudo -H pip install --upgrade
python3 -m pip install --upgrade pip setuptools wheel
pip3 list --outdated
pip3 list --outdated | awk '{print $1}' | xargs -n1 -p sudo -H pip install --upgrade

#echo 'updating npm'
#npm update -g

echo 'checking Apple Updates'
/usr/sbin/softwareupdate -ia

exit 0
