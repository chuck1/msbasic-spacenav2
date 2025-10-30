; configuration
CONFIG_2A := 1
;CONFIG_2B := 1

CONFIG_SCRTCH_ORDER := 2

; zero page
ZP_START0 = $00
ZP_START1 = $02
ZP_START2 = $0C
ZP_START3 = $62
ZP_START4 = $6D

; extra/override ZP variables
USR := GORESTART

; constants
SPACE_FOR_GOSUB := $3E
STACK_TOP := $FA
WIDTH := 40
WIDTH2 := 30
RAMSTART2 := $0400





; configuration
;CONFIG_11 := 1

;APPLE_BAD_BYTE := 1

;CONFIG_IO_MSB := 1 ; all I/O has bit #7 set

;CONFIG_PRINT_CR := 1 ; print CR when line end reached
;CONFIG_SAFE_NAMENOTFOUND := 1
;CONFIG_SCRTCH_ORDER := 3
;CONFIG_NO_LINE_EDITING := 1

;BYTES_PER_ELEMENT := 6 ; XXX override

; zero page
;ZP_START1 = $00
;ZP_START2 = $4F
;ZP_START3 = $0D
;ZP_START4 = $55

;extra ZP variables
;USR	:= $000A


; constants
;STACK_TOP		:= $F8
;SPACE_FOR_GOSUB := $36
;CRLF_1 := CR
;CRLF_2 := $80
;WIDTH			:= 40
;WIDTH2			:= 14

; memory layout
;RAMSTART2	:= $2A00

; monitor functions
;MONRDKEY    no  := $FD0C
;MONCOUT     no  := $FDED
;LF689			:= $F689
;LF800			:= $F800
;LF819			:= $F819
;LF828			:= $F828
;LF864			:= $F864
;TEX				:= $FB2F
;LFB40			:= $FB40
;LFD0C			:= $FD0C
;LFD6A			:= $FD6A
;LFECD			:= $FECD
;LFEFD			:= $FEFD

