(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
(require 'init-packages)

;; js2-mode init
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; load theme
(load-theme 'monokai 1)

;; custom setting
(setq linum-mode 1)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(set-face-attribute 'default nil :height 140)
(global-hl-line-mode 1)

(setq make-backup-files nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(require 'popwin)
(popwin-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

;; c-x c-j enable
(require 'dired-x)

;; display line numbers
(setq linum-format "%4d \u2502")
(add-hook 'prog-mode-hook 'linum-mode)
;;
(require 'hlinum)
(hlinum-activate)

;; php indent with tab 
(defun my-php-mode-hook ()
  (setq indent-tabs-mode t)
  (let ((my-tab-width 4))
    (setq tab-width my-tab-width)
    (setq c-basic-indent my-tab-width)
    (set (make-local-variable 'tab-stop-list)
         (number-sequence my-tab-width 200 my-tab-width))))

(add-hook 'php-mode-hook 'my-php-mode-hook)

;; enable ido
(require 'ido)
(ido-mode t)

;; open recent-edit file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
