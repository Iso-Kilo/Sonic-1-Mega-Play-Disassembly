; ====================================================================================================
; Motorola 68000 Exception Vectors Table
; ====================================================================================================

Vectors:
    dc.l    $FFFE00 ; Stack address
    dc.l    ProgramStart ; Program start
    dc.l    ROMLocation674  ; Bus error
    dc.l    ROMLocation674  ; Address error
    dc.l    ROMLocation674  ; Illegal instruction
    dc.l    ROMLocation674  ; Divide by zero
    dc.l    ROMLocation674  ; CHK exception
    dc.l    ROMLocation674  ; TRAPV exception
    dc.l    ROMLocation674  ; Privilege violation 
    dc.l    ROMLocation674  ; TRACE exception
    dc.l    ROMLocation674  ; Line 1010 emulator
    dc.l    ROMLocation674  ; Line 1111 emulator
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Z80 protocol violation
    dc.l    ROMLocation674  ; Format error
    dc.l    ROMLocation674  ; Uninitialized interrupt
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Spurious interrupt
    dc.l    ExceptionLoop   ; IRQ level 1
    dc.l    ExceptionLoop   ; EXTInt
    dc.l    ExceptionLoop   ; IRQ level 3
    dc.l    ROMLocation1366 ; HInt
    dc.l    ExceptionLoop   ; IRQ level 5
    dc.l    ROMLocationDD0  ; VInt
    dc.l    ExceptionLoop   ; IRQ level 7
    dc.l    ROMLocation674  ; TRAP #0
    dc.l    ROMLocation674  ; TRAP #1
    dc.l    ROMLocation674  ; TRAP #2
    dc.l    ROMLocation674  ; TRAP #3
    dc.l    ROMLocation674  ; TRAP #4
    dc.l    ROMLocation674  ; TRAP #5
    dc.l    ROMLocation674  ; TRAP #6
    dc.l    ROMLocation674  ; TRAP #7
    dc.l    ROMLocation674  ; TRAP #8
    dc.l    ROMLocation674  ; TRAP #9
    dc.l    ROMLocation674  ; TRAP #10
    dc.l    ROMLocation674  ; TRAP #11
    dc.l    ROMLocation674  ; TRAP #12
    dc.l    ROMLocation674  ; TRAP #13
    dc.l    ROMLocation674  ; TRAP #14
    dc.l    ROMLocation674  ; TRAP #15
    dc.l    ROMLocation674  ; FP branch or set on unordered condition
    dc.l    ROMLocation674  ; FP inexact result
    dc.l    ROMLocation674  ; FP divide by zero
    dc.l    ROMLocation674  ; FP underflow
    dc.l    ROMLocation674  ; FP operand error
    dc.l    ROMLocation674  ; FP overflow
    dc.l    ROMLocation674  ; FP signaling NAN
    dc.l    ROMLocation674  ; FP unimplemented data type
    dc.l    ROMLocation674  ; MMU configuration error
    dc.l    ROMLocation674  ; MMU illegal operation
    dc.l    ROMLocation674  ; MMU access violation
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused
    dc.l    ROMLocation674  ; Unused

; ====================================================================================================