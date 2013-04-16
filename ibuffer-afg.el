;;; ibuffer-afg.el --- Programatically add folders to ibuffer -*- lexical-binding: t -*-
(require 'cl)
(require 'ibuffer)

(setq ibuffer-afg-ignore-directories '("." ".." ".DS_Store"))

(defun ibuffer-afg-folder-in-ibuffer-save-group (group groups)
  (let ((match nil))
    (dolist (group (cdr (car groups))
      (when (equal folder (car group))
        (setq match t)))
    match)))

;; (dolist (dir (directory-files "~/Projects/"))
;;   (if (not (member dir ibuffer-afg-ignore-directories))
;;       (setf (car ibuffer-saved-filter-groups)
;;             (append (car ibuffer-saved-filter-groups)
;;                     `((,dir
;;                        (filename . ,(expand-file-name dir "~/Projects/"))))))
;;     (message "Excluded Dir")))


(provide 'ibuffer-afg)
;;; ibuffer-afg.el ends here
