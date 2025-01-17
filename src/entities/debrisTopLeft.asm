; 56th entry of Jump Table from 2892 (indexed by _RAM_CF80_)
updateDebrisTopLeft:
    bit 0, (ix + Entity.flags)
    jr nz, updateDebris

    ; Initialize top left debris
    set 0, (ix + Entity.flags)
    set 1, (ix + Entity.flags)
    ld (ix + Entity.xSpeed.high), $FF
    ld (ix + Entity.xSpeed.low), $80
    ld (ix + Entity.ySpeed.high), $FF
    ld (ix + Entity.ySpeed.low), $80
    ld (ix + Entity.animationTimer), $08
    ld (ix + Entity.animationTimerResetValue), $08
    ld a, (ix + Entity.unknown6)

    ; Create the other 3 debris entities
    ld de, _sizeof_Entity
    ld iy, v_entities.24
    ld (iy + Entity.type), ENTITY_DEBRIS_BOTTOM_LEFT
    ld (iy + Entity.unknown6), a
    res 0, (iy + Entity.flags)
    set 1, (iy + Entity.flags)

    add iy, de
    ld (iy + Entity.type), ENTITY_DEBRIS_TOP_RIGHT
    ld (iy + Entity.unknown6), a
    res 0, (iy + Entity.flags)
    set 1, (iy + Entity.flags)
    
    add iy, de
    ld (iy + Entity.type), ENTITY_DEBRIS_BOTTOM_RIGHT
    ld (iy + Entity.unknown6), a
    res 0, (iy + Entity.flags)
    set 1, (iy + Entity.flags)
    jr +

updateDebris:
    ; Destroy debris if offscreen
    ld a, (ix + Entity.xPos.high)
    cp $F8
    jp nc, destroyCurrentEntity
    ld a, (ix + Entity.isOffScreenFlags.low)
    or (ix + Entity.isOffScreenFlags.high)
    jp nz, destroyCurrentEntity

    ld h, (ix + Entity.ySpeed.high)
    ld l, (ix + Entity.ySpeed.low)
    ld de, DEBRIS_GRAVITY
    add hl, de
    ld (ix + Entity.ySpeed.high), h
    ld (ix + Entity.ySpeed.low), l
+:
    ld a, (ix + Entity.unknown6)
    ld hl, _DATA_5D8C_
    rst loadAthPointer
    jp handleEntityAnimation
