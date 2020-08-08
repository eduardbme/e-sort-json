-module(e_sort_json_test).
-compile(export_all).

-include_lib("eunit/include/eunit.hrl").

-define(test(T), {setup, fun start/0, fun stop/1, T}).

start() -> ok.
stop(_) -> ok.

test({input, Input, expected_result, ExpectedResult}) ->
  fun () ->
    Result = e_sort_json:sort(Input),

    ?assertEqual(ExpectedResult, Result)
  end.

all_tests_test_() ->
  TestCases = [
    {
      input, [],
      expected_result, []
    },
    {
      input, [{test, 0}],
      expected_result, [{test, 0}]
    },
    {
      input, [{test, 1}, {a, 1}, {b, 1}],
      expected_result, [{a, 1}, {b, 1}, {test, 1}]
    },
    {
      input, [{test, 2}, {b, 1}, {a, 1}],
      expected_result, [{a, 1}, {b, 1}, {test, 2}]
    },
    {
      input, [{test, 3}, {a, [{c, 1}, {d, 1}]}, {b, 2}],
      expected_result, [{a, [{c, 1}, {d, 1}]}, {b, 2}, {test, 3}]
    },
    {
      input, [{test, 4}, {a, [{d, 1}, {c, 1}]}, {b, 3}],
      expected_result, [{a, [{c, 1}, {d, 1}]}, {b, 3}, {test, 4}]
    },
    {
      input, [{test, 5}, {a, [{d, 1}, {c, 1}]}, {b, [{d, [{d, 1}, {c, 1}]}, {c, [{d, [{d, 1}, {c, 1}]}, {c, 1}]}]}],
      expected_result, [{a, [{c, 1}, {d, 1}]}, {b, [{c, [{c, 1}, {d, [{c, 1}, {d, 1}]}]}, {d, [{c, 1}, {d, 1}]}]}, {test, 5}]
    },
    {
      input, [
        {test, 6},
        {q, [{}]},
        {w, []},
        {b, [{d, [{d, 1}, {c, 1}]}, {c, [{d, [{d, 1}, {c, 1}]}, {c, 1}]}]},
        {d, [{d, 1}, {c, 1}]},
        {a, [{d, 1}, {c, 1}]}
      ],
      expected_result, [
        {a, [{c, 1}, {d, 1}]},
        {b, [{c, [{c, 1}, {d, [{c, 1}, {d, 1}]}]}, {d, [{c, 1}, {d, 1}]}]},
        {d, [{c, 1}, {d, 1}]},
        {q, [{}]},
        {test, 6},
        {w, []}]
    }
  ],

  [
    ?test(fun(_) -> {timeout, 1000, test(TestCase)} end) ||
    TestCase <- TestCases
  ].
