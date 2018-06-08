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
gusta(pedro, luisa).
%reglas:
gusta(Persona, zulema):- gusta(Persona, nora).
gusta(julian,Persona):- morocha(Persona),tieneOnda(Persona).
gusta(mario, Persona):- morocha(Persona),tieneOnda(Persona).
gusta(Persona, laura):- gusta(Persona,ana), gusta(Persona,luisa).
gusta(P1,P2):- simpatica(P2),gusta(P1,ana).
