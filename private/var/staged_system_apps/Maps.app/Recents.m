@implementation Recents

+ (void)beginPrecachingRecentsIfNeeded
{
  id v2;

  v2 = objc_msgSend(a1, "sharedRecents");
}

+ (id)sharedRecents
{
  if (qword_1014D22B0 != -1)
    dispatch_once(&qword_1014D22B0, &stru_1011B3B18);
  return (id)qword_1014D22B8;
}

- (void)addObserver:(id)a3
{
  id v4;
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v6;
  GEOObserverHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    v6 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___RecentsObserver, &_dispatch_main_q);
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[GEOObserverHashTable registerObserver:](observers, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (id)cachedMapItemForContactID:(int64_t)a3
{
  geo_isolater *coreRecentsMapItemCacheIsolator;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1003A3178;
  v11 = sub_1003A3188;
  v12 = 0;
  coreRecentsMapItemCacheIsolator = self->_coreRecentsMapItemCacheIsolator;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003A3190;
  v6[3] = &unk_1011B3B40;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  geo_isolate_sync(coreRecentsMapItemCacheIsolator, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (Recents)init
{
  Recents *v2;
  void *v3;
  NSArray *historyQueryContents;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dataLoadingQueue;
  void *v9;
  uint64_t v10;
  NSArray *storeSubscriptionTypes;
  uint64_t v12;
  geo_isolater *coreRecentsMapItemCacheIsolator;
  uint64_t v14;
  NSMutableDictionary *coreRecentsMapItemCache;
  RecentCuratedCollectionResolver *v16;
  RecentCuratedCollectionResolver *curatedCollectionResolver;
  void *v18;
  objc_super v20;
  _QWORD v21[7];

  v20.receiver = self;
  v20.super_class = (Class)Recents;
  v2 = -[Recents init](&v20, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_applicationActivating", UIApplicationWillEnterForegroundNotification, 0);

    historyQueryContents = v2->_historyQueryContents;
    v2->_historyQueryContents = (NSArray *)&__NSArray0__struct;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.Maps.Recents.DataLoading", v6);
    dataLoadingQueue = v2->_dataLoadingQueue;
    v2->_dataLoadingQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v9, "subscribe:", v2);

    v21[0] = objc_opt_class(MSHistoryItem);
    v21[1] = objc_opt_class(MSHistoryPlaceItem);
    v21[2] = objc_opt_class(MSHistorySearchItem);
    v21[3] = objc_opt_class(MSHistoryDirectionsItem);
    v21[4] = objc_opt_class(MSHistoryTransitItem);
    v21[5] = objc_opt_class(MSHistoryCuratedCollection);
    v21[6] = objc_opt_class(MSHistoryMultiPointRoute);
    v10 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 7));
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v10;

    v12 = geo_isolater_create("com.apple.Maps.Recents.CoreRecentsMapItemCache");
    coreRecentsMapItemCacheIsolator = v2->_coreRecentsMapItemCacheIsolator;
    v2->_coreRecentsMapItemCacheIsolator = (geo_isolater *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    coreRecentsMapItemCache = v2->_coreRecentsMapItemCache;
    v2->_coreRecentsMapItemCache = (NSMutableDictionary *)v14;

    -[Recents setNeedsCoreRecentsReload](v2, "setNeedsCoreRecentsReload");
    v16 = objc_alloc_init(RecentCuratedCollectionResolver);
    curatedCollectionResolver = v2->_curatedCollectionResolver;
    v2->_curatedCollectionResolver = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RecentCuratedCollectionResolver observers](v2->_curatedCollectionResolver, "observers"));
    objc_msgSend(v18, "registerObserver:", v2);

    -[Recents storeDidChangeWithTypes:](v2, "storeDidChangeWithTypes:", &__NSArray0__struct);
  }
  return v2;
}

- (NSArray)orderedRecents
{
  return self->_resolvedOrderedRecents;
}

- (NSArray)recents
{
  return self->_resolvedHistoryRecents;
}

- (id)_recentsFromHistoryQuery
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  HistoryEntryRecentsItem *v11;
  HistoryEntryRecentsItem *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Recents historyQueryContents](self, "historyQueryContents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v2, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(MSHistoryMarkedLocation);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
        {
          v11 = [HistoryEntryRecentsItem alloc];
          v12 = -[HistoryEntryRecentsItem initWithHistoryEntry:](v11, "initWithHistoryEntry:", v9, (_QWORD)v15);
          if (v12)
            objc_msgSend(v3, "addObject:", v12);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = objc_msgSend(v3, "copy");
  return v13;
}

- (void)setNeedsCoreRecentsReload
{
  __CFRunLoop *Current;
  _QWORD block[5];
  id v5;
  id location;

  if (!self->_needsReload)
  {
    self->_needsReload = 1;
    objc_initWeak(&location, self);
    Current = CFRunLoopGetCurrent();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003A369C;
    block[3] = &unk_1011AEAA0;
    block[4] = self;
    objc_copyWeak(&v5, &location);
    CFRunLoopPerformBlock(Current, kCFRunLoopCommonModes, block);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)loadCoreRecentsOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  dispatch_group_t v7;
  char BOOL;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  Recents *v22;
  dispatch_group_t v23;
  id v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a4;
  v6 = a3;
  v7 = dispatch_group_create();
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRRecentContactsLibrary defaultInstance](CRRecentContactsLibrary, "defaultInstance"));
  BOOL = GEOConfigGetBOOL(MapsConfig_ForwardAddressFiltering, off_1014B2FA8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRRecentContactsLibrary messageSourcesBundleIdentifiers](CRRecentContactsLibrary, "messageSourcesBundleIdentifiers"));
  v10 = objc_alloc_init((Class)CRSearchQuery);
  v27 = CRAddressKindMapLocation;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRSearchPredicate predicateForKey:inCollection:](CRSearchPredicate, "predicateForKey:inCollection:", CFSTR("kind"), v11));

  objc_msgSend(v10, "setSearchPredicate:", v12);
  v26 = CRRecentsDomainMaps;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  objc_msgSend(v10, "setDomains:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRSearchQuery frecencyComparator](CRSearchQuery, "frecencyComparator"));
  objc_msgSend(v10, "setComparator:", v14);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003A39C4;
  v20[3] = &unk_1011B3B90;
  v21 = v9;
  v22 = self;
  v25 = BOOL;
  v23 = v7;
  v24 = v5;
  v15 = v5;
  v16 = v7;
  v17 = v9;
  objc_msgSend(v19, "performRecentsSearch:queue:completion:", v10, v6, v20);

}

- (void)_combineRecents
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Recents _recentsFromHistoryQuery](self, "_recentsFromHistoryQuery"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[Recents systemRecents](self, "systemRecents"));
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v3, "count") + (_QWORD)objc_msgSend(v4, "count"));
  objc_msgSend(v5, "addObjectsFromArray:", v3);
  objc_msgSend(v5, "addObjectsFromArray:", v4);
  objc_msgSend(v5, "sortWithOptions:usingComparator:", 16, &stru_1011B3BD0);
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003A42CC;
  v8[3] = &unk_1011AFF10;
  objc_copyWeak(&v11, &location);
  v9 = v3;
  v10 = v5;
  v6 = v5;
  v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_processRecents
{
  id v3;
  void *v4;
  NSArray *v5;
  NSArray *resolvedHistoryRecents;
  NSArray *v7;
  NSArray *resolvedOrderedRecents;
  id v9;

  v3 = sub_10039DCD4(self->_historyRecents, &stru_1011B3C10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[RecentCuratedCollectionResolver setRecentCuratedCollections:](self->_curatedCollectionResolver, "setRecentCuratedCollections:", v4);

  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[Recents _recentsByMappingCuratedCollectionsForRecents:](self, "_recentsByMappingCuratedCollectionsForRecents:", self->_historyRecents));
  resolvedHistoryRecents = self->_resolvedHistoryRecents;
  self->_resolvedHistoryRecents = v5;

  v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[Recents _recentsByMappingCuratedCollectionsForRecents:](self, "_recentsByMappingCuratedCollectionsForRecents:", self->_orderedRecents));
  resolvedOrderedRecents = self->_resolvedOrderedRecents;
  self->_resolvedOrderedRecents = v7;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("RecentsDidChangeNotification"), self);

}

- (void)deleteCoreRecentContact:(id)a3
{
  id v4;
  NSMutableArray *coreRecentsNoResultCacheIDs;
  void *v6;
  void *v7;
  void *v8;
  geo_isolater *coreRecentsMapItemCacheIsolator;
  id v10;
  NSObject *dataLoadingQueue;
  id v12;
  _QWORD block[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  coreRecentsNoResultCacheIDs = self->_coreRecentsNoResultCacheIDs;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v4, "contactID")));
  -[NSMutableArray addObject:](coreRecentsNoResultCacheIDs, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "setObject:forKey:", self->_coreRecentsNoResultCacheIDs, CFSTR("RecentsNoResultCacheIdsKey"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "synchronize");

  coreRecentsMapItemCacheIsolator = self->_coreRecentsMapItemCacheIsolator;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003A458C;
  v15[3] = &unk_1011AC8B0;
  v15[4] = self;
  v10 = v4;
  v16 = v10;
  geo_isolate_sync(coreRecentsMapItemCacheIsolator, v15);
  dataLoadingQueue = self->_dataLoadingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A45E8;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_sync(dataLoadingQueue, block);

}

- (void)recordCoreRecentContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
    v6 = CRAddressKindMapLocation;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRRecentContactsLibrary recentEventForAddress:displayName:kind:date:weight:metadata:options:](CRRecentContactsLibrary, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v4, v5, v6, v7, 0, 0, 1));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRRecentContactsLibrary defaultInstance](CRRecentContactsLibrary, "defaultInstance"));
    v13 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v11 = CRRecentsDomainMaps;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastSendingAddress"));

    objc_msgSend(v9, "recordContactEvents:recentsDomain:sendingAddress:completion:", v10, v11, v12, 0);
  }
}

- (void)deleteRecents:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void (**v32)(id, id);
  void *v33;
  void *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v32 = (void (**)(id, id))a4;
  v6 = a3;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Recents _recentByUnmappingCuratedCollectionsForRecents:](self, "_recentByUnmappingCuratedCollectionsForRecents:", v6));

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(HistoryEntryRecentsItem);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = v12;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "linkedRecentRoute"));
          v16 = v15;
          if (v15)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "historyEntry"));
            objc_msgSend(v34, "addObject:", v17);

          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "historyEntry"));
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_1003A4BA0;
          v43[3] = &unk_1011B3C38;
          v43[4] = self;
          v44 = v14;
          v45 = v34;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1003A4C34;
          v41[3] = &unk_1011B3C60;
          v41[4] = self;
          v19 = v45;
          v42 = v19;
          v20 = v14;
          objc_msgSend(v18, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v43, 0, v41, 0);

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "historyEntry"));
          objc_msgSend(v19, "addObject:", v21);

        }
        else
        {
          v22 = objc_opt_class(CRRecentContact);
          if ((objc_opt_isKindOfClass(v12, v22) & 1) != 0)
            objc_msgSend(v33, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v9);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = v33;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
        objc_msgSend(v29, "deleteCoreRecentContact:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v25);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v36 = 0;
  objc_msgSend(v30, "deleteWithObjects:error:", v34, &v36);
  v31 = v36;

  v32[2](v32, v31);
}

- (void)deleteAllRecentsWithCompletion:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *historyQueryContents;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_orderedRecents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(CRRecentContact);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          -[Recents deleteCoreRecentContact:](self, "deleteCoreRecentContact:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  historyQueryContents = self->_historyQueryContents;
  v20 = 0;
  objc_msgSend(v12, "deleteWithObjects:error:", historyQueryContents, &v20);
  v14 = v20;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A4E9C;
  block[3] = &unk_1011ACAD0;
  v18 = v14;
  v19 = v4;
  v15 = v14;
  v16 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)_recentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1003A3178;
  v16 = sub_1003A3188;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Recents recents](self, "recents"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A4FBC;
  v9[3] = &unk_1011B3C88;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_recentPlaceDisplayWithSupersededStorageIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1003A3178;
  v16 = sub_1003A3188;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Recents recents](self, "recents"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A5174;
  v9[3] = &unk_1011B3C88;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)storeDidChangeWithTypes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)MSHistoryItemRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003A5394;
  v6[3] = &unk_1011ADF70;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "fetchWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (id)_recentsByMappingCuratedCollectionsForRecents:(id)a3
{
  id v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003A54D4;
  v5[3] = &unk_1011B0C00;
  v5[4] = self;
  v3 = sub_10039DCD4(a3, v5);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)_recentByUnmappingCuratedCollectionsForRecents:(id)a3
{
  return sub_10039DCD4(a3, &stru_1011B3CF0);
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)historyQueryContents
{
  return self->_historyQueryContents;
}

- (void)setHistoryQueryContents:(id)a3
{
  objc_storeStrong((id *)&self->_historyQueryContents, a3);
}

- (NSArray)systemRecents
{
  return self->_systemRecents;
}

- (void)setSystemRecents:(id)a3
{
  objc_storeStrong((id *)&self->_systemRecents, a3);
}

- (NSArray)historyRecents
{
  return self->_historyRecents;
}

- (void)setHistoryRecents:(id)a3
{
  objc_storeStrong((id *)&self->_historyRecents, a3);
}

- (NSArray)resolvedHistoryRecents
{
  return self->_resolvedHistoryRecents;
}

- (void)setResolvedHistoryRecents:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedHistoryRecents, a3);
}

- (NSArray)resolvedOrderedRecents
{
  return self->_resolvedOrderedRecents;
}

- (void)setResolvedOrderedRecents:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedOrderedRecents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedOrderedRecents, 0);
  objc_storeStrong((id *)&self->_resolvedHistoryRecents, 0);
  objc_storeStrong((id *)&self->_historyRecents, 0);
  objc_storeStrong((id *)&self->_systemRecents, 0);
  objc_storeStrong((id *)&self->_historyQueryContents, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_orderedRecents, 0);
  objc_storeStrong((id *)&self->_curatedCollectionResolver, 0);
  objc_storeStrong((id *)&self->_dataLoadingQueue, 0);
  objc_storeStrong((id *)&self->_coreRecentsNoResultCacheIDs, 0);
  objc_storeStrong((id *)&self->_coreRecentsMapItemCacheIsolator, 0);
  objc_storeStrong((id *)&self->_coreRecentsMapItemCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
