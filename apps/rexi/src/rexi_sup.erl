% Copyright 2010 Cloudant
% 
% Licensed under the Apache License, Version 2.0 (the "License"); you may not
% use this file except in compliance with the License. You may obtain a copy of
% the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
% License for the specific language governing permissions and limitations under
% the License.

-module(rexi_sup).
-behaviour(supervisor).
-export([init/1]).

-export([start_link/1]).

-include_lib("eunit/include/eunit.hrl").

start_link(Args) ->
    supervisor:start_link({local,?MODULE}, ?MODULE, Args).

init([]) ->
    Mod = rexi_server,
    Spec = {Mod, {Mod,start_link,[]}, permanent, 100, worker, [Mod]},
    {ok, {{one_for_one, 3, 10}, [Spec]}}.
