;;(message package-archives) 这个时候这个变量还是void
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/")
                         ;("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ))
  
(require 'cl) ;;import common lisp
(defvar zilongshanren/packages '(
					  company
					  monokai-theme
					  hungry-delete
					  counsel
					  smartparens
					  js2-mode
					  popwin
					  
				 ) "Default packages")
(setq package-selected-packages zilongshanren/packages)
(defun zilongshanren/packages-installed-p ()
  (loop for pkg in zilongshanren/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (zilongshanren/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg zilongshanren/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(require 'hungry-delete)
(global-hungry-delete-mode)


(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;(smartparens-global-mode t);会导致自动输入两个单引号

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(global-company-mode t)

;;(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
