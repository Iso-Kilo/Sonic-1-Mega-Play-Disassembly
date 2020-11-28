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
	tst.l	(Controller1_Control).l ; Check controller port 1 control
	bne.s	Control1_Pass   ; If present, pass
	tst.w	(ExpansionPort_Control).l   ; Check expansion port control

Control1_Pass:
	bne.s   Expansion_Pass  ; If present, pass
	lea Initialization_Values(pc),a5    ; Load initialization values into a5
	movem.w (a5)+,d5-d7
	movem.l (a5)+,a0-a4
	move.b  -$10FF(a1),d0
	andi.b  #$F,d0
	beq.s   Security_Pass
	move.l  #"SEGA",$2F00(a1)

Security_Pass:
	move.w	(a4),d0
	moveq	#0,d0
	movea.l	d0,a6
	move.l	a6,usp
	moveq	#$17,d1

Initialize_VDP:
	move.b	(a5)+,d5
	move.w	d5,(a4)
	add.w	d7,d5
	dbf	d1,Initialize_VDP
	move.l	(a5)+,(a4)
	move.w	d0,(a3)
	move.w	d7,(a1)
	move.w	d7,(a2)

Z80_Wait:
	btst	d0,(a1)
	bne.s	Z80_Wait
	moveq	#$25,d2

Initialize_Z80:
	move.b	(a5)+,(a0)+
	dbf	d2,Initialize_Z80
	move.w	d0,(a2)
	move.w	d0,(a1)
	move.w	d7,(a2)

Clear_RAM:
	move.l	d0,-(a6)
	dbf	d6,Clear_RAM
	move.l	(a5)+,(a4)
	move.l	(a5)+,(a4)
	moveq	#$1F,d3

Clear_CRAM:
	move.l	d0,(a3)
	dbf	d3,Clear_CRAM
	move.l	(a5)+,(a4)
	moveq	#$13,d4

Clear_VDP:
	move.l	d0,(a3)
	dbf	d4,Clear_VDP
	moveq	#3,d5

Initialize_PSG:
	move.b	(a5)+,$11(a3)
	dbf	d5,Initialize_PSG
	move.w	d0,(a2)
	movem.l	(a6),d0-a6
	move	#$2700,sr

Expansion_Pass:
		bra.s	GameProgram

Initialization_Values:
    dc.w $8000, $3FFF, $100
	dc.l Z80_RAM, Z80_BusRequest, Z80_Reset, VDP_Data, VDP_Control
	dc.b 4,	$14, $30, $3C
	dc.b 7,	$6C, 0,	0
	dc.b 0,	0, $FF,	0
	dc.b $81, $37, 0, 1
	dc.b 1,	0, 0, $FF
	dc.b $FF, 0, 0,	$80
	dc.l $40000080

    incbin  "_System/Z80 Instructions.z80"

	dc.w VDPMode_Register2|04, $8F02
	dc.l $C0000000, $40000010
	dc.b $9F,$BF,$DF,$FF

GameProgram:
	tst.w	(VDP_Control).l ; Test VDP

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