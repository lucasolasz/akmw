; 77th entry of Jump Table from 2892 (indexed by _RAM_CF80_)
updateEntity0x4D:
    bit 0, (ix+1)
    jr nz, +
    set 0, (ix+1)
    ld (ix+23), $F0
    ld (ix+7), <_DATA_8C0E_
    ld (ix+8), >_DATA_8C0E_
    ld (ix+15), $00
    ld (ix+16), $00
    ld (ix+17), $00
    ld (ix+18), $00
    ret

+:
    ld a, (ix+9)
    or (ix+10)
    jp nz, clearCurrentEntity
    ld iy, v_entity1
    call checkEntityCollision
    jr c, +
    ld a, $8F
    ld (v_soundControl), a
    ld hl, v_lives
    ld a, (hl)
    add a, $01
    daa
    ld (hl), a
    jp clearCurrentEntity

+:
    dec (ix+23)
    jp z, clearCurrentEntity
    ret
