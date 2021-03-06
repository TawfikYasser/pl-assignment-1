path(X,Y,N,[[X,Y]]):- connected(X,Y), !.

path(X,Y,N,[[X,Z]|T]):-
N = 'any',
connected(X,Z),
path(Z,Y,N,T), !.
%----------------------
path(X,Y,N,[[X,Z]|T]):-
not(N = 'any'),
N > 1,
NewN is N-1,
connected(X,Z),
path(Z,Y,NewN,T), !.

%******************************************

nstations(X,N):-
path(new_elmarg,helwan,any,R1),
match(X,R1,0,N1),

path(shobra_elkheima,alshohadaa,any,R2),
match(X,R2,N1,N2),

path(alshohadaa,naguib,any,R3),
match(X,R3,N2,N3),

path(naguib,elmounib,any,R4),
match(X,R4,N3,N), !.


match(X,[],N,N).

match(X,[[A,X]|T],O,N):-
NewN is O+1,
match(X,T,NewN,N).

match(X,[[X,B]|T],O,N):-
NewN is O+1,
match(X,T,NewN,N).

match(X,[[A,B]|T],O,N):-
match(X,T,O,N).



%first line
connected(new_elmarg,elmarg).
connected(elmarg,ezbet_elnakhl).
connected(ezbet_elnakhl,ain_shams).
connected(ain_shams,elmatareyya).
connected(elmatareyya,helmeyet_elzaitoun).
connected(helmeyet_elzaitoun,hadayeq_elzaitoun).
connected(hadayeq_elzaitoun,saray_elqobba).
connected(saray_elqobba,hammamat_elqobba).
connected(hammamat_elqobba,kobri_elqobba).
connected(kobri_elqobba,manshiet_elsadr).
connected(manshiet_elsadr,eldemerdash).
connected(eldemerdash,ghamra).
connected(ghamra,alshohadaa).
connected(alshohadaa,urabi).
connected(urabi,nasser).
connected(nasser,sadat).
connected(sadat,saad_zaghloul).
connected(saad_zaghloul, alsayyeda_zeinab).
connected(alsayyeda_zeinab,elmalek_elsaleh).
connected(elmalek_elsaleh,margirgis).
connected(margirgis,elzahraa).
connected(elzahraa,dar_elsalam).
connected(dar_elsalam,hadayeq_elmaadi).
connected(hadayeq_elmaadi,maadi).
connected(maadi,thakanat_elmaadi).
connected(thakanat_elmaadi,tora_elbalad).
connected(tora_elbalad,kozzika).
connected(kozzika,tora_elasmant).
connected(tora_elasmant,elmaasara).
connected(elmaasara,hadayeq_helwan).
connected(hadayeq_helwan,wadi_hof).
connected(wadi_hof,helwan_university).
connected(helwan_university,ain_helwan).
connected(ain_helwan,helwan).
%second line
connected(shobra_elkheima,koliet_elzeraa).
connected(koliet_elzeraa,mezallat).
connected(mezallat,khalafawy).
connected(khalafawy,sainte_teresa).
connected(sainte_teresa,road_elfarag).
connected(road_elfarag,massara).
connected(massara,alshohadaa).
connected(alshohadaa,ataba).
connected(ataba,naguib).
connected(naguib,sadat).
connected(sadat,opera).
connected(opera,dokki).
connected(dokki,bohooth).
connected(bohooth,cairo_university).
connected(cairo_university,faisal).
connected(faisal,giza).
connected(giza,omm_elmisryeen).
connected(omm_elmisryeen,sakiat_mekki).
connected(sakiat_mekki,elmounib).
