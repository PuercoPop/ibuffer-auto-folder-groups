;; -*- lexical-binding: t -*-
(require 'cl)
(require 'ert)
(require 'ibuffer-afg)


;; (defmacro def-fixture)
(defun my-fixture (body)
  (lexical-let ((ibuffer-afg-sample-group)
                (("default"
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
    (funcall body)))

(defmacro should-equal (a b)
  "Simple shortcut for `(should (equal a b))'."
  `(should
    (equal ,a ,b)))

(ert-deftest ibuffer-afg/folder-in-ibufer-save-group ()
  (my-fixture
   (lambda ()
     (should-equal t
                   (ibuffer-afg-folder-in-ibuffer-save-group "~/Projects/tanomoshi/" ibuffer-afg-sample-group))
     (should-equal nil
                   (ibuffer-afg-folder-in-ibuffer-save-group "~/Projects/tanomo/" ibuffer-afg-sample-group)))))
