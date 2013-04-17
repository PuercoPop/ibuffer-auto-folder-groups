;;; ibuffer-afg.el --- Programatically add folders to ibuffer -*- lexical-binding: t -*-
(require 'cl)
(require 'ibuffer)
(require 's)

(setq ibuffer-afg-ignore-directories '("." ".." ".DS_Store"))

(defun ibuffer-afg/build-filter-from-folder (path)
  (let ((dir (nth 2 (s-split "/" path))))
    `(,dir
      (filename . ,(expand-file-name dir "~/Projects/")))))

(defun ibuffer-afg-folder-in-ibuffer-save-group (target-group groups)
  (let ((match nil))
    (dolist (group (cdr (car groups)))
      (when (equal (ibuffer-afg/build-filter-from-folder target-group) group)
        (setf match t)))
    match))


;; (dolist (dir (directory-files "~/Projects/"))
;;   (if (not (member dir ibuffer-afg-ignore-directories))
;;       (setf (car ibuffer-saved-filter-groups)
;;             (append (car ibuffer-saved-filter-groups)
;;                     `((,dir
;;                        (filename . ,(expand-file-name dir "~/Projects/"))))))
;;     (message "Excluded Dir")))


(provide 'ibuffer-afg)
;;; ibuffer-afg.el ends here
