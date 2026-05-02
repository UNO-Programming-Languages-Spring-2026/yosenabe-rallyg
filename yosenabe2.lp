valid_move(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IX = FX, IY != FY.
valid_move(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IY = FY, IX != FX.
% achieved: only allow for cardinal arrows, avoid picking current spot

1 { target(IX,IY,FX,FY) : valid_move(IX,IY,FX,FY) } 1 :- number(IX,IY,_).
% achieved: choose one option of the valid moves

filled(A) :- target(IX,IY,FX,FY), area(FX,FY,A).
% achieved: define filled

:- area(_,_,A), not filled(A).
% achieved: every gray area must have a number

#show target/4.