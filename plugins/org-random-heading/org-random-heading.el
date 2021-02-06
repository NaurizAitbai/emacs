(defun org-random-heading--random(seq)
  "Given an input sequence SEQ, return a random output."
  (let* ((cnt (length seq))
	 (nmbr (random cnt)))
    (nth nmbr seq)))

(defun org-random-heading()
  "Go to a random child heading in current heading."
  (interactive)
  (let ((rline (org-random-heading--random(org-map-entries(lambda() (line-number-at-pos)) (concat "LEVEL=" (number-to-string (1+ (org-current-level)))) 'tree))))
    (forward-line (- rline 1))))

(global-set-key (kbd "C-c r") 'org-random-heading)

(provide 'org-random-heading)
