.data
    m: .space 4 #linii
    n: .space 4 #coloane
    p: .space 4 #celule vii
    x: .space 4 #linie celula
    y: .space 4 #coloana celula
    k: .space 4 #nr de evolutii
    matrice1: .zero 1600
    matrice2: .zero 1600
    formatScanf: .asciz "%d"
    formatScanfString: .asciz "%s"
    formatPrintf: .asciz "%d"
    formatCaracter: .asciz "%c"
    endl: .asciz "\n"
    lineIndex: .space 4
    colIndex: .space 4
    mBordare: .zero 4
    nBordare: .zero 4
    valoareEcx: .space 4
    spatiu: .asciz " "
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
        je for_afisare
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

    for_afisare:
        movl $1, lineIndex
        movl $matrice1, %edi

    for_afisare_linii:
        movl lineIndex, %ecx
        cmp m, %ecx
        jg et_exit
        #daca nu da jump inca am de afisat

        movl $1, colIndex
        for_afisare_coloane:
            movl colIndex, %ecx
            cmp n, %ecx
            jg continuare_afisare_linii

            movl lineIndex, %eax
            mull nBordare
            addl colIndex, %eax
            
            push (%edi, %eax, 4)
            push $formatPrintf
            call printf
            addl $8, %esp

            push $spatiu
            call printf
            addl $4, %esp

            incl colIndex
            jmp for_afisare_coloane

    continuare_afisare_linii:
        push $endl
        call printf
        addl $4, %esp
        
        incl lineIndex
        jmp for_afisare_linii

et_exit:
    pushl $0
    call fflush
    addl $4, %esp
	
    movl $1, %eax
    movl $0, %ebx
    int $0x80

