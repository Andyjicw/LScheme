#lang racket
#|教程地址->http://deathking.github.io/yast-cn/contents/chapter4.html|#

;;; 定义函数
(define vhello "Hello world")

(define fhello
  (lambda ()
    "Hello world"))

; hello with name
(define hello
  (lambda (name)
    (string-append "Hello " name "!")))

; sum of three numbers
(define sum3
  (lambda (a b c)
    (+ a b c)))

; 练习1
; 按照下面的要求编写函数。这些都非常简单但实用。
; 将参数加1的函数。
; 将参数减1的函数。

(define sum1
  (lambda (a)
    (+ a 1)))

(define min1
  (lambda (a)
    (- a 1)))

; 练习2
; 让我们按照下面的步骤编写一个用于计算飞行距离的函数。
; 编写一个将角的单位由度转换为弧度的函数。180度即π弧度。π可以通过下面的式子定义: (define pi (* 4 (atan 1.0)))。
; 编写一个用于计算按照一个常量速度（水平分速度）运动的物体，t秒内的位移的函数。
; 编写一个用于计算物体落地前的飞行时间的函数，参数是垂直分速度。忽略空气阻力并取重力加速度g为9.8m/s^2。提示：设落地时瞬时竖直分速度为-Vy，有如下关系。2 * Vy = g * t此处t为落地时的时间。
; 使用问题1-3中定义的函数编写一个用于计算一个以初速度v和角度theta掷出的小球的飞行距离。
; 计算一个初速度为40m/s、与水平方向呈30°的小球飞行距离。这个差不多就是一个臂力强劲的职业棒球手的投掷距离。
; 提示：首先，将角度的单位转换为弧度（假定转换后的角度为theta1）。初始水平、竖直分速度分别表示为：v*cos(theta1)和v*sin(theta1)。落地时间可以通过问题3中定义的函数计算。由于水平分速度不会改变， 因此可以利用问题2中的函数计算距离。

; definition of pi
(define pi (* 4 (atan 1.0)))

; degree -> radian
(define (radian deg)
  (* deg (/ pi 180.0)))

; free fall time
(define (ff-time vy)
  (/ (* 2.0 vy) 9.8))

; horizontal distance 
(define (dx vx t)
  (* vx t))

; distance
(define (distance v ang)
  (dx
   (* v (cos (radian ang)))                     ; vx
   (ff-time (* v (sin (radian ang))))))         ; t

#|
欢迎指出问题
=========================
联系我  : 479003573@qq.com
github : Andyjicw
=========================
|#