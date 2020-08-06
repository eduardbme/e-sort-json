# e-sort-json
Sort JSON object in Erlang

#### How to use:
```erlang

%% key is a tuple
1> e_sort_json:sort([{a, 1}, {b, 1}]).    
[{a,1},{b,1}]
2> e_sort_json:sort([{b, 1}, {a, 1}]).
[{a,1},{b,1}]

%% key is a binary value
3> e_sort_json:sort([{<<"b">>, 1}, {<<"a">>, 1}]).
[{<<"a">>,1},{<<"b">>,1}]
4> e_sort_json:sort([{<<"a">>, 1}, {<<"b">>, 1}]).
[{<<"a">>,1},{<<"b">>,1}] 

```

#### TODO
- sort internal JSON objects