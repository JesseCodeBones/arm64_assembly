.globl printint
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