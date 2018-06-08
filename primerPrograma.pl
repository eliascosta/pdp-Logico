%Base_conocimiento.

%hechos:
morocha(maria).
tieneOnda(ana).
morocha(ana).
simpatica(cristina).
gusta(juan,cristina).
gusta(juan,maria).
gusta(pedro, ana).
gusta(pedro, nora).
gusta(mario, luisa).

%reglas_condicion_AND:
gusta(Persona, zulema):- gusta(Persona, nora).
gusta(julian,Persona):- morocha(Persona),tieneOnda(Persona).
gusta(mario, Persona):- morocha(Persona),tieneOnda(Persona).
gusta(Persona, laura):- gusta(Persona,ana), gusta(Persona,luisa).
gusta(P1,P2):- simpatica(P2),gusta(P1,ana).

%reglas_condicion_OR:
gusta(julia,Persona):- morocha(Persona).
gusta(julian,Persona):- tieneOnda(Persona).
gusta(mario,Persona):- morocha(Persona).
gusta(mario,Persona):- tieneOnda(Persona).
gusta(Persona,laura):- gusta(Persona,ana).
gusta(Persona,laura):- gusta(Persona,luisa).

