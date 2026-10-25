# Denne filen inneholder skjelettet til Oppgave 1 på Praktisk Øving 1 i TDT4160
j tests

########################################################################################
######################## Skriv koden din under denne linja #############################
########################################################################################

# Denne funksjonen tar inn ett tall x i registeret a0
# Hvis tallet er et partall skal x/2 returneres
# Hvis tallet er et oddetall skal 3*x + 1 returners.
# Returverdien skal legges i registeret a0
collatz:

    # Tips: I denne funksjonen kan du få bruk for andi-instruksjonen.

    # Forlater collatz-funskjonen her
    ret

########################################################################################
######################## Skriv koden din over denne linja ##############################
########################################################################################

tests:

    #### Tester collatz-funksjonen ####
    li a0, 8
    call collatz
    li t0, 4
    bne a0, t0, collatz_test_failed

    li a0, 21
    call collatz
    li t0, 64
    bne a0, t0, collatz_test_failed

    li a0, 440
    call collatz
    li t0, 220
    bne a0, t0, collatz_test_failed

    #### Alle tester bestått! ####
    j all_tests_passed

collatz_test_failed:
    mv t0, a0
    la a0, wrongCollatz
    li a7, 4 # Print string
    ecall
    mv a0, t0
    li a7, 1 # Print int
    ecall
    j abort

abort:
    # Exit med kode 1
    li a0, 1
    li a7, 93
    ecall

all_tests_passed:
    la a0, testsPassed
    li a7, 4 # Print string
    ecall

    li a7, 10
    ecall

.data
wrongCollatz: .string "Fikk feil svar på collatz: "
testsPassed: .string "Alle tester var vellykkede!"
