#lang racket
#|教程地址:http://deathking.github.io/yast-cn/contents/chapter7.html|#
;;; 重复

;; 递归
(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

#|
欢迎指出问题
=========================
联系我  : 479003573@qq.com
github : Andyjicw
=========================
|#