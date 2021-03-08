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

;; org-mode: org-store-link, org-capture keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)

;; todo keywords
(setq org-todo-keywords '((type "TODO(t)" "WORKING(w)" "|" "FAIL(f)" "CANCEL(c)" "DONE(d)")))

;; enable DONE logging
(setq org-log-done 1)
(setq org-log-into-drawer t)

;; prevent emacs from asking if it is safe to load the theme
(setq custom-safe-themes t)

;; set theme
(use-package underwater-theme)
(load-theme 'underwater)

(setq org-download-heading-lvl nil)
(setq org-download-image-dir "./images")
(setq org-download-method 'directory)

;; install org-download
(use-package org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

;; install undo-tree
(use-package undo-tree)
(global-undo-tree-mode 1)

(setq evil-want-C-u-scroll t)
(setq evil-undo-system 'undo-tree)

;; evil-mode
(setq evil-want-abbrev-expand-on-insert-exit nil)
(setq evil-want-keybinding nil)
(use-package evil
  :config
  (evil-mode 1))
(use-package evil-collection
  :after (evil)
  :config
  (setq evil-collection-mode-list '(dired))
  (evil-collection-init))
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))
(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
	    (lambda () (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; install persist
(use-package persist)

;; install org-drill
(add-to-list 'load-path "~/.config/emacs/plugins/org-drill")
(require 'org-drill)

(setq org-drill-hide-item-headings-p t)
(setq org-drill-maximum-items-per-session 10)
(setq org-drill-maximum-duration nil)
(setq org-drill-save-buffers-after-drill-sessions-p nil)
(setq org-drill-spaced-repetition-algorithm 'sm2)
(setq org-drill-add-random-noise-to-intervals-p t)

;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(persist use-package undo-tree underwater-theme org-roam org-download evil-surround evil-org evil-collection auto-compile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
