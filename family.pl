% Facts
male(john).
male(bob).
male(charles).
male(henry).
male(dan).

female(alice).
female(kate).
female(susan).
female(linda).

parent(bob, john).
parent(alice, bob).
parent(bob, charles). % Bob is the parent of Charles
parent(susan, charles). % Susan is the parent of Charles
parent(henry, bob).
parent(kate, dan).

married(alice, henry).
married(susan, bob). % Step-parent relationship: Susan married Bob after Alice
married(kate, bob). % Step-parent relationship: Kate married Bob after Susan

% Relations
mother(X, Y) :- female(X), parent(X, Y).

father(X, Y) :- male(X), parent(X, Y).

grandfather(X, Y) :- male(X), parent(X, Z), parent(Z, Y).

grandmother(X, Y) :- female(X), parent(X, Z), parent(Z, Y).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

step_sibling(X, Y) :-
    married(Z, W),
    parent(Z, X),
    parent(W, Y),
    \+ parent(Z, Y),
    \+ parent(W, X),
    X \= Y.

step_parent(X, Y) :-
    married(X, Z),
    parent(Z, Y),
    \+ parent(X, Y).

uncle(X, Y) :- 
    male(X),
    sibling(X, Z),
    parent(Z, Y).

aunt(X, Y) :- 
    female(X),
    sibling(X, Z),
    parent(Z, Y).

cousin(X, Y) :-
    parent(Z, X),
    parent(W, Y),
    sibling(Z, W).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Z, X), descendant(Z, Y).

% Example queries:
% ?- mother(alice, bob).
% ?- grandfather(henry, charles).
% ?- step_parent(susan, john).
% ?- step_sibling(charles, dan).
% ?- cousin(john, dan).
