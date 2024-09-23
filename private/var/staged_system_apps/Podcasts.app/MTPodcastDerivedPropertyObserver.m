@implementation MTPodcastDerivedPropertyObserver

- (void)startObserving
{
  void *v2;
  MTPodcastDerivedPropertyObserver *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[MTPodcastDerivedPropertyObserver isObserving](obj, "isObserving"))
  {
    objc_sync_exit(obj);

  }
  else
  {
    -[MTPodcastDerivedPropertyObserver setIsObserving:](obj, "setIsObserving:", 1);
    objc_sync_exit(obj);

    -[MTPodcastDerivedPropertyObserver _fetchLatestProcessedPersistentHistoryToken](obj, "_fetchLatestProcessedPersistentHistoryToken");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    objc_msgSend(v2, "addChangeNotifier:", obj);

    -[MTPodcastDerivedPropertyObserver processLatestPersistentHistoryTransactions](obj, "processLatestPersistentHistoryTransactions");
  }
}

- (MTPodcastDerivedPropertyObserver)init
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  dispatch_queue_t v20;
  void *v21;
  id v22;
  void *v23;
  dispatch_source_t v24;
  void *v25;
  NSObject *v26;
  _QWORD handler[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)MTPodcastDerivedPropertyObserver;
  v2 = -[MTPodcastDerivedPropertyObserver init](&v31, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v3;

    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v5;

    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", kEpisodeUuid, kEpisodeExternalType, kEpisodeTitle, kEpisodeLevel, kEpisodeShowTypeSpecificLevel, kEpisodePubDate, kEpisodeEpisodeNumber, kEpisodePlayState, kEpisodePlayStateManuallySet, kEpisodePodcastUuid, kEpisodeIsFromiTunesSync, kEpisodeListenNowEpisode, kEpisodeUnplayedTab, kEpisodeUserEpisode, kEpisodeIsNew, kEpisodePlayStateLastModifiedDate,
             kEpisodeMetadataTimestamp,
             kEpisodeLastDatePlayed,
             kEpisodePriceType,
             kEpisodeIsBookmarked,
             kEpisodeAssetURL,
             0));
    v10 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v9;

    v11 = kPodcastSubscribed;
    v12 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", kPodcastSubscribed, kPodcastDeletePlayedEpisodes, kPodcastEpisodeLimit, kPodcastHidden, kPodcastChannelStoreId, kPodcastLastRemovedFromUpNextDate, 0));
    v13 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", kChannelSubscriptionActive, 0));
    v15 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, kPodcastFlags, kPodcastDarkCountLocal, kPodcastLastTouchDate, kPodcastNotifications, 0));
    v17 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v16;

    v18 = dispatch_queue_create("com.apple.podcasts.MTPodcastDerivedPropertyObserver.handlerQueue", 0);
    v19 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v18;

    v20 = dispatch_queue_create("com.apple.podcasts.MTPodcastDerivedPropertyObserver.notificationQueue", 0);
    v21 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v20;

    v22 = objc_alloc_init((Class)MTEpisodeLevelCalculator);
    v23 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v22;

    objc_initWeak(&location, v2);
    v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, *((dispatch_queue_t *)v2 + 2));
    v25 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v24;

    v26 = *((_QWORD *)v2 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002CA40;
    handler[3] = &unk_1004A7570;
    objc_copyWeak(&v29, &location);
    dispatch_source_set_event_handler(v26, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 3));
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return (MTPodcastDerivedPropertyObserver *)v2;
}

- (void)_setLastProcessedPersistentHistoryToken:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_handlerQueue);
  if (v4)
  {
    v29 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v29));
    v8 = v29;
    v10 = v8;
    if (v7)
      v11 = v8 == 0;
    else
      v11 = 0;
    if (v11)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v16, "setObject:forKey:", v7, CFSTR("DerivedPropertyObserverPersistentHistoryToken"));

      v19 = _MTLogCategoryDatabase(v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v4;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Derived Property Observer set last processed persistent history token %@.", buf, 0xCu);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -1209600.0));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeDate:", v21));

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "privateQueueContext"));

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10002234C;
      v26[3] = &unk_1004A6640;
      v27 = v24;
      v28 = v22;
      v25 = v22;
      v13 = v24;
      -[NSObject performBlock:](v13, "performBlock:", v26);

    }
    else
    {
      v12 = _MTLogCategoryDatabase(v8, v9);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Derived Property Observer encountered error archiving last persistent history token %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v14 = _MTLogCategoryDatabase(v5, v6);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Derived Property Observer set last processed persistent history token to nil. Removing default.", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("DerivedPropertyObserverPersistentHistoryToken"));
  }

}

- (void)_processLatestPersistentHistoryTransactions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  MTBackgroundTaskManager *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *handlerQueue;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  uint8_t *v42;
  _QWORD v43[4];
  id v44;
  MTPodcastDerivedPropertyObserver *v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD block[4];
  MTBackgroundTaskManager *v62;
  uint8_t v63[4];
  id v64;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (self->_processingIsPaused)
  {
    v5 = _MTLogCategoryDatabase(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MTPodcastDerivedPropertyObserver processing is paused. Skipping processLatestPersistentHistoryTransactions.", buf, 2u);
    }
  }
  else
  {
    kdebug_trace(723517920, 0, 0, 0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043698;
    block[3] = &unk_1004A6200;
    v7 = objc_alloc_init(MTBackgroundTaskManager);
    v62 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    kdebug_trace(723517928, 0, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver _historyTransactionsSinceLatestPersistentHistoryToken](self, "_historyTransactionsSinceLatestPersistentHistoryToken"));
    kdebug_trace(723517932, 0, 0, 0, 0);
    *(_QWORD *)buf = 0;
    v56 = buf;
    v57 = 0x3032000000;
    v58 = sub_1000467CC;
    v59 = sub_100046A5C;
    v60 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    kdebug_trace(723517936, 0, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateQueueContext"));

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000E042C;
    v43[3] = &unk_1004AA4C0;
    v13 = v8;
    v49 = &v51;
    v44 = v13;
    v45 = self;
    v14 = v10;
    v46 = v14;
    v15 = v9;
    v47 = v15;
    v16 = v12;
    v48 = v16;
    v50 = buf;
    objc_msgSend(v16, "performBlockAndWait:", v43);
    kdebug_trace(723517940, 0, 0, 0, 0);
    if (!v13)
    {
      v17 = kdebug_trace(723517944, 0, 0, 0, 0);
      v19 = _MTLogCategoryDatabase(v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v63 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Derived Property Observer has never processed persistent history data. Will recalculate everything.", v63, 2u);
      }

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000E0CA8;
      v38[3] = &unk_1004A6D10;
      v39 = v16;
      v40 = v15;
      v41 = v14;
      v42 = buf;
      objc_msgSend(v39, "performBlockAndWait:", v38);
      *((_BYTE *)v52 + 24) = 1;
      kdebug_trace(723517948, 0, 0, 0, 0);

    }
    objc_initWeak(&location, self);
    v21 = objc_msgSend(v15, "count");
    if (v21)
    {
      v23 = _MTLogCategoryDatabase(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v63 = 138543362;
        v64 = v15;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Derived Property Observer did find changes for %{public}@", v63, 0xCu);
      }

      -[MTPodcastDerivedPropertyObserver _updateDerivedPropertiesForPodcastUUIDs:](self, "_updateDerivedPropertiesForPodcastUUIDs:", v15);
    }
    if (objc_msgSend(v14, "count"))
    {
      handlerQueue = self->_handlerQueue;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000E1004;
      v34[3] = &unk_1004A7E80;
      objc_copyWeak(&v36, &location);
      v35 = v14;
      dispatch_async(handlerQueue, v34);

      objc_destroyWeak(&v36);
    }
    if (*((_BYTE *)v52 + 24))
    {
      v26 = self->_handlerQueue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000E1158;
      v32[3] = &unk_1004A7570;
      objc_copyWeak(&v33, &location);
      dispatch_async(v26, v32);
      objc_destroyWeak(&v33);
    }
    if (*((_QWORD *)v56 + 5))
    {
      v27 = self->_handlerQueue;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000E11D4;
      v30[3] = &unk_1004A8890;
      objc_copyWeak(&v31, &location);
      v30[4] = buf;
      dispatch_async(v27, v30);
      -[MTPodcastDerivedPropertyObserver setLatestPersistentHistoryToken:](self, "setLatestPersistentHistoryToken:", *((_QWORD *)v56 + 5));
      objc_destroyWeak(&v31);
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000E1218;
    v28[3] = &unk_1004A6200;
    v6 = v7;
    v29 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v28);

    kdebug_trace(723517924, 0, 0, 0, 0);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(buf, 8);

  }
}

- (id)_historyTransactionsSinceLatestPersistentHistoryToken
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSPersistentHistoryToken *latestPersistentHistoryToken;
  void *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(_QWORD *);
  void *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  uint64_t v42;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (!self->_latestPersistentHistoryToken)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "privateQueueContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterToken:", self->_latestPersistentHistoryToken));
  objc_msgSend(v5, "setResultType:", 5);
  objc_msgSend(v5, "setFetchBatchSize:", 200);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1000467CC;
  v39 = sub_100046A5C;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1000467CC;
  v33 = sub_100046A5C;
  v34 = 0;
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10002245C;
  v24 = &unk_1004A9740;
  v27 = &v29;
  v6 = v4;
  v25 = v6;
  v7 = v5;
  v26 = v7;
  v28 = &v35;
  v8 = objc_msgSend(v6, "performBlockAndWait:", &v21);
  if (v36[5])
  {
    v10 = _MTLogCategoryDatabase(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v36[5];
      *(_DWORD *)buf = 138412290;
      v42 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Derived Property Observer encountered error trying to fetch store result %@", buf, 0xCu);
    }

    v15 = _MTLogCategoryDatabase(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Derived Property Observer clearing out persistent history token and performing a full persistent history run", buf, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v21, v22, v23, v24, v25));
    objc_msgSend(v17, "removeObjectForKey:", CFSTR("DerivedPropertyObserverPersistentHistoryToken"));

    latestPersistentHistoryToken = self->_latestPersistentHistoryToken;
    self->_latestPersistentHistoryToken = 0;

    v19 = 0;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30[5], "result", v21, v22, v23, v24, v25));
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

- (void)setLatestPersistentHistoryToken:(id)a3
{
  objc_storeStrong((id *)&self->_latestPersistentHistoryToken, a3);
}

- (BOOL)_shouldUpdatePodcastsStatsForChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSSet *podcastStatsProperties;
  void *v21;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "changedObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  v7 = objc_msgSend(v6, "isEqualToString:", kMTEpisodeEntityName);
  v8 = objc_msgSend(v6, "isEqualToString:", kMTPodcastEntityName);
  v9 = v8;
  if ((v7 & 1) != 0 || v8)
  {
    if (((unint64_t)objc_msgSend(v3, "changeType") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updatedProperties"));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v12)
      {
        v13 = v12;
        v23 = v6;
        v24 = v3;
        v14 = *(_QWORD *)v27;
        v15 = kEpisodeIsFromiTunesSync;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            if (!v7
              || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1)
                                                                                     + 8 * (_QWORD)i), "name")),
                  v19 = objc_msgSend(v18, "isEqualToString:", v15),
                  v18,
                  (v19 & 1) == 0))
            {
              if (!v9)
                continue;
              podcastStatsProperties = self->_podcastStatsProperties;
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
              LOBYTE(podcastStatsProperties) = -[NSSet containsObject:](podcastStatsProperties, "containsObject:", v21);

              if ((podcastStatsProperties & 1) == 0)
                continue;
            }
            v10 = 1;
            goto LABEL_18;
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v13)
            continue;
          break;
        }
        v10 = 0;
LABEL_18:
        v6 = v23;
        v3 = v24;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_changeContainsRelevantPodcastChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  NSSet *podcastPropertiesToFetch;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "changedObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  if (objc_msgSend(v7, "isEqualToString:", kMTPodcastEntityName))
  {
    v8 = objc_msgSend(v4, "changeType");
    if (!v8)
    {
LABEL_15:
      v16 = 1;
      goto LABEL_16;
    }
    if (v8 == (id)1)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedProperties", 0));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            podcastPropertiesToFetch = self->_podcastPropertiesToFetch;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "name"));
            LOBYTE(podcastPropertiesToFetch) = -[NSSet containsObject:](podcastPropertiesToFetch, "containsObject:", v15);

            if ((podcastPropertiesToFetch & 1) != 0)
            {

              goto LABEL_15;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  NSSet *episodePropertiesToFetch;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "changedObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  if (objc_msgSend(v7, "isEqualToString:", kMTEpisodeEntityName))
  {
    v8 = objc_msgSend(v4, "changeType");
    if (!v8)
    {
LABEL_15:
      v16 = 1;
      goto LABEL_16;
    }
    if (v8 == (id)1)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedProperties", 0));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            episodePropertiesToFetch = self->_episodePropertiesToFetch;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "name"));
            LOBYTE(episodePropertiesToFetch) = -[NSSet containsObject:](episodePropertiesToFetch, "containsObject:", v15);

            if ((episodePropertiesToFetch & 1) != 0)
            {

              goto LABEL_15;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)_changeContainsRelevantChannelChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  NSSet *channelPropertiesToFetch;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "changedObjectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  if (!objc_msgSend(v7, "isEqualToString:", kMTChannelEntityName))
    goto LABEL_13;
  v8 = (unint64_t)objc_msgSend(v4, "changeType");
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v16 = 1;
    goto LABEL_17;
  }
  if (v8 == 1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedProperties", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          channelPropertiesToFetch = self->_channelPropertiesToFetch;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "name"));
          LOBYTE(channelPropertiesToFetch) = -[NSSet containsObject:](channelPropertiesToFetch, "containsObject:", v15);

          if ((channelPropertiesToFetch & 1) != 0)
          {
            v16 = 1;
            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_16:

  }
  else
  {
LABEL_13:
    v16 = 0;
  }
LABEL_17:

  return v16;
}

- (void)processLatestPersistentHistoryTransactions
{
  dispatch_source_merge_data((dispatch_source_t)self->_persistentHistorySource, 1uLL);
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)_fetchLatestProcessedPersistentHistoryToken
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011CA4;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

+ (id)sharedInstance
{
  if (qword_1005674E0 != -1)
    dispatch_once(&qword_1005674E0, &stru_1004AA498);
  return (id)qword_1005674D8;
}

- (void)stopObserving
{
  MTPodcastDerivedPropertyObserver *v2;
  MTPodcastDerivedPropertyObserver *v3;
  MTPodcastDerivedPropertyObserver *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[MTPodcastDerivedPropertyObserver isObserving](obj, "isObserving"))
  {
    -[MTPodcastDerivedPropertyObserver setIsObserving:](obj, "setIsObserving:", 0);
    objc_sync_exit(obj);

    v2 = (MTPodcastDerivedPropertyObserver *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    -[MTPodcastDerivedPropertyObserver removeChangeNotifier:](v2, "removeChangeNotifier:", obj);
    v3 = v2;
  }
  else
  {
    objc_sync_exit(obj);
    v3 = obj;
  }

}

- (void)pauseProcessing
{
  NSObject *notificationQueue;
  _QWORD block[5];

  kdebug_trace(723517668, 0, 0, 0, 0);
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E003C;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)resumeProcessing
{
  NSObject *notificationQueue;
  _QWORD block[5];

  kdebug_trace(723517664, 0, 0, 0, 0);
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E0138;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)_updateDerivedPropertiesForPodcastUUIDs:(id)a3
{
  id v4;
  MTBackgroundTaskManager *v5;
  NSObject *handlerQueue;
  MTBackgroundTaskManager *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MTPodcastDerivedPropertyObserver *v11;
  MTBackgroundTaskManager *v12;
  _QWORD block[4];
  MTBackgroundTaskManager *v14;

  v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E02B8;
  block[3] = &unk_1004A6200;
  v5 = objc_alloc_init(MTBackgroundTaskManager);
  v14 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  handlerQueue = self->_handlerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E02C8;
  v9[3] = &unk_1004A7398;
  v10 = v4;
  v11 = self;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(handlerQueue, v9);

}

- (void)reportStatsForPodcasts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  MTPodcastDerivedPropertyObserver *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[9];
  _QWORD v49[9];

  kdebug_trace(723517952, 0, 0, 0, 0);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "privateQueueContext"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E1640;
  v15[3] = &unk_1004AA4E8;
  v18 = &v44;
  v5 = v4;
  v16 = v5;
  v17 = self;
  v19 = &v40;
  v20 = &v36;
  v21 = &v32;
  v22 = &v28;
  v23 = &v24;
  objc_msgSend(v5, "performBlockAndWait:", v15);
  v48[0] = CFSTR("total");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v41[3]));
  v49[0] = v6;
  v48[1] = CFSTR("subscribed");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v37[3]));
  v49[1] = v7;
  v48[2] = CFSTR("not_subscribed");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v41[3] - v37[3]));
  v49[2] = v8;
  v48[3] = CFSTR("authenticated_dark");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v33[3]));
  v49[3] = v9;
  v49[4] = &off_1004D5F50;
  v48[4] = CFSTR("feed_dark");
  v48[5] = CFSTR("download_dark");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29[3]));
  v49[5] = v10;
  v48[6] = CFSTR("notifications_enabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25[3]));
  v49[6] = v11;
  v48[7] = CFSTR("notifications_disabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v41[3] - v25[3]));
  v49[7] = v12;
  v48[8] = CFSTR("episodes_from_itunes");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v45[3]));
  v49[8] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 9));
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("podcast_stats"), 0, v14);

  kdebug_trace(723517956, 0, 0, 0, 0);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

- (void)_updateEpisodeCountsForPodcastUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  MTPodcastDerivedPropertyObserver *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  kdebug_trace(723517960, 0, 0, 0, 0);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000467CC;
  v25 = sub_100046A5C;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000467CC;
  v19 = sub_100046A5C;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "privateQueueContext"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E1A48;
  v9[3] = &unk_1004AA510;
  v7 = v4;
  v10 = v7;
  v8 = v6;
  v13 = &v21;
  v14 = &v15;
  v11 = v8;
  v12 = self;
  objc_msgSend(v8, "performBlockAndWait:", v9);
  LODWORD(v5) = -[MTPodcastDerivedPropertyObserver setDerivedPropertyValue:forKey:forPodcast:](self, "setDerivedPropertyValue:forKey:forPodcast:", v22[5], CFSTR("kCountOfNewEpisodesKey"), v7);
  if ((-[MTPodcastDerivedPropertyObserver setDerivedPropertyValue:forKey:forPodcast:](self, "setDerivedPropertyValue:forKey:forPodcast:", v16[5], CFSTR("kCountOfUnplayedEpisodesKey"), v7) | v5) == 1)-[MTPodcastDerivedPropertyObserver notifyObserversForPodcast:](self, "notifyObserversForPodcast:", v7);
  kdebug_trace(723517964, 0, 0, 0, 0);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

}

- (void)episodeResultsChangedForPodcastUuid:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MTPodcastDerivedPropertyObserver _updateEpisodeCountsForPodcastUuid:](self, "_updateEpisodeCountsForPodcastUuid:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver didFinishProcessingContextSaveHandlerForTests](self, "didFinishProcessingContextSaveHandlerForTests"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver derivedPropertiesForPodcast:](self, "derivedPropertiesForPodcast:", v7));
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver didFinishProcessingContextSaveHandlerForTests](self, "didFinishProcessingContextSaveHandlerForTests"));
    ((void (**)(_QWORD, void *))v6)[2](v6, v5);

  }
}

- (void)updateFlagsForPodcastUuid:(id)a3 predicateForUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  MTPodcastDerivedPropertyObserver *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  MTPodcastDerivedPropertyObserver *v45;
  id v46;
  id v47;
  id v48;
  id location;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;

  v8 = a3;
  v32 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "privateQueueContext"));

  kdebug_trace(723517984, 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v8));
  objc_msgSend(v12, "setPredicate:", v13);

  objc_msgSend(v12, "setFetchLimit:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeFetchRequest:error:", v12, 0));
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPlayed:](MTEpisode, "predicateForPlayed:", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "AND:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver _predicateForEpisodesToUpdateWithPodcastUuid:predicateForUnplayedInUnplayedTab:predicateForUserEpisodes:](self, "_predicateForEpisodesToUpdateWithPodcastUuid:predicateForUnplayedInUnplayedTab:predicateForUserEpisodes:", v8, v17, v9));
    kdebug_trace(723517992, 0, 0, 0, 0);
    objc_initWeak(&location, self);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000E21E0;
    v41[3] = &unk_1004AA538;
    v31 = &v48;
    objc_copyWeak(&v48, &location);
    v19 = v11;
    v42 = v19;
    v30 = v18;
    v43 = v30;
    v29 = v17;
    v44 = v29;
    v45 = self;
    v46 = v9;
    v20 = v8;
    v47 = v20;
    objc_msgSend(v19, "performBlockAndWait:", v41);
    kdebug_trace(723517996, 0, 0, 0, 0);
    kdebug_trace(723518016, 0, 0, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:](MTRecencyUtil, "upNextForPodcastUuid:excludeExplicit:ctx:", v20, 0, v19));
    v22 = kdebug_trace(723518020, 0, 0, 0, 0);
    v23 = _MTLogCategoryDefault(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "episodeUuid", v29, v30, &v48));
      objc_msgSend(v21, "modifiedDate");
      *(_DWORD *)buf = 138543874;
      v51 = v20;
      v52 = 2114;
      v53 = v25;
      v54 = 2050;
      v55 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "UpNext result from property changed observer for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", buf, 0x20u);

    }
    if (!-[MTPodcastDerivedPropertyObserver _shouldSkipSettingPropertiesForWatchPPT](self, "_shouldSkipSettingPropertiesForWatchPPT"))
    {
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000E2780;
      v36[3] = &unk_1004A6C78;
      v37 = v20;
      v38 = v21;
      v39 = v19;
      v40 = self;
      objc_msgSend(v39, "performBlockAndWait:", v36);

    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000E2824;
    v33[3] = &unk_1004A6640;
    v34 = v19;
    v35 = v20;
    objc_msgSend(v34, "performBlockAndWait:", v33);
    kdebug_trace(723517988, 0, 0, 0, 0);

    objc_destroyWeak(v31);
    objc_destroyWeak(&location);

  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "podcastForUuid:", v8));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "nextEpisodeUuid"));

    if (v28)
    {
      objc_msgSend(v27, "setNextEpisodeUuid:", 0);
      objc_msgSend(v11, "saveInCurrentBlock");
    }
    kdebug_trace(723517988, 0, 0, 0, 0);

  }
}

- (id)_predicateForEpisodesToUpdateWithPodcastUuid:(id)a3 predicateForUnplayedInUnplayedTab:(id)a4 predicateForUserEpisodes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForUnplayedTabFlag:](MTEpisode, "predicateForUnplayedTabFlag:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateForNilValueForKey:](NSPredicate, "predicateForNilValueForKey:", kEpisodeUnplayedTab));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "OR:", v12));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "AND:", v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForUnplayedTabFlag:](MTEpisode, "predicateForUnplayedTabFlag:", 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "AND:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "OR:", v16));
  objc_msgSend(v10, "addObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForUserEpisode:](MTEpisode, "predicateForUserEpisode:", 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateForNilValueForKey:](NSPredicate, "predicateForNilValueForKey:", kEpisodeUserEpisode));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "OR:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", v7));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForUserEpisode:](MTEpisode, "predicateForUserEpisode:", 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "AND:", v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "OR:", v24));
  objc_msgSend(v10, "addObject:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v9));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v10));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "AND:", v27));

  return v28;
}

- (id)derivedPropertiesForPodcast:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_cache;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v4));
  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v6, v4);
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)derivedPropertyValueForKey:(id)a3 forPodcast:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver derivedPropertiesForPodcast:](self, "derivedPropertiesForPodcast:", v7));
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));
    objc_sync_exit(v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)setDerivedPropertyValue:(id)a3 forKey:(id)a4 forPodcast:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  char v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "length"))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver derivedPropertiesForPodcast:](self, "derivedPropertiesForPodcast:", v10));
    objc_sync_enter(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
    v13 = objc_msgSend(v12, "isEqual:", v8);
    if (v8)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v9);
    else
      objc_msgSend(v11, "removeObjectForKey:", v9);
    v14 = v13 ^ 1;

    objc_sync_exit(v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dependentPropertyForKey:(id)a3 forPodcastUuid:(id)a4
{
  NSMutableDictionary *podcastCache;
  id v6;
  void *v7;
  void *v8;

  podcastCache = self->_podcastCache;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](podcastCache, "objectForKeyedSubscript:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  return v8;
}

- (void)setDependentPropertyValue:(id)a3 forKey:(id)a4 forPodcastUuid:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSMutableDictionary *podcastCache;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_podcastCache, "objectForKeyedSubscript:", v9));
  if (!v10)
  {
    podcastCache = self->_podcastCache;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](podcastCache, "setObject:forKeyedSubscript:", v10, v9);
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v8);

}

- (void)notifyObserversForPodcast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver derivedPropertiesForPodcast:](self, "derivedPropertiesForPodcast:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver handlers](self, "handlers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E30E8;
  v9[3] = &unk_1004A9800;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (NSMutableDictionary)handlers
{
  NSMutableDictionary *v3;
  id v4;

  v3 = self->_handlers;
  objc_sync_enter(v3);
  v4 = -[NSMutableDictionary copy](self->_handlers, "copy");
  objc_sync_exit(v3);

  return (NSMutableDictionary *)v4;
}

- (BOOL)_shouldSkipSettingPropertiesForWatchPPT
{
  return 0;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (NSMutableDictionary)podcastCache
{
  return self->_podcastCache;
}

- (void)setPodcastCache:(id)a3
{
  objc_storeStrong((id *)&self->_podcastCache, a3);
}

- (NSSet)episodePropertiesToFetch
{
  return self->_episodePropertiesToFetch;
}

- (void)setEpisodePropertiesToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_episodePropertiesToFetch, a3);
}

- (NSSet)podcastPropertiesToFetch
{
  return self->_podcastPropertiesToFetch;
}

- (void)setPodcastPropertiesToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_podcastPropertiesToFetch, a3);
}

- (NSSet)channelPropertiesToFetch
{
  return self->_channelPropertiesToFetch;
}

- (void)setChannelPropertiesToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_channelPropertiesToFetch, a3);
}

- (NSSet)podcastStatsProperties
{
  return self->_podcastStatsProperties;
}

- (void)setPodcastStatsProperties:(id)a3
{
  objc_storeStrong((id *)&self->_podcastStatsProperties, a3);
}

- (NSPersistentHistoryToken)latestPersistentHistoryToken
{
  return self->_latestPersistentHistoryToken;
}

- (MTEpisodeLevelCalculatorProtocol)episodeLevelCalculator
{
  return self->_episodeLevelCalculator;
}

- (id)didFinishProcessingContextSaveHandlerForTests
{
  return self->_didFinishProcessingContextSaveHandlerForTests;
}

- (void)setDidFinishProcessingContextSaveHandlerForTests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishProcessingContextSaveHandlerForTests, 0);
  objc_storeStrong((id *)&self->_episodeLevelCalculator, 0);
  objc_storeStrong((id *)&self->_latestPersistentHistoryToken, 0);
  objc_storeStrong((id *)&self->_podcastStatsProperties, 0);
  objc_storeStrong((id *)&self->_channelPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_podcastPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_episodePropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_podcastCache, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_persistentHistorySource, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

- (id)addDerivedPropertyChangeHandler:(id)a3
{
  id v4;
  const __CFUUID *v5;
  __CFString *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *handlers;
  id v9;

  v4 = a3;
  v5 = CFUUIDCreate(0);
  v6 = (__CFString *)CFUUIDCreateString(0, v5);
  CFRelease(v5);
  v7 = self->_handlers;
  objc_sync_enter(v7);
  handlers = self->_handlers;
  v9 = objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](handlers, "setObject:forKey:", v9, v6);

  objc_sync_exit(v7);
  return v6;
}

- (void)removeDerivedPropertyChangeHandler:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v4 = self->_handlers;
    objc_sync_enter(v4);
    -[NSMutableDictionary removeObjectForKey:](self->_handlers, "removeObjectForKey:", v5);
    objc_sync_exit(v4);

  }
}

- (unint64_t)countOfNewEpisodesForPodcast:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver derivedPropertyValueForKey:forPodcast:](self, "derivedPropertyValueForKey:forPodcast:", CFSTR("kCountOfNewEpisodesKey"), a3));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

- (unint64_t)countOfUnplayedEpisodesForPodcast:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDerivedPropertyObserver derivedPropertyValueForKey:forPodcast:](self, "derivedPropertyValueForKey:forPodcast:", CFSTR("kCountOfUnplayedEpisodesKey"), a3));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

@end
