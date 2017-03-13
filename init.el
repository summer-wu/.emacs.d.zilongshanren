;;这是手动设置的，下面是通过custom界面设置的
(add-to-list 'default-frame-alist
	     '(font . "Menlo-16"))


;; ----------------------------
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(message package-archives) 这个时候这个变量还是void
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/")
                         ;("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ))
(package-initialize)



;;day1 --------------------
(tool-bar-mode -1)
;(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(global-linum-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-company-mode t)



;;day2 ---------------------
(require 'cl) ;;import common lisp
(defvar zilongshanren/packages '(
					  company
					  monokai-theme
					  hungry-delete
					  counsel
					  smartparens
					  js2-mode
				 ) "Default packages")
(setq package-selected-packages zilongshanren/packages)
(defun zilongshanren/packages-installed-p ()
  (loop for pkg in zilongshanren/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(setq-default cursor-type 'bar)
(setq make-backup-files nil)

(require 'org) ;加载FEATURE（所有已加载的特性保存在features），这里没有提供FILENAME，在load-path中搜索FIL   ENAME
(setq org-src-fontify-natively t) ;在BEGIN_SRC中的代码也着色

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode 1)
;;<s TAB在org mode下会补全为SRC block

(setq initial-frame-alist '((fullscreen . maximized)))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(global-hl-line-mode t)
;;(load-theme 'monokai t)

(require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;(smartparens-global-mode t)
;;org mode下 M-Return 会自动修正前面的index号码

;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;;-------------下面是通过M-x customize自动配置的
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(company-tooltip-idle-delay 0.08)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))

