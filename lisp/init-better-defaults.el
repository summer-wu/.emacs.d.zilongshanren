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
       '(("\\.js\\'" . js2-mode))
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

(provide 'init-better-defaults)
