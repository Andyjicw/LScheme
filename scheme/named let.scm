#lang racket
#|教程地址->http://deathking.github.io/yast-cn/contents/chapter7.html|#

;;; 命名let
(define (fact-let n)
  (let loop((n1 n) (p n))       ; 1
    (if (= n1 1)                    
    p
    (let ((m (- n1 1)))
      (loop m (* p m))))))      ; 2

;; 用命名let编写下面的函数。
; 一个分别接受一个表ls和一个对象x的函数,该函数返回从ls中删除x后得到的表。
; 一个分别接受一个表ls和一个对象x的函数，该函数返回x在ls中首次出现的位置。索引从0开始。如果x不在ls中，函数返回#f。
; 用于翻转表元素顺序的my-reverse函数。(reverse函数是预定义函数)
; 求和由数构成的表。
; 将一个代表正整数的字符串转化为对应整数。
  ; 例如，"1232"会被转化为1232。
  ; 不需要检查不合法的输入
  ; 提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，可以使用函数char->integer来获得字符的ASCII码
  ; 函数string->list可以将字符串转化为由字符构成的表。
; range函数：返回一个从0到n的表（但不包含n）

;1
(define (del-x ls x)
  (let loop((n1 ls) (p '()))
    (if (null? n1)
        p
        (loop (cdr n1)
              (if (eqv? x (car n1))
                  p
                  (cons (car n1) p))
              )
        )
    )
  )

; 1
(define (remove x ls)
  (let loop((ls0 ls) (ls1 '()))
    (if (null? ls0) 
    (reverse ls1)
    (loop
     (cdr ls0)
          (if (eqv? x (car ls0))
              ls1
            (cons (car ls0) ls1))))))

; 2
(define (position x ls)
  (let loop((ls0 ls) (i 0))
    (cond
     ((null? ls0) #f)
     ((eqv? x (car ls0)) i)
     (else (loop (cdr ls0) (+ 1 i))))))

; 3
(define (my-reverse-let ls)
  (let loop((ls0 ls) (ls1 '()))
    (if (null? ls0)
    ls1
    (loop (cdr ls0) (cons (car ls0) ls1)))))

; 4
(define (my-sum-let ls)
  (let loop((ls0 ls) (n 0))
    (if (null? ls0)
    n
    (loop (cdr ls0) (+ (car ls0) n)))))

; 5
(define (my-string->integer-let str)
  (let loop((ls0 (string->list str)) (n 0))
    (if (null? ls0)
    n
    (loop (cdr ls0)
          (+ (- (char->integer (car ls0)) 48)
         (* n 10))))))

; 6
(define (range n)
  (let loop((i 0) (ls1 '()))
    (if (= i n)
        (reverse ls1)
      (loop (+ 1 i) (cons i ls1)))))

;; letrec
(define (fact-letrec n)
  (letrec ((iter (lambda (n1 p)
           (if (= n1 1)
               p
               (let ((m (- n1 1)))
             (iter m (* p m)))))))     ; *
    (iter n n)))

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
