# Denne filen inneholder skjelettet til Oppgave 2 på Praktisk Øving 3 i TDT4160
j _tests

########################################################################################
######################## Skriv koden din under denne linja #############################
########################################################################################

# Denne funksjonen tar inn en peker til en node i en binær trestruktur.
# Hver node ser slik ut:
#
# Byte offset:
# 0              4               8              12
# +--------------+---------------+--------------+
# | verdi        | venstre peker |  høyre peker |
# +--------------+---------------+--------------+
#
# der venstre og høyre peker er pekere til henholdsvis nodens venstre og høyre barn.
# Dersom noden ikke har en barn-node i en gitt retning, er pekeren 0.
#
# Når funksjonen kalles ligger en peker til rotnoden i register a0.
# Funksjonen skal regne ut summen av alle nodene i treet, og returnere svaret i register a0.
sum_binary_tree:

    # I denne oppgaven skal du ikke kalle noen funksjoner.
    # I stedet skal du bruke stakken for å holde orden på noder som gjenstår å besøke.
    # Funksjoner står fritt til å utvide stakken når de trenger midlertidig lagringsplass.
    # Dette er praktisk i denne funksjonen, siden vi ikke vet på forhånd hvor mye plass vi trenger.

    # Pseudokode for hele funksjonen blir derfor:
    #
    #     sum = 0
    #     push rotnoden
    #     while (vi har flere noder på stakken):
    #          node = popp en node fra stakken
    #          sum += node.verdi
    #          if node.venstre != 0:
    #              push node.venstre
    #          if node.høyre != 0:
    #              push node.høyre
    #
    #     return sum
    #

    # Tips: For å gjøre det lett å oppdage når stakken er tom for noder
    # kan man dytte tallet 0 til stakken før vi begynner.
    # Da vet vi at vi er ferdige så snart vi popper 0.

    # Forlater sum_binary_tree her
    ret

########################################################################################
######################## Skriv koden din over denne linja ##############################
########################################################################################

_tests:

    # Tester med treet definert i data-seksjonen
    la a0, _node0
    call sum_binary_tree

    # Sjekker at summen ble som forventet
    mv t0, a0
    lw t1, _expected_sum
    bne t0, t1, _sum_wrong

    j _all_tests_passed

_sum_wrong:
    la a0, _sum_wrong_str
    li a7, 4 # Print string
    ecall

    la a0, _sum_wrong_got_str
    li a7, 4 # Print string
    ecall
    mv a0, t0
    li a7, 1 # Print int
    ecall

    la a0, _sum_wrong_expected_str
    li a7, 4 # Print string
    ecall
    mv a0, t1
    li a7, 1 # Print int
    ecall

    j _abort

_abort:
    # Exit med kode 1
    li a0, 1
    li a7, 93
    ecall

_all_tests_passed:
    la a0, _all_tests_passed_str
    li a7, 4 # Print string
    ecall

    # Exit med kode 0
    li a7, 10
    ecall

.data
# Treet som brukes i testing
_node7:  .word 7, , 0
.zero 16 # Dummy padding
_node6:  .word 3, 0, _node7
_node5:  .word 8, 0, _node6
_node4:  .word 2, 0, 0
_node3:  .word 9, _node4, 0
.zero 4 # Dummy padding
_node2:  .word 3, 0, 0
_node1:  .word 4, _node2, _node3
# Rotnoden
_node0: .word 6, _node1, _node5

_expected_sum:  .word 42

_sum_wrong_str: .string "Funksjonen produserte ikke riktig sum!"
_sum_wrong_got_str:  .string "\nFikk: "
_sum_wrong_expected_str:  .string "\nForventet: "
_all_tests_passed_str: .string "Testen var vellykket!"
