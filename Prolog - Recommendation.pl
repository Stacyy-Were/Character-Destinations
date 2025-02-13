% Facts about destinations with accommodation
%SARARA TREEHOUSES
destination(sarara_treehouses, location(namunyak), plan(culture), accommodation([family_unit, room])).
destination(sarara_treehouses, location(namunyak), plan(conservation), accommodation([family_unit, room])).


%SARARA CAMP
destination(sarara_camp, location(namunyak), plan(romance), accommodation([sarara_house, room])).
destination(sarara_camp, location(namunyak), plan(wildlife), accommodation([sarara_house, room])).
destination(sarara_camp, location(namunyak), plan(adventure), accommodation([sarara_house, room])).

%SARARA WILDERNESS
destination(sarara_wilderness, location(namunyak), plan(wildliving), accommodation([room])).

%RETETI HOUSE
destination(reteti_house, location(namunyak), plan(villalife), accommodation([family_unit, room])).

%OL MALO NOMAD
destination(ol_malo_nomad, location(olmalo), plan(culture), accommodation([room])).

%OL MALO LODGE
destination(ol_malo_lodge, location(olmalo), plan(romance), accommodation([family_unit, room, guide_room])).
destination(ol_malo_lodge, location(olmalo), plan(culture), accommodation([family_unit, room, guide_room])).
destination(ol_malo_lodge, location(olmalo), plan(adventure), accommodation([family_unit, room, guide_room])).
destination(ol_malo_lodge, location(olmalo), plan(wildliving), accommodation([family_unit, room, guide_room])).



%OL MALO HOUSE
destination(ol_malo_house, location(olmalo), plan(culture), accommodation([family_unit, room])).
destination(ol_malo_house, location(olmalo), plan(villalife), accommodation([family_unit, room])).

%TANGULIA MARA CAMP
destination(tangulia_mara_camp, location(marareserve), plan(adventure), accommodation(family_uniy, room])).

%TANGULIA NDOGO
destination(tangulia_ndogo, location(marareserve), plan(culture), accommodation([family_unit, room])).

%LEWA HOUSE
destination(lewa_house, location(lewa_wildlife_conservancy), plan(family), accommodation([family cottage, earthpod])).
destination(lewa_house, location(lewa_wildlife_conservancy), plan(romance), accommodation([family cottage, earthpod])).
destination(lewa_house, location(lewa_wildlife_conservancy), plan(wildlife), accommodation([family cottage, earthpod])).
destination(lewa_house, location(lewa_wildlife_conservancy), plan(wildliving), accommodation([family cottage, earthpod])).
destination(lewa_house, location(lewa_wildlife_conservancy), plan(conservation), accommodation([family cottage, earthpod])).

%HOUSE IN THE WILD
destination(house_in_the_wild, location(marareserve), plan(family), accommodation([family_unit, room])).
destination(house_in_the_wild, location(marareserve), plan(wildliving), accommodation([family_unit, room])).
destination(house_in_the_wild, location(marareserve), plan(conservation), accommodation([family_unit, room])).

%NAISABAH
destination(naisabah, location(lamu), plan(ocean), accommodation([room, bunk_room])).

%EMAKOKO
destination(the_emakoko, location(nairobi), plan(family), accommodation([private_house, dayroom, room])).
destination(the_emakoko, location(nairobi), plan(romance), accommodation([private_house, dayroom, room])).
destination(the_emakoko, location(nairobi), plan(wildlife), accommodation([private_house, dayroom, room])).
destination(the_emakoko, location(nairobi), plan(villalife), accommodation([private_house, dayroom, room])).
destination(the_emakoko, location(nairobi), plan(wildliving), accommodation([private_house, dayroom, room])).

% Rules for recommending destinations based on user preferences
recommend_destination(Name, Plan, Accommodation, Location) :- 
    destination(Name, location(Location), plan(Plan), accommodation(AccList)),
    member(Accommodation, AccList).  % Check if the requested accommodation is in the list

% Entry point to start the program
start :- 
    write('Hello! Welcome to the Safari Planning System.'), nl,
    write('Let us help you find the best safari experience.'), nl,
    ask_preference.

% Asking for user input and finding matching destinations
ask_preference :- 
    write('Enter safari plan (conservation, adventure, wildliving, romance, culture): '),
    read(Plan),
    write('Enter accommodation preference (dayroom, room, private_house, family_unit): '),
    read(Accommodation),
    % Ensure input is in lowercase for case insensitivity (if required)
    downcase_atom(Accommodation, AccommodationLower),
    find_destinations(Plan, AccommodationLower).

% Finding and displaying matching destinations
find_destinations(Plan, Accommodation) :- 
    repeat, % allows us to loop through all recommendations
    (   recommend_destination(Name, Plan, Accommodation, Location),
        format('We recommend: ~w, Location: ~w, Accommodation: ~w~n', [Name, Location, Accommodation]), 
        display_facts(Name), % Display facts about the destination
        fail % forces backtracking to search for additional recommendations
    ;   write('“People learn a lot about themselves on safari...like shining a mirror on their own lives”
               — Sophie Macfarlane, Lewa House'), nl, 
        ! % stops after the last result
    ).

% Display facts about the destination
display_facts(Name) :-
    (   Name = sarara_treehouses -> write('Sarara Treehouses: Escape into the wild with 1. Game Drives 2. Guides Walks and Hikes 3. Samburu Balcksmiths 4. Vising Reteti Elephant Sanctuary 5. An Ol Olokwe Excursion 6. A sundowner 7. A horseback safari 8. The seasonal Singing Wells 9. Vising a Samburu manyatta 10. Flycamping 11. Beading with Samburu women'), nl;
        Name = sarara_camp -> write('Sarara Camp: Escape into the wild with 1. Game Drives 2. Guides Walks and Hikes 3. Samburu Balcksmiths 4. Vising Reteti Elephant Sanctuary 5. An Ol Olokwe Excursion 6. A sundowner 7. A horseback safari 8. The seasonal Singing Wells 9. Vising a Samburu manyatta 10. Flycamping 11. Beading with Samburu women'), nl;
        Name = sarara_wilderness -> write('Sarara Wilderness: Escape into the wild with 1. Game Drives 2. Guides Walks and Hikes 3. Samburu Balcksmiths 4. Vising Reteti Elephant Sanctuary 5. An Ol Olokwe Excursion 6. A sundowner 7. A horseback safari 8. The seasonal Singing Wells 9. Vising a Samburu manyatta 10. Flycamping 11. Beading with Samburu women'), nl;
        Name = reteti_house -> write('Reteti House: '), nl;
        Name = ol_malo_nomad -> write('Ol Malo Nomad: '), nl;
        Name = ol_malo_lodge -> write('Ol Malo Lodge: '), nl;
        Name = ol_malo_house -> write('Ol Malo House: '), nl;
        Name = tangulia_mara_camp -> write('Tangulia Mara Camp: '), nl;
        Name = tangulia_ndogo -> write('Tangulia Ndogo: '), nl;
        Name = lewa_house -> write('Lewa House: '), nl;
        Name = house_in_the_wild -> write('House in the Wild: '), nl;
        Name = naisabah -> write('Naisabah: '), nl;
        Name = the_emakoko -> write('The Emakoko: '), nl;
        Name = samburu -> write('Samburu: '), nl
    ).
