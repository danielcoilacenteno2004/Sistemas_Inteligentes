% Hechos: relación padre-hijo
padre(david, daniel).
padre(david, melany).
padre(david, ariana).

padre(epifanio, david).
padre(epifanio, julio).
padre(epifanio, edgar).
padre(epifanio, juan).
padre(epifanio, raul).

padre(juan, axel).
padre(juan, liam).

padre(andres, dianeth).
padre(andres, richard).
padre(andres, william).
padre(andres, gladys).

padre(manuel, dariel).
padre(manuel, camila).

% Hechos: relación madre-hijo
madre(dianeth, daniel).
madre(dianeth, melany).
madre(dianeth, ariana).

madre(teodosia, david).
madre(teodosia, julio).
madre(teodosia, edgar).
madre(teodosia, juan).
madre(teodosia, raul).

madre(angie, axel).
madre(angie, liam).

madre(julia, dianeth).
madre(julia, richard).
madre(julia, william).
madre(julia, gladys).

madre(gladys, dariel).
madre(gladys, camila).



% Regla: hermanos
hermano(X, Y) :-
    padre(P, X), padre(P, Y), X \= Y.
hermano(X, Y) :-
    madre(M, X), madre(M, Y), X \= Y.

% Regla: abuelo y abuela
abuelo(X, Y) :-
    padre(X, P), (padre(P, Y); madre(P, Y)).

abuela(X, Y) :-
    madre(X, P), (padre(P, Y); madre(P, Y)).

% Regla: tío y tía
tio(X, Y) :-
    hermano(X, P), (padre(P, Y); madre(P, Y)).

tia(X, Y) :-
    hermano(X, P), (padre(P, Y); madre(P, Y)).
