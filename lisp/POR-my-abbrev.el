;; -*- coding: utf-8; lexical-binding: t; -*-
;; sample use of abbrev

;;; Global Abbrev
(clear-abbrev-table global-abbrev-table)

(define-abbrev-table 'global-abbrev-table
  '(
    ;; Nomes
    ("ari" "Aristóteles")

    ;; Países
    ("ing" "Inglaterra")

    ("fra" "França")
    ("ale" "Alemanha")
    ("bra" "Brasil")
    ("port" "Portugal")

    ;;Palavras
;;; s som de sim, sol, etc
;;; c som de k (carro, etc);
;;; k (usar para representar som de ch? ou x?)
;;; eliminar os ns no final de sílaba? independência idpdc, investimento ivstmt, tecnologia tcnlg. e os ls no final? re sul tado?
    ("idpdc" "independência") ; idpdc
    ("rvls" "revolução")      ; rvls
    ("ssdd" "sociedade")      ; ssdd
    ("ecnm" "economia")       ; ecnm
    ("invstm" "investimento") ; invstmt
    ("tcnlg" "tecnologia")    ;
    ("gvrn" "governo")	      ; gvrn
    ("vdd" "verdade")
    ("adm" "administração") ; admnstrs
    ("qtd" "quantidade")
    ("imndd" "imunidade")
    ("dplmc" "diplomacia")
    ("dplmt" "diplomata")
    ("dplmtc" "diplomático")
    ("ppls" "população")

    ;; Abreviações
    ("agr" "agora")
    ("aq" "aqui")
    ("msg" "mensagem")
    ("hj" "hoje")
    ("bm" "bem")
    ("cm" "com")
    ("d" "de")
    ("dps" "depois")
    ("ent" "então")
    ("enqt" "enquanto")
    ("fzr" "fazer")
    ("mnh" "minha")
    ("msm" "mesmo")
    ("mt" "muito")
    ("mts" "muitos")
    ("mvmnt" "movimento")
    ("n" "não")
    ("nd" "nada")
    ("nnc" "nunca")
    ("ngm" "ninguém")
    ("pd" "pode")
    ("pdr" "poder")
    ("pdms" "podemos")
    ("pq" "porque")
    ("pr" "por")
    ;; ("q" "que")
    ("oq" "o que")
    ("qlq" "qualquer")
    ("qm" "quem")
    ("qnd" "quando")
    ("qnt" "quanto")
    ("rztd" "resultado")
    ("sm" "sim")
    ("smp" "sempre")
    ("stv" "estava")
    ("st" "está")
    ("sto" "estou")
    ("tb" "também")
    ("td" "tudo")
    ("tds" "todos")
    ("tlv" "talvez")
    ("tnh" "tenho")
        ("tp" "tipo")
    ("vc" "você")
    ("vms" "vamos")
    ("dpnd" "depende")

    ;; frases
    ("fdp" "fator de produção")
    ("fsdp" "fatores de produção")
    ("mdo" "mão-de-obra")
    ("prx" "por exemplo")
    ("noe" "no entanto,")
    ("aiss" "ainda assim,")))




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
