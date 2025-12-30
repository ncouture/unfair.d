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

(defun read-value-from-file (file-path)
  "Read and return a value from FILE-PATH."
  (with-temp-buffer
    (insert-file-contents (expand-file-name file-path))
    (goto-char (point-min))
    ;; Read the first Lisp expression from the buffer
    (format "%s" (read (current-buffer)))))

(defun get-google-key ()
  "Get Google API Key."
  (read-value-from-file "~/.ssh/apiKeys/google.key"))
(setq google-api-key (get-google-key))

(defun get-gemini-key ()
  "Get Gemini API Key."
  (read-value-from-file "~/.ssh/apiKeys/gemini.key"))
(setq gemini-api-key (get-gemini-key))

(defun get-anthropic-key ()
  "Get Anthropic API Key."
  (read-value-from-file "~/.ssh/apiKeys/anthropic.key"))
(setq anthropic-api-key (get-anthropic-key))

(defun get-openai-key ()
  "Get OpenAI API Key."
  (read-value-from-file "~/.ssh/apiKeys/openai.key"))
(setq openai-api-key (get-openai-key))

(setq openai-gpt41-mini-gptel-model 'gpt-4.1-mini gptel-backend
      (gptel-make-openai "OpenAI"
        :stream t
        :key openai-api-key))

(setq gemini-model 'gemini-latest-model gptel-backend
      '(gptel-make-gemini "Gemini Pro Preview"
         :description "Gemini"
         :stream t
         :key gemini-api-key))

(setq gptel-model 'gemini-3-pro-preview gptel-gemini
      (gptel-make-gemini "Gemini"
        :stream t
        :key gemini-api-key))

;; (setq-default gptel-model 'gemini-3-pro-previewl
;;               gptel-backend 'gptel-3-pro-preview
;;               gptel-display-buffer-action '(pop-to-buffer-same-window))

(setq openai-gpt5 'gpt-5 gptel-backend
      (gptel-make-openai "OpenAI"
        :stream t
        :key openai-api-key))


(gptel--make-openai
 :host "api.openai.com"
 :key openai-api-key
 :stream t
 :models '("gpt-5"))

(gptel--make-openai
 :host "api.openai.com"
 :key openai-api-key
 :stream t
 :models '("gpt-5"))

(gptel--make-gemini
 :host "generativelanguage.googleapis.com"
 :key gemini-api-key
 :stream t
 :models '("gemini-3-latest-preview"))

;; (setq gemini-3-pro-preview 'gemini-3-pro-preview gptel-backend
;;       (gptel-make-gemini "Gemini"
;;         :stream t
;;         :key google-api-key))

(defvar gptel-openai
  (gptel-make-openai "Openai" :key openai-api-key :stream t))

(defvar gptel-gemini
  (gptel-make-gemini "Gemini" :stream t :key gemini-api-key))

(setq gptel-model 'gptel-gemini)


;;; bind (kbd "C-c o") to ollama-buddy-menu


(require-package 'gptel-aibo)
(use-package gptel-aibo
  :after (prog-mode flycheck)
  :config
  (define-key prog-mode-map (kbd "C-i") #'gptel-aibo-summon)
  (define-key gptel-aibo-mode-map
              (kbd "C-c g A") #'gptel-aibo-apply-last-suggestions))

;; (use-package gptel-aibo
;;   :after (gptel)
;;   :config
;;   (define-key gptel-aibo-mode-map
;;               (kbd "C-c g A") #'gptel-aibo-apply-last-suggestions))

(require-package 'gptel-fn-complete)
(require 'gptel-fn-complete)

(global-set-key (kbd "C-c RET") 'gptel-send)
(global-set-key (kbd "C-c /") 'gptel-fn-complete)

;; (require-package 'gptel)
;; (require 'gptel)

;; Ollama for Gemini
;; (require-package 'ollama-buddy)
;; (require 'ollama-buddy)
;; (setq ollama-buddy-openai-api-key openai-api-key)
;; (setq ollama-buddy-openai-default-model "gpt-4.1-mini")
;; (setq ollama-buddy-gemini-api-key google-api-key)
;; (setq ollama-buddy-anthropic-api-key anthropic-api-key)

;; (require 'mcp-hub)
;;; init-gptel.el --- Mutl-LLM OpenAI Client & Model Context Procotol -*- lexical-binding: t; -*-
;;; Commentary:
;;;
;;;  - https://github.com/lizqwerscott/mcp.el/blob/master/Readme.org
;;;  - https://modelcontextprotocol.io/introduction
;;; Code:
;;;

;; Installation

;; Install Emacs 30 or higher version
;; Add the following code to your configuration file ~/.emacs:

;; (add-to-list 'load-path (expand-file-name "github.com/lizqwerscott/mcp.el/" user-emacs-directory))

;; (require 'mcp-hub)

;; Usage

;; Mcp hub

;; Configuring MCP Servers

;; (setq mcp-hub-servers
;;       '(("filesystem" . (:command "npx" :args ("-y" "@modelcontextprotocol/server-filesystem" "/home/self/GIT/01-REALTIME-VOICE-TWILIO/")))
;;         ("fetch" . (:command "uvx" :args ("mcp-server-fetch")))
;;         ("qdrant" . (:url "http://localhost:8000/sse"))
;;         ("graphilit" . (
;;                         :command "npx"
;;                         :args ("-y" "graphlit-mcp-server")
;;                         :env (
;;                               :GRAPHLIT_ORGANIZATION_ID "1995784c-8c74-450d-9259-f515bfd42dba"
;;                               :GRAPHLIT_ENVIRONMENT_ID "c804efa8-0929-4216-aa4a-f8d8a87a7e65"
;;                               :GRAPHLIT_JWT_SECRET "glk_live_SmzB7LNaoLVIluDMfG6IAky2ZsluqSWal3gsfuQ9Rf88pxBBNKxkEGOPczKYV0kz")))))

;; You can use mcp-hub-start-all-server to start all MCP servers, such as launching all MCP servers after starting Emacs.

;; (add-hook 'after-init-hook
;;           #'mcp-hub-start-all-server)
;; Managing MCP Servers
;; Use mcp-hub to launch the server management interface, which will automatically start all configured MCP servers.

;; mcp-hub
;; Keymap
;; key	function	description
;; l	mcp-hub-view-log	View server logs
;; s	mcp-hub-start-server	Start server under cursor
;; k	mcp-hub-close-server	Stop server under cursor
;; r	mcp-hub-restart-server	Restart server under cursor
;; S	mcp-hub-start-all-server	Start all configured servers
;; R	mcp-hub-restart-all-server	Restart all configured servers
;; K	mcp-hub-close-all-server	Stop all running servers
;; use with gptel
;; A function for registering all MCP tools.

;; (defun gptel-mcp-register-tool ()
;;   (interactive)
;;   (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
;;     (mapcar #'(lambda (tool)
;;                 (apply #'gptel-make-tool
;;                        tool))
;;             tools)))
;; Activate all MCP tools using gptel.

;; (defun gptel-mcp-use-tool ()
;;   (interactive)
;;   (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
;;     (mapcar #'(lambda (tool)
;;                 (let ((path (list (plist-get tool :category)
;;                                   (plist-get tool :name))))
;;                   (push (gptel-get-tool path)
;;                         gptel-tools)))
;;             tools)))
;; ;; Request gptel to cease using all mcp tools.

;; (defun gptel-mcp-close-use-tool ()
;;   (interactive)
;;   (let ((tools (mcp-hub-get-all-tool :asyncp t :categoryp t)))
;;     (mapcar #'(lambda (tool)
;;                 (let ((path (list (plist-get tool :category)
;;                                   (plist-get tool :name))))
;;                   (setq gptel-tools
;;                         (cl-remove-if #'(lambda (tool)
;;                                           (equal path
;;                                                  (list (gptel-tool-category tool)
;;                                                        (gptel-tool-name tool))))
;;                                       gptel-tools))))
;;             tools)))
;; ;; Example filesystem server.
;; ;; Establish the connection first.
;; (mcp-connect-server "filesystem" :command "npx" :args '("-y" "@modelcontextprotocol/server-filesystem" "~/Downloads/")
;;                     :initial-callback
;;                     #'(lambda (connection)
;;                         (message "%s connection" (jsonrpc-name connection)))
;;                     :tools-callback
;;                     #'(lambda (connection tools)
;;                         (message "%s tools: %s" (jsonrpc-name connection) tools))
;;                     :prompts-callback
;;                     #'(lambda (connection prompts)
;;                         (message "%s prompts: %s" (jsonrpc-name connection) prompts))
;;                     :resources-callback
;;                     #'(lambda (connection resources)
;;                         (message "%s resources: %s" (jsonrpc-name connection) resources)))
;; Define the use of tools.
;; The current text is being tested using the gptel tool branch.Use mcp-make-text-tool to create standard tool call data (Discussions).It is recommended to create tools within the tools-callback or wait for the mcp connect server to complete.

;; (mcp-make-text-tool "filesystem" "write_file")
;; This will generate a data structure where the function is an auto-generated synchronous or asynchronous lambda function for accessing the MCP server.

;; (list :function #'(lambda (&rest args)
;;                     ;; Synchronous or asynchronous access to the MCP server's Lambda function.
;;                     )
;;       :name "write_file"
;;       :async nil
;;       :description "Create a new file or completely overwrite an existing file with new content. Use with caution as it will overwrite existing files without warning. Handles text content with proper encoding. Only works within allowed directories."
;;       :args ((:type "string" :name "path" :description "path")
;;              (:type "string" :name "content" :description "content"))
;;       :category "files")
;; Disconnect from the server.
;; (mcp-stop-server "filesystem")
;; Manual function call
;; Synchronize
;; (let ((connection (gethash "filesystem" mcp-server-connections)))
;;   (mcp-call-tool connection "write_file" '(:path "filename or file path" :content "the file content")))
;; Asynchronous
;; (let ((connection (gethash "filesystem" mcp-server-connections)))
;;   (mcp-async-call-tool connection
;;                        "write_file"
;;                        '(:path "filename or file path" :content "the file content")
;;                        #'(lambda (res)
;;                            ;; handle res
;;                            (mcp--parse-tool-call-result res))
;;                        #'(lambda (code message)
;;                            ;; handle error
;;                            (format "call %s tool error with %s: %s"
;;                                    tool-name
;;                                    code
;;                                    message))))
;; Manual get prompt
;; Since the filesystem lacks prompts, the everything server is used for demonstration.

;; Synchronize
;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-get-prompt connection "complex_prompt" '(:temperature "1.0")))
;; Asynchronous
;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-async-get-prompt connection
;;                         "complex_prompt"
;;                         '(:temperature "1.0")
;;                         #'(lambda (res)
;;                             (message "prompt: %s" res))
;;                         #'(lambda (code message)
;;                             (message "error call: %s, %s" code message))))
;; Manual get resources
;; Since the filesystem lacks resources, the everything server is used for demonstration.

;; Synchronize
;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-read-resource connection "test://static/resource/1"))
;; Asynchronous
;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-async-read-resource connection "test://static/resource/1"
;;                            #'(lambda (resource)
;;                                (message "res: %s" resource))))
;; Get resource templates
;; Since the filesystem lacks resources, the everything server is used for demonstration.

;; (let ((connection (gethash "everything" mcp-server-connections)))
;;   (mcp-async-list-resource-templates connection
;;                                      #'(lambda (connection templates)
;;                                          (message "%s" templates))))


;; After receiving tool results, carefully reflect on their quality and determine optimal next steps before proceeding.
;;
;; Use your thinking to plan and iterate based on this new information, and then take the best next action.
;;


(provide 'init-gptel)
;;; init-gptel.el ends here.
