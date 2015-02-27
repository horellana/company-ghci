;;; company-ghci.el --- company backend which uses the current ghci process.

;; Author: Hector Orellana <hofm92@gmail.com>
;; Package-Requires: ((company "0.8.11") (haskell-mode "13"))
;; Package-Version: 0.01

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;; Usage:

;; (require 'company-ghci)
;; (add-to-list 'company-backends 'company-ghci)
;; (add-hook 'haskell-mode-hook 'company-mode)

;;; Code:

(require 'company)
(require 'haskell-process)

(defun company-ghci/get-signature (fn)
	(when (haskell-session-maybe)
		(haskell-process-queue-sync-request (haskell-process)
																				(concat ":t " fn))))

(defun company-ghci (command &optional arg &rest ignored)
  "Company backend that provides completions using the current ghci process."
  (interactive (list 'interactive))
  (pcase command
    (interactive (company-begin-backend 'company-ghci))
    (prefix  (and (haskell-session-maybe)
									(company-grab-symbol)))
    (candidates (cdr (haskell-process-get-repl-completions (haskell-process)
																													 arg)))))

(provide 'company-ghci)
;;; company-ghci.el ends here
