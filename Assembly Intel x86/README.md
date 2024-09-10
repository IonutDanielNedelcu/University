# x86
Computing Systems Architecture (Arhitectura Sistemelor de Calcul)

NOTE: the comments and the original project requirements are written in Romanian due to the course's demand

    [EN] PROBLEM:

  Conway's Game of Life is a two-dimensional zero-player game invented by mathematician JohnHorton Conway in 1970. The purpose of this game is to observe the evolution of a cell system,starting from an initial configuration, introducing rules regarding death, respectively the creation of onenew cells in the system. This evolutionary system is Turing-complete.
The state of a system is described by the cumulative state of the component cells, and for these we have the following rules:
  1. Underpopulation. Each cell (that is alive in the current generation) with less than twoneighbors in life, dies in the next generation.
  2. Continuity of living cells. Each cell (which is alive in the current generation), with two or three neighbors in life, will exist in the next generation.
  3. Ultrapopular. Each cell (which is alive in the current generation), which has more than three neighbors alive, dies in the next generation.
  4. Creation. A dead cell that has exactly three living neighbors will be created in the next generation.
  5. Dead cell continuity. Any other dead cell, which does not fit into the rule of creation, a dead cell remains.

  We define the state of a system at generation n as a matrix Sn ∈ Mm×n({0, 1}) (m - the number oflines, respectively n - the number of columns), where element 0 represents a dead cell, respectively 1 represents a living cell (in the current generation).
  We define a k-evolution (k ≥ 0) of the system an iteration S0 → S1 → · · · → Sk, where each Si+1 get from Si, applying the five rules stated above.

  Observation.
  For the cells on the first line, first column, last line, respectively last column, the expansion to 8 neighbors is considered, by considering those that are not in the matrix as being dead cells.

  Symmetric encryption scheme. 
  We define an encryption key (starting from a configuration initial S0 and a k-evolution) as the operation < S0, k >, which represents the one-dimensional array of data (understood as a string of bits) obtained after concatenating the lines in the matrix in the extended matrix obtained, S'k.

  We consider m a clear message (a string of characters without spaces). The encryption {m}<S0,k> will mean XORing the clear message m with the result given by < S0, k >. There are the following cases:
  • if the message and the key have the same length, it is XORed element by element, until the result is obtained;
  • if the message is shorter than the key, only the first part of the key is used, corresponding to the length of the message;
  • if the message is longer than the key, the replication of the key is considered whenever necessary to encrypt the entire message.

  For decryption, the same mechanism is applied, the decrypted message will be XORed with the calculated key, and we will finally have m XOR k XOR k = m. (k XOR k = 0, and m XOR 0 = m, from the associativity of XOR, respectively from the calculation rules). When decrypting, the message will not be displayed in hexadecimal, but in clear.


    REQUIREMENTS:

  REQUIREMENT 0x00

  The number of lines m, the number of columns n, the number of live cells are read from the keyboard (STDIN). The number of live cells p, the positions of the live cells in the matrix, respectively an integer k.
  At this step, it is requested that the system configuration be displayed to STDOUT after a k-evolution.
Note: The elements on A line will be displayed with a space between them.


  REQUIREMENT 0x01

  The number of lines m, the number of columns n, the number of live cells are read from the keyboard (STDIN). The number of live cells p, the positions of the living cells in the matrix, an integer k, an integer o that can be 0 or 1 (0 for encryption, 1 for decryption), respectively a message m that can be clear, for encryption (a string of form 0x..., for decryption). 
  Encryption/decryption of the received message is required, according to the key that must be calculated, according to the specifications in the theme formulation.
Note: The same conditions as in the case of the first requirement are guaranteed, respectively the correctness of the input data, the messages to be encrypted will be messages without spaces, consisting of characters alpha-numeric (numbers, lowercase letters, uppercase letters), and the messages to be decrypted will be hexadecimal strings which will start with 0x and will contain symbols from the set {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F}. The messages (considered in the clear) will have a maximum of 10 characters!


  REQUIREMENT 0x02

  Restore, in a separate source file, the request 0x00, so that the input should be read from an in.txt file, and the output should be written in an out.txt file, using functions from the C language.


    [RO] PROBLEMA:

  Conway’s Game of Life este un zero-player game bidimensional, inventat de matematicianul John Horton Conway in anul 1970. Scopul acestui joc este de a observa evolutia unui sistem de celule, pornind de la o configuratie initiala, introducand reguli referitoare la moartea, respectiv crearea unei noi celule in sistem. Acest sistem evolutiv este Turing-complete. Starea unui sistem este descrisa de starea cumulata a celulelor componente, iar pentru acestea
avem urmatoarele reguli:
  1. Subpopulare. Fiecare celula (care este in viata in generatia curenta) cu mai putin de doi vecini in viata, moare in generatia urmatoare.
  2. Continuitate celule vii. Fiecare celula (care este in viata in generatia curenta), cu doi sau trei vecini in viata, va exista si in generatia urmatoare.
  3. Ultrapopulare. Fiecare celula (care este in viata in generatia curenta), care are mai mult de trei vecini in viata, moare in generatia urmatoare.
  4. Creare. O celula moarta care are exact trei vecini in viata, va fi creata in generatia urmatoare.
  5. Continuitate celule moarte. Orice alta celula moarta, care nu se incadreaza in regula de creare, ramane o celula moarta.

  Definim starea unui sistem la generatia n ca fiind o matrice Sn ∈ Mm×n({0, 1}) (m - numarul de linii, respectiv n - numarul de coloane), unde elementul 0 reprezinta o celula moarta, respectiv 1 reprezinta o celula in viata (in generatia curenta).
  Definim o k-evolutie (k ≥ 0) a sistemului o iteratie S0 → S1 → · · · → Sk, unde fiecare Si+1 se
obtine din Si, aplicand cele cinci reguli enuntate mai sus.

  Observatie. 
  Pentru celulele aflate pe prima linie, prima coloana, ultima linie, respectiv ultima coloana, se considera extinderea la 8 vecini, prin considerarea celor care nu se afla in matrice ca fiind celule moarte.

  Schema de criptare simetrica. 
  Definim o cheie de criptare (pornind de la o configuratie initiala S0 si o k-evolutie) ca fiind operatia < S0, k >, care reprezinta tabloul unidimensional de
date (inteles ca sir de biti) obtinut in urma concatenarii liniilor din matrice din matricea extinsa obtinuta, S'k.

  Consideram m un mesaj in clar (un sir de caractere fara spatii). Criptarea {m}<S0,k> va insemna XOR-area mesajului in clar m cu rezultatul dat de < S0, k >. Sunt urmatoarele cazuri:
  • daca mesajul si cheia au aceeasi lungime, se XOR-eaza element cu element, pana se obtine
rezultatul;
  • daca mesajul este mai scurt decat cheia, se foloseste doar prima parte din cheie, corespunzatoare lungimii mesajului;
  • daca mesajul este mai lung decat cheia, se considera replicarea cheii de oricate ori este nevoie pentru a cripta intreg mesajul.

  Pentru decriptare se aplica acelasi mecanism, mesajul decriptat se va XOR-a cu cheia calculata, si vom avea in final m XOR k XOR k = m. (k XOR k = 0, iar m XOR 0 = m, din asociativitatea lui XOR, respectiv din regulile de calcul). La decriptare, mesajul nu va fi afisat in hexadecimal, ci in clar.


    CERINȚE:

  CERINTA 0x00

  Se citesc de la tastatura (STDIN) numarul de linii m, numarul de coloane n, numarul de celule vii p, pozitiile celulelor vii din matrice, respectiv un numar intreg k.
  Se cere, la acest pas, afisarea la STDOUT a configuratiei sistemului dupa o k-evolutie.
Observatie: Elementele de pe linie vor fi afisate cu un spatiu intre ele.


  CERINTA 0x01

  Se citesc de la tastatura (STDIN) numarul de linii m, numarul de coloane n, numarul de celule vii p, pozitiile celulelor vii din matrice, un numar intreg k, un intreg o care poate fi 0 sau 1 (0 pentru criptare, 1 pentru decriptare), respectiv un mesaj m care poate fi in clar, pentru criptare (un sir de forma 0x..., pentru decriptare). 
  Se cere criptarea/decriptarea mesajului primit, conform cheii care trebuie calculate, conform specificatiilor din formularea temei.
Observatie. Se garanteaza aceleasi conditii ca in cazul primei cerinte, respectiv se garanteaza corectitudinea datelor de intrare, mesajele de criptat vor fi mesaje fara spatii, formate din caractere alpha-numerice (cifre, litere mici, litere mari), iar mesajele de decriptat vor fi siruri hexadecimale care vor incepe cu 0x si vor contine simboluri din multimea {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F}. Mesajele (considerate in clar) vor avea maxim 10 caractere!


  CERINTA 0x02

  Sa se refaca, intr-un fisier sursa separat (denumit conform sectiunii 1.4.), cerinta 0x00, astfel incat inputul sa fie citit dintr-un fisier in.txt, iar outputul sa fie scris intr-un fisier out.txt, utilizand functii din limbajul C.



