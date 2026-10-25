# Denne filen inneholder skjelettet til Oppgave 1 på Praktisk Øving 3 i TDT4160
j tests

########################################################################################
######################## Skriv koden din under denne linja #############################
########################################################################################

# I denne oppgaven skal du snu en liste med 32-bits tall i minnet
# Hvis f.eks. listen er [1, 2, 4, 6, 9] før funksjonen kalles,
# skal listen være [9, 6, 4, 2, 1] etterpå.
# Funksjonen tar inn en peker til første element i listen i a0,
# og lengden på listen i a1.
# Funksjonen returnerer ingenting, men listen må være oppdatert.
flip_array:

    # TODO: Implementasjon

    # Forlater flip_array-funksjonen her
    ret

########################################################################################
######################## Skriv koden din over denne linja ##############################
########################################################################################

tests:

    #### Tester flip_array-funksjonen ####
    la a0, flip0       # Adressen til lista
    li a1, 5           # Lengden til lista
    call flip_array
    la a0, flip0
    la a1, flipped0
    li a2, 5
    call flip_array_check

    la a0, flip1       # Adressen til lista
    li a1, 6           # Lengden til lista
    call flip_array
    la a0, flip1
    la a1, flipped1
    li a2, 6
    call flip_array_check

    #### Alle tester bestått! ####
    j all_tests_passed

flip_array_check:
    # a0 is given array
    # a1 is expected array
    li t2, 0 # Loop counter

flip_array_check_loop:
    beq t2, a2, flip_array_check_done

    lw t0, 0(a0)
    lw t1, 0(a1)
    bne t0, t1, flip_array_failed

    addi a0, a0, 4
    addi a1, a1, 4
    addi t2, t2, 1
    j flip_array_check_loop

flip_array_check_done:
    ret

flip_array_failed:
    la a0, wrong_flip_array
    li a7, 4 # Print string
    ecall
    mv a0, t2 # Loop index
    li a7, 1 # Print int
    ecall
    la a0, wrong_flip_array_2
    li a7, 4 # Print string
    ecall
    mv a0, t0
    li a7, 1 # Print int
    ecall
    la a0, expected
    li a7, 4 # Print string
    ecall
    mv a0, t1
    li a7, 1 # Print int
    ecall
    j abort

abort:
    # Exit med kode 1
    li a0, 1
    li a7, 93
    ecall

all_tests_passed:
    la a0, tests_passed
    li a7, 4 # Print string
    ecall

    # Exit med kode 0
    li a7, 10
    ecall

.data
wrong_flip_array: .string "Fikk feil svar fra flip_array på indeks: "
wrong_flip_array_2: .string "\nFikk svar: "
expected: .string "\nForventet svar: "
tests_passed: .string "Alle tester var vellykkede!"

# Testdata for flip_array
flip0:      .word 1, 2, 3, 5, 3
flipped0:   .word 3, 5, 3, 2, 1

flip1:      .word 21, 23, 46, 25, 11, 11
flipped1:   .word 11, 11, 25, 46, 23, 21
