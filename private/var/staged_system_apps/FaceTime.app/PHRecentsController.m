@implementation PHRecentsController

- (void)populateMessageCacheForMessages:(id)a3 recentCalls:(id)a4
{
  NSObject *v4;

  v4 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue", a3, a4));
  dispatch_assert_queue_V2(v4);

}

- (void)markRecentCallsAsRead
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Mark recent calls as read", buf, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015414;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (id)fetchNumberFormatter
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v2);

  return objc_alloc_init((Class)NSNumberFormatter);
}

- (id)fetchContactFormatter
{
  NSObject *v2;
  id v3;

  v2 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v2);

  v3 = objc_alloc_init((Class)CNContactFormatter);
  objc_msgSend(v3, "setStyle:", 0);
  return v3;
}

- (void)populateMessageCache
{
  NSObject *v3;
  id v4;

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  objc_msgSend(v4, "phoneRecentsEnabled");

}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  os_unfair_lock_s *p_accessorLock;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  p_accessorLock = &self->_accessorLock;
  v7 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController delegateToQueue](self, "delegateToQueue"));
  if (v10)
    v9 = v10;
  else
    v9 = &_dispatch_main_q;
  objc_msgSend(v8, "setObject:forKey:", v9, v7);

  os_unfair_lock_unlock(p_accessorLock);
}

- (CNContactStore)contactStore
{
  os_unfair_lock_s *p_accessorLock;
  CNContactStore *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_contactStore;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)handleUIApplicationDidBecomeActiveNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  PHRecentsController *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015370;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleTUCallHistoryControllerRecentCallsDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  PHRecentsController *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  v8 = sub_10000E6C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v10)
    {
      v11 = (void *)objc_opt_class(self);
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      *(_DWORD *)buf = 138412802;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);

    }
    v9 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015334;
    block[3] = &unk_1000898B8;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring calls change notification from different callHistoryController", buf, 2u);
  }

}

- (void)fetchContactsForRecentCalls:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactHandlesForRecentCalls:](self, "contactHandlesForRecentCalls:", v4));
  v7 = sub_10000E6C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218240;
    v10 = objc_msgSend(v4, "count");
    v11 = 2048;
    v12 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu calls using %lu handles", (uint8_t *)&v9, 0x16u);
  }

  -[PHRecentsController fetchContactsForHandles:](self, "fetchContactsForHandles:", v6);
}

- (void)notifyDelegatesRecentsController:(id)a3 didChangeCalls:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController delegateToQueue](self, "delegateToQueue"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "recentsController:didChangeCalls:") & 1) != 0)
        {
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v13));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100015360;
          block[3] = &unk_100089FA8;
          block[4] = v13;
          v16 = v6;
          v17 = v7;
          dispatch_async(v14, block);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)updateRecentCalls
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController fetchRecentCalls](self, "fetchRecentCalls"));
  -[PHRecentsController setRecentCalls:](self, "setRecentCalls:", v3);

}

- (void)setRecentCalls:(id)a3
{
  NSArray *recentCalls;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  v7 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  recentCalls = self->_recentCalls;
  if (recentCalls != v7 && !-[NSArray isEqualToArray:](recentCalls, "isEqualToArray:", v7))
  {
    v5 = (NSArray *)-[NSArray copy](v7, "copy");
    v6 = self->_recentCalls;
    self->_recentCalls = v5;

    -[PHRecentsController notifyDelegatesRecentsController:didChangeCalls:](self, "notifyDelegatesRecentsController:didChangeCalls:", self, self->_recentCalls);
  }
  os_unfair_lock_unlock(&self->_accessorLock);

}

- (void)populateCachesForRecentCalls:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_10000E6C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting contacts for %lu calls", (uint8_t *)&v14, 0xCu);
  }

  -[PHRecentsController fetchContactsForRecentCalls:](self, "fetchContactsForRecentCalls:", v4);
  v8 = sub_10000E6C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v4, "count");
    v14 = 134217984;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting metadata for %lu recent calls.", (uint8_t *)&v14, 0xCu);
  }

  -[PHRecentsController fetchMetadataForRecentCalls:](self, "fetchMetadataForRecentCalls:", v4);
  v11 = sub_10000E6C4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v4, "count");
    v14 = 134217984;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Populating item cache with %lu recent calls", (uint8_t *)&v14, 0xCu);
  }

  -[PHRecentsController populateItemCacheForRecentCalls:](self, "populateItemCacheForRecentCalls:", v4);
}

- (void)fetchMetadataForRecentCalls:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController metadataCache](self, "metadataCache"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUMetadataDestinationID metadataDestinationIDsForCHRecentCalls:](TUMetadataDestinationID, "metadataDestinationIDsForCHRecentCalls:", v4));
    v8 = sub_10000E6C4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v17 = objc_msgSend(v4, "count");
      v18 = 2048;
      v19 = objc_msgSend(v7, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching metadata for %lu recent calls using %lu handles", buf, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
    v11 = objc_msgSend(v10, "phoneRecentsAvatarsEnabled");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController metadataCache](self, "metadataCache"));
    v13 = v12;
    if (v11)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10002E4D4;
      v14[3] = &unk_100089980;
      v14[4] = self;
      v15 = v4;
      objc_msgSend(v13, "updateCacheWithDestinationIDs:completion:", v7, v14);

    }
    else
    {
      objc_msgSend(v12, "updateCacheWithDestinationIDs:", v7);

    }
  }

}

- (TUMetadataCache)metadataCache
{
  os_unfair_lock_s *p_accessorLock;
  TUMetadataCache *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_metadataCache;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (PHRecentsController)initWithCallHistoryController:(id)a3 callProviderManager:(id)a4 contactStore:(id)a5 suggestedContactStore:(id)a6 metadataCache:(id)a7 voicemailController:(id)a8
{
  id v15;
  id v16;
  PHRecentsController *v17;
  PHRecentsController *v18;
  uint64_t v19;
  NSMapTable *delegateToQueue;
  NSString *v21;
  void *v22;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  id v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *serialQueue;
  NSCache *v28;
  NSCache *callProviderCache;
  TUCallProviderManager *callProviderManager;
  void *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *contactCache;
  TUSubtitleProvider *v34;
  TUSubtitleProvider *subtitleProvider;
  TUFeatureFlags *v36;
  TUFeatureFlags *featureFlags;
  NSMutableDictionary *v38;
  NSMutableDictionary *localizedSubtitleCache;
  MPAnalyticsLogger *v40;
  NSObject *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD block[4];
  PHRecentsController *v49;
  objc_super v50;

  v15 = a3;
  v47 = a4;
  v46 = a5;
  v45 = a6;
  v16 = a7;
  v44 = a8;
  v50.receiver = self;
  v50.super_class = (Class)PHRecentsController;
  v17 = -[PHRecentsController init](&v50, "init");
  v18 = v17;
  if (v17)
  {
    v17->_accessorLock._os_unfair_lock_opaque = 0;
    v19 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    delegateToQueue = v18->_delegateToQueue;
    v18->_delegateToQueue = (NSMapTable *)v19;

    v18->_initializationBlockQueued = 1;
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.calls.queue.%@.%p"), objc_opt_class(v18), v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v43 = v15;
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = objc_retainAutorelease(v22);
    v26 = dispatch_queue_create((const char *)objc_msgSend(v25, "UTF8String"), v24);
    serialQueue = v18->_serialQueue;
    v18->_serialQueue = (OS_dispatch_queue *)v26;

    dispatch_queue_set_specific((dispatch_queue_t)v18->_serialQueue, off_1000A1830, v18, 0);
    objc_storeStrong((id *)&v18->_completionDispatchQueue, &_dispatch_main_q);
    objc_storeStrong((id *)&v18->_callHistoryController, a3);
    v28 = (NSCache *)objc_alloc_init((Class)NSCache);
    callProviderCache = v18->_callProviderCache;
    v18->_callProviderCache = v28;

    objc_storeStrong((id *)&v18->_callProviderManager, a4);
    callProviderManager = v18->_callProviderManager;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](v18, "serialQueue"));
    -[TUCallProviderManager addDelegate:queue:](callProviderManager, "addDelegate:queue:", v18, v31);

    v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contactCache = v18->_contactCache;
    v18->_contactCache = v32;

    objc_storeStrong((id *)&v18->_contactStore, a5);
    objc_storeStrong((id *)&v18->_suggestedContactStore, a6);
    objc_storeStrong((id *)&v18->_metadataCache, a7);
    v34 = (TUSubtitleProvider *)objc_msgSend(objc_alloc((Class)TUSubtitleProvider), "initWithMetadataCache:callProviderManager:", v16, v47);
    subtitleProvider = v18->_subtitleProvider;
    v18->_subtitleProvider = v34;

    objc_storeStrong((id *)&v18->_voicemailController, a8);
    v36 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v18->_featureFlags;
    v18->_featureFlags = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    localizedSubtitleCache = v18->_localizedSubtitleCache;
    v18->_localizedSubtitleCache = v38;

    v18->_startedLoadingOlderCalls = 0;
    v40 = objc_alloc_init(MPAnalyticsLogger);
    -[PHRecentsController setAnalyticsLogger:](v18, "setAnalyticsLogger:", v40);

    v41 = v18->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BB04;
    block[3] = &unk_1000898B8;
    v49 = v18;
    dispatch_async(v41, block);

    v15 = v43;
  }

  return v18;
}

- (void)logRecentsScrollingEvent:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  if (!(a3 % 100))
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3 / 100));
    objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("BucketedScrollingIndex"));

    objc_msgSend(v9, "setObject:forKey:", &off_10008DC18, CFSTR("AppName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController analyticsLogger](self, "analyticsLogger"));
    v8 = objc_msgSend(v9, "copy");
    objc_msgSend(v7, "logEvent:withCoreAnalyticsDictionary:", CFSTR("com.apple.MobilePhone.RecentsScrollingIndex"), v8);

  }
}

- (id)recentCallsChangedFromCachedRecentCalls:(id)a3 callHistoryControllerRecentCalls:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueId"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueId", (_QWORD)v25));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v22));

        if (!v23 || (objc_msgSend(v23, "isEqual:", v21) & 1) == 0)
          objc_msgSend(v7, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  return v7;
}

- (id)fetchRecentCalls
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  int v23;
  id v24;

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController recentCalls](self, "recentCalls"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recentCalls"));

  if (objc_msgSend(v4, "isEqualToArray:", v6))
  {
    v7 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Recent calls array has not changed. Ignoring", (uint8_t *)&v23, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
    v10 = objc_msgSend(v9, "callHistorySearchEnabled");

    if (v10)
    {
      os_unfair_lock_lock(&self->_accessorLock);
      -[PHRecentsController notifyDelegatesRecentsController:didCompleteFetchingCalls:](self, "notifyDelegatesRecentsController:didCompleteFetchingCalls:", self, v4);
      os_unfair_lock_unlock(&self->_accessorLock);
    }
    v11 = v4;
    goto LABEL_16;
  }
  -[PHRecentsController populateMessageCacheForMessages:recentCalls:](self, "populateMessageCacheForMessages:recentCalls:", self->_messages, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  v13 = objc_msgSend(v12, "increaseCallHistoryEnabled");

  if (!v13)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController itemCache](self, "itemCache"));
    objc_msgSend(v21, "removeAllObjects");

    -[PHRecentsController populateCachesForRecentCalls:](self, "populateCachesForRecentCalls:", v6);
    v11 = v6;
LABEL_16:
    v20 = v11;
    goto LABEL_17;
  }
  v14 = sub_10000E6C4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Recent calls array has changed. Find the changed objects and only update their cache", (uint8_t *)&v23, 2u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController recentCallsChangedFromCachedRecentCalls:callHistoryControllerRecentCalls:](self, "recentCallsChangedFromCachedRecentCalls:callHistoryControllerRecentCalls:", v4, v6));
  v17 = sub_10000E6C4();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v16, "count");
    v23 = 134217984;
    v24 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found %lu changed objects", (uint8_t *)&v23, 0xCu);
  }

  if (objc_msgSend(v16, "count"))
    -[PHRecentsController populateCachesForRecentCalls:](self, "populateCachesForRecentCalls:", v16);
  v20 = v6;

LABEL_17:
  return v20;
}

- (void)continuousScrollingReachedIndexPath:(int64_t)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  char *v8;
  id v9;
  NSObject *v10;
  OS_dispatch_queue *serialQueue;
  _QWORD v12[6];
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  unsigned int v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "increaseCallHistoryEnabled");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController recentCalls](self, "recentCalls"));
    v8 = (char *)objc_msgSend(v7, "count") - a3;

    v9 = sub_10000E6C4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v14 = a3;
      v15 = 2048;
      v16 = v8;
      v17 = 1024;
      v18 = -[PHRecentsController startedLoadingOlderCalls](self, "startedLoadingOlderCalls");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_continuousScrollingReachedIndexPath %ld, remaining rows: %ld startedLoadingOlderCalls: %d", buf, 0x1Cu);
    }

    -[PHRecentsController loadOlderCallsIfNecessaryForRemainingRowCount:](self, "loadOlderCallsIfNecessaryForRemainingRowCount:", v8);
    serialQueue = self->_serialQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100015000;
    v12[3] = &unk_100089B40;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async((dispatch_queue_t)serialQueue, v12);
  }
}

- (NSArray)recentCalls
{
  _QWORD *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[4];
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[5];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000E67C;
  v16[3] = &unk_100089E90;
  v16[4] = self;
  v3 = objc_retainBlock(v16);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10002BFEC;
  v14 = sub_10002BFFC;
  v4 = ((uint64_t (*)(void))v3[2])();
  v15 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (!v11[5] && -[PHRecentsController isInitializationBlockQueued](self, "isInitializationBlockQueued"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002C004;
    v7[3] = &unk_100089EB8;
    v9 = &v10;
    v8 = v3;
    -[PHRecentsController performSynchronousBlock:](self, "performSynchronousBlock:", v7);

  }
  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSArray *)v5;
}

- (void)loadOlderCallsIfNecessaryForRemainingRowCount:(int64_t)a3
{
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "increaseCallHistoryEnabled");

  if (v6 && !-[PHRecentsController startedLoadingOlderCalls](self, "startedLoadingOlderCalls"))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController recentCalls](self, "recentCalls"));
    v7 = objc_msgSend(v14, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
    v9 = objc_msgSend(v8, "callHistoryControllerCallHistoryFetchLimit");
    if (a3 > 50 || v7 >= v9)
    {

    }
    else
    {
      v10 = -[PHRecentsController canLoadOlderRecentCalls](self, "canLoadOlderRecentCalls");

      if (v10)
      {
        v11 = sub_10000E6C4();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading older recent calls", buf, 2u);
        }

        -[PHRecentsController setStartedLoadingOlderCalls:](self, "setStartedLoadingOlderCalls:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
        objc_msgSend(v13, "loadOlderRecentCalls");

      }
    }
  }
}

- (BOOL)startedLoadingOlderCalls
{
  return self->_startedLoadingOlderCalls;
}

- (TUCallHistoryController)callHistoryController
{
  return self->_callHistoryController;
}

- (BOOL)isInitializationBlockQueued
{
  PHRecentsController *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_initializationBlockQueued;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (id)contactHandlesForRecentCalls:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v9);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validRemoteParticipantHandles"));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
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
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15)));
              objc_msgSend(v5, "addObjectsFromArray:", v16);

              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v13);
        }

        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "array"));
  return v17;
}

- (void)fetchContactsForHandles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

        if (!v14)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactStore](self, "contactStore"));
    v16 = sub_10000E6C4();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218242;
      v46 = v18;
      v47 = 2112;
      v48 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu handles using contact store %@", buf, 0x16u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v34 = v7;
    if (qword_1000A3920 != -1)
      dispatch_once(&qword_1000A3920, &stru_10008A038);
    v33 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contactsForHandles:keyDescriptors:alwaysUnifyLabeledValues:", v19, qword_1000A3918, 0));

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = v6;
    obj = v6;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v25));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));
          if ((unint64_t)objc_msgSend(v26, "count") >= 2)
          {
            v28 = sub_10000E6C4();
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = objc_msgSend(v26, "count");
              *(_DWORD *)buf = 134218498;
              v46 = v30;
              v47 = 2112;
              v48 = v25;
              v49 = 2112;
              v50 = v27;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Found %lu contacts for contact handle %@; caching the first contact %@",
                buf,
                0x20u);
            }

          }
          v31 = objc_msgSend(objc_alloc((Class)TUOptionalObject), "initWithValue:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache"));
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v25);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v22);
    }

    v7 = v34;
    v6 = v35;
  }

}

- (void)populateItemCacheForRecentCalls:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController itemCache](self, "itemCache"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController fetchMutableItemForRecentCall:](self, "fetchMutableItemForRecentCall:", v12, (_QWORD)v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController localizedSubtitleForRecentCall:](self, "localizedSubtitleForRecentCall:", v12));
        objc_msgSend(v13, "setLocalizedSubtitle:", v14);

        v15 = objc_msgSend(v13, "copy");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueId"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (BOOL)isLocalizedSubtitleUnknown:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  unsigned __int8 v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "increaseCallHistoryEnabled");

  v7 = objc_msgSend(v4, "length");
  if (v7)
    v8 = v6;
  else
    v8 = 1;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController unknownLabel](self, "unknownLabel"));
    v8 = objc_msgSend(v4, "isEqualToString:", v9);

  }
  return v8;
}

- (id)localizedSubtitleForRecentCall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  const __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  __CFString *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  unsigned int v79;
  void *v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  if (!objc_msgSend(v4, "wasEmergencyCall"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "blockedByExtension"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@_BLOCKED_BY"), &stru_10008B240, CFSTR("PHRecents")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedBlockedByExtensionName"));
      v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10));

      goto LABEL_95;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
    v13 = objc_msgSend(v12, "increaseCallHistoryEnabled");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController localizedSubtitleCache](self, "localizedSubtitleCache"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11));

      if (!-[PHRecentsController isLocalizedSubtitleUnknown:](self, "isLocalizedSubtitleUnknown:", v15))
      {
        v6 = v15;
LABEL_94:

        goto LABEL_95;
      }
    }
    else
    {
      v15 = 0;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
    v17 = objc_msgSend(v16, "callHistorySearchEnabled");

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteParticipantHandles"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "anyObject"));

      if (v19)
      {
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v20 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:", v19));
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
        if (v21)
        {
          v83 = v19;
          v85 = v15;
          v87 = v11;
          v22 = *(_QWORD *)v94;
          while (2)
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(_QWORD *)v94 != v22)
                objc_enumerationMutation(v20);
              v24 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v24));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "value"));

              if (v27)
              {
                v21 = v24;
                goto LABEL_25;
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
            if (v21)
              continue;
            break;
          }
          v27 = 0;
LABEL_25:
          v15 = v85;
          v11 = v87;
          v19 = v83;
        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
        v21 = 0;
        v27 = 0;
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController subtitleProvider](self, "subtitleProvider"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedSubtitleForRecentCall:handle:contact:", v4, v21, v27));

      if (!objc_msgSend(v46, "length"))
      {
        v47 = objc_claimAutoreleasedReturnValue(-[PHRecentsController unknownLabel](self, "unknownLabel"));

        v46 = (void *)v47;
      }
      if (v11)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController localizedSubtitleCache](self, "localizedSubtitleCache"));
        objc_msgSend(v48, "setObject:forKey:", v46, v11);

      }
      v6 = v46;

      goto LABEL_94;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController fetchCallProviderForRecentCall:](self, "fetchCallProviderForRecentCall:", v4));
    v29 = v28;
    if (v28)
    {
      if (objc_msgSend(v28, "isFaceTimeProvider"))
      {
        v30 = objc_msgSend(v4, "mediaType");
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v32 = v31;
        if (v30 == (id)2)
          v33 = CFSTR("RECENTS_FACETIME_VIDEO");
        else
          v33 = CFSTR("RECENTS_FACETIME_AUDIO");
        v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", v33, &stru_10008B240, CFSTR("PHRecents")));

        goto LABEL_57;
      }
      if (objc_msgSend(v29, "isTelephonyProvider"))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteParticipantHandles"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "anyObject"));

        if (v35)
        {
          v84 = v35;
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v36 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:", v35));
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          if (v37)
          {
            v38 = v37;
            v82 = v29;
            v86 = v15;
            v88 = v11;
            v39 = *(_QWORD *)v90;
LABEL_31:
            v40 = 0;
            while (1)
            {
              if (*(_QWORD *)v90 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v40);
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v41));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "value"));

              if (v44)
                break;
              if (v38 == (id)++v40)
              {
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
                if (v38)
                  goto LABEL_31;
                v15 = v86;
                v11 = v88;
                v29 = v82;
                goto LABEL_38;
              }
            }
            v35 = v84;
            v52 = objc_msgSend(v84, "type");
            if (v52 == (id)3)
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "labeledValueForEmailAddress:", v41));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "label"));
              v55 = objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedDisplayStringForLabel:propertyName:](CNLabeledValue, "localizedDisplayStringForLabel:propertyName:", v54, CNContactEmailAddressesKey));
              v15 = v86;
              v29 = v82;
            }
            else
            {
              v15 = v86;
              v29 = v82;
              if (v52 == (id)2)
              {
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isoCountryCode"));
                v54 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithDigits:countryCode:](CNPhoneNumber, "phoneNumberWithDigits:countryCode:", v41, v59));

                if (v54)
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "labeledValueForPhoneNumber:", v54));
                else
                  v53 = 0;
                v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "label"));
                v55 = objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedDisplayStringForLabel:propertyName:](CNLabeledValue, "localizedDisplayStringForLabel:propertyName:", v60, CNContactPhoneNumbersKey));

                v15 = (void *)v60;
              }
              else
              {
                if (v52 != (id)1)
                {
LABEL_64:

                  v11 = v88;
                  goto LABEL_65;
                }
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "labeledValueForSocialProfileWithUsername:", v41));
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "label"));
                v55 = objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedDisplayStringForLabel:propertyName:](CNLabeledValue, "localizedDisplayStringForLabel:propertyName:", v54, CNContactSocialProfilesKey));
              }
            }

            v15 = (void *)v55;
            v35 = v84;
            goto LABEL_64;
          }
LABEL_38:
          v35 = v84;
LABEL_65:

        }
        if (-[PHRecentsController isLocalizedSubtitleUnknown:](self, "isLocalizedSubtitleUnknown:", v15)
          && objc_msgSend(v4, "isJunk"))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "junkIdentificationCategory"));
          if (v61)
            v62 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "junkIdentificationCategory"));
          else
            v62 = CFSTR("MAYBE_JUNK");

          v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", v62, &stru_10008B240, CFSTR("PHRecents")));

          v15 = (void *)v64;
        }
        if (-[PHRecentsController isLocalizedSubtitleUnknown:](self, "isLocalizedSubtitleUnknown:", v15))
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:](TUMetadataDestinationID, "metadataDestinationIDsForCHRecentCall:", v4));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "firstObject"));

          if (v66)
          {
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController metadataCache](self, "metadataCache"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "metadataForDestinationID:", v66));

            if (v68)
            {
              if (-[PHRecentsController isLocalizedSubtitleUnknown:](self, "isLocalizedSubtitleUnknown:", v15)
                && (objc_msgSend(v4, "callerIdIsBlocked") & 1) == 0)
              {
                v69 = objc_msgSend(v68, "metadataForProvider:", objc_opt_class(TUMapsMetadataCacheDataProvider));
                v70 = objc_claimAutoreleasedReturnValue(v69);

                v15 = (void *)v70;
              }
              if (-[PHRecentsController isLocalizedSubtitleUnknown:](self, "isLocalizedSubtitleUnknown:", v15)
                && (objc_msgSend(v4, "callerIdIsBlocked") & 1) == 0)
              {
                v71 = objc_msgSend(v68, "metadataForProvider:", objc_opt_class(TUCallDirectoryMetadataCacheDataProvider));
                v72 = objc_claimAutoreleasedReturnValue(v71);

                v15 = (void *)v72;
              }
              if (-[PHRecentsController isLocalizedSubtitleUnknown:](self, "isLocalizedSubtitleUnknown:", v15))
              {
                v73 = objc_msgSend(v68, "metadataForProvider:", objc_opt_class(TUSuggestionsMetadataCacheDataProvider));
                v74 = objc_claimAutoreleasedReturnValue(v73);

                v15 = (void *)v74;
              }
              if (-[PHRecentsController isLocalizedSubtitleUnknown:](self, "isLocalizedSubtitleUnknown:", v15))
              {
                v75 = objc_msgSend(v68, "metadataForProvider:", objc_opt_class(TUGeoLocationMetadataCacheDataProvider));
                v76 = objc_claimAutoreleasedReturnValue(v75);

                v15 = (void *)v76;
              }
            }
          }
          else
          {
            v68 = 0;
          }

        }
        goto LABEL_88;
      }
      v50 = objc_msgSend(v4, "mediaType");
      if (v50 == (id)1)
      {
        v51 = CFSTR("RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_AUDIO");
        goto LABEL_56;
      }
      if (v50 == (id)2)
      {
        v51 = CFSTR("RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_VIDEO");
LABEL_56:
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", v51, &stru_10008B240, CFSTR("PHRecents")));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedName"));
        v49 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v57, v58));

LABEL_57:
        v15 = (void *)v49;
      }
    }
LABEL_88:
    if (!objc_msgSend(v15, "length"))
    {
      v77 = objc_claimAutoreleasedReturnValue(-[PHRecentsController unknownLabel](self, "unknownLabel"));

      v15 = (void *)v77;
    }
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
    v79 = objc_msgSend(v78, "increaseCallHistoryEnabled");

    if (v79 && v11)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController localizedSubtitleCache](self, "localizedSubtitleCache"));
      objc_msgSend(v80, "setObject:forKey:", v15, v11);

    }
    v6 = v15;

    goto LABEL_94;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController subtitleForRecentEmergencyCall:](self, "subtitleForRecentEmergencyCall:", v4));
LABEL_95:

  return v6;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (NSMutableDictionary)itemCache
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_itemCache;
}

- (NSMutableDictionary)localizedSubtitleCache
{
  return self->_localizedSubtitleCache;
}

- (id)fetchMutableItemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  PHMutableRecentsItem *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  PHMutableRecentsItem *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  void *v96;
  void *v97;
  unint64_t v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  const __CFString *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  void *v169;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  unint64_t v180;
  unint64_t v181;
  PHMutableRecentsItem *v182;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _QWORD v196[6];
  _BYTE v197[128];
  _BYTE v198[128];

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = objc_alloc_init(PHMutableRecentsItem);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validRemoteParticipantHandles"));
  v10 = (uint64_t)objc_msgSend(v9, "count");
  v11 = (uint64_t)objc_msgSend(v6, "countOfExcludedHandles");
  v12 = v11;
  if (!v10 && v11 >= 1)
  {
    if (v11 == 1)
    {
      v13 = TUBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ONE_OTHER"), &stru_10008B240, CFSTR("TelephonyUtilities")));

    }
    else
    {
      v40 = TUBundle();
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v186 = v6;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("%@_OTHERS"), &stru_10008B240, CFSTR("TelephonyUtilities")));
      v43 = v8;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController numberFormatter](self, "numberFormatter"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
      v46 = a4;
      v47 = v9;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringFromNumber:", v45));
      v49 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v42, v48));

      v9 = v47;
      a4 = v46;

      v8 = v43;
      v6 = v186;

    }
    v18 = 0;
    goto LABEL_81;
  }
  v182 = v8;
  v183 = v9;
  if (v10 <= 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
    v196[0] = _NSConcreteStackBlock;
    v196[1] = 3221225472;
    v196[2] = sub_100014AC4;
    v196[3] = &unk_100089FF8;
    v196[4] = self;
    v196[5] = v12;
    v16 = objc_retainBlock(v196);
    if (v15)
    {
      v192 = 0u;
      v193 = 0u;
      v194 = 0u;
      v195 = 0u;
      v17 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:", v15));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v192, v198, 16);
      if (v18)
      {
        v184 = v15;
        v180 = a4;
        v19 = *(_QWORD *)v193;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v193 != v19)
              objc_enumerationMutation(v17);
            v21 = *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v21));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "value"));

            if (v24)
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactFormatter](self, "contactFormatter"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stringFromContact:", v24));
              v52 = ((uint64_t (*)(_QWORD *, void *))v16[2])(v16, v51);
              v49 = (id)objc_claimAutoreleasedReturnValue(v52);

              v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactFormatter](self, "contactFormatter"));
              v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringFromContact:", v24));

              goto LABEL_38;
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v192, v198, 16);
          if (v18)
            continue;
          break;
        }
        v49 = 0;
LABEL_38:
        a4 = v180;
        v15 = v184;
      }
      else
      {
        v49 = 0;
      }

    }
    else
    {
      v18 = 0;
      v49 = 0;
    }
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController fetchCallProviderForRecentCall:](self, "fetchCallProviderForRecentCall:", v6));
    if (!objc_msgSend(v49, "length") && (objc_msgSend(v86, "isTelephonyProvider") & 1) == 0)
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v88 = ((uint64_t (*)(_QWORD *, void *))v16[2])(v16, v87);
      v89 = objc_claimAutoreleasedReturnValue(v88);

      v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v18 = (id)v90;
      v49 = (id)v89;
    }
    if (!objc_msgSend(v49, "length"))
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callerIdForDisplay"));
      v92 = ((uint64_t (*)(_QWORD *, void *))v16[2])(v16, v91);
      v93 = objc_claimAutoreleasedReturnValue(v92);

      v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callerIdForDisplay"));
      v18 = (id)v94;
      v49 = (id)v93;
    }
    if (!objc_msgSend(v49, "length"))
    {
      v95 = objc_msgSend(v6, "callerIdIsBlocked");
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v97 = v96;
      v187 = v15;
      v98 = a4;
      v99 = v6;
      if (v95)
        v100 = CFSTR("NO_CALLER_ID");
      else
        v100 = CFSTR("UNKNOWN_CALLER");
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "localizedStringForKey:value:table:", v100, &stru_10008B240, CFSTR("PHRecents")));
      v102 = ((uint64_t (*)(_QWORD *, void *))v16[2])(v16, v101);
      v103 = objc_claimAutoreleasedReturnValue(v102);

      LODWORD(v101) = objc_msgSend(v99, "callerIdIsBlocked");
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v105 = v104;
      if ((_DWORD)v101)
        v106 = CFSTR("NO_CALLER_ID");
      else
        v106 = CFSTR("UNKNOWN_CALLER");
      v107 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "localizedStringForKey:value:table:", v106, &stru_10008B240, CFSTR("PHRecents")));

      v18 = (id)v107;
      v49 = (id)v103;
      v6 = v99;
      a4 = v98;
      v15 = v187;
    }

    v8 = v182;
    v9 = v183;
    goto LABEL_81;
  }
  v177 = v11;
  v181 = a4;
  v185 = v6;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v191 = 0u;
  v26 = v9;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v188, v197, 16);
  if (!v27)
    goto LABEL_30;
  v28 = v27;
  v29 = *(_QWORD *)v189;
  do
  {
    for (j = 0; j != v28; j = (char *)j + 1)
    {
      if (*(_QWORD *)v189 != v29)
        objc_enumerationMutation(v26);
      v31 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * (_QWORD)j);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactForHandle:](self, "contactForHandle:", v31));
      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactFormatter](self, "contactFormatter"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringFromContact:", v32));

        if (v34)
        {
          objc_msgSend(v25, "addObject:", v34);
          goto LABEL_28;
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "isoCountryCode"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController formattedNameForHandle:countryCode:](self, "formattedNameForHandle:countryCode:", v31, v35));
        objc_msgSend(v25, "addObject:", v36);

      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "isoCountryCode"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController formattedNameForHandle:countryCode:](self, "formattedNameForHandle:countryCode:", v31, v34));
        objc_msgSend(v25, "addObject:", v35);
      }

LABEL_28:
    }
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v188, v197, 16);
  }
  while (v28);
LABEL_30:

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v38 = (uint64_t)objc_msgSend(v25, "count");
  if (v38 == 3)
  {
    v173 = v37;
    if (v177 == 1)
    {
      v120 = TUBundle();
      v121 = (void *)objc_claimAutoreleasedReturnValue(v120);
      v122 = v37;
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "localizedStringForKey:value:table:", CFSTR("%@_%@_%@_AND_ONE_OTHER"), &stru_10008B240, CFSTR("TelephonyUtilities")));
      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 2));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v123, v124, v125, v126));

      v127 = v122;
    }
    else
    {
      if (!v177)
      {
        v54 = TUBundle();
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("%@_%@_AND_%@"), &stru_10008B240, CFSTR("TelephonyUtilities")));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 2));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v56, v57, v58, v59));
        objc_msgSend(v173, "appendString:", v60);

LABEL_73:
        a4 = v181;

        v137 = TUBundle();
        v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
        v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "localizedStringForKey:value:table:", CFSTR("%@_%@_AND_%@"), &stru_10008B240, CFSTR("TelephonyUtilities")));
        v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
        v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
        v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 2));
        v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v139, v140, v141, v142));

        v8 = v182;
        v9 = v183;
        v37 = v173;
        goto LABEL_77;
      }
      v128 = TUBundle();
      v171 = (void *)objc_claimAutoreleasedReturnValue(v128);
      v129 = objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "localizedStringForKey:value:table:", CFSTR("%@_%@_%@_AND_%@_OTHERS"), &stru_10008B240, CFSTR("TelephonyUtilities")));
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 2));
      v133 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController numberFormatter](self, "numberFormatter"));
      v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v177));
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "stringFromNumber:", v134));
      v136 = (void *)v129;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v129, v130, v131, v132, v135));

      v127 = v173;
    }
    objc_msgSend(v127, "appendString:", v55);
    goto LABEL_73;
  }
  v9 = v183;
  if (v38 == 2)
  {
    if (v177 == 1)
    {
      v143 = TUBundle();
      v62 = (void *)objc_claimAutoreleasedReturnValue(v143);
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("%@_%@_AND_ONE_OTHER"), &stru_10008B240, CFSTR("TelephonyUtilities")));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v63, v64, v65));
      a4 = v181;
    }
    else
    {
      a4 = v181;
      v61 = TUBundle();
      if (v177)
      {
        v172 = (void *)objc_claimAutoreleasedReturnValue(v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "localizedStringForKey:value:table:", CFSTR("%@_%@_AND_%@_OTHERS"), &stru_10008B240, CFSTR("TelephonyUtilities")));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
        v144 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController numberFormatter](self, "numberFormatter"));
        v176 = v37;
        v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v177));
        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "stringFromNumber:", v145));
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v63, v64, v65, v146));

        v62 = v172;
        v37 = v176;

      }
      else
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@"), &stru_10008B240, CFSTR("TelephonyUtilities")));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v63, v64, v65));
      }
    }

    objc_msgSend(v37, "appendString:", v66);
    v147 = TUBundle();
    v148 = v37;
    v149 = (void *)objc_claimAutoreleasedReturnValue(v147);
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@"), &stru_10008B240, CFSTR("TelephonyUtilities")));
    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v150, v151, v152));

    v37 = v148;
    v8 = v182;
    v9 = v183;
  }
  else if (v38 == 1)
  {
    a4 = v181;
    if (v177 == 1)
    {
      v108 = TUBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue(v108);
      v109 = v37;
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("%@_AND_ONE_OTHER"), &stru_10008B240, CFSTR("TelephonyUtilities")));
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
      v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v110, v111));
      objc_msgSend(v109, "appendString:", v112);

      v37 = v109;
    }
    else
    {
      if (v177)
      {
        v113 = TUBundle();
        v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@_OTHERS"), &stru_10008B240, CFSTR("TelephonyUtilities")));
        v175 = v37;
        v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
        v117 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController numberFormatter](self, "numberFormatter"));
        v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v177));
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "stringFromNumber:", v118));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v115, v116, v119));

        v9 = v183;
        v37 = v175;

      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
      }
      objc_msgSend(v37, "appendString:", v39);
    }

    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
    v8 = v182;
  }
  else
  {
    if (v38 < 4)
    {
      v18 = 0;
    }
    else
    {
      v67 = (char *)objc_msgSend(v25, "count") + v177 - 3;
      v68 = TUBundle();
      v178 = (void *)objc_claimAutoreleasedReturnValue(v68);
      v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "localizedStringForKey:value:table:", CFSTR("%@_%@_%@_AND_%@_OTHER"), &stru_10008B240, CFSTR("TelephonyUtilities")));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 2));
      v174 = v37;
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController numberFormatter](self, "numberFormatter"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v67));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "stringFromNumber:", v74));
      v76 = (void *)v69;
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v69, v70, v71, v72, v75));
      objc_msgSend(v174, "appendString:", v77);

      v78 = TUBundle();
      v179 = (void *)objc_claimAutoreleasedReturnValue(v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "localizedStringForKey:value:table:", CFSTR("%@_%@_%@_AND_%@_OTHER"), &stru_10008B240, CFSTR("TelephonyUtilities")));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 0));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 2));
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController numberFormatter](self, "numberFormatter"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v25, "count") - 3));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "stringFromNumber:", v84));
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v79, v80, v81, v82, v85));

      v37 = v174;
      v9 = v183;

    }
    a4 = v181;
    v8 = v182;
  }
LABEL_77:
  if (objc_msgSend(v37, "length"))
    v49 = objc_msgSend(v37, "copy");
  else
    v49 = 0;

  v6 = v185;
LABEL_81:
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
  -[PHRecentsItem setDate:](v8, "setDate:", v153);

  v154 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem image](v8, "image"));
  if (!v154)
  {
    v155 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController fetchImageForRecentCall:](self, "fetchImageForRecentCall:", v6));
    -[PHRecentsItem setImage:](v8, "setImage:", v155);

  }
  if (a4 <= 1)
  {
    -[PHRecentsItem setLocalizedCount:](v8, "setLocalizedCount:", 0);
  }
  else
  {
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController numberFormatter](self, "numberFormatter"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v158 = v6;
    v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "stringFromNumber:", v157));
    v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v159));
    -[PHRecentsItem setLocalizedCount:](v8, "setLocalizedCount:", v160);

    v6 = v158;
  }
  -[PHRecentsItem setLocalizedTitle:](v8, "setLocalizedTitle:", v49);
  -[PHRecentsItem setLocalizedValidHandlesTitle:](v8, "setLocalizedValidHandlesTitle:", v18);
  -[PHRecentsItem setVerified:](v8, "setVerified:", objc_msgSend(v6, "verificationStatus") == (id)1);
  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable"))
  {
    v161 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController fetchCallProviderForRecentCall:](self, "fetchCallProviderForRecentCall:", v6));
    if (objc_msgSend(v6, "ph_supportsLocalParticipantBadge"))
    {
      v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "prioritizedSenderIdentities"));
      v163 = objc_msgSend(v162, "count");

      if ((unint64_t)v163 >= 2)
      {
        v164 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callProviderManager](self, "callProviderManager"));
        v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "telephonyProvider"));
        v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localParticipantUUID"));
        v167 = v6;
        v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "senderIdentityForAccountUUID:", v166));

        v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "localizedShortName"));
        -[PHRecentsItem setLocalizedSenderIdentityTitle:](v8, "setLocalizedSenderIdentityTitle:", v169);

        v6 = v167;
      }
    }

  }
  return v8;
}

- (id)contactsByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *j;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v44;
  id obj;
  uint64_t v46;
  char *v47;
  id v48;
  char *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];

  v6 = a3;
  v54 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v7);

  v53 = objc_alloc_init((Class)NSMutableOrderedSet);
  v48 = objc_alloc_init((Class)NSMutableDictionary);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v44 = v6;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validRemoteParticipantHandles"));
  v47 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  if (v47)
  {
    v55 = 0;
    v46 = *(_QWORD *)v69;
    v8 = v53;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v69 != v46)
          objc_enumerationMutation(obj);
        v49 = v9;
        v51 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:"));
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v65 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v15));

              if (v17
                && ((v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"))) == 0
                 || (v19 = (void *)v18,
                     v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value")),
                     v21 = objc_msgSend(v20, "areKeysAvailable:", v54),
                     v20,
                     v8 = v53,
                     v19,
                     v21)))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
                if (v22)
                {
                  v23 = v55;
                  if (!v55)
                    v23 = objc_alloc_init((Class)NSMutableDictionary);
                  v55 = v23;
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v51));
                  if (!v24)
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                    objc_msgSend(v55, "setObject:forKeyedSubscript:", v24, v51);
                  }
                  objc_msgSend(v24, "addObject:", v22);

                }
              }
              else
              {
                objc_msgSend(v8, "addObject:", v15);
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
          }
          while (v12);
        }
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v10, v51);

        v9 = v49 + 1;
      }
      while (v49 + 1 != v47);
      v47 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    }
    while (v47);
  }
  else
  {
    v55 = 0;
    v8 = v53;
  }

  if (objc_msgSend(v8, "count"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactStore](self, "contactStore"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "array"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contactsForHandles:keyDescriptors:", v26, v54));

    if (v27)
    {
      v28 = v55;
      if (!v55)
        v28 = objc_alloc_init((Class)NSMutableDictionary);
      v55 = v28;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v50 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "allKeys"));
      v29 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
      if (v29)
      {
        v30 = v29;
        v52 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(_QWORD *)v61 != v52)
              objc_enumerationMutation(v50);
            v32 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
            v33 = objc_alloc_init((Class)NSMutableOrderedSet);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", v32));
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v57;
              do
              {
                for (k = 0; k != v36; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v57 != v37)
                    objc_enumerationMutation(v34);
                  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k)));
                  if (objc_msgSend(v39, "count"))
                    objc_msgSend(v33, "addObjectsFromArray:", v39);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
              }
              while (v36);
            }
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v32));
            if (!v40)
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              objc_msgSend(v55, "setObject:forKeyedSubscript:", v40, v32);
            }
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "array"));
            objc_msgSend(v40, "addObjectsFromArray:", v41);

          }
          v30 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
        }
        while (v30);
      }

    }
    v8 = v53;
  }
  v42 = objc_msgSend(v55, "copy");

  return v42;
}

- (NSMutableDictionary)contactCache
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_contactCache;
}

- (void)performSynchronousBlock:(id)a3
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  if (dispatch_get_specific(off_1000A1830) == self)
  {
    v6 = (void (*)(void))*((_QWORD *)a3 + 2);
    v7 = a3;
    v6();
  }
  else
  {
    v5 = a3;
    v7 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
    dispatch_sync(v7, v5);

  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (id)contactHandlesForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "addObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "normalizedValue"));
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v8 & 1) == 0)
        objc_msgSend(v4, "addObject:", v6);
    }

  }
  v9 = objc_msgSend(v4, "copy");

  return v9;
}

- (id)itemForRecentCall:(id)a3 presentationStyle:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController itemForRecentCall:numberOfOccurences:](self, "itemForRecentCall:numberOfOccurences:", v6, objc_msgSend(v6, "numberOfOccurrences")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceProvider"));
  if (objc_msgSend(v8, "isEqualToString:", kCHServiceProviderTelephony))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteParticipantHandles"));
    v10 = objc_msgSend(v9, "count");
    v11 = v10 != (id)1;

    if (!a4)
    {
      if (v10 == (id)1)
        goto LABEL_11;
LABEL_10:
      self = v7;
      goto LABEL_19;
    }
  }
  else
  {

    if (!a4)
      goto LABEL_10;
    v11 = 1;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageURL"));
  if (v12)
  {

    goto LABEL_10;
  }
  if (v11)
    goto LABEL_10;
LABEL_11:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteParticipantHandles"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));

  if (!v14)
    goto LABEL_17;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  if (!v15)
    goto LABEL_17;
  v16 = (void *)v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v18 = objc_msgSend(v17, "length");

  if (!v18)
    goto LABEL_17;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10002BFEC;
  v30 = sub_10002BFFC;
  v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002C078;
  v23[3] = &unk_100089EE0;
  v25 = &v26;
  v23[4] = self;
  v24 = v14;
  -[PHRecentsController performSynchronousBlock:](self, "performSynchronousBlock:", v23);
  v19 = v27[5];
  if (!v19)
  {
    v20 = objc_msgSend(v7, "mutableCopy");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    objc_msgSend(v20, "setLocalizedSubtitle:", v21);

    self = (PHRecentsController *)objc_msgSend(v20, "copy");
  }

  _Block_object_dispose(&v26, 8);
  if (v19)
LABEL_17:
    self = v7;

LABEL_19:
  return self;
}

- (id)itemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  id v4;
  id v5;
  _QWORD v7[4];
  PHRecentsController *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10002BFEC;
  v15 = sub_10002BFFC;
  v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000106F4;
  v7[3] = &unk_100089EE0;
  v10 = &v11;
  v8 = self;
  v4 = a3;
  v9 = v4;
  -[PHRecentsController performSynchronousBlock:](v8, "performSynchronousBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (id)itemForRecentCall:(id)a3
{
  return -[PHRecentsController itemForRecentCall:presentationStyle:](self, "itemForRecentCall:presentationStyle:", a3, 1);
}

- (id)contactByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  PHRecentsController *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10002BFEC;
  v24 = sub_10002BFFC;
  v25 = 0;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10000EFDC;
  v15 = &unk_100089F58;
  v16 = self;
  v8 = v6;
  v17 = v8;
  v9 = v7;
  v18 = v9;
  v19 = &v20;
  -[PHRecentsController performSynchronousBlock:](self, "performSynchronousBlock:", &v12);
  v10 = objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15, v16);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)fetchCallProviderForRecentCall:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  id v19;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callProviderManager](self, "callProviderManager"));
  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Service provider is nil for the specified recent call: %@"), v5));
    NSLog(CFSTR("** TUAssertion failure: %@"), v13);

    if (_TUAssertShouldCrashApplication())
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHRecentsController.m"), 1041, CFSTR("Service provider is nil for the specified recent call: %@"), v5);

    }
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callProviderCache](self, "callProviderCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

  if (!v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "providerForRecentCall:", v5));
    if (v11)
    {
      v10 = (void *)v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callProviderCache](self, "callProviderCache"));
      objc_msgSend(v12, "setObject:forKey:", v10, v7);

      goto LABEL_11;
    }
    v15 = sub_10000E6C4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not retrieve a call provider for the specified recent call: %@", buf, 0xCu);
    }

LABEL_10:
    v10 = 0;
  }
LABEL_11:

  return v10;
}

- (TUCallProviderManager)callProviderManager
{
  os_unfair_lock_s *p_accessorLock;
  TUCallProviderManager *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_callProviderManager;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (NSCache)callProviderCache
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_callProviderCache;
}

- (id)fetchMutableItemForRecentCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController fetchMutableItemForRecentCall:numberOfOccurences:](self, "fetchMutableItemForRecentCall:numberOfOccurences:", v4, objc_msgSend(v4, "numberOfOccurrences")));
  return v6;
}

- (id)fetchImageForRecentCall:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(v4, "ttyType");
  if (v6 == (id)2)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[UIImage recentsTTYRelayGlyphImage](UIImage, "recentsTTYRelayGlyphImage"));
LABEL_5:
    v8 = (void *)v7;
    if (v7)
      goto LABEL_14;
    goto LABEL_6;
  }
  if (v6 == (id)1)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[UIImage recentsTTYDirectGlyphImage](UIImage, "recentsTTYDirectGlyphImage"));
    goto LABEL_5;
  }
LABEL_6:
  v9 = objc_msgSend(v4, "callStatus");
  if (v9 == kCHCallStatusConnectedOutgoing
    || (v10 = objc_msgSend(v4, "callStatus"), v10 == kCHCallStatusCancelled))
  {
    v11 = objc_msgSend(v4, "mediaType");
    if (v11 == (id)2)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[UIImage recentsOutgoingVideoCallGlyphImage](UIImage, "recentsOutgoingVideoCallGlyphImage"));
      goto LABEL_13;
    }
    if (v11 == (id)1)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[UIImage recentsOutgoingAudioCallGlyphImage](UIImage, "recentsOutgoingAudioCallGlyphImage"));
LABEL_13:
      v8 = (void *)v12;
      goto LABEL_14;
    }
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (void)setUnreadCallCount:(unint64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_unreadCallCount != a3)
  {
    self->_unreadCallCount = a3;
    -[PHRecentsController notifyDelegatesRecentsController:didChangeUnreadCallCount:](self, "notifyDelegatesRecentsController:didChangeUnreadCallCount:", self, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setStartedLoadingOlderCalls:(BOOL)a3
{
  self->_startedLoadingOlderCalls = a3;
}

- (void)setInitializationBlockQueued:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_accessorLock;

  v3 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_initializationBlockQueued != v3)
    self->_initializationBlockQueued = v3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setAnalyticsLogger:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsLogger, a3);
}

- (PHRecentsController)initWithCallHistoryController:(id)a3 callProviderManager:(id)a4 contactStore:(id)a5 suggestedContactStore:(id)a6 metadataCache:(id)a7
{
  return -[PHRecentsController initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:voicemailController:](self, "initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:voicemailController:", a3, a4, a5, a6, a7, 0);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (MPAnalyticsLogger)analyticsLogger
{
  return self->_analyticsLogger;
}

+ (id)indexPathsToInsertIntoCachedRecentCalls:(id)a3 fromBackingRecentCalls:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v9));
      if (v8 >= objc_msgSend(v5, "count"))
        v11 = 0;
      else
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v8));
      if (objc_msgSend(v11, "isEqual:", v10))
      {
        ++v8;
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, 0));
        objc_msgSend(v7, "addObject:", v12);

      }
      ++v9;

    }
    while (v9 < (unint64_t)objc_msgSend(v6, "count"));
  }
  if (v8 == objc_msgSend(v5, "count"))
    v13 = v7;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (PHRecentsController)init
{
  -[PHRecentsController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(-[PHRecentsController callDirectoryManagerIdentificationEntriesChangedNotificationToken](self, "callDirectoryManagerIdentificationEntriesChangedNotificationToken"));
  v4.receiver = self;
  v4.super_class = (Class)PHRecentsController;
  -[PHRecentsController dealloc](&v4, "dealloc");
}

- (CNContactStore)suggestedContactStore
{
  os_unfair_lock_s *p_accessorLock;
  CNContactStore *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_suggestedContactStore;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (unint64_t)unreadCallCount
{
  os_unfair_lock_s *p_accessorLock;
  unint64_t unreadCallCount;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  unreadCallCount = self->_unreadCallCount;
  os_unfair_lock_unlock(p_accessorLock);
  return unreadCallCount;
}

- (id)messageForRecentCall:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  PHRecentsController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10002BFEC;
  v15 = sub_10002BFFC;
  v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C1A4;
  v7[3] = &unk_100089F08;
  v4 = a3;
  v9 = self;
  v10 = &v11;
  v8 = v4;
  -[PHRecentsController performSynchronousBlock:](self, "performSynchronousBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (id)coalesceRecentCall:(id)a3 withRecentCall:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10002BFEC;
  v21 = sub_10002BFFC;
  v22 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C40C;
  v13[3] = &unk_100089F30;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)deleteAllRecentCalls
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C534;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)deleteRecentCalls:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C5FC;
  v7[3] = &unk_100089980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)markRecentAudioCallsAsRead
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C6A8;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)contactForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  id v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  PHRecentsController *v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10002BFEC;
  v30 = sub_10002BFFC;
  v31 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validRemoteParticipantHandles"));
  v9 = objc_msgSend(v8, "count");

  if (v9 == (id)1)
  {
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_10002C890;
    v21 = &unk_100089F58;
    v22 = self;
    v23 = v6;
    v24 = v7;
    v25 = &v26;
    -[PHRecentsController performSynchronousBlock:](self, "performSynchronousBlock:", &v18);

  }
  v10 = (void *)v27[5];
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController metadataCache](self, "metadataCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNMutableContact contactForRecentCall:metadataCache:](CNMutableContact, "contactForRecentCall:metadataCache:", v6, v11));

    v13 = objc_msgSend(v6, "callDirectoryIdentityType") == (id)2;
    objc_msgSend(v12, "setContactType:", v13, v18, v19, v20, v21, v22);
    v14 = objc_msgSend(v12, "copy");
    v15 = (void *)v27[5];
    v27[5] = (uint64_t)v14;

    v10 = (void *)v27[5];
  }
  v16 = v10;
  _Block_object_dispose(&v26, 8);

  return v16;
}

- (id)dialRequestForRecentCall:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  PHRecentsController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10002BFEC;
  v15 = sub_10002BFFC;
  v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002CA00;
  v7[3] = &unk_100089F08;
  v4 = a3;
  v9 = self;
  v10 = &v11;
  v8 = v4;
  -[PHRecentsController performSynchronousBlock:](self, "performSynchronousBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (void)performDialRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController presentScreenTimeShield](self, "presentScreenTimeShield"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callFilterController")),
        v9 = objc_msgSend(v8, "shouldRestrictDialRequest:performSynchronously:", v4, 1),
        v8,
        v7,
        v6,
        v9))
  {
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHRecentsController presentScreenTimeShield](self, "presentScreenTimeShield"));
    ((void (**)(_QWORD, id))v10)[2](v10, v4);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002CCB8;
    v12[3] = &unk_100089F80;
    v13 = v4;
    objc_msgSend(v11, "launchAppForDialRequest:completion:", v13, v12);

  }
}

- (void)performDialRequestForRecentCall:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController dialRequestForRecentCall:](self, "dialRequestForRecentCall:", a3));
  if (v4)
  {
    v5 = v4;
    -[PHRecentsController performDialRequest:](self, "performDialRequest:", v4);
    v4 = v5;
  }

}

- (void)performJoinRequestForRecentCall:(id)a3
{
  -[PHRecentsController performJoinRequestForRecentCall:overrideProvider:](self, "performJoinRequestForRecentCall:overrideProvider:", a3, 0);
}

- (void)performJoinRequestForRecentCall:(id)a3 overrideProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void (**v36)(_QWORD, _QWORD);
  id v37;
  id v38;
  PHRecentsController *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000E6C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHRecentsController -performJoinRequestForRecentCall", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  v11 = objc_msgSend(v10, "callHistorySearchEnabled");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callProviderManager](self, "callProviderManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "joinConversationRequestForRecentCall:", v6));

    if (v13)
    {
      objc_msgSend(v13, "setOriginatingUIType:", 8);
      if (v7)
        objc_msgSend(v13, "setProvider:", v7);
      v14 = objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      -[NSObject launchAppForJoinRequest:](v14, "launchAppForJoinRequest:", v13);
      goto LABEL_32;
    }
    v37 = sub_10000E6C4();
    v14 = objc_claimAutoreleasedReturnValue(v37);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    *(_DWORD *)buf = 138412290;
    v47 = v6;
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not create join request for recent call: %@", buf, 0xCu);
    goto LABEL_32;
  }
  v39 = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validRemoteParticipantHandles"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v15, "count")));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validRemoteParticipantHandles"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "tuHandle"));
        if (v21)
        {
          v22 = objc_alloc((Class)TUConversationMember);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v21));
          v24 = objc_msgSend(v22, "initWithHandles:", v23);

          objc_msgSend(v13, "addObject:", v24);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v18);
  }

  if (!objc_msgSend(v13, "count"))
  {
    v38 = sub_10000E6C4();
    v14 = objc_claimAutoreleasedReturnValue(v38);
    v6 = v40;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    *(_DWORD *)buf = 138412290;
    v47 = v40;
    goto LABEL_31;
  }
  v14 = objc_msgSend(objc_alloc((Class)TUJoinConversationRequest), "initWithRemoteMembers:", v13);
  v6 = v40;
  -[NSObject setVideo:](v14, "setVideo:", objc_msgSend(v40, "mediaType") == (id)2);
  -[NSObject setVideoEnabled:](v14, "setVideoEnabled:", objc_msgSend(v40, "mediaType") == (id)2);
  -[NSObject setOriginatingUIType:](v14, "setOriginatingUIType:", 8);
  if (v7)
    -[NSObject setProvider:](v14, "setProvider:");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callProviderManager](v39, "callProviderManager"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "faceTimeProvider"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "outgoingLocalParticipantUUID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "senderIdentityForAccountUUID:", v27));

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "handle"));
    -[NSObject setCallerID:](v14, "setCallerID:", v29);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallProviderManager invitationPreferencesForRecentCall](TUCallProviderManager, "invitationPreferencesForRecentCall"));
  -[NSObject setInvitationPreferences:](v14, "setInvitationPreferences:", v30);

  v31 = objc_claimAutoreleasedReturnValue(-[PHRecentsController presentScreenTimeShield](v39, "presentScreenTimeShield"));
  if (!v31)
    goto LABEL_25;
  v32 = (void *)v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "callFilterController"));
  v35 = objc_msgSend(v34, "shouldRestrictJoinConversationRequest:performSynchronously:", v14, 1);

  v6 = v40;
  if (v35)
  {
    v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHRecentsController presentScreenTimeShield](v39, "presentScreenTimeShield"));
    ((void (**)(_QWORD, NSObject *))v36)[2](v36, v14);
  }
  else
  {
LABEL_25:
    v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v36, "launchAppForJoinRequest:", v14);
  }

LABEL_32:
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  void *v6;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController delegateToQueue](self, "delegateToQueue"));
  objc_msgSend(v6, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)notifyDelegatesRecentsController:(id)a3 didUpdateCalls:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  NSObject *v15;
  id *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD block[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v17 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  v8 = objc_msgSend(v7, "phoneRecentsAvatarsEnabled");

  if (v8)
  {
    os_unfair_lock_assert_owner(&self->_accessorLock);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController delegateToQueue](self, "delegateToQueue"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v10)
      goto LABEL_14;
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, "recentsController:didUpdateCalls:") & 1) != 0)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v14));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10002D4FC;
          block[3] = &unk_100089FA8;
          block[4] = v14;
          v21 = v6;
          v22 = v17;
          dispatch_async(v15, block);

          v16 = &v21;
        }
        else
        {
          if ((objc_opt_respondsToSelector(v14, "recentsController:didChangeCalls:") & 1) == 0)
            continue;
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v14));
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10002D50C;
          v18[3] = &unk_100089FA8;
          v18[4] = v14;
          v19[0] = v6;
          v19[1] = self;
          dispatch_async(v15, v18);
          v16 = (id *)v19;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v11)
      {
LABEL_14:

        break;
      }
    }
  }

}

- (void)notifyDelegatesRecentsController:(id)a3 didCompleteFetchingCalls:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  v9 = objc_msgSend(v8, "callHistorySearchEnabled");

  if (v9)
  {
    os_unfair_lock_assert_owner(&self->_accessorLock);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController delegateToQueue](self, "delegateToQueue"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v15, "recentsController:didCompleteFetchingCalls:") & 1) != 0)
          {
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10002D6F4;
            block[3] = &unk_100089FA8;
            block[4] = v15;
            v18 = v6;
            v19 = v7;
            dispatch_async(v16, block);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

  }
}

- (void)notifyDelegatesRecentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController delegateToQueue](self, "delegateToQueue"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "recentsController:didChangeUnreadCallCount:") & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v12));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10002D89C;
          block[3] = &unk_100089FD0;
          block[4] = v12;
          v15 = v6;
          v16 = a4;
          dispatch_async(v13, block);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)notifyDelegatesRecentsControllerDidChangeMessages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController delegateToQueue](self, "delegateToQueue"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "recentsControllerDidChangeMessages:") & 1) != 0)
        {
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v10));
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_10002DA40;
          v12[3] = &unk_100089980;
          v12[4] = v10;
          v13 = v4;
          dispatch_async(v11, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (CNContactFormatter)contactFormatter
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  NSObject *v5;
  CNContactFormatter **p_contactFormatter;
  CNContactFormatter *contactFormatter;
  CNContactFormatter *v8;

  v8 = (CNContactFormatter *)a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  contactFormatter = self->_contactFormatter;
  p_contactFormatter = &self->_contactFormatter;
  if (contactFormatter != v8)
    objc_storeStrong((id *)p_contactFormatter, a3);

}

- (NSNumberFormatter)numberFormatter
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  NSObject *v5;
  NSNumberFormatter **p_numberFormatter;
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v8;

  v8 = (NSNumberFormatter *)a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  numberFormatter = self->_numberFormatter;
  p_numberFormatter = &self->_numberFormatter;
  if (numberFormatter != v8)
    objc_storeStrong((id *)p_numberFormatter, a3);

}

- (void)setMessages:(id)a3
{
  NSArray *v4;
  NSArray *messages;
  id v6;
  NSArray *v7;
  NSArray *v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  if (!-[NSArray isEqualToArray:](self->_messages, "isEqualToArray:", v9))
  {
    if (self->_messages)
    {
      v4 = (NSArray *)objc_msgSend(v9, "copy");
      messages = self->_messages;
      self->_messages = v4;

LABEL_5:
      -[PHRecentsController notifyDelegatesRecentsControllerDidChangeMessages:](self, "notifyDelegatesRecentsControllerDidChangeMessages:", self);
      goto LABEL_6;
    }
    v6 = objc_msgSend(v9, "count");
    v7 = (NSArray *)objc_msgSend(v9, "copy");
    v8 = self->_messages;
    self->_messages = v7;

    if (v6)
      goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock(&self->_accessorLock);

}

- (void)setPreFetchingPredicate:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  void *v6;
  NSPredicate *v7;

  v7 = (NSPredicate *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_preFetchingPredicate != v7)
  {
    objc_storeStrong((id *)&self->_preFetchingPredicate, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
    objc_msgSend(v6, "setPreFetchingPredicate:", v7);

  }
  os_unfair_lock_unlock(p_accessorLock);

}

- (id)contactForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:", v4));
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache", (_QWORD)v18));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));

        if (v14)
        {
          v16 = v6;
          goto LABEL_13;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v8)
        continue;
      break;
    }
  }

  v15 = sub_10000E6C4();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Handle not found in cache: %@", buf, 0xCu);
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "type");
  v8 = sub_10000E6C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)2)
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
      v18 = 138412546;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v18, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
    v13 = TUFormattedPhoneNumber(v12, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (!v14)
    {
LABEL_9:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CALLER"), &stru_10008B240, CFSTR("PHRecents")));

    }
  }
  else
  {
    if (v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
      v18 = 138412290;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "     - handle can't/shouldn't be formatted as a phone number, so using the unmodified destination ID '%@'", (uint8_t *)&v18, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
    if (!v14)
      goto LABEL_9;
  }

  return v14;
}

- (id)fetchContactForContactCardDisplay:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "canExceedUnifyingThreshold"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_10002BFEC;
    v16 = sub_10002BFFC;
    v17 = 0;
    v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E168;
    block[3] = &unk_100089EE0;
    v10 = v4;
    v11 = &v12;
    block[4] = self;
    v6 = v4;
    dispatch_sync(v5, block);

    v7 = (void *)v13[5];
    if (!v7)
      v7 = v6;
    v4 = v7;

    _Block_object_dispose(&v12, 8);
  }
  return v4;
}

- (id)fetchUnifiedContactForID:(id)a3 withDescriptors:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactStore](self, "contactStore"));
  v10 = sub_10000E6C4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v6;
    v35 = 2112;
    v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetching unified contact for handle %@ using contact store %@", buf, 0x16u);
  }

  v12 = v7;
  if (!v7)
  {
    if (qword_1000A3920 != -1)
      dispatch_once(&qword_1000A3920, &stru_10008A038);
    v12 = (id)qword_1000A3918;
  }
  v32 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unifiedContactWithIdentifier:keysToFetch:error:", v6, v12, &v32));
  v14 = v32;
  if (!v7)

  v15 = objc_alloc((Class)TUOptionalObject);
  if (v14)
  {
    v16 = objc_msgSend(v15, "initWithValue:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v6);

    v18 = sub_10000E6C4();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100055368((uint64_t)v6, v19, v20, v21, v22, v23, v24, v25);

    v26 = 0;
  }
  else
  {
    v27 = objc_msgSend(v15, "initWithValue:", v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController contactCache](self, "contactCache"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v6);

    v29 = sub_10000E6C4();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v13;
      v35 = 2112;
      v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Found unified contact %@ for contact handle %@", buf, 0x16u);
    }

    v26 = v13;
  }

  return v26;
}

- (BOOL)canLoadOlderRecentCalls
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  if (objc_msgSend(v3, "increaseCallHistoryEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
    v5 = objc_msgSend(v4, "canLoadOlderRecentCalls");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)messageCacheForMessages:(id)a3 recentCalls:(id)a4
{
  id v4;
  id v5;

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

- (void)recentCallsWillShow
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
  objc_msgSend(v2, "boostQualityOfService");

}

- (id)metadataItemsForRecentCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:](TUMetadataDestinationID, "metadataDestinationIDsForCHRecentCall:", v4));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController metadataCache](self, "metadataCache"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadataForDestinationID:", v11));

        objc_msgSend(v5, "addObject:", v13);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  v14 = objc_msgSend(v5, "copy");

  return v14;
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  PHRecentsController *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EACC;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  PHRecentsController *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ECE8;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  PHRecentsController *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EE3C;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  PHRecentsController *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = sub_10000E6C4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class(self);
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v15 = 138412802;
      v16 = v10;
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", (uint8_t *)&v15, 0x20u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v14 = v13;
    if (v13)
      -[PHRecentsController setUnreadCallCount:](self, "setUnreadCallCount:", objc_msgSend(v13, "unreadCallCount"));

  }
}

- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  PHRecentsController *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController featureFlags](self, "featureFlags"));
  v6 = objc_msgSend(v5, "phoneRecentsAvatarsEnabled");

  if ((v6 & 1) == 0)
  {
    v7 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class(self);
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);

    }
    v12 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002F20C;
    block[3] = &unk_1000898B8;
    block[4] = self;
    dispatch_async(v12, block);

  }
}

- (void)handleVoicemailsChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  PHRecentsController *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F538;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  PHRecentsController *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F68C;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  PHRecentsController *v14;
  __int16 v15;
  id v16;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PHRecentsController serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_10000E6C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412802;
    v12 = (id)objc_opt_class(self);
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    v8 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling providersChangedForProviderManager %@", (uint8_t *)&v11, 0x20u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController recentCalls](self, "recentCalls"));
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController itemCache](self, "itemCache"));
    objc_msgSend(v10, "removeAllObjects");

    -[PHRecentsController populateItemCacheForRecentCalls:](self, "populateItemCacheForRecentCalls:", v9);
    os_unfair_lock_lock(&self->_accessorLock);
    -[PHRecentsController notifyDelegatesRecentsController:didChangeCalls:](self, "notifyDelegatesRecentsController:didChangeCalls:", self, v9);
    os_unfair_lock_unlock(&self->_accessorLock);
  }

}

- (id)subtitleForRecentEmergencyCall:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "callOccurrences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController localizedSubtitleForRecentEmergencyCall:](self, "localizedSubtitleForRecentEmergencyCall:", v4));

  return v5;
}

- (id)localizedSubtitleForRecentEmergencyCall:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  BOOL v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v3)
    goto LABEL_33;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)v27;
  v8 = kCHCallOccurrenceEmergencyVideosCountKey;
  v9 = kCHCallOccurrenceEmergencyImagesCountKey;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v27 != v7)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));
      v13 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        v6 += (unint64_t)objc_msgSend(v12, "integerValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
      v15 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        v5 += (unint64_t)objc_msgSend(v14, "integerValue");

    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v4);
  if (v6 && !v5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = v16;
    v18 = CFSTR("Shared videos coalesced");
    v19 = CFSTR("Shared video coalesced");
    v20 = v6 == 1;
    goto LABEL_18;
  }
  if (v6 || !v5)
  {
    if (v6 == 1 && v5 == 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v21 = CFSTR("Shared video and photo coalesced");
      goto LABEL_34;
    }
    if (v6 == 1 && v5 >= 2)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v21 = CFSTR("Shared video and photos coalesced");
      goto LABEL_34;
    }
    if (v6 >= 2 && v5 == 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v21 = CFSTR("Shared videos and photo coalesced");
      goto LABEL_34;
    }
    if (v6 >= 2 && v5 >= 2)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v21 = CFSTR("Shared videos and photos coalesced");
      goto LABEL_34;
    }
LABEL_33:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = v16;
    v21 = CFSTR("Emergency call");
    goto LABEL_34;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = v16;
  v18 = CFSTR("Shared photos coalesced");
  v19 = CFSTR("Shared photo coalesced");
  v20 = v5 == 1;
LABEL_18:
  if (v20)
    v21 = v19;
  else
    v21 = v18;
LABEL_34:
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v21, &stru_10008B240, 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22));

  return v23;
}

- (id)unknownLabel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FC7C;
  block[3] = &unk_1000898B8;
  block[4] = self;
  if (qword_1000A3900 != -1)
    dispatch_once(&qword_1000A3900, block);
  return (id)qword_1000A38F8;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (NSDictionary)messageCache
{
  return self->_messageCache;
}

- (void)setMessageCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)messages
{
  return self->_messages;
}

- (MPVoicemailController)voicemailController
{
  return self->_voicemailController;
}

- (NSPredicate)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (id)presentScreenTimeShield
{
  return self->_presentScreenTimeShield;
}

- (void)setPresentScreenTimeShield:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (int)callDirectoryManagerIdentificationEntriesChangedNotificationToken
{
  return self->_callDirectoryManagerIdentificationEntriesChangedNotificationToken;
}

- (void)setCallDirectoryManagerIdentificationEntriesChangedNotificationToken:(int)a3
{
  self->_callDirectoryManagerIdentificationEntriesChangedNotificationToken = a3;
}

- (TUSubtitleProvider)subtitleProvider
{
  return self->_subtitleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleProvider, 0);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->_presentScreenTimeShield, 0);
  objc_storeStrong((id *)&self->_preFetchingPredicate, 0);
  objc_storeStrong((id *)&self->_voicemailController, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_messageCache, 0);
  objc_storeStrong((id *)&self->_localizedSubtitleCache, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_callProviderCache, 0);
  objc_storeStrong((id *)&self->_callHistoryController, 0);
}

- (unint64_t)callHistoryControllerOptions
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
  v3 = objc_msgSend(v2, "options");

  return (unint64_t)v3;
}

- (unint64_t)callHistoryControllerCoalescingStrategy
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
  v3 = objc_msgSend(v2, "coalescingStrategy");

  return (unint64_t)v3;
}

- (void)cancelSearchFetchOperations
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentsController callHistoryController](self, "callHistoryController"));
  objc_msgSend(v2, "cancelSearchFetchOperations");

}

@end
