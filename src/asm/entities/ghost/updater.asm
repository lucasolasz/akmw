; 79th entry of Jump Table from 2892 (indexed by _RAM_CF80_)
updateGhost:
	bit 0, (ix+1)
	jr nz, +

    ; Initialize
	set 0, (ix + Entity.flags)
	ld (ix + Entity.unknown6), $80
	ld (ix + Entity.animationTimer), $18
	ld (ix + Entity.animationTimerResetValue), $18

+:
    ; Clear if offscreen
	ld a, (ix + Entity.isOffScreenFlags.low)
	or (ix + Entity.isOffScreenFlags.high)
	jp nz, clearCurrentEntity

    ; Wait before start moving
	bit 1, (ix + Entity.flags)
	jp nz, +
	dec (ix + Entity.unknown6)
	jr nz, ++
	set 1, (ix + Entity.flags)

+:
    ; Skip if alex is dead
	ld a, (v_entities.1.state)
	cp ALEX_DEAD
	ret z

    ; @TODO: Disassembly both calls below
    ; Jump to table $7DA8 indexed by _RAM_C054_
	call _LABEL_7D99_
    ; Calculate x/y speed to pursuit Alex
	call _LABEL_4DAD_
	ld (ix + Entity.xSpeed.high), h
	ld (ix + Entity.xSpeed.low), l
	ld (ix + Entity.ySpeed.high), d
	ld (ix + Entity.ySpeed.low), e

    ; Choose animation descriptor based on alex position
	ld hl, _DATA_8C6C_
	ld a, (v_entities.1.xPos.high)
	cp (ix + Entity.xPos.high)
	jp nc, handleEntityAnimation
++:
	ld hl, _DATA_8C2A_
	jp handleEntityAnimation