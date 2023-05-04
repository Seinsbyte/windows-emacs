(defun seins-total-supermem-cleanup ()
  "DOCSTRING"
  (interactive)
  (mark-whole-buffer)
  (call-interactively 'seins-supermem-html-remove-span)
  (call-interactively 'seins-html-codepoint-entity-to-char)
  ;; (call-interactively 'seins-supermem-html-lowercase)
  (tags-to-lower-case)
  (deactivate-mark t)
 )

(defun seins-supermem-html-remove-span (@begin @end)
  "Make html tags lower case and remove SPAN tag (seems useless)"
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
  ; HTML Structure, Meta info
	  ;; ["<SPAN>" ""] ["</SPAN>" ""]
	  ;; ["<span>" ""] ["</span>" ""]
	  ;; ["<HTML>" "<html>"]   ["</HTML>" "</html>"]
	  ;; ["<HEAD>" "<head>"]   ["</HEAD>" "</head>"]
	  ;; ["<BODY>" "<body>"]   ["</BODY>" "</body>"]

	  ;; ["<H1>" "<h1>"]   ["</H1>" "</h1>"]
	  ;; ["<H2>" "<h2>"]   ["</H2>" "</h2>"]
	  ;; ["<H3>" "<h3>"]   ["</H3>" "</h3>"]
	  ;; ["<H4>" "<h4>"]   ["</H4>" "</h4>"]
	  ;; ["<H5>" "<h5>"]   ["</H5>" "</h5>"]
	  ;; ["<H6>" "<h6>"]   ["</H6>" "</h6>"]

  ; Text Block
	  ;; ["<DIV>" "<div>"] ["</DIV>" "</div>"]
	  ;; ["<P>" "<p>"] ["</P>" "</p>"]
	  ;; ["<HR>" "<hr />"]

  ; Lists
	  ;; 	  ["<UL>" "<ul>"] ["</UL>" "</ul>"]
	  ;;         ["<OL>" "<ol>"] ["</OL>" "</ol>"]
	  ;; 	  ["<LI>" "<li>"] ["</LI>" "</li>"]
	  ;; 	  ["<DL>" "<dl>"] ["</DL>" "</dl>"]
	  ;; 	  ["<DT>" "<dt>"] ["</DT>" "</dt>"]
	  ;;         ["<DD>" "<dd>"] ["</DD>" "</dd>"]
	  ;; ; Inline Markup
	  ;; 	  ["<B>" "<b>"] ["</B>" "</b>"]
	  ;; 	  ["<I>" "<i>"] ["</I>" "</i>"]

	  ;; 	  ["<BR>" "<br>"]

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

(defun seins-html-codepoint-entity-to-char (@begin @end)
  "Replace HTML codepoint to Unicode character in current text block or selection.
hChanged places are highlighted.
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
          ["&#8249;" "‹"] ["&#8250;" "›"] ["&#8364;" "€"] ["&#187;" "»"] ["&#171;" "«"]
          ]))
    (save-restriction
      (narrow-to-region @begin @end)
      (let ((case-fold-search nil))
        (mapc
         (lambda ($x)
           (goto-char (point-min))
           (while (search-forward (elt $x 0) nil t)
             (replace-match (elt $x 1)) ))
         $replaceMap)))))

;; (overlay-put (make-overlay (- (point) (length (elt $x 1))) (point)) 'font-lock-face '(:foreground "red"))

(defun tags-to-lower-case ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "<[^>]+>" nil t)
      (replace-match (downcase (match-string 0)) t))))


;; (defun xah-html-wrap-cloze ()
;;   "DOCSTRING"
;;   (interactive)
;;   (let ((current-prefix-arg '(1)))
;; 		  (call-interactively 'xah-html-wrap-html-tag "span") 
;; 		  ))

(defun xah-html-wrap-cloze ()
  "DOCSTRING"
  (interactive)
  (call-interactively (xah-html-wrap-html-tag "span" "cloze" nil)))


;; (defun seins-html-codepoint-entity-to-char (@begin @end)
;;   "Replace HTML codepoint to Unicode character in current text block or selection.
;; Changed places are highlighted.
;; For example, “&copy;” becomes “©”.
;; The following HTML Entities are not replaced: &amp; &lt; &gt;

;; When called in lisp code, @begin @end are region begin/end positions.

;; URL `http://xahlee.info/emacs/emacs/elisp_replace_html_entities_command.html'
;; Version 2020-08-30"
;;   (interactive
;;    (if (use-region-p)
;;        (list (region-beginning) (region-end))
;;      (save-excursion
;;        (list
;;         (progn
;;           (search-backward "\n\n" nil "NOERROR")
;;           (search-forward "\n\n" nil "NOERROR")
;;           (point))
;;         (progn
;;           (search-forward "\n\n" nil "NOERROR")
;;           (search-backward "\n\n" nil "NOERROR")
;;           (point))))))
;;   (let (($replaceMap
;;          [
;;           ["&nbsp;" " "] ["&ensp;" " "] ["&emsp;" " "] ["&thinsp;" " "]
;;           ["&rlm;" "‏"] ["&lrm;" "‎"] ["&zwj;" "‍"] ["&zwnj;" "‌"]

;;           ["&iexcl;" "¡"] ["&cent;" "¢"] ["&pound;" "£"] ["&curren;" "¤"] ["&yen;" "¥"]
;;           ["&brvbar;" "¦"] ["&sect;" "§"] ["&uml;" "¨"] ["&copy;" "©"] ["&ordf;" "ª"]
;;           ["&laquo;" "«"] ["&not;" "¬"] ["&shy;" "­"] ["&reg;" "®"] ["&macr;" "¯"]
;;           ["&deg;" "°"] ["&plusmn;" "±"] ["&sup2;" "²"] ["&sup3;" "³"] ["&acute;" "´"]
;;           ["&micro;" "µ"] ["&para;" "¶"] ["&middot;" "·"] ["&cedil;" "¸"] ["&sup1;" "¹"]
;;           ["&ordm;" "º"] ["&raquo;" "»"] ["&frac14;" "¼"] ["&frac12;" "½"]
;;           ["&frac34;" "¾"] ["&iquest;" "¿"]

;;           ["&#192;" "À"] ["&#193;" "Á"] ["&#194;" "Â"] ["&#195;" "Ã"] ["&#196;" "Ä"]
;;           ["&#197;" "Å"] ["&#198;" "Æ"] ["&#199;" "Ç"] ["&#200;" "È"] ["&#201;" "É"]
;;           ["&#202;" "Ê"] ["&#203;" "Ë"] ["&#204;" "Ì"] ["&#205;" "Í"] ["&#206;" "Î"]
;;           ["&#207;" "Ï"] ["&#208;" "Ð"] ["&#209;" "Ñ"] ["&#210;" "Ò"] ["&#211;" "Ó"]
;;           ["&#212;" "Ô"] ["&#213;" "Õ"] ["&#214;" "Ö"] ["&#215;" "×"] ["&#216;" "Ø"]
;;           ["&#217;" "Ù"] ["&#218;" "Ú"] ["&#219;" "Û"] ["&#220;" "Ü"] ["&#221;" "Ý"]
;;           ["&#222;" "Þ"] ["&#223;" "ß"] ["&#224;" "à"] ["&#225;" "á"] ["&#226;" "â"]
;;           ["&#227;" "ã"] ["&#228;" "ä"] ["&#229;" "å"] ["&#230;" "æ"] ["&#231;" "ç"]
;;           ["&#232;" "è"] ["&#233;" "é"] ["&#234;" "ê"] ["&#235;" "ë"] ["&#236;" "ì"]
;;           ["&#237;" "í"] ["&#238;" "î"] ["&#239;" "ï"] ["&#240;" "ð"] ["&#241;" "ñ"]
;;           ["&#242;" "ò"] ["&#243;" "ó"] ["&#244;" "ô"] ["&#245;" "õ"] ["&#246;" "ö"]

;;           ["&#247;" "÷"] ["&#248;" "ø"] ["&#249;" "ù"] ["&#250;" "ú"] ["&#251;" "û"]
;;           ["&#252;" "ü"] ["&#253;" "ý"] ["&#254;" "þ"] ["&#255;" "ÿ"] ["&#256;" "ƒ"]

;;           ["&#913;" "Α"] ["&#914;" "Β"] ["&#915;" "Γ"] ["&#916;" "Δ"] ["&#917;" "Ε"]
;;           ["&#918;" "Ζ"] ["&#919;" "Η"] ["&#920;" "Θ"] ["&#921;" "Ι"] ["&#922;" "Κ"]
;;           ["&#923;" "Λ"] ["&#924;" "Μ"] ["&#925;" "Ν"] ["&#926;" "Ξ"] ["&#927;" "Ο"]
;;           ["&#928;" "Π"] ["&#929;" "Ρ"] ["&#931;" "Σ"] ["&#932;" "Τ"] ["&#933;" "Υ"]
;;           ["&#934;" "Φ"] ["&#935;" "Χ"] ["&#936;" "Ψ"] ["&#937;" "Ω"] ["&#945;" "α"]
;;           ["&#946;" "β"] ["&#947;" "γ"] ["&#948;" "δ"] ["&#949;" "ε"] ["&#950;" "ζ"]
;;           ["&#951;" "η"] ["&#952;" "θ"] ["&#953;" "ι"] ["&#954;" "κ"] ["&#955;" "λ"]
;;           ["&#956;" "μ"] ["&#957;" "ν"] ["&#958;" "ξ"] ["&#959;" "ο"] ["&#960;" "π"]
;;           ["&#961;" "ρ"] ["&#962;" "ς"] ["&#963;" "σ"] ["&#964;" "τ"] ["&#965;" "υ"]
;;           ["&#966;" "φ"] ["&#967;" "χ"] ["&#968;" "ψ"] ["&#969;" "ω"] ["&#977;" "ϑ"]
;;           ["&#978;" "ϒ"] ["&#982;" "ϖ"]

;;           ["&#8226;" "•"] ["&#8230;" "…"] ["&#8242;" "′"] ["&#8243;" "″"] ["&#8254;" "‾"]
;;           ["&#8260;" "⁄"] ["&#8472;" "℘"] ["&#8465;" "ℑ"] ["&#8476;" "ℜ"] ["&#8482;" "™"]
;;           ["&#8501;" "ℵ"] ["&#8592;" "←"] ["&#8593;" "↑"] ["&#8594;" "→"] ["&#8595;" "↓"]
;;           ["&#8596;" "↔"] ["&#8629;" "↵"] ["&#8656;" "⇐"] ["&#8657;" "⇑"] ["&#8658;" "⇒"]
;;           ["&#8659;" "⇓"] ["&#8660;" "⇔"] ["&#8704;" "∀"] ["&#8706;" "∂"] ["&#8707;" "∃"]
;;           ["&#8709;" "∅"] ["&#8711;" "∇"] ["&#8712;" "∈"] ["&#8713;" "∉"] ["&#8715;" "∋"]
;;           ["&#8719;" "∏"] ["&#8721;" "∑"] ["&#8722;" "−"] ["&#8727;" "∗"] ["&#8730;" "√"]
;;           ["&#8733;" "∝"] ["&#8734;" "∞"] ["&#8736;" "∠"] ["&#8743;" "∧"] ["&#8744;" "∨"]
;;           ["&#8745;" "∩"] ["&#8746;" "∪"] ["&#8747;" "∫"] ["&#8756;" "∴"] ["&#8764;" "∼"]
;;           ["&#8773;" "≅"] ["&#8776;" "≈"] ["&#8800;" "≠"] ["&#8801;" "≡"] ["&#8804;" "≤"]
;;           ["&#8805;" "≥"] ["&#8834;" "⊂"] ["&#8835;" "⊃"] ["&#8836;" "⊄"] ["&#8838;" "⊆"]
;;           ["&#8839;" "⊇"] ["&#8853;" "⊕"] ["&#8855;" "⊗"] ["&#8869;" "⊥"] ["&#8901;" "⋅"]
;;           ["&#8968;" "⌈"] ["&#8969;" "⌉"] ["&#8970;" "⌊"] ["&#8971;" "⌋"] ["&#9001;" "〈"]
;;           ["&#9002;" "〉"] ["&#9674;" "◊"] ["&#9824;" "♠"] ["&#9827;" "♣"] ["&#9829;" "♥"]
;;           ["&#9830;" "♦"] ["&#34;" "\""] ["&#338;" "Œ"] ["&#339;" "œ"] ["&#352;" "Š"]
;;           ["&#353;" "š"] ["&#376;" "Ÿ"] ["&#710;" "ˆ"] ["&#732;" "˜"] ["&#8211;" "–"]
;;           ["&#8212;" "—"] ["&#8216;" "‘"] ["&#8217;" "’"] ["&#8218;" "‚"] ["&#8219;" "“"]
;;           ["&#8220;" "”"] ["&#8221;" "„"] ["&#8224;" "†"] ["&#8225;" "‡"] ["&#8240;" "‰"]
;;           ["&#8249;" "‹"] ["&#8250;" "›"] ["&#8364;" "€"]
;;           ]))
;;     (save-restriction
;;       (narrow-to-region @begin @end)
;;       (let ((case-fold-search nil))
;;         (mapc
;;          (lambda ($x)
;;            (goto-char (point-min))
;;            (while (search-forward (elt $x 0) nil t)
;;              (replace-match (elt $x 1))
;;              (overlay-put (make-overlay (- (point) (length (elt $x 1))) (point)) 'font-lock-face '(:foreground "red"))))
;;          $replaceMap)))))

(defvar word-frequency-table (make-hash-table :test 'equal :size 128))

(defvar word-frequency-buffer "*frequencies*"
  "Buffer where frequencies are displayed.")

(defun word-frequency-incr (word)
  (puthash word (1+ (gethash word word-frequency-table 0)) word-frequency-table))

(defun word-frequency-list (&optional reverse limit)
  "Returns a cons which car is sum of times any word was used
and cdr is a list of (word . count) pairs.  If REVERSE is nil
sorts it starting from the most used word; if it is 'no-sort
the list is not sorted; if it is non-nil and not 'no-sort sorts
it from the least used words.  If LIMIT is positive number
only words which were used more then LIMIT times will be
added.  If it is negative number only words which were used
less then -LIMIT times will be added."
  (let (l (sum 0))
    (maphash
     (cond
      ((or (not (numberp limit)) (= limit 0))
       (lambda (k v) (setq l (cons (cons k v) l) sum (+ sum v))))
      ((= limit -1) (lambda (k v) (setq sum (+ sum v))))
      ((< limit 0)
       (setq limit (- limit))
       (lambda (k v) (setq sum (+ sum v))
         (if (< v limit) (setq l (cons (cons k v) l)))))
      (t
       (lambda (k v) (setq sum (+ sum v))
         (if (> v limit) (setq l (cons (cons k v) l))))))
     word-frequency-table)
    (cons sum
          (cond
           ((equal reverse 'no-sort) l)
           (reverse (sort l (lambda (a b) (< (cdr a) (cdr b)))))
           (t       (sort l (lambda (a b) (> (cdr a) (cdr b)))))))))

(defun word-frequency-string (&optional reverse limit func)
  "Returns formatted string with word usage statistics.

If FUNC is nil each line contains number of times word was
called and the word; if it is t percentage usage is added in
the middle; if it is 'raw each line will contain number an
word separated by single line (with no formatting) otherwise
FUNC must be a function returning a string which will be called
for each entry with three arguments: number of times word was
called, percentage usage and the word.

See `word-frequency-list' for description of REVERSE and LIMIT
arguments."
  (let* ((list (word-frequency-list reverse)) (sum (car list)))
    (mapconcat
     (cond
      ((not func) (lambda (e) (format "%7d  %s\n" (cdr e) (car e))))
      ((equal func t)
       (lambda (e) (format "%7d  %6.2f%%  %03d %s\n"
                           (cdr e) 
               (/ (* 1e2 (cdr e)) sum) 
               (length (car e))
               (car e))))
      ((equal func 'raw) (lambda (e) (format "%d %s\n" (cdr e) (car e))))
      (t (lambda (e) (funcall func (cdr e) (/ (* 1e2 (cdr e)) sum) (car e)))))
     (cdr list) "")))

(defun word-frequency (&optional where reverse limit func)
  "Formats word usage statistics using
`word-frequency-string' function (see for description of
REVERSE, LIMIT and FUNC arguments) and:
- if WHERE is nil inserts it in th e
  or displays it in echo area if possible; else
- if WHERE is t inserts it in the current buffer; else
- if WHERE is an empty string inserts it into
  `word-frequency-buffer' buffer; else
- inserts it into buffer WHERE.

When called interactively behaves as if WHERE and LIMIT were nil,
FUNC was t and:
- with no prefix argument - REVERSE was nil;
- with universal or positive prefix arument - REVERSE was t;
- with negative prefix argument - REVERSE was 'no-sort."

  (interactive (list nil
                     (cond
                      ((not current-prefix-arg) nil)
                      ((> (prefix-numeric-value current-prefix-arg) 0))
                      (t 'no-sort))
                     nil t))
  (clrhash word-frequency-table)
  (word-frequency-process-buffer)
  (cond
   ((not where)
    (display-message-or-buffer (word-frequency-string reverse limit func)
                               word-frequency-buffer))
   ((equal where t)
    (insert (word-frequency-string reverse limit func)))
   (t
    (display-buffer
     (if (and (stringp where) (string= where ""))
         word-frequency-buffer where)
     (word-frequency-string reverse limit func)))))

(defvar word-frequency-table (make-hash-table :test 'equal :size 128))

(defvar word-frequency-buffer "*frequencies*"
  "Buffer where frequencies are displayed.")

(defun word-frequency-incr (word)
  (puthash word (1+ (gethash word word-frequency-table 0)) word-frequency-table))

(defun word-frequency-list (&optional reverse limit)
  "Returns a cons which car is sum of times any word was used
and cdr is a list of (word . count) pairs.  If REVERSE is nil
sorts it starting from the most used word; if it is 'no-sort
the list is not sorted; if it is non-nil and not 'no-sort sorts
it from the least used words.  If LIMIT is positive number
only words which were used more then LIMIT times will be
added.  If it is negative number only words which were used
less then -LIMIT times will be added."
  (let (l (sum 0))
    (maphash
     (cond
      ((or (not (numberp limit)) (= limit 0))
       (lambda (k v) (setq l (cons (cons k v) l) sum (+ sum v))))
      ((= limit -1) (lambda (k v) (setq sum (+ sum v))))
      ((< limit 0)
       (setq limit (- limit))
       (lambda (k v) (setq sum (+ sum v))
         (if (< v limit) (setq l (cons (cons k v) l)))))
      (t
       (lambda (k v) (setq sum (+ sum v))
         (if (> v limit) (setq l (cons (cons k v) l))))))
     word-frequency-table)
    (cons sum
          (cond
           ((equal reverse 'no-sort) l)
           (reverse (sort l (lambda (a b) (< (cdr a) (cdr b)))))
           (t       (sort l (lambda (a b) (> (cdr a) (cdr b)))))))))

(defun word-frequency-string (&optional reverse limit func)
  "Returns formatted string with word usage statistics.

If FUNC is nil each line contains number of times word was
called and the word; if it is t percentage usage is added in
the middle; if it is 'raw each line will contain number an
word separated by single line (with no formatting) otherwise
FUNC must be a function returning a string which will be called
for each entry with three arguments: number of times word was
called, percentage usage and the word.

See `word-frequency-list' for description of REVERSE and LIMIT
arguments."
  (let* ((list (word-frequency-list reverse)) (sum (car list)))
    (mapconcat
     (cond
      ((not func) (lambda (e) (format "%7d  %s\n" (cdr e) (car e))))
      ((equal func t)
       (lambda (e) (format "%7d  %6.2f%%  %03d %s\n"
                           (cdr e) 
               (/ (* 1e2 (cdr e)) sum) 
               (length (car e))
               (car e))))
      ((equal func 'raw) (lambda (e) (format "%d %s\n" (cdr e) (car e))))
      (t (lambda (e) (funcall func (cdr e) (/ (* 1e2 (cdr e)) sum) (car e)))))
     (cdr list) "")))

(defun word-frequency (&optional where reverse limit func)
  "Formats word usage statistics using
`word-frequency-string' function (see for description of
REVERSE, LIMIT and FUNC arguments) and:
- if WHERE is nil inserts it in th e
  or displays it in echo area if possible; else
- if WHERE is t inserts it in the current buffer; else
- if WHERE is an empty string inserts it into
  `word-frequency-buffer' buffer; else
- inserts it into buffer WHERE.

When called interactively behaves as if WHERE and LIMIT were nil,
FUNC was t and:
- with no prefix argument - REVERSE was nil;
- with universal or positive prefix arument - REVERSE was t;
- with negative prefix argument - REVERSE was 'no-sort."

  (interactive (list nil
                     (cond
                      ((not current-prefix-arg) nil)
                      ((> (prefix-numeric-value current-prefix-arg) 0))
                      (t 'no-sort))
                     nil t))
  (clrhash word-frequency-table)
  (word-frequency-process-buffer)
  (cond
   ((not where)
    (display-message-or-buffer (word-frequency-string reverse limit func)
                               word-frequency-buffer))
   ((equal where t)
    (insert (word-frequency-string reverse limit func)))
   (t
    (display-buffer
     (if (and (stringp where) (string= where ""))
         word-frequency-buffer where)
     (word-frequency-string reverse limit func)))))

(defun word-frequency-process-buffer ()
  (interactive)
  (let ((buffer (current-buffer))
        bounds
        beg
        end
        word)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\\<[[:word:]]+\\>" nil t)
;;    (while (forward-word 1)
        (word-frequency-incr (downcase (match-string 0)))
;;      (setq bounds (bounds-of-thing-at-point 'word))
;;      (setq beg (car bounds))
;;      (setq end (cdr bounds))
;;      (setq word (downcase (buffer-substring-no-properties beg end)))
;;      (word-frequency-incr word)
        ))))
