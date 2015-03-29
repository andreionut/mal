#!/usr/bin/env escript
%% -*- erlang -*-
%%! -smp enable -sname mal_repl

main(_) ->
  io:fwrite("~s", ["user> "]),
  rep(read_line()),
  main([]).

rep(Input) ->
  print(eval(read(Input))).

read(Input) ->
  Input.

eval(Input) ->
  Input.

print(Input) ->
  io:fwrite("~s", [Input]).

read_line() ->
  case file:read_line(standard_io) of
    {ok, Input} -> Input;
    eof -> exit(eof);
    {exit, Reason} ->
      io:fwrite("Unexpected error: ~p", [Reason]),
      exit(exit)
  end.
