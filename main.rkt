#lang racket/base

(provide open-app)

(require racket/contract
         racket/match
         racket/system)


(define target? (or/c path? string-no-nuls? bytes-no-nuls?))

(define/contract (open-app target)
  (-> target? boolean?)
  (match (system-type)
    ['unix    (open-program/unix    target)]
    ['macosx  (open-program/macosx  target)]
    ['windows (open-program/windows target)]))

(module+ test
  (require rackunit)
  (check-true (open-app "http://racket-lang.org") "Could not open url")
  (check-true (open-app ".")) "Could not open directory")

(define/contract (open-program/unix target)
  (-> target? boolean?)
  (system* (find-executable-path "xdg-open")
           target))

(define/contract (open-program/macosx target)
  (-> target? boolean?)
  (system* (find-executable-path "open")
           target))

(define/contract (open-program/windows target)
  (-> target? boolean?)
  (with-handlers ([exn:fail? (lambda (e) #f)])
    (shell-execute #f (target->string target) ""
                   (current-directory) 'sw_shownormal)
    #t))

(define/contract (target->string target)
  (-> target? string?)
  (match target
    [(? string? s)    s]
    [(? path? p)      (path->string p)]
    [(? bytes? b)     (bytes->string/utf-8 b)]))
