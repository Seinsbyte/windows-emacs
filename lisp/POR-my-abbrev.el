;; -*- coding: utf-8; lexical-binding: t; -*-
;; sample use of abbrev

;;; Global Abbrev
(clear-abbrev-table global-abbrev-table)

(define-abbrev-table 'global-abbrev-table
  '(
    ;; Sinais
    ("tr" "—")	    ; travessão
    ("ra" "→")	    ; right arrow
    ("la" "←")	    ; left arrow
    ("eqq" "↔")	    ;; ↔ equivalent if and only if (iff)
    ("exx" "∃")	    ; existe
    ("nexx" "∄")    ; n existe 
    ("prtd" "∀")    ; para todo
    ("lg" "∴")	    ; logo
    ("jaq" "∵")	    ; já que

    ;;     ⋅	and	and	x ⋅ y
    ;; ^	caret / circumflex	and	x ^ y
    ;; &	ampersand	and	x & y
    ;; +	plus	or	x + y
    ;; ∨	reversed caret	or	x ∨ y
    ;; |	vertical line	or	x | y
    ;; x'	single quote	not - negation	x'
    ;; x	bar	not - negation	x
    ;; ¬	not	not - negation	¬ x
    ;; !	exclamation mark	not - negation	! x
    ;; ⊕	circled plus / oplus	exclusive or - xor	x ⊕ y
    ;; ~	tilde	negation	~ x
    ;; ⇒	implies	 	
    ;; ⇔	equivalent	if and only if (iff)
    ;; ↭ left right wave arrow ⇄

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
    ("ñ" "não")
    ("sm" "sim")
    ("q" "que")
    ("noe" "no entanto,")))




;; define abbrev for specific major mode
;; the first part of the name should be the value of the variable major-mode of that mode
;; e.g. for go-mode, name should be go-mode-abbrev-table

(when (boundp 'go-mode-abbrev-table)
  (clear-abbrev-table go-mode-abbrev-table))

(define-abbrev-table 'go-mode-abbrev-table
  '(
    ("go" "package main
import \"fmt\"
func main() {
        fmt.Println(\"3\")
}")

    ("p" "fmt.Printf(\"%v\\n\", hh▮)")
    ("pl" "fmt.Println(hh▮)")
    ("r" "return")
    ("st" "string")
    ("eq" "==")
    ("v" "var x = 3")
    ("df" "x := 3")
    ("c" "const x = 3")
    ("f" "func ff(x int) int {
    return nil
}")
    ("if" "if 4 { 3 }")
    ("ie" " if err != nil { panic(err) }")
    ("ei" "else if x > 0 { 3 }")
    ("else" "else { 3 }")
    ("for" "for i := 0; i < 4; i++ { i }")
    ("fr" "for k, v := range xxx {
▮
    }
")
    ;;

    ))

(set-default 'abbrev-mode t)

(setq save-abbrevs nil)
