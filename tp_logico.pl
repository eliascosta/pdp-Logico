%scandidato(Persona,Partido).
candidato(frank,rojo).
candidato(claire,rojo).
candidato(garret,azul).
candidato(jackie,amarillo).
candidato(linda,azul).
candidato(catherine,rojo).
candidato(seth,amarillo).
candidato(heather,amarillo).

%persona(Nombre,Edad).
persona(frank,50).
persona(claire,52).
persona(garret,64).
persona(peter,26).
persona(jackie,38).
persona(linda,30).
persona(catherine,59).
persona(heather,50).

%sePostuloEn(Partido,Provincia).
sePostuloEn(azul,buenosAires).
sePostuloEn(azul,chaco).
sePostuloEn(azul,tierraDelFuego).
sePostuloEn(azul,sanLuis).
sePostuloEn(azul,neuquen).
sePostuloEn(rojo,buenosAires).
sePostuloEn(rojo,santaFe).
sePostuloEn(rojo,cordoba).
sePostuloEn(rojo,chubut).
sePostuloEn(rojo,tierraDelFuego).
sePostuloEn(rojo,sanLuis).
sePostuloEn(amarillo,chaco).
sePostuloEn(amarillo,formosa).
sePostuloEn(amarillo,tucuman).
sePostuloEn(amarillo,salta).
sePostuloEn(amarillo,santaCruz).
sePostuloEn(amarillo,laPampa).
sePostuloEn(amarillo,corrientes).
sePostuloEn(amarillo,misiones).
sePostuloEn(amarillo,buenosAires).

%cantidadHabitantes(Provincia,Cantidad).
cantidadHabitantes(buenosAires,15355000).
cantidadHabitantes(chaco,1143201).
cantidadHabitantes(tierraDelFuego,160720).
cantidadHabitantes(sanLuis,489255).
cantidadHabitantes(neuquen,637913).
cantidadHabitantes(santaFe,3397532).
cantidadHabitantes(cordoba,3567654).
cantidadHabitantes(chubut,577466).
cantidadHabitantes(formosa,527895).
cantidadHabitantes(tucuman,1687305).
cantidadHabitantes(salta,1333365).
cantidadHabitantes(santaCruz,273964).
cantidadHabitantes(laPampa,349299).
cantidadHabitantes(corrientes,992595).
cantidadHabitantes(misiones,1189446).

%intencionDeVotoEn(Provincia, Partido, Porcentaje)
intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

%esPicante:
%al menos 2 partidos postulados y mas de 1 millon de habitantes.
esPicante(Provincia):-(sePostuloEn(Partido1,Provincia),sePostuloEn(Partido2,Provincia),Partido1 \= Partido2),(cantidadHabitantes(Provincia,Cantidad), Cantidad >= 1000000).

%leGanaA:
%el cual relaciona a dos candidatos y una provincia, y nos dice si un candidato le ganaría a otro en una provincia.
leGanaA(Candidato1,Candidato2,Provincia):-sePostuloEn(Partido1,Provincia),sePostuloEn(Partido2,Provincia), candidato(Candidato1,Partido1), candidato(Candidato2,Partido2), intencionDeVotoEn(Provincia,Partido1,Cantidad1), intencionDeVotoEn(Provincia,Partido2,Cantidad2), Cantidad1 > Cantidad2.
leGanaA(Candidato1, Candidato2,Provincia):-sePostuloEn(Partido1,Provincia),candidato(Candidato1,Partido1).

%elGranCandidato:
elGranCandidato(Candidato):-forall(leGanaA(Candidato,_,_),_).

