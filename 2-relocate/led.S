
.equ GPJ2CON, 0xE0200280
.equ GPJ2DAT, 0xE0200284

.equ _start_ram, 0xd2080000

.globl _start
_start:
	ldr r1, = led_start
	ldr r2, = _start_ram
	ldr r3, = led_end

1:	ldr r0, [r1]
	str r0, [r2]
	add r1, #4
	add r2, #4
	cmp r1, r3
	bne 1b

@ run in ram
	ldr pc, =_start_ram
	


led_start:
/* set GPJ2[0,1,2,3] as output */
        ldr r1, =GPJ2CON
        ldr r0, =0x00001111
        str r0, [r1]

        ldr r1, =GPJ2DAT
        ldr r0, =0xFFFFFFFA
        str r0, [r1]

        b   .
led_end:

