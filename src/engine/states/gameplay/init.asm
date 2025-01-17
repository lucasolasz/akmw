initGameplayState:
    call clearVDPTablesAndDisableScreen
    call clearEntities

    ld a, $82
    ld (Mapper_Slot2), a

    call audioEngine.reset

    ; TODO: Clear level data
    ld hl, v_levelWidth
    ld de, v_levelWidth + 1
    ld bc, $002A
    ld (hl), $00
    ldir

    ld a, ENTITY_ARRAY_SIZE
    ld (v_entitydataArrayLength), a

    ld hl, v_entities
    ld (v_entitydataArrayPointer), hl

    call loadLevelPalette
    call loadLevelSpriteTiles

    ; Load Rice Ball tiles
    ld hl, _DATA_1F0A9_
    ld de, $61A0
    ld bc, $0060
    call copyBytesToVRAM

    ; Load Money Bag tiles
    ; TODO: Also loads an extra tile
    ld hl, _DATA_1D349_
    ld de, $66C0
    ld bc, $0100
    call copyBytesToVRAM

    ; Now we handle the level spawn state. If it is zero, then no action is
    ; needed. If it is $01 then Alex will spawn riding the Boat. Else, he will
    ; spawn flying the peticopter

    ; Get level spawn state
    ld a, (v_level)
    ld hl, levelSpawnStates - 1
    ld c, a
    ld b, $00
    add hl, bc
    ld a, (hl)

    ; if state != 0
    or a
    jp z, @endif
        ; if state == 1
        cp $01
        jp nz, @else2
            ld a, $01
            ld (v_shouldSpawnRidingBoat_RAM_C051_), a
            jp @endif2
        @else2:
            ld a, ALEX_C054_FLYING_PETICOPTER
            ld (v_alexActionState), a
        @endif2:

        ; Load bullet tiles.
        ld hl, _DATA_1DB29_
        ld de, $6200
        ld bc, $0020
        call copyBytesToVRAM
        ld hl, _DATA_1D429_
        ld de, $6220
        ld bc, $01C0
        call copyBytesToVRAM
    @endif:

    ; Load text character tiles
    ld a, $85
    ld (Mapper_Slot2), a
    ld de, $5600
    ld hl, _DATA_172B1_
    call decompressTilesToVram

    ; Load boxes tiles
    ld a, $83
    ld (Mapper_Slot2), a
    ld hl, _DATA_C000_
    ld de, $4020
    ld bc, $0480
    call copyBytesToVRAM

    call loadLevelTiles
    call loadLevel

    ; Load shop door offset and nametable address for the level
    ld a, (v_level)
    ld hl, shopDoorsConfigs - 3
    ld c, a
    add a, a
    add a, c
    ld c, a
    ld b, $00
    add hl, bc

    ld a, (hl)
    ld (v_shopDoorOffset), a

    inc hl
    ld a, (hl)
    inc hl
    ld h, (hl)
    ld l, a
    ld (v_shopDoorNametablePointer), hl

    ld a, $82
    ld (Mapper_Slot2), a

    ; Load entity descriptor pointer for the level
    ld a, (v_level)
    ld hl, entitiesDescriptorsPointers - 2
    call loadAthPointer
    ld (v_entityDescriptorsPointer), hl

    xor a
    ld (_RAM_C08E_), a
    ld (v_hasBattleStarted), a

    ; Clear $600 bytes (1.5KB) starting from $D900
    ld hl, v_metatileDeletesTable
    ld (hl), $00
    ld de, v_metatileDeletesTable + 1
    ld bc, $05FF
    ldir

    ; Jump to initGameplayStateSecondary if level is less than $0B (12)
    ld a, (v_level)
    cp $0B
    jp c, initGameplayStateSecondary

    ; Jump to _LABEL_BF3_ if level is greater than $0B (12)
    jp nz, _LABEL_BF3_

    ; If we reach here, the current level is theRadactianCastle

    ; TODO
    ld a, $01
    ld (_RAM_C08E_), a

    ; Copy persistent metatile deletes variables to RAM.
    ; 
    ; y/x    0    1    2    3    4    5    6    7
    ; 0   d900 d920 d940 d960 d980 d9a0 d9c0 d9e0
    ; 1   da00 da20 d940 d960 d980 d9a0 d9c0 d9e0
    ; 2   db00 db20 db40 db60 db80 dba0 dbc0 dbe0
    ; 3   dc00 dc20 dc40 dc60 dc80 dca0 dcc0 dce0
    ; 4   dd00 dd20 dd40 dd60 dd80 dda0 ddc0 dde0
    ; 5   de00 de20 de40 de60 de80 dea0 dec0 dee0

    ; TODO: Name variables and data.
    ld hl, radactianCastleMetatileDeletes
    ld b, $05
    ld de, v_metatileDeletesTable

    ---:
        ld (targetBase_RAM_C07A_), de
        ld (targetBlock_RAM_C07A_), de
    
        --:
            push bc
            ld a, (hl)
            or a
            inc hl

            ; If length is not zero
            jp z, @endif3
                ; Increment length to account for length byte.
                inc a
                dec hl
                -:
                    ldi
                    inc de
                    dec a
                jp nz, -
            @endif3:

            ex de, hl
            ld hl, (targetBlock_RAM_C07A_)
            ld bc, $0020
            add hl, bc
            ld (targetBlock_RAM_C07A_), hl
            ex de, hl
            pop bc
        djnz --
    
        ld a, (hl)
        cp $FF
        jp z, initGameplayStateSecondary
        ex de, hl
        ld hl, (targetBase_RAM_C07A_)
        ld bc, $0100
        add hl, bc
        ld (targetBase_RAM_C07A_), hl
        ex de, hl
        ld b, $05
    jp ---

; @TODO
_LABEL_BF3_:
    ; Jump to initGameplayStateSecondary if level is not $10 (16, CraggLake)
    cp $10
    jp nz, initGameplayStateSecondary

    ; If we reach here, level is CraggLake
    ld a, $01
    ld (_RAM_C08E_), a
    ld hl, craggLakeMetatileDeletes
    ld b, $07
    ld de, v_metatileDeletesTable

    ---:
        ld (targetBase_RAM_C07A_), de
        ld (targetBlock_RAM_C07A_), de

        --:
            push bc
            ld a, (hl)
            or a
            inc hl

            ; If length is not zero
            jp z, @endif
                ; Increment length to account for length byte.
                inc a
                dec hl
                -:
                    ldi
                    inc de
                    dec a
                jp nz, -
            @endif:

            ex de, hl
            ld hl, (targetBlock_RAM_C07A_)
            ld bc, $0020
            add hl, bc
            ld (targetBlock_RAM_C07A_), hl
            ex de, hl
            pop bc
        djnz --

        ld a, (hl)
        cp $FF
        jp z, initGameplayStateSecondary
        ex de, hl
        ld hl, (targetBase_RAM_C07A_)
        ld bc, $0100
        add hl, bc
        ld (targetBase_RAM_C07A_), hl
        ex de, hl
        ld b, $07
    jp ---

initGameplayStateSecondary:
    ; Spawn Alex
    ld ix, v_alex
    ld (ix + Entity.type), ENTITY_ALEX

    ; Set Alex starting position
    ld a, (v_level)
    add a, a
    ld c, a
    ld b, $00
    ld hl, startingPositions - 2
    add hl, bc
    ld a, (hl)
    ld (ix + Entity.xPos.high), a
    inc hl
    ld a, (hl)
    ld (ix + Entity.yPos.high), a

    call updateAlexSpawning
    call updateEntities

    ; Load palette updater
    ld a, (v_level)
    ld hl, paletteUpdatersPointers - 2
    call loadAthPointer
    ld (paletteUpdaterPointer), hl

    ; Load tile updater
    ld hl, levelTileUpdatersPointers - 2
    ld a, (v_level)
    add a, a
    ld e, a
    ld d, $00
    add hl, de
    ld a, (hl)
    inc hl
    ld h, (hl)
    ld l, a
    ld (v_levelTileUpdaterPointer), hl

    ; Set tile update timer
    ld a, $01
    ld (v_levelTileUpdateTimer), a

    ; Load scroll flag updater
    ld a, (v_level)
    ld hl, scrollFlagsUpdatersPointers - 2
    call loadAthPointer
    ld (scrollFlagsUpdaterPointer), hl

    ; Load entity loader
    ; @TODO: Maybe change to entitySpawner
    ld a, (v_level)
    ld hl, entityLoadersPointers - 2
    call loadAthPointer
    ld (v_entityLoaderPointer), hl

    ; Load Question Mark Box index
    ; @TODO: Understand v_questionMarkBoxIndex better
    ld a, (v_level)
    ld c, a
    ld b, $00
    ld hl, levelQuestionMarkBoxIndexes - 1
    add hl, bc
    ld a, (hl)
    ld (v_questionMarkBoxIndex), a

    ld a, $80 | :_DATA_1EFC9_
    ld (Mapper_Slot2), a

    ; Load Ghost left and right tiles
    ld hl, _DATA_1EFC9_
    ld de, $6400
    ld bc, $00E0
    call copyBytesToVRAM
    ld hl, _DATA_1EFC9_
    ld bc, $00E0
    call copyMirroredTilesToVramAtCurrentAddress

    ; Load 1up tiles
    ld a, $80 | :_DATA_17191_
    ld (Mapper_Slot2), a
    ld hl, _DATA_17191_
    ld de, $65C0
    ld bc, $0080
    call copyBytesToVRAM

    ; Load Power Bracelet tiles
    ld hl, _DATA_170B1_
    ld de, $6640
    ld bc, $0060
    call copyBytesToVRAM
    ld hl, _DATA_170F1_
    ld bc, $0020
    call copyMirroredTilesToVramAtCurrentAddress

    ; Request level BGM
    ld a, $82
    ld (Mapper_Slot2), a
    ld a, (v_level)
    ld c, a
    ld b, $00
    ld hl, levelSongs - 1
    add hl, bc
    ld a, (hl)
    ld (v_soundControl), a

    ; Mark state as inititalized
    ld hl, v_gameState
    set 7, (hl)

    ; Enable interrupts and display
    ei
    jp enableDisplay
