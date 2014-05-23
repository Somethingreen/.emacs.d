(add-to-list 'load-path user-emacs-directory)

(require 'setup-packages)
(require 'look-and-feel)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Global modes
(ido-mode 1)
(yas-global-mode 1)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-auto-start 3)
(setq-default indent-tabs-mode nil)


(require 'mode-mappings)

(eval-after-load 'js2-mode '(require 'setup-js2-mode))

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

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

