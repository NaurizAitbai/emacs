;; add repositories
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; install use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; configure use-package and autoinstalling
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;; disable menubar, toolbar and scrollbar
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

;; disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; set font
(set-face-attribute 'default nil :font "Iosevka")

;; enable org-copy-url
(add-to-list 'load-path "~/.config/emacs/plugins/org-copy-url")
(require 'org-copy-url)

;; enable org-random-heading
(add-to-list 'load-path "~/.config/emacs/plugins/org-random-heading")
(require 'org-random-heading)

;; open links by qutebrowser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser")

;; wrap words for org-mode
(add-hook 'org-mode-hook '(lambda() (visual-line-mode 1)))

;; org-mode: org-store-link, org-capture, org-agenda keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; todo keywords
(setq org-todo-keywords '((type "TODO(t)" "WORKING(w)" "|" "FAIL(f)" "CANCEL(c)" "DONE(d)")))

;; prevent emacs from asking if it is safe to laod the theme
(setq custom-safe-themes t)

;; set theme
(use-package underwater-theme)
(load-theme 'underwater)

;; line cursor and no blink
(set-default 'cursor-type '(bar . 1))
(blink-cursor-mode 0)

;; install org-roam
(use-package org-roam)

;; start org-roam-mode when emacs starts
(add-hook 'after-init-hook 'org-roam-mode)

;; define key bindings for org-roam
(global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") #'org-roam-insert)
(global-set-key (kbd "C-c n /") #'org-roam-find-file)
(global-set-key (kbd "C-c n b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") #'org-roam-find-directory)

;; assign undo to C-z
(global-set-key (kbd "C-z") 'undo)
