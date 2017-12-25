(message "applying c-mode settings ...")

(c-add-style
 "myC"
   ;; insert tabs instead of spaces (". nil")
 '((indent-tabs-mode t)
   ;; 80 characters in line (maximum line width)
   (fill-column      . 80)
   (c-toggle-auto-newline 0)
   ; 8 spaces as a tab (kernel style)
   (tab-width   . 8)
   (c-basic-offset   . 8)
   (c-offsets-alist  . ((substatement-open . 0)
                        (inextern-lang . 0)
                        (arglist-intro . +)
                        (knr-argdecl-intro . +)))
   (c-hanging-braces-alist . ((brace-list-open)
                              (brace-list-intro)
                              (brace-list-close)
                              (brace-entry-open)
                              (substatement-open after)
                              (block-close . c-snug-do-while)))
   (c-block-comment-prefix . "* ")))

(add-to-list 'c-default-style '(c-mode . "myC"))

;(defun c-select-style ()
;  "Select the C style to use from buffer indentation."
;  (save-excursion
;    (if (re-search-forward "^\t" 3000 t)
;        (c-set-style "python")
;      (c-set-style "myC"))))
;(add-hook 'c-mode-hook 'c-select-style)

;; linux/Documentation/process/coding-style.rst
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/projects/linux")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))))
