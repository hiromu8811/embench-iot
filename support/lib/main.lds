
OUTPUT_ARCH("riscv")

ENTRY(_start)

SECTIONS
{
    . = 0x00000000;
    .init : 
    {
        *(.init)
    }

    .text :
    {
        *(.text)
    }

    .rodata :
    {
        *(.rodata)
    }

    .bss :
    {
        *(.bss)
    }

    .data :
    {
        *(.data)
    }
    
}
