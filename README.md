# e-sort-json
[![Build Status](https://travis-ci.org/eduardbme/e-sort-json.svg?branch=v0.0.2)](https://travis-ci.org/eduardbme/e-sort-json)
[![Coverage Status](https://coveralls.io/repos/github/eduardbme/e-sort-json/badge.svg?branch=v0.0.2)](https://coveralls.io/github/eduardbme/e-sort-json?branch=v0.0.2)

Sort JSON object in Erlang

#### Motivation
Sometimes you want to be sure two JSON objects are equal.

Perhaps you store them in a database under unique constraint.
You cannot just assume that `{a: 1, b: 2}` will never became `{b: 2, a: 1}` during processing/communication with other service.
That's why you want to sort them before inserting to database or something like that.

This is not what you commonly do with a JSON object, but sometimes such necessity has place.

#### How to use
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

#### Performance
The work on performance improvements is still in progress.
