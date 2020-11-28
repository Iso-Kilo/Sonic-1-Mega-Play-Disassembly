; ====================================================================================================
; |                         SONIC THE HEDGEHOG (MEGA PLAY) DISASSEMBLY                               |
; ====================================================================================================
;
; Created by Iso Kilo
; For use with ASM68K
;
; ====================================================================================================

Build_MD:   equ 0   ; Set to 1 to build a Mega Drive friendly ROM

    include "Equates.asm"

; ====================================================================================================

ROM_Start:

; ====================================================================================================
; Motorola 68000 Exception Vectors Table
; ====================================================================================================

    include "_System/Vectors.asm"

; ====================================================================================================
; SEGA Mega Play (Mega Drive) ROM Header
; ====================================================================================================

    include "_System/Header.asm"

; ====================================================================================================

ExceptionLoop:
    bra.s   ExceptionLoop   ; Loop

; ----------------------------------------------------------------------------------------------------

ProgramStart:

GameLoop:
    move.b  #ID_SEGA,(ScreenID).w   ; Set screen mode to SEGA screen
    move.b  (ScreenID).w,d0 ; Move screen ID into d0
    andi.b  #$3C,d0
    jsr ScreenArray(pc,d0.w)    ; Go to the corresponding routine
    bra.s   GameLoop    ; Loop

ScreenArray:
    bra.w   Screen_SEGA ; SEGA screen
    bra.w   Screen_Title    ; Title screen
    bra.w   Screen_Level    ; Demo
    bra.w   Screen_Level    ; Level
    bra.w   JMPto_Special   ; Special stage
    bra.w   Screen_Continue ; Continue screen
    bra.w   Screen_Ending   ; Ending sequence
    bra.w   Screen_Credits  ; Credits
    bra.w   Screen_Unknown1 ; Unknown Mega Play screen mode
    bra.w   JMPto_Unknown2  ; Unknown Mega Play screen mode

;   JMPs to solve out of range errors
JMPto_Special:
    jmp Screen_Special

JMPto_Unknown2:
    jmp Screen_Unknown2
    rts ; Return

ROM_End:
    END

; ====================================================================================================