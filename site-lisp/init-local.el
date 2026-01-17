;;;  -*- lexical-binding: t -*-
;;; init-local.el --- customization overloading packages found in the main /lisp directory.
;;; Commentary:
;;; loads user-specific packages located in /user-lisp/
;;; Code:

(add-to-list 'load-path (expand-file-name "user-lisp" user-emacs-directory))

(let ((user-lisp-dir (expand-file-name "user-lisp" user-emacs-directory)))
  (when (file-directory-p user-lisp-dir)
    (dolist (file (directory-files user-lisp-dir nil "^init-.*\\.el$"))
      (require (intern (file-name-sans-extension file))))))



(provide 'init-local)
;;; init-local ends here.
