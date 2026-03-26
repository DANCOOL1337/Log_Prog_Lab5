
select_digit(X, [X|T], T).

select_digit(X, [H|T], [H|R]) :- 
    select_digit(X, T, R).


unique_num(Num) :-
    
    select_digit(D1, [1,2,3,4,5,6,7,8,9], Rest1),
    
    select_digit(D2, [0|Rest1], Rest2),
    
    select_digit(D3, Rest2, _),
    
    Num is D1*100 + D2*10 + D3.


solve :-
    write('Enter any number and a period (for example, 1.) to start: '),
    read(_),
    
    % findall собирает все значения Num, для которых unique_num истинен
    findall(N, unique_num(N), ResultList),
    
    write('List of three-digit numbers without repeating digits:'), nl,
    write(ResultList), nl,
    halt.

% Директива для автоматического запуска программы
:- solve.
