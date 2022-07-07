#bits 16

steps = 4 * 16

END     = 0;
PCInc   = 1 << 0 ; Increment PC control bit
PCOut   = 1 << 1 ; Move PC to Adress bus
PCIn    = 1 << 2 ; Move Data bus value to PC
MR      = 1 << 3 ; Read Memory to Data bus
RaIn    = 1 << 4 ; Move Data bus value to Ra
RbIn    = 1 << 5 ; Move Data bus value to Ra
AROut   = 1 << 6 ; Move AR to Address bus
ARIn    = 1 << 7 ; Move Data bus value to AR
IRIn    = 1 << 8 ; Move Data bud value to IR

fetch = (PCOut | MR | IRIn | PCInc)

#ruledef
{
    noop    =>  (fetch)`16 @ (PCInc)`16 @ (END)`16        ; noop
    moveimm =>  (fetch)`16 @ (PCOut | MR | RaIn | PCInc)`16 @ (END)`16
    movemem =>  (fetch)`16 @ (PCOut | ARIn)`16 @ (AROut | MR | RaIn | PCInc)`16 @ (END)`16
}

#align steps
noop
#align steps
moveimm
#align steps
movemem