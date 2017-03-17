(setq ring-bell-function 'ignore)
(global-linum-mode t)
(global-auto-revert-mode t)
(setq make-backup-files nil) ;;保存的时候复制一份，尾巴加~
(setq auto-save-default nil) ;;禁止auto-save-list，也就不会生成 #filename#

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode 1)

;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8zl" "zilongshanren")))

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))


(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p);;把yes no提示改为y n
;;(setq dired-recursive-deletes 'always) ;;这样就不用重复两次y了
(setq dired-recursive-copies 'always)
(require 'dired-x);;C-x C-j打开当前buffer所在目录
(setq dired-dwim-target t);;打开两个buffer的时候会自动猜目标目录

(defun occur-dwim ()
  "call occur with a sane default"
(interactive)
(push (if (region-active-p)
	  (buffer-substring-no-properties
	   (region-beginning)
	   (region-end))
	(let ((sym (thing-at-point 'symbol)))
	  (when (stringp sym)
	    (regexp-quote sym))))
      regexp-history)
(call-interactively 'occur))

(provide 'init-better-defaults)
