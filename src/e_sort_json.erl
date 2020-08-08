-module(e_sort_json).

%% API
-export([
  sort/1
]).

sort([]) -> [];
sort(JSON) when is_list(JSON) ->
  sort_item([
    sort_item(Item) || Item <- JSON
  ]);
sort(A) -> A.

sort_item([]) -> [];
sort_item(Item) when is_list(Item) ->
  lists:sort(
    fun
      ({A, _}, {B, _}) when is_binary(A) andalso is_binary(B) -> A < B;
      ({A, _}, {B, _}) when is_atom(A) andalso is_atom(B) -> A < B
    end,
    Item
  );
sort_item({Key, Value}) when is_binary(Key) orelse is_atom(Key) ->
  {Key, sort(Value)};
sort_item(A) -> A.
