/* Production Rules :-
R1: (x,y) --> (4,y) if x<4 : Fill A
R2: (x,y) --> (x,3) if y<3 : Fill B
*/

% Goal state
state(2, 0).

% R1 Fill A 
state(X, Y) :-
    X = 4,
    format("Fill the jug from (~d, ~d) -> (4, ~d)", [X, Y, Y]),
    nl,
    state(4, Y).

% R2 Fill B 
state(X, Y) :-
    Y = 3,
    format("Fill the jug from (~d, ~d) -> (~d, 3)", [X, Y, X]),
    nl,
    state(X, 3).

% R3 Empty A 
state(X, Y) :-
    X = 0,
    format("Empty the jug from (~d, ~d) -> (0, ~d)", [X, Y, 0, Y]),
    nl,
    state(0, Y).

% R4 Empty B 
state(X, Y) :-
    Y = 0,
    format("Empty the jug from (~d, ~d) -> (~d, 0)", [X, Y, X, 0]),
    nl,
    state(X, 0).

% Pour some from A to B X+Y >=4
state(X, Y) :-
    X+Y >= 4,
    X > 0,
    Y < 3,
    New_X is X - (3-Y),
    \+(visited_state[New_X, 3]),
    assert(visited_state[X, Y]),
    format("Pour water from A to B"),
    nl,
    state(New_X, 3).

% Pour some from A to B X+Y < 4
state(X, Y) :-
    X+Y < 4,
    X > 0,
    Y <3,
    New_Y is X+Y,
    \+(visited_state[0, New_Y]),
    assert(visited_state[X, Y]),
    format("Pour water fromn A to B"),
    nl,
    state(0, New_Y)

% Pour some from B to A 
state(X, Y) :-
    X+Y >= 4,
    Y>0,
    X<4,
    New_Y is Y - (4-X),
    \+(visited_state[4, New_Y]),
    assert(visited_state[X, Y]),
    format("Pour water from B to A"),
    nl,
    state(4, New_Y)

% Check goal state
state(X,Y) :-
    X == 2,
    Y == 0,
    format("Goal state reached"),
    nl,
    state (X, Y).
