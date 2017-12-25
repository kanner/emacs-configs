(require 'xcscope)
(cscope-setup)

; "~/projects/kernel-scripts/cscope-kernel/")
(setq cscope-initial-directory `,(expand-file-name (concat custom-basedir "cscope")))
