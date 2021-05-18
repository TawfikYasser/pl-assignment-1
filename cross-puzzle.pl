% We are represent the 3×3 board as a list with 9 elements
% The blank space AS (-1)
% The numbers from 0 -> 7 AS [A,B,C,D,E,F,G,H,I]
% ========================================================
% Facts

% To slide the blank space to the left.

slide([A,-1,C,D,E,F,G,H,I],[-1,A,C,D,E,F,G,H,I]).
slide([A,B,C,D,-1,F,G,H,I],[A,B,C,-1,D,F,G,H,I]).
slide([A,B,C,D,E,F,G,-1,I],[A,B,C,D,E,F,-1,G,I]).

slide([A,B,-1,D,E,F,G,H,I],[A,-1,B,D,E,F,G,H,I]).
slide([A,B,C,D,E,-1,G,H,I],[A,B,C,D,-1,E,G,H,I]).
slide([A,B,C,D,E,F,G,H,-1],[A,B,C,D,E,F,G,-1,H]).

% To slide the blank space to the right.

slide([-1,B,C,D,E,F,G,H,I],[B,-1,C,D,E,F,G,H,I]).
slide([A,B,C,-1,E,F,G,H,I],[A,B,C,E,-1,F,G,H,I]).
slide([A,B,C,D,E,F,-1,H,I],[A,B,C,D,E,F,H,-1,I]).

slide([A,-1,C,D,E,F,G,H,I],[A,C,-1,D,E,F,G,H,I]).
slide([A,B,C,D,-1,F,G,H,I],[A,B,C,D,F,-1,G,H,I]).
slide([A,B,C,D,E,F,G,-1,I],[A,B,C,D,E,F,G,I,-1]).

% To slide the blank space up.

slide([A,B,C,-1,E,F,G,H,I],[-1,B,C,A,E,F,G,H,I]).
slide([A,B,C,D,-1,F,G,H,I],[A,-1,C,D,B,F,G,H,I]).
slide([A,B,C,D,E,-1,G,H,I],[A,B,-1,D,E,C,G,H,I]).

slide([A,B,C,D,E,F,-1,H,I],[A,B,C,-1,E,F,D,H,I]).
slide([A,B,C,D,E,F,G,-1,I],[A,B,C,D,-1,F,G,E,I]).
slide([A,B,C,D,E,F,G,H,-1],[A,B,C,D,E,-1,G,H,F]).

% To slide the blank space down.

slide([-1,B,C,D,E,F,G,H,I],[D,B,C,-1,E,F,G,H,I]).
slide([A,-1,C,D,E,F,G,H,I],[A,E,C,D,-1,F,G,H,I]).
slide([A,B,-1,D,E,F,G,H,I],[A,B,F,D,E,-1,G,H,I]).

slide([A,B,C,-1,E,F,G,H,I],[A,B,C,G,E,F,-1,H,I]).
slide([A,B,C,D,-1,F,G,H,I],[A,B,C,D,H,F,G,-1,I]).
slide([A,B,C,D,E,-1,G,H,I],[A,B,C,D,E,I,G,H,-1]).

% =======================================================

% Rules:

% Base Case
puzzle([-1,0,1,2,3,4,5,6,7],Visited,Visited).

puzzle(StartState,Visited,R):-
slide(StartState,Next),
\+ member(Next,Visited),
puzzle(Next,[Next|Visited],R).

play(S,G):-
puzzle(S,[S],G),!.
