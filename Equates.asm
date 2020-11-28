; ====================================================================================================
; System Equates
; ====================================================================================================

; ----------------------------------------------------------------------------------------------------
; Z80 Equates
; ----------------------------------------------------------------------------------------------------

Z80_RAM: = $A00000   ; Start of Z80 RAM
Z80_BusRequest: = $A11100   ; Z80 bus request
Z80_Reset:  = $A11200   ; Z80 reset

; ----------------------------------------------------------------------------------------------------
; VDP Equates
; ----------------------------------------------------------------------------------------------------

VDP_Data:   = $C00000   ; VDP data port
VDP_Control:    = $C00004   ; VDP control port
HV_Counter: = $C00008   ; H/V counter

VDPMode_Register1:  = $8000 ; VDP mode register #1
VDPMode_Register2:  = $8100 ; VDP mode register #2
VDP_PlaneA: = $8200 ; VDP plane A table address
VDP_Window: = $8300 ; VDP window table address
VDP_PlaneB: = $8400 ; VDP plane B table address
VDP_Sprite: = $8500 ; VDP sprite table address
VDP_BGColor:    = $8700 ; Background color
VDP_HBlankRate: = $8A00 ; HBlank interrupt rate
VDPMode_Register3:  = $8B00 ; VDP mode register #3
VDPMode_Register4:  = $8C00 ; VDP mode register #4
VDP_HScroll:    = $8D00 ; HScroll table address
VDP_PlaneSize:  = $9000 ; Size of plane A and B
VDP_WindowX:    = $9100 ; Window split X position
VDP_WindowY:    = $9200 ; Window split Y position
VDP_DMALengthLow:   = $9300 ; DMA length low
VDP_DMALengthHigh:  = $9400 ; DMA length high
VDP_DMASourceLow:   = $9500 ; DMA source low
VDP_DMASourceMid:   = $9600 ; DMA source middle
VDP_DMASourceHigh:  = $9700 ; DMA source high

; ----------------------------------------------------------------------------------------------------

; ====================================================================================================
; General Game Equates
; ====================================================================================================

; ----------------------------------------------------------------------------------------------------
; Screen Equates
; ----------------------------------------------------------------------------------------------------

ScreenID:   = $FFFFF600 ; Screen ID to determine which routines to run in GameLoop
ID_SEGA:    = 0 ; SEGA screen
ID_Title:   = 4 ; Title screen
ID_Demo:    = 8 ; Gameplay demo mode
ID_Level:   = $C    ; Main level mode
ID_Special: = $10   ; Unused Special Stage mode
ID_Continue:    = $14   ; Continue screen
ID_Ending:  = $18   ; Ending sequence mode
ID_Credits: = $1C   ; Credits screen
ID_Unknown1:    = $20   ; Unknown new Mega Play screen mode
ID_Unknown2:    = $24   ; Unknown new Mega Play screen mode

; ----------------------------------------------------------------------------------------------------