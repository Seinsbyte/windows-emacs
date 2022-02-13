```
;; -*- coding: utf-8; lexical-binding: t; -*-
;; Emacs: Abbrev Mode
;; http://xahlee.info/emacs/emacs/emacs_abbrev_mode.html

;; HHH___________________________________________________________________

(clear-abbrev-table global-abbrev-table)

(define-abbrev-table 'global-abbrev-table
  '(

    ;; maybe temp

    ("xtodo" "<span class=\"todo\">xtodo</span>")

    ("xe" "XahEmacs")

    ("cisst" "Case-insensitive")
    ("csst" "Case-sensitive")

    ("uhkt" "Ultimate Hacking Keyboard")
    ("soft" "StackOverflow")

    ("phpt" "<?php 3 ?>")

    ;; English top common word/phrase

    ("ab" "about")
    ("aft" "after")
    ("bc" "because")
    ("bf" "before")
    ("bt" "between")
    ("cn" "cannot")
    ("cnt" "can't")
    ("ddnt" "didn't")
    ("dn" "down")
    ("dnt" "don't")
    ("ds" "does")
    ("dsnt" "doesn't")
    ("hev" "however")
    ("hnt" "haven't")
    ("hs" "here's")
    ("hv" "have")
    ("il" "I will")
    ("im" "I'm")
    ("isnt" "isn't")
    ("itd" "it would")
    ("itl" "it will")
    ("itri" "interesting")
    ("iv" "i have")
    ("k" "know")
    ("mb" "maybe")
    ("min" "minute")
    ("n" "and")
    ("oft" "often")
    ("oned" "one would")
    ("pb" "problem")
    ("pbl" "probably")
    ("ph" "perhaps")
    ("pls" "please")
    ("pp" "people")
    ("q" "question")
    ("r" "are")
    ("rly" "really")
    ("rt" "return")
    ("sd" "should")
    ("sdv" "should have")
    ("sdvb" "should have been")
    ("sec" "second")
    ("secs" "seconds")
    ("sth" "something")
    ("sts" "sometimes")
    ("th" "there")
    ("ths" "these")
    ("thx" "thanks")
    ("tu" "thank you")
    ("twb" "that would be")
    ("ty" "they")
    ("tyr" "they are")
    ("u" "you")
    ("udst" "understand")
    ("udstd" "understanding")
    ("ull" "you'll")
    ("ur" "your")
    ("usu" "usually")
    ("uv" "you've")
    ("w" "with")
    ("wa" "what")
    ("wc" "which")
    ("wd" "would")
    ("wdnt" "wouldn't")
    ("wh" "where")
    ("wl" "we will")
    ("wn" "want")
    ("wns" "wants")
    ("wnt" "won't")
    ("wo" "without")
    ("ws" "what is")
    ("wsnt" "wasn't")

    ;; English phrases abbrev

    ("afaik" "as far as i know")
    ("atm" "at the moment")
    ("btw" "by the way")
    ("dfb" "difference between")
    ("dunno" "don't know")
    ("evt" "every time")
    ("hdu" "how do you")
    ("ht" "how to")
    ("idk" "I don't know")
    ("ie" "i.e.")
    ("iirc" "if i recall correctly")
    ("irl" "in real life")
    ("ot" "of the")
    ("pov" "point of view")
    ("rl" "real life")
    ("sdnt" "shouldn't")
    ("tis" "it is")
    ("tr" "there are")
    ("ts" "there is")
    ("tsb" "there should be")
    ("tss" "this is")
    ("tts" "that is,")
    ("uc" "you see")
    ("wrt" "with respect to")
    ("wtdb" "What's the difference between")
    ("wtf" "what the faak")

    ;; english, most common

    ("mk" "make")
    ("tm" "them")
    ("tnk" "think")
    ("tnki" "thinking")

    ;; english, single word

    ;; general scheme
    ;; when there are several alternatives, then words ending
    ;; ing → g
    ;; tion → t
    ;; ment → m
    ;; ly → l
    ;; a → able
    ;; ed → d

    ("addr" "address")
    ("agm" "argument")
    ("anm" "announcement")
    ("apr" "apparent")
    ("aprl" "apparently")
    ("ar" "around")
    ("asm" "assignment")
    ("atmt" "automatic")
    ("atmtl" "automatically")
    ("att" "alternative")
    ("attl" "alternatively")
    ("bg" "background")
    ("bgn" "beginning")
    ("cpr" "compare")
    ("cprs" "comparison")
    ("crt" "character")
    ("crts" "characters")
    ("cs" "computer science")
    ("ctn" "continue")
    ("ctvs" "controversial")
    ("cvn" "convenient")
    ("cvs" "convention")
    ("dfn" "definite")
    ("dfnl" "definitely")
    ("dfns" "definition")
    ("dfr" "different")
    ("dfrs" "difference")
    ("dkm" "document")
    ("dkmts" "documentation")
    ("dkrs" "declaration")
    ("dks" "discussion")
    ("dl" "download")
    ("dms" "dimension")
    ("dmsn" "dimensional")
    ("dmst" "demonstrate")
    ("dsk" "describe")
    ("dsks" "description")
    ("dt" "distance")
    ("dtnr" "dictionary")
    ("dtnrs" "dictionaries")
    ("dvl" "develop")
    ("dvlm" "development")
    ("efs" "efficient")
    ("eg" "e.g.")
    ("egn" "ergonomic")
    ("elm" "element")
    ("eltct" "electricity")
    ("epr" "experience")
    ("eps" "expression")
    ("esp" "especially")
    ("et" "extreme")
    ("evrm" "environment")
    ("exns" "explanation")
    ("exp" "example")
    ("exps" "examples")
    ("fdmt" "fundamental")
    ("fl" "follow")
    ("fli" "following")
    ("fnmn" "phenomenon")
    ("fqc" "frequency")
    ("fql" "frequently")
    ("fsnlt" "functionality")
    ("ftr" "feature")
    ("fu" "function")
    ("gvm" "government")
    ("hex" "hexadecimal")
    ("ia" "interactive")
    ("idt" "industry")
    ("ifms" "information")
    ("imd" "immediate")
    ("imdl" "immediately")
    ("ipm" "implement")
    ("ipmts" "implementation")
    ("ipsb" "impossible")
    ("ipt" "important")
    ("itds" "introduction")
    ("itnsn" "international")
    ("kb" "keyboard")
    ("kbd" "keybinding")
    ("kbs" "keyboards")
    ("kds" "condition")
    ("kfs" "confusion")
    ("kmd" "command")
    ("kmnks" "communication")
    ("kmnt" "community")
    ("kp" "keypad")
    ("kpn" "company")
    ("kpt" "computer")
    ("krn" "correctness")
    ("kw" "keyword")
    ("lgj" "language")
    ("lgjs" "languages")
    ("lit" "literature")
    ("lst" "live stream")
    ("maint" "maintenance")
    ("marj" "marijuana")
    ("mknk" "mechanical")
    ("mln" "millennials")
    ("mmt" "mathematics")
    ("mmtc" "mathematician")
    ("mmtcs" "mathematicians")
    ("mt" "mountain")
    ("mtpks" "multiplication")
    ("nb" "number")
    ("nssr" "necessary")
    ("ogn" "organize")
    ("ognzs" "organization")
    ("oj" "object")
    ("okr" "occur")
    ("okrs" "occurrence")
    ("parag" "paragraph")
    ("pf" "prefer")
    ("pfr" "preference")
    ("pfs" "profession")
    ("pg" "program")
    ("pgm" "programing")
    ("pgmb" "programable")
    ("pgmr" "programer")
    ("pj" "project")
    ("pjs" "projection")
    ("plsf" "philosophy")
    ("pltk" "political")
    ("prmt" "parameter")
    ("procs" "process")
    ("prof" "professor")
    ("prts" "parenthesis")
    ("psb" "possible")
    ("psbl" "possibly")
    ("pss" "position")
    ("psy" "psychology")
    ("pw" "password")
    ("ref" "reference")
    ("rlt" "relative")
    ("rps" "represent")
    ("rstr" "restaurant")
    ("rv" "review")
    ("sci" "science")
    ("sk" "screen")
    ("sk" "shortcut")
    ("sks" "screenshot")
    ("sls" "solution")
    ("snfk" "significant") ;
    ("snfks" "significance")
    ("spr" "separate")
    ("sprl" "separately")
    ("sps" "suppress")
    ("sst" "substring")
    ("stc" "sentence")
    ("stf" "scientific")
    ("str" "string")
    ("stt" "structure")
    ("svr" "several")
    ("sw" "software")
    ("tds" "tradition")
    ("tdsn" "traditional")
    ("tf" "transform")
    ("tfms" "transformation")
    ("tnlg" "technology")
    ("toc" "table of contents")
    ("tpr" "transparent")
    ("tprl" "temporarily")
    ("tprt" "temperature")
    ("ud" "under")
    ("uept" "unexpected")
    ("vd" "video")
    ("ver" "version")

    ("anls" "analysis")
    ("ant" "another")
    ("arj" "arrange")
    ("arjm" "arrangement")
    ("atv" "activate")
    ("dsb" "disable")
    ("het" "height")
    ("std" "standard")
    ("wdt" "width")
    ("htr" "history")

    ;; english, phrase

    ("rnp" "right now")
    ("diyp" "Do It Yourself")
    ("faqp" "frequently asked questions")
    ("fep" "for example")
    ("imp" "instant message")

    ("qnap" "questions and answers")
    ("sjp" "social justice")
    ("wipp" "work in progress")
    ("ttp" "touch type")

    ("ssp" "such as")
    ("sap" "See also:")

    ;; english, proper noun

    ("ahdp" "American Heritage Dictionary")
    ("calip" "California")
    ("nyp" "New York")
    ("nytp" "New York Times")
    ("chnp" "Chinese")
    ("engp" "English")
    ("europp" "Europe")
    ("jpp" "Japan")
    ("jpnp" "Japanese")
    ("sfccp" "San Francisco")
    ("wpp" "Wikipedia")

    ;; computing

    ("tb" "trackball")
    ("clb" "clipboard")
    ("cmd" "command")
    ("cmds" "commands")
    ("cpt" "codepoint")
    ("db" "database")
    ("drtr" "directory")
    ("drtrs" "directories")
    ("dtt" "datatype")
    ("eqvl" "equivalent")
    ("fs" "fullscreen")
    ("lhst" "left-hand-side")
    ("libst" "libraries")
    ("libt" "library")
    ("ll" "lowline")
    ("md" "metadata")
    ("obj" "object")
    ("ovw" "overwrite")
    ("rhs" "right-hand-side")
    ("subdir" "subdirectory")
    ("subdirs" "subdirectories")
    ("ttr" "tutorial")
    ("udsk" "underscore")
    ("vrb" "variable")
    ("vrbs" "variables")

    ;; computing, phrase

    ("ai" "artificial intelligence")
    ("cat" "cellular automata")
    ("cfg" "context-free grammar")
    ("cli" "command line interface")
    ("ev" "environment variable")
    ("evs" "environment variables")
    ("fpp" "functional programing")
    ("gui" "graphical user interface")
    ("gv" "global variable")
    ("ipa" "IP address")
    ("ist" "image source")
    ("oop" "object oriented programing")
    ("os" "operating system")
    ("rsi" "Repetitive Strain Injury")
    ("sc" "source code")
    ("ui" "user interface")
    ("wpm" "words per minute")

    ;; computing, proper noun

    ("wm" "Window Manager")
    ("wml" "Windows, Mac, Linux")
    ("win10" "Windows 10")
    ("ahk" "AutoHotkey")
    ("cj" "Clojure")
    ("cl" "Common Lisp")
    ("elt" "emacs lisp")

    ("fb" "Facebook")
    ("twt" "twitter")
    ("fft" "Firefox")
    ("gc" "Google Chrome")
    ("iet" "Internet Explorer")
    ("jq" "jQuery")
    ("jst" "JavaScript")
    ("jvm" "Java Virtual Machine")
    ("lsl" "Linden Scripting Language")
    ("mac" "Mac")
    ("macos" "macOS")
    ("macosx" "Mac OS X")
    ("mma" "Mathematica")
    ("ms" "Microsoft")
    ("msvs" "Microsoft Visual Studio")
    ("msw" "Microsoft Windows")
    ("nn" "non-nil")
    ("ppt" "PayPal")
    ("pes" "PowerShell")
    ("sl" "Second Life")
    ("tek" "Truly Ergonomic keyboard")
    ("tst" "TypeScript")
    ("vb" "Visual Basic")
    ("wfs" "WolframScript")
    ("wfl" "WolframLang")
    ("wfe" "WolframEngine")
    ("yt" "YouTube")
    ("ops" "open source")

    ;; math

    ("de" "differential equations")
    ("dg" "differential geometry")
    ("ode" "ordinary differential equations")

    ;; programing

    ("eq" "==")
    ("eqq" "===")
    ("eqt" "=\"▮\"")

    ("hh" "HHH___________________________________________________________________")

    ("byline" "<div class=\"byline\">By Xah Lee. Date: <time>2009-07-30</time>. Last updated: <time>2017-05-09</time>.</div>")

    ;; ("twittercard" "<meta name=\"twitter:image\" content=\"http://example.com/cat.jpg\">" )

    ;; regex
    ("azt" "\\([A-Za-z0-9]+\\)")
    ("brackett" "\\[\\([^]]+?\\)\\]")
    ("curlyt" "“\\([^”]+?\\)”")
    ("digitst" "\\([0-9]+\\)")
    ("datet" "\\([0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]\\)")
    ("dott" "\\(.\\)")
    ("strt" "\\([^\"]+?\\)")
    ("tagt" "\\([</>=\" A-Za-z0-9]+\\)")

    ;; shell
    ("ytd" "youtube-dl --id --keep-video --extract-audio --")

    ;; html
    ("mxt" "<kbd>Alt</kbd>+<kbd>x</kbd>")
    ("pmovedt" "<p class=\"page_moved_64598\">page moved to <a href=\"x.html\">x</a></p>")
    ("divf" "<section class=\"divFlowXL\">\n▮\n\n</section>\n\n")

    ("putthis" "<p>Put this in your emacs init file:</p>\n\n")
    ("topict" "<div class=\"topicXL\">\n<h4>JavaScript Reverse Key/Value</h4>\n<ul>\n<li><a href=\"xx1.html\">xx1</a></li>\n<li><a href=\"xx2.html\">xx2</a></li>\n</ul>\n</div>\n\n")

    ;; unicode
    ("asciit" "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~")

    ("bu" "•")
    ("la" "←")
    ("ua" "↑")
    ("ra" "→")
    ("da" "↓")

    ("emo" "😃😄😅😂🤩🤡🤗😠😮😒😑🚀🛸🌛🌞☄🎪☠♥🌟💠❌💨🔥💯👍👎💦👀")

    ;; code

    ("utf8t" "-*- coding: utf-8 -*-")

    ("vdspc" "Visual Dictionary of Special Plane Curves")
    ("xfk" "xah-fly-keys")
    ("xwm" "xah-wolfram-mode")
    ("eem" "ergoemacs-mode")

    ;; url
    ("3dxmu" "http://3D-XplorMath.org/")

    ;; xah personal
    ("xts" "Xah Talk Show")
    ("xtv" "XahTV")
    ("xl" "xahlee")

    ("xls" "Live stream in x hours. x San Francisco time.
https://www.youtube.com/c/xahlee/live
Topic:
sub + 🔔")

    ("xim" "Twitter: @xah_lee
Google talk: xahlee@gmail.com
Skype: XahLee
AIM: xahlee
Yahoo: P0lyglut
MSN: p0lyglut@yahoo.com or xahlee
Second Life: Xah Toll
QQ: http://user.qzone.qq.com/2609322939")

    ;;

    ))

(progn
  (when (boundp 'python-mode-abbrev-table)
    (clear-abbrev-table python-mode-abbrev-table))
  (define-abbrev-table 'python-mode-abbrev-table
    '(
      ("def" "def f(a, b):
    \"\"\"doc\"\"\"
   return 3")
      ("map" "map(f, li)")
      ("if" "if x < 3:
    3
elif 4:
    4
else:
    5")

      ("elif" "elif 4:
    4")
      ("else" "else 5:
    5")
      ("for" "for i, v in enumerate(li):
     print(i, v)")
      ("while" "while x < 3:
    x += 1"))))

(progn
  ;; python

  (define-abbrev-table 'python-mode-abbrev-table
    '(

      ("p" "print(▮)")
      ("r" "return")
      ("eq" "==")
      ;;

      )))

(set-default 'abbrev-mode t)

;; HHH___________________________________________________________________

(defun xah-abbrev-hook-function ()
  "Abbrev hook function, used for `define-abbrev'.
 Our use is to prevent inserting the char that triggered expansion. Experimental.
Version: 2016-10-24"
  t)

(put 'xah-abbrev-hook-function 'no-self-insert t)

(setq abbrev-expand-function 'xah-global-expand-abbrev)
;; (setq abbrev-expand-function 'abbrev--default-expand)

(defun xah-global-expand-abbrev ()
  "function for value of `abbrev-expand-function'.
Expand the symbol before cursor,
if cursor is not in string or comment.
Returns the abbrev symbol if there's a expansion, else nil.
Version: 2019-01-10"
  (interactive)
  (when (xah-elisp-abbrev-enable-function) ; abbrev property :enable-function doesn't seem to work, so check here instead
    (let ( $p1 $p2 $abrStr $abrSymbol )

      ;; (save-excursion
      ;;   (forward-symbol -1)
      ;;   (setq $p1 (point))
      ;;   (goto-char $p0)
      ;;   (setq $p2 $p0))

      (save-excursion
        ;; 2017-01-16 note: we select the whole symbol to solve a problem. problem is: if “aa”  is a abbrev, and “▮bbcc” is existing word with cursor at beginning, and user wants to type aa- to result in aa-bbcc. Normally, aa immediately expands. This prevent people editing bbcc to become aa-bbcc. This happens for example in elisp, when editing “search-forward” to become “re-search-forward”. The downside of this is that, people cannot type a abbrev when in middle of a word.
        (forward-symbol -1)
        (setq $p1 (point))
        (forward-symbol 1)
        (setq $p2 (point)))

      (setq $abrStr (buffer-substring-no-properties $p1 $p2))
      (setq $abrSymbol (abbrev-symbol $abrStr))
      (if $abrSymbol
          (progn
            (abbrev-insert $abrSymbol $abrStr $p1 $p2 )
            (xah-global-abbrev-position-cursor $p1)
            $abrSymbol)
        nil))))

(defun xah-global-abbrev-position-cursor (&optional Pos)
  "Move cursor back to ▮ if exist, else put at end.
Return true if found, else false.
Version: 2016-10-24"
  (interactive)
  (let (($foundQ (search-backward "▮" (if Pos Pos (max (point-min) (- (point) 100))) t )))
    (when $foundQ (delete-char 1))
    $foundQ
    ))

(setq save-abbrevs nil)
```
