edge(a, b).
edge(b, c).
edge(a, d).
edge(b, d).
edge(d, e).

neighbour(X, Y) :-
    edge(X, Y); edge(Y, X).

path(X, Y, Path) :-
    path(X, Y, [X], Path).

path(X, Y, PPath, FPath) :-
    neighbour(X, Z),
    \+(member(Z, PPath)),
    path(Z, Y, [Z|PPath], FPath).

path(X, X, PPath, PPath).


/ find all cycles starting from a given vertex in a graph /
find_cycle(X, Cycle) :-
    find_cycle(X, X, [X], Cycle).


find_cycle(X, Y, Path, Cycle) :-
    neighbour(Y, Z),
    \+(member(Z, Path)), 
    find_cycle(X, Z, [Z|Path], Cycle).

 


/ find the shortest path between a pair of vertices /
/ shortest_path(Start, End, Path) :-
/
