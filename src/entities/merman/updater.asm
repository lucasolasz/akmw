; 35th entry of Jump Table from 2892 (indexed by _RAM_CF80_)
updateMerman:
    bit 0, (ix + Entity.flags)
    jr nz, +
    ld (ix + Entity.animationTimer), $0A
    ld (ix + Entity.animationTimerResetValue), $0A
    ld a, (ix + Entity.isOffScreenFlags.low)
    or (ix + Entity.isOffScreenFlags.high)
    jr nz, ++
    set 0, (ix + Entity.flags)
    ld (ix + Entity.ySpeed.high), $FF
    ld (ix + Entity.ySpeed.low), $C0
    set 1, (ix + Entity.flags)
+:
    call tryToKillAlexIfColliding
    call isAlexAttackingEntity
    jr nc, +++
-:
    inc (ix + Entity.battleDecision)
    ld a, (ix + Entity.battleDecision)
    cp $C0
    jr nz, ++
    ld (ix + Entity.battleDecision), $00
    ld a, (ix + Entity.ySpeed.high)
    cpl
    ld (ix + Entity.ySpeed.high), a
    ld a, (ix + Entity.ySpeed.low)
    cpl
    inc a
    ld (ix + Entity.ySpeed.low), a
    call spawnMermanBubbles
++:
    ld hl, _DATA_8211_
    jp handleEntityAnimation

+++:
    ld a, (v_alex.unknown8)
    bit 3, a
    jr z, -
    res 3, a
    ld (v_alex.unknown8), a
    inc (ix + Entity.data)
    ld a, (ix + Entity.data)
    cp $03
    jp nc, killEnemy
    jr -
