;;; init-gptel.el --- Mutl-LLM OpenAI Client & Model Context Procotol -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;;  - https://github.com/lizqwerscott/mcp.el/blob/master/Readme.org
;;;  - https://modelcontextprotocol.io/introduction
;;; Code:
;;;

;; Installation
(require-package 'gptel)
(require 'gptel)
(require 'gptel-gemini)
(require 'auth-source)

(defun sanityinc/gptel-get-key (host)
  "Retrieve API key for HOST from auth-source."
  (let ((found (nth 0 (auth-source-search :host host :user "apikey"))))
    (if found
        (let ((secret (plist-get found :secret)))
          (if (functionp secret) (funcall secret) secret))
      (message "Warning: No API key found in auth-source for %s" host)
      nil)))

(setq google-api-key (sanityinc/gptel-get-key "generativelanguage.googleapis.com"))
(setq gemini-api-key google-api-key)
(setq anthropic-api-key (sanityinc/gptel-get-key "api.anthropic.com"))
(setq openai-api-key (sanityinc/gptel-get-key "api.openai.com"))

;; (setq gptel-backend
;;       (gptel-make-openai "OpenAI"
;;         :stream t
;;         :key openai-api-key))

(defvar gptel-gemini
  (gptel-make-gemini "Gemini"
    :stream t
    :key gemini-api-key))

(setq gptel-backend gptel-gemini)

(setq gptel-model 'gptel-gemini)
(setq gptel-backend (gptel-make-gemini "Gemini" :key gemini-api-key))
(setq gptel-model 'gemini-3-flash-preview)
;; (setq gptel-backend (gptel-make-openai "OpenAI" :key openai-api-key :stream t))

;; (require-package 'gptel-aibo)
;; (use-package gptel-aibo
;;   :after (prog-mode flycheck)
;;   :config
;;   (define-key prog-mode-map (kbd "C-i") #'gptel-aibo-summon)
;;   (define-key gptel-aibo-mode-map
;;               (kbd "C-c g A") #'gptel-aibo-apply-last-suggestions))

(require-package 'gptel-fn-complete)
(require 'gptel-fn-complete)

(global-set-key (kbd "C-c RET") 'gptel-send)
(global-set-key (kbd "C-c /") 'gptel-fn-complete)


(defvar gptel-anthropic
  (gptel-make-anthropic "Claude"
    :stream t
    :key anthropic-api-key))

(defvar gptel-openai
  (gptel-make-openai "OpenAI"
    :stream t
    :key openai-api-key))

(provide 'init-01-gptel)
;;; init-01-gptel.el ends here
