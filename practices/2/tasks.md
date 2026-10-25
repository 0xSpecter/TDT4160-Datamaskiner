# Tasks

## 1

[Task skeleton](./skeletons/task-1.S)

```riscv
sum_array:
    add a2, zero, zero #sum
    slli a1, a1, 2
    add a5, a0, a1
    add a3, a0, zero

    loop:
        lw a4, 0(a3)
        addi a3, a3, 4
        add a2, a2, a4
        bne a3, a5, loop

    add a0, a2, zero

    ret
```

## 2

[Task skeleton](./skeletons/task-2.S)

```riscv
sum_linked_list:
     mv a2, a0
     mv a0, zero

    loop:
        lw a1, 0(a2)
        lw a2, 4(a2)
        
        add a0, a0, a1
        bnez a2, loop
   
    ret
```
