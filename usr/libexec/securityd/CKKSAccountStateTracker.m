@implementation CKKSAccountStateTracker

- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4
{
  id v7;
  CKKSAccountStateTracker *v8;
  CKKSAccountStateTracker *v9;
  uint64_t v10;
  NSMapTable *ckChangeListeners;
  CKAccountInfo *currentCKAccountInfo;
  CKKSCondition *v13;
  CKKSCondition *ckAccountInfoInitialized;
  SOSAccountStatus *v15;
  SOSAccountStatus *currentCircleStatus;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  CKKSCondition *v21;
  CKKSCondition *finishedInitialDispatches;
  CKKSCondition *v23;
  CKKSCondition *ckdeviceIDInitialized;
  CKKSCondition *v25;
  CKKSCondition *octagonInformationInitialized;
  CKKSCondition *v27;
  CKKSCondition *cdpCapableiCloudAccountInitialized;
  void *v29;
  id v30;
  NSObject *v31;
  const char *v32;
  dispatch_queue_global_t global_queue;
  NSObject *v34;
  CKKSNearFutureScheduler *v35;
  CKKSNearFutureScheduler *v36;
  CKKSNearFutureScheduler *fetchCKAccountStatusScheduler;
  _QWORD v39[4];
  id v40;
  _QWORD block[4];
  id v42;
  _QWORD handler[4];
  id v44;
  int out_token;
  objc_super v46;
  _BYTE location[24];

  v7 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CKKSAccountStateTracker;
  v8 = -[CKKSAccountStateTracker init](&v46, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nsnotificationCenterClass, a4);
    v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    ckChangeListeners = v9->_ckChangeListeners;
    v9->_ckChangeListeners = (NSMapTable *)v10;

    currentCKAccountInfo = v9->_currentCKAccountInfo;
    v9->_currentCKAccountInfo = 0;

    v13 = objc_alloc_init(CKKSCondition);
    ckAccountInfoInitialized = v9->_ckAccountInfoInitialized;
    v9->_ckAccountInfoInitialized = v13;

    v15 = -[SOSAccountStatus init:error:]([SOSAccountStatus alloc], "init:error:", 0xFFFFFFFFLL, 0);
    currentCircleStatus = v9->_currentCircleStatus;
    v9->_currentCircleStatus = v15;

    objc_storeStrong((id *)&v9->_container, a3);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("ck-account-state", v18);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v19;

    v9->_firstCKAccountFetch = 0;
    v21 = objc_alloc_init(CKKSCondition);
    finishedInitialDispatches = v9->_finishedInitialDispatches;
    v9->_finishedInitialDispatches = v21;

    v23 = objc_alloc_init(CKKSCondition);
    ckdeviceIDInitialized = v9->_ckdeviceIDInitialized;
    v9->_ckdeviceIDInitialized = v23;

    v25 = objc_alloc_init(CKKSCondition);
    octagonInformationInitialized = v9->_octagonInformationInitialized;
    v9->_octagonInformationInitialized = v25;

    v9->_cdpCapableiCloudAccountStatus = 0;
    v27 = objc_alloc_init(CKKSCondition);
    cdpCapableiCloudAccountInitialized = v9->_cdpCapableiCloudAccountInitialized;
    v9->_cdpCapableiCloudAccountInitialized = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class defaultCenter](-[CKKSAccountStateTracker nsnotificationCenterClass](v9, "nsnotificationCenterClass"), "defaultCenter"));
    v30 = sub_10000BDF4(CFSTR("ckksaccount"), 0);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v29;
      _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Registering with notification center %@", location, 0xCu);
    }

    objc_msgSend(v29, "addObserver:selector:name:object:", v9, "notifyCKAccountStatusChange:", CKAccountChangedNotification, 0);
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, v9);
    if (-[OTSOSActualAdapter sosEnabled]_0())
    {
      out_token = 0;
      v32 = (const char *)kSOSCCCircleChangedNotification;
      global_queue = dispatch_get_global_queue(17, 0);
      v34 = objc_claimAutoreleasedReturnValue(global_queue);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100051C98;
      handler[3] = &unk_1002EAD30;
      objc_copyWeak(&v44, (id *)location);
      notify_register_dispatch(v32, &out_token, v34, handler);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100051CD0;
      block[3] = &unk_1002EB598;
      objc_copyWeak(&v42, (id *)location);
      dispatch_async(v34, block);

      objc_destroyWeak(&v42);
      objc_destroyWeak(&v44);
    }
    v35 = [CKKSNearFutureScheduler alloc];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100051D1C;
    v39[3] = &unk_1002EB598;
    objc_copyWeak(&v40, (id *)location);
    v36 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v35, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("ckstatus-refetch"), 5000000000, 600000000000, 0, 0, v39, 1.1);
    fetchCKAccountStatusScheduler = v9->_fetchCKAccountStatusScheduler;
    v9->_fetchCKAccountStatusScheduler = v36;

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)location);

  }
  return v9;
}

- (void)performInitialDispatches
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_autoreleasePoolPush();
  v4 = -[CKKSAccountStateTracker notifyCKAccountStatusChange:](self, "notifyCKAccountStatusChange:", 0);
  v5 = -[CKKSAccountStateTracker notifyCircleChange:](self, "notifyCircleChange:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker finishedInitialDispatches](self, "finishedInitialDispatches"));
  objc_msgSend(v6, "fulfill");

  objc_autoreleasePoolPop(v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class defaultCenter](-[CKKSAccountStateTracker nsnotificationCenterClass](self, "nsnotificationCenterClass"), "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKKSAccountStateTracker;
  -[CKKSAccountStateTracker dealloc](&v4, "dealloc");
}

- (id)descriptionInternal:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  v6 = -[CKKSAccountStateTracker cdpCapableiCloudAccountStatus](self, "cdpCapableiCloudAccountStatus");
  v7 = CFSTR("available");
  if (v6 == 3)
    v7 = CFSTR("no account");
  if (!v6)
    v7 = CFSTR("unknown");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@, cdp capable: %@>"), v4, v5, v7));

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker descriptionInternal:](self, "descriptionInternal:", v4));

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKKSAccountStateTracker;
  v3 = -[CKKSAccountStateTracker description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker descriptionInternal:](self, "descriptionInternal:", v4));

  return (NSString *)v5;
}

- (id)registerForNotificationsOfCloudKitAccountStatusChange:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  id v13;
  NSObject *v14;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v6 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051950;
  block[3] = &unk_1002E94C8;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_async(v6, block);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)notifyCKAccountStatusChange:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100051644;
  v11[3] = &unk_1002DBEF8;
  objc_copyWeak(&v13, &location);
  v6 = v5;
  v12 = v6;
  v7 = objc_retainBlock(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker container](self, "container"));
  objc_msgSend(v8, "accountInfoWithCompletionHandler:", v7);

  v9 = v6;
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (void)_onqueueUpdateCKDeviceID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  CKKSCondition *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (objc_msgSend(v4, "accountStatus") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker container](self, "container"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005132C;
    v8[3] = &unk_1002DD910;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v6, "fetchCurrentDeviceIDWithCompletionHandler:", v8);

    objc_destroyWeak(&v9);
  }
  else
  {
    -[CKKSAccountStateTracker setCkdeviceID:](self, "setCkdeviceID:", 0);
    -[CKKSAccountStateTracker setCkdeviceIDError:](self, "setCkdeviceIDError:", 0);
    v7 = objc_alloc_init(CKKSCondition);
    -[CKKSAccountStateTracker setCkdeviceIDInitialized:](self, "setCkdeviceIDInitialized:", v7);

  }
  objc_destroyWeak(&location);

}

- (id)notifyCircleChange:(id)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  id v13;
  NSObject *v14;

  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAccountStateTracker getCircleStatus](CKKSAccountStateTracker, "getCircleStatus"));
  v6 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000511D0;
  block[3] = &unk_1002E94C8;
  block[4] = self;
  v13 = v5;
  v7 = v4;
  v14 = v7;
  v8 = v5;
  dispatch_sync(v6, block);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)_onqueueUpdateCirclePeerID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  CKKSCondition *v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (objc_msgSend(v4, "status"))
  {
    v6 = sub_10000BDF4(CFSTR("ckks-sos"), 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "out of circle(%@): resetting peer ID", buf, 0xCu);
    }

    -[CKKSAccountStateTracker setAccountCirclePeerID:](self, "setAccountCirclePeerID:", 0);
    -[CKKSAccountStateTracker setAccountCirclePeerIDError:](self, "setAccountCirclePeerIDError:", 0);
    v8 = objc_alloc_init(CKKSCondition);
    -[CKKSAccountStateTracker setAccountCirclePeerIDInitialized:](self, "setAccountCirclePeerIDInitialized:", v8);

  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100050EE0;
    v9[3] = &unk_1002DD910;
    objc_copyWeak(&v10, &location);
    +[CKKSAccountStateTracker fetchCirclePeerID:](CKKSAccountStateTracker, "fetchCirclePeerID:", v9);
    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);

}

- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _QWORD block[4];
  NSObject *v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = dispatch_group_create();
  if (v9)
  {
    -[CKKSAccountStateTracker _onqueueUpdateAccountState:dispatchGroup:](self, "_onqueueUpdateAccountState:dispatchGroup:", v6, v9);
    v10 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100050ED8;
    block[3] = &unk_1002EC350;
    v14 = v7;
    dispatch_group_notify(v9, v10, block);

  }
  else
  {
    v11 = sub_10000BDF4(CFSTR("ckksaccount"), 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to get dispatch group.", buf, 2u);
    }

    dispatch_semaphore_signal(v7);
  }

}

- (void)_onqueueUpdateAccountState:(id)a3 dispatchGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  v10 = objc_msgSend(v9, "isEqual:", v6);

  if (v10)
  {
    v11 = sub_10000BDF4(CFSTR("ckksaccount"), 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker container](self, "container"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "options"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountOverrideInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "altDSID"));
      v29 = 138412546;
      v30 = v16;
      v31 = 2112;
      v32 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "received another notification of CK Account State(altDSID: %@) %@", (uint8_t *)&v29, 0x16u);

    }
    goto LABEL_12;
  }
  v17 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  v12 = v17;
  if (v6 && !v17)
    goto LABEL_8;
  v18 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  if ((id)v18 == v6)
  {

LABEL_12:
    goto LABEL_13;
  }
  v19 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  v21 = objc_msgSend(v20, "isEqual:", v6);

  if ((v21 & 1) == 0)
  {
LABEL_8:
    v22 = sub_10000BDF4(CFSTR("ckksaccount"), 0);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker container](self, "container"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "options"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accountOverrideInfo"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "altDSID"));
      v29 = 138412546;
      v30 = v27;
      v31 = 2112;
      v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "moving to CK Account info(altDSID: %@): %@", (uint8_t *)&v29, 0x16u);

    }
    v12 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
    -[CKKSAccountStateTracker setCurrentCKAccountInfo:](self, "setCurrentCKAccountInfo:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker ckAccountInfoInitialized](self, "ckAccountInfoInitialized"));
    objc_msgSend(v28, "fulfill");

    -[CKKSAccountStateTracker _onqueueUpdateCKDeviceID:](self, "_onqueueUpdateCKDeviceID:", v6);
    -[CKKSAccountStateTracker _onqueueDeliverCloudKitStateChanges:dispatchGroup:](self, "_onqueueDeliverCloudKitStateChanges:dispatchGroup:", v12, v7);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_onqueueDeliverCloudKitStateChanges:(id)a3 dispatchGroup:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker ckChangeListeners](self, "ckChangeListeners"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyEnumerator"));

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker ckChangeListeners](self, "ckChangeListeners"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

      -[CKKSAccountStateTracker _onqueueDeliverCurrentCloudKitState:listenerQueue:oldStatus:group:](self, "_onqueueDeliverCurrentCloudKitState:listenerQueue:oldStatus:group:", v13, v11, v15, v6);
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

      v11 = (void *)v14;
    }
    while (v14);
  }

}

- (void)_onqueueDeliverCurrentCloudKitState:(id)a3 listenerQueue:(id)a4 oldStatus:(id)a5 group:(id)a6
{
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  CKKSAccountStateTracker *v17;
  id v18;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v13);

  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100050E80;
    v15[3] = &unk_1002EB5C0;
    objc_copyWeak(&v18, &location);
    v16 = v11;
    v17 = self;
    dispatch_group_async(v12, v10, v15);

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);

}

- (void)recheckCKAccountStatus
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker fetchCKAccountStatusScheduler](self, "fetchCKAccountStatusScheduler"));
  objc_msgSend(v2, "trigger");

}

- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3
{
  NSObject *v4;
  dispatch_time_t v5;

  v4 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker notifyCKAccountStatusChange:](self, "notifyCKAccountStatusChange:", 0));
  v5 = dispatch_time(0, a3);
  LOBYTE(a3) = dispatch_semaphore_wait(v4, v5) == 0;

  return a3;
}

- (void)notifyCKAccountStatusChangeAndWaitForSignal
{
  -[CKKSAccountStateTracker notifyCKAccountStatusChangeAndWait:](self, "notifyCKAccountStatusChangeAndWait:", -1);
}

- (void)notifyCircleStatusChangeAndWaitForSignal
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker notifyCircleChange:](self, "notifyCircleChange:", 0));
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

}

- (id)checkForAllDeliveries
{
  dispatch_group_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v10[5];
  NSObject *v11;
  uint8_t buf[16];

  v3 = dispatch_group_create();
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100050BEC;
    v10[3] = &unk_1002E9728;
    v10[4] = self;
    v5 = v3;
    v11 = v5;
    dispatch_sync(v4, v10);

    v6 = v5;
  }
  else
  {
    v7 = sub_10000BDF4(CFSTR("ckksaccount"), 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to get dispatch group.", buf, 2u);
    }

  }
  return v3;
}

- (void)triggerOctagonStatusFetch
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD block[6];
  _QWORD v10[5];
  id v11;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1000507D4;
  v10[4] = sub_1000507E4;
  v11 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000507EC;
  block[3] = &unk_1002EB140;
  block[4] = self;
  block[5] = v10;
  dispatch_sync(v3, block);

  v4 = objc_alloc_init((Class)OTOperationConfiguration);
  objc_msgSend(v4, "setTimeoutWaitForCKAccount:", 100000000);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
  v6 = objc_alloc_init((Class)OTControlArguments);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050870;
  v7[3] = &unk_1002DBF70;
  objc_copyWeak(&v8, &location);
  v7[4] = v10;
  objc_msgSend(v5, "fetchTrustStatus:configuration:reply:", v6, v4, v7);

  objc_destroyWeak(&v8);
  _Block_object_dispose(v10, 8);

  objc_destroyWeak(&location);
}

- (void)setCDPCapableiCloudAccountStatus:(int64_t)a3
{
  CKKSCondition *v5;
  id v6;
  id v7;

  -[CKKSAccountStateTracker setCdpCapableiCloudAccountStatus:](self, "setCdpCapableiCloudAccountStatus:");
  if (a3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker cdpCapableiCloudAccountInitialized](self, "cdpCapableiCloudAccountInitialized"));
    objc_msgSend(v7, "fulfill");
  }
  else
  {
    v5 = [CKKSCondition alloc];
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CKKSAccountStateTracker cdpCapableiCloudAccountInitialized](self, "cdpCapableiCloudAccountInitialized"));
    v6 = -[CKKSCondition initToChain:](v5, "initToChain:");
    -[CKKSAccountStateTracker setCdpCapableiCloudAccountInitialized:](self, "setCdpCapableiCloudAccountInitialized:", v6);

  }
}

- (NSString)octagonPeerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOctagonPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CKKSCondition)finishedInitialDispatches
{
  return (CKKSCondition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFinishedInitialDispatches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CKKSNearFutureScheduler)fetchCKAccountStatusScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CKAccountInfo)currentCKAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentCKAccountInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CKKSCondition)ckAccountInfoInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCkAccountInfoInitialized:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)ckdeviceID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCkdeviceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSError)ckdeviceIDError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCkdeviceIDError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CKKSCondition)ckdeviceIDInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCkdeviceIDInitialized:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (SOSAccountStatus)currentCircleStatus
{
  return (SOSAccountStatus *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentCircleStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)accountCirclePeerID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAccountCirclePeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSError)accountCirclePeerIDError
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAccountCirclePeerIDError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CKKSCondition)accountCirclePeerIDInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAccountCirclePeerIDInitialized:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (OTCliqueStatusWrapper)octagonStatus
{
  return (OTCliqueStatusWrapper *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOctagonStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (CKKSCondition)octagonInformationInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setOctagonInformationInitialized:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (int64_t)cdpCapableiCloudAccountStatus
{
  return self->_cdpCapableiCloudAccountStatus;
}

- (void)setCdpCapableiCloudAccountStatus:(int64_t)a3
{
  self->_cdpCapableiCloudAccountStatus = a3;
}

- (CKKSCondition)cdpCapableiCloudAccountInitialized
{
  return (CKKSCondition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCdpCapableiCloudAccountInitialized:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 152, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMapTable)ckChangeListeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCkChangeListeners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (BOOL)firstCKAccountFetch
{
  return self->_firstCKAccountFetch;
}

- (void)setFirstCKAccountFetch:(BOOL)a3
{
  self->_firstCKAccountFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckChangeListeners, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nsnotificationCenterClass, 0);
  objc_storeStrong((id *)&self->_cdpCapableiCloudAccountInitialized, 0);
  objc_storeStrong((id *)&self->_octagonInformationInitialized, 0);
  objc_storeStrong((id *)&self->_octagonStatus, 0);
  objc_storeStrong((id *)&self->_accountCirclePeerIDInitialized, 0);
  objc_storeStrong((id *)&self->_accountCirclePeerIDError, 0);
  objc_storeStrong((id *)&self->_accountCirclePeerID, 0);
  objc_storeStrong((id *)&self->_currentCircleStatus, 0);
  objc_storeStrong((id *)&self->_ckdeviceIDInitialized, 0);
  objc_storeStrong((id *)&self->_ckdeviceIDError, 0);
  objc_storeStrong((id *)&self->_ckdeviceID, 0);
  objc_storeStrong((id *)&self->_ckAccountInfoInitialized, 0);
  objc_storeStrong((id *)&self->_currentCKAccountInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_fetchCKAccountStatusScheduler, 0);
  objc_storeStrong((id *)&self->_finishedInitialDispatches, 0);
  objc_storeStrong((id *)&self->_octagonPeerID, 0);
}

+ (void)fetchCirclePeerID:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000521A4;
  block[3] = &unk_1002DBF20;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

+ (id)getCircleStatus
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  SOSAccountStatus *v5;
  void *v6;
  id v7;
  void *v9;
  uint8_t buf[4];
  void *v11;

  v9 = 0;
  v2 = SOSCCThisDeviceIsInCircle(&v9);
  if (!v9)
    return -[SOSAccountStatus init:error:]([SOSAccountStatus alloc], "init:error:", v2, 0);
  v3 = sub_10000BDF4(CFSTR("ckks-sos"), 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "error getting circle status: %@", buf, 0xCu);
  }

  v5 = [SOSAccountStatus alloc];
  v6 = v9;
  v7 = -[SOSAccountStatus init:error:](v5, "init:error:", 0xFFFFFFFFLL, v9);

  return v7;
}

+ (id)stringFromAccountStatus:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("account state unknown");
  if (a3 == 1)
    v3 = CFSTR("logged in");
  if (a3 == 3)
    return CFSTR("no account");
  else
    return (id)v3;
}

@end
