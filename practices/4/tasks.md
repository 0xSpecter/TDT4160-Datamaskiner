# Tasks

## 1

[Task skeleton](./skeletons/task-1.S)

A helper `malloc` function is provided for this task

```riscv
malloc:
    la t0, _heap_end
    lw t1, 0(t0)
    add t2, t1, a0
    sw t2, 0(t0)
    mv a0, t2
    li a7, 214 
    ecall
    mv a0, t1
    ret
```

```riscv
# Length is given in a0

allocate_sequence:
    slli a0, a0, 2 # Calc length in bytes
     
    addi sp, sp, -8 # Allocate space on stack
    sw ra, 4(sp) # Store return address
    sw a0, 0(sp) # Store byte length
      
    call malloc # Allocate space on heap, start address at a0
    
    lw ra, 4(sp) # Load return address
    lw t0, 0(sp) # Load byte length

    addi sp, sp, 8 # Free space on stack
    
    add t1, a0, t0 # Calc end address
    
    mv t3, a0 # Assign pointer to start of array
    li t4, 1 # Start counter at 1
    
    loop:
        beq t3, t1, done # If pointer equals end, stop
        
        sw t4, 0(t3) # Store counter value in array
        
        addi t3, t3, 4 # Increment pointer one word
        addi t4, t4, 1 # Increment counter by 1
        
        j loop # Repeat
    
    done:
        ret
```

## 2

[Task skeleton](./skeletons/task-2.S)

A hepler function `rand` is provided for this task

```riscv
rand:
    addi sp, sp, -4
    sw ra, 0(sp)

    la t0, _rand_state
    lw t1, 0(t0)

    li t2, 1103515245 
    li t3, 12345      

    mul t4, t1, t2
    add t5, t4, t3

    mul t6, t5, t2
    add a0, t6, t3

    mul a1, a0, t2
    add a2, a1, t3

    mul a3, a2, t2
    add a4, a3, t3

    mul a5, a4, t2
    add a6, a5, t3

    sw a6, 0(t0)

    andi a0, a0, 255
    andi a2, a2, 255
    andi a4, a4, 255
    andi a6, a6, 255
    mv a7, a0
    slli a7, a7, 8
    or a7, a7, a2
    slli a7, a7, 8
    or a7, a7, a4
    slli a7, a7, 8
    or a7, a7, a6

    mv a0, a7

    lw ra, 0(sp)
    addi sp, sp, 4

    ret
```

Uses the stack to avoid repeated stores to s0-s1.

```riscv
fill_random:    
    slli t0, a1, 2 # Calc length in bytes
    add t0, t0, a0 # Calc end of array

    addi sp, sp, -12 # Allocate space on stack
    
    sw ra, 8(sp) # Store return address
    sw a0, 4(sp) # Store start address
    sw t0, 0(sp) # Store end address
    
    loop:
        lw t0, 4(sp) # Get pointer
        lw t1, 0(sp) # Get end
        
        beq t0, t1, done # Branch if pointer is equal to end
        
        call rand # Calc random number, in a0
        
        lw t0, 4(sp) # Get pointer, was clobered by rand
        
        sw a0, 0(t0) # Add random number to array
        
        addi t0, t0, 4 # Move pointer one word forward
        sw t0, 4(sp) # Reassign pointer in stack
        
        j loop # Repeat
    
    done:
        lw ra, 8(sp) # Get return address
        addi sp, sp, 12 # Free space on stack
    
        ret
```
