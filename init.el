;;这是手动设置的，下面是通过custom界面设置的

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'default-frame-alist
	     '(font . "Menlo-16"))


;; ----------------------------
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)


;;day1 --------------------
(tool-bar-mode -1)
;(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(global-linum-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)




;;day2 ---------------------


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



(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;org mode下 M-Return 会自动修正前面的index号码

;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)




;;day3----------

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8zl" "zilongshanren")))
(setq ring-bell-function 'ignore)


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

