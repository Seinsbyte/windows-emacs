;; -*- coding: utf-8; lexical-binding: t; -*-
;; sample use of abbrev

;;; Global Abbrev
(clear-abbrev-table global-abbrev-table)

(define-abbrev-table 'global-abbrev-table
  '(
    ;; Sinais
    ("tr" "—")	 ; travessão
    ("ra" "→")	 ; right arrow
    ("lra" "←")  ; left arrow
    ("eqq" "↔")  ;; ↔ equivalent if and only if (iff)
    ("exx" "∃")  ; existe
    ("nexx" "∄") ; n existe
    ("prtd" "∀") ; para todo
    ("lg" "∴")	 ; logo
    ("jaq" "∵")  ; já que
    ("emr" "🝰")  ; em relação
    ("neg" "¬")  ; negação
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

    ;; Abreviações
    ("agr" "agora")
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
    ("p" "para")
    ("p" "para")
    ("pd" "pode")
    ("pdr" "poder")
    ("pdms" "podemos")
    ("pq" "porque")
    ("pr" "por")
    ("q" "que")
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
    ("tlv" "talvez")
    ("tnh" "tenho")
    ("vc" "você")
    ("vms" "vamos")
    ("dpnd" "depende")

    ;; frases
    ("fdp" "fator de produção")
        ("fsdp" "fator de produção")
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

(defvar xah-interactive-abbrev-hashtable nil "A hashtable for `xah-interactive-abbrev'. Key is abbrev string. Value is the text to be inserted." )

(setq
 xah-interactive-abbrev-hashtable
 #s(hash-table
    size 200
    test equal
    data
    (
     "pwsh pull xahemacs" "cd //xpc/users/xah/git/xahemacs/ && git pull c:/Users/xah/git/xahemacs/"
     "pwsh pull xah_emacs_init" "cd //xpc/users/xah/git/xah_emacs_init/ && git pull c:/Users/xah/git/xah_emacs_init/"
     "pwsh subdir size" "dir -Directory | % { Write-Host $_.name \" \" -NoNewLine; \"{0:N0}\" -f ((dir $_ -File -Recurse | measure -Property Length -sum).sum / 1mb); }"
     "pwsh diff" "diff (cat f1) (cat f2) "
     "pwsh emacs backup~" "gci c:/Users/xah/web/ -Recurse -Include *~ | rm"
     "pwsh dir size" "'{0:N0}' -f ((gci -Recurse | measure -Property Length -sum).sum / 1MB)"
     "pwsh .DS_Store" "gci -Recurse -Include '.DS_Store'"
     "pwsh #emacs_auto_save#" "gci -Recurse -Include '#*#'"
     "pwsh htaccess" "gci -Recurse -Include '.htaccess'"
     "pwsh xx temp file" "gci -Recurse -Include 'xx*'"
     "pwsh list empty dir" "gci -Directory -Recurse | ? { $_.GetFileSystemInfos().Count -eq 0 }"
     "pwsh move images" "mv //xpc/users/xah/Documents/*png c:/Users/xah/Downloads/x_todo_pics/ && mv //xpc/users/xah/Documents/*jpg c:/Users/xah/Downloads/x_todo_pics/ && mv //xpc/users/xah/Pictures/*png c:/Users/xah/Downloads/x_todo_pics/ && mv //xpc/users/xah/Pictures/*jpg c:/Users/xah/Downloads/x_todo_pics/ "
     "delete mac attribute" "xattr -c *png"
     "delete metadata" "exiftool -all= -overwrite_original *jpg"
     "gif to mp4" "ffmpeg -f gif -i x.gif x.mp4"
     "gif to webm" "ffmpeg -f gif -i x.gif x.webm"
     "gitdiff" "git --no-pager diff --color --no-index f1 f2"
     "image 256" "convert +dither -colors 256 "
     "image convert" "convert -quality 85% "
     "image scale" "convert -scale 50% -quality 85% "
     "lynx" "lynx -dump -assume_local_charset=utf-8 -display_charset=utf-8 -width=76 xxxxxxurl > xxfileName.txt"
     "mov to mp4" "ffmpeg -f mov -i x.mov x.mp4"
     "unix chmod file" "find . -type f -exec chmod 644 {} ';'"
     "unix chmod2" "find . -type d -exec chmod 755 {} ';'"
     "unix delete emacs backup~" "find . -name \"*~\" -delete"
     "unix delete empty dir" "find . -depth -empty -type d -delete"
     "unix delete empty file" "find . -type f -empty"
     "unix delete mac DS_Store" "find . -name \".DS_Store\" -delete;"
     "unix delete mac __MACOSX" "find . -depth -name \"__MACOSX\" -type d -exec rm -rf {} ';'"
     "unix grep" "grep -r -F \"hhhh\" --include='*html' ~/web"
     "unix image -bmp2png" "find . -name \"*bmp\" | xargs -l -i basename \"{}\" \".bmp\" | xargs -l -i  convert \"{}.bmp\" \"{}.png\""
     "unix image Batch" "find . -name \"*png\" | xargs -l -i basename \"{}\" \".png\" | xargs -l -i  convert -quality 85% \"{}.png\" \"{}.jpg\""
     "unix list empty dir" "find . -depth -empty -type d"
     "ytd" "youtube-dl -f 'bestvideo,bestaudio' -o 'f%(format_id)s.%(ext)s' url"
     )))
(defun xah-interactive-abbrev ()
"Prompt to insert string from `xah-interactive-abbrev-hashtable'.

URL `http://xahlee.info/emacs/emacs/emacs_interactive_abbrev.html'
Version 2017-08-13 2021-10-22"
  (interactive)
  (require 'subr-x)
  (let (($input
         (ido-completing-read
          "abbrevs:"
          (hash-table-keys xah-interactive-abbrev-hashtable)
          "PREDICATE" "REQUIRE-MATCH")))
    (insert (gethash $input xah-interactive-abbrev-hashtable))))



(set-default 'abbrev-mode t)

(setq save-abbrevs nil)
