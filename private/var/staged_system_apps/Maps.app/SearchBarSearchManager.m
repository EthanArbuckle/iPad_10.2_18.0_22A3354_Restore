@implementation SearchBarSearchManager

- (SearchBarSearchManager)initWithDelegate:(id)a3
{
  id v4;
  SearchBarSearchManager *v5;
  SearchBarSearchManager *v6;
  SearchBarSearchResults *v7;
  SearchBarSearchResults *searchResults;
  _TtC4Maps19SearchFindMySession *v9;
  _TtC4Maps19SearchFindMySession *findMySession;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchBarSearchManager;
  v5 = -[SearchBarSearchManager init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[SearchBarSearchManager setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_alloc_init(SearchBarSearchResults);
    searchResults = v6->_searchResults;
    v6->_searchResults = v7;

    v9 = objc_alloc_init(_TtC4Maps19SearchFindMySession);
    findMySession = v6->_findMySession;
    v6->_findMySession = v9;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_searchQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)SearchBarSearchManager;
  -[SearchBarSearchManager dealloc](&v3, "dealloc");
}

- (void)historyOperation:(id)a3 didFindMatches:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10035D3B4;
    block[3] = &unk_1011AD238;
    block[4] = self;
    v10 = v7;
    v11 = v8;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)searchRecentsOperation:(id)a3 didMatchResults:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10035D568;
    block[3] = &unk_1011AD238;
    block[4] = self;
    v10 = v7;
    v11 = v8;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)searchAddressBookOperation:(id)a3 didMatchResults:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  SearchBarSearchManager *v11;
  id v12;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10035D714;
  block[3] = &unk_1011AD238;
  v10 = a4;
  v11 = self;
  v12 = v6;
  v7 = v6;
  v8 = v10;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)searchFindMyFriendOperation:(id)a3 didMatchResults:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  SearchBarSearchManager *v11;
  id v12;

  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10035D8F8;
  block[3] = &unk_1011AD238;
  v10 = a4;
  v11 = self;
  v12 = v6;
  v7 = v6;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)searchName:(id)a3 forSearchMode:(unsigned int)a4 backfill:(int64_t)a5 context:(id)a6 originationType:(int)a7
{
  uint64_t v7;
  uint64_t v9;
  id v12;
  id v13;
  SearchBarSearchManagerRequest *v14;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a4;
  v12 = a6;
  v13 = a3;
  v14 = objc_alloc_init(SearchBarSearchManagerRequest);
  -[SearchBarSearchManagerRequest setSearchName:](v14, "setSearchName:", v13);

  -[SearchBarSearchManagerRequest setSearchMode:](v14, "setSearchMode:", v9);
  -[SearchBarSearchManagerRequest setContext:](v14, "setContext:", v12);

  -[SearchBarSearchManagerRequest setOriginationType:](v14, "setOriginationType:", v7);
  -[SearchBarSearchManager _searchUsingSearchRequest:backfill:](self, "_searchUsingSearchRequest:backfill:", v14, a5);

}

- (void)cancelCurrentSearch
{
  -[NSOperationQueue cancelAllOperations](self->_searchQueue, "cancelAllOperations");
}

- (int64_t)_integerValueForDefaultsKey:(id)a3 networkDefaultsKey:(id)a4
{
  void *var1;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id Integer;

  var1 = a4.var0.var1;
  v5 = *(_QWORD *)&a4.var0.var0;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    Integer = objc_msgSend(v9, "integerForKey:", v6);

  }
  else
  {
    Integer = (id)GEOConfigGetInteger(v5, var1);
  }

  return (int64_t)Integer;
}

- (void)_searchUsingSearchRequest:(id)a3 backfill:(int64_t)a4
{
  id v4;
  NSObject *v5;
  NSOperationQueue *v6;
  NSOperationQueue *v7;
  NSOperationQueue *searchQueue;
  SearchBarSearchResults *v9;
  SearchBarSearchResults *searchResults;
  void *v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  SearchHistoryOperation *v19;
  void *v20;
  SearchHistoryOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  SearchRecentsOperation *v25;
  void *v26;
  void *v27;
  void *v28;
  SearchAddressBookOperation *v29;
  void *v30;
  void *v31;
  void *v32;
  SearchAddressBookOperation *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  os_signpost_id_t signpostID;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  id v51;
  NSObject *v52;
  NSOperationQueue *v53;
  id v54;
  NSObject *v55;
  NSOperationQueue *v56;
  void *v57;
  NSString *query;
  NSOperationQueue *v59;
  id v60;
  void *v62;
  id v63;
  int64_t v64;
  _QWORD v66[5];
  id v67;
  id v68[2];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  NSOperationQueue *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  NSString *v78;
  _BYTE v79[128];

  v63 = a3;
  v4 = sub_10043222C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchName"));
    *(_DWORD *)buf = 138412290;
    v74 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SearchBarSearchManager - collecting results for query: %@", buf, 0xCu);

  }
  v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  searchQueue = self->_searchQueue;
  self->_searchQueue = v7;

  -[NSOperationQueue setName:](self->_searchQueue, "setName:", CFSTR("com.apple.Maps.SearchBarSearchManager"));
  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_searchQueue, "setMaxConcurrentOperationCount:", 1);
  -[NSOperationQueue setQualityOfService:](self->_searchQueue, "setQualityOfService:", 25);
  self->signpostID = 0xEEEEB0B5B2B2EEEELL;
  v9 = objc_alloc_init(SearchBarSearchResults);
  searchResults = self->_searchResults;
  self->_searchResults = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchName"));
  -[SearchBarSearchManager setQuery:](self, "setQuery:", v11);

  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "context"));
  v12 = -[SearchBarSearchManager _integerValueForDefaultsKey:networkDefaultsKey:](self, "_integerValueForDefaultsKey:networkDefaultsKey:", CFSTR("HistorySearchOrderKey"), MapsConfig_HistorySearchOrder, off_1014B3358);
  v13 = -[SearchBarSearchManager _integerValueForDefaultsKey:networkDefaultsKey:](self, "_integerValueForDefaultsKey:networkDefaultsKey:", CFSTR("RecentsSeachOrderKey"), MapsConfig_RecentsSearchOrder, off_1014B3338);
  v64 = -[SearchBarSearchManager _integerValueForDefaultsKey:networkDefaultsKey:](self, "_integerValueForDefaultsKey:networkDefaultsKey:", CFSTR("AddressBookSearchOrderKey"), MapsConfig_AddressBookSearchOrder, off_1014B3318);
  v14 = -[SearchBarSearchManager _integerValueForDefaultsKey:networkDefaultsKey:](self, "_integerValueForDefaultsKey:networkDefaultsKey:", CFSTR("AutocompleteSearchFindMyKey"), MapsConfig_SearchACPeopleSuggestionOrder, off_1014B4E68);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recents"));
  v18 = objc_msgSend(v17, "copy");

  v19 = [SearchHistoryOperation alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchName"));
  v21 = -[SearchHistoryOperation initWithSearchQuery:searchMode:history:context:](v19, "initWithSearchQuery:searchMode:history:context:", v20, objc_msgSend(v63, "searchMode"), v18, v62);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("HistoryOperation"), v22));
  -[SearchHistoryOperation setName:](v21, "setName:", v23);

  -[SearchHistoryOperation setDelegate:](v21, "setDelegate:", self);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v24);

  if (+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled"))
  {
    v25 = -[SearchRecentsOperation initWithSearchQuery:context:]([SearchRecentsOperation alloc], "initWithSearchQuery:context:", self->_query, v62);
    -[SearchRecentsOperation setDelegate:](v25, "setDelegate:", self);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("RecentsOperation"), v26));
    -[SearchRecentsOperation setName:](v25, "setName:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, v28);

  }
  if ((MapsFeature_IsEnabled_MapsWally() & 1) == 0)
  {
    v29 = -[SearchAddressBookOperation initWithSearchQuery:context:]([SearchAddressBookOperation alloc], "initWithSearchQuery:context:", self->_query, v62);
    -[SearchAddressBookOperation setDelegate:](v29, "setDelegate:", self);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("AddressBookOperation"), v30));
    -[SearchAddressBookOperation setName:](v29, "setName:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v64));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, v32);

  }
  if (MapsFeature_IsEnabled_MapsWally())
  {
    if (objc_msgSend(v63, "searchMode") == 3)
    {
      v33 = -[SearchAddressBookOperation initWithSearchQuery:context:]([SearchAddressBookOperation alloc], "initWithSearchQuery:context:", self->_query, v62);
      -[SearchAddressBookOperation setDelegate:](v33, "setDelegate:", self);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchName"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("CarPlay-AddressBookOperation"), v34));
      -[SearchAddressBookOperation setName:](v33, "setName:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v64));
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v38 = objc_msgSend(v37, "isUsingOfflineMaps");

      v33 = -[SearchFindMyFriendOperation initWithSearchQuery:context:isOffline:singularResults:searchFindMySession:]([_TtC4Maps27SearchFindMyFriendOperation alloc], "initWithSearchQuery:context:isOffline:singularResults:searchFindMySession:", self->_query, v62, v38, objc_msgSend(v63, "originationType") - 1 < 2, self->_findMySession);
      -[SearchAddressBookOperation setDelegate:](v33, "setDelegate:", self);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "searchName"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("SearchFMOperation"), v39));
      -[SearchAddressBookOperation setName:](v33, "setName:", v40);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14));
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, v36);

  }
  v41 = sub_10035E474();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  v43 = v42;
  signpostID = self->signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "CollectingClientResults", ", buf, 2u);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allKeys"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sortedArrayUsingSelector:", "compare:"));

  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v48)
          objc_enumerationMutation(v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i)));
        v51 = sub_10043222C();
        v52 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "name"));
          *(_DWORD *)buf = 138412290;
          v74 = v53;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "SearchBarSearchManager - Adding operation: %@", buf, 0xCu);

        }
        -[NSOperationQueue addOperation:](self->_searchQueue, "addOperation:", v50);

      }
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    }
    while (v47);
  }

  v54 = sub_10043222C();
  v55 = objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = self->_searchQueue;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](v56, "operations"));
    query = self->_query;
    *(_DWORD *)buf = 138412802;
    v74 = v56;
    v75 = 2112;
    v76 = v57;
    v77 = 2112;
    v78 = query;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "SearchBarSearchManager - searchQueue:%@ \n operations: %@ \n searchQuery: %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v59 = self->_searchQueue;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10035E4B4;
  v66[3] = &unk_1011AE810;
  objc_copyWeak(v68, (id *)buf);
  v68[1] = (id)a4;
  v66[4] = self;
  v60 = v62;
  v67 = v60;
  -[NSOperationQueue addOperationWithBlock:](v59, "addOperationWithBlock:", v66);

  objc_destroyWeak(v68);
  objc_destroyWeak((id *)buf);

}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SearchBarSearchManagerDelegate)delegate
{
  return (SearchBarSearchManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC4Maps19SearchFindMySession)findMySession
{
  return self->_findMySession;
}

- (void)setFindMySession:(id)a3
{
  objc_storeStrong((id *)&self->_findMySession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMySession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
}

@end
