valid_move(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IX = FX, IY != FY.
valid_move(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IY = FY, IX != FX.
% achieved: only allow for cardinal arrows, avoid picking current spot

1 { target(IX,IY,FX,FY) : valid_move(IX,IY,FX,FY) } 1 :- number(IX,IY,_).
% achieved: choose one option of the valid moves

filled(A) :- target(IX,IY,FX,FY), area(FX,FY,A).
% achieved: define filled

:- area(_,_,A), not filled(A).
% achieved: every gray area must have a number

path(IX,IY,IX,PY) :- target(IX,IY,IX,FY), cell(IX,PY), PY <= FY, IY <= PY.
path(IX,IY,IX,PY) :- target(IX,IY,IX,FY), cell(IX,PY), PY <= IY, FY <= PY.
path(IX,IY,PX,IY) :- target(IX,IY,FX,IY), cell(PX,IY), PX <= FX, IX <= PX.
path(IX,IY,PX,IY) :- target(IX,IY,FX,IY), cell(PX,IY), PX <= IX, FX <= PX.
% achieved: define path as every tile vertical or horizontal of a tile

:- path(IX1,IY1,FX,FY), path(IX2,IY2,FX,FY), (IX1,IY1) != (IX2,IY2).
% achieved: restrict 2 paths from crossing

:- goal(A,G), #sum { N,IX,IY : target(IX,IY,FX,FY), number(IX,IY,N), area(FX,FY,A) } != G.

#show target/4.