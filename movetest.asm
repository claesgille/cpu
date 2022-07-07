#bits 16

#subruledef reg
{
    r0 => 0
    r1 => 1
    r2 => 2
    r3 => 3
    r4 => 4
    r5 => 5
    r6 => 6
    r7 => 7
}

#ruledef
{
    noop                        => 0`2 @ 0`3 @ 0`3 @ 0`8
    move {rd:reg}, #{value}     => 0`2 @ 0`3 @ rd`3 @ 1`8 @ value`16
    move {rd:reg}, {adress}     => 0`2 @ 0`3 @ rd`3 @ 2`8 @ adress`16
    move {rd:reg}, {rs:reg}     => 0`2 @ rs`3 @ rd`3 @ 3`8
    stor {rs:reg}, {address}    => 0`2 @ rs`3 @ 0`3 @ 4`8 @ adress`16
    add  {rd:reg}, #{value}     => 0`2 @ 0`3 @ rd`3 @ 5`8 @ value`16
    add  {rd:reg}, {adress}     => 0`2 @ 0`3 @ rd`3 @ 6`8 @ adress`16
    add  {rd:reg}, {rs:reg}     => 0`2 @ rs`3 @ rd`3 @ 7`8
    jump {adress}               => 0`2 @ 0`3 @ 0`3 @ 8`8 @ adress`16
    jump {rd:reg}               => 0`2 @ 0`3 @ rd`3 @ 9`8 @ adress`16

    
}

movetest:
    move r7, #0xFEFE
    noop
