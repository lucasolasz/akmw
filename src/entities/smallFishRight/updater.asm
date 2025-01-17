; 52nd entry of Jump Table from 2892 (indexed by _RAM_CF80_)
updateSmallFishRight:
    ld a, (ix + Entity.isOffScreenFlags.low)
    or (ix + Entity.isOffScreenFlags.high)
    jr nz, +
    call tryToKillAlexIfColliding
    call isAlexAttackingEntity
    jp nc, killEnemy
    ld de, $0110
    ld a, $08
    call isEntityCollidingWithTerrainAtOffset
    jr nc, +
    ld (ix + Entity.type), ENTITY_SMALL_FISH_LEFT
    ld (ix + Entity.xSpeed.high), $FF
    ld (ix + Entity.xSpeed.low), $A0
+:
    ld hl, smallFishRightAnimationDescriptor
    jp handleEntityAnimation
