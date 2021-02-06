(defun org-copy-url()
  (interactive)
  (let* ((link-info (assoc :link (org-context)))
	 (text (when link-info
		 (buffer-substring-no-properties (or (cadr link-info) (point-min))
						 (or (caddr link-info) (point-max))))))
    (if (not text)
      (error "Not in org link")
      (string-match org-bracket-link-regexp text)
      (kill-new (substring text (match-beginning 1) (match-end 1))))))

(global-set-key (kbd "C-c e") 'org-copy-url)

(provide 'org-copy-url)
