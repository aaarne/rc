# RC files
My personal configuration files for my standard tools on linux

```bash
git clone --recursive https://github.com/aaarne/rc.git
cd rc
ln -sr vimrc ~/.vimrc 
ln -sr tmux-config/.tmux.conf ~/.tmux.conf
ln -sr config.sway ~/.config/sway/config
ln -sr config.fish ~/.config/fish/config.fish
```

## vim

call `:PlugInstall` once. Done.

## tmux

follow the readme in the subrepo to get the nice status bar

