#lang scribble/manual
@require[@for-label[open-app
                    racket/system
                    racket/base]]

@title{open-app: Open app for a file or url}
@author{(author+email @"Simon Lukas Schlee" @"schlee.simon@gmail.com")}

@defmodule[open-app]

Open-app is a small utility which allows you to open the default application for
a given file or url.

@defproc[(open-app [target (or/c path? string-no-nuls? bytes-no-nuls?)])
         boolean?]{
  Opens the default application for the given @racket[target]. 
  If the application was opened, the return value is @racket[#t], @racket[#f] otherwise.
}
