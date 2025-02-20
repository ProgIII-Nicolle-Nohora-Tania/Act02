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