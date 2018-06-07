%Árbol genealógico:

padre(homero, bart).
padre(homero, lista).
padre(homero, maggie).
padre(herb,abe).
padre(abe,homero).
padre(herb,mumi).

hermano(X,Y) :- padre(Padre, X), padre(Padre,Y), X\=Y.
abuelo(Nieto,Abuelo) :- padre(Padre,Nieto),padre(Abuelo,Padre).
primo(Primo1, Primo2) :- padre(Padre1, Primo1), padre(Padre2, Primo2), hermano(Padre1,Padre2).
bisabuelo (Bisabuelo, Bisnieto) :- padre(Nieto, Bisnieto), abuelo(Nieto, Bisabuelo).

ancestro(Persona1, Persona2) :-padre(Persona1, Persona2).
ancestro(Persona1, Persona2) :-padre(Persona1,Persona3), ancestro (Persona3, Persona2).

