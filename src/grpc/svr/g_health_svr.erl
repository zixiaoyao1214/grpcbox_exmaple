-module(g_health_svr).

-export([check/2,
    watch/2]).

check(Ctx, #{service := <<>>}) ->
    {ok, #{status => 'SERVING'}, Ctx};
check(Ctx, #{service := _Service}) ->
    %% TODO: lookup if we are serving this service
    {ok, #{status => 'UNKNOWN'}, Ctx}.

watch(_Request, _Stream) ->
    ok.
