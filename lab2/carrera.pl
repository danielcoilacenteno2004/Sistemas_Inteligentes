:- dynamic respuesta/3.

% Reglas para las carreras
carrera(ingenieria_sistemas) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(resolucion_problemas),
    tiene_interes(tecnologia),
    tiene_personalidad(analitico),
    (prefiere_condicion(trabajo_equipo); prefiere_condicion(autonomia)).

carrera(ingenieria_industrial) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(liderazgo),
    tiene_interes(tecnologia),
    tiene_personalidad(analitico),
    prefiere_condicion(trabajo_equipo).

carrera(medicina) :-
    tiene_interes(salud),
    tiene_habilidad(biologia),
    tiene_personalidad(empatico),
    prefiere_condicion(interaccion_social).

carrera(psicologia) :-
    tiene_interes(salud),
    tiene_personalidad(empatico),
    tiene_habilidad(comunicacion),
    prefiere_condicion(interaccion_social).

carrera(derecho) :-
    tiene_habilidad(argumentacion),
    tiene_interes(derecho),
    tiene_personalidad(pensamiento_critico),
    prefiere_condicion(interaccion_social).

carrera(arquitectura) :-
    tiene_habilidad(creatividad),
    tiene_interes(disenio),
    tiene_personalidad(creativo),
    prefiere_condicion(autonomia).

carrera(disenio_grafico) :-
    tiene_habilidad(creatividad),
    tiene_interes(disenio),
    tiene_personalidad(creativo),
    (prefiere_condicion(autonomia); prefiere_condicion(trabajo_equipo)).

carrera(administracion_empresas) :-
    tiene_habilidad(liderazgo),
    tiene_interes(negocios),
    tiene_personalidad(extrovertido),
    prefiere_condicion(trabajo_equipo).

carrera(marketing) :-
    tiene_habilidad(creatividad),
    tiene_habilidad(liderazgo),
    tiene_interes(negocios),
    tiene_personalidad(extrovertido),
    prefiere_condicion(trabajo_equipo).

carrera(economia) :-
    tiene_habilidad(matematicas),
    tiene_interes(negocios),
    tiene_personalidad(analitico),
    prefiere_condicion(autonomia).

carrera(biologia) :-
    tiene_interes(investigacion),
    tiene_habilidad(biologia),
    tiene_personalidad(meticuloso),
    prefiere_condicion(investigacion).

carrera(educacion) :-
    tiene_interes(educacion),
    tiene_habilidad(comunicacion),
    tiene_personalidad(paciente),
    prefiere_condicion(interaccion_social).

carrera(turismo) :-
    tiene_interes(turismo),
    tiene_personalidad(extrovertido),
    prefiere_condicion(interaccion_social).

carrera(relaciones_internacionales) :-
    tiene_habilidad(argumentacion),
    tiene_interes(relaciones_internacionales),
    tiene_personalidad(extrovertido),
    prefiere_condicion(interaccion_social).

% Preguntas para cada atributo
pregunta(habilidad, matematicas, '¿Te gustan las matematicas?').
pregunta(habilidad, resolucion_problemas, '¿Eres bueno resolviendo problemas?').
pregunta(habilidad, argumentacion, '¿Tienes habilidades argumentativas?').
pregunta(habilidad, creatividad, '¿Eres creativo?').
pregunta(habilidad, liderazgo, '¿Tienes habilidades de liderazgo?').
pregunta(habilidad, biologia, '¿Tienes conocimientos en biología?').
pregunta(habilidad, comunicacion, '¿Tienes buenas habilidades de comunicación?').

pregunta(interes, tecnologia, '¿Te interesa la tecnologia?').
pregunta(interes, salud, '¿Te interesa la salud?').
pregunta(interes, negocios, '¿Te interesan los negocios?').
pregunta(interes, disenio, '¿Te interesa el diseño?').
pregunta(interes, investigacion, '¿Te interesa la investigacion?').
pregunta(interes, educacion, '¿Te interesa la educacion?').
pregunta(interes, derecho, '¿Te interesa el derecho?').
pregunta(interes, turismo, '¿Te interesa el turismo?').
pregunta(interes, relaciones_internacionales, '¿Te interesan las relaciones internacionales?').

pregunta(personalidad, meticuloso, '¿Eres meticuloso?').
pregunta(personalidad, empatico, '¿Eres empatico?').
pregunta(personalidad, extrovertido, '¿Eres extrovertido?').
pregunta(personalidad, pensamiento_critico, '¿Tienes pensamiento critico?').
pregunta(personalidad, analitico, '¿Eres analitico?').
pregunta(personalidad, paciente, '¿Eres paciente?').
pregunta(personalidad, creativo, '¿Te consideras creativo?').

pregunta(condicion, trabajo_equipo, '¿Prefieres trabajar en equipo?').
pregunta(condicion, autonomia, '¿Prefieres trabajar de manera autonoma?').
pregunta(condicion, investigacion, '¿Te gustaria trabajar en investigacion?').
pregunta(condicion, interaccion_social, '¿Te gusta la interacción social?').

% Mecanismo de preguntas dinámicas
tiene_habilidad(Habilidad) :-
    (respuesta(habilidad, Habilidad, si) -> true
    ; (respuesta(habilidad, Habilidad, no) -> fail
    ; preguntar(habilidad, Habilidad))).

tiene_interes(Interes) :-
    (respuesta(interes, Interes, si) -> true
    ; (respuesta(interes, Interes, no) -> fail
    ; preguntar(interes, Interes))).

tiene_personalidad(Personalidad) :-
    (respuesta(personalidad, Personalidad, si) -> true
    ; (respuesta(personalidad, Personalidad, no) -> fail
    ; preguntar(personalidad, Personalidad))).

prefiere_condicion(Condicion) :-
    (respuesta(condicion, Condicion, si) -> true
    ; (respuesta(condicion, Condicion, no) -> fail
    ; preguntar(condicion, Condicion))).

preguntar(Categoria, Atributo) :-
    pregunta(Categoria, Atributo, Pregunta),
    format('~s (si/no): ', [Pregunta]),
    read(Respuesta),
    assertz(respuesta(Categoria, Atributo, Respuesta)),
    Respuesta == si.

% Predicado principal
main :-
    retractall(respuesta(_, _, _)),
    findall(Carrera, carrera(Carrera), Carreras),
    write('Carreras recomendadas:'), nl,
    listar_carreras(Carreras).

listar_carreras([]).
listar_carreras([C|Cs]) :-
    write('- '), write(C), nl,
    listar_carreras(Cs).

% Ejecutar con main.