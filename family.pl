male(john).
male(bob).
male(charles).

female(alice).
female(kate).

parent(bob, john).
parent(alice, bob).
parent(bob, charles). %bobparentofcharles


mother(X, Y) :- female(X), parent(X, Y). %charles

siblings(X, Y) :- parent(Z, X), parent(Z, Y).%al

