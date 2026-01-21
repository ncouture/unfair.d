: ;;; Uses AI queries to build dwim shell command
(defun my/dwim-shell-command-convert-to-gif ()
  "Convert all marked videos to optimized gif(s)."
  (interactive)
  (dwim-shell-command-on-marked-files
   "Convert to gif"
   "ffmpeg -loglevel quiet -stats -y -i '<<f>>' -pix_fmt rgb24 -r 15 '<<fne>>.gif'"
   :utils "ffmpeg")
  )

(provide 'init-dwim-ai)
;;; init-dwim-ai.el ends here.
