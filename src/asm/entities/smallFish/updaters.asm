; 48th entry of Jump Table from 2892 (indexed by _RAM_CF80_)
updateSmallFishLeft:
	bit 0, (ix+1)
	jr nz, +
	set 0, (ix+1)
	ld (ix+20), $04
	ld (ix+5), $10
	ld (ix+6), $10
	jr ++

+:
	ld a, (ix+9)
	or (ix+10)
	jr nz, ++
	ld (ix+16), $FF
	ld (ix+15), $A0
	set 1, (ix+1)
	call _LABEL_7D99_
	call _LABEL_7D0B_
	jp nc, _LABEL_55A5_
	ld de, $0100
	ld a, $08
	call _LABEL_3A03_
	jr nc, ++
	ld (ix+0), ENTITY_SMALL_FISH_RIGHT
	ld (ix+16), $00
	ld (ix+15), $60
++:
	ld hl, _DATA_8BD2_
	jp handleEntityAnimation

; 52nd entry of Jump Table from 2892 (indexed by _RAM_CF80_)
updateSmallFishRight:
	ld a, (ix+9)
	or (ix+10)
	jr nz, +
	call _LABEL_7D99_
	call _LABEL_7D0B_
	jp nc, _LABEL_55A5_
	ld de, $0110
	ld a, $08
	call _LABEL_3A03_
	jr nc, +
	ld (ix+0), ENTITY_SMALL_FISH_LEFT
	ld (ix+16), $FF
	ld (ix+15), $A0
+:
	ld hl, _DATA_8C4B_
	jp handleEntityAnimation