-module (archive_downloader).

%% API exports
-export ([download_all/0]).

%%====================================================================
%% API functions
%%====================================================================
download_all() ->
    inets:start(),
    ok = httpc:set_options([{max_sessions, 20}, {pipeline_timeout, 20000}], default),
    Base_url = "http://erlang.org/pipermail/erlang-questions/",
    lists:foreach(fun(Archive_name)->
        download(Archive_name, Base_url)
    end, archive_list()).

%%====================================================================
%% Internal functions
%%====================================================================
download(Archive_name, Base_url) ->
    io:format("Start to down load ~p ~n", [Base_url ++ Archive_name]),
    {ok, RequestId} = httpc:request(get, {Base_url ++ Archive_name, []}, [], [{sync, false}]),
    receive 
        {http, {RequestId, Result}} -> 
            {{"HTTP/1.1",200,"OK"},_Headers, Body} = Result,
            io:format("~p ~n", [filename:join("archives", Archive_name)]),
            file:write_file(filename:join("archives", Archive_name), Body)
    after 1000 * 60 * 60  ->
        io:format("timeout: ~p ~n", [Archive_name])
    end.

archive_list() ->
    List = [
       "2016-December.txt.gz",
       "2016-November.txt.gz",
       "2016-October.txt.gz",
       "2016-September.txt.gz",
       "2016-August.txt.gz",
       "2016-July.txt.gz",
       "2016-June.txt.gz",
       "2016-May.txt.gz",
       "2016-April.txt.gz",
       "2016-March.txt.gz",
       "2016-February.txt.gz",
       "2016-January.txt.gz",
       "2015-December.txt.gz",
       "2015-November.txt.gz",
       "2015-October.txt.gz",
       "2015-September.txt.gz",
       "2015-August.txt.gz",
       "2015-July.txt.gz",
       "2015-June.txt.gz",
       "2015-May.txt.gz",
       "2015-April.txt.gz",
       "2015-March.txt.gz",
       "2015-February.txt.gz",
       "2015-January.txt.gz",
       "2014-December.txt.gz",
       "2014-November.txt.gz",
       "2014-October.txt.gz",
       "2014-September.txt.gz",
       "2014-August.txt.gz",
       "2014-July.txt.gz",
       "2014-June.txt.gz",
       "2014-May.txt.gz",
       "2014-April.txt.gz",
       "2014-March.txt.gz",
       "2014-February.txt.gz",
       "2014-January.txt.gz",
       "2013-December.txt.gz",
       "2013-November.txt.gz",
       "2013-October.txt.gz",
       "2013-September.txt.gz",
       "2013-August.txt.gz",
       "2013-July.txt.gz",
       "2013-June.txt.gz",
       "2013-May.txt.gz",
       "2013-April.txt.gz",
       "2013-March.txt.gz",
       "2013-February.txt.gz",
       "2013-January.txt.gz",
       "2012-December.txt.gz",
       "2012-November.txt.gz",
       "2012-October.txt.gz",
       "2012-September.txt.gz",
       "2012-August.txt.gz",
       "2012-July.txt.gz",
       "2012-June.txt.gz",
       "2012-May.txt.gz",
       "2012-April.txt.gz",
       "2012-March.txt.gz",
       "2012-February.txt.gz",
       "2012-January.txt.gz",
       "2011-December.txt.gz",
       "2011-November.txt.gz",
       "2011-October.txt.gz",
       "2011-September.txt.gz",
       "2011-August.txt.gz",
       "2011-July.txt.gz",
       "2011-June.txt.gz",
       "2011-May.txt.gz",
       "2011-April.txt.gz",
       "2011-March.txt.gz",
       "2011-February.txt.gz",
       "2011-January.txt.gz",
       "2010-December.txt.gz",
       "2010-November.txt.gz",
       "2010-October.txt.gz",
       "2010-September.txt.gz",
       "2010-August.txt.gz",
       "2010-July.txt.gz",
       "2010-June.txt.gz",
       "2010-May.txt.gz",
       "2010-April.txt.gz",
       "2010-March.txt.gz",
       "2010-February.txt.gz",
       "2010-January.txt.gz",
       "2009-December.txt.gz",
       "2009-November.txt.gz",
       "2009-October.txt.gz",
       "2009-September.txt.gz",
       "2009-August.txt.gz",
       "2009-July.txt.gz",
       "2009-June.txt.gz",
       "2009-May.txt.gz",
       "2009-April.txt.gz",
       "2009-March.txt.gz",
       "2009-February.txt.gz",
       "2009-January.txt.gz",
       "2008-December.txt.gz",
       "2008-November.txt.gz",
       "2008-October.txt.gz",
       "2008-September.txt.gz",
       "2008-August.txt.gz",
       "2008-July.txt.gz",
       "2008-June.txt.gz",
       "2008-May.txt.gz",
       "2008-April.txt.gz",
       "2008-March.txt.gz",
       "2008-February.txt.gz",
       "2008-January.txt.gz",
       "2007-December.txt.gz",
       "2007-November.txt.gz",
       "2007-October.txt.gz",
       "2007-September.txt.gz",
       "2007-August.txt.gz",
       "2007-July.txt.gz",
       "2007-June.txt.gz",
       "2007-May.txt.gz",
       "2007-April.txt.gz",
       "2007-March.txt.gz",
       "2007-February.txt.gz",
       "2007-January.txt.gz",
       "2006-December.txt.gz",
       "2006-November.txt.gz",
       "2006-October.txt.gz",
       "2006-September.txt.gz",
       "2006-August.txt.gz",
       "2006-July.txt.gz",
       "2006-June.txt.gz",
       "2006-May.txt.gz",
       "2006-April.txt.gz",
       "2006-March.txt.gz",
       "2006-February.txt.gz",
       "2006-January.txt.gz",
       "2005-December.txt.gz",
       "2005-November.txt.gz",
       "2005-October.txt.gz",
       "2005-September.txt.gz",
       "2005-August.txt.gz",
       "2005-July.txt.gz",
       "2005-June.txt.gz",
       "2005-May.txt.gz",
       "2005-April.txt.gz",
       "2005-March.txt.gz",
       "2005-February.txt.gz",
       "2005-January.txt.gz",
       "2004-December.txt.gz",
       "2004-November.txt.gz",
       "2004-October.txt.gz",
       "2004-September.txt.gz",
       "2004-August.txt.gz",
       "2004-July.txt.gz",
       "2004-June.txt.gz",
       "2004-May.txt.gz",
       "2004-April.txt.gz",
       "2004-March.txt.gz",
       "2004-February.txt.gz",
       "2004-January.txt.gz",
       "2003-December.txt.gz",
       "2003-November.txt.gz",
       "2003-October.txt.gz",
       "2003-September.txt.gz",
       "2003-August.txt.gz",
       "2003-July.txt.gz",
       "2003-June.txt.gz",
       "2003-May.txt.gz",
       "2003-April.txt.gz",
       "2003-March.txt.gz",
       "2003-February.txt.gz",
       "2003-January.txt.gz",
       "2002-December.txt.gz",
       "2002-November.txt.gz",
       "2002-October.txt.gz",
       "2002-September.txt.gz",
       "2002-August.txt.gz",
       "2002-July.txt.gz",
       "2002-June.txt.gz",
       "2002-May.txt.gz",
       "2002-April.txt.gz",
       "2002-March.txt.gz",
       "2002-February.txt.gz",
       "2002-January.txt.gz",
       "2001-December.txt.gz",
       "2001-November.txt.gz",
       "2001-October.txt.gz",
       "2001-September.txt.gz",
       "2001-August.txt.gz",
       "2001-July.txt.gz",
       "2001-June.txt.gz",
       "2001-May.txt.gz",
       "2001-April.txt.gz",
       "2001-March.txt.gz",
       "2001-February.txt.gz",
       "2001-January.txt.gz",
       "2000-December.txt.gz",
       "2000-November.txt.gz",
       "2000-October.txt.gz",
       "2000-September.txt.gz",
       "2000-August.txt.gz",
       "2000-July.txt.gz",
       "2000-June.txt.gz",
       "2000-May.txt.gz",
       "2000-April.txt.gz",
       "2000-March.txt.gz",
       "2000-February.txt.gz",
       "2000-January.txt.gz",
       "1999-December.txt.gz",
       "1999-November.txt.gz",
       "1999-October.txt.gz",
       "1999-September.txt.gz",
       "1999-August.txt.gz",
       "1999-July.txt.gz",
       "1999-June.txt.gz",
       "1999-May.txt.gz",
       "1999-April.txt.gz",
       "1999-March.txt.gz",
       "1999-February.txt.gz",
       "1999-January.txt.gz",
       "1998-December.txt.gz",
       "1997-May.txt.gz",
       "1997-January.txt.gz"
    ],
    List.





