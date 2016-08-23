#lang racket
#|教程地址->http://deathking.github.io/yast-cn/contents/chapter3.html|#

;;; 单元和表
(cons 1 2)
(cons 3 (cons 1 2))
(cons #\a (cons 3 "hello"))
(cons (cons 0 1) (cons 1 2))

; 练习1
; 使用cons来构建在前端表现为如下形式的数据结构

; ("hi" . "everybody")
; (0)
; (1 10 . 100)
; (1 10 100)
; (#\I "saw" 3 "girls")
; ("Sum of" (1 2 3 4) "is" 10)

(cons "hi" "everybody")
(cons 0 '())
(cons 1 (cons 10 100) )
(cons 1 (cons 10 (cons 100 '())))
(cons #\I (cons "saw" (cons 3 (cons "girls" '()))))
(cons "Sum of" (cons (cons 1 (cons 2 (cons 3 (cons 4 '())))) (cons "is" (cons 10 '()))))

;; 引用
(quote (+ 3 5))
'(+ 3 5)
'()

;; car函数和cdr函数
(car '(1 3 4))
(cdr '(1 3 4))

; 练习2
; 求值下列S-表达式。
; (car '(0))
; (cdr '(0))
; (car '((1 2 3) (4 5 6)))
; (cdr '(1 2 3 . 4))
; (cdr (cons 3 (cons 2 (cons 1 '()))))

(car '(0));0
(cdr '(0));()
(car '((1 2 3) (4 5 6)));(1 2 3)
(cdr '(1 2 3 . 4));(2 3 . 4)
(cdr (cons 3 (cons 2 (cons 1 '()))));(2 1)

;; list函数
(list)
(list 1)
(list '(1 2) '(3 4))
(list 0)
(list 1 2)

#|
欢迎指出问题
=========================
联系我  : 479003573@qq.com
github : Andyjicw
=========================
|#