; ====================================================================================================
; SEGA Mega Play (Mega Drive) ROM Header
; ====================================================================================================

Header:
System:
    dc.b    "SEGA MEGA DRIVE "  ; 16 characters. 'SEGA' portion is all that's used for TMSS checks.

Copyright:
    dc.b    "(C)SEGA 1991.APR"  ; 16 characters. (Copyright)Publisher, Build Year.Month. This was left untouched from original game.

Title_JP:
    dc.b    "SONIC THE               HEDGEHOG                "  ; 48 characters. Title in Japan and other Asian territories.

Title_International:
    dc.b    "SONIC THE               HEDGEHOG                "  ; 48 characters. Title in Europe and America.

ProductID:
    dc.b    "GM 00004049-01"    ; Product type, Serial-Revision.

; ----------------------------------------------------------------------------------------------------
; Official Product Types
; ----------------------------------------------------------------------------------------------------

; GM = Game
; AI = Educational
; OS = SEGA Mega Drive TMSS
; BR = SEGA CD boot ROM

; ----------------------------------------------------------------------------------------------------
; Unofficial Product Types
; ----------------------------------------------------------------------------------------------------

; RH = ROM Hack
; HB = Homebrew

; ----------------------------------------------------------------------------------------------------

Checksum:
    dc.w    0

Supported_IO:
    dc.b    "J               "  ; Supported I/O devices

; ----------------------------------------------------------------------------------------------------
; Input/Output Devices
; ----------------------------------------------------------------------------------------------------

; J = 3 button controller
; 6 = 6 button controller
; 0 = Master System controller
; A = Analog stick
; 4 = Multi-tap
; G = Light gun
; L = Activator
; M = Mouse
; B = Track ball
; T = Unreleased tablet
; V = Paddle
; K = Keyboard
; R = External RS-232 port
; P = ANSER printer
; C = CD-ROM
; F = Unreleased floppy drive
; D = Download

; ----------------------------------------------------------------------------------------------------

StartLocation:
    dc.l    ROM_Start   ; Start of ROM

EndLocation:
    dc.l    ROM_End-1   ; End of ROM

RAMStart:
    dc.l    $FF0000 ; Start of RAM used by the program

RAMEnd:
    dc.l    $FFFFFF ; End of RAM used by the program

SRAMSupport:
    dc.l    $20202020   ; SRAM support. Set to null

SRAMStart:
    dc.l    $20202020   ; Start of SRAM memory

SRAMEnd:
    dc.l    $20202020   ; End of SRAM memory

Comments:
    dc.b    "    MEGA PLAY SYSTEM                                "  ; Not quite sure why MEGA PLAY SYSTEM is written here. Maybe for product managers or manufacturing so the arcade and home versions aren't mixed up.

RegionSupport:
    dc.b    "UE              "  ; Supported regions the ROM can be played in. This ROM can be played in the US and Europe.

; ====================================================================================================