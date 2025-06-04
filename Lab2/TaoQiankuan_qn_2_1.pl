%Facts:
%Offspring
male(charles).
male(andrew).
male(edward).
female(anne).

childof(elizabeth, charles).
childof(elizabeth, anne).
childof(elizabeth, andrew).
childof(elizabeth, edward).

%Birth Sequence
birth_order(charles,1).
birth_order(anne,2).
birth_order(andrew,3).
birth_order(edward,4).

%Rules:
%Old Succession:
old_succession_line(Succession) :-
    % find all male and birth order
    findall(Order-Child,
            (childof(elizabeth, Child), male(Child), birth_order(Child, Order)),
            MalePairs),
    keysort(MalePairs, SortedMalePairs),
    pairs_values(SortedMalePairs, MaleList),

    % find female and birth order
    findall(Order-Child,
            (childof(elizabeth, Child), female(Child), birth_order(Child, Order)),
            FemalePairs),
    keysort(FemalePairs, SortedFemalePairs),
    pairs_values(SortedFemalePairs, FemaleList),

    %male first
    append(MaleList, FemaleList, Succession).

%New Succession
new_succession_line(Succession) :-
    findall(Order-Child,
            (childof(elizabeth, Child), birth_order(Child, Order)),
            Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Succession).
