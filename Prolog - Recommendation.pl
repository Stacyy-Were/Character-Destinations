% Facts about destinations with accommodation
destination(sarara_treehouses, location(namunyak_wildlife_conservancy), plan(culture), accommodation([family_unit, room])).
destination(sarara_treehouses, location(namunyak_wildlife_conservancy), plan(conservation), accommodation([family_unit, room])).

destination(sarara_camp, location(namunyak_wildlife_conservancy), plan(romance), accommodation([sarara_house, room])).
destination(sarara_camp, location(namunyak_wildlife_conservancy), plan(wildlife), accommodation([sarara_house, room])).
destination(sarara_camp, location(namunyak_wildlife_conservancy), plan(adventure), accommodation([sarara_house, room])).

destination(sarara_wilderness, location(namunyak_wildlife_conservancy), plan(wildliving), accommodation([room])).

destination(reteti_house, location(namunyak_wildlife_conservancy), plan(villalife), accommodation([family_unit, room])).

destination(ol_malo_nomad, location(olmalo), plan(culture), accommodation([tent])).

destination(ol_malo_lodge, location(olmalo), plan(romance), accommodation([family_unit, room, guide_room])).
destination(ol_malo_lodge, location(olmalo), plan(culture), accommodation([family_unit, room, guide_room])).
destination(ol_malo_lodge, location(olmalo), plan(adventure), accommodation([family_unit, room, guide_room])).
destination(ol_malo_lodge, location(olmalo), plan(wildliving), accommodation([family_unit, room, guide_room])).

destination(ol_malo_house, location(olmalo), plan(culture), accommodation([family_unit, room])).
destination(ol_malo_house, location(olmalo), plan(villalife), accommodation([family_unit, room])).

destination(tangulia_mara_camp, location(private_land_in_musiara_area), plan(adventure), accommodation([family_unit, room])).

destination(tangulia_ndogo, location(private_land_in_musiara_area), plan(culture), accommodation([family_unit, room])).

destination(lewa_house, location(lewa_wildlife_conservancy), plan(family), accommodation([family_cottage, earthpod])).
destination(lewa_house, location(lewa_wildlife_conservancy), plan(romance), accommodation([family_cottage, earthpod])).
destination(lewa_house, location(lewa_wildlife_conservancy), plan(wildlife), accommodation([family_cottage, earthpod])).
destination(lewa_house, location(lewa_wildlife_conservancy), plan(wildliving), accommodation([family_cottage, earthpod])).
destination(lewa_house, location(lewa_wildlife_conservancy), plan(conservation), accommodation([family_cottage, earthpod])).

destination(house_in_the_wild, location(enonkishu_conservancy), plan(family), accommodation([family_unit, room])).
destination(house_in_the_wild, location(enonkishu_conservancy), plan(wildliving), accommodation([family_unit, room])).
destination(house_in_the_wild, location(enonkishu_conservancy), plan(conservation), accommodation([family_unit, room])).

destination(naisabah, location(lamu), plan(ocean), accommodation([room, bunk_room])).

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
    downcase_atom(Accommodation, AccommodationLower), % Ensure input is in lowercase for case insensitivity
    find_destinations(Plan, AccommodationLower).

% Finding and displaying matching destinations
find_destinations(Plan, Accommodation) :- 
    (   recommend_destination(Name, Plan, Accommodation, Location),
        format('We recommend: ~w, Location: ~w, Accommodation: ~w~n', [Name, Location, Accommodation]), 
        display_facts(Name), % Display facts about the destination
        fail % forces backtracking to search for additional recommendations
    ;   write('People learn a lot about themselves on safari...like shining a mirror on their own lives, nl
               — Sophie Macfarlane, Lewa House'), nl, 
        ! % stops after the last result
    ).

% Display facts about the destination
display_facts(Name) :-
    (   Name = sarara_treehouses -> write('Sarara Treehouses: Escape into the wild with 1. Game Drives 2. Guides Walks and Hikes 3. Samburu Blacksmiths 4. Visiting Reteti Elephant Sanctuary 5. An Ol Olokwe Excursion 6. A sundowner 7. A horseback safari 8. The seasonal Singing Wells 9. Visiting a Samburu manyatta 10. Flycamping 11. Beading with Samburu women'), nl;
        Name = sarara_camp -> write('Sarara Camp: Escape into the wild with 1. Game Drives 2. Guides Walks and Hikes 3. Samburu Blacksmiths 4. Visiting Reteti Elephant Sanctuary 5. An Ol Olokwe Excursion 6. A sundowner 7. A horseback safari 8. The seasonal Singing Wells 9. Visiting a Samburu manyatta 10. Flycamping 11. Beading with Samburu women'), nl;
        Name = sarara_wilderness -> write('Sarara Wilderness: Escape into the wild with 1. Game Drives 2. Guides Walks and Hikes 3. Samburu Blacksmiths 4. Visiting Reteti Elephant Sanctuary 5. An Ol Olokwe Excursion 6. A sundowner 7. A horseback safari 8. The seasonal Singing Wells 9. Visiting a Samburu manyatta 10. Flycamping 11. Beading with Samburu women'), nl;
        Name = reteti_house -> write('Reteti House: Escape into the wild with 1. Visit Reteti Elephant Sanctuary 2. Game Drives 3. Samburu cultural experiences'), nl;
        Name = ol_malo_nomad -> write('Ol Malo Nomad: Escape into the wild with 1. Tent stays 2. Adventure safaris 3. Cultural experiences'), nl;
        Name = ol_malo_lodge -> write('Ol Malo Lodge: Escape into the wild with 1. Family-friendly accommodations 2. Adventure safaris 3. Cultural experiences'), nl;
        Name = ol_malo_house -> write('Ol Malo House: Escape into the wild with 1. Family units 2. Relaxed atmosphere 3. Cultural experiences'), nl;
        Name = tangulia_mara_camp -> write('Tangulia Mara Camp: Escape into the wild with 1. Game Drives 2. Adventure safaris 3. Mara region exploration'), nl;
        Name = tangulia_ndogo -> write('Tangulia Ndogo: Escape into the wild with 1. Cultural experiences 2. Relaxing atmosphere'), nl;
        Name = lewa_house -> write('Lewa House: Escape into the wild with 1. Family-friendly 2. Cultural experiences 3. Wildlife encounters'), nl;
        Name = house_in_the_wild -> write('House in the Wild: Escape into the wild with 1. Private experiences 2. Relaxation 3. Wildlife encounters'), nl;
        Name = naisabah -> write('Naisabah: Escape into the wild with 1. Ocean views 2. Peaceful environment'), nl;
        Name = the_emakoko -> write('The Emakoko: Escape into the wild with 1. Family accommodations 2. Dayroom services 3. Wildlife encounters'), nl;
        Name = samburu -> write('Samburu: Explore the Samburu region with 1. Unique cultural experiences 2. Wildlife safaris'), nl
    ).
