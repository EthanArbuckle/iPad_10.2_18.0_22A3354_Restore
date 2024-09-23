@implementation SearchSession

- (SearchSession)init
{
  return -[SearchSession initWithOrigin:](self, "initWithOrigin:", 0);
}

- (SearchSession)initWithOrigin:(unint64_t)a3
{
  return -[SearchSession initWithOrigin:options:](self, "initWithOrigin:options:", a3, 0);
}

- (SearchSession)initWithOrigin:(unint64_t)a3 options:(unint64_t)a4
{
  SearchSession *v6;
  SearchSession *v7;
  void *v8;
  BOOL v9;
  void *v10;
  SearchManager *v11;
  SearchManager *searchManager;
  dispatch_queue_t v13;
  OS_dispatch_queue *observersQueue;
  uint64_t v15;
  NSHashTable *observers;
  uint64_t v17;
  NSMutableArray *timers;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SearchSession;
  v6 = -[SearchSession init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    v6->_options = a4;
    v6->_origin = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v8, "userInterfaceIdiom") == (id)1)
    {

      v9 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v9 = objc_msgSend(v10, "userInterfaceIdiom") != (id)5;

    }
    v7->_shouldBroadcast = v9;
    v11 = objc_alloc_init(SearchManager);
    searchManager = v7->_searchManager;
    v7->_searchManager = v11;

    -[SearchManager setDelegate:](v7->_searchManager, "setDelegate:", v7);
    v13 = dispatch_queue_create("com.apple.Maps.SearchSession", 0);
    observersQueue = v7->_observersQueue;
    v7->_observersQueue = (OS_dispatch_queue *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    timers = v7->_timers;
    v7->_timers = (NSMutableArray *)v17;

  }
  return v7;
}

+ (void)initialize
{
  void *v3;
  id v4;
  _QWORD v5[5];

  if ((id)objc_opt_class(SearchSession) == a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1002F6880;
    v5[3] = &unk_1011B0FA8;
    v5[4] = a1;
    v4 = objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SearchSessionWillStart"), 0, 0, v5);

  }
}

+ (SearchSession)currentSearchSession
{
  id WeakRetained;
  unsigned __int8 v3;
  id v4;

  WeakRetained = objc_loadWeakRetained(&qword_1014D2098);
  v3 = objc_msgSend(WeakRetained, "isInvalidated");

  if ((v3 & 1) != 0)
    v4 = 0;
  else
    v4 = objc_loadWeakRetained(&qword_1014D2098);
  return (SearchSession *)v4;
}

+ (void)setCurrentSearchSession:(id)a3
{
  id WeakRetained;
  void *v4;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&qword_1014D2098);

  v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&qword_1014D2098, obj);
    v4 = obj;
  }

}

- (void)becomeCurrent
{
  +[SearchSession setCurrentSearchSession:](SearchSession, "setCurrentSearchSession:", self);
}

- (void)startSearch:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  SearchSession *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_1002F6A94();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SearchSession %@ : startSearch %@", (uint8_t *)&v8, 0x16u);
  }

  -[SearchSession _assertNotInvalidated](self, "_assertNotInvalidated");
  -[SearchSession setSearchFieldItem:](self, "setSearchFieldItem:", v4);
  if (-[SearchSession shouldBroadcast](self, "shouldBroadcast"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SearchSessionWillStart"), self);

  }
  -[SearchSession didChangeSearchFieldItem](self, "didChangeSearchFieldItem");
  -[SearchSession _performSearchIfNeeded](self, "_performSearchIfNeeded");

}

- (void)suggestionSearch:(id)a3 withTraits:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  SearchFieldItem *v10;
  SearchManager *searchManager;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;
  _QWORD v16[5];

  v6 = a3;
  v7 = a4;
  -[SearchSession _assertNotInvalidated](self, "_assertNotInvalidated");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self, "searchInfo"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultSuggestion"));

  if (v9 == v6)
  {
    -[SearchSession setSuggestion:](self, "setSuggestion:", 0);
    -[SearchSession setSuggestionSearchInfo:](self, "setSuggestionSearchInfo:", 0);
    -[SearchSession setIsSuggestionSearch:](self, "setIsSuggestionSearch:", 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002F6C68;
    v16[3] = &unk_1011B0FD0;
    v16[4] = self;
    -[SearchSession _notifyAllObservers:](self, "_notifyAllObservers:", v16);
    -[SearchSession didChangeSearchResults](self, "didChangeSearchResults");
  }
  else
  {
    -[SearchSession setSuggestion:](self, "setSuggestion:", v6);
    -[SearchSession setTraits:](self, "setTraits:", v7);
    -[SearchSession setIsSuggestionSearch:](self, "setIsSuggestionSearch:", 1);
    v10 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSuggestion:](v10, "setSuggestion:", v6);
    searchManager = self->_searchManager;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession traits](self, "traits"));
    v13 = -[SearchSession source](self, "source");
    v14 = -[SearchSession isRedoOrAutoRedoSearchType](self, "isRedoOrAutoRedoSearchType");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchSessionData](self, "searchSessionData"));
    -[SearchManager searchForSearchFieldItem:traits:source:isRedoOrAutoRedoSearch:searchSessionData:](searchManager, "searchForSearchFieldItem:traits:source:isRedoOrAutoRedoSearch:searchSessionData:", v10, v12, v13, v14, v15);

  }
}

- (void)redoSearchWithTraits:(id)a3
{
  id v4;
  void *v5;
  SearchFieldItem *v6;
  void *v7;
  SearchManager *searchManager;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  SearchFieldItem *v13;

  v4 = a3;
  -[SearchSession _assertNotInvalidated](self, "_assertNotInvalidated");
  -[SearchSession setTraits:](self, "setTraits:", v4);

  v13 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession suggestion](self, "suggestion"));

  if (v5)
  {
    v6 = objc_alloc_init(SearchFieldItem);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession suggestion](self, "suggestion"));
    -[SearchFieldItem setSuggestion:](v6, "setSuggestion:", v7);

    v13 = v6;
  }
  searchManager = self->_searchManager;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession traits](self, "traits"));
  v10 = -[SearchSession source](self, "source");
  v11 = -[SearchSession isRedoOrAutoRedoSearchType](self, "isRedoOrAutoRedoSearchType");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchSessionData](self, "searchSessionData"));
  -[SearchManager searchForSearchFieldItem:traits:source:isRedoOrAutoRedoSearch:searchSessionData:](searchManager, "searchForSearchFieldItem:traits:source:isRedoOrAutoRedoSearch:searchSessionData:", v13, v9, v10, v11, v12);

}

- (void)restoreSearchForItem:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SearchSession setRestoreSingleResult:](self, "setRestoreSingleResult:", objc_msgSend(v7, "singleResultMode"));
  -[SearchSession _assertNotInvalidated](self, "_assertNotInvalidated");
  if (-[SearchSession shouldBroadcast](self, "shouldBroadcast"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("SearchSessionWillStart"), self);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F6E88;
  block[3] = &unk_1011AD238;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)showExistingSearchInfo:(id)a3
{
  -[SearchSession setSearchInfo:](self, "setSearchInfo:", a3);
  -[SearchSession didChangeSearchResults](self, "didChangeSearchResults");
}

- (void)didChangeSearchFieldItem
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1002F6F40;
  v2[3] = &unk_1011B0FD0;
  v2[4] = self;
  -[SearchSession _notifyAllObservers:](self, "_notifyAllObservers:", v2);
}

- (void)notifyPPTDidChangeSearchResults
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SearchSessionDidChangeSearchResultsNotification"), self, 0);

}

- (void)didChangeSearchResults
{
  _QWORD v3[5];

  -[SearchSession _setupTimersToRefreshEVChargers](self, "_setupTimersToRefreshEVChargers");
  -[SearchSession notifyPPTDidChangeSearchResults](self, "notifyPPTDidChangeSearchResults");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002F7008;
  v3[3] = &unk_1011B0FD0;
  v3[4] = self;
  -[SearchSession _notifyAllObservers:](self, "_notifyAllObservers:", v3);
}

- (void)_setupTimersToRefreshEVChargers
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  dispatch_queue_global_t global_queue;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self, "searchInfo"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "results"));

  if (objc_msgSend(v34, "count"))
  {
    -[SearchSession resetEVChargerTimers](self, "resetEVChargerTimers");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v46 = 0u;
    v47 = 0u;
    v45 = 0u;
    v44 = 0u;
    v4 = v34;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_geoMapItem"));
          v11 = objc_msgSend(v10, "_hasEVCharger");

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_realTimeAvailableEVCharger"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "ttlSeconds")));

            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v14));
            v16 = v15;
            if (v15)
              v17 = objc_msgSend(v15, "mutableCopy");
            else
              v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v18 = v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
            objc_msgSend(v18, "addObject:", v19);

            objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v14);
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v5);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v21 = objc_msgSend(v20, "count") == 0;

    if (!v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sortedArrayUsingSelector:", "compare:"));

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(_QWORD *)v41 != v26)
              objc_enumerationMutation(v24);
            v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v28));
            if (objc_msgSend(v29, "count"))
            {
              global_queue = dispatch_get_global_queue(9, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
              objc_initWeak(&location, self);
              v32 = objc_msgSend(v28, "integerValue");
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_1002F7454;
              v36[3] = &unk_1011B0FF8;
              objc_copyWeak(&v38, &location);
              v37 = v29;
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:repeating:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:repeating:block:", v31, 1, v36, (double)(uint64_t)v32));
              -[NSMutableArray addObject:](self->_timers, "addObject:", v33);

              objc_destroyWeak(&v38);
              objc_destroyWeak(&location);

            }
          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        }
        while (v25);
      }

    }
  }

}

- (void)resetEVChargerTimers
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_timers, "enumerateObjectsUsingBlock:", &stru_1011B1038);
  -[NSMutableArray removeAllObjects](self->_timers, "removeAllObjects");
}

- (void)_refreshEVChargers:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = objc_msgSend(v5, "isUsingOfflineMaps");

  if ((v6 & 1) == 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002F7658;
    v14[3] = &unk_1011B1060;
    v7 = objc_alloc_init((Class)NSMutableArray);
    v15 = v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);
    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForRefreshingEVChargersWithIdentifiers:traits:", v7, 0));

      objc_initWeak(&location, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002F76C0;
      v10[3] = &unk_1011ADF70;
      objc_copyWeak(&v12, &location);
      v11 = v4;
      objc_msgSend(v9, "submitRefreshRequestWithHandler:networkActivity:", v10, 0);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);

    }
  }

}

- (void)notifyToRefreshEVChargers:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F7A1C;
  v5[3] = &unk_1011B0FD0;
  v6 = a3;
  v4 = v6;
  -[SearchSession _notifyAllObservers:](self, "_notifyAllObservers:", v5);

}

- (void)invalidate
{
  -[SearchSession resetEVChargerTimers](self, "resetEVChargerTimers");
  -[SearchSession invalidateWithReason:](self, "invalidateWithReason:", 0);
}

- (void)cancelSearch
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SearchSession searchManager](self, "searchManager"));
  objc_msgSend(v2, "cancelSearch");

}

- (void)invalidateWithReason:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  SearchSession *v9;
  uint64_t v10;
  SearchSession *v11;
  _QWORD v12[4];
  SearchSession *v13;
  unint64_t v14;
  _QWORD block[6];
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = sub_1002F6A94();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SearchSession %@ : invalidate", (uint8_t *)&buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](self, "observersQueue"));
  dispatch_assert_queue_not_V2(v7);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = sub_1002F7C9C;
  v19 = sub_1002F7CAC;
  v20 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](self, "observersQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F7CB4;
  block[3] = &unk_1011ADF48;
  block[4] = self;
  block[5] = &buf;
  dispatch_sync(v8, block);

  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
  {
    v9 = self;
    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002F7D04;
    v12[3] = &unk_1011B1088;
    v11 = v9;
    v13 = v11;
    v14 = a3;
    -[SearchSession _notifyObservers:block:](v11, "_notifyObservers:block:", v10, v12);

  }
  _Block_object_dispose(&buf, 8);

}

- (BOOL)singleResultMode
{
  return -[SearchInfo singleResultMode](self->_searchInfo, "singleResultMode");
}

- (BOOL)isVenueQuery
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venueCategoryItem"));
  v4 = v3 != 0;

  return v4;
}

- (NSString)stringToDisplay
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[SearchSession isSuggestionSearch](self, "isSuggestionSearch"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession suggestion](self, "suggestion"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayString"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchString"));
  }
  v5 = (void *)v4;

  return (NSString *)v5;
}

- (NSArray)currentResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession suggestionSearchInfo](self, "suggestionSearchInfo"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession suggestionSearchInfo](self, "suggestionSearchInfo"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self, "searchInfo"));
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));

  return (NSArray *)v6;
}

- (SearchInfo)currentResultsSearchInfo
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession suggestionSearchInfo](self, "suggestionSearchInfo"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession suggestionSearchInfo](self, "suggestionSearchInfo"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self, "searchInfo"));
  return (SearchInfo *)v4;
}

- (void)setSelectedResultIndex:(unint64_t)a3
{
  void *v5;
  BOOL v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResultsSearchInfo](self, "currentResultsSearchInfo"));
  if (v5)
  {
    v7 = v5;
    v6 = objc_msgSend(v5, "selectedIndex") == (id)a3;
    v5 = v7;
    if (!v6)
    {
      objc_msgSend(v7, "setSelectedIndex:", a3);
      -[SearchSession didChangeSearchResults](self, "didChangeSearchResults");
      v5 = v7;
    }
  }

}

- (unint64_t)selectedResultIndex
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResultsSearchInfo](self, "currentResultsSearchInfo"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "selectedIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResults](self, "currentResults"));
    v7 = objc_msgSend(v6, "count");

    if (v5 >= v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResults](self, "currentResults"));
      v8 = (unint64_t)objc_msgSend(v9, "count") - 1;

    }
    else
    {
      v8 = (unint64_t)objc_msgSend(v4, "selectedIndex");
    }
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (unint64_t)searchRequestType
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession traits](self, "traits"));
  v3 = objc_msgSend(v2, "searchRequestType");

  if (v3 == 2)
    return 2;
  else
    return v3 == 1;
}

- (BOOL)isRedoOrAutoRedoSearchType
{
  return (char *)-[SearchSession searchRequestType](self, "searchRequestType") - 1 < (char *)2;
}

- (BOOL)isSingleResultToShowAsPlacecard
{
  BOOL v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  if (-[SearchSession isVenueQuery](self, "isVenueQuery")
    || !-[SearchSession singleResultMode](self, "singleResultMode")
    || -[SearchSession isRedoOrAutoRedoSearchType](self, "isRedoOrAutoRedoSearchType"))
  {
    v3 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession traits](self, "traits"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resultRefinementQuery"));
    v3 = v13 == 0;

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self, "searchInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
  if (objc_msgSend(v5, "count") == (id)1)
  {
    v6 = -[SearchSession isRedoOrAutoRedoSearchType](self, "isRedoOrAutoRedoSearchType");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self, "searchInfo"));
      v8 = objc_msgSend(v7, "searchResultViewType");

      if (v8 == 1)
        return 0;
      if (v8 == 2)
        return 1;
      return v3;
    }
  }
  else
  {

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self, "searchInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "autocompletePerson"));

  if (v10)
    return 1;
  return v3;
}

- (NSHashTable)observers
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](self, "observersQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[SearchSession _assertNotInvalidated](self, "_assertNotInvalidated");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](self, "observersQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002F81D8;
    v6[3] = &unk_1011AC8B0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](self, "observersQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002F82B4;
    v6[3] = &unk_1011AC8B0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)_notifyAllObservers:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](self, "observersQueue"));
  dispatch_assert_queue_not_V2(v5);

  if (v4)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = sub_1002F7C9C;
    v12 = sub_1002F7CAC;
    v13 = 0;
    v6 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](self, "observersQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002F8400;
    v7[3] = &unk_1011ADF48;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v6, v7);

    -[SearchSession _notifyObservers:block:](self, "_notifyObservers:block:", v9[5], v4);
    _Block_object_dispose(&v8, 8);

  }
}

- (void)_notifyObservers:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v5);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }

}

- (void)_performSearchIfNeeded
{
  void *v3;
  SearchResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __objc2_prot *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  id v19;
  SearchResult *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SearchResult *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
  v4 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));

  if (!v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "historyItem"));

    if (!v9)
      goto LABEL_15;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "historyItem"));
    v12 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    v13 = objc_opt_class(HistoryEntryRecentsItem);
    v14 = v11;
    v15 = (objc_opt_isKindOfClass(v14, v13) & 1) != 0 ? v14 : 0;
    v16 = v15;

    if (v16
      && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "historyEntry")),
          v18 = objc_msgSend(v17, "conformsToProtocol:", v12),
          v17,
          v18))
    {
      v19 = v14;
    }
    else
    {
      v19 = 0;
    }

    if (v19)
    {
      v20 = [SearchResult alloc];
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "historyEntry"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "geoMapItem"));
      v4 = -[SearchResult initWithGEOMapItem:](v20, "initWithGEOMapItem:", v22);

      -[SearchResultRepr setHasIncompleteMetadata:](v4, "setHasIncompleteMetadata:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v4, "mapItem"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_geoMapItem"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "displayMapRegionOrNil"));

      if (v4)
        goto LABEL_3;
    }
    else
    {
LABEL_15:
      v5 = 0;
    }
    -[SearchSession _performSearch](self, "_performSearch");
    goto LABEL_17;
  }
  v5 = 0;
LABEL_3:
  v25 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:boundingMapRegion:](SearchInfo, "searchInfoWithResults:boundingMapRegion:", v6, v5));

  objc_msgSend(v7, "setSelectedIndex:", 0);
  -[SearchSession showExistingSearchInfo:](self, "showExistingSearchInfo:", v7);

LABEL_17:
}

- (void)_performSearch
{
  id v3;
  NSObject *v4;
  SearchManager *searchManager;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  int v11;
  SearchSession *v12;

  v3 = sub_1002F6A94();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SearchSession %@ : _performSearch", (uint8_t *)&v11, 0xCu);
  }

  searchManager = self->_searchManager;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession traits](self, "traits"));
  v8 = -[SearchSession source](self, "source");
  v9 = -[SearchSession isRedoOrAutoRedoSearchType](self, "isRedoOrAutoRedoSearchType");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchSessionData](self, "searchSessionData"));
  -[SearchManager searchForSearchFieldItem:traits:source:isRedoOrAutoRedoSearch:searchSessionData:](searchManager, "searchForSearchFieldItem:traits:source:isRedoOrAutoRedoSearch:searchSessionData:", v6, v7, v8, v9, v10);

}

- (void)_processResults:(id)a3
{
  id v4;
  NSError *lastError;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  -[SearchSession setIsLoading:](self, "setIsLoading:", 0);
  if (GEOConfigGetBOOL(MapsConfig_ResetSearchResultStyleAttributesForLabelsInMultipleResultsSet, off_1014B3048))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
    v7 = objc_msgSend(v6, "count");

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "setPartOfMultipleResultsSet:", (unint64_t)v7 > 1);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  if (-[SearchSession isSuggestionSearch](self, "isSuggestionSearch"))
    -[SearchSession setSuggestionSearchInfo:](self, "setSuggestionSearchInfo:", v4);
  else
    -[SearchSession setSearchInfo:](self, "setSearchInfo:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchSessionData"));
  -[SearchSession setSearchSessionData:](self, "setSearchSessionData:", v13);

  -[SearchSession didChangeSearchResults](self, "didChangeSearchResults");
}

- (void)_willProcessSearchFieldItem
{
  NSError *lastError;
  _QWORD v4[5];

  lastError = self->_lastError;
  self->_lastError = 0;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002F8AF4;
  v4[3] = &unk_1011B0FD0;
  v4[4] = self;
  -[SearchSession _notifyAllObservers:](self, "_notifyAllObservers:", v4);
}

- (void)searchManager:(id)a3 willProcessSearchFieldItem:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  int v10;
  SearchSession *v11;
  __int16 v12;
  id v13;

  v5 = a4;
  v6 = sub_1002F6A94();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SearchSession %@ : willProcessSearchFieldItem %@", (uint8_t *)&v10, 0x16u);
  }

  v8 = sub_10043222C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ReceivedSearchResults", ", (uint8_t *)&v10, 2u);
  }

  -[SearchSession setIsLoading:](self, "setIsLoading:", 1);
  -[SearchSession _willProcessSearchFieldItem](self, "_willProcessSearchFieldItem");

}

- (void)searchManager:(id)a3 didReceiveSearchInfo:(id)a4 searchSessionData:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  uint8_t buf[4];
  SearchSession *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = sub_1002F6A94();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v22 = self;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "SearchSession %@ : didReceiveSearchInfo %@ error %@", buf, 0x20u);
  }

  v14 = sub_10043222C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ReceivedSearchResults", ", buf, 2u);
  }

  if (v11)
  {
    -[SearchSession setIsLoading:](self, "setIsLoading:", 0);
    -[SearchSession setSearchSessionData:](self, "setSearchSessionData:", v10);
    -[SearchSession setSearchInfo:](self, "setSearchInfo:", v9);
    objc_storeStrong((id *)&self->_lastError, a6);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002F8E50;
    v20[3] = &unk_1011B0FD0;
    v20[4] = self;
    -[SearchSession _notifyAllObservers:](self, "_notifyAllObservers:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    v17 = GEOErrorDomain(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (objc_msgSend(v16, "isEqualToString:", v18))
    {
      v19 = objc_msgSend(v11, "code");

      if (v19 == (id)-8)
        -[SearchSession notifyPPTDidChangeSearchResults](self, "notifyPPTDidChangeSearchResults");
    }
    else
    {

    }
  }
  else
  {
    -[SearchSession _processResults:](self, "_processResults:", v9);
  }

}

- (BOOL)isInvalidated
{
  SearchSession *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](self, "observersQueue"));
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = objc_claimAutoreleasedReturnValue(-[SearchSession observersQueue](v2, "observersQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002F8F34;
  v6[3] = &unk_1011ADF48;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (BOOL)isSpotlightPunchInSearch
{
  void *v3;
  BOOL v4;

  if (!-[SearchFieldItem isSpotlightSearch](self->_searchFieldItem, "isSpotlightSearch")
    || -[SearchInfo searchResultViewType](self->_searchInfo, "searchResultViewType") != 2)
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo spotlightMapsIdentifier](self->_searchInfo, "spotlightMapsIdentifier"));
  v4 = v3 != 0;

  return v4;
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (void)setSearchFieldItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchFieldItem, a3);
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInfo, a3);
}

- (SearchManager)searchManager
{
  return self->_searchManager;
}

- (void)setSearchManager:(id)a3
{
  objc_storeStrong((id *)&self->_searchManager, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (BOOL)shouldBroadcast
{
  return self->_shouldBroadcast;
}

- (void)setShouldBroadcast:(BOOL)a3
{
  self->_shouldBroadcast = a3;
}

- (BOOL)restoreSingleResult
{
  return self->_restoreSingleResult;
}

- (void)setRestoreSingleResult:(BOOL)a3
{
  self->_restoreSingleResult = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (BOOL)shouldCreateHistoryEntry
{
  return self->_shouldCreateHistoryEntry;
}

- (void)setShouldCreateHistoryEntry:(BOOL)a3
{
  self->_shouldCreateHistoryEntry = a3;
}

- (GEORelatedSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isSuggestionSearch
{
  return self->_isSuggestionSearch;
}

- (void)setIsSuggestionSearch:(BOOL)a3
{
  self->_isSuggestionSearch = a3;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isResultRefinementsBarSearch
{
  return self->_isResultRefinementsBarSearch;
}

- (void)setIsResultRefinementsBarSearch:(BOOL)a3
{
  self->_isResultRefinementsBarSearch = a3;
}

- (BOOL)isAddStopFromWaypointEditor
{
  return self->_isAddStopFromWaypointEditor;
}

- (void)setIsAddStopFromWaypointEditor:(BOOL)a3
{
  self->_isAddStopFromWaypointEditor = a3;
}

- (GEOSearchSessionData)searchSessionData
{
  return self->_searchSessionData;
}

- (void)setSearchSessionData:(id)a3
{
  objc_storeStrong((id *)&self->_searchSessionData, a3);
}

- (BOOL)spotlightMatchingResultFound
{
  return self->_spotlightMatchingResultFound;
}

- (void)setSpotlightMatchingResultFound:(BOOL)a3
{
  self->_spotlightMatchingResultFound = a3;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)observersQueue
{
  return self->_observersQueue;
}

- (void)setObserversQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observersQueue, a3);
}

- (SearchInfo)suggestionSearchInfo
{
  return self->_suggestionSearchInfo;
}

- (void)setSuggestionSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionSearchInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionSearchInfo, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);
  objc_storeStrong((id *)&self->_timers, 0);
}

- (NSString)printedPageTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return (NSString *)v3;
}

- (NSString)printedPageSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResults](self, "currentResults"));
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100988D14;
  v19 = sub_100988D24;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "historyItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "historyEntry"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100988D2C;
  v14[3] = &unk_1011BF258;
  v14[4] = &v15;
  objc_msgSend(v6, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v14, 0, 0, 0);

  if (objc_msgSend((id)v16[5], "length") || !objc_msgSend(v4, "count"))
  {
    if (!objc_msgSend((id)v16[5], "length"))
    {
      v9 = 0;
      goto LABEL_8;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("near %@"), CFSTR("localized string not found"), 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v16[5]));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("near %@"), CFSTR("localized string not found"), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_addressFormattedAsCity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12));

  }
LABEL_8:
  _Block_object_dispose(&v15, 8);

  return (NSString *)v9;
}

- (NSString)currentSearchString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchString"));

  return (NSString *)v3;
}

- (NSString)currentUserTypedSearchString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self, "searchFieldItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userTypedStringForRAP"));

  return (NSString *)v3;
}

- (BOOL)isOptionsLowFuel
{
  if ((-[SearchSession options](self, "options") & 2) != 0)
    return 1;
  else
    return -[SearchSession options](self, "options") & 1;
}

+ (void)performSearchForEngineType:(int)a3 withObserver:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  BrowseManager *v20;
  BrowseManager *v21;
  _QWORD v22[4];
  BrowseManager *v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  int v28;
  uint8_t buf[4];
  int v30;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentTraits"));

  if (v9)
  {
    dword_1014D4494 = 0;
    v10 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Initiating a fuel search", buf, 2u);
    }

    if (!v6)
      v6 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentTraits"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v14, "setNavigating:", objc_msgSend(v15, "isInNavigatingState"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalAccessory sharedInstance](MapsExternalAccessory, "sharedInstance"));
    if (objc_msgSend(v16, "primaryEngineType") == a3)
    {

    }
    else
    {

      if (((a3 >> 1) & 1) + (a3 & 1) + ((a3 >> 2) & 1) + ((a3 >> 3) & 1) <= 1)
      {
        v19 = CFSTR("Stark-SARHybrid");
        objc_msgSend(v14, "clearEngineTypes");
        objc_msgSend(v14, "addEngineType:", 3);
        +[BrowseManager setCacheKey:writesToDisk:](BrowseManager, "setCacheKey:writesToDisk:", v19, 0);
        goto LABEL_16;
      }
    }
    v19 = CFSTR("Stark-SAR");
LABEL_16:
    v20 = -[BrowseManager initWithCacheKey:]([BrowseManager alloc], "initWithCacheKey:", v19);
    -[BrowseManager setTraits:](v20, "setTraits:", v14);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100C19A08;
    v22[3] = &unk_1011AE6F0;
    v23 = v20;
    v6 = v6;
    v24 = v6;
    v21 = v20;
    -[BrowseManager getCategoriesWithCompletion:](v21, "getCategoriesWithCompletion:", v22);

    goto LABEL_17;
  }
  v17 = sub_10043364C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v30 = dword_1014D4494;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Chrome not ready for fuel search, delaying performSearchForEngineTypeCount=%d", buf, 8u);
  }

  if (dword_1014D4494 > 9)
  {
    dword_1014D4494 = 0;
  }
  else
  {
    ++dword_1014D4494;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C199F8;
    block[3] = &unk_1011AEA00;
    v27 = a1;
    v28 = a3;
    v6 = v6;
    v26 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
LABEL_17:

}

@end
