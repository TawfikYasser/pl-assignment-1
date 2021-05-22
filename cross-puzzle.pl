% We are represent the 3×3 board as a list with 9 elements
% The blank space AS (9)
% The numbers from 0 -> 7 AS [A,B,C,D,E,F,G,H,I]

% "Run takes about 1 minute, depends on the start state (To find all combinations to sort the goal as needed).

% ========================================================
% Facts

% To slide the blank space to the left.

slide([A,9,C,D,E,F,G,H,I],[9,A,C,D,E,F,G,H,I]).
slide([A,B,C,D,9,F,G,H,I],[A,B,C,9,D,F,G,H,I]).
slide([A,B,C,D,E,F,G,9,I],[A,B,C,D,E,F,9,G,I]).

slide([A,B,9,D,E,F,G,H,I],[A,9,B,D,E,F,G,H,I]).
slide([A,B,C,D,E,9,G,H,I],[A,B,C,D,9,E,G,H,I]).
slide([A,B,C,D,E,F,G,H,9],[A,B,C,D,E,F,G,9,H]).

% To slide the blank space to the right.

slide([9,B,C,D,E,F,G,H,I],[B,9,C,D,E,F,G,H,I]).
slide([A,B,C,9,E,F,G,H,I],[A,B,C,E,9,F,G,H,I]).
slide([A,B,C,D,E,F,9,H,I],[A,B,C,D,E,F,H,9,I]).

slide([A,9,C,D,E,F,G,H,I],[A,C,9,D,E,F,G,H,I]).
slide([A,B,C,D,9,F,G,H,I],[A,B,C,D,F,9,G,H,I]).
slide([A,B,C,D,E,F,G,9,I],[A,B,C,D,E,F,G,I,9]).

% To slide the blank space up.

slide([A,B,C,9,E,F,G,H,I],[9,B,C,A,E,F,G,H,I]).
slide([A,B,C,D,9,F,G,H,I],[A,9,C,D,B,F,G,H,I]).
slide([A,B,C,D,E,9,G,H,I],[A,B,9,D,E,C,G,H,I]).

slide([A,B,C,D,E,F,9,H,I],[A,B,C,9,E,F,D,H,I]).
slide([A,B,C,D,E,F,G,9,I],[A,B,C,D,9,F,G,E,I]).
slide([A,B,C,D,E,F,G,H,9],[A,B,C,D,E,9,G,H,F]).

% To slide the blank space down.

slide([9,B,C,D,E,F,G,H,I],[D,B,C,9,E,F,G,H,I]).
slide([A,9,C,D,E,F,G,H,I],[A,E,C,D,9,F,G,H,I]).
slide([A,B,9,D,E,F,G,H,I],[A,B,F,D,E,9,G,H,I]).

slide([A,B,C,9,E,F,G,H,I],[A,B,C,G,E,F,9,H,I]).
slide([A,B,C,D,9,F,G,H,I],[A,B,C,D,H,F,G,9,I]).
slide([A,B,C,D,E,9,G,H,I],[A,B,C,D,E,I,G,H,9]).

% =======================================================

% Rules:

% Base Case
puzzle([9,0,1,2,3,4,5,6,7],Visited,Visited).

puzzle(StartState,Visited,R):-
slide(StartState,Next),
\+ member(Next,Visited),
write(Next),nl,
puzzle(Next,[Next|Visited],R).

play(S,G):-
puzzle(S,[S],G),!.
