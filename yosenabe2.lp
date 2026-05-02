possible_target(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IX = FX.

possible_target(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IY = FY.
% achieved: any (FX,FY) is reachable from any (IX,IY)

1 { target(IX,IY,FX,FY) : possible_target(IX,IY,FX,FY) } 1 :- number(IX,IY,_).
% achieved: every (IX,IY) only gets assigned to one (FX,FY)

covered(A) :- target(_,_,FX,FY), area(FX,FY,A).

:- area(_,_,A), not covered(A).
% achieved: ensure every area has at least one number moved into it

#show target/4.