#lang info
(define collection "open-app")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/open-app.scrbl" ())))
(define pkg-desc "Open-app is a utility for opening a file or url with the default application.")
(define version "0.1")
(define pkg-authors '("schlee.simon@gmail.com"))
