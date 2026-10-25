# Denne filen inneholder skjelettet til Oppgave 3 på Praktisk Øving 1 i TDT4160
j tests

########################################################################################
######################## Skriv koden din under denne linja #############################
########################################################################################

# Denne funksjonen tar inn ett tall, n >= 1, i registeret a0
# Den regner ut fibonacci-tall f(n), der f(n) er definert slik:
#  f(0) = 0
#  f(1) = 1
#  f(n) = f(n-1) + f(n-2),   for alle n > 1
fibonacci:

    # Tips: I denne oppgaven bør du IKKE bruke rekursjon
    # Bruk heller en løkke, og bruk to registere for å representere f(i-1) og f(i)
    # Inni løkken erstatter du registrene med heholdsvis f(i) og f(i+1)

    # Forlater fibonacci-funskjonen her
    ret

########################################################################################
######################## Skriv koden din over denne linja ##############################
########################################################################################

tests:

    #### Tester fibonacci-funksjonen ####
    li a0, 1
    call fibonacci
    li t0, 1
    bne a0, t0, fibonacci_test_failed

    li a0, 2
    call fibonacci
    li t0, 1
    bne a0, t0, fibonacci_test_failed

    li a0, 4
    call fibonacci
    li t0, 3
    bne a0, t0, fibonacci_test_failed

    li a0, 14
    call fibonacci
    li t0, 377
    bne a0, t0, fibonacci_test_failed

    #### Alle tester bestått! ####
    j all_tests_passed

fibonacci_test_failed:
    mv t0, a0
    la a0, wrongFibonacci
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
wrongFibonacci: .string "Fikk feil svar på fibonacci: "
testsPassed: .string "Alle tester var vellykkede!"
