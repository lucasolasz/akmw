; 60th entry of Jump Table from 2892 (indexed by _RAM_CF80_)
updateMoneyBag:
    ; Skip initialization if its already done
    bit 0, (ix + Entity.flags)
    jr nz, +

    ; Initialize
    set 0, (ix + Entity.flags)
    ld (ix + Entity.xSpeed.low), $00
    ld (ix + Entity.xSpeed.high), $00
    ld (ix + Entity.ySpeed.low), $00
    ld (ix + Entity.ySpeed.high), $00
    ld (ix + Entity.battleDecision), MONEY_BAG_LIFESPAN

    ; Set sprite descriptor and money value according to bag type.
    ld (ix + Entity.spriteDescriptorPointer.low), <bigMoneyBagSpriteDescriptor
    ld (ix + Entity.spriteDescriptorPointer.high), >bigMoneyBagSpriteDescriptor
    ld (ix + Entity.unknown5), $03
    ld a, (ix + Entity.unknown6)
    cp $04
    ret c
    ld (ix + Entity.spriteDescriptorPointer.low), <smallMoneyBagSpriteDescriptor
    ld (ix + Entity.spriteDescriptorPointer.high), >smallMoneyBagSpriteDescriptor
    ld (ix + Entity.unknown5), $00
    ret

+:
    ; Destroy if offscreen
    ld a, (ix + Entity.isOffScreenFlags.low)
    or (ix + Entity.isOffScreenFlags.high)
    jp nz, destroyCurrentEntity

    ; Take money if colliding with Alex
    ld iy, v_alex
    call checkEntityCollision
    jp c, +
    ld l, (ix + Entity.unknown5)
    call takeMoney

    ; Play money bag sound
    ld a, SOUND_COINS
    ld (v_soundControl), a
    jp destroyCurrentEntity

+:
    ; Decrement timer
    dec (ix + Entity.battleDecision)
    jp z, destroyCurrentEntity
    ret
