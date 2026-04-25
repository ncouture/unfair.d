;;; init-local.el --- customization overloading packages found in the main /lisp directory.  -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; Add your personal contiguration tweaks in module files in format:
;;;  user-lisp/init-<01-99>-<name>.el
;;; the order of loading user-lisp/init-<n>-<name>.el libraries is by lowest number first
;;; example:
;;;     ~/.emacs.d/user-lisp $ ls -1
;;;     init-00-foobar.el
;;;     init-01-gptel.el
;;;     init-02-foobar.el
;;;     init-20-foobar.el
;;;     init-30-foobar.el
;;;     init-31-foobar.el

(let ((user-lisp-dir (expand-file-name "user-lisp" user-emacs-directory)))
  (add-to-list 'load-path user-lisp-dir)
  (when (file-directory-p user-lisp-dir)
    (dolist (file (directory-files user-lisp-dir nil "^init-.*\\.el$"))
      (message "Loading user init file %s..." file)
      (let ((file-name (intern (file-name-sans-extension file)))))
      (condition-case err
          (require (intern (file-name-sans-extension file)))
        (error
         (message "Error loading user init file %s: %S"
                  file err))))))

;;; Do not fill this file with configuration like these:
(put 'dired-find-alternate-file 'disabled nil)
;;; Follow the pattern so that you can pull updates to github.com/purcell/emacs.d

(set-face-attribute
 'default
 nil
 :family "PragmataPro Mono Liga"
 :height 140
 :weight 'regular)


(provide 'init-local)
;;; init-local.el ends here.
