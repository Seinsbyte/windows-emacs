;;; Custom Vars

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-font-list
'((1 "" "" "\\mathcal{" "}")
(98 "\\textbf{" "}" "\\mathbf{" "}")
(3 "\\textsc{" "}")
(5 "\\emph{" "}")
(6 "\\textsf{" "}" "\\mathsf{" "}")
(105 "\\textit{" "}" "\\mathit{" "}")
(12 "\\textulc{" "}")
(13 "\\textmd{" "}")
(14 "\\textnormal{" "}" "\\mathnormal{" "}")
(18 "\\textrm{" "}" "\\mathrm{" "}")
(19 "\\textsl{" "}" "\\mathbb{" "}")
(20 "\\texttt{" "}" "\\mathtt{" "}")
(21 "\\textup{" "}")
(23 "\\textsw{" "}")
(4 "" "" t)))
 '(exec-path
'("C:\\Program Files\\Git" "c:/Program Files (x86)/Common Files/Oracle/Java/javapath" "C:/WINDOWS/system32" "C:/WINDOWS" "C:/WINDOWS/System32/Wbem" "C:/WINDOWS/System32/WindowsPowerShell/v1.0/" "C:/WINDOWS/System32/OpenSSH/" "C:/Program Files (x86)/Calibre2/" "C:/Program Files/dotnet/" "C:/Python27" "C:/Users/ppeda/AppData/Local/Programs/Python/Python39/Scripts/" "C:/Users/ppeda/AppData/Local/Programs/Python/Python39/" "C:/Users/ppeda/AppData/Local/Microsoft/WindowsApps" "C:/Program Files/Emacs/x86_64/bin" "." "c:/Program Files/Emacs/x86_64/libexec/emacs/27.1/x86_64-w64-mingw32" "H:/programs/Aspell/Hunspelldicts"))
 '(magit-git-executable "git-bash.exe")
 '(package-selected-packages
'(speed-type auctex outline-magic htmlize pdf-tools edit-server which-key ivy))
 '(vc-git-program "git"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "JuliaMono")))))

;;; Local Loads
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "xah-html-mode")
(load "xahk-mode.el")
(load "xah-css-mode")
(load "xah-get-thing")
(load "xah-elisp-mode")
(load "xah-replace-pairs")
(load "seins-sm-html.el ")
(load "ospl")
(load "~/.emacs.d/lisp/POR-my-abbrev.el")
(load "xah-fly-keys") ;; best not to include the ending “.el” or “.elc”
(add-to-list 'exec-path "C:/Program Files/Git/")

(load "auctex.el" nil t t)

;; (load "preview-latex.el" nil t t)

(require 'tex-mik)
(require 'kbd-mode)

;;; Numpad

(global-set-key [kp-1] 'isearch-repeat-backward)
;; (global-set-key [kp-5] 'previous-line)
(global-set-key [kp-3] 'isearch-repeat-forward)
;; (global-set-key [kp-2] 'next-line)
(global-set-key [kp-8] 'flyspell-goto-previous-error)
(global-set-key [kp-9] 'flyspell-goto-next-error)

;;; Xah Config

(require 'xah-fly-keys)
(xah-fly-keys-set-layout "qwerty") ; required
(xah-fly-keys)
(with-eval-after-load 'xah-fly-keys
  ;; Command mode keybindings:
  (define-key xah-fly-insert-map (kbd "<escape>") #'xah-fly-command-mode-activate-no-hook)
  (define-key xah-fly-command-map (kbd "2") #'eval-region-and-deactivate)
  (define-key xah-fly-command-map (kbd "w") #'xah-old-shrink-whitespaces)
  (define-key xah-fly-command-map (kbd "O") #'forward-sentence)
  (define-key xah-fly-command-map (kbd ">") #'xah-forward-quote-smart)
  (define-key xah-fly-command-map (kbd "M") #'xah-backward-quote)
  (define-key xah-fly-command-map (kbd "U") #'backward-sentence)
  (define-key xah-fly-leader-key-map (kbd ";") 'seins-save-buffer-maybe-utf-16)
  (define-key xah-fly-leader-key-map (kbd "1") 'outline-cycle)
  (define-key xah-fly-leader-key-map (kbd "9") 'flyspell-buffer)
  (define-key xah-fly-leader-key-map (kbd "8") 'ispell-word)
  
  (define-key xah-fly-e-keymap (kbd "b") 'seins-insert-html-brackets)
  (define-key xah-fly-e-keymap (kbd "s") 'xah-insert-fslash)
  (define-key xah-fly-e-keymap (kbd "a") 'xah-insert-asterisk))

(define-key xah-fly--tab-key-map (kbd "e") (lambda() (interactive)(load "~/.emacs.d/lisp/ENG-my-abbrev.el")))

(define-key xah-fly--tab-key-map (kbd "p") (lambda() (interactive)(load "~/.emacs.d/lisp/POR-my-abbrev.el")))

;;;; Xahfly with other modes
(global-set-key [f11] nil)

(define-key xah-html-mode-map (kbd "C-c") xah-html-leader-map)
(define-key xah-html-leader-map (kbd "a") 'seins-total-supermem-cleanup)
(define-key xah-html-leader-map (kbd "o") 'xah-html-wrap-cloze)

(define-key xah-elisp-mode-map (kbd "C-c") xah-elisp-leader-map)


(add-hook 'LaTeX-mode-hook
	  (lambda ()
(define-key LaTeX-mode-map (kbd "<tab>") 'TeX-font)
(define-key LaTeX-mode-map (kbd "<C-tab>") 'LaTeX-section)
))

		(with-eval-after-load 'pdf-view
		  (define-key pdf-view-mode-map [remap next-line] #'pdf-view-next-line-or-next-page)
		  (define-key pdf-view-mode-map [remap xah-delete-backward-char-or-bracket-text] #'pdf-view-next-line-or-next-page)
		  (define-key pdf-view-mode-map [remap previous-line] #'pdf-view-previous-line-or-previous-page)
		  (define-key pdf-view-mode-map [remap xah-backward-kill-word] #'pdf-view-previous-line-or-previous-page)
		  (define-key pdf-view-mode-map [remap xah-copy-line-or-region] #'pdf-view-kill-ring-save)
		  (define-key pdf-view-mode-map [remap forward-word] #'pdf-outline))
;;; General-config

(tool-bar-mode 0)

(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'turn-on-flyspell)

(add-hook 'xah-html-mode-hook 'turn-on-flyspell)

(setq sentence-end-double-space nil)
(setq outline-minor-mode-highlight 'override)
(setq visible-bell 1)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(which-key-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(define-key ivy-minibuffer-map (kbd "C-<return>") 'ivy-immediate-done)

(setq TeX-auto-save t)
(setq TeX-parse-self t)

  ;Backup in temp folder:

 (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))



;;; Defuns
(defun save-in-iso-latin-1 ()
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1)
  (save-buffer))

(defun save-in-utf-16 ()
  (interactive)
  (set-buffer-file-coding-system 'utf-16)
  (save-buffer))

		(defun pdf-config-xah-fly-key ()
		  "Modify keys for xah fly key command mode keys
		To be added to `xah-fly-command-mode-activate-hook'"
		  (interactive)
		  (define-key xah-fly-leader-key-map (kbd "c") 'pdf-view-kill-ring-save)
		  )

		(defun pdf-xah-wrapper ()
		  "call different commands depending on what's current major mode."
		  (interactive)
		  (cond
		   ((string-equal major-mode "pdf-view-mode") ((add-hook 'xah-fly-command-mode-activate-hook 'pdf-config-xah-fly-key)))
		   ;; if nothing match, do nothing
		   (t nil)))

	    (defun xah-insert-fslash ()
	      (interactive)
	      (xah-insert-bracket-pair "/" "/") )

	    (defun seins-insert-html-brackets ()
	      (interactive)
	      (xah-insert-bracket-pair "<" ">") )

	    (defun xah-insert-asterisk ()
	      (interactive)
	      (xah-insert-bracket-pair "*" "*") )

(defun eval-region-and-deactivate ()
			 (interactive)
			 (when (use-region-p)
			(eval-region (region-beginning) (region-end)))
			(deactivate-mark t))

(defun xah-old-shrink-whitespaces ()
  "Remove whitespaces around cursor to just one, or none.
Shrink any neighboring space tab newline characters to 1 or none.
If cursor neighbor has space/tab, toggle between 1 or 0 space.
If cursor neighbor are newline, shrink them to just 1.
If already has just 1 whitespace, delete it.
URL `http://xahlee.info/emacs/emacs/emacs_shrink_whitespace.html'
Version 2019-06-13"
  (interactive)
  (let* (
         ($eol-count 0)
         ($p0 (point))
         $p1 ; whitespace begin
         $p2 ; whitespace end
         ($charBefore (char-before))
         ($charAfter (char-after ))
         ($space-neighbor-p (or (eq $charBefore 32) (eq $charBefore 9) (eq $charAfter 32) (eq $charAfter 9)))
         $just-1-space-p
         )
    (skip-chars-backward " \n\t　")
    (setq $p1 (point))
    (goto-char $p0)
    (skip-chars-forward " \n\t　")
    (setq $p2 (point))
    (goto-char $p1)
    (while (search-forward "\n" $p2 t )
      (setq $eol-count (1+ $eol-count)))
    (setq $just-1-space-p (eq (- $p2 $p1) 1))
    (goto-char $p0)
    (cond
     ((eq $eol-count 0)
      (if $just-1-space-p
          (xah-fly-delete-spaces)
        (progn (xah-fly-delete-spaces)
               (insert " ")))
      )
     ((eq $eol-count 1)
      (if $space-neighbor-p
          (xah-fly-delete-spaces)
        (progn (xah-delete-blank-lines) (insert " "))))
     ((eq $eol-count 2)
      (if $space-neighbor-p
          (xah-fly-delete-spaces)
        (progn
          (xah-delete-blank-lines)
          (insert "\n"))))
     ((> $eol-count 2)
      (if $space-neighbor-p
          (xah-fly-delete-spaces)
        (progn
          (goto-char $p2)
          (search-backward "\n" )
          (delete-region $p1 (point))
          (insert "\n"))))
     (t (progn
          (message "nothing done. logic error 40873. shouldn't reach here" ))))))
(defun xah-select-line ()
  "Select current line. If region is active, extend selection downward by line.
URL `http://xahlee.info/emacs/emacs/modernization_mark-word.html'
Version 2017-11-01"
  (interactive)
  (if (region-active-p)
      (progn
        (forward-line 1)
        (end-of-line))
    (progn
      (end-of-line)
      (set-mark (line-beginning-position)))))

;;; Encoding

 (if (eq system-type 'windows-nt)
     (progn
       (set-clipboard-coding-system 'utf-16-le)
       (set-selection-coding-system 'utf-16-le)))
;; (set-selection-coding-system 'utf-8)
;; (setq locale-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (set-default-coding-systems 'utf-16)

(defun seins-set-utf-16-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.HTM\\'" buffer-file-name))
    (seins-total-supermem-cleanup)
    ;; (set-buffer-file-coding-system 'utf-16)
    ))

;; (add-to-list 'auto-mode-alist
;; '("\\.HTM\\'" . (lambda ()
;; add major mode setting here, if needed, for example:
;; (text-mode)
;; )))

(add-hook 'xah-html-mode-hook 'seins-set-utf-16-mode)
(defun  seins-save-buffer-maybe-utf-16 ()
  "call different commands depending on what's current major mode."
  (interactive)
  (when (and (stringp buffer-file-name)
             (string-match "\\.HTM\\'" buffer-file-name))
    (set-buffer-file-coding-system 'utf-16))
  (save-buffer))



;;; Dictionary
(add-to-list 'exec-path "H:/programs/Aspell/Hunspell/")
(add-to-list 'exec-path "C:/Hunspell/")
(setenv "DICPATH" "C:/Hunspell")
;(setq ispell-program-name "h:/programs/Aspell/Hunspell/hunspell.exe")
(setq ispell-program-name "hunspell")

(setq ispell-hunspell-dict-paths-alist

      '(("en_US" "C:/Hunspell/en_US.aff")
	("pt_BR" "C:/Hunspell/pt_BR.aff")
		("default" "C:/Hunspell/pt_BR.aff")))

(setq ispell-local-dictionary "en_US")

(setq ispell-local-dictionary-alist

;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell

;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries

'(("pt_BR" "[A-Za-z\300\301\302\303\307\311\312\315\323\324\325\332\334\340\341\342\343\347\351\352\355\364\365\372\374]" "[^A-Za-z\300\301\302\303\307\311\312\315\323\324\325\332\334\340\341\342\343\347\351\352\355\364\365\372\374]" "[']" nil ("-B" "-d" "pt_BR") "~tex" iso-latin-1)("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))

;; the following line won't make flyspell-mode enabled by default as you might think

(flyspell-mode 1)

(eval-after-load "ispell-minor-mode"
  '(progn (define-key ispell-minor-keymap (kbd " ") nil)
          (define-key ispell-minor-keymap (kbd "\r") nil)))

;; ispell-word for showing correcting options of the current misspelled word

;; (after 'ispell
;;   (add-to-list 'ispell-dictionary-alist '( ("english"
;;                                            "[[:alpha:]]"
;;                                            "[^[:alpha:]]"
;;                                            "[']"
;;                                             t
;;                                             ("-d" "en_US")
;;                                             nil
;;                                             utf-8)))

;;   (setq-default ispell-program-name "hunspell")
  ;; (setq ispell-local-dictionary-alist ispell-dictionary-alist)
   ;; (setq ispell-hunspell-dict-paths-alist ispell-dictionary-alist)
   ;; (setq ispell-hunspell-dictionary-alist ispell-dictionary-alist))

;; (defmacro after (mode &rest body)
;;  "`eval-after-load' MODE evaluate BODY."
;;  (declare (indent defun))
;;  `(eval-after-load ,mode
;;  '(progn ,@body)))

(defun increment-number-at-point ()
      (interactive)
      (skip-chars-backward "0-9")
      (or (looking-at "[0-9]+")
          (error "No number at point"))
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun eval-file (file)
  "Execute FILE and return the result of the last expression."
  (load-file file)
  (with-temp-buffer
    (insert-file-contents file)
    (emacs-lisp-mode)
    (goto-char (point-max))
    (backward-sexp)
    (eval (sexp-at-point))))

(defun flyspell-goto-previous-error (arg)
  "Go to arg previous spelling error."
  (interactive "p")
  (while (not (= 0 arg))
    (let ((pos (point))
          (min (point-min)))
      (if (and (eq (current-buffer) flyspell-old-buffer-error)
               (eq pos flyspell-old-pos-error))
          (progn
            (if (= flyspell-old-pos-error min)
                ;; goto beginning of buffer
                (progn
                  (message "Restarting from end of buffer")
                  (goto-char (point-max)))
              (backward-word 1))
            (setq pos (point))))
      ;; seek the next error
      (while (and (> pos min)
                  (let ((ovs (overlays-at pos))
                        (r '()))
                    (while (and (not r) (consp ovs))
                      (if (flyspell-overlay-p (car ovs))
                          (setq r t)
                        (setq ovs (cdr ovs))))
                    (not r)))
        (backward-word 1)
        (setq pos (point)))
      ;; save the current location for next invocation
      (setq arg (1- arg))
      (setq flyspell-old-pos-error pos)
      (setq flyspell-old-buffer-error (current-buffer))
      (goto-char pos)
      (if (= pos min)
          (progn
            (message "No more miss-spelled word!")
            (setq arg 0))
        (forward-word)))))


;Local Variables:
;    mode: outline-minor
;    outline-regexp:  ";;;"
;    End: 
