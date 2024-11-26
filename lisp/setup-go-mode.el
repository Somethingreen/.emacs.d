(require 'go-autocomplete)

(defun my-go-mode-hook ()
;  (add-hook 'before-save-hook 'gofmt-before-save)
;  (if (not (string-match "go" compile-command))
;      (set (make-local-variable 'compile-command)
;           "go build -v && go test -v && go vet"))
;  (local-set-key (kbd "M-.") 'godef-jump)
  (delight `lsp-mode " lsp")
  (setq tab-width 4))

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook 'lsp-format-buffer t t)
  (add-hook 'before-save-hook 'lsp-organize-imports t t))
(add-hook 'go-mode-hook 'lsp-go-install-save-hooks)
(add-hook 'go-mode-hook 'lsp-deferred)
(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'go-mode-hook 'flycheck-mode)

(use-package dap-mode
  :ensure t)

(use-package dap-dlv-go)

(provide 'setup-go-mode)
