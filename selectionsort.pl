% Find the minimum element in a list
find_min([X], X).  
find_min([Head|Tail], Minimum) :-
    find_min(Tail, MinTail),  
    Minimum is min(Head, MinTail).

% Reverse a list
reverse_list_elements([], []).  
reverse_list_elements([Head|Tail], ReversedList) :-
    reverse_list_elements(Tail, ReversedTail), 
    append(ReversedTail, [Head], ReversedList).  

% Selection sort implementation
sort_with_selection([], []).  
sort_with_selection(UnsortedList, [MinElement|SortedList]) :-
    find_min(UnsortedList, MinElement),  
    remove_first_occurrence(UnsortedList, MinElement, RemainingList),  
    sort_with_selection(RemainingList, SortedList). 

% Helper predicate to remove the first occurrence of an element in a list
remove_first_occurrence([X|Tail], X, Tail).  
remove_first_occurrence([Head|Tail], Element, [Head|Rest]) :- 
    remove_first_occurrence(Tail, Element, Rest).  
