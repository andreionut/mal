#!/usr/bin/env escript
%% -*- erlang -*-
%%! -smp enable -sname mal_repl

main(_) ->
  io:fwrite("~s", ["user> "]),
  print(eval(read())),
  main([]).

read() ->
  case file:read_line(standard_io) of
    {ok, Input} -> Input;
    eof -> exit(eof);
    {exit, Reason} ->
      io:fwrite("Unexpected error: ~p", [Reason]),
      exit(exit)
  end.

eval(Input) ->
  Input.

print(Input) ->
  io:fwrite("~s", [Input]).
