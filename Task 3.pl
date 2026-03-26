% 1. MEMBER: Проверка наличия элемента в списке 
is_member(X, [X|_]) :- !.
is_member(X, [_|T]) :- is_member(X, T).

% 2. SUBSET: Проверка на подмножество 

is_subset([], _) :- !.
% Рекурсия: голова H должна быть в S, и хвост T тоже должен быть подмножеством S
is_subset([H|T], S) :-
    is_member(H, S),
    is_subset(T, S).


solve :-
    write('Enter first set (e.g. [1,2,3].): '),
    read(Set1),
    write('Enter second set (e.g. [1,2].): '),
    read(Set2),
    
    % Проверяем: Set1 входит в Set2 ИЛИ Set2 входит в Set1
    (   is_subset(Set1, Set2) -> 
        write('Result: Set1 is a subset of Set2'), nl
    ;   is_subset(Set2, Set1) -> 
        write('Result: Set2 is a subset of Set1'), nl
    ;   write('Result: No subset relationship found'), nl
    ),
    halt.


:- initialization(solve).
