% Нахождение МАКСИМАЛЬНОГО элемента (рекурсия по списку)
% Базис: в списке из одного элемента он и есть максимум
find_max([X], X) :- !.
% Шаг: сравниваем голову с максимумом хвоста
find_max([H|T], Max) :-
    find_max(T, MaxT),
    (H > MaxT -> Max = H ; Max = MaxT).

% Нахождение МИНИМАЛЬНОГО элемента (рекурсия по списку)
% Базис: в списке из одного элемента он и есть минимум
find_min([X], X) :- !.
% Шаг: сравниваем голову с минимумом хвоста
find_min([H|T], Min) :-
    find_min(T, MinT),
    (H < MinT -> Min = H ; Min = MinT).

% Основной предикат (аналог solve из лекций)
solve :-
    write('Enter a list ([10, 2, 8, 3]): '),
    read(List),
    % Простейшая проверка: список должен иметь голову и хвост
    (List = [_|_] ->
        find_max(List, MaxValue),
        find_min(List, MinValue),
        Diff is MaxValue - MinValue,
        format('Max: ~w, Min: ~w, Result: ~w~n', [MaxValue, MinValue, Diff])
    ;
        write('Error: Empty list'), nl
    ),
    halt. % Завершить выполнение после вывода

% Директива инициализации (аналог GOAL)
:- initialization(solve).