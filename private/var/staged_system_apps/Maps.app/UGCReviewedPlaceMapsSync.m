@implementation UGCReviewedPlaceMapsSync

+ (UGCReviewedPlaceMapsSync)sharedInstance
{
  if (qword_1014D2F40 != -1)
    dispatch_once(&qword_1014D2F40, &stru_1011C0B18);
  return (UGCReviewedPlaceMapsSync *)(id)qword_1014D2F38;
}

- (UGCReviewedPlaceMapsSync)init
{
  UGCReviewedPlaceMapsSync *v2;
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  uint64_t v5;
  _TtC4Maps19CommunityIDMapsSync *communityIDMapsSync;
  void *v7;
  uint64_t v8;
  NSArray *storeSubscriptionTypes;
  void *v10;
  objc_super v12;
  uint64_t v13;

  v12.receiver = self;
  v12.super_class = (Class)UGCReviewedPlaceMapsSync;
  v2 = -[UGCReviewedPlaceMapsSync init](&v12, "init");
  if (v2)
  {
    v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___UGCReviewedPlaceMapsSyncObserver, 0);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[CommunityIDMapsSync shared](_TtC4Maps19CommunityIDMapsSync, "shared"));
    communityIDMapsSync = v2->_communityIDMapsSync;
    v2->_communityIDMapsSync = (_TtC4Maps19CommunityIDMapsSync *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v7, "subscribe:", v2);

    v13 = objc_opt_class(MSReviewedPlace);
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "_usingOfflineMapsDidChange:", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  }
  return v2;
}

- (void)_usingOfflineMapsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006E8498;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCReviewedPlaceMapsSync observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCReviewedPlaceMapsSync observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4
{
  -[UGCReviewedPlaceMapsSync fetchReviewedPlaceForMUID:muidHistory:completion:](self, "fetchReviewedPlaceForMUID:muidHistory:completion:", a3, &__NSArray0__struct, a4);
}

- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 muidHistory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3 && v9)
  {
    v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    objc_msgSend(v11, "addObject:", v12);

    objc_msgSend(v11, "addObjectsFromArray:", v8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1006E8690;
    v14[3] = &unk_1011C0B40;
    v14[4] = self;
    v15 = v11;
    v16 = v10;
    v17 = a3;
    v13 = v11;
    -[UGCReviewedPlaceMapsSync _dispatchToWorkQueueWithCompletion:](self, "_dispatchToWorkQueueWithCompletion:", v14);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0) && muid != 0", buf, 2u);
  }

}

- (id)_fetchMSReviewedPlaceWithMuids:(id)a3 error:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync13MapsSyncRange), "initWithOffset:limit:", 0, 1);
  v15 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("muid IN %@"), v6));

  v8 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v7, 0, v5);
  v9 = objc_alloc_init((Class)MSReviewedPlaceRequest);
  v14 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fetchSyncWithOptions:error:", v8, &v14));
  v11 = v14;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  if (v11)
    NSLog(CFSTR("%@"), v11);

  return v12;
}

- (void)fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1006E8DDC;
  v9[4] = sub_1006E8DEC;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)MSReviewedPlaceRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1006E8DF4;
  v6[3] = &unk_1011B93C8;
  v8 = v9;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "fetchWithCompletionHandler:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)removeReviewedPlaceWithMUID:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;
  uint8_t buf[16];

  v6 = a4;
  v7 = v6;
  if (a3 && v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1006E8F50;
    v8[3] = &unk_1011B2188;
    v8[4] = self;
    v10 = a3;
    v9 = v6;
    -[UGCReviewedPlaceMapsSync _dispatchToWorkQueueWithCompletion:](self, "_dispatchToWorkQueueWithCompletion:", v8);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0) && muid != 0", buf, 2u);
  }

}

- (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  UGCReviewedPlaceMapsSync *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006E93A8;
  v11[3] = &unk_1011B4320;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "communityIdentifier"));
  v13 = self;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v12;
  -[UGCReviewedPlaceMapsSync _dispatchToWorkQueueWithCompletion:](self, "_dispatchToWorkQueueWithCompletion:", v11);

}

- (void)_buildMapsSyncReviewedPlace:(id)a3 communityID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "muid")));
  v33 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
  v14 = (id)objc_claimAutoreleasedReturnValue(-[UGCReviewedPlaceMapsSync _fetchMSReviewedPlaceWithMuids:error:](self, "_fetchMSReviewedPlaceWithMuids:error:", v13, 0));

  v15 = sub_1004331EC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412546;
      v30 = v8;
      v31 = 2048;
      v32 = objc_msgSend(v8, "muid");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "We found a synced reviewed place %@ with muid %llu", buf, 0x16u);
    }
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "We cannot find a synced reviewed place, so adding one", buf, 2u);
    }

    v14 = objc_alloc_init((Class)MSReviewedPlace);
    v16 = objc_alloc_init((Class)MSAnonymousCredential);
    objc_msgSend(v14, "setAnonymousCredential:", v16);
    objc_msgSend(v11, "addObject:", v16);
  }

  objc_msgSend(v14, "setMuid:", objc_msgSend(v8, "muid"));
  objc_msgSend(v14, "setHasUserReviewed:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "recommendState")));
  objc_msgSend(v14, "setRating:", v18);

  objc_msgSend(v14, "setUploadedPhotosCount:", objc_msgSend(v8, "numberOfPhotosAdded"));
  objc_msgSend(v14, "setVersion:", (__int16)objc_msgSend(v8, "version"));
  v19 = objc_msgSend(objc_alloc((Class)GEOMapItemIdentifier), "initWithMUID:resultProviderID:coordinate:", objc_msgSend(v8, "muid"), 0, -180.0, -180.0);
  objc_msgSend(v14, "setMuid:", objc_msgSend(v19, "muid"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v19, "resultProviderID")));
  objc_msgSend(v14, "setResultProviderIdentifier:", v20);

  objc_msgSend(v19, "coordinate");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v14, "setLatitude:", v21);

  objc_msgSend(v19, "coordinate");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22));
  objc_msgSend(v14, "setLongitude:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "comparableRepresentation"));
  objc_msgSend(v14, "setMapItemIdComparableRepresentation:", v24);

  objc_msgSend(v14, "setCommunityID:", v9);
  if (v14)
    objc_msgSend(v11, "addObject:", v14);
  if (v9)
    objc_msgSend(v11, "addObject:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1006E99DC;
  v27[3] = &unk_1011AE218;
  v28 = v10;
  v26 = v10;
  objc_msgSend(v25, "saveWithObjects:completionHandler:", v11, v27);

}

- (void)_dispatchToWorkQueueWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (qword_1014D2F50 != -1)
    dispatch_once(&qword_1014D2F50, &stru_1011C0B88);
  v4 = qword_1014D2F48;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006E9BEC;
  block[3] = &unk_1011ADA00;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (void)clearAllUserData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("createTime < &@"), v3));

  v5 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
  v6 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("modificationTime"), 0);
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8 = objc_msgSend(v5, "initWithPredicate:sortDescriptors:range:", v4, v7, 0);

  v9 = objc_alloc_init((Class)MSReviewedPlaceRequest);
  objc_msgSend(v9, "fetchWithOptions:completionHandler:", v8, &stru_1011C0BA8);

}

- (void)storeDidChangeWithTypes:(id)a3
{
  -[GEOObserverHashTable reviewedPlaceObjectsDidChange](self->_observers, "reviewedPlaceObjectsDidChange", a3);
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_communityIDMapsSync, 0);
}

@end
