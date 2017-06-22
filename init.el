(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(use-package python-mode
  :ensure t
  :mode "\.py$")

(use-package cython-mode
  :ensure t
  :mode "\.pyx$")

(use-package dockerfile-mode
  :ensure t
  :mode "^Dockerfile$")

(setq inhibit-startup-screen +1)

(use-package solarized-theme
  :ensure t
  :init (load-theme 'solarized-dark 't))

(use-package company
  :ensure t
  :config (progn
            (add-hook 'prog-mode-hook 'company-mode)

            (bind-key "C-n" #'company-select-next company-active-map)
            (bind-key "C-p" #'company-select-previous company-active-map)))

(use-package magit
  :ensure t
  :commands (magit-init
             magit-status
             magit-diff
             magit-commit)
  :bind (("C-c m s" . magit-status)
         ("C-c m d" . magit-diff)
         ("C-c m c" . magit-commit)
         ("C-c m l l" . magit-log-head)
         ("C-c m l b" . magit-log-buffer-file)
         ("C-c m l r" . magit-reflog-head))
  :config
  (progn
    (defadvice magit-status (around magit-fullscreen activate)
      (window-configuration-to-register :magit-fullscreen)
      ad-do-it
      (delete-other-windows))
    
    (defadvice magit-quit-window (around magit-restore-screen activate)
      ad-do-it
      (jump-to-register :magit-fullscreen))))

(use-package magit-blame
  :ensure magit
  :commands magit-blame-mode
  :bind ("C-c m b" . magit-blame))
