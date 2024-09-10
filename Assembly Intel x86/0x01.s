.data
    m: .space 4 #linii
    n: .space 4 #coloane
    p: .space 4 #celule vii
    x: .space 4 #linie celula
    y: .space 4 #coloana celula
    k: .space 4 #nr de evolutii
    o: .space 4 #criptare sau decriptare, dupa caz
    matrice1: .zero 1600
    matrice2: .zero 1600
    formatScanf: .asciz "%d"
    formatScanfString: .asciz "%s"
    formatPrintfString: .asciz "%s\n"
    formatPrintf: .asciz "%d"
    formatCaracter: .asciz "%c"
    formatHexa: .asciz "%X"
    inceputHexa: .asciz "0x"
    endl: .asciz "\n"
    lineIndex: .space 4
    colIndex: .space 4
    mBordare: .zero 4
    nBordare: .zero 4
    valoareEcx: .space 4
    spatiu: .asciz " "
    mesaj: .zero 11 #mesajul pentru criptate + 1 byte null pentru final de string
    mesaj1: .zero 23 #mesajul pentru decriptare + 1 byte null pentru final de string + 2 bytes pentru "0x"
    mesajCriptat: .zero 21
    mesajDecriptat: .zero 21
    mesajHexa: .zero 23
    caracter: .space 1 #are lungimea 1 byte
    caracter1: .space 1
    caracter2: .space 1
    ultPozitieMatrice: .space 4
    optBiti: .zero 1 #byte pentru xor-are
    pozitieMatrice: .space 4 #retine pozitia pe care ma aflu in matricea interpretata ca vector
    index8: .space 4 #index pentru calcului a cate 8 biti=1 byte
    counterCaractere: .space 4
    afisareHexa: .space 4
    afisareCaracter: .space 1
.text
.global main
main:

    #citire m,n,p
    push $m
    push $formatScanf
    call scanf
    addl $8, %esp
    
    push $n
    push $formatScanf
    call scanf
    addl $8, %esp
    
    push $p
    push $formatScanf
    call scanf
    addl $8, %esp

    movl m, %eax
    addl $2, %eax
    movl %eax, mBordare

    movl n, %eax
    addl $2, %eax
    movl %eax, nBordare

    #citire celule vii
    movl $0, %ecx
    movl $matrice1, %edi

    for_citire:
        cmp p, %ecx
        je continuarek
        push %ecx

        push $x
        push $formatScanf
        call scanf
        addl $8, %esp

        push $y
        push $formatScanf
        call scanf
        addl $8, %esp
        
        movl $0, %edx
        incl x
        incl y
        movl x, %eax
        mull nBordare
        addl y, %eax
        movl $1, (%edi, %eax, 4)

        pop %ecx
        inc %ecx
        jmp for_citire

    continuarek:
        #citirea lui k
        push $k
        push $formatScanf
        call scanf
        addl $8, %esp    
    

    movl $0, %ecx
    for_k:
        cmp k, %ecx
        je cerinta01
        movl %ecx, valoareEcx

        for_evolutii:
            movl $1, lineIndex
            movl $matrice1, %edi

        for_evolutii_linii:
            movl lineIndex, %ecx
            cmp m, %ecx
            jg mutare_matrice
            #daca nu da jump, mai am de calculat celule

            movl $1, colIndex
            for_evolutii_coloane:
                movl colIndex, %ecx
                cmp n, %ecx
                jg continuare_evolutii_linii

                #calculez suma valorilor vecinilor
                #movl $0, vecini
                movl $matrice1, %edi
                movl $0, %ebx

                #calculez pozitia din vector la care ma aflu - o sa ma raportez la (%edi, %eax, 4)
                movl lineIndex, %eax
                mull nBordare
                addl colIndex, %eax

                sub nBordare, %eax
                sub $1, %eax
                addl (%edi, %eax, 4), %ebx #sus stanga
                incl %eax
                addl (%edi, %eax, 4), %ebx #sus mijloc
                incl %eax
                addl (%edi, %eax, 4), %ebx #sus dreapta
                
                addl nBordare, %eax
                addl (%edi, %eax, 4), %ebx #mijloc dreapta
                subl $2, %eax
                addl (%edi, %eax, 4), %ebx #mijloc stanga

                addl nBordare, %eax
                addl (%edi, %eax, 4), %ebx #jos stanga
                incl %eax
                addl (%edi, %eax, 4), %ebx #jos mijloc
                incl %eax
                addl (%edi, %eax, 4), %ebx #jos dreapta
                #acum ebx are suma vecinilor

                decl %eax
                subl nBordare, %eax #sunt inapoi la pozitia curenta

                #pentru testare
                movl $matrice1, %edi
                movl (%edi, %eax, 4), %edx #pun in edx valoarea din matrice1
                movl $matrice2, %edi
                movl $0, (%edi, %eax, 4) #pun in matrice2 valoarea 0 by default
                cmp $0, %edx
                je celula_e_moarta

                celula_e_vie:
                    cmp $2, %ebx
                    je atribuie_vie_1
                    cmp $3, %ebx
                    je atribuie_vie_1
                    jmp celula_e_moarta

                atribuie_vie_1:
                    movl $1, (%edi, %eax, 4)
                    
                celula_e_moarta:
                    cmp $3, %ebx
                    jne continuare_evolutii_coloane
                    movl $1, (%edi, %eax, 4)

            continuare_evolutii_coloane:

                incl colIndex
                jmp for_evolutii_coloane

        continuare_evolutii_linii:
            incl lineIndex
            jmp for_evolutii_linii     
            

        mutare_matrice:
            movl $1, lineIndex

            for_mutare_linii:
                movl lineIndex, %ecx
                cmp m, %ecx
                jg continuare_for_k

                movl $1, colIndex
                for_mutare_coloane:
                    movl colIndex, %ecx
                    cmp n, %ecx
                    jg continuare_mutare_linii

                    movl lineIndex, %eax
                    mull nBordare
                    addl colIndex, %eax

                    movl $matrice2, %edi
                    movl (%edi, %eax, 4), %ebx
                    movl $matrice1, %edi
                    movl %ebx, (%edi, %eax, 4)

                    incl colIndex
                    jmp for_mutare_coloane

            continuare_mutare_linii:
                incl lineIndex
                jmp for_mutare_linii

    continuare_for_k:
        movl valoareEcx, %ecx
        incl %ecx
        jmp for_k

    ############################################################################################################

    cerinta01:
        #citirea variabilei o pentru criptare sau decriptare
        push $o 
        push $formatScanf
        call scanf
        addl $8, %esp


    verificare_criptare_decriptare:
    movl nBordare, %eax
    mull mBordare
    movl %eax, ultPozitieMatrice  #calculez pozitia ultimului element din matrice
    movl $0, pozitieMatrice

    cmpl $1, o
    je decriptare

    criptare:
        #citirea mesajului de criptare
        push $mesaj
        push $formatScanfString
        call scanf
        addl $8, %esp

        movl $mesaj, %edi
        movl $0, %ecx  #indexul pentru mesaj va fi registrul ecx
        movb $0, caracter
        for_caractere_criptare:
            movl $0, %eax
            movl $mesaj, %edi
            movb (%edi, %ecx, 1), %al
            movb %al, caracter

            xor %ebx, %ebx  #construiesc caracterul null pt finalul de string
            cmp caracter, %bl
            je afisare_criptare # !!!!! trebuie modificat dupa

            movl $matrice1, %esi
            movl $0, index8
            movb $0, optBiti #elimin valoarea reziduala
            
            movl %ecx, valoareEcx
            for_8_biti:
                movl $8, %edx
                cmp index8, %edx
                je continua_caractere_criptare

                movl pozitieMatrice, %eax
                cmp ultPozitieMatrice, %eax
                jl dupa_resetare

                movl $0, pozitieMatrice  #daca am ajuns la finalul matricei o iau de la inceput
                dupa_resetare:
                    xor %eax, %eax
                    movb optBiti, %al
                    movl $2, %ebx
                    mull %ebx
                    movl pozitieMatrice, %ebx
                    movl (%esi, %ebx, 4), %edx
                    addb %dl, %al
                    movb %al, optBiti

                final_8_biti:
                    incl index8
                    incl pozitieMatrice
                    jmp for_8_biti

            continua_caractere_criptare:
                movb optBiti, %al
                xor caracter, %al  #am facut xor-are intre cei 1 bytes

                movl $mesajCriptat, %esi
                movb %al, (%esi, %ecx, 1)

                incl counterCaractere
                movl valoareEcx, %ecx
                incl %ecx
                jmp for_caractere_criptare

        afisare_criptare:
            push $inceputHexa
            push $formatScanfString
            call printf 
            addl $8, %esp

            movl $0, %ecx
            movl $mesajCriptat, %edi
            for_afisare_criptare:
                movl $0, %eax
                movl $0, afisareHexa
                cmp counterCaractere, %eax                
                je final_afisare_criptare

                movb (%edi, %ecx, 1), %al
                movl %eax, afisareHexa

                push %ecx

                cmp $16, %eax
                jl o_singura_cifra

                push afisareHexa
                push $formatHexa
                call printf
                addl $8, %esp

                jmp dupa_cifra

                o_singura_cifra:
                    push $0
                    push $formatHexa
                    call printf
                    addl $8, %esp
                    
                    push afisareHexa
                    push $formatHexa
                    call printf
                    addl $8, %esp
                
                dupa_cifra:
                pop %ecx
                decl counterCaractere
                incl %ecx
                jmp for_afisare_criptare

            final_afisare_criptare:
                push $endl
                push $formatScanfString
                call printf
                addl $8, %esp

                jmp et_exit

    
    ###################################################################################################################

    decriptare:
        #citirea mesajului de decriptare
        push $mesaj1
        push $formatScanfString
        call scanf
        addl $8, %esp

        movl $mesaj1, %edi
        movl $mesajHexa, %esi
        movl $2, %ecx  #indexul pentru mesaj va fi registrul ecx, sar peste primele 2 caractere: "0x"
        movb $0, caracter
        movl $0, valoareEcx
        movl $0, counterCaractere # TREBUIE IMPARTIT LA 2

        transformare_in_binar_din_caractere_hexa:

            for_transformare_in_hexa:
                movl $0, %eax
                movb (%edi, %ecx, 1), %ah                
                movb %ah, caracter1
                
                xor %ebx, %ebx  #construiesc caracterul null pt finalul de string
                cmp caracter1, %bl
                je pregatire_decriptare

                incl %ecx
                movb (%edi, %ecx, 1), %al
                movb %al, caracter2
                movl $0, %eax

                cmpb $48, caracter1
                je zero
                cmpb $49, caracter1
                je unu
                cmpb $50, caracter1
                je doi
                cmpb $51, caracter1
                je trei
                cmpb $52, caracter1
                je patru
                cmpb $53, caracter1
                je cinci
                cmpb $54, caracter1
                je sase
                cmpb $55, caracter1
                je sapte
                cmpb $56, caracter1
                je opt
                cmpb $57, caracter1
                je noua
                cmpb $65, caracter1
                je zece
                cmpb $66, caracter1
                je unsprezece
                cmpb $67, caracter1
                je doisprezece
                cmpb $68, caracter1
                je treisprezece
                cmpb $69, caracter1
                je paisprezece
                cmpb $70, caracter1
                je cincisprezece
                zero:
                    movb $0, %al
                    jmp dupa_car_1
                unu:
                    movb $1, %al
                    jmp dupa_car_1
                doi:
                    movb $2, %al
                    jmp dupa_car_1
                trei:
                    movb $3, %al
                    jmp dupa_car_1
                patru:
                    movb $4, %al
                    jmp dupa_car_1
                cinci:
                    movb $5, %al
                    jmp dupa_car_1
                sase:
                    movb $6, %al
                    jmp dupa_car_1
                sapte:
                    movb $7, %al
                    jmp dupa_car_1
                opt:
                    movb $8, %al
                    jmp dupa_car_1
                noua:
                    movb $9, %al
                    jmp dupa_car_1
                zece:
                    movb $10, %al
                    jmp dupa_car_1
                unsprezece:
                    movb $11, %al
                    jmp dupa_car_1
                doisprezece:
                    movb $12, %al
                    jmp dupa_car_1
                treisprezece:
                    movb $13, %al
                    jmp dupa_car_1
                paisprezece:
                    movb $14, %al
                    jmp dupa_car_1
                cincisprezece:
                    movb $15, %al
                    jmp dupa_car_1

                dupa_car_1:
                    shll $4, %eax

                    cmpb $48, caracter2
                    je zero2
                    cmpb $49, caracter2
                    je unu2
                    cmpb $50, caracter2
                    je doi2
                    cmpb $51, caracter2
                    je trei2
                    cmpb $52, caracter2
                    je patru2
                    cmpb $53, caracter2
                    je cinci2
                    cmpb $54, caracter2
                    je sase2
                    cmpb $55, caracter2
                    je sapte2
                    cmpb $56, caracter2
                    je opt2
                    cmpb $57, caracter2
                    je noua2
                    cmpb $65, caracter2
                    je zece2
                    cmpb $66, caracter2
                    je unsprezece2
                    cmpb $67, caracter2
                    je doisprezece2
                    cmpb $68, caracter2
                    je treisprezece2
                    cmpb $69, caracter2
                    je paisprezece2
                    cmpb $70, caracter2
                    je cincisprezece2
                    zero2:
                        addb $0, %al
                        jmp dupa_car_2
                    unu2:
                        addb $1, %al
                        jmp dupa_car_2
                    doi2:
                        addb $2, %al
                        jmp dupa_car_2
                    trei2:
                        addb $3, %al
                        jmp dupa_car_2
                    patru2:
                        addb $4, %al
                        jmp dupa_car_2
                    cinci2:
                        addb $5, %al
                        jmp dupa_car_2
                    sase2:
                        addb $6, %al
                        jmp dupa_car_2
                    sapte2:
                        addb $7, %al
                        jmp dupa_car_2
                    opt2:
                        addb $8, %al
                        jmp dupa_car_2
                    noua2:
                        addb $9, %al
                        jmp dupa_car_2
                    zece2:
                        addb $10, %al
                        jmp dupa_car_2
                    unsprezece2:
                        addb $11, %al
                        jmp dupa_car_2
                    doisprezece2:
                        addb $12, %al
                        jmp dupa_car_2
                    treisprezece2:
                        addb $13, %al
                        jmp dupa_car_2
                    paisprezece2:
                        addb $14, %al
                        jmp dupa_car_2
                    cincisprezece2:
                        addb $15, %al
                        jmp dupa_car_2

                dupa_car_2:
                    movl valoareEcx, %ebx
                    movb %al, (%esi, %ebx, 1)

                    incl counterCaractere
                    incl valoareEcx
                    incl %ecx
                    jmp for_transformare_in_hexa

        pregatire_decriptare:
            movl $0, %ecx

        for_caractere_decriptare:
            movl $0, %eax
            movl $mesajHexa, %esi
            movb (%esi, %ecx, 1), %al
            movb %al, caracter

            cmp counterCaractere, %ecx
            je afisare_decriptare

            movl $matrice1, %edi
            movl $0, index8
            movb $0, optBiti #elimin valoarea reziduala
            
            movl %ecx, valoareEcx
            for_8_biti2:
                movl $8, %edx
                cmp index8, %edx
                je continua_caractere_decriptare

                movl pozitieMatrice, %eax
                cmp ultPozitieMatrice, %eax
                jl dupa_resetare2

                movl $0, pozitieMatrice  #daca am ajuns la finalul matricei o iau de la inceput
                dupa_resetare2:
                    xor %eax, %eax
                    movb optBiti, %al
                    movl $2, %ebx
                    mull %ebx
                    movl pozitieMatrice, %ebx
                    movl (%edi, %ebx, 4), %edx
                    addb %dl, %al
                    movb %al, optBiti

                final_8_biti2:
                    incl index8
                    incl pozitieMatrice
                    jmp for_8_biti2

            continua_caractere_decriptare:
                movb optBiti, %al
                xor caracter, %al  #am facut xor-are intre cei 1 bytes

                movl $mesajDecriptat, %esi
                movb %al, (%esi, %ecx, 1)

                movl valoareEcx, %ecx
                incl %ecx
                jmp for_caractere_decriptare

        afisare_decriptare:
            movl $0, %ecx
            movl $mesajDecriptat, %edi
            for_afisare_decriptare:
                movl $0, %eax
                movl $0, afisareCaracter
                cmp counterCaractere, %eax                
                je final_afisare_decriptare

                movb (%edi, %ecx, 1), %al
                movb %al, afisareCaracter

                push %ecx

                push afisareCaracter
                push $formatCaracter
                call printf
                addl $8, %esp

                pop %ecx
                decl counterCaractere
                incl %ecx
                jmp for_afisare_decriptare

            final_afisare_decriptare:
                push $endl
                push $formatScanfString
                call printf
                addl $8, %esp

                jmp et_exit

                
et_exit:
    pushl $0
    call fflush
    addl $4, %esp

    movl $1, %eax
    movl $0, %ebx
    int $0x80

