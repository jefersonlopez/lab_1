LIST p = 16f887

    #include "p16f887.inc"

    cblock  0x20
; declaracion de variables
    cont1           ;variable usada para retardos
    cont2           ;variable usada para retardos
    cont3           ;variable usada para retardos
    retardo         ;variable usada para retardos
    bin             ;variable usada para hacer conversion
    uni_dec         ;guarda los valores provicionales de la conversion
    cent            ;guarda los valores provicionales de la conversion
    suma            ;guarda el conteo
    cont_seg        ;variable usada para retardos
    pos_tabla       ;posicion de inicio de la tabla
    ciclos_secuencia ;nuemro de ciclos por secuencia
    num_secuencias  ;numero de secuencias
    valor_carga     ;valor que se cargo
    repeticiones    ;numero de veces que se repite la secuencia


    endc

    org .0
    call osc_conf   ;configura el oscilador
    call port_conf  ;configura los puertos
inicio:
    clrf    bin
    clrf    suma
reinicio:
    incf    suma,F
    btfsc   STATUS,Z
    call    secuencia
    movf    suma,W
    movwf   bin
    call    verificar
    call    conversion    
    call    retardo_500ms
    call    verificar
    call    retardo_500ms
    goto    reinicio

verificar:
    btfss   PORTE,0
    call    cargar
    btfss   PORTE,1
    goto    reiniciar
    btfss   PORTE,2
    call    reiniciar_con_carga
    return
cargar:
    movf    PORTA,W
    movwf   suma
    movwf   valor_carga
    return
reiniciar:
    clrf    PORTB
    clrf    PORTC
    clrf    uni_dec
    clrf    cent
    clrf    suma
    return
reiniciar_con_carga:
    clrf    PORTB
    clrf    PORTC
    clrf    uni_dec
    clrf    cent
    movf    valor_carga,W
    movwf   suma
    return





#include "configuracion.inc"
#include "retardos.inc"
#include "bin_bcd.inc"
#include "secuencia.inc"
    end


