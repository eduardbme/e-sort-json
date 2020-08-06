-module(e_sort_json).

%% API
-export([
  sort/1
]).

sort(JSON) when is_list(JSON) ->
  lists:sort(
    fun({A, _}, {B, _}) when is_binary(A) andalso is_binary(B) -> A < B;
       ({A, _}, {B, _}) when is_atom(A) andalso is_atom(B) -> A < B
    end,
    JSON
  ).