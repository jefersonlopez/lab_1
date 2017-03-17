conversion:
    clrf    PORTB
    clrf    PORTC
    clrf    cent
    clrf    uni_dec

bin_bcd:
    movlw   .100
    subwf   bin,W
    btfsc   STATUS,C
    incf    cent,F
    btfsc   STATUS,C
    movwf   bin
    btfsc   STATUS,C
        goto    bin_bcd
retorno:
    movlw   .10
    subwf   bin,W
    btfsc   STATUS,C
        goto dec_10
    movf    bin,1
    ret_unid:
    btfss   STATUS,Z
        goto    dec_1

    movf    uni_dec,W
    movwf   PORTB
    movf    cent,W
    movwf   PORTC
return

dec_10:
    movwf   bin
    movlw   0x10 ; 00010000
    addwf   uni_dec,F
goto retorno

dec_1:

    incf    uni_dec,1
    decf    bin,F
goto ret_unid