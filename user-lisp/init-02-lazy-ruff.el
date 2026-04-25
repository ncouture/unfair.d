(use-package lazy-ruff
  :ensure t
  :hook ((python-mode . lazy-ruff-mode))
  :config
  (setq lazy-ruff-format-command "ruff format --config line-length=100")
  (setq lazy-ruff-only-format-block t)
  (setq lazy-ruff-only-format-region t)
  (setq lazy-ruff-only-format-buffer t))

(provides 'init-02-lazy-ruff)
;;; init-02-lazy-ruff.el ends here
