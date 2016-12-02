(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
(require 'init-packages)
(require 'init-web-mode)

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

;; php indentation
;; https://www.emacswiki.org/emacs/PhpMode#toc18
(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

(defun unindent-closure ()
  "Fix php-mode indent for closures"
  (let ((syntax (mapcar 'car c-syntactic-context)))
    (if (and (member 'arglist-cont-nonempty syntax)
             (or
              (member 'statement-block-intro syntax)
              (member 'brace-list-intro syntax)
              (member 'brace-list-close syntax)
              (member 'block-close syntax)))
       (save-excursion
          (beginning-of-line)
          (delete-char (* (count 'arglist-cont-nonempty syntax)
                          c-basic-offset))) )))

(add-hook 'php-mode-hook
          (lambda ()
            (add-hook 'c-special-indent-hook 'unindent-closure)))

;; enable ido
(require 'ido)
(ido-mode t)

;; open recent-edit file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x f") 'other-frame)

;; set tab
;; If you don’t want tabs, add (setq-default indent-tabs-mode nil) in your .emacs
;; If you want to indent only with tabs, use: (setq indent-tabs-mode t). Moreover you might need to call (web-mode-use-tabs) in your web-mode hook.
;; TAB width can be set this way: (setq-default tab-width 4)
;; http://web-mode.org/
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
