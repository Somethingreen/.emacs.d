; list the packages you want
(setq package-list '(
                     use-package
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
		             monokai-theme
		             auto-complete
                     auto-indent-mode
                     expand-region
                     restclient
                     cider
                     company
                     rainbow-delimiters
                     flycheck
                     dumb-jump
                     go-mode
                     go-autocomplete
                     exec-path-from-shell
                     lsp-mode
                     lsp-ui
                     which-key
                     ag
                     ))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

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
