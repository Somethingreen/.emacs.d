(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(require 'setup-packages)
(require 'look-and-feel)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Env vars
(defun set-exec-path ()
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GOROOT"))
(when window-system (set-exec-path))

;; Global modes
(ido-mode 1)
(require 'auto-complete-config)
;(global-auto-complete-mode t)
(delete-selection-mode 1)
(desktop-save-mode 1)
(setq-default ac-auto-start 3)
(setq-default indent-tabs-mode nil)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(dumb-jump-mode)

(use-package plantuml-mode
  :custom
  (plantuml-jar-path "/home/agni/bin/plantuml.jar")
  (plantuml-default-exec-mode 'jar)
  (tab-width '4))

(use-package org-journal)

(use-package editorconfig
  :ensure t
  :delight
  :config
  (editorconfig-mode 1))

(require 'mode-mappings)

(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'web-mode '(require 'setup-web-mode))
(eval-after-load 'php-mode '(require 'setup-php-mode))
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'sass-mode '(require 'setup-sass-mode))
(eval-after-load 'go-mode '(require 'setup-go-mode))
(eval-after-load 'elixir-mode '(require 'setup-elixir-mode))

;; Open newline
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "C-c C-d") 'duplicate-line)
(global-set-key (kbd "<C-next>") 'end-of-buffer)
(global-set-key (kbd "<C-prior>") 'beginning-of-buffer)
(global-set-key (kbd "<s-prior>") 'previous-buffer)
(global-set-key (kbd "<s-next>") 'next-buffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-indent 4)
 '(c-basic-offset 'set-from-style)
 '(indent-tabs-mode nil)
 '(js-indent-level 4)
 '(js2-bounce-indent-p nil)
 '(org-support-shift-select t)
 '(package-selected-packages
   '(editorconfig yasnippet csv-mode org-journal d2-mode flycheck-plantuml plantuml-mode dap-mode dap-dlv-go yaml-mode smartparens elixir-mode scss-mode exec-path-from-shell go-autocomplete go-mode dumb-jump flycheck rainbow-delimiters company cider restclient expand-region auto-indent-mode auto-complete monokai-theme paredit-everywhere paredit projectile magit markdown-mode web-mode php-mode ac-js2 js2-mode flx-ido flx))
 '(php-mode-force-pear 1)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Input" :foundry "outline" :slant normal :weight normal :height 180 :width normal)))))
