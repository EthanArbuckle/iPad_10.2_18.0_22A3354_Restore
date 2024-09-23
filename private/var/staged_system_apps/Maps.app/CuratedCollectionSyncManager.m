@implementation CuratedCollectionSyncManager

+ (id)sharedManager
{
  if (qword_1014D2380 != -1)
    dispatch_once(&qword_1014D2380, &stru_1011B4520);
  return (id)qword_1014D2378;
}

- (CuratedCollectionSyncManager)init
{
  CuratedCollectionSyncManager *v2;
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  void *v5;
  uint64_t v6;
  NSArray *storeSubscriptionTypes;
  NSArray *queryContents;
  objc_super v10;
  uint64_t v11;

  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionSyncManager;
  v2 = -[CuratedCollectionSyncManager init](&v10, "init");
  if (v2)
  {
    v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___CuratedCollectionSyncManagerObserver, 0);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v5, "subscribe:", v2);

    v11 = objc_opt_class(MSCuratedCollection);
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v6;

    queryContents = v2->_queryContents;
    v2->_queryContents = (NSArray *)&__NSArray0__struct;

    -[CuratedCollectionSyncManager storeDidChangeWithTypes:](v2, "storeDidChangeWithTypes:", &__NSArray0__struct);
  }
  return v2;
}

- (void)addSavedCuratedCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!-[CuratedCollectionSyncManager collectionIsSaved:](self, "collectionIsSaved:", v6))
  {
    v16 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    -[CuratedCollectionSyncManager _addCachedCuratedCollections:completion:](self, "_addCachedCuratedCollections:completion:", v8, 0);

    v9 = objc_alloc_init((Class)MSCuratedCollection);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIdentifier"));
    objc_msgSend(v9, "setCuratedCollectionIdentifier:", objc_msgSend(v10, "muid"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIdentifier"));
    objc_msgSend(v9, "setResultProviderIdentifier:", objc_msgSend(v11, "resultProviderID"));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1003D0658;
    v13[3] = &unk_1011AE240;
    v14 = v9;
    v15 = v7;
    v12 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  }
}

- (id)createCantorPair:(unint64_t)a3 y:(int)a4
{
  return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", ((a3 + a4 + (a3 + a4) * (a3 + a4)) >> 1) + a4);
}

- (void)fetchCachedCollectionsWithCuratedCollections:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id obj;
  _QWORD v27[4];
  id v28;
  CuratedCollectionSyncManager *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v5 = a3;
  v24 = a4;
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = objc_alloc_init((Class)NSMutableArray);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionSyncManager createCantorPair:y:](self, "createCantorPair:y:", objc_msgSend(v12, "curatedCollectionIdentifier"), objc_msgSend(v12, "resultProviderIdentifier")));
        objc_msgSend(v6, "addObject:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "curatedCollectionIdentifier")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "resultProviderIdentifier")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("curatedCollectionIdentifier = %@ && resultProviderIdentifier = %@"), v14, v15));
        objc_msgSend(v7, "addObject:", v16);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  v17 = v7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v7));
  v19 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v18, 0, 0);
  v20 = objc_alloc_init((Class)MSCachedCuratedCollectionRequest);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1003D09F4;
  v27[3] = &unk_1011B4548;
  v28 = v6;
  v29 = self;
  v30 = obj;
  v31 = v24;
  v21 = v24;
  v22 = obj;
  v23 = v6;
  objc_msgSend(v20, "fetchWithOptions:completionHandler:", v19, v27);

}

- (void)updateSavedCuratedCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[2];

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIdentifier"));
  v9 = objc_msgSend(v8, "muid");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIdentifier"));
  v11 = objc_msgSend(v10, "resultProviderID");

  v12 = objc_alloc_init((Class)MSCuratedCollection);
  objc_msgSend(v12, "setCuratedCollectionIdentifier:", v9);
  objc_msgSend(v12, "setResultProviderIdentifier:", v11);
  v13 = objc_alloc_init((Class)MSCuratedCollection);
  objc_msgSend(v13, "setCuratedCollectionIdentifier:", v9);
  objc_msgSend(v13, "setResultProviderIdentifier:", 0);
  v22[0] = v12;
  v22[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003D0E6C;
  v17[3] = &unk_1011B4570;
  objc_copyWeak(&v20, &location);
  v15 = v6;
  v18 = v15;
  v16 = v7;
  v19 = v16;
  -[CuratedCollectionSyncManager fetchCachedCollectionsWithCuratedCollections:completion:](self, "fetchCachedCollectionsWithCuratedCollections:completion:", v14, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)removeSavedCuratedCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIdentifier"));
  v8 = objc_msgSend(v10, "muid");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIdentifier"));

  -[CuratedCollectionSyncManager _removeSavedCuratedCollectionWithIdentifierMuid:resultProviderId:completion:](self, "_removeSavedCuratedCollectionWithIdentifierMuid:resultProviderId:completion:", v8, objc_msgSend(v9, "resultProviderID"), v6);
}

- (void)removeSavedMapsSyncCuratedCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "curatedCollectionIdentifier");
  v8 = objc_msgSend(v6, "resultProviderIdentifier");

  -[CuratedCollectionSyncManager _removeSavedCuratedCollectionWithIdentifierMuid:resultProviderId:completion:](self, "_removeSavedCuratedCollectionWithIdentifierMuid:resultProviderId:completion:", v7, v8, v9);
}

- (void)_removeSavedCuratedCollectionWithIdentifierMuid:(unint64_t)a3 resultProviderId:(int)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  NSArray *queryContents;
  void *v10;
  void *v11;
  NSArray *cachedCuratedCollections;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  int v18;
  _QWORD v19[5];
  int v20;

  v8 = (void (**)(_QWORD))a5;
  queryContents = self->_queryContents;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1003D1154;
  v19[3] = &unk_1011B4590;
  v19[4] = a3;
  v20 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v19));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](queryContents, "filteredArrayUsingPredicate:", v10));

  cachedCuratedCollections = self->_cachedCuratedCollections;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003D11C4;
  v17[3] = &unk_1011B4590;
  v17[4] = a3;
  v18 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v17));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](cachedCuratedCollections, "filteredArrayUsingPredicate:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v14));
  objc_msgSend(v15, "deleteWithObjects:error:", v16, 0);

  if (v8)
    v8[2](v8);

}

- (void)_addCachedCuratedCollections:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id obj;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v17 = a4;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11);
        dispatch_group_enter(v7);
        v13 = objc_alloc_init((Class)MSCachedCuratedCollection);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionIdentifier"));
        objc_msgSend(v13, "setCuratedCollectionIdentifier:", objc_msgSend(v14, "muid"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionIdentifier"));
        objc_msgSend(v13, "setResultProviderIdentifier:", objc_msgSend(v15, "resultProviderID"));

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1003D1474;
        v21[3] = &unk_1011AC860;
        v22 = v7;
        -[CuratedCollectionSyncManager _updateCachedCuratedCollection:withCollection:completion:](self, "_updateCachedCuratedCollection:withCollection:completion:", v13, v12, v21);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  dispatch_group_leave(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D147C;
  block[3] = &unk_1011ADA00;
  v20 = v17;
  v16 = v17;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_updateCachedCuratedCollection:(id)a3 withCollection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v11, "screenScale");
  v13 = v12;

  v14 = v13 * 70.0;
  if (!objc_msgSend(v8, "resultProviderIdentifier"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionIdentifier"));
    v16 = objc_msgSend(v15, "resultProviderID");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionIdentifier"));
      objc_msgSend(v8, "setResultProviderIdentifier:", objc_msgSend(v17, "resultProviderID"));

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionTitle"));
  objc_msgSend(v8, "setTitle:", v18);

  objc_msgSend(v8, "setPlacesCount:", objc_msgSend(v9, "numberOfItems"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisherAttributionIdentifierString"));
  objc_msgSend(v8, "setPublisherAttribution:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "photos"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_geo_firstPhotoOfAtLeastSize:", v14, v14));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "url"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
    objc_msgSend(v8, "setImageUrl:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v26 = v8;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  objc_msgSend(v24, "saveWithObjects:error:", v25, 0);

  -[CuratedCollectionSyncManager _updateSyncedCollectionResultProviderIdIfNeededWithCollection:](self, "_updateSyncedCollectionResultProviderIdIfNeededWithCollection:", v9);
  if (v10)
    v10[2](v10);

}

- (void)_updateSyncedCollectionResultProviderIdIfNeededWithCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSArray *queryContents;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  void *v30;
  _BYTE v31[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionIdentifier"));
  v6 = objc_msgSend(v5, "resultProviderID");

  if ((_DWORD)v6)
  {
    queryContents = self->_queryContents;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1003D1928;
    v26[3] = &unk_1011B0CC8;
    v27 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v26));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](queryContents, "filteredArrayUsingPredicate:", v8));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "setResultProviderIdentifier:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
          v30 = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
          v21 = 0;
          objc_msgSend(v16, "saveWithObjects:error:", v17, &v21);
          v18 = v21;

          if (v18)
          {
            v19 = sub_1004315EC();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v18;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error updating synced curated collection with lsp: %@", buf, 0xCu);
            }

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v12);
    }

  }
}

- (void)_cacheSyncedCollections:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  if (!-[CuratedCollectionSyncManager isPopulatingCachedCollections](self, "isPopulatingCachedCollections"))
  {
    -[CuratedCollectionSyncManager setIsPopulatingCachedCollections:](self, "setIsPopulatingCachedCollections:", 1);
    v5 = sub_10039DCD4(v4, &stru_1011B45D0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ticketForCuratedCollections:isBatchLookup:traits:", v6, 0, 0));

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003D1B40;
    v9[3] = &unk_1011AD9D0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "submitWithHandler:networkActivity:", v9, 0);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

- (void)_updateContent
{
  NSArray *queryContents;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queryContents = self->_queryContents;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003D1D28;
  v4[3] = &unk_1011B0238;
  objc_copyWeak(&v5, &location);
  -[CuratedCollectionSyncManager fetchCachedCollectionsWithCuratedCollections:completion:](self, "fetchCachedCollectionsWithCuratedCollections:completion:", queryContents, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)MSCuratedCollectionRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003D1EB8;
  v6[3] = &unk_1011AD9D0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "fetchWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionSyncManager observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionSyncManager observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (BOOL)collectionIsSaved:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "collectionIdentifier"));
  LOBYTE(self) = -[CuratedCollectionSyncManager collectionIsSavedWithIdentifier:](self, "collectionIsSavedWithIdentifier:", v4);

  return (char)self;
}

- (BOOL)collectionIsSavedWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionSyncManager queryContents](self, "queryContents", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "curatedCollectionIdentifier");
        if (v10 == objc_msgSend(v4, "muid"))
        {
          if (!objc_msgSend(v9, "resultProviderIdentifier")
            || (v11 = objc_msgSend(v9, "resultProviderIdentifier"),
                v11 == objc_msgSend(v4, "resultProviderID")))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v6;
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)cachedCuratedCollections
{
  return self->_cachedCuratedCollections;
}

- (void)setCachedCuratedCollections:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCuratedCollections, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSArray)queryContents
{
  return self->_queryContents;
}

- (void)setQueryContents:(id)a3
{
  objc_storeStrong((id *)&self->_queryContents, a3);
}

- (BOOL)isPopulatingCachedCollections
{
  return self->_isPopulatingCachedCollections;
}

- (void)setIsPopulatingCachedCollections:(BOOL)a3
{
  self->_isPopulatingCachedCollections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContents, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedCuratedCollections, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
}

@end
