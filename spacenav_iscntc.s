ISCNTC:
        jsr MONRDKEY
        bcc not_cntc	; carry bit clear means no input data
        cmp #3
        bne not_cntc
        jmp is_cntc

not_cntc:
        rts

is_cntc:
        ; Fall through
