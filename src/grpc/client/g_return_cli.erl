-module(g_return_cli).

-include("aoyin_common.hrl").

%% API
-export([grpc_get_money/2]).

-spec grpc_get_money(iodata(), iodata()) -> integer().
grpc_get_money(Account, Platform) ->
    Arg = #{account => Account, platform => Platform},
    case ?assert_grpc(grpc_return_client, get_money, Arg) of
        {ok, #{money := Money}, _} ->
            Money;
        _ERR ->
            0
    end.