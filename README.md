company-ghci
============
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

Add the following code to your init file
```
(require 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'company-mode)
;;; To get completions in the REPL
(add-hook 'haskell-interactive-mode-hook 'company-mode)
```

And setup haskell-mode to enable [haskell-interactive-mode](https://github.com/haskell/haskell-mode/wiki/Haskell-Interactive-Mode-Setup).

Usage
-----

Open a haskell file and load it using haskell-process-load-or-reload (C-c C-l), now when you type something, emacs should offer you some completions.

If you have hoogle installed, you can press ```<f1>``` to open a buffer with the documentation of the highlighted completion candidate.

Images
------
![Screenshot](img.png)