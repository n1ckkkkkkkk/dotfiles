(setq custom-file "~/.emacs.custom.el")
(load-file custom-file)

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
(global-set-key (kbd "C-:")         'mc/skip-to-next-like-this)

(defun bit/duplicate-line ()
  (interactive)
  (duplicate-line)
  (next-line))

(global-set-key (kbd "C-,") 'bit/duplicate-line)
