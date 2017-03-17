retardo_50ms:
    movlw .50   ;   1
    movwf cont1 ;   1
ciclo2:
    movlw .10   ;   1
    movwf cont2 ;   1
ciclo1:
    movlw .65   ;   1
    movwf cont3 ;   1
    decfsz cont3;   1(2)
    goto $-1    ;   2
    decfsz cont2;   1(2)
    goto ciclo1 ;   2
    decfsz cont1;   1(2)
    goto ciclo2 ;   2
    return

retardo_1seg:
    movlw   .20
    movwf   cont_seg
    call    retardo_50ms
    decfsz  cont_seg
    goto    $-2
    return

retardo_500ms:
    movlw   .10
    movwf   cont_seg
    call    retardo_50ms
    decfsz  cont_seg
    goto    $-2
    return

