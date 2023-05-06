.globl loopadd
loopadd:
    stp X29, X30, [sp, #-32]!
    stp x0, x1, [sp, #16] // store x0 address ptr and x1 length to stack
    ldr x0, [sp, #24] // 0x24 是长度的参数栈地址
    .loop:
    bl printint
    ldr x0, [sp, #24] // call完 printint之后 x0会变更，需要回复栈上的值
    sub x0, x0, #1
    str x0, [sp, #24] // 将变更后的长度参数放入对应栈空间
    cmp x0, #0
    BGT .loop
    .exit:
    ldp x0, x1, [sp, #16] // restore x0 and x1 parameters
    ldp x29, x30, [sp] // 将FP, LR恢复回来
    add sp, sp, #32 // 施放申请的栈空间
    ret
printint:
    sub sp, sp, #32 // 申请32字节栈空间
    stp X29, X30, [sp, #16] // X29(FP 栈底) X30(LR 返回保存起来)从sp偏移16的位置开始往上存，存储完结果是[X30][X29][0][0][SP]
    add X29, sp, #16
    str X0, [sp, #8] // store first parameter
    adrp x0, .L.str
    add x0, x0, :lo12:.L.str // 获取字符串基地址
    ldr x1, [sp, #8]
    bl printf
    mov w8, wzr
    // 函数体结束
    mov w0, w8  // return 0
    ldp x29, x30, [sp, #16] // 将FP, LR恢复回来
    add sp, sp, #32 // 施放申请的栈空间
    ret // return
.L.str:
    .asciz  "int value = %d\n"
    .size   .L.str, 14    