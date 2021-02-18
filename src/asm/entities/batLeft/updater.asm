updateBatLeft:
	bit 0, (ix + Entity.flags)
	jr nz, +
	ld a, (ix + Entity.isOffScreenFlags.low)
	or (ix + Entity.isOffScreenFlags.high)
	jp nz, _LABEL_4F7C_
	set 0, (ix + Entity.flags)
	ld a, (ix + Entity.yPos.high)
	ld (ix + Entity.unknown5), a
	ld (ix + Entity.animationTimer), $08
	ld (ix + Entity.animationTimerResetValue), $08
+:
	ld a, (ix + Entity.isOffScreenFlags.low)
	or (ix + Entity.isOffScreenFlags.high)
	jp nz, clearCurrentEntity
	set 1, (ix + Entity.flags)
	ld (ix + Entity.xSpeed.high), $FF
	ld (ix + Entity.xSpeed.low), $80
	call tryToKillAlexIfColliding
	call _LABEL_7D0B_
	jp nc, _LABEL_55A5_
	ld de, $0100
	call getTileNearEntityWithXYOffset
	rlca
	jr nc, _LABEL_4F43_
	ld (ix + Entity.type), ENTITY_BAT_RIGHT
	ld (ix + Entity.xSpeed.high), $00
	ld (ix + Entity.xSpeed.low), $80
_LABEL_4F43_:
	inc (ix+24)
	ld a, (ix+24)
	cp $40
	jr nz, +
	xor a
	ld (ix+24), a
+:
	ld hl, _DATA_524F_
	ld c, a
	ld b, $00
	add hl, bc
	ld h, (hl)
	ld de, (v_verticalScrollSpeed)
	ld a, d
	cpl
	inc a
	ld d, a
	ld a, e
	cpl
	inc a
	ld e, a
	ld a, h
	ld h, (ix + Entity.unknown5)
	ld l, (ix + Entity.jankenMatchDecision)
	add hl, de
	ld (ix + Entity.unknown5), h
	ld (ix + Entity.jankenMatchDecision), l
	add a, h
	cp $C0
	jp nc, clearCurrentEntity
	ld (ix + Entity.yPos.high), a
_LABEL_4F7C_:
	ld hl, _DATA_8BBD_
	jp handleEntityAnimation