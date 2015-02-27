(require 'company)
(require 'haskell-process)

(defun company-ghci (command &optional arg &rest ignored)
	(interactive (list 'interactive))
	(pcase command
		(interactive (company-begin-backend 'company-ghci))
		(prefix  (and (haskell-session-maybe)
									(company-grab-symbol)))
		(candidates (cdr (haskell-process-get-repl-completions (haskell-process)
																													 arg)))))

(provide 'company-ghci)
