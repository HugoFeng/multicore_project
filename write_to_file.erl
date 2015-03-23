%%%-------------------------------------------------------------------
%%% @author Christophe De Troyer
%%% @copyright (C) 2014
%%% @doc
%%% This file is for testing purposes. Writing to a file.
%%% @end
%%% Created : 21. mrt 2014 15:52
%%%-------------------------------------------------------------------
-module(write_to_file).
-author("Christophe De Troyer").

%% API
-export([writeStringToFile/2, writeTweetPerformance/5, writeFetchTweetsReqPerformance/6, writeFetchTimelineReqPerformance/7]).

writeStringToFile(File, String) ->
  file:write_file(File, String, [append]),
  file:write_file(File, io_lib:fwrite("~n", []), [append]).


writeTweetPerformance(
	NumberOfSchedulers, NumberOfTweetsPerUser, NumberOfUsers, 
	 UserPerDataActor,Miliseconds) ->
    writeStringToFile("tweet_throughput.txt", io_lib:fwrite("~p;~p;~p;~p;~p;", 
        [NumberOfSchedulers, NumberOfTweetsPerUser, NumberOfUsers,  
         UserPerDataActor,Miliseconds])).

writeFetchTweetsReqPerformance(
	NumberOfSchedulers, NumberOfTweetsPerUser, NumberOfUsers, 
	TotalTweetsRequetsPerUser, 
  UserPerDataActor, Miliseconds) ->
    writeStringToFile("fetch_all_tweets.txt", io_lib:fwrite("~p;~p;~p;~p;~p;~p;", 
        [NumberOfSchedulers, NumberOfTweetsPerUser, NumberOfUsers, TotalTweetsRequetsPerUser,  
         UserPerDataActor,Miliseconds])).

writeFetchTimelineReqPerformance(
	NumberOfSchedulers, NumberOfTweetsPerUser, NumberOfUsers, 
	TotalTimelineRequestsPerUser, SubscriptionsPerUser, 
  UserPerDataActor,	Miliseconds) ->
    writeStringToFile("fetch_all_timelines.txt", io_lib:fwrite("~p;~p;~p;~p;~p;~p;~p", 
        [NumberOfSchedulers, NumberOfTweetsPerUser, NumberOfUsers, 
         TotalTimelineRequestsPerUser, SubscriptionsPerUser, UserPerDataActor, Miliseconds])).    