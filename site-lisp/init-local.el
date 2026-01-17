;;;  -*- lexical-binding: t -*-
;;; init-local.el --- customization overloading packages found in the main /lisp directory.
;;; Commentary:
;;; loads user-specific packages located in /user-lisp/
;;; Code:

(let ((user-lisp-dir (expand-file-name "user-lisp" user-emacs-directory)))
  (add-to-list 'load-path user-lisp-dir)
  (when (file-directory-p user-lisp-dir)
    (dolist (file (directory-files user-lisp-dir nil "^init-.*\\.el$"))
      (condition-case err
          (require (intern (file-name-sans-extension file)))
        (error
         (message "Error loading user init file %s: %S"
                  file err))))))

;; Add your personal tweaks here



(provide 'init-local)
;;; init-local ends here.
