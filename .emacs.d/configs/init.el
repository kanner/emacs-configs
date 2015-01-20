;; ,----[ ~/.init.el ]
;; |
;; |  actual version :
;; |
;; | "Emacs outshines all other editing software in approximately the
;; | same way that the noonday sun does the stars. It is not just bigger
;; | and brighter; it simply makes everything else vanish."
;; | - Neal Stephenson, "In the Beginning was the Command Line"
;; |
;; `----------------

;;------------------------------------------------------------------------------
;; general settings
;;------------------------------------------------------------------------------

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
		    "c++-mode.el"
		    "elisp.el"
		    "eshell.el"
;		    "functions.el"
		    "general.el"
;		    "gnus.el"
		    "kbd-hotkeys.el"
		    "org-mode.el"
		    "perl-mode.el"
		    "slime.el"
		    "spell.el"
		    "webdev-mode.el"
                    ))

;; load all config files from list
(mapc 'load-my-cfg my-cfg-list)
