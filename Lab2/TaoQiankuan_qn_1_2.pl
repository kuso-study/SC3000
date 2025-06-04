% Facts:
competitor(sumsum, appy).
smartphonetech(galactica-s3).
develop(sumsum, galactica-s3).
steal(stevey, galactica-s3, sumsum).
boss(stevey, appy).

% Rules
rival(X, Y) :- competitor(X, Y).
business(X) :- smartphonetech(X).


unethical(X):-
    boss(X, Company),
    rival(Rival, Company),
    develop(Rival, Busi_thing),
    business(Busi_thing),
    steal(X, Busi_thing, Rival).









