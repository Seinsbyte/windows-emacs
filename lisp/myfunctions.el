 (defun replace-tags-with-italics ()
  "Replace all occurrences of tags containing 'testing' with 'i', and their corresponding closing </SPAN> tag."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((open-regex "<[^<>]*italic[^<>]*>")
          (close-regex "</SPAN>"))
      (while (re-search-forward open-regex nil t)
        (replace-match "<i>")
        (when (re-search-forward close-regex nil t)
          (downcase (replace-match "</i>")))))
    (goto-char (point-min))
(let ((regex "<[^<>]*SPAN[^<>]*>"))
      (while (re-search-forward regex nil t)
        (replace-match "")))
(goto-char (point-min))
(let ((regex "<[^<>]*justify[^<>]*>"))
      (while (re-search-forward regex nil t)
        (replace-match "")))
    ))

