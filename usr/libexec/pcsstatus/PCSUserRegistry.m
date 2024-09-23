@implementation PCSUserRegistry

- (PCSUserRegistry)initWithBackup:(id)a3
{
  id v5;
  PCSUserRegistry *v6;
  NSOperationQueue *v7;
  NSOperationQueue *mainOperationQueue;
  uint64_t v9;
  CKContainer *container;
  CKRecordZoneID *v11;
  CKRecordZoneID *recordZoneID;
  CKRecordZoneID *v13;
  CKRecordZoneID *mobileBackupRecordZoneID;
  uint64_t v15;
  PCSAccountsModel *accounts;
  os_log_t v17;
  OS_os_log *oslog;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  PCSDelayedAction *v21;
  PCSDelayedAction *resyncRegistryAction;
  PCSDelayedAction *v23;
  PCSDelayedAction *v24;
  PCSDelayedAction *subscribeAction;
  PCSDelayedAction *v26;
  unsigned __int8 v27;
  id v28;
  NSObject *v29;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;
  uint8_t buf[4];
  id v39;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PCSUserRegistry;
  v6 = -[PCSUserRegistry init](&v37, "init");
  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    mainOperationQueue = v6->_mainOperationQueue;
    v6->_mainOperationQueue = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", off_10001D888));
    container = v6->_container;
    v6->_container = (CKContainer *)v9;

    v11 = (CKRecordZoneID *)objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("PCSUserRegistry"), CKCurrentUserDefaultName);
    recordZoneID = v6->_recordZoneID;
    v6->_recordZoneID = v11;

    v13 = (CKRecordZoneID *)objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("PCSUserRegistryMobileBackup"), CKCurrentUserDefaultName);
    mobileBackupRecordZoneID = v6->_mobileBackupRecordZoneID;
    v6->_mobileBackupRecordZoneID = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[PCSAccountsModel defaultAccountsModel](PCSAccountsModel, "defaultAccountsModel"));
    accounts = v6->_accounts;
    v6->_accounts = (PCSAccountsModel *)v15;

    v17 = os_log_create("com.apple.ProtectedCloudStorage", "UserRegistry");
    oslog = v6->_oslog;
    v6->_oslog = (OS_os_log *)v17;

    v19 = dispatch_queue_create("PCS-APS", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v6->_mobileBackup, a3);
    v21 = -[PCSDelayedAction initWithLabel:delay:operationQueue:]([PCSDelayedAction alloc], "initWithLabel:delay:operationQueue:", CFSTR("resyncRegistryAction"), 300, v6->_mainOperationQueue);
    resyncRegistryAction = v6->_resyncRegistryAction;
    v6->_resyncRegistryAction = v21;

    v23 = v6->_resyncRegistryAction;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000073F0;
    v34[3] = &unk_100018960;
    objc_copyWeak(&v35, &location);
    -[PCSDelayedAction setAction:](v23, "setAction:", v34);
    -[PCSDelayedAction setHoldTransaction:](v6->_resyncRegistryAction, "setHoldTransaction:", 0);
    -[PCSDelayedAction run](v6->_resyncRegistryAction, "run");
    v24 = -[PCSDelayedAction initWithLabel:delay:operationQueue:]([PCSDelayedAction alloc], "initWithLabel:delay:operationQueue:", CFSTR("subscribeAction"), 300, v6->_mainOperationQueue);
    subscribeAction = v6->_subscribeAction;
    v6->_subscribeAction = v24;

    v26 = v6->_subscribeAction;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100007424;
    v32[3] = &unk_100018960;
    objc_copyWeak(&v33, &location);
    -[PCSDelayedAction setAction:](v26, "setAction:", v32);
    -[PCSDelayedAction setHoldTransaction:](v6->_subscribeAction, "setHoldTransaction:", 0);
    -[PCSDelayedAction run](v6->_subscribeAction, "run");
    v31 = 0;
    v27 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](v6, "ensureUserRegistryDbLoaded:", &v31);
    v28 = v31;
    if ((v27 & 1) == 0)
    {
      v29 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](v6, "oslog"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to initalize UserRegistryDB: %@", buf, 0xCu);
      }

    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (BOOL)ensureUserRegistryDbLoaded:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[8];
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry userdb](self, "userdb"));

  if (v5)
    return 1;
  v6 = objc_alloc((Class)UserRegistryDB);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSAccountsModel dsid](self->_accounts, "dsid"));
  v8 = objc_msgSend(v6, "initWithDSID:", v7);
  -[PCSUserRegistry setUserdb:](self, "setUserdb:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry userdb](self, "userdb"));
  if (v9)
    return 1;
  v11 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to initalize UserRegistryDB", v14, 2u);
  }

  if (a3)
  {
    v12 = kPCSErrorDomain;
    v15 = NSLocalizedDescriptionKey;
    v16 = CFSTR("Failed to initalize UserRegistryDB");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, 138, v13));

  }
  return 0;
}

- (void)setupStatCache
{
  -[PCSUserRegistry cacheUserRegistryStats](self, "cacheUserRegistryStats");
}

- (void)flushStats
{
  void *v3;
  PCSUserRegistry *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry stats](self, "stats"));

  if (v3)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!-[PCSUserRegistry stats_dirty](v4, "stats_dirty"))
    {
      -[PCSUserRegistry setStats_dirty:](v4, "setStats_dirty:", 1);
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x3032000000;
      v8[3] = sub_100007740;
      v8[4] = sub_100007750;
      v9 = (id)os_transaction_create("flushStats");
      v5 = dispatch_time(0, 10000000000);
      v6 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](v4, "queue"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100007758;
      v7[3] = &unk_100018988;
      v7[4] = v4;
      v7[5] = v8;
      dispatch_after(v5, v6, v7);

      _Block_object_dispose(v8, 8);
    }
    objc_sync_exit(v4);

  }
}

- (id)defaultCKConfiguration
{
  if (qword_10001D958 != -1)
    dispatch_once(&qword_10001D958, &stru_1000189C8);
  return (id)qword_10001D950;
}

- (void)checkAccountStatus:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry container](self, "container", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007890;
  v5[3] = &unk_1000189F0;
  v5[4] = self;
  objc_msgSend(v4, "accountStatusWithCompletionHandler:", v5);

}

- (BOOL)setupCloudKitSyncing
{
  BOOL v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;

  v7 = 0;
  v3 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v7);
  v4 = v7;
  if (v3)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "checkAccountStatus:", NSUbiquityIdentityDidChangeNotification, 0);
    -[PCSUserRegistry checkAccountStatus:](self, "checkAccountStatus:", 0);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setupCloudKitSyncing: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
  }

  return v3;
}

- (void)registerCloudKitNotifications
{
  void *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007C3C;
  block[3] = &unk_100018A40;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  if (qword_10001D968 != -1)
    dispatch_once(&qword_10001D968, block);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry subscribeAction](self, "subscribeAction"));
  objc_msgSend(v3, "trigger");

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupSubscriptions
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[8];
  _QWORD block[6];
  id location;
  id v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v22 = 0;
  v3 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v22);
  v4 = v22;
  if ((v3 & 1) != 0)
  {
    objc_initWeak(&location, self);
    *(_QWORD *)&v24 = 0;
    *((_QWORD *)&v24 + 1) = &v24;
    v25 = 0x3032000000;
    v26 = sub_100007740;
    v27 = sub_100007750;
    v28 = 0;
    v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000081E0;
    block[3] = &unk_100018A68;
    block[4] = self;
    block[5] = &v24;
    dispatch_sync(v5, block);

    if (!*(_QWORD *)(*((_QWORD *)&v24 + 1) + 40))
    {
      v6 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "attempting to subscribe to CK zone changes", buf, 2u);
      }

      v7 = objc_msgSend(objc_alloc((Class)CKDatabaseSubscription), "initWithSubscriptionID:", CFSTR("PCSUserRegistrySubscription"));
      v8 = objc_alloc_init((Class)CKNotificationInfo);
      objc_msgSend(v7, "setNotificationInfo:", v8);
      v9 = objc_alloc((Class)CKModifySubscriptionsOperation);
      v23 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      v11 = objc_msgSend(v9, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v10, 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry cloudKitRateLimitedOp](self, "cloudKitRateLimitedOp"));
      if (v12)
      {
        v13 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setupSubscriptions: rate-limited by CloudKit", buf, 2u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry cloudKitRateLimitedOp](self, "cloudKitRateLimitedOp"));
        objc_msgSend(v11, "addDependency:", v14);

      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000823C;
      v17[3] = &unk_100018A90;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v11, "setModifySubscriptionsCompletionBlock:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry defaultCKConfiguration](self, "defaultCKConfiguration"));
      objc_msgSend(v11, "setConfiguration:", v15);

      -[PCSUserRegistry addDatabaseOperation:](self, "addDatabaseOperation:", v11);
      objc_destroyWeak(&v18);

    }
    _Block_object_dispose(&v24, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v24) = 138412290;
      *(_QWORD *)((char *)&v24 + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "setupSubscriptions: Failed to initalize UserRegistryDB: %@", (uint8_t *)&v24, 0xCu);
    }

  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  id v12;

  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didReceiveToken: %@, triggering syncing", (uint8_t *)&v11, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry stats](self, "stats"));
  objc_msgSend(v9, "setPushNotifications:", (char *)objc_msgSend(v9, "pushNotifications") + 1);

  -[PCSUserRegistry flushStats](self, "flushStats");
  v10 = -[PCSUserRegistry syncUserRegistry](self, "syncUserRegistry");

}

- (void)resyncDatabase:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000869C;
  block[3] = &unk_100018938;
  block[4] = self;
  dispatch_sync(v5, block);

  -[PCSUserRegistry clearCloudKitCache](self, "clearCloudKitCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry stats](self, "stats"));
  objc_msgSend(v6, "setZoneReset:", (char *)objc_msgSend(v6, "zoneReset") + 1);

  -[PCSUserRegistry flushStats](self, "flushStats");
  v7 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008700;
  v9[3] = &unk_100018AB8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

- (id)fetchAllChanges:(id)a3
{
  id v4;
  unsigned __int8 v5;
  PCSRegistryOperation *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  PCSRegistryOperation *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  id v21;
  _QWORD v22[4];
  PCSRegistryOperation *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;

  v4 = a3;
  v31 = 0;
  v5 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v31);
  v21 = v31;
  if ((v5 & 1) != 0)
  {
    v6 = objc_alloc_init(PCSRegistryOperation);
    v7 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry getServerChangeToken:](self, "getServerChangeToken:", CFSTR("MBserverChangeToken")));
    objc_msgSend(v7, "setPreviousServerChangeToken:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previousServerChangeToken"));
      *(_DWORD *)buf = 138412290;
      v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching changes after change token %@", buf, 0xCu);

    }
    v11 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("PCSUserRegistryMobileBackup"), CKCurrentUserDefaultName);
    v33 = v11;
    v34 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v12 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
    v32 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    v14 = objc_msgSend(v12, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v13, v20);

    objc_msgSend(v14, "setFetchAllChanges:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry defaultCKConfiguration](self, "defaultCKConfiguration"));
    objc_msgSend(v14, "setConfiguration:", v15);

    if (v4)
      objc_msgSend(v14, "addDependency:", v4);
    objc_initWeak((id *)buf, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100008CA8;
    v29[3] = &unk_100018AE0;
    objc_copyWeak(&v30, (id *)buf);
    objc_msgSend(v14, "setRecordWasChangedBlock:", v29);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100008EE0;
    v27[3] = &unk_100018B08;
    objc_copyWeak(&v28, (id *)buf);
    objc_msgSend(v14, "setRecordWithIDWasDeletedBlock:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100009078;
    v25[3] = &unk_100018B30;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v14, "setRecordZoneFetchCompletionBlock:", v25);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100009280;
    v22[3] = &unk_100018B58;
    objc_copyWeak(&v24, (id *)buf);
    v16 = v6;
    v23 = v16;
    objc_msgSend(v14, "setFetchRecordZoneChangesCompletionBlock:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry privateDatabase](self, "privateDatabase"));
    objc_msgSend(v17, "addOperation:", v14);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v18 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "fetchAllChanges: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }

    v16 = objc_alloc_init(PCSRegistryOperation);
    -[PCSRegistryOperation setError:](v16, "setError:", v21);
    if (v4)
      -[PCSRegistryOperation addDependency:](v16, "addDependency:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry mainOperationQueue](self, "mainOperationQueue"));
    objc_msgSend(v7, "addOperation:", v16);
  }

  return v16;
}

- (id)syncUserRegistry
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  PCSRegistryOperation *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[6];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v13 = 0;
  v3 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v13);
  v4 = v13;
  if ((v3 & 1) != 0)
  {
    *(_QWORD *)&v16 = 0;
    *((_QWORD *)&v16 + 1) = &v16;
    v17 = 0x3032000000;
    v18 = sub_100007740;
    v19 = sub_100007750;
    v20 = 0;
    v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000096C0;
    block[3] = &unk_100018988;
    block[4] = self;
    block[5] = &v16;
    dispatch_sync(v5, block);

    v6 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 40);
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Returning pending syncing operation: %@", buf, 0xCu);
    }

    v8 = (PCSRegistryOperation *)*(id *)(*((_QWORD *)&v16 + 1) + 40);
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v16) = 138412290;
      *(_QWORD *)((char *)&v16 + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "syncUserRegistry: Failed to initalize UserRegistryDB: %@", (uint8_t *)&v16, 0xCu);
    }

    v8 = objc_alloc_init(PCSRegistryOperation);
    -[PCSRegistryOperation setError:](v8, "setError:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry mainOperationQueue](self, "mainOperationQueue"));
    objc_msgSend(v10, "addOperation:", v8);

  }
  return v8;
}

- (id)createPendingSyncOperation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  PCSRegistryOperation *v7;
  PCSRegistryOperation *v8;
  PCSRegistryOperation *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  PCSRegistryOperation *v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  PCSRegistryOperation *v19;
  uint64_t *v20;
  id v21;
  id v22;
  BOOL v23;
  id from;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id location;
  uint8_t buf[4];
  id v33;

  v4 = a3;
  objc_initWeak(&location, self);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100007740;
  v29 = sub_100007750;
  v30 = 0;
  if (!v4)
  {
    v5 = os_transaction_create("clearPendingVariables");
    v6 = (void *)v26[5];
    v26[5] = v5;

  }
  v7 = objc_alloc_init(PCSRegistryOperation);
  if (v4)
    v8 = (PCSRegistryOperation *)v4;
  else
    v8 = objc_alloc_init(PCSRegistryOperation);
  v9 = v8;
  v10 = -[PCSRegistryOperationPair init:finish:]([PCSRegistryOperationPair alloc], "init:finish:", v7, v8);
  objc_initWeak(&from, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry cloudKitRateLimitedOp](self, "cloudKitRateLimitedOp"));

  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "rate-limited by CloudKit", buf, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry cloudKitRateLimitedOp](self, "cloudKitRateLimitedOp"));
    -[PCSRegistryOperation addDependency:](v7, "addDependency:", v13);

  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100009C78;
  v18[3] = &unk_100018BF8;
  v14 = v9;
  v19 = v14;
  objc_copyWeak(&v21, &from);
  objc_copyWeak(&v22, &location);
  v23 = v4 == 0;
  v20 = &v25;
  -[PCSRegistryOperation addExecutionBlock:](v7, "addExecutionBlock:", v18);
  v15 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created new pending syncing operation: %@", buf, 0xCu);
  }

  v16 = v10;
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&from);
  _Block_object_dispose(&v25, 8);

  objc_destroyWeak(&location);
  return v16;
}

- (void)saveRecord:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  __CFString *v13;
  _QWORD block[5];
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v4 = a3;
  v18 = 0;
  v5 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v18);
  v6 = v18;
  if ((v5 & 1) != 0)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("record"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("URKey"));

    if (v9)
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("publicKey")));
    else
      v10 = &stru_100018FE8;
    v12 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B24C;
    block[3] = &unk_100018C20;
    block[4] = self;
    v15 = v4;
    v16 = v7;
    v17 = v10;
    v13 = v10;
    v11 = v7;
    dispatch_sync(v12, block);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "saveRecord: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
  }

}

- (void)saveServerChangeToken:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v8 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v16);
  v9 = v16;
  if ((v8 & 1) != 0)
  {
    v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v10, "encodeObject:forKey:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000B468;
    v13[3] = &unk_100018C48;
    v13[4] = self;
    v14 = v7;
    v15 = v10;
    v12 = v10;
    dispatch_sync(v11, v13);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "saveRecord: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
  }

}

- (void)_onqueueDeleteServerChangeToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry userdb](self, "userdb"));
  objc_msgSend(v6, "deleteRecordID:", v4);

}

- (id)getServerChangeToken:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PCSUserRegistry *v19;
  id v20;
  __int128 *p_buf;
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v5 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v22);
  v6 = v22;
  if ((v5 & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x3032000000;
    v25 = sub_100007740;
    v26 = sub_100007750;
    v27 = 0;
    v7 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10000B74C;
    v18 = &unk_100018C70;
    p_buf = &buf;
    v19 = self;
    v8 = v4;
    v20 = v8;
    dispatch_sync(v7, &v15);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v9 = objc_alloc((Class)NSKeyedUnarchiver);
      v10 = objc_msgSend(v9, "initForReadingFromData:error:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0, v15, v16, v17, v18, v19);
      v11 = objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(CKServerChangeToken), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    }
    else
    {
      v12 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "saveRecord: Failed to initalize UserRegistryDB: %@", (uint8_t *)&buf, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (void)cacheUserRegistryStats
{
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100007740;
  v13 = sub_100007750;
  v14 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B8FC;
  v8[3] = &unk_100018A68;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  if (v10[5])
  {
    v4 = objc_alloc((Class)NSKeyedUnarchiver);
    v5 = objc_msgSend(v4, "initForReadingFromData:error:", v10[5], 0);
    v6 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(UserRegistryStats), CFSTR("UserRegistryStats"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[PCSUserRegistry setStats:](self, "setStats:", v7);

  }
  else
  {
    v5 = objc_alloc_init((Class)UserRegistryStats);
    -[PCSUserRegistry setStats:](self, "setStats:", v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_onqueueSaveUserRegistryStats
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v7 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry stats](self, "stats"));
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("UserRegistryStats"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry userdb](self, "userdb"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "encodedData"));
  objc_msgSend(v5, "replaceConfigRecord:data:", CFSTR("UserRegistryStats"), v6);

}

- (void)statFetch
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry stats](self, "stats"));
  objc_msgSend(v3, "setRecordFetch:", (char *)objc_msgSend(v3, "recordFetch") + 1);

  -[PCSUserRegistry flushStats](self, "flushStats");
}

- (void)statModify
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry stats](self, "stats"));
  objc_msgSend(v3, "setRecordModify:", (char *)objc_msgSend(v3, "recordModify") + 1);

  -[PCSUserRegistry flushStats](self, "flushStats");
}

- (void)clearCloudKitCache
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BB04;
  block[3] = &unk_100018938;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)privateDatabase
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry container](self, "container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "privateCloudDatabase"));

  return v3;
}

- (void)addDatabaseOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry privateDatabase](self, "privateDatabase"));
  objc_msgSend(v5, "addOperation:", v4);

}

- (BOOL)errorShouldCauseReset:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  char v28;
  uint64_t v29;
  void *j;
  void *v31;
  void *v32;
  id v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", CKErrorDomain))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == (id)21)
      goto LABEL_27;
  }
  else
  {

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v6, "isEqualToString:", CKErrorDomain))
    goto LABEL_21;
  v7 = objc_msgSend(v3, "code");

  if (v7 != (id)2)
    goto LABEL_22;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v10)
  {

LABEL_21:
    goto LABEL_22;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v40 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
      if (objc_msgSend(v16, "isEqualToString:", CKErrorDomain))
      {
        v17 = objc_msgSend(v15, "code");

        if (v17 == (id)21)
          v12 = 1;
      }
      else
      {

      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  }
  while (v11);

  if ((v12 & 1) != 0)
    goto LABEL_27;
LABEL_22:
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v18, "isEqualToString:", CKErrorDomain))
  {

    goto LABEL_28;
  }
  if (objc_msgSend(v3, "code") != (id)28)
  {
    v19 = objc_msgSend(v3, "code");

    if (v19 == (id)26)
      goto LABEL_27;
LABEL_28:
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v21, "isEqualToString:", CKErrorDomain))
    {
      v22 = objc_msgSend(v3, "code");

      if (v22 == (id)2)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allValues", 0));
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (!v26)
        {
          v28 = 0;
          goto LABEL_47;
        }
        v27 = v26;
        v28 = 0;
        v29 = *(_QWORD *)v36;
        while (1)
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(_QWORD *)v36 != v29)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "domain"));
            if (!objc_msgSend(v32, "isEqualToString:", CKErrorDomain))
            {

              continue;
            }
            if (objc_msgSend(v31, "code") == (id)28)
            {

            }
            else
            {
              v33 = objc_msgSend(v31, "code");

              if (v33 != (id)26)
                continue;
            }
            v28 = 1;
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (!v27)
          {
LABEL_47:

            v20 = v28 & 1;
            goto LABEL_48;
          }
        }
      }
    }
    else
    {

    }
    v20 = 0;
    goto LABEL_48;
  }

LABEL_27:
  v20 = 1;
LABEL_48:

  return v20;
}

- (void)checkErrorForRetryPause:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  _QWORD block[5];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  double v41;
  _BYTE v42[128];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = objc_msgSend(v5, "isEqualToString:", CKErrorDomain);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CKErrorRetryAfterKey));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allValues"));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v37;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1)
                                                                               + 8 * (_QWORD)v13), "domain", v29));
            v15 = objc_msgSend(v14, "isEqualToString:", CKErrorDomain);

            if (v15)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CKErrorRetryAfterKey));

              if (!v8 || (objc_msgSend(v8, "doubleValue"), v19 = v18, objc_msgSend(v17, "doubleValue"), v19 < v20))
              {
                v21 = v17;

                v8 = v21;
              }

            }
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v11);
      }

      if (v8)
      {
        objc_initWeak(&location, self);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10000C344;
        v33[3] = &unk_100018960;
        objc_copyWeak(&v34, &location);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v33));
        -[PCSUserRegistry setCloudKitRateLimitedOp:](self, "setCloudKitRateLimitedOp:", v22);
        objc_msgSend(v8, "doubleValue");
        v24 = v23 + 0.5;
        v25 = dispatch_time(0, (unint64_t)((v23 + 0.5) * 1000000000.0));
        v26 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v41 = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Delaying %.1f seconds for CK operations", buf, 0xCu);
        }

        v27 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000C3B8;
        block[3] = &unk_100018AB8;
        block[4] = self;
        v32 = v22;
        v28 = v22;
        dispatch_after(v25, v27, block);

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);

      }
      else
      {
        v8 = v29;
      }

    }
  }

}

- (id)createZone:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id v8;
  PCSRegistryOperation *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  PCSRegistryOperation *v16;
  void *v17;
  PCSRegistryOperation *v18;
  PCSRegistryOperation *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, void *);
  void *v24;
  id v25;
  PCSRegistryOperation *v26;
  id v27;
  id location;
  id v29;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneName:", v7);
  v9 = objc_alloc_init(PCSRegistryOperation);
  v10 = objc_alloc((Class)CKModifyRecordZonesOperation);
  v29 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
  v12 = objc_msgSend(v10, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v11, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry cloudKitRateLimitedOp](self, "cloudKitRateLimitedOp"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry cloudKitRateLimitedOp](self, "cloudKitRateLimitedOp"));
    objc_msgSend(v12, "addDependency:", v14);

  }
  objc_msgSend(v12, "setConfiguration:", v6);
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10000C638;
  v24 = &unk_100018C98;
  objc_copyWeak(&v27, &location);
  v15 = v8;
  v25 = v15;
  v16 = v9;
  v26 = v16;
  objc_msgSend(v12, "setModifyRecordZonesCompletionBlock:", &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry privateDatabase](self, "privateDatabase", v21, v22, v23, v24));
  objc_msgSend(v17, "addOperation:", v12);

  v18 = v26;
  v19 = v16;

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v19;
}

- (id)deleteMobileBackupZone
{
  PCSRegistryOperation *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PCSRegistryOperation *v9;
  void *v10;
  _QWORD v12[4];
  PCSRegistryOperation *v13;
  id v14;
  id location;
  void *v16;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(PCSRegistryOperation);
  v4 = objc_alloc((Class)CKModifyRecordZonesOperation);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry mobileBackupRecordZoneID](self, "mobileBackupRecordZoneID"));
  v16 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v7 = objc_msgSend(v4, "initWithRecordZonesToSave:recordZoneIDsToDelete:", &__NSArray0__struct, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry defaultCKConfiguration](self, "defaultCKConfiguration"));
  objc_msgSend(v7, "setConfiguration:", v8);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C984;
  v12[3] = &unk_100018CC0;
  objc_copyWeak(&v14, &location);
  v9 = v3;
  v13 = v9;
  objc_msgSend(v7, "setModifyRecordZonesCompletionBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry privateDatabase](self, "privateDatabase"));
  objc_msgSend(v10, "addOperation:", v7);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

- (BOOL)saveEscrowChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordName"));

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000CC04;
  v11[3] = &unk_100018CE8;
  v11[4] = self;
  v12 = v6;
  v13 = v4;
  v14 = &v15;
  v8 = v4;
  v9 = v6;
  dispatch_sync(v7, v11);

  LOBYTE(v6) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

- (void)deleteEscrowID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  PCSUserRegistry *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CD60;
  block[3] = &unk_100018AB8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)queryEscrowName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_100007740;
    v17 = sub_100007750;
    v18 = 0;
    v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CEDC;
    block[3] = &unk_100018C70;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(v5, block);

    v6 = (void *)v14[5];
    if (v6)
    {
      v7 = sub_10000CF34(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    }
    else
    {
      v8 = 0;
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)queryEscrowID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recordName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queryEscrowName:](self, "queryEscrowName:", v4));

  return v5;
}

- (id)pushMobileBackupRecordsToCloudKit:(id)a3 removeObjects:(id)a4
{
  id v6;
  PCSRegistryOperation *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  char *v17;
  id v18;
  void *v19;
  char *v20;
  char *v21;
  void *v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id from;
  id location;
  uint8_t buf[4];
  unsigned int v41;
  __int16 v42;
  unsigned int v43;

  v32 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_alloc_init(PCSRegistryOperation);
  objc_initWeak(&from, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry cloudKitRateLimitedOp](self, "cloudKitRateLimitedOp"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry cloudKitRateLimitedOp](self, "cloudKitRateLimitedOp"));
    -[PCSRegistryOperation addDependency:](v7, "addDependency:", v9);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog", v32));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "pushMobileBackupRecordsToCloudKit Starting", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry defaultCKConfiguration](self, "defaultCKConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry getServerChangeToken:](self, "getServerChangeToken:", CFSTR("MBserverChangeToken")));
  v13 = v12 == 0;

  if (v13)
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry createZone:withName:](self, "createZone:withName:", v11, CFSTR("PCSUserRegistryMobileBackup")));
  else
    v14 = 0;
  v15 = &__NSArray0__struct;
  if (v6)
    v15 = v6;
  v16 = v15;

  v17 = (char *)objc_msgSend(v16, "count");
  if ((unint64_t)v17 < 0x65)
  {
    v18 = v16;
  }
  else
  {
    v18 = objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v18, "removeObjectsInRange:", 100, v17 - 100);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v33));
  v20 = (char *)objc_msgSend(v19, "count");
  if ((unint64_t)v20 < 0x65)
  {
    v22 = 0;
  }
  else
  {
    v21 = v20 - 100;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subarrayWithRange:", 100, v20 - 100));
    objc_msgSend(v19, "removeObjectsInRange:", 100, v21);
  }
  v23 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(v19, "count");
    v25 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 67109376;
    v41 = v24;
    v42 = 1024;
    v43 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "updating %u records, removing %u records", buf, 0xEu);
  }

  -[PCSUserRegistry statModify](self, "statModify");
  v26 = objc_msgSend(objc_alloc((Class)CKModifyRecordsOperation), "initWithRecordsToSave:recordIDsToDelete:", v19, v18);
  v27 = v26;
  if (v14)
    objc_msgSend(v26, "addDependency:", v14);
  objc_msgSend(v27, "setSavePolicy:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry defaultCKConfiguration](self, "defaultCKConfiguration"));
  objc_msgSend(v27, "setConfiguration:", v28);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000D448;
  v34[3] = &unk_100018D38;
  objc_copyWeak(&v36, &location);
  objc_copyWeak(&v37, &from);
  v29 = v22;
  v35 = v29;
  objc_msgSend(v27, "setModifyRecordsCompletionBlock:", v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry privateDatabase](self, "privateDatabase"));
  objc_msgSend(v30, "addOperation:", v27);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v7;
}

- (BOOL)updateEscrowData:(id)a3 escrowIdentity:(_PCSIdentityData *)a4 identity:(_PCSIdentityData *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v14;

  v8 = a3;
  cf = 0;
  v9 = (void *)PCSBackupCreateEscrowedKeyWithIdentity(a4, a5, &cf);
  if (v9)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("escrow"));
  if (cf)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = cf;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to create escrow identity: %@", buf, 0xCu);
    }

    CFRelease(cf);
  }

  return v9 != 0;
}

- (id)keyRecordIdentity:(_PCSIdentityData *)a3 device:(id)a4 version:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "recordID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
  v10 = sub_10000DAF0((uint64_t)a3, v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)mobileBackupKeyRecordIdentity:(_PCSIdentityData *)a3 version:(id)a4
{
  return sub_10000DAF0((uint64_t)a3, CFSTR("MobileBackup"), a4);
}

- (id)keyRecord:(_PCSIdentityData *)a3 withName:(id)a4 zone:(id)a5
{
  id v7;
  id v8;
  uint64_t PublicKey;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  PublicKey = PCSIdentityGetPublicKey(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(PublicKey);
  v11 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", v8, v7);

  v12 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("URKey"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("firstSeen"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("publicKey"));
  v14 = (void *)PCSIdentityCopyPublicKeyInfo(a3);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("identity"));

  return v12;
}

- (BOOL)checkRegistry:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v15 = 0;
  v5 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v15);
  v6 = v15;
  if (v5)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000DEA8;
    v12[3] = &unk_100018D60;
    v13 = (id)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry syncUserRegistry](self, "syncUserRegistry"));
    v14 = v4;
    v7 = v13;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v12));
    objc_msgSend(v8, "addDependency:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry mainOperationQueue](self, "mainOperationQueue"));
    objc_msgSend(v9, "addOperation:", v8);

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "checkRegistry: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }

    (*((void (**)(id, id))v4 + 2))(v4, v6);
  }

  return v5;
}

- (id)scanPCSIdentitiesForNewMobileBackupRecords
{
  void *v3;
  unsigned __int8 v4;
  NSObject *v5;
  _PCSIdentitySetData *v6;
  _PCSIdentitySetData *v7;
  uint64_t v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  CFTypeRef v16;
  NSObject *v17;
  _QWORD v19[5];
  NSObject *v20;
  _PCSIdentitySetData *v21;
  uint64_t v22;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry mobileBackup](self, "mobileBackup"));
  v4 = objc_msgSend(v3, "isBackupEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = -[PCSUserRegistry identityCopySet](self, "identityCopySet");
    if (v6)
    {
      v7 = v6;
      cf = 0;
      if ((PCSIdentitySetIsWalrusWithForceFetch(v6, 1, &cf) & 1) != 0 || cf)
      {
        v15 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = cf;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping MobileBackup Escrow: %@", buf, 0xCu);
        }

        v16 = cf;
        if (cf)
        {
          cf = 0;
          CFRelease(v16);
        }
      }
      else
      {
        v8 = _PCSIdentitySetCopyCurrentIdentityInternal(v7, kPCSServiceEscrow, 0);
        if (v8)
        {
          v9 = (const void *)v8;
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10000E1F0;
          v19[3] = &unk_100018DB0;
          v21 = v7;
          v22 = v8;
          v19[4] = self;
          v10 = v5;
          v20 = v10;
          PCSServiceItemsGetEachName(v19);
          v11 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = -[NSObject count](v10, "count");
            *(_DWORD *)buf = 134217984;
            v25 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Harvested %lu records for MobileBackup escrow from Local PCS", buf, 0xCu);
          }

          CFRelease(v7);
          CFRelease(v9);
          v13 = v10;

          goto LABEL_24;
        }
        v17 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No escrow identity", buf, 2u);
        }

      }
      CFRelease(v7);
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No PCSIdentities to Escrow to MobileBackup", buf, 2u);
      }

    }
    v13 = 0;
    goto LABEL_24;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MobileBackup is off; no new records!", buf, 2u);
  }
  v13 = &__NSArray0__struct;
LABEL_24:

  return v13;
}

- (id)startBackupOfNewMobileBackupIdentities
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting startBackupOfNewMobileBackupIdentities", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry scanPCSIdentitiesForNewMobileBackupRecords](self, "scanPCSIdentitiesForNewMobileBackupRecords"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "startBackupOfNewMobileBackupIdentities - pushing new keys to cloudKit", v10, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry pushMobileBackupRecordsToCloudKit:removeObjects:](self, "pushMobileBackupRecordsToCloudKit:removeObjects:", v4, v5));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No local mobile backup key changes", v9, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (_PCSIdentitySetData)identityCopySet
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _PCSIdentitySetData *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CFTypeRef cf;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  CFTypeRef v17;

  cf = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry accounts](self, "accounts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dsid"));

  if (!v4)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry accounts](self, "accounts"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastError"));
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fail getting dsid: %@", buf, 0xCu);

    }
    v5 = 0;
    goto LABEL_11;
  }
  v14 = kPCSSetupDSID;
  v15 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v6 = PCSIdentitySetCreate(v5, 0, &cf);
  if (!v6)
  {
    if (cf)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = cf;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to get PCS identities: %@", buf, 0xCu);
      }

      CFRelease(cf);
    }
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = (_PCSIdentitySetData *)v6;
LABEL_12:

  return v7;
}

- (id)extractMobilebackupKeyEscrow:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _UNKNOWN **v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  PCSUserRegistry *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];

  v4 = a3;
  v22 = self;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Converting CKRecords to PCSKeybagKeys", buf, 2u);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v9 = &APSConnectionOverrideNamedDelegatePort_ptr;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("keyStatus")));
        v13 = v12;
        if (!v12 || (objc_msgSend(v12, "longValue") & 1) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("escrow")));
          v15 = objc_opt_class(v9[42]);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            v16 = v9;
            v17 = objc_alloc_init((Class)PCSKeybagKey);
            v18 = objc_msgSend(v14, "copy");
            objc_msgSend(v17, "setData:", v18);

            objc_msgSend(v17, "setFlags:", objc_msgSend(v13, "longValue"));
            objc_msgSend(v23, "addObject:", v17);

            v9 = v16;
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v7);
  }

  v19 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](v22, "oslog"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 134217984;
    v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Converted %lu CKRecords to PCSKeybagKeys", buf, 0xCu);
  }

  return v23;
}

- (id)loadMobileBackupKeysFromDB
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100007740;
  v25 = sub_100007750;
  v26 = 0;
  v4 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EDC4;
  block[3] = &unk_100018A68;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(v4, block);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)v22[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8), (_QWORD)v16));
        v10 = sub_10000CF34(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        objc_msgSend(v3, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
    }
    while (v6);
  }

  v12 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "loadMobileBackupKeysFromDB returning (count %lu)", buf, 0xCu);
  }

  v14 = v3;
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (id)allMobileBackupKeys
{
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  id v10;

  v8 = 0;
  v3 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v8);
  v4 = v8;
  if ((v3 & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry loadMobileBackupKeysFromDB](self, "loadMobileBackupKeysFromDB"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry extractMobilebackupKeyEscrow:](self, "extractMobilebackupKeyEscrow:", v5));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "allMobileBackupKeys: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)allMobileBackupPublicKeys
{
  id v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  NSObject *v20;
  PCSUserRegistry *v21;
  void *v22;
  id v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v31 = 0;
  v4 = -[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:", &v31);
  v5 = v31;
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v25 = v5;
    v7 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry loadMobileBackupKeysFromDB](self, "loadMobileBackupKeysFromDB"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      v11 = CFSTR("publicKey");
      do
      {
        v12 = 0;
        v26 = v9;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));
          if (v14)
          {
            objc_msgSend(v3, "addObject:", v14);
          }
          else
          {
            v15 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordID"));
              v17 = v10;
              v18 = v11;
              v19 = v3;
              v20 = v7;
              v21 = self;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordName"));
              *(_DWORD *)buf = 138412290;
              v34 = v22;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Record %@ missing public key", buf, 0xCu);

              self = v21;
              v7 = v20;
              v3 = v19;
              v11 = v18;
              v10 = v17;
              v9 = v26;

            }
          }

          v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }
    v23 = v3;
    v6 = v25;
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "allMobileBackupKeys: Failed to initalize UserRegistryDB: %@", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

- (id)queryMobileBackupKeysFromCloudKit:(id *)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  PCSUserRegistry *v25;
  NSObject *v26;
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
  id v42;

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100007740;
  v39 = sub_100007750;
  v40 = 0;
  v5 = dispatch_semaphore_create(0);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_100007740;
  v33 = sub_100007750;
  v34 = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit", buf, 2u);
  }

  v7 = objc_alloc((Class)CKQuery);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("TRUEPREDICATE")));
  v9 = objc_msgSend(v7, "initWithRecordType:predicate:", CFSTR("URKey"), v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry privateDatabase](self, "privateDatabase"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry mobileBackupRecordZoneID](self, "mobileBackupRecordZoneID"));
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10000F4C8;
  v24 = &unk_100018DD8;
  v25 = self;
  v27 = &v29;
  v28 = &v35;
  v12 = v5;
  v26 = v12;
  objc_msgSend(v10, "performQuery:inZoneWithID:completionHandler:", v9, v11, &v21);

  v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  if (!v36[5])
  {
    v14 = objc_alloc_init((Class)NSArray);
    v15 = (void *)v36[5];
    v36[5] = (uint64_t)v14;

  }
  v16 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog", v21, v22, v23, v24, v25));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend((id)v36[5], "count");
    *(_DWORD *)buf = 134217984;
    v42 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit returning (count %lu)", buf, 0xCu);
  }

  if (a3)
  {
    v18 = (void *)v30[5];
    if (v18)
      *a3 = objc_msgSend(v18, "copy");
  }
  v19 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

- (id)ckRecordListToRecordIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "recordID", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
        v12 = objc_msgSend(v11, "copy");

        objc_msgSend(v4, "addObject:", v12);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)fetchMobileBackupRecordIDsWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v8;
  id v9;
  int v10;
  id v11;

  if (-[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queryMobileBackupKeysFromCloudKit:](self, "queryMobileBackupKeysFromCloudKit:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSUserRegistry ckRecordListToRecordIDs:](self, "ckRecordListToRecordIDs:", v5));

    return v6;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = *a3;
      else
        v9 = 0;
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "fetchMobileBackupRecordIDsWithError: Failed to initalize UserRegistryDB: %@", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
}

- (id)userDBBackupRecordIDsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v12[6];
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (-[PCSUserRegistry ensureUserRegistryDbLoaded:](self, "ensureUserRegistryDbLoaded:"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v14 = 0x3032000000;
    v15 = sub_100007740;
    v16 = sub_100007750;
    v17 = 0;
    v5 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000FA14;
    v12[3] = &unk_100018A68;
    v12[4] = self;
    v12[5] = &buf;
    dispatch_sync(v5, v12);

    v6 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v6)
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    else
      v7 = objc_alloc_init((Class)NSArray);
    v10 = v7;
    _Block_object_dispose(&buf, 8);

    return v10;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[PCSUserRegistry oslog](self, "oslog"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = *a3;
      else
        v9 = 0;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "userDBBackupRecordIDsWithError: Failed to initalize UserRegistryDB: %@", (uint8_t *)&buf, 0xCu);
    }

    return 0;
  }
}

- (UserRegistryStats)stats
{
  return (UserRegistryStats *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSOperationQueue)mainOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMainOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PCSDelayedAction)resyncRegistryAction
{
  return (PCSDelayedAction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResyncRegistryAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PCSDelayedAction)subscribeAction
{
  return (PCSDelayedAction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubscribeAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PCSMobileBackup)mobileBackup
{
  return (PCSMobileBackup *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMobileBackup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CKRecordZoneID)recordZoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRecordZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CKRecordZoneID)mobileBackupRecordZoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMobileBackupRecordZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PCSAccountsModel)accounts
{
  return (PCSAccountsModel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAccounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OS_os_log)oslog
{
  return (OS_os_log *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOslog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (UserRegistryDB)userdb
{
  return (UserRegistryDB *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUserdb:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)resubmitSyncing
{
  return self->_resubmitSyncing;
}

- (void)setResubmitSyncing:(BOOL)a3
{
  self->_resubmitSyncing = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)stats_dirty
{
  return self->_stats_dirty;
}

- (void)setStats_dirty:(BOOL)a3
{
  self->_stats_dirty = a3;
}

- (PCSRegistryOperationPair)currentSyncOperations
{
  return (PCSRegistryOperationPair *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentSyncOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PCSRegistryOperationPair)pendingSyncOperations
{
  return (PCSRegistryOperationPair *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPendingSyncOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSOperation)cloudKitRateLimitedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCloudKitRateLimitedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitRateLimitedOp, 0);
  objc_storeStrong((id *)&self->_pendingSyncOperations, 0);
  objc_storeStrong((id *)&self->_currentSyncOperations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userdb, 0);
  objc_storeStrong((id *)&self->_oslog, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_mobileBackupRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_mobileBackup, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_subscribeAction, 0);
  objc_storeStrong((id *)&self->_resyncRegistryAction, 0);
  objc_storeStrong((id *)&self->_mainOperationQueue, 0);
  objc_storeStrong((id *)&self->_stats, 0);
}

@end
