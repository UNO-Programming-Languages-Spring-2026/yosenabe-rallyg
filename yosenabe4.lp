possible_target(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IX = FX.

possible_target(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IY = FY.
% achieved: any (FX,FY) is reachable from any (IX,IY)

1 { target(IX,IY,FX,FY) : possible_target(IX,IY,FX,FY) } 1 :- number(IX,IY,_).
% achieved: every (IX,IY) only gets assigned to one (FX,FY)

covered(A) :- target(_,_,FX,FY), area(FX,FY,A).

:- area(_,_,A), not covered(A).
% achieved: ensure every area has at least one number moved into it

vertical_target(IX,IY,FX,FY) :- target(IX,IY,FX,FY), IX = FX.
horizontal_target(IX,IY,FX,FY) :- target(IX,IY,FX,FY), IY = FY.
% achieved: define cells on path as occupied

occupied(IX,IY,IX,IY) :- vertical_target(IX,IY,FX,FY).
occupied(IX,Y+1,IX,IY) :- occupied(IX,Y,IX,IY), vertical_target(IX,IY,FX,FY), Y < FY, IY <= FY.
occupied(IX,Y-1,IX,IY) :- occupied(IX,Y,IX,IY), vertical_target(IX,IY,FX,FY), Y > FY, IY > FY.
% achieved: define vertical moves

occupied(IX,IY,IX,IY) :- horizontal_target(IX,IY,FX,FY).
occupied(X+1,IY,IX,IY) :- occupied(X,IY,IX,IY), horizontal_target(IX,IY,FX,FY), X < FX, IX <= FX.
occupied(X-1,IY,IX,IY) :- occupied(X,IY,IX,IY), horizontal_target(IX,IY,FX,FY), X > FX, IX > FX.
% achieved: define horizontal moves

:- occupied(X,Y,IX1,IY1), occupied(X,Y,IX2,IY2), (IX1,IY1) != (IX2,IY2).
% achieved: make sure no two paths share a cell

:- goal(A,G), #sum { N : number(IX,IY,N), target(IX,IY,FX,FY), area(FX,FY,A) } != G.
% achieved: made sure the numbers add the to proper sum 


#show target/4.