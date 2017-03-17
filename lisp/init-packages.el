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
				 reveal-in-osx-finder
				 web-mode
				 js2-refactor
				 expand-region
				 iedit
				 helm-ag
				 flycheck
				 auto-yasnippet
				 evil
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
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t);只有这一行时，autoload会导致自动输入两个单引号
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)'
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens.在括号内也可以高亮括号"
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
;;不知道为什么要调用两次才能生效
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens.在括号内也可以高亮括号"
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(global-company-mode t)

;;(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

;;web-mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

;;config js2-refactor
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
;;(add-hook 'js2-mode-hook 'global-flycheck-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;config expand-region
(require 'expand-region)

(require 'iedit) ;;会引入它的快捷键C-;

;;yasnippets
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)



(provide 'init-packages)

