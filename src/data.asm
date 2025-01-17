.INCLUDE "data/audio.asm"

.INCLUDE "graphics/1bppCharacters.asm"

;; For each level...
.INCLUDE "data/levels/entitiesDescriptors.asm"

.INCLUDE "data/levels/screenDescriptors.asm"

.dsb 376, $FF

.BANK 3
.ORG $0000

; Data from C000 to C47F (1152 bytes)
_DATA_C000_:
.incbin "src/graphics/boxes/skull.bin"
.incbin "src/graphics/boxes/question_mark.bin"
.incbin "src/graphics/boxes/star.bin"
.incbin "src/graphics/boxes/star_pink.bin"
.incbin "src/graphics/boxes/waves_pink.bin"
.incbin "src/graphics/boxes/fish_pink.bin"
.incbin "src/graphics/boxes/moon_pink.bin"
.incbin "src/graphics/boxes/skull_pink.bin"
.incbin "src/graphics/boxes/sun_pink.bin"

; Pointer Table from C480 to C4A1 (17 entries, indexed by v_level)
levelMainTilesetPointers:
.dw tiles_mainSet tiles_mainSet2 tiles_mainSet3 tiles_mainSet4 tiles_mainSet tiles_mainSet5 tiles_level7MainSet tiles_level8MainSet
.dw tiles_mainSet tiles_mainSet2 tiles_level11MainSet tiles_mainSet5 tiles_mainSet2 tiles_level14MainSet tiles_mainSet2 tiles_level16MainSet
.dw tiles_level17MainSet

; Data from C4A2 to C582 (225 bytes)
tiles_bagOfGoldCoinsAndCloud:
.incbin "src/graphics/bag_of_gold_coins_and_cloud.bin"

; Data from C583 to C9E0 (1118 bytes)
tiles_aditionalSet1:
.incbin "src/graphics/aditionalSet1.bin"

; Data from C9E1 to CE64 (1156 bytes)
tiles_aditionalSet2:
.incbin "src/graphics/aditionalSet2.bin"

; Data from CE65 to CECD (105 bytes)
tiles_aditionalSet3:
.incbin "src/graphics/aditionalTileset3.bin"

; 1st entry of Pointer Table from C480 (indexed by v_level)
; Data from CECE to D157 (650 bytes)
tiles_mainSet:
.incbin "src/graphics/mainTileset.bin"

; 2nd entry of Pointer Table from C480 (indexed by v_level)
; Data from D158 to D316 (447 bytes)
tiles_mainSet2:
.incbin "src/graphics/mainSet2.bin"

; 3rd entry of Pointer Table from C480 (indexed by v_level)
; Data from D317 to D569 (595 bytes)
tiles_mainSet3:
.incbin "src/graphics/mainSet3.bin"

; 4th entry of Pointer Table from C480 (indexed by v_level)
; Data from D56A to DB81 (1560 bytes)
tiles_mainSet4:
.incbin "src/graphics/mainSet4.bin"

; 6th entry of Pointer Table from C480 (indexed by v_level)
; Data from DB82 to DF1C (923 bytes)
tiles_mainSet5:
.incbin "src/graphics/mainSet5.bin"

; 7th entry of Pointer Table from C480 (indexed by v_level)
; Data from DF1D to E24B (815 bytes)
tiles_level7MainSet:
.incbin "src/graphics/level7MainSet.bin"

; 8th entry of Pointer Table from C480 (indexed by v_level)
; Data from E24C to EA04 (1977 bytes)
tiles_level8MainSet:
.incbin "src/graphics/level8MainSet.bin"

; 11th entry of Pointer Table from C480 (indexed by v_level)
; Data from EA05 to EE32 (1070 bytes)
; Also used for level 14
tiles_level11MainSet:
.incbin "src/graphics/level11MainSet.bin"

; 16th entry of Pointer Table from C480 (indexed by v_level)
; Data from EE33 to F116 (740 bytes)
tiles_level16MainSet:
.incbin "src/graphics/level16MainSet.bin"

; 17th entry of Pointer Table from C480 (indexed by v_level)
; Data from F117 to F49A (900 bytes)
tiles_level17MainSet:
.INCBIN "src/graphics/level17MainTileSet.bin"

; 14th entry of Pointer Table from C480 (indexed by v_level)
; Data from F49B to F75B (705 bytes)
tiles_level14MainSet:
.INCBIN "src/graphics/level14MainSet.bin"

; Data from F75C to F7F5 (154 bytes)
tiles_level17AditionalSet:
.db $8E $07 $18 $20 $40 $40 $83 $80 $80 $FE $01 $C0 $00 $00 $FF $02
.db $00 $02 $10 $02 $80 $02 $10 $02 $80 $02 $08 $02 $01 $02 $08 $02
.db $01 $02 $10 $02 $80 $02 $10 $02 $80 $00 $90 $F8 $E0 $C0 $80 $80
.db $00 $07 $08 $00 $00 $01 $C0 $00 $00 $FF $00 $08 $08 $08 $10 $07
.db $08 $81 $00 $00 $8E $07 $19 $36 $70 $6F $DF $D8 $D0 $FE $24 $18
.db $02 $3F $FF $02 $00 $02 $B0 $82 $D0 $50 $02 $B0 $02 $D0 $02 $0D
.db $02 $0B $02 $0D $02 $0B $02 $B0 $02 $D0 $02 $B0 $02 $D0 $00 $94
.db $F8 $E6 $C9 $8F $90 $20 $27 $28 $01 $DA $26 $3D $C0 $00 $FF $00
.db $48 $48 $28 $A8 $02 $48 $02 $28 $02 $12 $02 $14 $02 $12 $02 $14
.db $02 $48 $02 $28 $02 $48 $82 $28 $20 $00

; Data from F7F6 to F895 (160 bytes)
tiles_aditionalSet4:
.db $00 $0F $0F $00 $00 $10 $1F $0F $00 $10 $1F $0F $00 $0F $0F $00
.db $02 $07 $00 $05 $00 $07 $07 $00 $00 $08 $0F $07 $00 $10 $1F $0F
.db $00 $FF $FF $00 $00 $00 $FF $FF $00 $00 $FF $FF $00 $FF $FF $00
.db $AA $FF $00 $55 $00 $FF $FF $00 $81 $81 $7F $7E $4A $CA $3F $B5
.db $00 $C0 $C0 $00 $00 $20 $E0 $C0 $00 $20 $E0 $C0 $00 $C0 $C0 $00
.db $80 $80 $00 $00 $00 $80 $80 $00 $00 $40 $C0 $80 $00 $20 $E0 $C0
.db $04 $04 $FF $FB $04 $04 $FF $FB $84 $84 $FF $7B $6A $6A $FF $95
.db $91 $91 $FF $6E $11 $11 $FF $EE $2A $2A $FF $D5 $00 $FF $FF $00
.db $00 $20 $E0 $C0 $00 $20 $E0 $C0 $40 $60 $E0 $80 $80 $A0 $E0 $40
.db $00 $20 $E0 $C0 $00 $40 $C0 $80 $00 $80 $80 $00 $00 $00 $00 $00

; Data from F896 to F969 (212 bytes)
tiles_aditionalSet5:
.db $83 $0E $70 $40 $02 $80 $04 $00 $81 $38 $02 $20 $02 $40 $85 $00
.db $40 $00 $00 $E8 $07 $00 $9A $03 $04 $00 $10 $00 $00 $1C $7E $7E
.db $7F $3D $2D $6E $3C $18 $7E $FE $FA $7C $7C $38 $EC $31 $71 $E0
.db $08 $04 $00 $88 $F8 $FE $E6 $C0 $08 $30 $20 $00 $00 $81 $F1 $02
.db $81 $03 $00 $84 $80 $81 $FF $C7 $02 $C1 $02 $81 $86 $C1 $81 $C3
.db $FF $07 $01 $03 $00 $A9 $0F $03 $87 $84 $C8 $F0 $C0 $C0 $F0 $E3
.db $81 $81 $80 $C2 $52 $91 $C3 $E7 $81 $01 $05 $83 $83 $C7 $13 $CE
.db $8E $1F $07 $01 $00 $00 $0F $07 $01 $19 $3F $F2 $C0 $C0 $F0 $00
.db $83 $0E $70 $40 $02 $80 $04 $00 $81 $38 $02 $20 $02 $40 $85 $00
.db $40 $00 $00 $E8 $07 $00 $84 $03 $04 $00 $10 $02 $00 $05 $FF $83
.db $7F $FF $7F $04 $FF $04 $FE $84 $7F $7B $1B $03 $04 $00 $03 $FF
.db $82 $F7 $C2 $03 $00 $00 $83 $F1 $8F $BF $02 $7F $04 $FF $81 $C7
.db $02 $DF $02 $BF $85 $FF $BF $FF $FF $17 $07 $FF $84 $FC $FB $FF
.db $EF $22 $FF $00

; Data from F96A to FC68 (767 bytes)
data_endingSequenceText:
.db $00 $00 $1A $04 $E4 $D8 $D5 $B0 $D8 $D5 $E2 $DF $D9 $D3 $B0 $D1
.db $D3 $E4 $D9 $DF $DE $B0 $E4 $D1 $DB $D5 $DE $B0 $D2 $E9 $FE $19
.db $04 $D1 $DC $D5 $E8 $B0 $DB $D9 $D4 $D4 $B0 $E2 $D5 $E3 $E5 $DC
.db $E4 $D5 $D4 $B0 $D9 $DE $B0 $E4 $D8 $D5 $FE $1C $04 $D4 $DF $E7
.db $DE $D6 $D1 $DC $DC $B0 $DF $D6 $B0 $DA $D1 $DE $DB $D5 $DE $B0
.db $E4 $D8 $D5 $B0 $D7 $E2 $D5 $D1 $E4 $FE $19 $04 $D1 $DE $D4 $B0
.db $D1 $B0 $E2 $D5 $E4 $E5 $E2 $DE $B0 $DF $D6 $B0 $E0 $D5 $D1 $D3
.db $D5 $B0 $D1 $DE $D4 $FE $1A $04 $E4 $E2 $D1 $DE $E1 $E5 $D9 $DC
.db $D9 $E4 $E9 $B0 $E4 $DF $B0 $B2 $E2 $D1 $D4 $D1 $E8 $D9 $D1 $DE
.db $BE $B2 $FE $19 $04 $D9 $DE $B0 $D1 $B0 $D4 $D1 $EA $EA $DC $D9
.db $DE $D7 $B0 $D3 $DF $E2 $DF $DE $D1 $E4 $D9 $DF $DE $BC $FE $1A
.db $04 $B2 $D9 $D7 $E5 $DC $BC $B2 $B0 $D8 $D9 $E3 $B0 $D5 $DC $D4
.db $D5 $E2 $B0 $D2 $E2 $DF $E4 $D8 $D5 $E2 $BC $FE $1D $04 $D2 $D5
.db $D3 $D1 $DD $D5 $B0 $E4 $D8 $D5 $B0 $DB $D9 $DE $D7 $B0 $DF $D6
.db $B2 $E2 $D1 $D4 $D1 $E8 $D9 $D1 $DE $BE $B2 $FE $1C $04 $E4 $D8
.db $D5 $B0 $D3 $D9 $E4 $D9 $EA $D5 $DE $E3 $B0 $E7 $D8 $DF $B0 $E7
.db $D5 $E2 $D5 $B0 $E4 $E5 $E2 $DE $D5 $D4 $FE $1B $04 $D9 $DE $E4
.db $DF $B0 $E3 $E4 $DF $DE $D5 $B0 $E2 $D5 $E6 $D5 $E2 $E4 $D5 $D4
.db $B0 $D2 $D1 $D3 $DB $B0 $E4 $DF $FE $18 $04 $D8 $E5 $DD $D1 $DE
.db $B0 $D2 $D5 $D9 $DE $D7 $E3 $B0 $E4 $D8 $E2 $DF $E5 $D7 $D8 $B0
.db $E4 $D8 $D5 $FE $15 $04 $E0 $DF $E7 $D5 $E2 $B0 $DF $D6 $B0 $E4
.db $D8 $D5 $B0 $B2 $D3 $E2 $DF $E7 $DE $BE $B2 $FE $1A $04 $D1 $DC
.db $D5 $E8 $B0 $E7 $D1 $E3 $B0 $DF $E6 $D5 $E2 $DA $DF $E9 $D5 $D4
.db $B0 $E4 $D8 $D1 $E4 $B0 $D8 $D5 $FE $1B $04 $E7 $D1 $E3 $B0 $D1
.db $D2 $DC $D5 $B0 $E4 $DF $B0 $E5 $E3 $D5 $B0 $D8 $D9 $E3 $B0 $DD
.db $D1 $E2 $E4 $D9 $D1 $DC $FE $1A $04 $D1 $E2 $E4 $B0 $E3 $DB $D9
.db $DC $DC $E3 $B0 $D6 $DF $E2 $B0 $E4 $D8 $D5 $B0 $D7 $DF $DF $D4
.db $B0 $DF $D6 $FE $0D $04 $E4 $D8 $D5 $B0 $D3 $D9 $E4 $D9 $EA $D5
.db $DE $E3 $BE $FE $1B $04 $E3 $DF $DD $D5 $B0 $D4 $DF $E5 $D2 $E4
.db $B0 $E3 $E4 $D9 $DC $DC $B0 $DC $D9 $DE $D7 $D5 $E2 $E3 $B0 $D9
.db $DE $FE $19 $04 $D8 $D9 $E3 $B0 $DD $D9 $DE $D4 $B0 $D1 $E3 $B0
.db $E4 $DF $B0 $E7 $D8 $D5 $E4 $D8 $D5 $E2 $B0 $DF $E2 $FE $17 $04
.db $DE $DF $E4 $B0 $D1 $DC $DC $B0 $DF $D6 $B0 $E4 $D8 $D5 $B0 $E3
.db $D9 $DE $D9 $E3 $E4 $D5 $E2 $FE $1A $04 $D5 $DE $D5 $DD $E9 $B0
.db $D6 $DF $E2 $D3 $D5 $E3 $B0 $E7 $D5 $E2 $D5 $B0 $D1 $D3 $E4 $E5
.db $D1 $DC $DC $E9 $FE $0A $04 $D4 $D5 $E3 $E4 $E2 $DF $E9 $D5 $D4
.db $BE $FE $1A $04 $D1 $D4 $D4 $D5 $D4 $B0 $E4 $DF $B0 $E4 $D8 $D9
.db $E3 $B0 $D6 $D5 $D1 $E2 $BC $B0 $D9 $E3 $B0 $E4 $D8 $D5 $FE $1B
.db $04 $E5 $DE $D5 $D1 $E3 $D9 $DE $D5 $E3 $E3 $B0 $D8 $D5 $B0 $D6
.db $D5 $D5 $DC $E3 $B0 $D2 $D5 $D3 $D1 $E5 $E3 $D5 $FE $1B $04 $DF
.db $D6 $B0 $E4 $D8 $D5 $B0 $D6 $D1 $D3 $E4 $B0 $E4 $D8 $D1 $E4 $B0
.db $E4 $D8 $D5 $B0 $E7 $D8 $D5 $E2 $D5 $BD $FE $1A $04 $D1 $D2 $DF
.db $E5 $E4 $E3 $B0 $DF $D6 $B0 $D8 $D9 $E3 $B0 $D6 $D1 $E4 $D8 $D5
.db $E2 $BC $B0 $DB $D9 $DE $D7 $FE $19 $04 $E3 $D1 $DE $D4 $D5 $E2
.db $BC $B0 $D9 $E3 $B0 $E3 $E4 $D9 $DC $DC $B0 $E5 $DE $DB $DE $DF
.db $E7 $DE $BE
.dsb 11, $FE
.db $10 $04
.dsb 9, $B0
.db $E4 $D8 $D5 $B0 $D5 $DE $D4
.dsb 13, $FE
.db $FF $00

; Data from FC69 to FFFF (919 bytes)
tiles_AlexKiddEatingRiceBall:
.INCBIN "src/graphics/alexKiddEatingRiceBall.bin"


.dsb 36, $FF

.BANK 4
.ORG $0000

; Pointer Table from 10000 to 1005F (48 entries, indexed by v_alexTilesIndex)
.INCLUDE "data/alexFrameDescriptors.asm"

.INCLUDE "graphics/alexKidd.asm"

; Data from 118E9 to 11BB4 (716 bytes)
battleTiles:
.db $02 $00 $82 $07 $1F $02 $3F $02 $7F $84 $01 $07 $8F $EF $04 $FF
.db $83 $E0 $F8 $FC $05 $FF $02 $00 $83 $E0 $F8 $FC $02 $FE $08 $FF
.db $81 $7F $05 $FF $02 $FE $83 $FC $7F $3F $02 $1F $02 $3F $02 $7F
.db $82 $F8 $FC $02 $FE $04 $FF $03 $7F $02 $3F $83 $1F $07 $00 $04
.db $FF $84 $F9 $F0 $C0 $00 $04 $FF $89 $FC $F8 $70 $20 $FF $FE $FE
.db $FC $F0 $03 $00 $02 $FF $94 $F8 $F7 $EF $EF $ED $CD $FF $FF $7F
.db $1F $AF $F7 $F7 $FB $B6 $B6 $B9 $DF $DF $EF $02 $FF $02 $FB $02
.db $F7 $8D $EF $DF $FF $FF $F3 $ED $ED $EE $F6 $F7 $F7 $FB $9F $06
.db $6F $89 $F7 $F3 $CB $B5 $B5 $B9 $DF $DF $EF $04 $FB $02 $F7 $A2
.db $EF $DF $FF $FF $E7 $DB $DB $DA $EC $EC $FF $9F $6F $69 $66 $D6
.db $CD $DD $EE $97 $67 $77 $7F $BF $DF $EF $DB $F3 $F1 $E6 $FE $F9
.db $E7 $DF $04 $00 $84 $01 $03 $01 $03 $03 $00 $83 $70 $FC $FE $02
.db $FF $03 $07 $81 $03 $04 $00 $86 $CF $37 $F7 $CF $3E $38 $06 $00
.db $84 $01 $7F $7F $01 $03 $00 $89 $F0 $FC $FE $FF $FF $07 $1F $7E
.db $70 $04 $00 $86 $FF $C7 $37 $4F $3E $38 $03 $00 $8D $0C $0F $03
.db $01 $38 $3F $07 $00 $18 $18 $8C $EC $7E $02 $FF $02 $00 $83 $03
.db $1F $1C $03 $00 $87 $7F $FF $FF $8F $1E $3C $38 $11 $00 $88 $08
.db $30 $26 $9A $59 $64 $0C $10 $00 $62 $00 $82 $07 $0F $03 $1F $89
.db $3F $00 $00 $80 $E0 $F0 $F8 $F8 $FC $03 $7F $02 $3F $81 $1F $02
.db $00 $02 $FC $02 $F8 $88 $F0 $E0 $00 $00 $0C $1E $1E $1F $03 $0F
.db $82 $07 $60 $06 $F0 $83 $F8 $0F $3F $03 $7F $02 $3F $81 $1F $04
.db $FC $02 $F8 $94 $F0 $E0 $00 $00 $18 $3C $3C $3D $1F $1F $00 $60
.db $F0 $F6 $FF $EF $FE $FE $1F $6F $03 $FF $8B $7F $3F $1F $FC $FC
.db $FE $FF $FF $FE $F8 $E0 $03 $00 $8A $01 $03 $07 $07 $0F $00 $00
.db $70 $FC $FE $03 $FF $03 $0F $82 $07 $03 $03 $00 $05 $FF $82 $7E
.db $38 $04 $00 $8A $01 $7F $FF $FF $7F $00 $00 $F0 $FC $FE $03 $FF
.db $85 $1F $7F $FF $FE $70 $03 $00 $04 $FF $8F $7F $7E $38 $00 $0C
.db $1F $1F $0F $3B $7F $7F $3F $18 $3C $FC $02 $FE $03 $FF $86 $07
.db $03 $1F $3F $3F $1C $02 $00 $04 $FF $9C $BF $7E $7C $38 $3C $7E
.db $E7 $C3 $C3 $E7 $7E $3C $42 $E7 $7E $3C $3C $7E $E7 $42 $08 $10
.db $24 $9A $59 $24 $08 $10 $00 $62 $00 $94 $07 $08 $10 $10 $12 $32
.db $00 $00 $80 $E0 $50 $08 $08 $04 $49 $49 $46 $20 $20 $10 $02 $00
.db $02 $04 $02 $08 $8D $10 $20 $00 $00 $0C $12 $12 $11 $09 $08 $08
.db $04 $60 $06 $90 $89 $08 $0C $34 $4A $4A $46 $20 $20 $10 $04 $04
.db $02 $08 $A2 $10 $20 $00 $00 $18 $24 $24 $25 $13 $13 $00 $60 $90
.db $96 $99 $29 $32 $22 $11 $68 $98 $88 $80 $40 $20 $10 $24 $0C $0E
.db $19 $01 $06 $18 $20 $03 $00 $8B $01 $02 $04 $06 $0C $00 $00 $70
.db $8C $02 $01 $02 $00 $03 $08 $82 $04 $03 $03 $00 $87 $30 $C8 $08
.db $30 $C1 $46 $38 $04 $00 $92 $01 $7E $80 $80 $7E $00 $00 $F0 $0C
.db $02 $01 $00 $00 $18 $60 $81 $8E $70 $04 $00 $BF $38 $C8 $B0 $41
.db $46 $38 $00 $0C $13 $10 $0C $3A $47 $40 $38 $18 $24 $E4 $72 $12
.db $81 $00 $00 $07 $03 $1C $20 $23 $1C $00 $00 $80 $00 $00 $70 $A1
.db $42 $44 $38 $3C $7E $E7 $C3 $C3 $E7 $7E $3C $42 $E7 $7E $3C $3C
.db $7E $E7 $42 $4E $99 $B4 $DE $7B $2D $99 $72 $00 $7F $00 $7F $00
.db $32 $00 $88 $76 $CF $D9 $65 $A6 $9B $F3 $6E $00

; 1st entry of Pointer Table from 7663 (indexed by v_entities.6.data)
; Data from 11BB5 to 11E66 (690 bytes)
goosekaTiles:
.db $03 $00 $88 $07 $1F $3F $3F $7F $00 $00 $F0 $02 $FC $03 $FE $02
.db $7F $86 $61 $23 $3F $1E $01 $1F $02 $CE $02 $FC $86 $F8 $F0 $00
.db $F8 $1F $5F $03 $6F $8B $7C $78 $20 $FA $F2 $F6 $F6 $EE $FE $7E
.db $0C $03 $00 $02 $1C $02 $3E $04 $00 $02 $70 $02 $F8 $90 $00 $1F
.db $5F $6F $7F $7F $3C $08 $00 $FA $F2 $F6 $FE $FC $F8 $60 $03 $00
.db $02 $38 $02 $78 $04 $00 $02 $38 $02 $3C $02 $00 $02 $7F $85 $61
.db $23 $3F $1E $01 $03 $BF $85 $DF $1F $1F $1C $18 $03 $00 $89 $1C
.db $3E $3E $3C $1C $1F $1F $0F $03 $07 $00 $81 $38 $03 $7F $81 $38
.db $05 $00 $82 $07 $1F $02 $3F $03 $00 $81 $F0 $02 $FC $02 $FE $03
.db $7F $86 $61 $23 $3F $1E $01 $FE $02 $CE $02 $FC $91 $F8 $F0 $00
.db $0A $1A $66 $7E $3E $02 $1C $18 $B0 $BA $C6 $FE $FC $80 $02 $70
.db $03 $00 $02 $38 $02 $78 $04 $00 $02 $38 $02 $3C $81 $00 $00 $02
.db $00 $9D $07 $1A $26 $56 $56 $D7 $00 $F0 $7C $FE $DE $DF $87 $4B
.db $D7 $D0 $FF $5E $7E $3F $3F $7E $37 $37 $4E $8E $FC $78 $FC $03
.db $FE $81 $FD $04 $FF $84 $73 $FF $FF $7F $04 $FF $83 $1E $20 $21
.db $03 $22 $02 $41 $83 $7F $0C $08 $03 $88 $02 $04 $93 $FC $FE $FE
.db $FD $FF $FF $7F $3F $23 $FF $FF $7F $FF $FE $FC $F8 $08 $21 $42
.db $02 $44 $02 $84 $84 $FC $00 $08 $84 $02 $44 $02 $42 $89 $7E $00
.db $D7 $D0 $FF $5E $7E $3F $FF $03 $FE $82 $FD $FF $03 $3F $87 $23
.db $00 $1C $3E $7F $7F $7E $03 $3F $83 $1F $0F $03 $05 $00 $82 $38
.db $7F $03 $FF $82 $7F $38 $03 $00 $83 $07 $1A $26 $02 $56 $02 $00
.db $97 $F0 $7C $FE $DE $DF $87 $D7 $D7 $D0 $FF $5E $7E $3F $3F $4B
.db $37 $37 $4E $8E $FC $78 $FC $7F $03 $FF $81 $7F $03 $3F $81 $FE
.db $03 $FF $87 $FE $FC $F8 $F8 $23 $21 $42 $02 $44 $02 $84 $84 $FC
.db $08 $08 $84 $02 $44 $02 $42 $81 $7E $00 $02 $00 $AE $07 $1D $39
.db $69 $69 $A8 $00 $F0 $8C $02 $22 $21 $79 $85 $A8 $AF $9E $7D $41
.db $21 $3E $59 $B1 $B1 $82 $72 $04 $88 $FC $1A $99 $9D $8E $8C $9F
.db $8C $88 $5C $39 $31 $F1 $71 $F1 $E1 $61 $F2 $02 $3F $03 $3E $03
.db $7F $81 $FC $04 $F8 $03 $FC $92 $99 $9D $8E $84 $87 $44 $38 $3C
.db $39 $31 $F1 $41 $C2 $C4 $78 $F8 $3F $7E $02 $7C $03 $FC $83 $00
.db $F8 $FC $02 $7C $03 $7E $9D $00 $A8 $AF $9E $7D $41 $21 $FE $39
.db $39 $3D $1E $DC $3F $3C $38 $3C $00 $1C $22 $41 $41 $42 $23 $20
.db $20 $10 $0C $03 $05 $00 $82 $38 $47 $03 $80 $82 $47 $38 $03 $00
.db $83 $07 $1D $39 $02 $69 $02 $00 $A9 $F0 $8C $02 $22 $21 $79 $A8
.db $A8 $AF $9E $7D $41 $21 $3E $85 $B1 $B1 $82 $72 $04 $88 $FC $4D
.db $9D $99 $81 $41 $3D $3E $38 $52 $79 $39 $01 $02 $7C $F8 $78 $3C
.db $3F $7E $02 $7C $03 $FC $02 $F8 $81 $FC $02 $7C $03 $7E $00 $17
.db $00 $81 $20 $07 $00 $8B $04 $60 $20 $10 $10 $00 $03 $07 $0F $04
.db $0C $02 $08 $02 $00 $85 $80 $E0 $1F $1E $1C $05 $00 $02 $F0 $81
.db $70 $05 $00 $8B $60 $20 $10 $00 $00 $03 $07 $1F $04 $0C $08 $03
.db $00 $84 $80 $F0 $1E $3C $06 $00 $82 $F0 $78 $0D $00 $03 $40 $02
.db $20 $84 $00 $03 $07 $1F $38 $00 $82 $30 $60 $04 $00 $84 $01 $07
.db $0C $04 $05 $00 $84 $80 $1F $1E $3C $05 $00 $02 $F0 $81 $78 $05
.db $00 $00

; 1st entry of Pointer Table from 7673 (indexed by v_entities.6.data)
; Data from 11E67 to 11E74 (14 bytes)
chokkinnaTilesA:
.db $8E $00 $1C $3E $32 $16 $1E $0E $3F $00 $38 $7C $4C $6C

; Data from 11E75 to 120A7 (563 bytes)
chokkinnaTilesB:
.db $F8 $02 $F0 $05 $7F $83 $3F $0F $00 $02 $F8 $03 $FC $83 $F8 $70
.db $00 $02 $08 $02 $0C $84 $1E $7F $7E $7C $02 $20 $02 $60 $86 $F0
.db $FC $FC $7C $78 $30 $06 $00 $82 $3C $18 $06 $00 $02 $08 $90 $0C
.db $3C $7E $3E $1E $1C $20 $20 $60 $78 $FC $F8 $F0 $70 $18 $20 $06
.db $00 $82 $30 $08 $06 $00 $05 $7F $8D $3F $0F $80 $88 $88 $8C $1C
.db $1E $1F $1E $1C $18 $10 $08 $00 $89 $1C $3E $3E $3C $1C $1F $1F
.db $0F $03 $07 $00 $81 $38 $03 $7F $94 $38 $00 $08 $0B $13 $1E $1C
.db $0B $16 $1C $20 $A0 $90 $F0 $70 $A0 $D0 $70 $30 $10 $06 $00 $00
.db $A5 $1C $3E $67 $6F $3B $3F $3F $4F $38 $7C $E6 $F6 $DE $FC $F8
.db $F8 $9F $DB $DA $E6 $9F $79 $3F $1F $FC $3C $FE $FE $1E $7C $B8
.db $F0 $28 $5F $7F $7F $9F $03 $FF $85 $28 $F4 $FC $FC $F2 $03 $FE
.db $B7 $FF $7F $3F $37 $23 $41 $41 $7F $FE $FC $F8 $D8 $88 $04 $04
.db $FC $3F $7F $5F $BF $FF $7F $3F $3F $F8 $FC $F4 $FA $FE $FC $F8
.db $F8 $3F $7F $6F $46 $82 $82 $FE $00 $F8 $FC $EC $C4 $82 $82 $FE
.db $00 $9F $DB $DA $E6 $9F $79 $FF $04 $BF $81 $FF $07 $3F $8B $37
.db $23 $41 $41 $7F $00 $1C $3E $7F $7F $7E $03 $3F $83 $1F $0F $03
.db $05 $00 $82 $38 $7F $03 $FF $84 $7F $38 $2F $4F $02 $5F $04 $3F
.db $82 $E8 $E4 $02 $F4 $07 $F8 $85 $D8 $88 $04 $04 $FC $00 $AA $1C
.db $22 $41 $4D $29 $21 $31 $70 $38 $44 $82 $B2 $92 $04 $08 $08 $E0
.db $A4 $A5 $99 $E0 $46 $30 $1F $04 $C4 $02 $02 $E2 $84 $C8 $F0 $37
.db $77 $73 $73 $81 $80 $81 $83 $D8 $DC $02 $9C $03 $02 $D5 $82 $87
.db $4F $3F $37 $23 $41 $41 $7F $C2 $E4 $F8 $D8 $88 $04 $04 $FC $37
.db $77 $53 $83 $81 $41 $21 $23 $D8 $DC $94 $82 $02 $04 $08 $88 $27
.db $5F $6F $46 $82 $82 $FE $00 $C8 $F4 $EC $C4 $82 $82 $FE $00 $E0
.db $A4 $A5 $99 $E0 $46 $F0 $3F $37 $37 $33 $E3 $21 $20 $21 $23 $27
.db $2F $3F $37 $23 $41 $41 $7F $00 $1C $22 $41 $41 $42 $23 $20 $20
.db $10 $0C $03 $05 $00 $82 $38 $47 $03 $80 $9A $47 $38 $37 $64 $4C
.db $41 $23 $34 $29 $23 $D8 $4C $64 $04 $88 $58 $28 $88 $C8 $E8 $F8
.db $D8 $88 $04 $04 $FC $00 $20 $00 $91 $08 $1F $3E $3C $7E $1F $1E
.db $1C $20 $F0 $F8 $78 $FC $F0 $F0 $70 $1E $03 $1F $84 $1E $3E $3E
.db $00 $05 $F0 $02 $F8 $95 $00 $1F $3F $3E $5C $0E $02 $02 $1C $F0
.db $F8 $F8 $74 $E0 $80 $80 $70 $1E $3F $3E $3C $02 $7C $02 $00 $84
.db $F0 $F8 $F8 $78 $02 $7C $09 $00 $8A $70 $7F $7F $7E $3C $1E $1F
.db $1E $1C $1E $03 $1F $81 $1E $02 $3E $19 $00 $90 $08 $18 $20 $20
.db $00 $03 $16 $1C $20 $30 $08 $08 $00 $80 $D0 $70 $05 $F0 $02 $F8
.db $81 $00 $00

; 1st entry of Pointer Table from 7683 (indexed by v_entities.6.data)
; Data from 120A8 to 12356 (687 bytes)
parplinTiles:
.db $92 $00 $03 $33 $3B $19 $1D $6D $63 $00 $0C $9C $98 $B8 $B0 $B0
.db $8E $3D $1B $03 $1F $8B $0E $31 $7F $7E $BC $FC $F8 $F8 $F0 $0C
.db $FE $03 $7F $85 $6F $70 $70 $6F $0F $03 $FE $85 $EE $1E $1E $EE
.db $F0 $03 $0E $05 $00 $03 $F0 $05 $00 $92 $6F $57 $7B $7B $30 $00
.db $0F $1F $E6 $DA $BE $BE $1C $00 $F0 $F8 $1E $3C $06 $00 $82 $F8
.db $7C $06 $00 $82 $3D $1B $03 $1F $82 $0E $31 $03 $FF $02 $1F $02
.db $00 $02 $0F $02 $00 $89 $1C $3E $3E $3C $1C $1F $1F $0F $03 $06
.db $00 $81 $38 $03 $7F $81 $38 $04 $00 $91 $03 $33 $3B $19 $1D $6D
.db $00 $00 $0C $9C $98 $B8 $B0 $B0 $63 $3D $1B $03 $1F $9D $0E $01
.db $8E $7E $BC $FC $F8 $F8 $F0 $00 $18 $26 $7E $7C $33 $00 $00 $0F
.db $18 $E4 $FE $7E $9C $00 $00 $F0 $1F $1E $3C $05 $00 $02 $F8 $81
.db $7C $05 $00 $00 $B0 $03 $37 $7F $7F $3F $7F $FF $FF $0C $9E $FE
.db $FC $FC $F8 $FE $FF $63 $25 $31 $3F $3E $3F $4F $86 $8F $4E $1E
.db $7C $FC $FC $F2 $C1 $C6 $E6 $E1 $F0 $FB $FB $F0 $70 $C3 $C7 $07
.db $1F $3F $3F $1F $0E $05 $11 $02 $21 $81 $3F $05 $08 $02 $04 $93
.db $FC $DE $FE $FD $FC $7B $3B $10 $20 $DB $FF $7F $7F $3E $3C $08
.db $04 $21 $42 $02 $44 $02 $84 $84 $FC $00 $04 $82 $02 $42 $02 $41
.db $89 $7F $00 $63 $25 $31 $3F $3E $3F $CF $03 $C6 $82 $E1 $20 $02
.db $13 $02 $10 $86 $00 $1C $3E $7F $7F $7E $03 $3F $83 $1F $0F $03
.db $04 $00 $82 $38 $7F $03 $FF $B6 $7F $38 $00 $00 $03 $37 $7F $7F
.db $3F $7F $FF $00 $0C $9E $FE $FC $FC $F8 $FE $FF $63 $25 $31 $3F
.db $3E $3F $1F $FF $8F $4E $1E $7C $FC $F8 $F8 $27 $7F $FF $FF $7C
.db $33 $13 $10 $E4 $FE $FF $FF $7E $1C $08 $08 $20 $21 $42 $02 $44
.db $02 $84 $84 $FC $04 $04 $82 $02 $42 $02 $41 $81 $7F $00 $B0 $03
.db $34 $4C $44 $26 $62 $92 $9C $0C $92 $62 $64 $44 $48 $4E $71 $42
.db $24 $20 $20 $21 $31 $4E $81 $81 $42 $02 $84 $04 $0C $F2 $01 $81
.db $81 $86 $90 $8F $8F $90 $70 $01 $01 $C1 $11 $E1 $E1 $11 $0E $03
.db $11 $02 $1F $03 $3F $03 $08 $02 $F8 $03 $FC $92 $91 $A9 $86 $84
.db $4F $3F $10 $20 $19 $25 $C1 $41 $E2 $FC $08 $04 $21 $42 $02 $7C
.db $03 $FC $83 $00 $04 $82 $02 $7E $03 $7F $88 $00 $42 $24 $20 $20
.db $21 $31 $CE $03 $01 $82 $E6 $20 $02 $1F $02 $10 $8C $00 $1C $22
.db $41 $41 $42 $23 $20 $20 $10 $0C $03 $04 $00 $82 $38 $47 $03 $80
.db $B6 $47 $38 $00 $00 $03 $34 $4C $44 $26 $62 $92 $00 $0C $92 $62
.db $64 $44 $48 $4E $9C $42 $24 $20 $20 $21 $31 $1E $71 $81 $42 $02
.db $84 $04 $08 $F8 $27 $59 $81 $83 $4C $3F $1F $10 $E4 $1A $01 $81
.db $62 $FC $F8 $08 $20 $21 $42 $02 $7C $03 $FC $02 $04 $81 $82 $02
.db $7E $03 $7F $00 $17 $00 $81 $08 $07 $00 $85 $30 $08 $18 $18 $0F
.db $02 $07 $02 $00 $84 $30 $38 $38 $E0 $02 $C0 $05 $00 $02 $0E $02
.db $1E $04 $00 $02 $F0 $02 $F8 $85 $00 $08 $00 $00 $03 $02 $07 $02
.db $00 $84 $20 $00 $00 $80 $02 $C0 $04 $00 $02 $38 $02 $78 $04 $00
.db $02 $3C $02 $3E $09 $00 $02 $08 $02 $18 $81 $1F $02 $0F $3A $00
.db $81 $08 $03 $00 $85 $03 $0F $0F $00 $10 $03 $00 $83 $80 $E0 $F0
.db $04 $00 $02 $38 $02 $78 $04 $00 $02 $3C $02 $3E $81 $00 $00

; 1st entry of Pointer Table from 7653 (indexed by v_entities.6.data)
; Data from 12357 to 12AC1 (1899 bytes)
jankenTiles:
.incbin "src/graphics/janken.bin"

; Pointer Table from 12AC2 to 12ACD (6 entries, indexed by _RAM_C218_)
jankenPetrificationTable:
.dw _DATA_12ACE_ _DATA_12AD5_ _DATA_12ADC_ _DATA_12AE5_ _DATA_12AEE_ _DATA_12AF7_

; 1st entry of Pointer Table from 12AC2 (indexed by _RAM_C218_)
; Data from 12ACE to 12AD4 (7 bytes)
_DATA_12ACE_:
.db $03 $00 $64 $20 $64 $40 $64

; 2nd entry of Pointer Table from 12AC2 (indexed by _RAM_C218_)
; Data from 12AD5 to 12ADB (7 bytes)
_DATA_12AD5_:
.db $03 $60 $64 $80 $64 $A0 $64

; 3rd entry of Pointer Table from 12AC2 (indexed by _RAM_C218_)
; Data from 12ADC to 12AE4 (9 bytes)
_DATA_12ADC_:
.db $04 $A0 $6B $C0 $6B $E0 $6B $00 $6C

; 4th entry of Pointer Table from 12AC2 (indexed by _RAM_C218_)
; Data from 12AE5 to 12AED (9 bytes)
_DATA_12AE5_:
.db $04 $20 $6C $40 $6C $60 $6C $80 $6C

; 5th entry of Pointer Table from 12AC2 (indexed by _RAM_C218_)
; Data from 12AEE to 12AF6 (9 bytes)
_DATA_12AEE_:
.db $04 $A0 $6C $C0 $6C $E0 $6C $00 $6D

; 6th entry of Pointer Table from 12AC2 (indexed by _RAM_C218_)
; Data from 12AF7 to 12AFD (7 bytes)
_DATA_12AF7_:
.db $03 $C0 $68 $20 $6D $80 $66

; Data from 12AFE to 12D9D (672 bytes)
_DATA_12AFE_:
.db $00 $04 $04
.dsb 9, $00
.db $04 $0A $0A
.dsb 9, $00
.db $04 $0B $0B $00 $00 $F8 $F8 $00 $00 $00 $00 $00 $07 $08 $09 $01
.db $F8 $06 $06 $00 $00 $00 $00 $00 $0F $10 $18 $08 $FE $01 $91 $90
.db $00 $20 $20 $00 $1F $60 $6A $0A $FF $00 $40 $40 $20 $D0 $D0 $00
.db $5F $A0 $A8 $08 $FF $00 $64 $64 $20 $D0 $D0 $00 $7F $80 $AC $2C
.db $FF $00 $A0 $A0 $F0 $08 $88 $80 $7F $80 $95 $15 $FF $00 $90 $90
.db $F8 $04 $54 $50 $7F $80 $BF $3F $FF $00 $FF $FF $F8 $04 $D4 $D0
.db $7F $80 $A0 $20 $FF $00 $00 $00 $F8 $04 $34 $30 $7F $80 $BD $3D
.db $FF $00 $1E $1E $F8 $04 $B4 $B0 $7F $80 $A2 $22 $FF $00 $22 $22
.db $F8 $04 $54 $50 $3F $40 $72 $32 $FF $00 $A5 $A5 $F8 $04 $94 $90
.db $3F $40 $4F $0F $FF $00 $7E $7E $F8 $04 $14 $10 $3F $40 $62 $22
.db $FF $00 $20 $20 $F0 $08 $A8 $A0 $0F $10 $10 $00 $FF $00 $00 $00
.db $F8 $04 $04 $00 $00 $00 $00 $00 $0F $10 $17 $07 $FF $00 $FF $FF
.db $F8 $04 $E4 $E0 $00 $00 $00 $00 $07 $08 $08 $00 $FF $00 $01 $01
.db $F0 $08 $08 $00 $00 $00 $00 $00 $03 $0C $0E $02 $FF $00 $40 $40
.db $E0 $1E $7E $60 $00 $00 $00 $00 $0F $30 $35 $05 $FF $00 $FF $FF
.db $FE $01 $91 $90 $00 $80 $80 $00 $3F $40 $49 $09 $FF $00 $00 $00
.db $FF $00 $A0 $A0 $80 $40 $40 $00 $7F $80 $8A $0A $FF $00 $09 $09
.db $FF $00 $20 $20 $C0 $20 $20 $00 $7F $80 $AA $2A $FF $00 $41 $41
.db $FF $00 $24 $24 $C0 $20 $20 $00 $7F $80 $85 $05 $FF $00 $FF $FF
.db $FF $00 $90 $90 $F0 $08 $48 $40 $7F $80 $88 $08 $FF $00 $42 $42
.db $FF $00 $0C $0C $F0 $08 $08 $00 $7F $80 $D0 $50 $FF $00 $BD $BD
.db $FF $00 $42 $42 $F0 $08 $08 $00 $7F $80 $95 $15 $FF $00 $08 $08
.db $FF $00 $91 $91 $F0 $08 $28 $20 $7F $80 $91 $11 $FF $00 $08 $08
.db $FF $00 $81 $81 $F0 $08 $08 $00 $7F $80 $91 $11 $FF $00 $4A $4A
.db $FF $00 $85 $85 $F0 $08 $08 $00 $7F $80 $F1 $71 $FF $00 $48 $48
.db $FF $00 $91 $91 $F0 $08 $F8 $F0 $7F $80 $90 $10 $FF $00 $B1 $B1
.db $FF $00 $01 $01 $F0 $08 $08 $00 $7F $80 $89 $09 $FF $00 $21 $21
.db $FF $00 $21 $21 $FC $02 $02 $00 $7F $80 $88 $08 $FF $00 $1E $1E
.db $FF $00 $01 $01 $FC $02 $22 $20 $3F $40 $4F $0F $FF $00 $FF $FF
.db $FF $00 $7F $7F $FF $00 $44 $44 $0F $30 $38 $08 $FF $00 $9C $9C
.db $FF $00 $6B $6B $FF $00 $22 $22 $07 $08 $09 $01 $FF $00 $59 $59
.db $FF $00 $21 $21 $80 $40 $40 $00 $07 $08 $0A $02 $FF $00 $FF $FF
.db $FF $00 $FF $FF $80 $40 $40 $00 $0F $10 $14 $04 $FF $00 $FE $FE
.db $F8 $04 $84 $80 $C0 $20 $20 $00 $1F $20 $3F $1F $FF $00 $48 $48
.db $C0 $38 $78 $40 $E0 $10 $F0 $E0 $3F $C0 $C0 $00 $FF $00 $10 $10
.db $FC $03 $13 $10 $3F $40 $52 $12 $FF $00 $12 $12 $FC $02 $02 $00
.db $1F $20 $20 $00 $FF $00 $50 $50 $F8 $04 $04 $00 $1F $20 $3F $1F
.db $FF $00 $FF $FF $F8 $04 $FC $F8 $3F $40 $40 $00 $FF $00 $14 $14
.db $FC $02 $02 $00 $7F $80 $84 $04 $FF $00 $10 $10 $FE $01 $01 $00
.db $7F $80 $80 $00 $FF $00 $90 $90 $FE $01 $11 $10 $00 $FF $FF $00
.db $00 $FF $FF $00 $00 $FF $FF $00

.INCLUDE "data/nametables/title.asm"
titleScreenTiles:
.INCBIN "src/data/titleScreen.bin"

.BANK 5
.ORG $0000

.INCLUDE "data/metatileNametablePointers.asm"

; Data from 14400 to 1440F (16 bytes)
_DATA_14400_:
.db $73 $A8 $A4 $A8 $74 $A8 $75 $A8 $A5 $A8 $A6 $A8 $76 $A8 $77 $A8

; Data from 14410 to 1441F (16 bytes)
_DATA_14410_:
.db $73 $88 $A4 $88 $74 $88 $75 $88 $A5 $88 $A6 $88 $76 $88 $77 $88

; Data from 14420 to 1444F (48 bytes)
_DATA_14420_:
.db $39 $80 $3A $80 $3A $82 $39 $82 $3B $00 $00 $06 $00 $06 $3C $10
.db $3C $02 $00 $06 $00 $06 $3C $10 $3D $00 $00 $06 $00 $06 $3C $10
.db $3C $02 $00 $06 $00 $06 $3C $10 $3D $00 $00 $06 $00 $06 $3C $10

.INCLUDE "data/metatileNametableEntries.asm"

.INCLUDE "data/demoInputEntries.asm"

; Data from 1508E to 153F2 (869 bytes)
shopNametableEntries:
.db $04 $29 $83 $2A $2B $2C $12 $2D $83 $2C $2B $2A $07 $29 $82 $2E
.db $2F $16 $2D $82 $2F $2E $05 $29 $82 $30 $31 $18 $2D $82 $31 $30
.db $03 $29 $83 $32 $33 $34 $18 $35 $F7 $34 $33 $32 $29 $29 $36 $34
.db $34 $37 $2D $37 $2D $37 $2D $37 $2D $37 $2D $37 $2D $37 $2D $37
.db $2D $37 $2D $37 $2D $37 $2D $37 $2D $34 $34 $36 $29 $29 $36 $34
.db $38 $39 $2D $39 $2D $39 $2D $39 $2D $39 $2D $39 $2D $39 $2D $39
.db $2D $39 $2D $39 $2D $39 $2D $39 $2D $38 $34 $36 $29 $29 $36 $34
.db $3A $37 $2D $37 $2D $37 $2D $37 $2D $37 $2D $37 $2D $37 $2D $37
.db $2D $37 $2D $37 $2D $37 $2D $37 $2D $3A $34 $36 $29 $29 $36 $34
.db $3B $39 $2D $39 $2D $39 $2D $39 $2D $39 $2D $39 $2D $39 $2D $39
.db $97 $2D $39 $2D $39 $2D $39 $2D $39 $2D $3B $34 $36 $29 $29 $36
.db $3C $3D $3E $2D $3E $2D $3E $3F $0C $40 $94 $3F $2D $37 $2D $37
.db $2D $3D $3C $36 $29 $29 $36 $3C $3D $41 $2D $41 $2D $41 $42 $0C
.db $29 $94 $42 $2D $39 $2D $39 $2D $3D $3C $36 $29 $29 $36 $34 $3B
.db $43 $2D $43 $2D $43 $42 $0C $29 $94 $42 $2D $37 $2D $37 $2D $3B
.db $34 $36 $29 $29 $36 $34 $3A $44 $2D $44 $2D $44 $42 $0C $29 $94
.db $42 $2D $39 $2D $39 $2D $3A $34 $36 $29 $29 $36 $34 $38 $45 $2D
.db $45 $2D $45 $42 $0C $29 $94 $42 $2D $37 $2D $37 $2D $38 $34 $36
.db $29 $29 $36 $34 $34 $41 $2D $41 $2D $41 $42 $0C $29 $94 $42 $2D
.db $39 $2D $39 $2D $34 $34 $36 $29 $29 $36 $34 $34 $43 $2D $43 $2D
.db $43 $46 $0C $47 $F7 $46 $2D $37 $2D $37 $2D $34 $34 $36 $29 $29
.db $36 $34 $38 $44 $2D $44 $2D $44 $2D $39 $2D $39 $2D $39 $2D $39
.db $2D $39 $2D $39 $2D $39 $2D $4D $4E $4F $2D $38 $34 $36 $29 $29
.db $36 $34 $3A $45 $2D $45 $2D $45 $2D $37 $2D $37 $2D $37 $2D $37
.db $2D $37 $2D $37 $2D $37 $2D $50 $51 $52 $2D $3A $34 $36 $29 $29
.db $36 $34 $3B $41 $2D $41 $2D $41 $2D $39 $2D $39 $2D $39 $2D $39
.db $2D $39 $2D $39 $2D $39 $2D $53 $54 $55 $2D $3B $34 $36 $29 $29
.db $36 $3C $3D $43 $2D $43 $2D $43 $2D $37 $2D $37 $AB $2D $37 $2D
.db $37 $2D $37 $2D $37 $2D $37 $2D $56 $57 $58 $2D $3D $3C $36 $29
.db $29 $36 $3C $3D $44 $2D $44 $2D $44 $2D $39 $2D $39 $2D $39 $2D
.db $39 $2D $39 $2D $39 $2D $39 $59 $05 $5A $F7 $5B $36 $29 $48 $49
.db $48 $49 $48 $49 $48 $49 $4A $49 $48 $49 $48 $49 $48 $49 $48 $49
.db $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $4B $4C
.db $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C
.db $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $48 $49
.db $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $48 $49
.db $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $48 $49 $4B $4C
.db $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C
.db $4B $4C $8C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $4B $4C $00
.db $81 $80 $18 $00 $03 $02 $03 $00 $82 $80 $80 $1A $00 $86 $02 $02
.db $00 $00 $80 $80 $1B $00 $85 $02 $02 $00 $80 $80 $1C $00 $84 $02
.db $02 $80 $80 $1D $00 $83 $02 $80 $80 $1B $00 $85 $02 $00 $02 $80
.db $80 $03 $00 $9D $06 $00 $06 $00 $06 $00 $06 $00 $06 $00 $06 $00
.db $06 $00 $06 $00 $06 $00 $06 $00 $06 $00 $06 $00 $02 $00 $02 $80
.db $80 $1B $00 $85 $02 $00 $02 $80 $80 $15 $00 $81 $02 $05 $00 $03
.db $02 $85 $80 $80 $00 $04 $04 $12 $00 $81 $02 $05 $00 $88 $06 $06
.db $02 $80 $80 $00 $00 $04 $12 $00 $8E $02 $00 $06 $00 $06 $00 $06
.db $00 $02 $80 $80 $00 $00 $04 $12 $00 $81 $02 $05 $00 $88 $06 $00
.db $02 $80 $80 $00 $00 $04 $12 $00 $81 $02 $05 $00 $85 $06 $00 $02
.db $80 $80 $15 $00 $81 $02 $07 $00 $83 $02 $80 $80 $15 $00 $85 $02
.db $00 $06 $00 $06 $03 $00 $83 $02 $80 $80 $1B $00 $85 $02 $00 $02
.db $80 $80 $1B $00 $85 $02 $00 $02 $80 $80 $1B $00 $85 $02 $00 $02
.db $80 $80 $09 $00 $8D $06 $00 $06 $00 $06 $00 $06 $00 $06 $00 $06
.db $00 $06 $05 $00 $03 $02 $85 $80 $80 $00 $04 $04 $1A $00 $81 $02
.db $77 $80 $0A $80 $00

; Data from 153F3 to 157FF (1037 bytes)
_DATA_153F3_:
.incbin "src/data/shopInterior.bin"

; Data from 15800 to 1583F (64 bytes)
_DATA_15800_:
.db $71 $60 $72 $60 $73 $60 $71 $62 $74 $60 $75 $60 $76 $60 $77 $60
.db $78 $60 $79 $60 $7A $60 $78 $62 $7B $60 $70 $60 $70 $60 $7B $62
.db $7C $60 $70 $60 $70 $60 $7C $62 $7C $60 $70 $60 $70 $60 $7C $62
.db $7C $60 $70 $60 $70 $60 $7C $62 $7C $60 $70 $60 $70 $60 $7C $62

; Data from 15840 to 15923 (228 bytes)
_DATA_15840_:
.db $09 $00 $02 $7F $05 $60 $81 $00 $02 $FF $06 $00 $02 $FF $05 $00
.db $08 $60 $10 $00 $08 $06 $08 $60 $10 $00 $10 $60 $00 $08 $00 $84
.db $FF $80 $80 $9F $04 $90 $84 $FF $00 $00 $FF $04 $00 $84 $FF $00
.db $00 $FF $04 $04 $08 $90 $07 $00 $81 $02 $04 $08 $03 $10 $81 $20
.db $08 $09 $81 $90 $03 $94 $94 $95 $92 $91 $9F $04 $04 $88 $91 $62
.db $8C $F0 $00 $22 $42 $E1 $11 $08 $04 $03 $00 $04 $91 $02 $92 $82
.db $94 $98 $08 $90 $00 $09 $00 $02 $7F $81 $60 $04 $6F $84 $00 $FF
.db $FF $00 $04 $FF $84 $00 $FF $FF $00 $04 $FF $07 $6F $81 $7F $10
.db $FF $08 $F6 $08 $6F $04 $FF $84 $FE $FC $F0 $00 $03 $FF $85 $1F
.db $0F $07 $03 $00 $04 $6F $02 $6E $82 $6C $68 $08 $60 $00 $08 $00
.db $81 $FF $02 $80 $05 $9F $81 $FF $02 $00 $06 $FF $02 $00 $81 $FF
.db $04 $FB $07 $9F $81 $8F $07 $FF $81 $FD $04 $F7 $03 $EF $81 $DF
.db $08 $F9 $81 $9F $03 $9B $92 $9A $9D $9E $90 $FB $FB $77 $6E $9C
.db $70 $00 $00 $DD $BD $1E $0E $07 $03 $02 $00 $04 $9E $02 $9C $81
.db $98 $09 $90 $00

.INCLUDE "data/nametables/hirotaStoneCloseUp.asm"
.INCLUDE "graphics/hirotaStoneCloseUp.asm"

.INCLUDE "data/nametables/map.asm"
mapTiles:
.incbin "src/graphics/map.bin"

; Data from 16F11 to 16F50 (64 bytes)
_DATA_16F11_:
.db $00 $38 $38 $00 $00 $44 $7C $38 $00 $92 $FE $6C $00 $AA $EE $44
.db $00 $92 $FE $6C $00 $74 $7C $08 $00 $24 $3C $18 $00 $28 $38 $10
.db $00 $28 $38 $10 $00 $28 $38 $10 $00 $28 $38 $10 $00 $28 $38 $10
.db $00 $28 $38 $10 $00 $28 $38 $10 $00 $28 $38 $10 $00 $38 $38 $00

; Data from 16F51 to 16F70 (32 bytes)
_DATA_16F51_:
.db $07 $01 $00 $00 $3F $01 $00 $00 $7F $01 $00 $00 $3F $C1 $80 $40
.db $07 $F9 $C0 $38 $40 $BF $B9 $07 $78 $87 $87 $00 $7C $83 $83 $03

; Data from 16F71 to 16FB0 (64 bytes)
_DATA_16F71_:
.db $79 $86 $86 $06 $79 $86 $86 $06 $7F $80 $80 $00 $7E $81 $81 $01
.db $7F $80 $80 $00 $3E $41 $41 $01 $06 $39 $39 $01 $00 $07 $07 $00
.db $9E $61 $61 $60 $9E $61 $61 $60 $3E $C1 $C1 $C0 $7E $81 $81 $80
.db $FE $01 $01 $00 $7C $82 $82 $80 $60 $9C $9C $80 $00 $E0 $E0 $00

; Data from 16FB1 to 17030 (128 bytes)
_DATA_16FB1_:
.dsb 9, $00
.db $03 $03 $00 $00 $0C $0C $03 $06 $10 $10 $09 $09 $21 $21 $16 $13
.db $23 $23 $0C $16 $46 $46 $29
.dsb 9, $00
.db $80 $80 $00 $00 $60 $60 $80 $00 $10 $10 $E0 $00 $08 $08 $F0 $80
.db $88 $88 $70 $C0 $C4 $C4 $38 $06 $46 $46 $39 $0F $4F $4F $30 $0C
.db $2C $2C $13 $00 $20 $20 $1F $20 $10 $10 $0F $7C $00 $00 $03 $7F
.db $00 $00 $00 $3F $00 $00 $00 $C0 $C4 $C4 $38 $E0 $E4 $E4 $18 $60
.db $68 $68 $90 $00 $08 $08 $F0 $08 $10 $10 $E0 $7C $00 $00 $80 $FC
.db $00 $00 $00 $F8 $00 $00 $00

; Data from 17031 to 170B0 (128 bytes)
_DATA_17031_:
.dsb 9, $00
.db $03 $03 $00 $00 $0F $0C $03 $06 $19 $10 $09 $08 $37 $27 $17 $10
.db $2F $26 $0F $10 $6F $46 $2F
.dsb 9, $00
.db $80 $80 $00 $00 $E0 $60 $80 $00 $F0 $10 $E0 $00 $F8 $C8 $F0 $00
.db $F8 $68 $F0 $00 $FC $64 $F8 $00 $7F $47 $3F $00 $7F $46 $3F $00
.db $3F $26 $1F $00 $3F $27 $1F $20 $1F $10 $0F $7C $03 $00 $03 $7F
.db $00 $00 $00 $3F $00 $00 $00 $00 $FC $C4 $F8 $00 $FC $64 $F8 $00
.db $F8 $68 $F0 $00 $F8 $C8 $F0 $08 $F0 $10 $E0 $7C $80 $00 $80 $FC
.db $00 $00 $00 $F8 $00 $00 $00

; Data from 170B1 to 170F0 (64 bytes)
_DATA_170B1_:
.db $00 $03 $03 $00 $03 $04 $04 $00 $04 $0B $0B $03 $08 $17 $16 $07
.db $10 $2F $2C $0F $38 $57 $56 $07 $3C $5B $5B $03 $7F $B8 $B8 $00
.db $00 $C0 $C0 $00 $C0 $20 $20 $00 $20 $D0 $D0 $C0 $10 $E8 $68 $E0
.db $08 $F4 $34 $F0 $1C $EA $6A $E0 $1C $FA $FA $E0 $FE $1D $1D $00

; Data from 170F1 to 17190 (160 bytes)
_DATA_170F1_:
.db $78 $B7 $B7 $00 $70 $A8 $A8 $00 $30 $48 $48 $00 $30 $48 $48 $00
.db $18 $26 $26 $00 $0E $11 $11 $00 $03 $0C $0C $00 $00 $03 $03
.dsb 18, $00
.db $06 $06 $00 $06 $0F $0F $00 $0E $1F $1F $00 $10 $2F $2F
.dsb 26, $00
.db $E0 $E0 $00 $E0 $FC $FC $00 $10 $2F $2F $07 $00 $3F $3F $1F $10
.db $6F $6F $09 $36 $C9 $C9 $00 $4B $84 $84 $00 $48 $87 $87 $00 $30
.db $CC $CC $00 $00 $78 $78 $00 $00 $FE $FE $3C $1E $E1 $E1 $C0 $30
.db $CE $CE $80 $2C $D3 $D3 $80 $3A $C1 $C1 $00 $12 $21 $21 $00 $0C
.db $33 $33 $00 $00 $1E $1E $00

; Data from 17191 to 17210 (128 bytes)
_DATA_17191_:
.db $00 $01 $01 $00 $00 $07 $06 $00 $00 $0F $08 $00 $00 $1F $10 $00
.db $09 $1F $10 $00 $0B $1C $10 $00 $0A $1D $11 $00 $07 $0F $00 $00
.db $00 $C0 $C0 $00 $00 $F0 $30 $00 $00 $F8 $08 $00 $80 $FC $04 $00
.db $C8 $FC $04 $00 $E8 $9C $04 $00 $A8 $DC $44 $00 $F0 $78 $88 $00
.db $03 $07 $04 $00 $06 $08 $09 $00 $08 $10 $17 $00 $08 $14 $17 $00
.db $08 $1C $17 $00 $00 $0C $0F $00 $03 $07 $07 $00 $00 $07 $07 $00
.db $E0 $F0 $10 $00 $B0 $88 $C8 $00 $08 $04 $F4 $00 $08 $14 $F4 $00
.db $08 $9C $F4 $00 $00 $98 $F8 $00 $60 $F0 $F0 $00 $00 $70 $70 $00

; Data from 17211 to 17290 (128 bytes)
_DATA_17211_:
.db $7E $01 $01 $00 $00 $03 $03 $00 $00 $0C $0C $00 $00 $10 $10 $00
.db $08 $20 $20 $00 $00 $20 $20 $00 $20 $70 $50 $00 $20 $7F $5F $00
.db $7E $80 $80 $00 $00 $C0 $C0 $00 $C0 $30 $30 $00 $20 $08 $08 $00
.db $10 $04 $04 $00 $10 $04 $04 $00 $10 $0E $0E $04 $08 $FE $F6 $04
.db $1F $7F $7F $00 $38 $77 $77 $00 $30 $4B $4B $00 $09 $36 $36 $00
.db $02 $24 $24 $00 $02 $04 $04 $00 $01 $06 $06 $00 $00 $03 $03 $00
.db $EC $FE $F2 $00 $00 $FE $FE $00 $10 $C0 $C0 $00 $A0 $40 $40 $00
.db $40 $20 $20 $00 $40 $20 $20 $00 $80 $60 $60 $00 $00 $C0 $C0 $00

; Data from 17291 to 172B0 (32 bytes)
_DATA_17291_:
.db $00 $00 $00 $00 $66 $00 $00 $00 $FF $00 $00 $00 $66 $00 $00 $00
.db $FF $00 $00 $00 $66 $00 $00 $00 $66 $00 $00 $00 $3C $00 $00 $00

; Data from 172B1 to 17852 (1442 bytes)
_DATA_172B1_:
.incbin "src/data/4bppCharacters.bin"

; 1st entry of Pointer Table from 1620 (indexed by v_sixFrameLevelTileIndex)
; Data from 17853 to 17892 (64 bytes)
_DATA_17853_:
.db $00 $00 $00 $00 $00 $00 $00 $00 $05 $05 $82 $87 $00 $00 $FF $FF
.db $22 $22 $DD $FF $00 $00 $FF $FF $00 $00 $FF $FF $00 $00 $FF $FF
.db $18 $10 $00 $10 $62 $22 $9C $BE $08 $08 $F7 $FF $00 $00 $FF $FF
.db $00 $00 $FF $FF $00 $00 $FF $FF $10 $10 $EF $FF $00 $00 $FF $FF

; 2nd entry of Pointer Table from 1620 (indexed by v_sixFrameLevelTileIndex)
; Data from 17893 to 178D2 (64 bytes)
_DATA_17893_:
.db $00 $00 $00 $00 $00 $00 $01 $01 $14 $14 $0B $1F $00 $00 $FF $FF
.db $04 $04 $FB $FF $00 $00 $FF $FF $00 $00 $FF $FF $00 $00 $FF $FF
.db $20 $00 $40 $40 $98 $90 $60 $F0 $22 $22 $DC $FE $08 $08 $F7 $FF
.db $00 $00 $FF $FF $20 $20 $DF $FF $00 $00 $FF $FF $00 $00 $FF $FF

; 3rd entry of Pointer Table from 1620 (indexed by v_sixFrameLevelTileIndex)
; Data from 178D3 to 17912 (64 bytes)
_DATA_178D3_:
.db $04 $00 $02 $02 $19 $09 $06 $0F $44 $44 $3B $7F $10 $10 $EF $FF
.db $00 $00 $FF $FF $00 $00 $FF $FF $02 $02 $FD $FF $00 $00 $FF $FF
.db $00 $00 $00 $00 $00 $00 $E0 $E0 $28 $28 $D0 $F8 $00 $00 $FF $FF
.db $20 $20 $DF $FF $00 $00 $FF $FF $00 $00 $FF $FF $00 $00 $FF $FF

; 4th entry of Pointer Table from 1620 (indexed by v_sixFrameLevelTileIndex)
; Data from 17913 to 17952 (64 bytes)
_DATA_17913_:
.db $18 $08 $00 $08 $46 $44 $39 $7D $10 $10 $EF $FF $00 $00 $FF $FF
.db $00 $00 $FF $FF $00 $00 $FF $FF $04 $04 $FB $FF $00 $00 $FF $FF
.db $00 $00 $00 $00 $00 $00 $00 $00 $A0 $A0 $41 $E1 $00 $00 $FF $FF
.db $44 $44 $BB $FF $00 $00 $FF $FF $00 $00 $FF $FF $00 $00 $FF $FF

; 1st entry of Pointer Table from 162C (indexed by v_sixFrameLevelTileIndex)
; Data from 17953 to 17992 (64 bytes)
_DATA_17953_:
.dsb 20, $00
.db $83 $87 $83 $04 $CC $FF $FE $33 $97 $FF $9F $68
.dsb 12, $00
.db $18 $10 $18 $08 $CA $7E $FA $B4 $99 $FE $9F $67 $35 $FF $7D $CA
.db $CE $FF $FF $31

; 2nd entry of Pointer Table from 162C (indexed by v_sixFrameLevelTileIndex)
; Data from 17993 to 179D2 (64 bytes)
_DATA_17993_:
.dsb 16, $00
.db $01 $00 $01 $01 $1D $13 $1D $0E $A2 $FF $BB $5D $89 $FF $CF $76
.dsb 12, $00
.db $60 $20 $60 $40 $30 $F8 $F8 $C8 $CE $FC $FE $32 $40 $FF $CE $BF
.db $AF $FF $BF $50

; 3rd entry of Pointer Table from 162C (indexed by v_sixFrameLevelTileIndex)
; Data from 179D3 to 17A12 (64 bytes)
_DATA_179D3_:
.dsb 12, $00
.db $06 $04 $06 $02 $0C $1F $1F $13 $73 $3F $7F $4C $02 $FF $73 $FD
.db $F5 $FF $FD $0A
.dsb 16, $00
.db $80 $00 $80 $80 $B8 $C8 $B8 $70 $45 $FF $DD $BA $91 $FF $F3 $6E

; 4th entry of Pointer Table from 162C (indexed by v_sixFrameLevelTileIndex)
; Data from 17A13 to 17A52 (64 bytes)
_DATA_17A13_:
.dsb 12, $00
.db $18 $08 $18 $10 $53 $7E $5F $2D $99 $7F $F9 $E6 $AC $FF $BE $53
.db $73 $FF $FF $8C
.dsb 20, $00
.db $C1 $E1 $C1 $20 $33 $FF $7F $CC $E9 $FF $F9 $16

; 1st entry of Pointer Table from 1638 (indexed by v_fourFrameLevelTileIndex)
; Data from 17A53 to 17AB2 (96 bytes)
_DATA_17A53_:
.dsb 24, $00
.db $03 $07 $00 $07 $07 $0E $01 $0E $07 $0C $03 $0C $0E $1C $03 $1C
.db $FF $FF $00 $FF $F7 $FF $00 $FF $FF $FF $00 $FF $5D $FF $00 $FF
.db $EA $FF $00 $FF $55 $FF $00 $FF $60 $30 $C0 $30 $F0 $38 $C0 $38
.db $FF $FF $00 $FF $BF $FF $00 $FF $EF $FF $00 $FF $55 $FF $00 $FF
.db $BA $FF $00 $FF $D5 $FF $00 $FF

; 2nd entry of Pointer Table from 1638 (indexed by v_fourFrameLevelTileIndex)
; Data from 17AB3 to 17B12 (96 bytes)
_DATA_17AB3_:
.db $00 $00 $00 $00 $00 $00 $00 $00 $01 $03 $00 $03 $07 $0C $03 $0C
.db $0F $08 $07 $08 $0E $18 $07 $18 $0C $10 $0F $10 $0C $10 $0F $10
.db $1E $38 $07 $38 $FF $FC $03 $FC $FF $FF $00 $FF $F7 $FF $00 $FF
.db $FF $FF $00 $FF $5D $FF $00 $FF $EA $FF $00 $FF $55 $FF $00 $FF
.db $78 $1C $E0 $1C $FF $3F $C0 $3F $FF $FF $00 $FF $BF $FF $00 $FF
.db $EF $FF $00 $FF $55 $FF $00 $FF $BA $FF $00 $FF $D5 $FF $00 $FF

; 3rd entry of Pointer Table from 1638 (indexed by v_fourFrameLevelTileIndex)
; Data from 17B13 to 17B72 (96 bytes)
_DATA_17B13_:
.db $01 $03 $00 $03 $07 $0E $01 $0E $0F $08 $07 $08 $0E $10 $0F $10
.db $1C $10 $0F $10 $1C $10 $0F $10 $1E $30 $0F $30 $3F $38 $07 $38
.db $FF $FC $03 $FC $FF $FF $00 $FF $FF $FF $00 $FF $F7 $FF $00 $FF
.db $FF $FF $00 $FF $5D $FF $00 $FF $EA $FF $00 $FF $55 $FF $00 $FF
.db $FF $3F $C0 $3F $FF $FF $00 $FF $FF $FF $00 $FF $BF $FF $00 $FF
.db $EF $FF $00 $FF $55 $FF $00 $FF $BA $FF $00 $FF $D5 $FF $00 $FF

; 4th entry of Pointer Table from 1638 (indexed by v_fourFrameLevelTileIndex)
; Data from 17B73 to 17BD2 (96 bytes)
_DATA_17B73_:
.db $00 $00 $00 $00 $00 $00 $00 $00 $48 $48 $24 $48 $34 $24 $12 $24
.db $16 $16 $00 $16 $02 $02 $00 $02 $00 $00 $00 $00 $1A $08 $12 $08
.db $0F $1C $03 $1C $07 $0E $01 $0E $FF $FF $00 $FF $F7 $FF $00 $FF
.db $FF $FF $00 $FF $5D $FF $00 $FF $EA $FF $00 $FF $55 $FF $00 $FF
.db $F0 $38 $C0 $38 $E0 $70 $80 $70 $FF $FF $00 $FF $BF $FF $00 $FF
.db $EF $FF $00 $FF $55 $FF $00 $FF $BA $FF $00 $FF $D5 $FF $00 $FF

; 1st entry of Pointer Table from 1640 (indexed by v_fourFrameLevelTileIndex)
; Data from 17BD3 to 17C32 (96 bytes)
_DATA_17BD3_:
.dsb 25, $00
.db $03 $04 $07 $01 $06 $08 $0F $03 $04 $08 $0F $03 $0C $10 $1E $00
.db $FF $00 $FF $00 $F7 $08 $FF $00 $FF $00 $FF $00 $5D $A2 $FF $00
.db $EA $15 $FF $00 $55 $AA $FF $C0 $20 $10 $70 $C0 $30 $08 $F8 $00
.db $FF $00 $FF $00 $BF $40 $FF $00 $EF $10 $FF $00 $55 $AA $FF $00
.db $BA $45 $FF $00 $D5 $2A $FF

; 2nd entry of Pointer Table from 1640 (indexed by v_fourFrameLevelTileIndex)
; Data from 17C33 to 17C92 (96 bytes)
_DATA_17C33_:
.dsb 9, $00
.db $01 $02 $03 $03 $04 $08 $0F $07 $08 $00 $0F $07 $08 $10 $1E $0F
.db $00 $10 $1C $0F $00 $10 $1C $07 $18 $20 $3E $03 $FC $00 $FF $00
.db $FF $00 $FF $00 $F7 $08 $FF $00 $FF $00 $FF $00 $5D $A2 $FF $00
.db $EA $15 $FF $00 $55 $AA $FF $E0 $18 $04 $7C $C0 $3F $00 $FF $00
.db $FF $00 $FF $00 $BF $40 $FF $00 $EF $10 $FF $00 $55 $AA $FF $00
.db $BA $45 $FF $00 $D5 $2A $FF

; 3rd entry of Pointer Table from 1640 (indexed by v_fourFrameLevelTileIndex)
; Data from 17C93 to 17CF2 (96 bytes)
_DATA_17C93_:
.db $00 $01 $02 $03 $01 $06 $08 $0F $07 $08 $00 $0F $0F $00 $10 $1E
.db $0F $10 $00 $1C $0F $10 $00 $1C $0F $10 $20 $3E $07 $38 $00 $3F
.db $03 $FC $00 $FF $00 $FF $00 $FF $00 $FF $00 $FF $00 $F7 $08 $FF
.db $00 $FF $00 $FF $00 $5D $A2 $FF $00 $EA $15 $FF $00 $55 $AA $FF
.db $C0 $3F $00 $FF $00 $FF $00 $FF $00 $FF $00 $FF $00 $BF $40 $FF
.db $00 $EF $10 $FF $00 $55 $AA $FF $00 $BA $45 $FF $00 $D5 $2A $FF

; 4th entry of Pointer Table from 1640 (indexed by v_fourFrameLevelTileIndex)
; Data from 17CF3 to 17D52 (96 bytes)
_DATA_17CF3_:
.db $00 $00 $00 $00 $12 $24 $00 $24 $02 $24 $00 $26 $00 $03 $00 $03
.db $10 $23 $00 $23 $08 $10 $00 $18 $00 $00 $00 $00 $09 $04 $00 $0D
.db $01 $06 $08 $0F $00 $03 $04 $07 $00 $FF $00 $FF $00 $F7 $08 $FF
.db $00 $FF $00 $FF $00 $5D $A2 $FF $00 $EA $15 $FF $00 $55 $AA $FF
.db $C0 $30 $08 $F8 $80 $60 $10 $F0 $00 $FF $00 $FF $00 $BF $40 $FF
.db $00 $EF $10 $FF $00 $55 $AA $FF $00 $BA $45 $FF $00 $D5 $2A $FF

; 1st entry of Pointer Table from 1648 (indexed by v_fourFrameLevelTileIndex)
; Data from 17D53 to 17DB2 (96 bytes)
_DATA_17D53_:
.dsb 24, $00
.db $03 $04 $07 $07 $07 $08 $0F $0E $07 $08 $0F $0C $0E $10 $1F $1C
.db $FF $00 $FF $FF $F7 $08 $FF $FF $FF $00 $FF $FF $5D $A2 $FF $FF
.db $EA $15 $FF $FF $55 $AA $FF $FF $60 $10 $F0 $30 $F0 $08 $F8 $38
.db $FF $00 $FF $FF $BF $40 $FF $FF $EF $10 $FF $FF $55 $AA $FF $FF
.db $BA $45 $FF $FF $D5 $2A $FF $FF

; 2nd entry of Pointer Table from 1648 (indexed by v_fourFrameLevelTileIndex)
; Data from 17DB3 to 17E12 (96 bytes)
_DATA_17DB3_:
.db $00 $00 $00 $00 $00 $00 $00 $00 $01 $02 $03 $03 $07 $08 $0F $0C
.db $0F $00 $0F $08 $0E $10 $1F $18 $0C $10 $1F $10 $0C $10 $1F $10
.db $1E $20 $3F $38 $FF $00 $FF $FC $FF $00 $FF $FF $F7 $08 $FF $FF
.db $FF $00 $FF $FF $5D $A2 $FF $FF $EA $15 $FF $FF $55 $AA $FF $FF
.db $78 $04 $FC $1C $FF $00 $FF $3F $FF $00 $FF $FF $BF $40 $FF $FF
.db $EF $10 $FF $FF $55 $AA $FF $FF $BA $45 $FF $FF $D5 $2A $FF $FF

; 3rd entry of Pointer Table from 1648 (indexed by v_fourFrameLevelTileIndex)
; Data from 17E13 to 17E72 (96 bytes)
_DATA_17E13_:
.db $01 $02 $03 $03 $07 $08 $0F $0E $0F $00 $0F $08 $0E $10 $1F $10
.db $1C $00 $1F $10 $1C $00 $1F $10 $1E $20 $3F $30 $3F $00 $3F $38
.db $FF $00 $FF $FC $FF $00 $FF $FF $FF $00 $FF $FF $F7 $08 $FF $FF
.db $FF $00 $FF $FF $5D $A2 $FF $FF $EA $15 $FF $FF $55 $AA $FF $FF
.db $FF $00 $FF $3F $FF $00 $FF $FF $FF $00 $FF $FF $BF $40 $FF $FF
.db $EF $10 $FF $FF $55 $AA $FF $FF $BA $45 $FF $FF $D5 $2A $FF $FF

; 4th entry of Pointer Table from 1648 (indexed by v_fourFrameLevelTileIndex)
; Data from 17E73 to 17FFF (397 bytes)
_DATA_17E73_:
.db $00 $00 $00 $00 $00 $00 $00 $00 $48 $00 $6C $48 $34 $00 $36 $24
.db $16 $00 $16 $16 $02 $00 $02 $02 $00 $00 $00 $00 $1A $00 $1A $08
.db $0F $10 $1F $1C $07 $08 $0F $0E $FF $00 $FF $FF $F7 $08 $FF $FF
.db $FF $00 $FF $FF $5D $A2 $FF $FF $EA $15 $FF $FF $55 $AA $FF $FF
.db $F0 $08 $F8 $38 $E0 $10 $F0 $70 $FF $00 $FF $FF $BF $40 $FF $FF
.db $EF $10 $FF $FF $55 $AA $FF $FF $BA $45 $FF $FF $D5 $2A
.dsb 303, $FF

.BANK 6
.ORG $0000

.INCLUDE "data/levels/layouts.asm"

; Pointer Table from 1BDB9 to 1BDCC (10 entries, indexed by unknown)
_DATA_1BDB9_:
.dw _DATA_1BDF1_ _DATA_1BDED_ _DATA_1BDE9_ _DATA_1BDE5_ _DATA_1BDE1_ _DATA_1BDDD_ _DATA_1BDD9_ _DATA_1BDD5_
.dw _DATA_1BDD1_ _DATA_1BDCD_

; 10th entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDCD to 1BDD0 (2 entries, indexed by unknown)
_DATA_1BDCD_:
.dw _RAM_CCF4_ _DATA_1BDF5_

; 9th entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDD1 to 1BDD4 (2 entries, indexed by unknown)
_DATA_1BDD1_:
.dw _RAM_CCF8_ _DATA_1BDFD_

; 8th entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDD5 to 1BDD8 (2 entries, indexed by unknown)
_DATA_1BDD5_:
.dw _RAM_CCE0_ _DATA_1BE05_

; 7th entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDD9 to 1BDDC (2 entries, indexed by unknown)
_DATA_1BDD9_:
.dw _RAM_CCF0_ _DATA_1BE0D_

; 6th entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDDD to 1BDE0 (2 entries, indexed by unknown)
_DATA_1BDDD_:
.dw _RAM_CCEC_ _DATA_1BE15_

; 5th entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDE1 to 1BDE4 (2 entries, indexed by unknown)
_DATA_1BDE1_:
.dw _RAM_CCD8_ _DATA_1BE1D_

; 4th entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDE5 to 1BDE8 (2 entries, indexed by unknown)
_DATA_1BDE5_:
.dw _RAM_CCE4_ _DATA_1BE25_

; 3rd entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDE9 to 1BDEC (2 entries, indexed by unknown)
_DATA_1BDE9_:
.dw _RAM_CCDC_ _DATA_1BE2D_

; 2nd entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDED to 1BDF0 (2 entries, indexed by unknown)
_DATA_1BDED_:
.dw _RAM_CCE8_ _DATA_1BE35_

; 1st entry of Pointer Table from 1BDB9 (indexed by unknown)
; Pointer Table from 1BDF1 to 1BDF4 (2 entries, indexed by unknown)
_DATA_1BDF1_:
.dw _RAM_CCD4_ _DATA_1BE3D_

; 2nd entry of Pointer Table from 1BDCD (indexed by unknown)
; Data from 1BDF5 to 1BDFC (8 bytes)
_DATA_1BDF5_:
.db $D1 $28 $D2 $28 $D3 $28 $D4 $28

; 2nd entry of Pointer Table from 1BDD1 (indexed by unknown)
; Data from 1BDFD to 1BE04 (8 bytes)
_DATA_1BDFD_:
.db $D5 $48 $D6 $48 $D7 $48 $D8 $48

; 2nd entry of Pointer Table from 1BDD5 (indexed by unknown)
; Data from 1BE05 to 1BE0C (8 bytes)
_DATA_1BE05_:
.db $D9 $68 $DA $68 $DB $68 $DC $68

; 2nd entry of Pointer Table from 1BDD9 (indexed by unknown)
; Data from 1BE0D to 1BE14 (8 bytes)
_DATA_1BE0D_:
.db $CC $88 $00 $88 $CD $88 $00 $88

; 2nd entry of Pointer Table from 1BDDD (indexed by unknown)
; Data from 1BE15 to 1BE1C (8 bytes)
_DATA_1BE15_:
.db $CE $A8 $CE $AA $CF $A8 $D0 $A8

; 2nd entry of Pointer Table from 1BDE1 (indexed by unknown)
; Data from 1BE1D to 1BE24 (8 bytes)
_DATA_1BE1D_:
.db $EC $08 $ED $08 $EE $08 $EF $08

; 2nd entry of Pointer Table from 1BDE5 (indexed by unknown)
; Data from 1BE25 to 1BE2C (8 bytes)
_DATA_1BE25_:
.db $F0 $08 $F1 $08 $F2 $08 $F3 $08

; 2nd entry of Pointer Table from 1BDE9 (indexed by unknown)
; Data from 1BE2D to 1BE34 (8 bytes)
_DATA_1BE2D_:
.db $DD $E8 $DE $E8 $DF $E8 $DF $EA

; 2nd entry of Pointer Table from 1BDED (indexed by unknown)
; Data from 1BE35 to 1BE3C (8 bytes)
_DATA_1BE35_:
.db $F4 $C8 $F5 $C8 $F6 $C8 $F7 $C8

; 2nd entry of Pointer Table from 1BDF1 (indexed by unknown)
; Data from 1BE3D to 1BE44 (8 bytes)
_DATA_1BE3D_:
.db $F8 $08 $F9 $E8 $FA $08 $FB $E8

.INCLUDE "data/shop.asm"

; Unused
.dsb 85, $FF

.BANK 7
.ORG $0000

.INCLUDE "graphics/score.asm"

.INCLUDE "graphics/tiles.asm"

.INCLUDE "data/messages.asm"

.INCLUDE "data/palettes.asm"

.db $40 $00 $40 $02 $41 $60 $42 $60 $43 $60 $43 $60 $40 $00 $40 $02
.db $40 $00 $40 $02 $3D $80 $3E $80 $3D $80 $3E $80 $3E $80 $3D $80
.db $3E $80 $3D $80 $3D $80 $3E $80 $3D $80 $3E $80 $3E $80 $3D $80
.db $3E $80 $3D $80 $3D $80 $3E $80 $3D $80 $3E $80 $3E $80 $3D $80
.db $3E $80 $3D $80 $41 $60 $42 $60 $41 $60 $42 $60 $43 $60 $43 $60
.db $43 $60 $43 $60 $4D $00 $4D $02 $3D $80 $3E $80 $3E $80 $3D $80
.db $3D $80 $3E $80 $3E $80 $3D $80 $3D $80 $3E $80 $3E $80 $3D $80
.db $3D $80 $3E $80 $3E $80 $3D $80 $3D $80 $3E $80 $3E $80 $3D $80
.db $3D $80 $3E $80 $3E $80 $3D $80 $00 $00 $00 $00 $00 $00 $00 $00
.db $4D $00 $4D $02 $00 $00 $00 $00 $00 $00 $00 $00 $4D $00 $4D $02
.db $00 $00 $00 $00 $00 $00 $00 $00 $40 $60 $41 $60 $40 $60 $41 $60
.db $40 $60 $41 $60 $40 $60 $41 $60 $40 $60 $41 $60 $40 $60 $41 $60
.db $40 $60 $41 $60 $40 $60 $41 $60 $42 $60 $42 $60 $42 $60 $42 $60
.db $42 $60 $42 $60 $42 $60 $42 $60 $42 $60 $42 $60 $42 $60 $42 $60
.db $42 $60 $42 $60 $42 $60 $42 $60

.dsb 122, $FF

