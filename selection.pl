find_min([X], X).
find_min([Head|Tail], Minimum) :-
 find_min(Tail, MinTail),
 Minimum is min(Head, MinTail).

reverse([], []).
 reverse([Head|Tail], ReversedList) :-
  reverse(Tail, ReversedTail),
  append(ReversedTail, [Head], ReversedList).

selection([], []).
selection(UnsortedList, [Min|SortedList]) :-
 find_min(UnsortedList, Min),
 delete(UnsortedList, Min, RemainingList),
 selection(RemainingList, SortedList).


delete([X|Tail], X, Tail).
delete([Head|Tail], Element, [Head|Rest]) :-
 delete(Tail, Element, Rest).