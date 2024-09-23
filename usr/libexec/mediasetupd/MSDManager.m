@implementation MSDManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000112C4;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_100052760 != -1)
    dispatch_once(&qword_100052760, block);
  return (id)qword_100052758;
}

- (MSDManager)init
{
  MSDManager *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  MSDDefaultsManager *defaultsManager;
  dispatch_queue_t v7;
  OS_dispatch_queue *startupQueue;
  NSObject *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *publicDBRefreshQueue;
  void *v14;
  MSServerMediator *v15;
  MSServerMediator *mediator;
  MSServer *v17;
  MSServer *server;
  _QWORD block[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;

  v22.receiver = self;
  v22.super_class = (Class)MSDManager;
  v2 = -[MSDManager init](&v22, "init");
  if (v2)
  {
    v3 = sub_10002E034();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[MSDManager init]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v5 = objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    defaultsManager = v2->_defaultsManager;
    v2->_defaultsManager = (MSDDefaultsManager *)v5;

    v7 = dispatch_queue_create("com.apple.mediasetupd.startupQueue", 0);
    startupQueue = v2->_startupQueue;
    v2->_startupQueue = (OS_dispatch_queue *)v7;

    objc_initWeak((id *)buf, v2);
    v9 = v2->_startupQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011524;
    block[3] = &unk_1000489C0;
    objc_copyWeak(&v21, (id *)buf);
    dispatch_async(v9, block);
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.mediasetup.publicdb-refresh-queue", v11);
    publicDBRefreshQueue = v2->_publicDBRefreshQueue;
    v2->_publicDBRefreshQueue = (OS_dispatch_queue *)v12;

    v2->_homeKitSyncComplete = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](MSDHomeManager, "sharedManager"));
    objc_msgSend(v14, "addDelegate:", v2);

    v15 = (MSServerMediator *)objc_msgSend(objc_alloc((Class)MSServerMediator), "initWithAccountsDelegate:", v2);
    mediator = v2->_mediator;
    v2->_mediator = v15;

    v17 = (MSServer *)objc_msgSend(objc_alloc((Class)MSServer), "initWithMediator:", v2->_mediator);
    server = v2->_server;
    v2->_server = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)_performStartup
{
  id v3;
  uint64_t v4;
  MSDProfilesManager *v5;
  MSDProfilesManager *profilesManager;

  v3 = +[MSDPushService sharedService](MSDPushService, "sharedService");
  v5 = (MSDProfilesManager *)objc_opt_new(MSDProfilesManager, v4);
  profilesManager = self->_profilesManager;
  self->_profilesManager = v5;

  -[MSDProfilesManager setDelegate:](self->_profilesManager, "setDelegate:", self);
  -[MSDManager _setupNotifications](self, "_setupNotifications");
  -[MSDManager _schedulePublicDBRefreshBackgroundTask](self, "_schedulePublicDBRefreshBackgroundTask");
}

- (void)_setupMultiUser
{
  void *v2;
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
  void *v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "homeManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainerID](CKContainer, "MSDCloudKitContainerID"));
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  objc_msgSend(v3, "registerToAcceptCloudSharesForContainers:", v5);

  if (+[MSDeviceInfo deviceCanManageMultiUser](MSDeviceInfo, "deviceCanManageMultiUser"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privateCloudDatabase"));
    objc_msgSend(v7, "addSubscriptionForDatabase:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cloudManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sharedCloudDatabase"));
    objc_msgSend(v11, "addSubscriptionForDatabase:", v13);

  }
}

- (void)_setupNotifications
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD handler[4];
  id v7;
  id buf[2];

  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing XPC event stream handler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100011844;
  handler[3] = &unk_100049458;
  objc_copyWeak(&v7, buf);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_initializeCoalescerObject
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  id v13;

  v3 = objc_alloc_init((Class)CUCoalescer);
  objc_msgSend(v3, "setDispatchQueue:", &_dispatch_main_q);
  objc_msgSend(v3, "setMinDelay:", MSMinDelayInSecForSchedulingCoalescerTask);
  objc_msgSend(v3, "setMaxDelay:", MSMaxDelayInSecsForSchedulingCoalescerTask);
  objc_msgSend(v3, "setInvalidationHandler:", &stru_100049478);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011C3C;
  v9[3] = &unk_1000489C0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setActionHandler:", v9);
  v4 = sub_10002E034();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initialized CUCoalescer object %{private}@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011CB8;
  v7[3] = &unk_100049310;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_scheduleRefreshTask
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling task to refresh data with CloudKit", v5, 2u);
  }

  -[MSDManager _initializeBackgroundActivityTask](self, "_initializeBackgroundActivityTask");
}

- (void)_initializeBackgroundActivityTask
{
  id v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  id v5;

  v2 = objc_alloc((Class)NSBackgroundActivityScheduler);
  v5 = objc_msgSend(v2, "initWithIdentifier:", kBackgroundActivityDataRefreshTaskIdentifier);
  objc_msgSend(v5, "invalidate");
  global_queue = dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_100049498);

}

- (void)_savePublicDBInfoInDefaults
{
  void *v2;
  unsigned __int8 v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  double v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
  v3 = objc_msgSend(v2, "shouldUseCloudKit");

  if ((v3 & 1) != 0)
  {
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001201C;
    v11[3] = &unk_1000494E0;
    v6 = v4;
    v12 = v6;
    objc_msgSend(v5, "syncDataWithCloudKit:", v11);

    v7 = dispatch_time(0, 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit);
    if (dispatch_group_wait(v6, v7))
    {
      v8 = sub_10002E034();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000168C4();

    }
  }
  else
  {
    v10 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = MSPublicDatabaseRefreshIntervalInSecs / 3600.0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Its been less than %f hours since last Public Database refresh, skipping check", buf, 0xCu);
    }
  }

}

- (void)_markHomeKitInitialized
{
  NSObject *publicDBRefreshQueue;
  _QWORD block[5];

  publicDBRefreshQueue = self->_publicDBRefreshQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012120;
  block[3] = &unk_100048AC0;
  block[4] = self;
  dispatch_async(publicDBRefreshQueue, block);
}

- (void)_schedulePublicDBRefreshBackgroundTask
{
  id v3;
  NSObject *v4;
  void *v5;
  OS_dispatch_queue *publicDBRefreshQueue;
  _QWORD v7[4];
  id v8;
  id buf[2];

  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling background task for publicDB refreshes", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  publicDBRefreshQueue = self->_publicDBRefreshQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012254;
  v7[3] = &unk_100049530;
  objc_copyWeak(&v8, buf);
  objc_msgSend(v5, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.mediasetupd.publicDBRefresh"), publicDBRefreshQueue, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)_clearCachedIconImage:(id)a3
{
  id v3;
  MSDArtworkManager *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a3;
  v4 = -[MSDArtworkManager initWithServiceID:remoteImageURL:]([MSDArtworkManager alloc], "initWithServiceID:remoteImageURL:", v3, 0);

  v5 = -[MSDArtworkManager removeCachedIconImage](v4, "removeCachedIconImage");
  v6 = sub_10002E034();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully removed cached service icon image", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1000169F8();
  }

}

- (void)getAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v35 = v7;
    v36 = 2113;
    v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User is requesting available services for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x16u);
  }

  if (v7 && v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v30[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v31[0] = v13;
    v30[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v31[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100012858;
    v28[3] = &unk_100049558;
    v29 = v9;
    objc_msgSend(v12, "getAvailableServices:completion:", v15, v28);

    v16 = v29;
LABEL_10:

    goto LABEL_11;
  }
  v17 = sub_10002E034();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_100016A24(v18, v19, v20, v21, v22, v23, v24, v25);

  if (v9)
  {
    v26 = MSErrorDomain;
    v32 = MSUserInfoErrorStringKey;
    v33 = CFSTR("Failed to fetch available services, NIL identifiers provided");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, 3, v16));
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v27);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)getCachedAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v30 = v7;
    v31 = 2113;
    v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User is requesting available services for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x16u);
  }

  if (v7 && v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100012B74;
    v25[3] = &unk_100049558;
    v26 = v9;
    objc_msgSend(v12, "getCachedAvailableServices:homeID:completion:", v8, v7, v25);

    v13 = v26;
LABEL_10:

    goto LABEL_11;
  }
  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100016A24(v15, v16, v17, v18, v19, v20, v21, v22);

  if (v9)
  {
    v23 = MSErrorDomain;
    v27 = MSUserInfoErrorStringKey;
    v28 = CFSTR("Failed to fetch available services, NIL identifiers provided");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v23, 3, v13));
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v24);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  NSObject *v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_retainBlock(v10);
  if (v11)
  {
    if (v9 && objc_msgSend(v9, "count"))
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "na_map:", &stru_100049598));
      v13 = sub_10002E034();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        v34 = v8;
        v35 = 2113;
        v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "User is requesting to add %{private}@ to homes: %{private}@", buf, 0x16u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTransactionTask createTransactionWithIdentifier:](MSDTransactionTask, "createTransactionWithIdentifier:", kAddServiceTransactionIdentifier));
      objc_initWeak((id *)buf, self);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100012F5C;
      v27[3] = &unk_100049610;
      v31 = v11;
      v16 = v15;
      v28 = v16;
      objc_copyWeak(&v32, (id *)buf);
      v29 = v8;
      v30 = v9;
      +[MSAuthTokenProvider fetchAuthTokensForMediaService:networkActivity:completion:](MSAuthTokenProvider, "fetchAuthTokensForMediaService:networkActivity:completion:", v29, 0, v27);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v17 = sub_10002E034();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100016BC4();

      v12 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 3, 0));
      (*((void (**)(id, _QWORD, NSObject *))v11 + 2))(v11, 0, v12);
    }
  }
  else
  {
    v19 = sub_10002E034();
    v12 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100016B54(v12, v20, v21, v22, v23, v24, v25, v26);
  }

}

- (void)removeMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  MSDManager *v42;
  void (**v43)(id, _QWORD, void *);
  _QWORD v44[2];
  _QWORD v45[2];
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceID"));
    *(_DWORD *)buf = 138478339;
    v51 = v16;
    v52 = 2113;
    v53 = v11;
    v54 = 2113;
    v55 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "User is requesting to remove %{private}@ for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x20u);

  }
  if ((objc_msgSend(v10, "isServiceRemovable") & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Removing service %@ is prohibited"), v23));

    v24 = sub_10002E034();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v13)
    {
      v26 = MSErrorDomain;
      v48 = MSUserInfoErrorStringKey;
      v49 = v21;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, 1, v27));
      v13[2](v13, 0, v28);

    }
    goto LABEL_15;
  }
  if (v11 && v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v44[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    v45[0] = v18;
    v44[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v45[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000137D4;
    v40[3] = &unk_1000495C0;
    v41 = v10;
    v42 = self;
    v43 = v13;
    objc_msgSend(v17, "removeMediaService:withUserInfo:completion:", v41, v20, v40);

    v21 = v41;
LABEL_15:

    goto LABEL_16;
  }
  v29 = sub_10002E034();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    sub_100016DC4(v30, v31, v32, v33, v34, v35, v36, v37);

  if (v13)
  {
    v38 = MSErrorDomain;
    v46 = MSUserInfoErrorStringKey;
    v47 = CFSTR("Failed to remove service, NIL identifiers provided");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v38, 3, v21));
    v13[2](v13, 0, v39);

    goto LABEL_15;
  }
LABEL_16:

}

- (void)updateDefaultMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = sub_10002E034();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serviceID"));
    *(_DWORD *)buf = 138478339;
    v39 = v15;
    v40 = 2113;
    v41 = v10;
    v42 = 2113;
    v43 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "User is requesting to update default service %{private}@ for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x20u);

  }
  if (v10 && v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v34[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    v35[0] = v17;
    v34[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    v35[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100013BD4;
    v32[3] = &unk_100048CA0;
    v33 = v12;
    objc_msgSend(v16, "updateDefaultMediaService:withUserInfo:completion:", v9, v19, v32);

    v20 = v33;
LABEL_10:

    goto LABEL_11;
  }
  v21 = sub_10002E034();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_100016E94(v22, v23, v24, v25, v26, v27, v28, v29);

  if (v12)
  {
    v30 = MSErrorDomain;
    v36 = MSUserInfoErrorStringKey;
    v37 = CFSTR("Failed to update default service, NIL identifiers provided");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v30, 3, v20));
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v31);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)getDefaultMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v35 = v7;
    v36 = 2113;
    v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User is requesting to fetch default service for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x16u);
  }

  if (v7 && v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v30[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v31[0] = v13;
    v30[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v31[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100013EE4;
    v28[3] = &unk_100049638;
    v29 = v9;
    objc_msgSend(v12, "getDefaultMediaService:completion:", v15, v28);

    v16 = v29;
LABEL_10:

    goto LABEL_11;
  }
  v17 = sub_10002E034();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_100016F64(v18, v19, v20, v21, v22, v23, v24, v25);

  if (v9)
  {
    v26 = MSErrorDomain;
    v32 = MSUserInfoErrorStringKey;
    v33 = CFSTR("Failed to fetch default service, NIL identifiers provided");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, 3, v16));
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v27);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)updateProperty:(id)a3 homeID:(id)a4 homeUserID:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  void (**v41)(_QWORD, _QWORD, _QWORD);
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))v15;
  if (!v11)
  {
    if (!v15)
      goto LABEL_18;
    v25 = MSErrorDomain;
    v54 = MSUserInfoErrorStringKey;
    v55 = CFSTR("Nil MediaService object");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    v26 = v25;
    v27 = 2;
LABEL_16:
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, v27, v24));
    ((void (**)(_QWORD, _QWORD, void *))v16)[2](v16, 0, v39);

    goto LABEL_17;
  }
  if (!v14)
  {
    if (!v15)
      goto LABEL_18;
    v28 = MSErrorDomain;
    v52 = MSUserInfoErrorStringKey;
    v53 = CFSTR("Nil property values");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
    v26 = v28;
    v27 = 1;
    goto LABEL_16;
  }
  v17 = sub_10002E034();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceID"));
    *(_DWORD *)buf = 138478339;
    v47 = v19;
    v48 = 2113;
    v49 = v12;
    v50 = 2113;
    v51 = v13;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "User is requesting to update property for %{private}@ for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x20u);

  }
  if (v12 && v13)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v42[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v43[0] = v21;
    v42[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
    v43[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000143B8;
    v40[3] = &unk_100048CA0;
    v41 = v16;
    objc_msgSend(v20, "updateProperty:propertyInfo:withUserInfo:completion:", v11, v14, v23, v40);

    v24 = v41;
LABEL_17:

    goto LABEL_18;
  }
  v29 = sub_10002E034();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    sub_100017034(v30, v31, v32, v33, v34, v35, v36, v37);

  if (v16)
  {
    v38 = MSErrorDomain;
    v44 = MSUserInfoErrorStringKey;
    v45 = CFSTR("Failed to update property, NIL identifiers provided");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v26 = v38;
    v27 = 3;
    goto LABEL_16;
  }
LABEL_18:

}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_10002E034();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v30 = v7;
    v31 = 2112;
    v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User is requesting to fetch service info for %{private}@ and serviceID %@", buf, 0x16u);
  }

  if (v7 && objc_msgSend(v7, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100014658;
    v25[3] = &unk_100049660;
    v26 = v9;
    objc_msgSend(v12, "getServiceConfigurationInfo:serviceID:completion:", v7, v8, v25);

    v13 = v26;
LABEL_10:

    goto LABEL_11;
  }
  v14 = sub_10002E034();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100017104(v15, v16, v17, v18, v19, v20, v21, v22);

  if (v9)
  {
    v23 = MSErrorDomain;
    v27 = NSLocalizedDescriptionKey;
    v28 = CFSTR("Failed to fetch service config info for Nil homeUserID");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v23, 1, v13));
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v24);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)getDefaultMediaServiceForAllUsers:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v8;
  const __CFString *v9;

  if (a3)
  {
    v4 = MSErrorDomain;
    v8 = NSLocalizedDescriptionKey;
    v9 = CFSTR("Function called on unsupported platform");
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v4, 11, v6));
    (*((void (**)(id, _QWORD, void *))a3 + 2))(v5, 0, v7);

  }
}

- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000148A0;
    v7[3] = &unk_100049688;
    v8 = v5;
    v9 = v6;
    +[MSDPublicDBManager getPublicInfoForBundleID:completion:](MSDPublicDBManager, "getPublicInfoForBundleID:completion:", v8, v7);

  }
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  if (a6)
  {
    v7 = MSErrorDomain;
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Function called on unsupported platform");
    v8 = a6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v7, 11, v9));
    (*((void (**)(id, _QWORD, _QWORD, void *))a6 + 2))(v8, 0, 0, v10);

  }
}

- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  if (a6)
  {
    v7 = MSErrorDomain;
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Function called on unsupported platform");
    v8 = a6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v7, 11, v9));
    (*((void (**)(id, _QWORD, void *))a6 + 2))(v8, 0, v10);

  }
}

- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSErrorUserInfoKey v12;
  const __CFString *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (v6)
  {
    v7 = MSErrorDomain;
    if (v5)
    {
      v12 = NSLocalizedDescriptionKey;
      v13 = CFSTR("Function called on unsupported platform");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
      v9 = v7;
      v10 = 11;
    }
    else
    {
      v14 = NSLocalizedDescriptionKey;
      v15 = CFSTR("INIntent cannot be nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v9 = v7;
      v10 = 1;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, v10, v8));
    v6[2](v6, 0, v11);

  }
}

- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  if (a5)
  {
    v6 = MSErrorDomain;
    v10 = NSLocalizedDescriptionKey;
    v11 = CFSTR("Function called on unsupported platform");
    v7 = a5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 11, v8));
    (*((void (**)(id, _QWORD, void *))a5 + 2))(v7, 0, v9);

  }
}

- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  if (a5)
  {
    v6 = MSErrorDomain;
    v10 = NSLocalizedDescriptionKey;
    v11 = CFSTR("Function called on unsupported platform");
    v7 = a5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 11, v8));
    (*((void (**)(id, void *))a5 + 2))(v7, v9);

  }
}

- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    v8 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v7);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100014F50;
    v9[3] = &unk_1000496B0;
    v10 = v6;
    -[MSDManager getMediaServiceChoicesForSharedUser:completion:](self, "getMediaServiceChoicesForSharedUser:completion:", v8, v9);

  }
}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    v13 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v25 = v11;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Switching account info for user - %@ in home - %@, %@", buf, 0x20u);
    }

    if (v9 && v10 && v11)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000151F0;
      v19[3] = &unk_1000496D8;
      v20 = v9;
      v21 = v12;
      objc_msgSend(v15, "switchUserAccountInfo:homeID:homeUserID:completion:", v20, v10, v11, v19);

      v16 = v20;
    }
    else
    {
      v17 = MSErrorDomain;
      v22 = NSLocalizedDescriptionKey;
      v23 = CFSTR("Failed to switch user account info, Nil Attributes provided");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, 1, v16));
      (*((void (**)(id, void *))v12 + 2))(v12, v18);

    }
  }

}

- (void)getSupportedThirdPartyMediaServices:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v8;
  const __CFString *v9;

  if (a3)
  {
    v4 = MSErrorDomain;
    v8 = NSLocalizedDescriptionKey;
    v9 = CFSTR("Function called on unsupported platform");
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v4, 11, v6));
    (*((void (**)(id, _QWORD, void *))a3 + 2))(v5, 0, v7);

  }
}

- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  if (a4)
  {
    v5 = MSErrorDomain;
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("Function called on unsupported platform");
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, 11, v7));
    (*((void (**)(id, _QWORD, void *))a4 + 2))(v6, 0, v8);

  }
}

- (void)profilesManager:(id)a3 didAddProfiles:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  id v41;
  id v42;
  dispatch_semaphore_t v43;
  id v44;
  id obj;
  uint64_t v46;
  id v47;
  void *i;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  NSObject *v58;
  _BYTE *v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t v62[4];
  const char *v63;
  __int16 v64;
  double v65;
  _BYTE buf[24];
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;

  v42 = a3;
  v44 = a4;
  v5 = sub_10002E034();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[MSDManager profilesManager:didAddProfiles:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v44;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s profile: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v67 = sub_100015B64;
  v68 = sub_100015B74;
  v69 = (id)objc_opt_new(NSMutableArray, v7);
  v43 = dispatch_semaphore_create(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
  v9 = objc_msgSend(v8, "shouldUseCloudKit");

  if (v9)
  {
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v62 = 136315394;
      v63 = "-[MSDManager profilesManager:didAddProfiles:]";
      v64 = 2048;
      v65 = MSPublicDatabaseRefreshIntervalInSecs / 3600.0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s its been more than %f hours since last update: Pulling from CK", v62, 0x16u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100015B7C;
    v57[3] = &unk_100049700;
    v59 = buf;
    v13 = v43;
    v58 = v13;
    objc_msgSend(v12, "syncDataWithCloudKit:", v57);

    v14 = dispatch_time(0, 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit);
    if (dispatch_semaphore_wait(v13, v14))
    {
      v15 = sub_10002E034();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_100017200();

    }
    v17 = v58;
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfo](MSDPublicDBManager, "getCachedPublicInfo"));
    v18 = -[NSObject mutableCopy](v17, "mutableCopy");
    v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v18;

  }
  v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v20 && objc_msgSend(v20, "count"))
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v44;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v47)
    {
      v46 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(_QWORD *)v54 != v46)
            objc_enumerationMutation(obj);
          v21 = *(const char **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
          v22 = sub_10002E034();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v62 = 138412290;
            v63 = v21;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Attempting to configure system with profileData %@", v62, 0xCu);
          }

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "createPublicDBInfoObjectFromDictionary:", v21));

          v26 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "mutableCopy");
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v27 = *(id *)(*(_QWORD *)&buf[8] + 40);
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
          if (v28)
          {
            v29 = *(_QWORD *)v50;
            do
            {
              for (j = 0; j != v28; j = (char *)j + 1)
              {
                if (*(_QWORD *)v50 != v29)
                  objc_enumerationMutation(v27);
                v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "serviceID"));
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "serviceID"));
                v34 = objc_msgSend(v32, "isEqual:", v33);

                if (v34)
                  objc_msgSend(v26, "removeObjectIdenticalTo:", v31);
              }
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
            }
            while (v28);
          }

          v35 = objc_msgSend(v26, "mutableCopy");
          v36 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v35;

          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "na_safeAddObject:", v25);
        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v47);
    }

    v37 = sub_10002E034();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(const char **)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v62 = 138412290;
      v63 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Updating PublicDB cachedCopy with Data %@", v62, 0xCu);
    }

    v40 = objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    -[NSObject setObjectWithCustomClass:forDefault:](v40, "setObjectWithCustomClass:forDefault:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), CFSTR("publicDBData"));
  }
  else
  {
    v41 = sub_10002E034();
    v40 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_1000171D4();
  }

  _Block_object_dispose(buf, 8);
}

- (void)profilesManager:(id)a3 didUpdateProfiles:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  MSDManager *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;

  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "-[MSDManager profilesManager:didUpdateProfiles:]";
    v59 = 2112;
    v60 = v5;
    v61 = 2048;
    v62 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s profile: %@ activeProfilesOnDevice %lu", buf, 0x20u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v10 = objc_msgSend(v9, "profilesEverInstalled");

  v11 = sub_10002E034();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Developer profile loaded on device, checking service sanity", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](MSDHomeManager, "sharedManager"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentHome"));

    if (!v12)
    {
      v36 = sub_10002E034();
      v20 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10001728C(v20, v37, v38, v39, v40, v41, v42, v43);
      goto LABEL_23;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentUser](v12, "currentUser"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueIdentifier"));
    if (v16)
    {
      v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uniqueIdentifier](v12, "uniqueIdentifier"));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyInDefaultDomain:", CFSTR("publicDBData")));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject na_map:](v20, "na_map:", &stru_100049740));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyInDeveloperDomain:", CFSTR("publicDBData")));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "na_map:", &stru_100049760));
        v25 = objc_msgSend(v24, "mutableCopy");

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_map:", &stru_1000497A0));
        objc_msgSend(v25, "removeObjectsInArray:", v26);
        objc_msgSend(v25, "removeObjectsInArray:", v21);
        if (objc_msgSend(v25, "count"))
        {
          v47 = v26;
          v48 = v23;
          v49 = v21;
          v55[0] = kCKDatabaseAccessUserInfoHomeIDKey;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uniqueIdentifier](v12, "uniqueIdentifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
          v56[0] = v28;
          v55[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentUser](v12, "currentUser"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uniqueIdentifier"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUIDString"));
          v56[1] = v31;
          v46 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2));

          v32 = sub_10002E034();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v58 = (const char *)v25;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Remove services with IDS: %{private}@", buf, 0xCu);
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](MSDDataController, "sharedInstance"));
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_100016250;
          v50[3] = &unk_1000497F0;
          v51 = v5;
          v23 = v48;
          v52 = v48;
          v53 = v25;
          v54 = self;
          v35 = v46;
          objc_msgSend(v34, "removeMediaServices:withUserInfo:completion:", v53, v46, v50);

          v21 = v49;
          v26 = v47;
        }
        else
        {
          v45 = sub_10002E034();
          v35 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Everything is up to date, nothing to delete", buf, 2u);
          }
        }

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {

    }
    v44 = sub_10002E034();
    v20 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000172FC();
    goto LABEL_23;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Developer profile was not loaded on device, skipping service check", buf, 2u);
  }
LABEL_24:

}

- (void)homeManager:(id)a3 didHomeKitSyncComplete:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  v5 = objc_claimAutoreleasedReturnValue(-[MSDManager startupQueue](self, "startupQueue", a3, a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000165F4;
  block[3] = &unk_100048AC0;
  block[4] = self;
  dispatch_async(v5, block);

}

- (MSServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (MSServerMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
  objc_storeStrong((id *)&self->_mediator, a3);
}

- (MSDDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (CUCoalescer)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_coalescer, a3);
}

- (OS_dispatch_queue)startupQueue
{
  return self->_startupQueue;
}

- (void)setStartupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_startupQueue, a3);
}

- (MSDProfilesManager)profilesManager
{
  return self->_profilesManager;
}

- (void)setProfilesManager:(id)a3
{
  objc_storeStrong((id *)&self->_profilesManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilesManager, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_publicDBRefreshQueue, 0);
}

@end
