;; -*- coding: utf-8; lexical-binding: t; -*-
;; sample use of abbrev

;;; Global Abbrev
(clear-abbrev-table global-abbrev-table)

(define-abbrev-table 'global-abbrev-table
  '(

    ;; Países
    ("ing" "Inglaterra")
    ("fra" "França")
    ("ale" "Alemanha")
    ("bra" "Brasil")
    ("port" "Portugal")

    ;;Palavras
    ("ind" "independência")
    ("rev" "revolução")
    ("soc" "sociedade")
    ("econ" "economia")
    ("inv" "investimento")
    ("tec" "tecnologia")
    ("mdo" "mão-de-obra")
    ("gov" "governo")
    ("vdd" "verdade")

    ;; Abreviações
    ("dps" "depois")
    ("mt" "muito")
    ("mts" "muitos")
    ("tb" "também")
    ("n" "não")
    ("s" "sim")
    ("q" "que")
    ("noe" "no entanto,")))




;; define abbrev for specific major mode
;; the first part of the name should be the value of the variable major-mode of that mode
;; e.g. for go-mode, name should be go-mode-abbrev-table

(set-default 'abbrev-mode t)

(setq save-abbrevs nil)
