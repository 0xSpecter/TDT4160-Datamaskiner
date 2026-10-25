# Tasks

## 1

[Task skeleton](./skeletons/task-1.S)

```riscv
collatz:
    slli a1, a0, 31
    bne a1, zero, odd
    srli a0, a0, 1

    ret

    odd:
        slli a2, a0, 1
        add a0, a2, a0
        addi a0, a0, 1

        ret
```

## 2

[Task skeleton](./skeletons/task-2.S)

```riscv
median:
     slt a3, a0, a1
     
     slt a5, a0, a2
   
      beq a3, a5, ax # if equal then a is smallest or largest
        ret      
      
      ax:
           slt a4, a1, a2
             beq a3, a4, bmid
             add a0, a2, zero
             ret
     
     bmid:
         add a0, a1, zero
     
    ret
```

## 3

[Task skeleton](./skeletons/task-3.S)

```riscv
fibonacci:
    mv a2, zero
    mv a3, zero
    addi a4, zero, 1
    beqz a0, skip
    
    loop:
        add a2, a3, a4
        mv a4, a3
        mv a3, a2
        addi a0, a0, -1
        bnez a0, loop
    
    skip: 
    
    mv a0, a2
    
    ret
```
