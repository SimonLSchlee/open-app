open-app
====

This library defines a simple function open-app, which will invoke the default
application for an url or file. 

# Usage #

``` racket
#lang racket

(require open-app)

(module+ main
  (open-app "https://racket-lang.org"))
```

# Notice #

The implementation is platform dependent because it uses different system
commands depending on the platform.

Currently supported platforms:
  * Windows (uses rackets shell-execute)
  * Unix/Linux (uses xdg-open command)
  * Mac (uses open command, work in progress, needs testing)

