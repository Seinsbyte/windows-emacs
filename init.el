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
   '(auctex outline-magic htmlize pdf-tools edit-server which-key ivy))
 '(vc-git-program "git"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "PfEd" :family "Fantasque Sans Mono")))))

;;; Local Loads
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "xah-html-mode")
(load "xahk-mode.el")
(load "xah-css-mode")
(load "xah-get-thing")
(load "xah-elisp-mode")
(load "xah-replace-pairs")
(load "ospl")
(load "~/.emacs.d/lisp/my-abbrev.el")
(load "xah-fly-keys") ;; best not to include the ending “.el” or “.elc”
(add-to-list 'exec-path "C:/Program Files/Git/")

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(require 'tex-mik)

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
  (define-key xah-fly-leader-key-map (kbd "z") 'save-in-iso-latin-1)
  (define-key xah-fly-leader-key-map (kbd "1") 'outline-cycle)
  (define-key xah-fly-leader-key-map (kbd "9") 'flyspell-buffer)
  (define-key xah-fly-leader-key-map (kbd "8") 'ispell-word)
  
  (define-key xah-fly-e-keymap (kbd "b") 'seins-insert-html-brackets)
  (define-key xah-fly-e-keymap (kbd "s") 'xah-insert-fslash)
  (define-key xah-fly-e-keymap (kbd "a") 'xah-insert-asterisk))

;;;; Xahfly with other modes
(global-set-key [f11] nil)

(define-key xah-html-mode-map (kbd "<f11>") xah-html-leader-map)
(define-key xah-html-leader-map (kbd "a") 'seins-total-supermem-cleanup)

(define-key xah-elisp-mode-map (kbd "<f11>") xah-elisp-leader-map)


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
;; (if (eq system-type 'windows-nt)
;;     (progn
;;       (set-clipboard-coding-system 'utf-16-le)
;;       (set-selection-coding-system 'utf-16-le))
;;   (set-selection-coding-system 'utf-8))
;; (setq locale-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-16)

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

(defun seins-html-codepoint-entity-to-char (@begin @end)
  "Replace HTML codepoint to Unicode character in current text block or selection.
Changed places are highlighted.
For example, “&copy;” becomes “©”.
The following HTML Entities are not replaced: &amp; &lt; &gt;

When called in lisp code, @begin @end are region begin/end positions.

URL `http://xahlee.info/emacs/emacs/elisp_replace_html_entities_command.html'
Version 2020-08-30"
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (save-excursion
       (list
        (progn
          (search-backward "\n\n" nil "NOERROR")
          (search-forward "\n\n" nil "NOERROR")
          (point))
        (progn
          (search-forward "\n\n" nil "NOERROR")
          (search-backward "\n\n" nil "NOERROR")
          (point))))))
  (let (($replaceMap
         [
          ["&nbsp;" " "] ["&ensp;" " "] ["&emsp;" " "] ["&thinsp;" " "]
          ["&rlm;" "‏"] ["&lrm;" "‎"] ["&zwj;" "‍"] ["&zwnj;" "‌"]

          ["&iexcl;" "¡"] ["&cent;" "¢"] ["&pound;" "£"] ["&curren;" "¤"] ["&yen;" "¥"]
          ["&brvbar;" "¦"] ["&sect;" "§"] ["&uml;" "¨"] ["&copy;" "©"] ["&ordf;" "ª"]
          ["&laquo;" "«"] ["&not;" "¬"] ["&shy;" "­"] ["&reg;" "®"] ["&macr;" "¯"]
          ["&deg;" "°"] ["&plusmn;" "±"] ["&sup2;" "²"] ["&sup3;" "³"] ["&acute;" "´"]
          ["&micro;" "µ"] ["&para;" "¶"] ["&middot;" "·"] ["&cedil;" "¸"] ["&sup1;" "¹"]
          ["&ordm;" "º"] ["&raquo;" "»"] ["&frac14;" "¼"] ["&frac12;" "½"]
          ["&frac34;" "¾"] ["&iquest;" "¿"]

          ["&#192;" "À"] ["&#193;" "Á"] ["&#194;" "Â"] ["&#195;" "Ã"] ["&#196;" "Ä"]
          ["&#197;" "Å"] ["&#198;" "Æ"] ["&#199;" "Ç"] ["&#200;" "È"] ["&#201;" "É"]
          ["&#202;" "Ê"] ["&#203;" "Ë"] ["&#204;" "Ì"] ["&#205;" "Í"] ["&#206;" "Î"]
          ["&#207;" "Ï"] ["&#208;" "Ð"] ["&#209;" "Ñ"] ["&#210;" "Ò"] ["&#211;" "Ó"]
          ["&#212;" "Ô"] ["&#213;" "Õ"] ["&#214;" "Ö"] ["&#215;" "×"] ["&#216;" "Ø"]
          ["&#217;" "Ù"] ["&#218;" "Ú"] ["&#219;" "Û"] ["&#220;" "Ü"] ["&#221;" "Ý"]
          ["&#222;" "Þ"] ["&#223;" "ß"] ["&#224;" "à"] ["&#225;" "á"] ["&#226;" "â"]
          ["&#227;" "ã"] ["&#228;" "ä"] ["&#229;" "å"] ["&#230;" "æ"] ["&#231;" "ç"]
          ["&#232;" "è"] ["&#233;" "é"] ["&#234;" "ê"] ["&#235;" "ë"] ["&#236;" "ì"]
          ["&#237;" "í"] ["&#238;" "î"] ["&#239;" "ï"] ["&#240;" "ð"] ["&#241;" "ñ"]
          ["&#242;" "ò"] ["&#243;" "ó"] ["&#244;" "ô"] ["&#245;" "õ"] ["&#246;" "ö"]

          ["&#247;" "÷"] ["&#248;" "ø"] ["&#249;" "ù"] ["&#250;" "ú"] ["&#251;" "û"]
          ["&#252;" "ü"] ["&#253;" "ý"] ["&#254;" "þ"] ["&#255;" "ÿ"] ["&#256;" "ƒ"]

          ["&#913;" "Α"] ["&#914;" "Β"] ["&#915;" "Γ"] ["&#916;" "Δ"] ["&#917;" "Ε"]
          ["&#918;" "Ζ"] ["&#919;" "Η"] ["&#920;" "Θ"] ["&#921;" "Ι"] ["&#922;" "Κ"]
          ["&#923;" "Λ"] ["&#924;" "Μ"] ["&#925;" "Ν"] ["&#926;" "Ξ"] ["&#927;" "Ο"]
          ["&#928;" "Π"] ["&#929;" "Ρ"] ["&#931;" "Σ"] ["&#932;" "Τ"] ["&#933;" "Υ"]
          ["&#934;" "Φ"] ["&#935;" "Χ"] ["&#936;" "Ψ"] ["&#937;" "Ω"] ["&#945;" "α"]
          ["&#946;" "β"] ["&#947;" "γ"] ["&#948;" "δ"] ["&#949;" "ε"] ["&#950;" "ζ"]
          ["&#951;" "η"] ["&#952;" "θ"] ["&#953;" "ι"] ["&#954;" "κ"] ["&#955;" "λ"]
          ["&#956;" "μ"] ["&#957;" "ν"] ["&#958;" "ξ"] ["&#959;" "ο"] ["&#960;" "π"]
          ["&#961;" "ρ"] ["&#962;" "ς"] ["&#963;" "σ"] ["&#964;" "τ"] ["&#965;" "υ"]
          ["&#966;" "φ"] ["&#967;" "χ"] ["&#968;" "ψ"] ["&#969;" "ω"] ["&#977;" "ϑ"]
          ["&#978;" "ϒ"] ["&#982;" "ϖ"]

          ["&#8226;" "•"] ["&#8230;" "…"] ["&#8242;" "′"] ["&#8243;" "″"] ["&#8254;" "‾"]
          ["&#8260;" "⁄"] ["&#8472;" "℘"] ["&#8465;" "ℑ"] ["&#8476;" "ℜ"] ["&#8482;" "™"]
          ["&#8501;" "ℵ"] ["&#8592;" "←"] ["&#8593;" "↑"] ["&#8594;" "→"] ["&#8595;" "↓"]
          ["&#8596;" "↔"] ["&#8629;" "↵"] ["&#8656;" "⇐"] ["&#8657;" "⇑"] ["&#8658;" "⇒"]
          ["&#8659;" "⇓"] ["&#8660;" "⇔"] ["&#8704;" "∀"] ["&#8706;" "∂"] ["&#8707;" "∃"]
          ["&#8709;" "∅"] ["&#8711;" "∇"] ["&#8712;" "∈"] ["&#8713;" "∉"] ["&#8715;" "∋"]
          ["&#8719;" "∏"] ["&#8721;" "∑"] ["&#8722;" "−"] ["&#8727;" "∗"] ["&#8730;" "√"]
          ["&#8733;" "∝"] ["&#8734;" "∞"] ["&#8736;" "∠"] ["&#8743;" "∧"] ["&#8744;" "∨"]
          ["&#8745;" "∩"] ["&#8746;" "∪"] ["&#8747;" "∫"] ["&#8756;" "∴"] ["&#8764;" "∼"]
          ["&#8773;" "≅"] ["&#8776;" "≈"] ["&#8800;" "≠"] ["&#8801;" "≡"] ["&#8804;" "≤"]
          ["&#8805;" "≥"] ["&#8834;" "⊂"] ["&#8835;" "⊃"] ["&#8836;" "⊄"] ["&#8838;" "⊆"]
          ["&#8839;" "⊇"] ["&#8853;" "⊕"] ["&#8855;" "⊗"] ["&#8869;" "⊥"] ["&#8901;" "⋅"]
          ["&#8968;" "⌈"] ["&#8969;" "⌉"] ["&#8970;" "⌊"] ["&#8971;" "⌋"] ["&#9001;" "〈"]
          ["&#9002;" "〉"] ["&#9674;" "◊"] ["&#9824;" "♠"] ["&#9827;" "♣"] ["&#9829;" "♥"]
          ["&#9830;" "♦"] ["&#34;" "\""] ["&#338;" "Œ"] ["&#339;" "œ"] ["&#352;" "Š"]
          ["&#353;" "š"] ["&#376;" "Ÿ"] ["&#710;" "ˆ"] ["&#732;" "˜"] ["&#8211;" "–"]
          ["&#8212;" "—"] ["&#8216;" "‘"] ["&#8217;" "’"] ["&#8218;" "‚"] ["&#8219;" "“"]
          ["&#8220;" "”"] ["&#8221;" "„"] ["&#8224;" "†"] ["&#8225;" "‡"] ["&#8240;" "‰"]
          ["&#8249;" "‹"] ["&#8250;" "›"] ["&#8364;" "€"]
          ]))
    (save-restriction
      (narrow-to-region @begin @end)
      (let ((case-fold-search nil))
        (mapc
         (lambda ($x)
           (goto-char (point-min))
           (while (search-forward (elt $x 0) nil t)
             (replace-match (elt $x 1))
             (overlay-put (make-overlay (- (point) (length (elt $x 1))) (point)) 'font-lock-face '(:foreground "red"))))
         $replaceMap)))))

(defun increment-number-at-point ()
      (interactive)
      (skip-chars-backward "0-9")
      (or (looking-at "[0-9]+")
          (error "No number at point"))
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))


Local Variables:
    mode: outline-minor
    outline-regexp:  ";;;"
    End:
