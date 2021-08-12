#!/bin/sh

pacman -Qi emacs >/dev/null 2>&1 || sudo pacman -S emacs

[ -d $HOME/.config/emacs ] || mkdir -p $HOME/.config/emacs

ln -sf $(realpath init.el) $HOME/.config/emacs/

[ -d $HOME/.config/emacs/plugins ] || mkdir -p $HOME/.config/emacs/plugins

ln -sf $(realpath plugins/org-copy-url) $HOME/.config/emacs/plugins/
ln -sf $(realpath plugins/org-random-heading) $HOME/.config/emacs/plugins/
ln -sf $(realpath plugins/org-drill) $HOME/.config/emacs/plugins/

[ -d $HOME/.local/share/applications ] || mkdir -p $HOME/.local/share/applications

ln -sf $(realpath applications/org-protocol.desktop) $HOME/.local/share/applications/

xdg-mime default org-protocol.desktop x-scheme-handler/org-protocol
