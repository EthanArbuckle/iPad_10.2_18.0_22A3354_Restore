@implementation CKKSZoneChangeFetcher

- (CKKSZoneChangeFetcher)initWithContainer:(id)a3 fetchClass:(Class)a4 reachabilityTracker:(id)a5 altDSID:(id)a6 sendMetric:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  CKKSZoneChangeFetcher *v16;
  CKKSZoneChangeFetcher *v17;
  NSMutableSet *v18;
  NSMutableSet *currentFetchReasons;
  NSMutableSet *v20;
  NSMutableSet *apnsPushes;
  uint64_t v22;
  NSMapTable *clientMap;
  NSString *name;
  const char *v25;
  dispatch_queue_attr_t v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *queue;
  NSOperationQueue *v30;
  NSOperationQueue *operationQueue;
  uint64_t v32;
  CKKSZoneChangeFetchDependencyOperation *successfulFetchDependency;
  uint64_t v34;
  NSMutableSet *inflightFetchDependencies;
  CKKSZoneChangeFetchDependencyOperation *inflightFetchDependency;
  int v37;
  int v38;
  CKKSNearFutureScheduler *v39;
  uint64_t v40;
  uint64_t v41;
  CKKSNearFutureScheduler *v42;
  CKKSNearFutureScheduler *fetchScheduler;
  _QWORD v45[4];
  id v46;
  id location;
  objc_super v48;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v48.receiver = self;
  v48.super_class = (Class)CKKSZoneChangeFetcher;
  v16 = -[CKKSZoneChangeFetcher init](&v48, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_container, a3);
    objc_storeStrong((id *)&v17->_fetchRecordZoneChangesOperationClass, a4);
    objc_storeStrong((id *)&v17->_reachabilityTracker, a5);
    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentFetchReasons = v17->_currentFetchReasons;
    v17->_currentFetchReasons = v18;

    v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    apnsPushes = v17->_apnsPushes;
    v17->_apnsPushes = v20;

    v22 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    clientMap = v17->_clientMap;
    v17->_clientMap = (NSMapTable *)v22;

    name = v17->_name;
    v17->_name = (NSString *)CFSTR("zone-change-fetcher");

    v25 = -[NSString UTF8String](v17->_name, "UTF8String");
    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = dispatch_queue_create(v25, v27);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v28;

    v30 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = v30;

    v32 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher createSuccessfulFetchDependency](v17, "createSuccessfulFetchDependency"));
    successfulFetchDependency = v17->_successfulFetchDependency;
    v17->_successfulFetchDependency = (CKKSZoneChangeFetchDependencyOperation *)v32;

    v34 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    inflightFetchDependencies = v17->_inflightFetchDependencies;
    v17->_inflightFetchDependencies = (NSMutableSet *)v34;

    inflightFetchDependency = v17->_inflightFetchDependency;
    v17->_inflightFetchDependency = 0;

    v17->_newRequests = 0;
    objc_storeStrong((id *)&v17->_altDSID, a6);
    v17->_sendMetric = a7;
    if (qword_100341048 != -1)
      dispatch_once(&qword_100341048, &stru_1002DCC20);
    v37 = byte_100341050;
    v38 = byte_100341050;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v17);
    v39 = [CKKSNearFutureScheduler alloc];
    if (v38)
      v40 = 6000000000;
    else
      v40 = 120000000000;
    if (v37)
      v41 = 100000000;
    else
      v41 = 2000000000;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1001B97AC;
    v45[3] = &unk_1002EB598;
    objc_copyWeak(&v46, &location);
    v42 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v39, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("zone-change-fetch-scheduler"), v41, v40, 0, 1000, v45, 2.0);
    fetchScheduler = v17->_fetchScheduler;
    v17->_fetchScheduler = v42;

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher fetchScheduler](self, "fetchScheduler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextFireTime"));

  if (v4)
  {
    v5 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher name](self, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSZoneChangeFetcher(%@): next fetch at %@"), v6, v7));

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSZoneChangeFetcher(%@): no pending fetches"), v5));
  }

  return (NSString *)v8;
}

- (void)registerClient:(id)a3 zoneID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap"));
  objc_msgSend(v8, "setObject:forKey:", v9, v6);

  objc_sync_exit(v7);
}

- (id)strongClientMap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap"));
  objc_sync_enter(v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyEnumerator"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

        if (v12)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)requestSuccessfulFetch:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher requestSuccessfulFetchForManyReasons:](self, "requestSuccessfulFetchForManyReasons:", v4));

  return v5;
}

- (void)notifyZoneChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  CKKSZoneChangeFetcher *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_10000BDF4(CFSTR("ckkspush"), 0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received a zone change notification for %@ %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = -[CKKSZoneChangeFetcher requestFetchDueToAPNS:](self, "requestFetchDueToAPNS:", v4);
}

- (id)requestFetchDueToAPNS:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint8_t v18[8];
  _QWORD block[4];
  id v20;
  CKKSZoneChangeFetcher *v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _BYTE v31[128];

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher strongClientMap](self, "strongClientMap"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
        if (objc_msgSend(v11, "zoneIsReadyForFetching:", v10))
        {
          *((_BYTE *)v28 + 24) = 0;

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v12 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B9500;
  block[3] = &unk_1002EAC48;
  v13 = v4;
  v20 = v13;
  v21 = self;
  v22 = &v27;
  dispatch_sync(v12, block);

  if (*((_BYTE *)v28 + 24))
  {
    v14 = sub_10000BDF4(CFSTR("ckksfetch"), 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping fetching size no zone is ready", v18, 2u);
    }
    v16 = 0;
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("apns")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher requestSuccessfulFetchForManyReasons:](self, "requestSuccessfulFetchForManyReasons:", v15));
  }

  _Block_object_dispose(&v27, 8);
  return v16;
}

- (id)requestSuccessfulFetchForManyReasons:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1001B93F8;
  v16 = sub_1001B9408;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B947C;
  block[3] = &unk_1002EAC48;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)inflightFetch
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1001B93F8;
  v11 = sub_1001B9408;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001B9410;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)maybeCreateNewFetchOnQueue
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[CKKSZoneChangeFetcher halted](self, "halted"))
  {
    v4 = sub_10000BDF4(CFSTR("ckksfetcher"), 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Halted; not starting a new fetch", buf, 2u);
    }

    return;
  }
  if (!-[CKKSZoneChangeFetcher newRequests](self, "newRequests"))
    return;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
  if (v10)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
    if ((-[NSObject isFinished](v3, "isFinished") & 1) == 0)
    {

      return;
    }
  }
  v6 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  if (!v6)
  {
    if (v10)
    {

    }
    goto LABEL_16;
  }
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  v9 = objc_msgSend(v8, "isFinished");

  if (v10)
  {

  }
  if ((v9 & 1) != 0)
LABEL_16:
    -[CKKSZoneChangeFetcher _onqueueCreateNewFetch](self, "_onqueueCreateNewFetch");
}

- (void)maybeCreateNewFetch
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B93F0;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_onqueueCreateNewFetch
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  CKKSFetchAllRecordZoneChangesOperation *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  CKKSFetchAllRecordZoneChangesOperation *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  CKKSFetchAllRecordZoneChangesOperation *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  CKKSFetchAllRecordZoneChangesOperation *v43;
  id v44;
  id v45;
  id v46;
  id location;
  uint8_t buf[4];
  void *v49;
  void *v50;

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher successfulFetchDependency](self, "successfulFetchDependency"));
  -[CKKSZoneChangeFetcher setInflightFetchDependency:](self, "setInflightFetchDependency:", v41);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher inflightFetchDependencies](self, "inflightFetchDependencies"));
  objc_msgSend(v4, "addObject:", v41);

  -[CKKSZoneChangeFetcher setNewRequests:](self, "setNewRequests:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher createSuccessfulFetchDependency](self, "createSuccessfulFetchDependency"));
  -[CKKSZoneChangeFetcher setSuccessfulFetchDependency:](self, "setSuccessfulFetchDependency:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetchReasons](self, "currentFetchReasons"));
  v7 = objc_alloc_init((Class)NSMutableSet);
  -[CKKSZoneChangeFetcher setCurrentFetchReasons:](self, "setCurrentFetchReasons:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("description"), 1));
  v50 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingDescriptors:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(",")));

  v12 = sub_10000BDF4(CFSTR("ckksfetcher"), 0);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting a new fetch, reasons: %@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher apnsPushes](self, "apnsPushes"));
  v15 = objc_alloc_init((Class)NSMutableSet);
  -[CKKSZoneChangeFetcher setApnsPushes:](self, "setApnsPushes:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](CKOperationGroup, "CKKSGroupWithName:", v11));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher strongClientMap](self, "strongClientMap"));
  if (!objc_msgSend(v17, "count"))
  {
    v18 = sub_10000BDF4(CFSTR("ckksfetcher"), 0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No clients", buf, 2u);
    }

  }
  v20 = [CKKSFetchAllRecordZoneChangesOperation alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher container](self, "container"));
  v22 = -[CKKSZoneChangeFetcher fetchRecordZoneChangesOperationClass](self, "fetchRecordZoneChangesOperationClass");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher altDSID](self, "altDSID"));
  LOBYTE(v40) = -[CKKSZoneChangeFetcher sendMetric](self, "sendMetric");
  v24 = -[CKKSFetchAllRecordZoneChangesOperation initWithContainer:fetchClass:clientMap:fetchReasons:apnsPushes:forceResync:ckoperationGroup:altDSID:sendMetric:](v20, "initWithContainer:fetchClass:clientMap:fetchReasons:apnsPushes:forceResync:ckoperationGroup:altDSID:sendMetric:", v21, v22, v17, v6, v14, 0, v16, v23, v40);

  if (objc_msgSend(v6, "containsObject:", CFSTR("network")))
  {
    v25 = sub_10000BDF4(CFSTR("ckksfetcher"), 0);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "blocking fetch on network reachability", buf, 2u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher reachabilityTracker](self, "reachabilityTracker"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "reachabilityDependency"));
    -[CKKSFetchAllRecordZoneChangesOperation addNullableDependency:](v24, "addNullableDependency:", v28);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher holdOperation](self, "holdOperation"));
  -[CKKSFetchAllRecordZoneChangesOperation addNullableDependency:](v24, "addNullableDependency:", v29);

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1001B8D20;
  v42[3] = &unk_1002EAC98;
  objc_copyWeak(&v46, &location);
  v30 = v24;
  v43 = v30;
  v31 = v6;
  v44 = v31;
  v32 = v14;
  v45 = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation operationWithBlock:](CKKSResultOperation, "operationWithBlock:", v42));
  -[CKKSZoneChangeFetcher setCurrentProcessResult:](self, "setCurrentProcessResult:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  objc_msgSend(v34, "setName:", CFSTR("zone-change-fetcher-worker"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  objc_msgSend(v35, "addDependency:", v30);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher operationQueue](self, "operationQueue"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  objc_msgSend(v36, "addOperation:", v37);

  -[CKKSZoneChangeFetcher setCurrentFetch:](self, "setCurrentFetch:", v30);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher operationQueue](self, "operationQueue"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
  objc_msgSend(v38, "addOperation:", v39);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

- (id)createSuccessfulFetchDependency
{
  CKKSZoneChangeFetchDependencyOperation *v3;

  v3 = objc_alloc_init(CKKSZoneChangeFetchDependencyOperation);
  -[CKKSZoneChangeFetchDependencyOperation setName:](v3, "setName:", CFSTR("successful-fetch-dependency"));
  -[CKKSResultOperation setDescriptionErrorCode:](v3, "setDescriptionErrorCode:", 2);
  -[CKKSZoneChangeFetchDependencyOperation setOwner:](v3, "setOwner:", self);
  return v3;
}

- (void)holdFetchesUntil:(id)a3
{
  -[CKKSZoneChangeFetcher setHoldOperation:](self, "setHoldOperation:", a3);
}

- (void)cancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher fetchScheduler](self, "fetchScheduler"));
  objc_msgSend(v2, "cancel");

}

- (void)halt
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher fetchScheduler](self, "fetchScheduler"));
  objc_msgSend(v3, "cancel");

  v4 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B8D14;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v4, block);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
  objc_msgSend(v5, "cancel");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher holdOperation](self, "holdOperation"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher holdOperation](self, "holdOperation"));
    objc_msgSend(v7, "removeDependency:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
  objc_msgSend(v9, "waitUntilFinished");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  objc_msgSend(v10, "waitUntilFinished");

}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 24, 1);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReachabilityTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSError)lastCKFetchError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastCKFetchError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)sendMetric
{
  return self->_sendMetric;
}

- (void)setSendMetric:(BOOL)a3
{
  self->_sendMetric = a3;
}

- (CKKSNearFutureScheduler)fetchScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFetchScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (NSMapTable)clientMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClientMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CKKSFetchAllRecordZoneChangesOperation)currentFetch
{
  return (CKKSFetchAllRecordZoneChangesOperation *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CKKSResultOperation)currentProcessResult
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentProcessResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableSet)currentFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentFetchReasons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableSet)apnsPushes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setApnsPushes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)newRequests
{
  return self->_newRequests;
}

- (void)setNewRequests:(BOOL)a3
{
  self->_newRequests = a3;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (CKKSZoneChangeFetchDependencyOperation)successfulFetchDependency
{
  return (CKKSZoneChangeFetchDependencyOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSuccessfulFetchDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableSet)inflightFetchDependencies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInflightFetchDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CKKSZoneChangeFetchDependencyOperation)inflightFetchDependency
{
  return (CKKSZoneChangeFetchDependencyOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInflightFetchDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CKKSResultOperation)holdOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setHoldOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdOperation, 0);
  objc_storeStrong((id *)&self->_inflightFetchDependency, 0);
  objc_storeStrong((id *)&self->_inflightFetchDependencies, 0);
  objc_storeStrong((id *)&self->_successfulFetchDependency, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_apnsPushes, 0);
  objc_storeStrong((id *)&self->_currentFetchReasons, 0);
  objc_storeStrong((id *)&self->_currentProcessResult, 0);
  objc_storeStrong((id *)&self->_currentFetch, 0);
  objc_storeStrong((id *)&self->_clientMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fetchScheduler, 0);
  objc_storeStrong((id *)&self->_lastCKFetchError, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_fetchRecordZoneChangesOperationClass, 0);
}

@end
