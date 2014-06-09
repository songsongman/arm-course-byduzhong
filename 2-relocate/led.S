
.equ GPJ2CON, 0xE0200280
.equ GPJ2DAT, 0xE0200284


.globl _start
_start:
	ldr pc, _led_start
@	[r1] -> r0 -> [r2]
	ldr r1, _led_start
	ldr r2, _start_ram
	ldr r3, _led_end

1:	ldr r0, [r1]
	str r0, [r2]
	add r1, #4
	add r2, #4
	cmp r1, r3
  	bne 1b

@ run in ram
 	ldr pc, _start_ram
	b   .

_start_ram:
.word	0xd0030000
_led_start:
.word	led_start
_led_end:
.word	led_end
 
	

led_start:
@ .equ GPJ2CON, 0xE0200280
@ .equ GPJ2DAT, 0xE0200284
/* set GPJ2[0,1,2,3] as output */
@       ldr r1, =GPJ2CON
	mov r1, #0xE0000000
	orr r1, #0x00200000
	orr r1, #0x00000280

@       ldr r0, =0x00001111
	mov r0, #0x00000011
	orr r0, #0x00001100
        str r0, [r1]

@       ldr r1, =GPJ2DAT
	add r1, #4
        mov r0, #0xFFFFFFF0
        str r0, [r1]

        b   .
led_end:

