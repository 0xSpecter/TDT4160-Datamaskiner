# Tasks

## 1

[Task skeleton](./skeletons/task-1.S)

```riscv
flip_array:
    
    slli a1, a1, 2 # scale length
    add a2, a0, a1 # get end of array
    addi a2, a2, -4
 
 loop:
     lw a3, 0(a0) # get left element
     lw a4, 0(a2) # get right element
     
     sw a3, 0(a2) # store left in right
     sw a4, 0(a0) # store right in left
     
     addi a0, a0 4 # move left to right
     addi a2, a2, -4 # move right to left
     
     blt a0, a2, loop
 
    ret
```

## 2

[Task skeleton](./skeletons/task-2.S)

```riscv
sum_binary_tree:
    addi sp, sp, -8 # alocate space
    sw a0, 0(sp) # store first root
    sw x0, 4(sp) # store determin end
    
    mv a0, x0 # sum

    loop:
        lw t0, 0(sp) # get pointer
        addi sp, sp, 4 # move sp back
        
        beq t0, x0, done # branch to done if done
        
        lw t1, 0(t0) # get value of pointer
        add a0, a0, t1 # add value to sum
        
        left:
            lw t2, 4(t0) # load left pointer
            beq t2, x0, right
            addi sp, sp, -4 # reserve space
            sw t2, 0(sp) # store left pointer to stack
        
        right:
            lw t3, 8(t0) # load right pointer
            beq t3, x0, loop
            addi sp, sp, -4 # reserve space
            sw t3, 0(sp) # store left pointer to stack
        
        j loop
    
    done:
        ret
```
