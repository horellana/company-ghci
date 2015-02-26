(require 'company)
(require 'haskell-process)

(defun company-ghci (command &optional arg &rest ignored)
	(interactive (list 'interactive))
	(let* ((to-complete (company-grab-symbol))
				 (can-complete (haskell-session-maybe))
				 (completions (when can-complete
												(haskell-process-get-repl-completions (haskell-process)
																															to-complete))))
		(cl-case command
			(interactive (company-begin-backend 'company-ghci-backend))
			(prefix  (and can-complete to-complete))
			(candidates completions))))

(provide 'company-ghci)
