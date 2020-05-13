
/* NAME: Jacob Hill
 *  Date: 4/2/20
 *  Assignment 6 Prolog 1 */

/* oddsize predicate
 *  one or more items in a list */

oddSize([_]).
oddSize([_,_|Tail]) :-
    oddSize(Tail).

/* evenSize predicate
 *  Only difference really is assuring that we're accounting for an
 * empty set */
evenSize([]).
evenSize([_,_|Tail]) :-
    evenSize(Tail).

/* prefix predicate */
prefix([],_).
prefix([X|Y], [X|NextY]) :-
    prefix(Y,NextY).
/* query: prefix([X, [1,2,3])
 *  should yield:
 *  X = []; enter
 *  X = [1]; enter
 *  X = [1,2]; enter
 *  X = [1,2,3]; enter */

/* isMember predicate */
/* Claims that X is a member of set Y */
isMember(First, [First|_]).
isMember(First, [_|Last]) :-
    isMember(First,Last).


/* remove predicate */
/* remove(X,Y,Z) is true if list Z is the result of
 *  removing the first instance of item X from list Y.
 *  Test with remove(number, list, Z)
 *  (note to self) come back and check again */

remove(X, [X|Y], Y).
remove(X, [Z|LY], [Z|NY]) :-
    remove(X,LY,NY).

/* isUnion predicate
 *  isUnion(X,Y,Z) says the union of X AND Y is Z */

isUnion([],[],[]).
isUnion([FirstH|X], Y, [FirstH|Z]) :-
    isUnion(X,Y,Z).
isUnion([],[NexH|Y],[NexH|Z]) :-
    isUnion([],Y,Z).

/* isEqual predicate
 *  Sets X and Y are equal
 *  Use isMember predicate for help
 which checks to see if an element is in another set*/
isEqual([],_).
isEqual([HeadX|X], Y) :-
    isMember(HeadX,Y),
    isEqual(X,Y).

/* between predicate (WORKS)
 *  true if between(N1,N2,X) = X between N1 & N2
 *  between(3,8,X) should yield X = [4,5,6,7].
 *  think about using "is" operator
 *  is example: R is N1+1 = exp. N1+1. */
between(_,_,[]).
between(N1,N2,[Head|X]) :-
    R is N1+1,
    Head = R,
    R < N2,
    between(R, N2, X).



/* END OF HOMEWORK.*/

/* self notes:
 *** mother(X,Y) :- parent(X,Y), female(X).
 *
 *-- Declerative Reading: X is the mother of Y IF X is a parent of Y
 * AND X is a female.
 * -- Approx Procedural Reading: To show that X is the mother of Y,
 * first show that X is a parent of Y, then show that X is femals.
 *
 */

/* parent(adam, Child)
 * parent(adam, seth)
 * binds variable Child to the atom seth */


membe(A, [A | _]).
membe(A, [_| B]) :- membe(A,B).
/* A is a member of B */
