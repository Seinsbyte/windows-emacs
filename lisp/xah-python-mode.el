;;; xah-python-mode.el --- major mode for editing python code. -*- coding: utf-8; lexical-binding: t; -*-
;; version 2023-01-16 2023-01-19 2023-01-22

;; ssss---------------------------------------------------
;; commands


;; ssss---------------------------------------------------
;; keyword completion

(defun xah-python-complete-symbol ()
  "Perform keyword completion on current symbol.
Version 2023-01-19"
  (interactive)
  (let* (($bds (bounds-of-thing-at-point 'symbol))
         ($p1 (car $bds))
         ($p2 (cdr $bds))
         ($current-sym
          (if (or (null $p1) (null $p2) (equal $p1 $p2))
              ""
            (buffer-substring-no-properties $p1 $p2)))
         $result-sym)
    (when (not $current-sym) (setq $current-sym ""))
    (setq $result-sym
          (completing-read "" xah-python-keywords nil nil $current-sym))
    (delete-region $p1 $p2)
    (insert $result-sym)))

(defun xah-python-indent-or-complete ()
  "if cursor is after a word, call `xah-python-complete-symbol', else do indent.
Version 2023-01-22"
  (interactive)
  (let (($curChar (char-before)))
    (if (or (eq $curChar 32) (eq $curChar 9) (eq $curChar 10))
        (insert "\t")
      (xah-python-complete-symbol))))

;; ssss---------------------------------------------------
;; syntax coloring

(setq xah-python-keywords
'("and" "del" "from" "not" "while" "as" "elif"
"global" "or" "with" "assert" "else" "if" "pass" "yield" "break" "except"
"import" "class" "in" "raise" "continue" "finally" "is" "return" "def"
"for" "lambda" "try" "def" "for" "with" "await" "self" "abs" "all"
"any" "bin" "bool" "callable" "chr" "classmethod" "compile" "complex"
"delattr" "dict" "dir" "divmod" "enumerate" "eval" "filter" "float"
"format" "frozenset" "getattr" "globals" "hasattr" "hash" "help" "hex"
"id" "input" "int" "isinstance" "issubclass" "iter" "len" "list" "locals"
"map" "max" "memoryview" "min" "next" "object" "oct" "open" "ord" "pow"
"print" "property" "range" "repr" "reversed" "round" "set" "setattr"
"slice" "sorted" "staticmethod" "str" "sum" "super" "tuple" "type"
"vars" "zip" "ascii" "breakpoint" "bytearray" "bytes" "exec" ))

(setq xah-python-dunder_words '("__import__" "__annotations__" "__closure__" "__code__" "__defaults__" "__dict__" "__doc__" "__globals__" "__kwdefaults__" "__name__" "__module__" "__package__" "__qualname__" ))

(setq xah-python-highlights
      `((,(regexp-opt xah-python-keywords 'symbols) . 'font-lock-keyword-face)
        (,(regexp-opt xah-python-dunder_words 'symbols) . 'font-lock-builtin-face)))

;; ssss---------------------------------------------------
;; syntax table
(defvar xah-python-mode-syntax-table nil "Syntax table for `xah-python-mode'.")
(setq xah-python-mode-syntax-table
      (let ( (synTable (make-syntax-table)))

        ;; make apostrophe as string delimiter
        ;; (modify-syntax-entry 39 "\"" synTable)
        (modify-syntax-entry ?' "\"" synTable)

        ;; python style comment: “# …”
        (modify-syntax-entry ?# "<" synTable)
        (modify-syntax-entry ?\n ">" synTable)
        synTable))

;; ssss---------------------------------------------------
;; abbrev table, templates

(setq xah-python-mode-abbrev-table nil)

(define-abbrev-table 'xah-python-mode-abbrev-table
  '(
    ("filter" "filter(list, func)" )
    ("if" "if x == 1:
\tx" )
    ;; hundreds more
    )
  "Abbrev table for `xah-python-mode'"
  )

(abbrev-table-put xah-python-mode-abbrev-table :regexp "\\([_*0-9A-Za-z]+\\)")
(abbrev-table-put xah-python-mode-abbrev-table :case-fixed t)
(abbrev-table-put xah-python-mode-abbrev-table :system t)

;; ssss---------------------------------------------------
;; keybinding

(defvar xah-python-mode-map nil "Keymap for `xah-python-mode-mode'")
(progn
  (setq xah-python-mode-map (make-sparse-keymap))
  (define-key xah-python-mode-map (kbd "TAB") 'xah-python-indent-or-complete))

;; ssss---------------------------------------------------

(define-derived-mode xah-python-mode prog-mode "∑python"
  "Major mode for editing python language code.
version 2023-01-16"
  (setq-local comment-start "# ")
  (setq-local comment-end "")
  (set-syntax-table xah-python-mode-syntax-table)
  (setq font-lock-defaults '(xah-python-highlights))
  (use-local-map xah-python-mode-map)
  (abbrev-mode 1)
  :abbrev-table xah-python-mode-abbrev-table
  )

;; setup files ending in .py to open in xah-python-mode
(add-to-list 'auto-mode-alist '("\\.py[3]*\\'" . xah-python-mode))
