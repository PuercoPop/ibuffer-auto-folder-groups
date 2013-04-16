;; -*- lexical-binding: t -*-
(require 'cl)
(require 'ert)
(require 'ibuffer-afg)


(defmacro def-fixture (name bindings)
  "Return a function that takes the form to execute but is wrapped between a let of the bindings"
  `(defun ,(intern (symbol-name name)) (body)
     (let (,bindings)
       (unwind-protect
           (progn
             body)))))

(def-fixture test-fixture '(= zxvf 1))

(defmacro should-equal (a b)
  "Simple shortcut for `(should (equal a b))'."
  `(should
    (equal ,a ,b)))



(ert-deftest testo ()
  (test-fixture
                '(should-equal zxvf 1)))


;; (defun my-fixture (body)
;;   (unwind-protect
;;       (progn
;;         (let ((ibuffer-afg-sample-group
;;                (("default"
;;                  ("Org"
;;                   (mode . org-mode))
;;                  ("Mail"
;;                   (or
;;                    (mode . message-mode)
;;                    (mode . mail-mode)))
;;                  ("Twitter"
;;                   (mode . twittering-mode))
;;                  ("ERC"
;;                   (mode . erc-mode))
;;                  ("python.pe"
;;                   (filename . "/Users/PuercoPop/Projects/python.pe"))
;;                  ("werkzeug"
;;                   (filename . "/Users/PuercoPop/Projects/werkzeug"))))))
;;           (funcall body)))))

;; (ert-deftest ibuffer-afg/folder-in-ibufer-save-group ()
;;   (my-fixture
;;    (lambda ()
;;      (should-equal t
;;                    (ibuffer-afg-folder-in-ibuffer-save-group "~/Projects/werkzeug/" ibuffer-afg-sample-group))
;;      (should-equal nil
;;                    (ibuffer-afg-folder-in-ibuffer-save-group "~/Projects/tanomo/" ibuffer-afg-sample-group))
;;      )))
