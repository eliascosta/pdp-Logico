%base_de_conocimientos
popular(got).
popular(hoc).
popular(starWars).
mira(juan, himym).
mira(juan, futurama).
mira(juan, got).
mira(nico, starWars).
mira(nico,got).
mira(maiu, starWars).
mira(maiu, onePiece).
mira(maiu, got).
mira(gaston, got).
quiere_ver(juan, hoc).
quiere_ver(aye, got).
quiere_ver(gaston,himym).

%episodios(Serie, Temporada, Capitulos)
episodios(got, 3, 12).
episodios(got, 2, 10).
episodios(himym, 1, 23).
episodios(himym, 4, 24).
episodios(drHouse, 8, 16).
episodios(futurama, 2,19).
episodios(starWars, 10, 13).
episodios(starWars, 1, 22).
episodios(starWars, 3, 22).

paso(futurama,2,3,muerte(seymourDiera)).
paso(starWars,10,9,muerte(emperor)).
paso(starWars,1,2,relacion(parentesco, anakin, rey)).
paso(starWars,3,2,relacion(parentesco, vader, luke)).
paso(himym,1,1,relacion(amorosa, ted, robin)).
paso(himym,4,3,relacion(amorosa, swarley, robin)).
paso(got,4,5,relacion(amistad, tyrion, dragon)).


leDijo(gaston, maiu, got,relacion(amistad, tyrion, dragon)).
leDijo(nico, maiu, starWars,relacion(parentesco, vader, luke)).
leDijo(nico, juan, got,muerte(tyrion)).
leDijo(aye, juan, got,relacion(amistad, tyrion, john)).
leDijo(aye, maiu, got,relacion(amistad, tyrion, john)).
leDijo(aye, gaston,got,relacion(amistad, tyrion, dragon)).

%punto3:

esSpoiler(Serie, Spoiler) :- paso(Serie, Temporada, Episodio, muerte(Spoiler)).
esSpoiler(Serie, Spoiler) :- paso(Serie, Temporada, Episodio, relacion(Spoiler)).
esSpoiler(Serie, Spoiler, Personaje1, Personaje2) :- paso(Serie, Temporada, Episodio, relacion(Spoiler, Personaje1, Personaje2)).

%punto4:

leSpoileo(Persona1, Persona2, Serie) :- leDijo(Persona1, Persona2, Serie, Spoiler), mira(Persona2, Serie).
leSpoileo(Persona1, Persona2, Serie) :- leDijo(Persona1, Persona2, Serie, Spoiler), quiere_ver(Persona2, Serie).

%punto5:

televidenteResponsable(Persona) :- not( leSpoileo(Persona, Persona1, Serie)).
