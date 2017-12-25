;; my emacs config file
;;; most config data was taken from https://github.com/cit/emacs-configs

;; set path to config files
(setq custom-basedir (expand-file-name "~/.emacs.d/configs/"))

;; load the init file
(load (expand-file-name (concat custom-basedir "/init.el")))

(custom-set-faces
 ;; added by Custom
 '(default ((t (:family "Consolas" :foundry "microsoft" :slant normal :weight bold :height 98 :width normal))))
 '(TeX-fold-unfolded-face ((((class color) (background dark)) nil))))
