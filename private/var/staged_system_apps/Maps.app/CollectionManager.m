@implementation CollectionManager

+ (id)sharedManager
{
  if (qword_1014D3770 != -1)
    dispatch_once(&qword_1014D3770, &stru_1011D9F08);
  return (id)qword_1014D3768;
}

- (CollectionManager)init
{
  CollectionManager *v2;
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *updateContentQueue;
  GEOObserverHashTable *v13;
  GEOObserverHashTable *observers;
  uint64_t v15;
  NSMutableArray *currentContents;
  CollectionOrderStorage *v17;
  CollectionOrderStorage *orderStorage;
  CollectionOrderStorage *v19;
  CollectionOrderStorage *v20;
  void *v21;
  uint64_t v22;
  NSArray *storeSubscriptionTypes;
  MapsThrottler *v24;
  OS_dispatch_queue *v25;
  MapsThrottler *v26;
  MapsThrottler *fetchThrottler;
  id v28;
  NSObject *v29;
  NSObject *v30;
  uint8_t v32[8];
  _QWORD v33[4];
  id v34;
  id buf[2];
  objc_super v36;
  _QWORD v37[5];

  v36.receiver = self;
  v36.super_class = (Class)CollectionManager;
  v2 = -[CollectionManager init](&v36, "init");
  if (v2)
  {
    v3 = sub_1004315EC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = os_signpost_id_generate(v4);

    v6 = sub_1004315EC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Initialization", ", (uint8_t *)buf, 2u);
    }

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("CollectionManager.updateContent", v10);
    updateContentQueue = v2->_updateContentQueue;
    v2->_updateContentQueue = (OS_dispatch_queue *)v11;

    v13 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___CollectionManagerObserver, 0);
    observers = v2->_observers;
    v2->_observers = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    currentContents = v2->_currentContents;
    v2->_currentContents = (NSMutableArray *)v15;

    v17 = objc_alloc_init(CollectionOrderStorage);
    orderStorage = v2->_orderStorage;
    v2->_orderStorage = v17;

    v19 = objc_alloc_init(CollectionOrderStorage);
    v20 = v2->_orderStorage;
    v2->_orderStorage = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v21, "subscribe:", v2);

    v37[0] = objc_opt_class(MSCollection);
    v37[1] = objc_opt_class(MSCollectionItem);
    v37[2] = objc_opt_class(MSCollectionPlaceItem);
    v37[3] = objc_opt_class(MSCollectionTransitItem);
    v37[4] = objc_opt_class(MSCuratedCollection);
    v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 5));
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v22;

    objc_initWeak(buf, v2);
    v24 = [MapsThrottler alloc];
    v25 = v2->_updateContentQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10088CDA4;
    v33[3] = &unk_1011B3F50;
    objc_copyWeak(&v34, buf);
    v26 = -[MapsThrottler initWithInitialValue:throttlingInterval:queue:updateHandler:](v24, "initWithInitialValue:throttlingInterval:queue:updateHandler:", &__kCFBooleanTrue, v25, v33, 0.0);
    fetchThrottler = v2->_fetchThrottler;
    v2->_fetchThrottler = v26;

    -[CollectionManager _scheduleFetch](v2, "_scheduleFetch");
    v28 = sub_1004315EC();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v30 = v29;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)v32 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, v5, "Initialization", ", v32, 2u);
    }

    objc_destroyWeak(&v34);
    objc_destroyWeak(buf);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_didRegisterForCollectionsSyncManager)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)CollectionManager;
  -[CollectionManager dealloc](&v4, "dealloc");
}

- (id)newTraits
{
  void *v3;
  uint64_t (**v4)(void);
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager traitsCreationBlock](self, "traitsCreationBlock"));

  if (!v3
    || (v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CollectionManager traitsCreationBlock](self, "traitsCreationBlock")),
        v5 = v4[2](),
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5),
        v4,
        !v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapsDefaultTraits"));

  }
  return v6;
}

- (CollectionHandler)allPlacesCollection
{
  CollectionHandler *allPlacesCollection;
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  CollectionHandler *v10;
  CollectionHandler *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  allPlacesCollection = self->_allPlacesCollection;
  if (!allPlacesCollection)
  {
    v4 = sub_1004315EC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = os_signpost_id_generate(v5);

    v7 = sub_1004315EC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AllPlacesCollection", ", buf, 2u);
    }

    v10 = (CollectionHandler *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collectionAllSavedPlaces](CollectionHandler, "collectionAllSavedPlaces"));
    v11 = self->_allPlacesCollection;
    self->_allPlacesCollection = v10;

    -[CollectionHandler setCollectionOperation:](self->_allPlacesCollection, "setCollectionOperation:", self);
    v12 = sub_1004315EC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)v16 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v6, "AllPlacesCollection", ", v16, 2u);
    }

    allPlacesCollection = self->_allPlacesCollection;
  }
  return allPlacesCollection;
}

- (CollectionHandler)favoriteCollection
{
  CollectionHandler *v3;
  CollectionHandler *favoriteCollection;

  if (!self->_favoriteCollection
    && +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (CollectionHandler *)objc_claimAutoreleasedReturnValue(+[CollectionHandler favoriteCollection](CollectionHandler, "favoriteCollection"));
    favoriteCollection = self->_favoriteCollection;
    self->_favoriteCollection = v3;

    -[CollectionHandler setCollectionOperation:](self->_favoriteCollection, "setCollectionOperation:", self);
  }
  return self->_favoriteCollection;
}

- (void)_scheduleFetch
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsThrottler value](self->_fetchThrottler, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "BOOLValue") ^ 1));
  -[MapsThrottler setValue:](self->_fetchThrottler, "setValue:", v3);

}

- (void)_fetchCollectionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateContentQueue);
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)MSCollectionRequest);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10088D1BC;
  v7[3] = &unk_1011B21F8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "fetchWithCompletionHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)touchCollection:(id)a3
{
  -[CollectionOrderStorage editCollection:](self->_orderStorage, "editCollection:", a3);
  self->_needToSendUpdate = 1;
  -[CollectionManager _updateContent](self, "_updateContent");
}

- (void)createCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_1004315EC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[MCM] createCollection %@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager _asMapsSyncObjectOrNil:](self, "_asMapsSyncObjectOrNil:", v6));
  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v19 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_10088D580;
    v17 = &unk_1011AE218;
    v18 = v7;
    objc_msgSend(v12, "saveWithObjects:completionHandler:", v13, &v14);

    -[CollectionOrderStorage editCollection:](self->_orderStorage, "editCollection:", v6, v14, v15, v16, v17);
  }

}

- (void)saveCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_1004315EC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[MCM] saveCollection %@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager _asMapsSyncObjectOrNil:](self, "_asMapsSyncObjectOrNil:", v6));
  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v19 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_10088D840;
    v17 = &unk_1011AE218;
    v18 = v7;
    objc_msgSend(v12, "saveWithObjects:completionHandler:", v13, &v14);

    -[CollectionOrderStorage editCollection:](self->_orderStorage, "editCollection:", v6, v14, v15, v16, v17);
  }

}

- (void)deleteCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CollectionOrderStorage *orderStorage;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_1004315EC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[MCM] deleteCollection %@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager _asMapsSyncObjectOrNil:](self, "_asMapsSyncObjectOrNil:", v6));
  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v19 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10088DB2C;
    v16[3] = &unk_1011AE218;
    v17 = v7;
    objc_msgSend(v12, "deleteWithObjects:completionHandler:", v13, v16);

    orderStorage = self->_orderStorage;
    v18 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    -[CollectionOrderStorage removeCollections:](orderStorage, "removeCollections:", v15);

  }
}

- (void)deleteCollections:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = sub_1004315EC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[MCM] deleteCollections %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager _asMapsSyncObjectOrNil:](self, "_asMapsSyncObjectOrNil:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15)));
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10088DE74;
    v18[3] = &unk_1011AE218;
    v19 = v7;
    objc_msgSend(v17, "deleteWithObjects:completionHandler:", v10, v18);

    -[CollectionOrderStorage removeCollections:](self->_orderStorage, "removeCollections:", v11);
  }

}

- (void)_updateContent
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSMutableArray *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  BOOL v22;
  NSMutableArray *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *j;
  void *v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  void *v45;
  void *v46;
  unsigned int v47;
  id v48;
  NSObject *v49;
  NSMutableArray *currentContents;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t spid;
  void *v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id obj;
  id obja;
  CollectionManager *v67;
  int v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  void *v89;
  uint8_t v90[128];
  uint8_t buf[4];
  NSMutableArray *v92;

  v3 = sub_1004315EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_generate(v4);

  v6 = sub_1004315EC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  spid = v5;
  v58 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "UpdateContent", ", buf, 2u);
  }

  v9 = sub_1004315EC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[CollectionManager queryContents](self, "queryContents"));
    *(_DWORD *)buf = 138412290;
    v92 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[MCM] _updateContent %@", buf, 0xCu);

  }
  v64 = -[NSMutableArray mutableCopy](self->_currentContents, "mutableCopy");
  v61 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
  v12 = objc_claimAutoreleasedReturnValue(-[CollectionManager favoriteCollection](self, "favoriteCollection"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager allPlacesCollection](self, "allPlacesCollection"));
  if (v12)
    -[NSMutableArray removeObject:](self->_currentContents, "removeObject:", v12);
  if (v59)
    -[NSMutableArray removeObject:](self->_currentContents, "removeObject:");
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CollectionManager queryContents](self, "queryContents"));
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  v67 = self;
  v57 = (void *)v12;
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v83;
    v60 = *(_QWORD *)v83;
    while (2)
    {
      v17 = 0;
      v62 = v14;
      do
      {
        if (*(_QWORD *)v83 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));

        v21 = objc_msgSend(v18, "placesCount");
        if (objc_msgSend(v18, "isLegacyFavoritesCollection"))
          v22 = v21 == 0;
        else
          v22 = 0;
        if (!v22)
        {
          if (!v20)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
            v89 = v18;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
            objc_msgSend(v31, "deleteWithObjects:error:", v32, 0);

            goto LABEL_36;
          }
          v68 = v15;
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v23 = self->_currentContents;
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v79;
            while (2)
            {
              for (i = 0; i != v25; i = (char *)i + 1)
              {
                if (*(_QWORD *)v79 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
                v30 = objc_msgSend(v20, "isEqualToString:", v29);

                if (v30)
                {
                  objc_msgSend(v64, "removeObject:", v28);
                  objc_msgSend(v28, "updateWithMapsSyncCollection:", v18);
                  self = v67;
                  goto LABEL_30;
                }
              }
              v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
              if (v25)
                continue;
              break;
            }
          }

          v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collectionWithMapsSyncCollection:](CollectionHandler, "collectionWithMapsSyncCollection:", v18));
          self = v67;
          -[NSMutableArray setCollectionOperation:](v23, "setCollectionOperation:", v67);
          objc_msgSend(v61, "addObject:", v23);
LABEL_30:
          v15 = (v68 + 1);

          v16 = v60;
          v14 = v62;
        }

        v17 = (char *)v17 + 1;
      }
      while (v17 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_36:

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v33, "setMapFeaturePersonalCollectionsCount:", v15);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cachedCuratedCollections"));

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v63 = v35;
  v69 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
  if (v69)
  {
    obja = *(id *)v75;
    do
    {
      for (j = 0; j != v69; j = (char *)j + 1)
      {
        if (*(id *)v75 != obja)
          objc_enumerationMutation(v63);
        v37 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "UUIDString"));

        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v40 = self->_currentContents;
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v71;
          while (2)
          {
            for (k = 0; k != v42; k = (char *)k + 1)
            {
              if (*(_QWORD *)v71 != v43)
                objc_enumerationMutation(v40);
              v45 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)k);
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "identifier"));
              v47 = objc_msgSend(v39, "isEqualToString:", v46);

              if (v47)
              {
                objc_msgSend(v64, "removeObject:", v45);
                objc_msgSend(v45, "updateWithMapsSyncCachedCuratedCollection:", v37);
                self = v67;
                goto LABEL_51;
              }
            }
            v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
            if (v42)
              continue;
            break;
          }
        }

        v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collectionWithMapsSyncCachedCuratedCollection:](CollectionHandler, "collectionWithMapsSyncCachedCuratedCollection:", v37));
        self = v67;
        -[NSMutableArray setCollectionOperation:](v40, "setCollectionOperation:", v67);
        objc_msgSend(v61, "addObject:", v40);
LABEL_51:

      }
      v69 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    }
    while (v69);
  }

  -[NSMutableArray removeObjectsInArray:](self->_currentContents, "removeObjectsInArray:", v64);
  -[NSMutableArray addObjectsFromArray:](self->_currentContents, "addObjectsFromArray:", v61);
  v48 = sub_1004315EC();
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    currentContents = self->_currentContents;
    *(_DWORD *)buf = 138412290;
    v92 = currentContents;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[MCM] _updateContent (updated) %@", buf, 0xCu);
  }

  if (v57)
    -[NSMutableArray insertObject:atIndex:](self->_currentContents, "insertObject:atIndex:", v57, 0);
  if (v59)
    -[NSMutableArray addObject:](self->_currentContents, "addObject:");
  if (self->_needToSendUpdate || objc_msgSend(v64, "count") || objc_msgSend(v61, "count"))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager currentCollections](self, "currentCollections"));
    -[GEOObserverHashTable collectionManager:contentDidChange:](self->_observers, "collectionManager:contentDidChange:", self, v51);

  }
  self->_needToSendUpdate = 0;
  if (!self->_didRegisterForCollectionsSyncManager)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    objc_msgSend(v52, "addObserver:", self);

    self->_didRegisterForCollectionsSyncManager = 1;
  }
  v53 = sub_1004315EC();
  v54 = objc_claimAutoreleasedReturnValue(v53);
  v55 = v54;
  if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, spid, "UpdateContent", ", buf, 2u);
  }

}

- (NSArray)currentCollections
{
  return (NSArray *)-[CollectionOrderStorage orderCollections:](self->_orderStorage, "orderCollections:", self->_currentContents);
}

- (NSArray)currentCollectionsForLibrary
{
  return (NSArray *)-[CollectionManager orderedCollectionsExcludingAllPlacesCollection](self, "orderedCollectionsExcludingAllPlacesCollection");
}

- (NSArray)currentCollectionsForMacHome
{
  return (NSArray *)-[CollectionManager orderedCollectionsExcludingAllPlacesCollection](self, "orderedCollectionsExcludingAllPlacesCollection");
}

- (NSArray)currentCollectionsForiOSHome
{
  return (NSArray *)-[CollectionManager orderedCollectionsExcludingAllPlacesCollection](self, "orderedCollectionsExcludingAllPlacesCollection");
}

- (id)orderedCollectionsExcludingAllPlacesCollection
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[NSMutableArray mutableCopy](self->_currentContents, "mutableCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager allPlacesCollection](self, "allPlacesCollection"));
  objc_msgSend(v3, "removeObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionOrderStorage orderCollections:](self->_orderStorage, "orderCollections:", v3));
  return v5;
}

- (NSArray)currentCollectionsForWatchHome
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager currentCollections](self, "currentCollections"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10088E7FC;
  v7[3] = &unk_1011B0CC8;
  v7[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v7));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return (NSArray *)v5;
}

- (NSArray)currentCollectionsForCarPlay
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager currentCollections](self, "currentCollections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011D9F28));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filteredArrayUsingPredicate:", v3));

  return (NSArray *)v4;
}

- (NSArray)currentCollectionsForPicker
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];

  v3 = -[NSMutableArray mutableCopy](self->_currentContents, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_currentContents;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v8);
        v10 = objc_claimAutoreleasedReturnValue(-[CollectionManager allPlacesCollection](self, "allPlacesCollection", (_QWORD)v18));
        if (v9 == (void *)v10)
        {

LABEL_10:
          objc_msgSend(v3, "removeObject:", v9);
          goto LABEL_11;
        }
        v11 = (void *)v10;
        v12 = objc_msgSend(v9, "handlerType");

        if (v12 == (id)4)
          goto LABEL_10;
LABEL_11:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionHandler addToCollection](CollectionHandler, "addToCollection"));
  v22 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionOrderStorage orderCollections:](self->_orderStorage, "orderCollections:", v3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15));

  return (NSArray *)v16;
}

- (NSArray)currentCollectionsForToolbarMenu
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = -[NSMutableArray mutableCopy](self->_currentContents, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_currentContents;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = objc_claimAutoreleasedReturnValue(-[CollectionManager allPlacesCollection](self, "allPlacesCollection", (_QWORD)v15));
        if (v9 == (void *)v10)
        {

LABEL_10:
          objc_msgSend(v3, "removeObject:", v9);
          goto LABEL_11;
        }
        v11 = (void *)v10;
        v12 = objc_msgSend(v9, "handlerType");

        if (v12 == (id)4)
          goto LABEL_10;
LABEL_11:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionOrderStorage orderCollections:](self->_orderStorage, "orderCollections:", v3));
  return (NSArray *)v13;
}

- (id)collectionForFavoritesType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return (id)objc_claimAutoreleasedReturnValue(-[CollectionManager allPlacesCollection](self, "allPlacesCollection", v3, v4));
  else
    return 0;
}

- (id)collectionWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = self->_currentContents;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)addObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (id)collectionsContainingMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager currentCollections](self, "currentCollections", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (!objc_msgSend(v11, "handlerType") && objc_msgSend(v11, "containsItem:", v4))
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = objc_msgSend(v5, "copy");
  }
  else
  {
    v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)firstUserGuideContainingMapItem:(id)a3 requiresOrdering:(BOOL)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  if (v6)
  {
    if (a4)
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[CollectionManager currentCollections](self, "currentCollections"));
    else
      v7 = self->_currentContents;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (!objc_msgSend(v12, "handlerType", (_QWORD)v14)
            && (objc_msgSend(v12, "containsItem:", v6) & 1) != 0)
          {
            v9 = v12;
            goto LABEL_16;
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)collectionsNotContainingMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager currentCollections](self, "currentCollections", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v11, "handlerType") && (objc_msgSend(v11, "containsItem:", v4) & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  return v12;
}

- (id)collectionsForAddingMapItems
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager currentCollections](self, "currentCollections", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v9, "handlerType"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return v10;
}

- (id)lookupMapItem:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  LibraryMapItemLookupResult *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_currentContents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v10, "handlerType", (_QWORD)v16))
        {
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeItemMatchingMapItem:", v4));
          if (v11)
          {
            v14 = (void *)v11;
            v13 = -[LibraryMapItemLookupResult initWithPlaceItem:collectionHandler:]([LibraryMapItemLookupResult alloc], "initWithPlaceItem:collectionHandler:", v11, v10);

            goto LABEL_14;
          }
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager allPlacesCollection](self, "allPlacesCollection"));
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeItemMatchingMapItem:", v4));

  if (v5)
    v13 = -[LibraryMapItemLookupResult initWithPlaceItem:collectionHandler:]([LibraryMapItemLookupResult alloc], "initWithPlaceItem:collectionHandler:", v5, 0);
  else
    v13 = 0;
LABEL_14:

  return v13;
}

- (unint64_t)displayCountForCollectionsInLibrary
{
  id v3;
  NSMutableArray *currentContents;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (!-[NSMutableArray count](self->_currentContents, "count"))
    return 0;
  v3 = -[NSMutableArray count](self->_currentContents, "count");
  currentContents = self->_currentContents;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager allPlacesCollection](self, "allPlacesCollection"));
  LODWORD(currentContents) = -[NSMutableArray containsObject:](currentContents, "containsObject:", v5);

  v6 = (unint64_t)v3 - currentContents;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionManager favoriteCollection](self, "favoriteCollection"));
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isEmpty"))
    v6 -= -[NSMutableArray containsObject:](self->_currentContents, "containsObject:", v8);

  return v6;
}

- (id)_asMapsSyncObjectOrNil:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  v3 = a3;
  v4 = objc_opt_class(_TtC8MapsSync14MapsSyncObject);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("collection is nil or is not a MapsSync Collection")));
      v13 = 136315906;
      v14 = "-[CollectionManager _asMapsSyncObjectOrNil:]";
      v15 = 2080;
      v16 = "CollectionManager.m";
      v17 = 1024;
      v18 = 560;
      v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v13, 0x26u);

    }
    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v13 = 138412290;
        v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);

      }
    }
    v5 = 0;
  }

  return v5;
}

- (void)curatedCollectionSyncManagerDidUpdateCachedCollections:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10088F760;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)hasInitialCollections
{
  return self->_hasInitialCollections;
}

- (id)traitsCreationBlock
{
  return self->_traitsCreationBlock;
}

- (void)setTraitsCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)queryContents
{
  return self->_queryContents;
}

- (void)setQueryContents:(id)a3
{
  objc_storeStrong((id *)&self->_queryContents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContents, 0);
  objc_storeStrong(&self->_traitsCreationBlock, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_favoriteCollection, 0);
  objc_storeStrong((id *)&self->_allPlacesCollection, 0);
  objc_storeStrong((id *)&self->_fetchThrottler, 0);
  objc_storeStrong((id *)&self->_updateContentQueue, 0);
  objc_storeStrong((id *)&self->_orderStorage, 0);
  objc_storeStrong((id *)&self->_currentContents, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
