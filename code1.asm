;********************************************************** 
; This program to receive a character from the PC and return (send) next character to PC again. 
;********************************************************** 
;this code written by areen alkharabsheh ,roa'a dofash and ranen raied
;this code calculate the equation 
;(num4*num3)+num1-num2 
;This code takes 3 inputs, and the fourth input is the result of adding 1 to the first input.
include "p16f84A.inc" 
;********************************************************** 
; User-defined variables
cblock 0x20
num1;input number
num2;input number
num3;input number
num4;number1+1
testnum
endc
cblock 0x30
result1; multibly
result2;adding
result3;subtracut
result4;res3 or res2
result5;res5 or res4
result6; res4 xor res5
endc
;********************************************************** 
; Start of executable code 
 org 0x00 ; Reset vector 
 nop 
 goto Main 
;********************************************************** 
;********************************************************** 
; Main program 
Main
incf num1,w;num1+1 and assign value in working
movwf num4;copy the value  from working register to num4
Multibly
movlw 0; move the constant 0 to the working register 
movwf result1; copy the value 0 from working register to result1
Again 
movf num4,w ;move value of num4 to working
Addwf result1,f ; add working value to result1
Decfsz num3, f ;if num3=0 goto adding else goto again
Goto Again 
Goto Adding
Adding
movf result1,w;move value of result1 to working
addwf num1,w; result1+num1 and assign value in working
movwf result2; copy the value  from working register to result2
Subtract
movf result2,w ;move value of result2 to working
subwf num2 ,w ;num2-result2 and assign in working
xorlw 11
andlw 11 
movwf result3;copy the value  from working register to result3
Oring
iorwf result2,w
movwf result4;copy the value  from working register to result4
movf result1,w;;move value of result1 to working
iorwf result4,w
movwf result5;;copy the value  from working register to result5
Xoring
movf result4,w;move value of result4 to working
xorwf result5,w
movwf result6;copy the value  from working register to result6
Test;
movf testnum, w;;move value of testnum to working 
 sublw D'10' ;10d - testNum 
 btfss STATUS, C 
 goto Greater ;C = 0, that's B = 1, then testNum > 10 
 goto Smaller ;C = 1, that's B = 0, then testNum < 10
Greater
addlw d'3';3+working and assign in working
goto Finsh
Smaller
iorlw d'10' 
goto Finsh
Finsh
nop
nop
end
