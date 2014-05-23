;; File type modes
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'auto-indent-mode)

(setq-default js2-auto-indent-p t)
(custom-set-variables  
 '(js2-basic-offset 4)
 '(js2-bounce-indent-p t))

;;(require 'paredit)
;;(define-key js2-mode-map "{" 'paredit-open-curly)
;;(define-key js2-mode-map "}" 'paredit-close-curly-and-newline)

(provide 'setup-js2-mode)
