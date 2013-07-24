:-use_module(library(lists)).
:-set_prolog_flag(toplevel_print_options, [max_depth(100)]).

%%%%%%%%%%%%%%
% Question 1 %
%%%%%%%%%%%%%%

% Helper predicates to convert a code word to its true meaning.
% codeword(Encoded, Decoded) is defined for codewords so that for a code word Encoded then Decoded will be the actual meaning
codeword(bear,double).
codeword(cub,agent).

% translation(Word, Translation) is defined so that for a word Word then Translation is the word it really stands for (which will be itself in the case that Word isn't a codeword).
% Implemented as:
% If codeword/2 gives a translation for Word use that.
translation(Word, Decoded):-codeword(Word,Decoded).
% Otherwise if there is no codeword Word, then Word is it's own translation.
translation(Word,Word):- \+codeword(Word,AnotherWord).

% Now can implement decode/2 using translation/2 predicate
% This may be overkill for the specific question asked but makes it easy to add new codewords as they become known
decode([],[]).
decode([H|T],DecodedMessage):-translation(H,DecodedHead),decode(T,DecodedTail),append([DecodedHead],DecodedTail,DecodedMessage).

%%%%%%%%%%%%%%
% Question 2 %
%%%%%%%%%%%%%%

% N.B. Treating an accusation as the presence of a phrase [X,is,a,bear,cub] within a ENCODED message.

% Helper predicate agent(Encoded_Message,Agent) is defined so that for a encoded message Encoded_Message, X is identified as a double agent in the message.
agent([X,is,a,bear,cub|T],X).
agent([H|T],X):-agent(T,X).

strip_accusations([],[]).
strip_accusations([X,is,a,bear,cub|RemainingMessage],[X|Accused]):- strip_accusations(RemainingMessage,Accused),\+member(X,Accused),!.
strip_accusations([X|RemainingMessage],Accused):- strip_accusations(RemainingMessage,Accused).

% Can now use this agent/2 helper to define agents/3
% Using find_all then sorting so we get an empty list if there are no accusations
agents(Message,Decoded_Message,ListOfAgents):-decode(Message,Decoded_Message),(setof(Agent,agent(Message,Agent),SortedListOfAgents) -> ListOfAgents=SortedListOfAgents ; ListOfAgents=[]).

%%%%%%%%%%%%%%
% Question 3 %
%%%%%%%%%%%%%%

% count_phrase(Phrase, Sentence, Count) is defined so that Count will be the number of occurances of Phrase in Sentence.
% Assuming Phrase and Sentence are instatiated when called.
count_phrase(P,[],0).
count_phrase(P,S,C):-append(P,Tail,S),count_phrase(P,Tail,SubC), C is SubC+1,!.
count_phrase(P,[H|S],C):- P\=[H],count_phrase(P,S,C).

% count_word/3 is then just a special case of count_phrase/3
count_word(W,S,C):-count_phrase([W],S,C).

%%%%%%%%%%%%%%
% Question 4 %
%%%%%%%%%%%%%%

count_ag_names(Message, Ag_name_counts):-agents(Message,Decoded_Message,Agents),findall((Agent_Name,Count),(member(Agent_Name,Agents),count_word(Agent_Name,Message,Count)),Ag_name_counts).

%%%%%%%%%%%%%%
% Question 5 %
%%%%%%%%%%%%%%

% swap(Pairs, Swapped) is defined so that will take a list of pairs Pairs and Swapped will be a list of the pairs but with each pair swapped internally.
swap([],[]).
swap([(Count,Name)|T],[(Name,Count)|SwappedT]):-swap(T,SwappedT).

% myReverse(List, RevList) is defined so that for a list List, RevList is the list in reverse order
myReverse([], []).
myReverse([Head|Tail], RevList):-myReverse(Tail,RevTail),append(RevTail,[Head],RevList).

% To implement accusation_counts/2, we get a list of pairs in the form (Count, Agent_Name).
% Then order this list so it will be ascending in Count. Then reverse the whole list so it will be descending order in count using myReverse/2.
% Then go through the list using swap/2 defined above so that the format of each element in the list is (Agent_Name, Count) as desired
accusation_counts(M,AC):-agents(M,Decoded_Message,Agents),(length(Agents,0) -> AC = []; (setof((Count,Agent_Name),(member(Agent_Name,Agents),count_phrase([Agent_Name,is,a,bear,cub],M,Count)),RevAC),myReverse(RevAC,SwappedAC),swap(SwappedAC,AC))).
