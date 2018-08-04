## OSX Quick Reference

### OSX

* Boot options
  * Recovery mode: ⌘  + r
  * Startup manager (select usb, external disks): alt/option
  * Safe boot: Shift
  * Verbose mode: ⌘  + v
  * Single user mode: ⌘  + s
  * PRAM: ⌘  + alt/option + p + r
  * Apple Diagnostics local: d
  * Apple Diagnostics over the internet: alt/option + d

* Relaunch Finder
alt+right_click finder icon in doc -> select Relaunch

* Make dtrace work
  1. Boot OSX in Recovery mode: Hold ⌘ r during reboot
  2. Enter in terminal:
      ```
      csrutil disable
      csrutil enable --without dtrace
      ```
  3. Ignore warnings
  4. Reboot

* Change Screenshot default folder
defaults write com.apple.screencapture location ~/Pictures/screenshots; 
killall SystemUIServer

* Screenshot 
  * screen: cmd+shift+3
  * selection: cmd+shift+4
  * window: cmd+shift+4, then Space

<br>

### BREW

* install Xcode command line tools

```
xcode-select --install
```

* install brew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* disable analytics

```
brew analytics off
```

* Remove a homebrew package with all it's dependencies

```
brew rmtree <package>
```

* update brew

```
brew update
```

* upgrade brew

```
brew upgrade
```

* clean old package install

```
brew cleanup
```

* cask install

```
brew cask install
```

* cask clean old package install

```
brew cask cleanup
```

* search casks

```
brew cask search
```

* uninstall casks

```
brew cask uninstall
```

* list tapped repos

```
brew tap
```

* add tap

```
brew tap <user/repo>
```

* remove a tap

```
brew untap <user/repo>
```


<br />

### iTerm2

* install: [iTerm2](https://iterm2.com/downloads.html)
* themes: [iTerm2 Color Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)

<br>

### NEOVIM

* install with Python support

```
brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade
```

* add this to `~/.config/nvim/init.vim`

```
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
```

* install neovim

```
brew install neovim
```

* References: [Neovim with Python on OSX](https://ricostacruz.com/til/neovim-with-python-on-osx)

<br>

### FISH

* install fish

```
brew install fish --HEAD
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

* install fisherman

```
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
```

* update fisher

```
fisher up
```

* list remote packages

```
fisher ls-remote
```

* install package

```
fisher z
```

* uninstall package

```
fisher rm z
```

* setup theme

```
set -U omf/theme-gnuykeay
```

* setup vi keys

```
set -U fish_key_bindings fish_vi_key_bindings
```

* prettier mode indicator

```
# ~/.config/fish/functions/fish_mode_prompt.fish
function fish_mode_prompt --description 'Displays the current mode'
                        # Do nothing if not in vi mode
                        if test "$fish_key_bindings" = "fish_vi_key_bindings"
                            switch $fish_bind_mode
                                case default
                                    set_color --bold red
                                    echo 🅽
                                case insert
                                    set_color --bold green
                                    echo 🅸
                                case replace-one
                                    set_color --bold green
                                    echo 🆁
                                case visual
                                    set_color --bold brmagenta
                                    echo 🆅
                            end
                            set_color normal
                            printf " "
                        end
                    end
```

Reference: [issues/3232](https://github.com/fish-shell/fish-shell/issues/3232)

* update fish commands and parameters

    `fish_update_completions`

* Resources: [Fish Shell Setup OSX](https://ellerbrock.github.io/fish-shell-setup-osx/)
