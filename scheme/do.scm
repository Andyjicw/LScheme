#lang racket
#|教程地址->http://deathking.github.io/yast-cn/contents/chapter7.html|#

;; do表达式
#|
(do binds (predicate value)
    body)
|#
(define (fact-do n)
  (do ((n1 n (- n1 1)) (p n (* p (- n1 1))))
    ((= n1 1) p))
  )




#|
欢迎指出问题
=========================
联系我  : 479003573@qq.com
github : Andyjicw
=========================
|#