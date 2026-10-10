(setq custom-file "~/.emacs.custom.el")
(load-file custom-file)

(setq-default c-basic-offset 4
    indent-tabs-mode nil
    tab-width 4
    c-default-style '((java-mode . "java")
                      (awk-mode . "awk")
                      (other . "stroustrup")))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(column-number-mode 1)
(global-display-line-numbers-mode)

(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-to-list 'default-frame-alist `(font . "Fira Code-20"))

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-;")         'mc/skip-to-previous-like-this)

(defun nick/duplicate-line ()
    (interactive)
    (duplicate-line)
    (next-line))

(global-set-key (kbd "C-,") 'nick/duplicate-line)

(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(defun nick/whitespace-handling ()
    (add-to-list
        'write-file-functions
        'delete-trailing-whitespace))

(add-hook 'emacs-lisp-mode 'nick/whitespace-handling)
(add-hook 'c-mode-hook 'nick/whitespace-handling)

(defun nick/c-mode-common-hook ()
    (setq indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'nick/c-mode-common-hook)

(defun nick/elisp-mode-hook ()
    (paredit-mode 1)
    (setq lisp-body-indent 4)
    (setq lisp-indent-offset 4))

(add-hook 'emacs-lisp-mode-hook 'nick/elisp-mode-hook)

(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-auto-start nil)
(define-key ac-mode-map [(meta return)] 'auto-complete)

(add-hook 'auto-complete-mode-hook
          (lambda ()
            (setq ac-sources (remove 'ac-source-abbrev ac-sources))))
