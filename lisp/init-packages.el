(require 'package)
(require 'cl)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; package init
(defvar my/packages '(
		      ;; -- Auto-conpletion --
		      company
		      ;; better editor
		      popwin
		      hlinum
		      ;; -- Major mode --
		      js2-mode
		      php-mode
		      web-mode
		      ;; -- Themes --
		      monokai-theme
		      ))

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; cl - Common Lisp Extension
(require 'cl)


;; 文件末尾
(provide 'init-packages)
