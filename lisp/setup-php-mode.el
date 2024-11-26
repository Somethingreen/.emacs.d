(require 'flymake)

(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))

(add-to-list 'flymake-err-line-patterns
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))


;;(add-hook 'php-mode-hook 'auto-indent-mbode)
(add-hook 'php-mode-hook 'electric-pair-mode)
(add-hook 'php-mode-hook 'electric-indent-mode)
(add-hook 'php-mode-hook 'rainbow-delimiters-mode)
(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))
; too slow alongside LSP  (add-hook 'php-mode-hook (lambda () (flymake-mode 1)))
(add-hook 'php-mode-hook 'projectile-mode)
(add-hook 'php-mode-hook 'lsp)

(custom-set-variables
 '(php-mode-force-pear 1)
)

(provide 'setup-php-mode)
