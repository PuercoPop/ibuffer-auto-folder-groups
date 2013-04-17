;; -*- lexical-binding: t -*-
(require 'cl)
(require 'ert)
(require 'ibuffer-afg)



(defmacro should-equal (a b)
  "Simple shortcut for `(should (equal a b))'."
  `(should
    (equal ,a ,b)))



(defun ibuffer-afg-sample-group ()
  '(("default"
     ("Org"
      (mode . org-mode))
     ("Mail"
      (or
       (mode . message-mode)
                   (mode . mail-mode)))
     ("Twitter"
      (mode . twittering-mode))
     ("ERC"
      (mode . erc-mode))
     ("python.pe"
                  (filename . "/Users/PuercoPop/Projects/python.pe"))
     ("werkzeug"
      (filename . "/Users/PuercoPop/Projects/werkzeug")))))


(ert-deftest ibuffer-afg/folder-in-ibufer-save-group ()
  (let ((sg (ibuffer-afg-sample-group)))
    (should-equal t
                  (ibuffer-afg-folder-in-ibuffer-save-group "~/Projects/werkzeug/" sg))
    (should-equal nil
                  (ibuffer-afg-folder-in-ibuffer-save-group "~/Projects/tanomo/" sg))))
