arista(vancouver, edmonton, 16).
arista(vancouver, calgary, 13).

arista(calgary, regina, 14).
arista(calgary, edmonton, 4).

arista(edmonton, saskatoon, 12).

arista(regina, saskatoon, 7).
arista(regina, winnipeg, 4).

arista(saskatoon, calgary, 9).
arista(saskatoon, winnipeg, 20).

%Existe conexion entre X y Y?
tiene_conexion(X, Y) :- arista(X, Y, _C).

%Con qué nodos está conectado y cuál es el costo de cada conexion?
conectado_a(X, Y, C) :- arista(X, Y, C).

%Determinar si un nodo tiene aristas 
tiene_aristas(X) :- tiene_conexion(X, _Y).

%Desterminar costo para ir de X a Z pasando por Y
costo(X, Y, Z, S) :- conectado_a(X, Y, C1), conectado_a(Y, Z, C2), S is C1 + C2.
% Caso base: hay una arista directa entre X e Y
camino_a(X, Y, [X, Y], C) :- arista(X, Y, C).

camino_a(X, Y, [X | Camino], Costo) :-
    arista(X, Z, C1),                 
    Z \= Y,                            
    camino_a(Z, Y, Camino, C2, [X]),   
    Costo is C1 + C2.

camino_a(X, Y, [X, Y], C, _) :- arista(X, Y, C).
camino_a(X, Y, [X | Camino], Costo, Visitados) :-
    arista(X, Z, C1), 
    \+ member(Z, Visitados),          
    camino_a(Z, Y, Camino, C2, [Z | Visitados]),  
    Costo is C1 + C2.
