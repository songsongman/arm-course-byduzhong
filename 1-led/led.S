.equ GPJ2CON, 0xE0200280
.equ GPJ2DAT, 0xE0200284

.globl _start
_start:
/* set GPJ2[0,1,2,3] as output */
        ldr r1, =GPJ2CON
        ldr r0, =0x00001111
        str r0, [r1]

        ldr r1, =GPJ2DAT
        ldr r0, =0xFFFFFFFA
        str r0, [r1]

        b   .

