; ====================================================================================================
; Z80 Setup Code
; ====================================================================================================
    xor a   ; Clear a
    ld  bc,1fd9h    ; Prepare to loop
    ld  de,0027h    ; Initial destination address
    ld  hl,0026h    ; Initial source address
    ld  sp,hl   ; Set stack start address
    ld  (hl),a  ; Set first byte of stack to 0
    ldir    ; Loop to fill stack with 0
    pop ix  ; Clear ix
    pop iy  ; Clear iy
    ld  i,a ; Clear i
    ld  r,a ; Clear a
    pop de  ; Clear de
    pop hl  ; Clear hl
    pop af  ; Clear af
    ex  af,af'  ; Swap af with af'
    exx ; Swap bc, de, and hl
    pop bc  ; Clear bc
    pop de  ; Clear de
    pop hl  ; Clear hl
    pop af  ; Clear af
    ld  sp,hl   ; Clear sp
    di  ; Clear iff1
    im  1   ; Set interrupt mode to 1
    ld  (hl),e9h    ; replace first instruction with loop
    jp  (hl)    ; Go to first instruction

; ====================================================================================================