
(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c p f") 'counsel-git)

;;day04
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "s-/") 'hippie-expand)
(with-eval-after-load 'dired ;;懒加载
  (put 'dired-find-alternate-file 'disabled nil) ;;默认自动写入init.el中
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ;;避免生成很多dired buffer
  )

;;day05
(global-set-key (kbd "M-s i") 'counsel-imenu)

;;day06
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-s o") 'occur-dwim)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;C-w默认是kill-region，改成backward-kill
;;http://stackoverflow.com/questions/3124844/what-are-your-favorite-global-key-bindings-in-emacs
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

(provide 'init-keybindings)


