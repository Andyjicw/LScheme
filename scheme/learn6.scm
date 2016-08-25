#lang racket
#|教程地址->http://deathking.github.io/yast-cn/contents/chapter7.html|#
;;; 重复

;; 递归
(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1))
         )
      )
  )

(define (list*2 ls)
  (if (null? ls)
      '()
      (cons (* 2 (car ls))
             (list*2 (cdr ls)))
      )
  )

; 练习1
; 用递归编写下面的函数。
; 用于统计表中元素个数的my-length函数。(length是一个预定义函数)。
; 一个求和表中元素的函数。
; 一个分别接受一个表ls和一个对象x的函数，该函数返回从ls中删除x后得到的表。
; 一个分别接受一个表ls和一个对象x的函数，该函数返回x在ls中首次出现的位置。索引从0开始。如果x不在ls中，函数返回#f。
; 1
(define (my-length ls)
  (if (null? ls)
      0
      (+ 1 (my-length (cdr ls))
         )
      )
  )
; 2
(define (sum-ls ls)
  (if (null? ls)
      0
      (+ (car ls) (sum-ls (cdr ls)))
      )
  )
; 3
(define (del-ls ls x)
  (if (equal? (car ls) x)
      '()
      (cons (car ls)
             (del-ls (cdr ls) x))
      )
  )
(define (remove x ls)
  (if (null? ls)
      '()
      (let ((h (car ls)))
        ((if (eqv? x h)
            (lambda (y) y)
            (lambda (y) (cons h y)))
         (remove x (cdr ls)))
        )
      )
  )

; 4

#|
欢迎指出问题
=========================
联系我  : 479003573@qq.com
github : Andyjicw
=========================
|#