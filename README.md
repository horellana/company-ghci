company-ghci
============
![Screenshot](img.png)
Description
-----------
company-ghci is a company backend that provides completions for the haskell programming language by talking to a ghci process.

Requeriments
------------
* company
* haskell-mode

Installation
------------
company-ghci is available on melpa, so first you will have to [configure emacs to use the MELPA repository](http://melpa.org/#/getting-started).
Then you can install the package using (package-install).

Usage
-----
	(require 'company-ghci)
	(push 'company-ghci company-backends)
	(add-hook 'haskell-mode-hook 'company-mode)
	;;; To get completions in the REPL
	(add-hook 'haskell-interactive-mode-hook 'company-mode)
