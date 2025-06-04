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

%New Succession
new_succession_line(Succession) :-
    findall(Order-Child,
            (childof(elizabeth, Child), birth_order(Child, Order)),
            Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Succession).
