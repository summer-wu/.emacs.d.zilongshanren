(require 'org) ;加载FEATURE（所有已加载的特性保存在features），这里没有提供FILENAME，在load-path中搜索FIL   ENAME
(setq org-src-fontify-natively t) ;在BEGIN_SRC中的代码也着色
;;作者还有个agenda的keybinding，我这里没有

(provide 'init-org)
