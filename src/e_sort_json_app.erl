-module(e_sort_json_app).
-behaviour(application).

-export([
  start/2,
  stop/1
]).

start(_Type, _Arg) ->
  e_sort_json_sup:start_link().

stop(_State) -> ok.
