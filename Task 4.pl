% Main solver predicate
solve :-
    % 1. GENERATION PHASE
    % Define the list of available cities
    Cities = [kharkiv, uman, poltava, slovyansk, kramatorsk],
    
    % Allocate a unique city to each child using the built-in permutation/2
    % This automatically guarantees no two children are from the same city
    permutation(Cities, [Alik, Borya, Vitya, Lena, Dasha]),

    % 2. TESTING PHASE (Applying constraints)
    
    % Statement 1: If Alik is NOT from Uman, then Borya is from Kramatorsk.
    % Logic: (Alik == Uman) OR (Borya == Kramatorsk)
    (Alik = uman ; Borya = kramatorsk),

    % Statement 2: Either Borya OR Vitya is from Kharkiv.
    % Since permutation ensures they can't BOTH be from Kharkiv, a normal OR works as XOR here.
    (Borya = kharkiv ; Vitya = kharkiv),

    % Statement 3: If Vitya is NOT from Slovyansk, then Lena is from Kharkiv.
    % Logic: (Vitya == Slovyansk) OR (Lena == Kharkiv)
    (Vitya = slovyansk ; Lena = kharkiv),

    % Statement 4: Either Dasha is from Uman OR Lena is from Kramatorsk (Strict XOR).
    ( (Dasha = uman, Lena \= kramatorsk) ; (Dasha \= uman, Lena = kramatorsk) ),

    % 3. OUTPUT PHASE
    write('    Solution Found '), nl,
    format('Alik is from ~w~n', [Alik]),
    format('Borya is from ~w~n', [Borya]),
    format('Vitya is from ~w~n', [Vitya]),
    format('Lena is from ~w~n', [Lena]),
    format('Dasha is from ~w~n', [Dasha]),
    halt.

% Auto-start directive
:- initialization(solve).