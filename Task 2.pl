
find_max([X], X) :- !.

find_max([H|T], Max) :-
    find_max(T, MaxT),
    (H > MaxT -> Max = H ; Max = MaxT).


% В списке из одного элемента он и есть минимум
find_min([X], X) :- !.

find_min([H|T], Min) :-
    find_min(T, MinT),
    (H < MinT -> Min = H ; Min = MinT).


solve :-
    write('Enter a list ([10, 2, 8, 3]): '),
    read(List),
    
    (List = [_|_] ->
        find_max(List, MaxValue),
        find_min(List, MinValue),
        Diff is MaxValue - MinValue,
        format('Max: ~w, Min: ~w, Result: ~w~n', [MaxValue, MinValue, Diff])
    ;
        write('Error: Empty list'), nl
    ),
    halt. % Завершить выполнение после вывода


:- initialization(solve).
