;; web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(use-package web-mode
  :ensure t
  :mode (("\\.js\\'" . web-mode)
	 ("\\.jsx\\'" .  web-mode)
	 ("\\.ts\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.html\\'" . web-mode))
  :commands web-mode)

(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

(setq company-minimum-prefix-length 1
      company-idle-delay 0.1)

;; lsp-mode
(setq lsp-log-io nil) ;; Don't log everything = speed
(setq lsp-keymap-prefix "C-c l")
(setq lsp-restart 'auto-restart)
(setq lsp-diagnostics-provider :flycheck)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(local-set-key (kbd "<C-M-return>") 'lsp-execute-code-action)

(use-package lsp-mode
  :ensure t
  :hook (
	 (web-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration)
     (before-save . lsp-eslint-apply-all-fixes)
	 )
  :commands lsp-deferred)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package rainbow-delimiters
  :ensure t
  :commands rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))



(provide 'setup-web-mode)
