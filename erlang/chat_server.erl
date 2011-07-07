-module(chat_server).
-export([start/0]).

start() ->
	Pid = spawn(fun() -> loop([]) end),
	register(server, Pid).

loop(Clients) ->
	receive

		{connect, ClientPid} ->
			io:format("A new client connects! ~p~n", [ClientPid]),
			%%Add ClientPid to the list of clients.
			loop([ClientPid|Clients]);
	
		{message, MessageString} ->
			send_message_to_clients(Clients, MessageString);

		SomeMessage ->
			io:format("Received something: ~p~n", [SomeMessage]),
			loop(Clients)
	end.

send_message_to_clients([], _MessageString) ->
	ok;
send_message_to_clients([Client | OtherClients], MessageString) ->
	Client ! MessageString,
	send_message_to_clients(OtherClients, MessageString).
