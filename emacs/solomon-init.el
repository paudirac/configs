;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pluggins
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autopair
(add-to-list `load-path "~/configs/emacs/plugins/")
(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)
(add-hook 'lisp-mode-hook #'(lambda () (setq autopair-dont-activate t)))

;; trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; yasnippet
(add-to-list 'load-path
	     "~/configs/emacs/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;; http://pedrokroger.net/2010/07/configuring-emacs-as-a-python-ide-2/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/clones/python-mode/")
(setq py-install-directory "~/clones/python-mode/")
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(add-to-list 'load-path "~/configs/emacs/plugins/python/")
(require 'ipython)

;; autopair python
(add-hook 'python-mode-hook
	  #'(lambda () (push '(?' . ?')
			     (getf autopair-extra-pairs :code))
	      (setq autopair-handle-action-fns
		    (list #'autopair-default-handle-action
			  #'autopair-python-triple-quote-action))))

;; tramp is required for pep8 to work
(require 'tramp)
(require 'python-pep8)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default py-indent-offset 4)

(require 'python-pylint)

;; (add-hook 'before-save-hook
;;	  #'(lambda()
;;	      (when (equal major-mode 'python-mode)
;;		(python-pylint))))


;; (add-to-list 'load-path "~/.emacs.d/plugins/helm/")
;; (require 'helm-config)
;; (helm-mode 1)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; ;(global-set-key (kbd "C-c h") 'helm-mini)

;; (require 'anything)
;; (require 'anything-ipython)
;; (when (require 'anything-show-completion nil t)
;;   (use-anything-show-completion 'anything-ipython-complete
;; 				'(length initial-pattern)))
;; ;; don't know yet what anything does



(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode
;; 20120516
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list `auto-mode-alist `("\\.org\\'" . org-mode))
(global-set-key "\C-cl" `org-store-link)
(global-set-key "\C-ca" `org-agenda)
(global-set-key "\C-cb" `org-iswitchb)
(add-hook `org-mode-hook `turn-on-font-lock)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hide crap
;; http://www.masteringemacs.org/articles/2010/10/04/beginners-guide-to-emacs/
;; 20120529
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)