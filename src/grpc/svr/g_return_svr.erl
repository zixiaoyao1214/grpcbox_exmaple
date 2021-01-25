-module(g_return_svr).

-behavior(grpc_return_bhvr).

%% API
-export([get_money/2]).

-callback get_money(ctx:ctx(), ct_return_pb:account_plat()) ->
    {ok, ct_return_pb:charge(), ctx:ctx()} | grpcbox_stream:grpc_error_response().
get_money(CTX, #{account := _Account, platform := _Platform}) ->
    Reply = #{money => 1},
    {ok, Reply, CTX}.