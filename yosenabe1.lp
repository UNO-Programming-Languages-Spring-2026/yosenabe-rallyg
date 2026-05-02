possible_target(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IX = FX.

possible_target(IX,IY,FX,FY) :- number(IX,IY,_), area(FX,FY,_), IY = FY.

1 { target(IX,IY,FX,FY) : possible_target(IX,IY,FX,FY) } 1 :- number(IX,IY,_).

#show target/4.