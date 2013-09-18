%Thomas Wojnar

-module(caesar).
-export([encrypt/2]).
-export([decrypt/2]).
-export([solve/2]).

encrypt([],_) -> [];
encrypt([H|T],Off) when (H >= $A) and (H =< $Z) and ((H+(Off rem 26)) > $Z) -> [(H + (Off rem 26) - 26)|encrypt(T,Off)];
encrypt([H|T],Off) when (H >= $A) and (H =< $Z) -> [(H + (Off rem 26))|encrypt(T,Off)];
encrypt([H|T],Off) -> [H|encrypt(T,Off)].

decrypt([],_) -> [];
decrypt([H|T],Off) when (H >= $A) and (H =< $Z) and ((H-(Off rem 26)) < $A) -> [(H - (Off rem 26) + 26)|decrypt(T,Off)];
decrypt([H|T],Off) when (H >= $A) and (H =< $Z) -> [(H - (Off rem 26))|decrypt(T,Off)];
decrypt([H|T],Off) -> [H|decrypt(T,Off)].

solve(_,-1) -> io:fwrite("");
solve([H|T],Max) when Max < 10 -> io:fwrite("Caesar 0"),io:fwrite(integer_to_list(Max)),io:fwrite(": "),io:fwrite(caesar:encrypt([H|T],Max)),io:fwrite("~n"), solve([H|T],(Max-1));
solve([H|T],Max) -> io:fwrite("Caesar "),io:fwrite(integer_to_list(Max)),io:fwrite(": "),io:fwrite(caesar:encrypt([H|T],Max)),io:fwrite("~n"),solve([H|T],(Max-1)).