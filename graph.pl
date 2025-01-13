% Define edges
edge(a, b).
edge(b, c).
edge(a, d).
edge(b, d).
edge(d, e).

% Define neighbour relationship (undirected graph)
neighbour(X, Y) :-
    edge(X, Y); edge(Y, X).

% Find a path between two vertices
path(X, Y, Path) :-
    path(X, Y, [X], Path).

path(X, X, PPath, PPath).
path(X, Y, PPath, FPath) :-
    neighbour(X, Z),
    \+(member(Z, PPath)),
    path(Z, Y, [Z|PPath], FPath).

% Find all cycles starting from a given vertex
find_cycle(X, Cycle) :-
    find_cycle(X, X, [X], Cycle).

find_cycle(X, Y, Path, Cycle) :-
    neighbour(Y, Z),
    \+(member(Z, Path)),
    find_cycle(X, Z, [Z|Path], Cycle).

find_cycle(X, Y, Path, Cycle) :-
    neighbour(Y, X), % If we return to the start node, it's a cycle
    Cycle = [X|Path].

% Find the shortest path between two vertices
shortest_path(Start, End, Path) :-
    setof(Length-TempPath, (
        path(Start, End, TempPath),
        length(TempPath, Length)
    ), [MinLength-Path|_]).
