;; path
(defun add-path (path)
  (add-to-list 'load-path (concat custom-basedir path)))

;; config loading function
(defun load-my-cfg (file)
  (load-file (concat custom-basedir file)))

;; config files list
(setq my-cfg-list '(
		    "auctex.el"
		    "c-mode.el"
		    "general.el"
		    "kbd-hotkeys.el"
		    "org-mode.el"
		    "spell.el"
                    ))

;; load all config files from list
(mapc 'load-my-cfg my-cfg-list)
