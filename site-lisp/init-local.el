;;;  -*- lexical-binding: t -*-
;;; init-local.el --- customization overloading packages found in the main /lisp directory.
;;; Commentary:
;;; loads user-specific packages located in /user-lisp/
;;; Code:

(add-to-list 'load-path (expand-file-name "user-lisp" user-emacs-directory))


(provide 'init-local)
;;; init-local ends here.
