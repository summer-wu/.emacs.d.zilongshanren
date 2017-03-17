(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)


(add-to-list 'default-frame-alist
	     '(font . "Menlo-16"))

(setq initial-frame-alist '((fullscreen . maximized)))
(global-hl-line-mode t)

(provide 'init-ui)
