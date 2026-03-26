
solve :-

    Cities = [kharkiv, uman, poltava, slovyansk, kramatorsk],
    
    
    permutation(Cities, [Alik, Borya, Vitya, Lena, Dasha]),

    
    (Alik = uman ; Borya = kramatorsk),

    
    (Borya = kharkiv ; Vitya = kharkiv),

    
    (Vitya = slovyansk ; Lena = kharkiv),

    
    ( (Dasha = uman, Lena \= kramatorsk) ; (Dasha \= uman, Lena = kramatorsk) ),

    % 3. OUTPUT PHASE
    write('    Solution Found '), nl,
    format('Alik is from ~w~n', [Alik]),
    format('Borya is from ~w~n', [Borya]),
    format('Vitya is from ~w~n', [Vitya]),
    format('Lena is from ~w~n', [Lena]),
    format('Dasha is from ~w~n', [Dasha]),
    halt.


:- initialization(solve).
