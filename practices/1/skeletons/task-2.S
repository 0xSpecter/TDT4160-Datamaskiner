# Denne filen inneholder skjelettet til Oppgave 2 på Praktisk Øving 1 i TDT4160
j tests

########################################################################################
######################## Skriv koden din under denne linja #############################
########################################################################################

# Denne funksjonen tar inn tre tall, i registrene a0, a1 og a2
# Når funksjonen er ferdig skal det mellomste tallet ligge i a0
# Hvis f.eks. a0 = 6, a1 = -2 og a2 = 4, skal svaret bli a0 = 4
median:

    # Forlater median-funskjonen her
    ret

########################################################################################
######################## Skriv koden din over denne linja ##############################
########################################################################################

tests:

    #### Tester median-funksjonen ####
    li a0, 8
    li a1, 12
    li a2, 20
    call median
    li t0, 12
    bne a0, t0, median_test_failed

    li a0, 32
    li a1, 17
    li a2, 5
    call median
    li t0, 17
    bne a0, t0, median_test_failed

    li a0, -5
    li a1, -9
    li a2, 4
    call median
    li t0, -5
    bne a0, t0, median_test_failed

    li a0, 6
    li a1, 21
    li a2, 14
    call median
    li t0, 14
    bne a0, t0, median_test_failed

    li a0, 21
    li a1, 7
    li a2, 13
    call median
    li t0, 13
    bne a0, t0, median_test_failed

    #### Alle tester bestått! ####
    j all_tests_passed

median_test_failed:
    mv t0, a0
    la a0, wrongMedian
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
wrongMedian: .string "Fikk feil svar på median: "
testsPassed: .string "Alle tester var vellykkede!"
