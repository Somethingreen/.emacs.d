; list the packages you want
(setq package-list '(
		     flx
		     flx-ido
		     js2-mode
		     ac-js2
		     php-mode
                     web-mode
		     markdown-mode
		     magit
		     projectile
                     org
		     paredit
		     paredit-everywhere
		     skewer-mode
		     yasnippet
		     monokai-theme
		     auto-complete
                     auto-indent-mode
                     expand-region
                     restclient
                     cider
                     company
                     rainbow-delimiters
                     ))

(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'setup-packages)
