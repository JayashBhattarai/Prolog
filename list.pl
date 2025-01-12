% first element
first(X,[H|_]) :- X = H.

% last element
last(X, [H]) :- X is H. 
last(X, [_|T]) :- last(X, T).

% counting number of elements
count(0, []).
/* count(1, [_]).*/
count(X, [_|T]) :- count(X1, T), X is X1+1.

% sum of elements
sum(0, []).
/*sum(H, [H]).*/
sum(X, [H|T]) :- sum(X1, T), X is X1+H.

% find kth element 
k_element(1, [H|_], H).
k_element(K, [_|T], X) :- 
    k_element(K1, T, X), K1 is K-1.

% member
member(X, [X,_]).
member(X, [_|T]) :- member(X, [X|T]).

% find the smallest element in the list
smallest([H|T], MP, M) :- H < MP, !, smallest(T, H, M).
smallest([_|T], MP, M) :- smallest(T, MP, M).
smallest([], M, M).
smallest([H|T], X) :- smallest(T, H, X).

% find the largest element in the list
largest([H|T], MP, M) :- H > MP, !, largest(T, H, M).
largest([_|T], MP, M) :- largest(T, MP, M).
largest([], M, M).
largest([H|T], X) :- largest(T, H, X).

% delete an element from the list
delete(H, [H|T], T) :- !.
delete(_, [], []).
delete(X, [H|T], [H|R]) :- delete(X, T, R).


