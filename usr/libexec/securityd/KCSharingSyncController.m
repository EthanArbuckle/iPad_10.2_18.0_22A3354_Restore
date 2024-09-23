@implementation KCSharingSyncController

- (KCSharingSyncController)init
{
  void *v3;
  id v4;
  id v5;
  KCSharingStore *v6;
  void *v7;
  KCSharingSyncController *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerIDForContainerIdentifier:](CKContainer, "containerIDForContainerIdentifier:", CFSTR("com.apple.security.shared.keychain")));
  v4 = objc_alloc_init((Class)CKContainerOptions);
  objc_msgSend(v4, "setUseZoneWidePCS:", 1);
  objc_msgSend(v4, "setApplicationBundleIdentifierOverrideForContainerAccess:", CFSTR("com.apple.security.kcsharing"));
  objc_msgSend(v4, "setApplicationBundleIdentifierOverrideForPushTopicGeneration:", CFSTR("com.apple.security.kcsharing"));
  v5 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:options:", v3, v4);
  v6 = objc_alloc_init(KCSharingStore);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[KCSharingMessagingdConnection sharedInstance](KCSharingMessagingdConnection, "sharedInstance"));
  v8 = -[KCSharingSyncController initWithStore:container:privateSyncEngine:sharedSyncEngine:messagingdConnection:forTesting:](self, "initWithStore:container:privateSyncEngine:sharedSyncEngine:messagingdConnection:forTesting:", v6, v5, 0, 0, v7, 0);

  return v8;
}

- (KCSharingSyncController)initWithStore:(id)a3 container:(id)a4 privateSyncEngine:(id)a5 sharedSyncEngine:(id)a6 messagingdConnection:(id)a7 forTesting:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[KCSharingSyncController initWithStore:container:privateSyncEngine:sharedSyncEngine:messagingdConnection:lockStateTracker:forTesting:](self, "initWithStore:container:privateSyncEngine:sharedSyncEngine:messagingdConnection:lockStateTracker:forTesting:", a3, a4, a5, a6, a7, 0, v9);
}

- (KCSharingSyncController)initWithStore:(id)a3 container:(id)a4 privateSyncEngine:(id)a5 sharedSyncEngine:(id)a6 messagingdConnection:(id)a7 lockStateTracker:(id)a8 forTesting:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  KCSharingSyncController *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  NSOperationQueue *v24;
  NSOperationQueue *operationQueue;
  CKKSLockStateTracker *v26;
  CKKSLockStateTracker *lockStateTracker;
  CKKSNearFutureScheduler *v28;
  CKKSNearFutureScheduler *nearFutureScheduler;
  CKNotificationListener *v30;
  CKNotificationListener *notificationListener;
  CKNotificationListener *v32;
  void *v33;
  void *v34;
  void *v35;
  CKNotificationListener *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  id v44;
  void **v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id location;
  objc_super v53;

  v16 = a3;
  v17 = a4;
  v44 = a5;
  v43 = a6;
  v42 = a7;
  v18 = a8;
  v53.receiver = self;
  v53.super_class = (Class)KCSharingSyncController;
  v19 = -[KCSharingSyncController init](&v53, "init");
  if (v19)
  {
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_create("com.apple.security.keychain.sharing.KCSharingSyncController", v21);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v19->_store, a3);
    objc_storeStrong((id *)&v19->_container, a4);
    objc_storeStrong((id *)&v19->_privateSyncEngine, a5);
    objc_storeStrong((id *)&v19->_sharedSyncEngine, a6);
    objc_storeStrong((id *)&v19->_messagingdConnection, a7);
    v24 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v24;

    if (v18)
      v26 = (CKKSLockStateTracker *)v18;
    else
      v26 = (CKKSLockStateTracker *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](CKKSLockStateTracker, "globalTracker"));
    lockStateTracker = v19->_lockStateTracker;
    v19->_lockStateTracker = v26;

    if (!a9)
    {
      v28 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]([CKKSNearFutureScheduler alloc], "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("KCSharingScheduler"), 10000000000, 0, 0, &stru_1002DD478);
      nearFutureScheduler = v19->_nearFutureScheduler;
      v19->_nearFutureScheduler = v28;

      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v19);
      v30 = (CKNotificationListener *)objc_msgSend(objc_alloc((Class)CKNotificationListener), "initWithMachServiceName:", CFSTR("com.apple.securityd.aps"));
      notificationListener = v19->_notificationListener;
      v19->_notificationListener = v30;

      v32 = v19->_notificationListener;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "privateCloudDatabase"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController subscriptionIDForDatabase:](v19, "subscriptionIDForDatabase:", v33));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "privateCloudDatabase"));
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_1000DACAC;
      v50[3] = &unk_1002DD4A0;
      objc_copyWeak(&v51, &location);
      -[CKNotificationListener registerForSubscriptionWithID:inDatabase:handler:](v32, "registerForSubscriptionWithID:inDatabase:handler:", v34, v35, v50);

      v36 = v19->_notificationListener;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sharedCloudDatabase"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController subscriptionIDForDatabase:](v19, "subscriptionIDForDatabase:", v37));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sharedCloudDatabase"));
      v45 = _NSConcreteStackBlock;
      v46 = 3221225472;
      v47 = sub_1000DAD3C;
      v48 = &unk_1002DD4A0;
      objc_copyWeak(&v49, &location);
      -[CKNotificationListener registerForSubscriptionWithID:inDatabase:handler:](v36, "registerForSubscriptionWithID:inDatabase:handler:", v38, v39, &v45);

      -[KCSharingSyncController resetReinitOperationWithDelay:](v19, "resetReinitOperationWithDelay:", 0);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
    }
    -[CKKSLockStateTracker addLockStateObserver:](v19->_lockStateTracker, "addLockStateObserver:", v19, v16, v42, v43, v44, v45, v46, v47, v48);
    v16 = v41;
  }

  return v19;
}

- (void)resetReinitOperationWithDelay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  _QWORD v18[5];
  id v19;
  id location[2];

  if (self->_operationQueue)
  {
    v3 = a3;
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000DA7C0;
    v18[3] = &unk_1002EA8C8;
    v18[4] = self;
    objc_copyWeak(&v19, location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v18));
    WeakRetained = objc_loadWeakRetained((id *)&self->_initializeEnginesOperation);
    v7 = WeakRetained;
    if (WeakRetained && objc_msgSend(WeakRetained, "isPending"))
    {
      v8 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not setting up engine reinit: have extant operation", v17, 2u);
      }

    }
    else
    {
      v10 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting up engine reinit operation to run at unlock time", v17, 2u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController lockStateTracker](self, "lockStateTracker"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "unlockDependency"));
      objc_msgSend(v5, "addNullableDependency:", v13);

      if (v3)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler operationDependency](self->_nearFutureScheduler, "operationDependency"));
        objc_msgSend(v5, "addNullableDependency:", v14);

        -[CKKSNearFutureScheduler trigger](self->_nearFutureScheduler, "trigger");
      }
      objc_storeWeak((id *)&self->_initializeEnginesOperation, v5);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    v15 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No operation queue, let's hope we're testing!", (uint8_t *)location, 2u);
    }

  }
}

- (void)deviceDidLock
{
  NSObject *v3;
  NSOperationQueue *operationQueue;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  CKSyncEngine *privateSyncEngine;
  CKSyncEngine *sharedSyncEngine;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];
  uint8_t v17[16];

  v3 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  operationQueue = self->_operationQueue;
  v5 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (operationQueue)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device locked: deallocating engines if needed", buf, 2u);
    }

    if (self->_privateSyncEngine && self->_sharedSyncEngine)
    {
      v8 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device locked: deallocating engines", v15, 2u);
      }

      privateSyncEngine = self->_privateSyncEngine;
      self->_privateSyncEngine = 0;

      sharedSyncEngine = self->_sharedSyncEngine;
      self->_sharedSyncEngine = 0;

    }
    v12 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device locked: setting up reinit engines operation", v14, 2u);
    }

    -[KCSharingSyncController resetReinitOperationWithDelay:](self, "resetReinitOperationWithDelay:", 0);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No operation queue, let's hope we're testing!", v17, 2u);
    }

  }
}

- (BOOL)isLockedError:(id)a3
{
  return -[KCSharingSyncController isLockedError:duringFetchForEngine:](self, "isLockedError:duringFetchForEngine:", a3, 0);
}

- (BOOL)isLockedError:(id)a3 duringFetchForEngine:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  BOOL v11;
  _QWORD block[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController lockStateTracker](self, "lockStateTracker")),
        v9 = objc_msgSend(v8, "isLockedError:", v6),
        v8,
        v9))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v10 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DA67C;
    block[3] = &unk_1002EA8C8;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)preflightWithCompletion:(id)a3
{
  -[KCSharingSyncController preflightWithCompletion:delay:](self, "preflightWithCompletion:delay:", a3, 0);
}

- (void)preflightWithCompletion:(id)a3 delay:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[8];

  v4 = a4;
  v6 = a3;
  v7 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting up preflight operation to run at unlock time", buf, 2u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D9F9C;
  v13[3] = &unk_1002E97B8;
  v13[4] = self;
  objc_copyWeak(&v15, (id *)buf);
  v9 = v6;
  v14 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v13));
  WeakRetained = objc_loadWeakRetained((id *)&self->_initializeEnginesOperation);
  objc_msgSend(v10, "addNullableDependency:", WeakRetained);

  if (v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler operationDependency](self->_nearFutureScheduler, "operationDependency"));
    objc_msgSend(v10, "addNullableDependency:", v12);

    -[CKKSNearFutureScheduler trigger](self->_nearFutureScheduler, "trigger");
  }
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)registerProvisioningActivity
{
  xpc_object_t empty;
  _QWORD handler[5];

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, XPC_ACTIVITY_RANDOM_INITIAL_DELAY, 0xE10uLL);
  xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, &_xpc_BOOL_true);
  xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRES_CLASS_A, &_xpc_BOOL_true);
  xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRES_BUDDY_COMPLETE, &_xpc_BOOL_true);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000D9F8C;
  handler[3] = &unk_1002DD508;
  handler[4] = self;
  xpc_activity_register("com.apple.securityd.kcsharing.provisioning", empty, handler);

}

- (void)unregisterProvisioningActivity
{
  xpc_activity_unregister("com.apple.securityd.kcsharing.provisioning");
}

- (void)handleProvisioningActivity:(id)a3 isRetry:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  _BYTE location[24];

  v4 = a4;
  v6 = a3;
  v7 = (void *)os_transaction_create("com.apple.securityd.kcsharing.handleProvisioningActivity");
  if (xpc_activity_get_state((xpc_activity_t)v6) == 4 || xpc_activity_set_state((xpc_activity_t)v6, 4))
  {
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000D9D5C;
    v16 = &unk_1002DD558;
    objc_copyWeak(&v19, (id *)location);
    v17 = v7;
    v20 = v4;
    v18 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v13));
    WeakRetained = objc_loadWeakRetained((id *)&self->_initializeEnginesOperation);
    objc_msgSend(v8, "addNullableDependency:", WeakRetained, v13, v14, v15, v16);

    if (v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSNearFutureScheduler operationDependency](self->_nearFutureScheduler, "operationDependency"));
      objc_msgSend(v8, "addNullableDependency:", v10);

      -[CKKSNearFutureScheduler trigger](self->_nearFutureScheduler, "trigger");
    }
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v11 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134217984;
      *(_QWORD *)&location[4] = xpc_activity_get_state((xpc_activity_t)v6);
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to initiate provisioning activity; current state=%ld",
        location,
        0xCu);
    }

  }
}

- (void)ensureCurrentUserProvisionedWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD);
  _QWORD *v12;
  _QWORD *v13;
  _QWORD block[8];
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  dispatch_group_t v24;

  v4 = (void (**)(id, _QWORD))a3;
  if (-[KCSharingSyncController isCurrentUserProvisioned](self, "isCurrentUserProvisioned")
    && -[KCSharingSyncController isCurrentUserIdentifierAvailable](self, "isCurrentUserIdentifierAvailable"))
  {
    v5 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "The user's already provisioned.", buf, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x3032000000;
    v22 = sub_1000D85D8;
    v23 = sub_1000D85E8;
    v24 = (dispatch_group_t)0xAAAAAAAAAAAAAAAALL;
    v24 = dispatch_group_create();
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_1000D85D8;
    v17[4] = sub_1000D85E8;
    v18 = (id)0xAAAAAAAAAAAAAAAALL;
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = sub_1000D85D8;
    v15[4] = sub_1000D85E8;
    v16 = 0;
    v7 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D9824;
    block[3] = &unk_1002DD5D0;
    block[4] = self;
    block[5] = v15;
    block[6] = buf;
    block[7] = v17;
    dispatch_sync(v7, block);

    v8 = *((_QWORD *)v20 + 5);
    v9 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005520;
    v10[3] = &unk_1002DD5F8;
    v12 = v15;
    v13 = v17;
    v11 = v4;
    dispatch_group_notify(v8, v9, v10);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v17, 8);

    _Block_object_dispose(buf, 8);
  }

}

- (void)fetchCurrentUserIdentifierFromCloudKitWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fetching current user identifier from CloudKit...", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController container](self, "container"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006830;
  v9[3] = &unk_1002DD620;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "fetchUserRecordIDWithCompletionHandler:", v9);

}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  void (**v10)(id, void *, _QWORD);
  uint8_t buf[16];

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController currentUserMetadata](self, "currentUserMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentUserIdentifier")));

  if (v6)
  {
    v7 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fetched cached current user identifier from store", buf, 2u);
    }

    v4[2](v4, v6, 0);
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006958;
    v9[3] = &unk_1002DD648;
    v9[4] = self;
    v10 = v4;
    -[KCSharingSyncController fetchCurrentUserIdentifierFromCloudKitWithReply:](self, "fetchCurrentUserIdentifierFromCloudKitWithReply:", v9);

  }
}

- (void)processDatabaseModifications
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processing KCSharing-relevant SecDb modifications", v5, 2u);
  }

  -[KCSharingSyncController saveAllOutgoingChangesWithCompletion:](self, "saveAllOutgoingChangesWithCompletion:", &stru_1002DD668);
}

- (void)saveAllOutgoingChangesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D96C0;
  v6[3] = &unk_1002DDC68;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[KCSharingSyncController stageAllOutgoingChangesWithCompletion:](self, "stageAllOutgoingChangesWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[8];

  v4 = a3;
  v5 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting up maintenance operation to run now or after unlock", buf, 2u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D942C;
  v15[3] = &unk_1002EA830;
  objc_copyWeak(&v17, (id *)buf);
  v7 = v4;
  v16 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v15));
  v9 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D9508;
  block[3] = &unk_1002E95B8;
  block[4] = self;
  v10 = v7;
  v14 = v10;
  v11 = v8;
  v13 = v11;
  dispatch_sync(v9, block);

  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v11);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)stageAllOutgoingChangesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id location;

  v4 = (void (**)(id, _QWORD))a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000D85D8;
  v12 = sub_1000D85E8;
  v13 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D9238;
  block[3] = &unk_1002DD690;
  objc_copyWeak(&v7, &location);
  block[4] = &v8;
  dispatch_sync(v5, block);

  v4[2](v4, v9[5]);
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
}

- (void)saveStagedOutgoingChangesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  uint8_t buf[16];
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_1000D85D8;
  v24[4] = sub_1000D85E8;
  v25 = (id)0xAAAAAAAAAAAAAAAALL;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = dispatch_group_create();
  v6 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Asking sync engines to save all staged outgoing changes", buf, 2u);
  }

  dispatch_group_enter(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController privateSyncEngine](self, "privateSyncEngine"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000D8F8C;
  v20[3] = &unk_1002ED298;
  v22 = v24;
  v9 = v5;
  v21 = v9;
  objc_msgSend(v8, "modifyPendingChangesWithCompletionHandler:", v20);

  dispatch_group_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController sharedSyncEngine](self, "sharedSyncEngine"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000D9014;
  v17[3] = &unk_1002ED298;
  v19 = v24;
  v11 = v9;
  v18 = v11;
  objc_msgSend(v10, "modifyPendingChangesWithCompletionHandler:", v17);

  v12 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D909C;
  v14[3] = &unk_1002DD6B8;
  v15 = v4;
  v16 = v24;
  v13 = v4;
  dispatch_group_notify(v11, v12, v14);

  _Block_object_dispose(v24, 8);
}

- (void)fetchRemoteChangesForZoneIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8F7C;
  block[3] = &unk_1002E95B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)_onQueueFetchRemoteChangesForZoneIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD block[4];
  id v30;
  __int128 *p_buf;
  _QWORD *v32;
  _QWORD v33[5];
  NSObject *v34;
  _QWORD *v35;
  _QWORD v36[5];
  NSObject *v37;
  _QWORD *v38;
  uint8_t v39[16];
  _QWORD v40[5];
  id v41;
  NSErrorUserInfoKey v42;
  uint64_t v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v6 = a3;
  v7 = a4;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_1000D85D8;
  v40[4] = sub_1000D85E8;
  v41 = (id)0xAAAAAAAAAAAAAAAALL;
  v41 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = dispatch_group_create();
  v9 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Force-fetching remote changes for zoneIDs=%{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = sub_1000D85D8;
  v47 = sub_1000D85E8;
  v48 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController privateSyncEngine](self, "privateSyncEngine"));
  if (!v11
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController sharedSyncEngine](self, "sharedSyncEngine")),
        v13 = v12 == 0,
        v12,
        v11,
        v13))
  {
    v14 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to force-fetch because engines aren't loaded, will ask for fetch after unlock", v39, 2u);
    }

    *(_WORD *)&self->_receivedPrivatePushesWhileLocked = 257;
    v16 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 35, 0));
    v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v16;

    v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v42 = NSUnderlyingErrorKey;
    v43 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
    v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 14, v19));
    v21 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v20;

  }
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    dispatch_group_enter(v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController privateSyncEngine](self, "privateSyncEngine"));
    objc_msgSend(v22, "setNeedsToFetchChanges");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController privateSyncEngine](self, "privateSyncEngine"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000D8C30;
    v36[3] = &unk_1002DD6E0;
    v38 = v40;
    v36[4] = self;
    v24 = v8;
    v37 = v24;
    objc_msgSend(v23, "fetchChangesWithCompletionHandler:", v36);

    dispatch_group_enter(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController sharedSyncEngine](self, "sharedSyncEngine"));
    objc_msgSend(v25, "setNeedsToFetchChanges");

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController sharedSyncEngine](self, "sharedSyncEngine"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000D8CE8;
    v33[3] = &unk_1002DD6E0;
    v35 = v40;
    v33[4] = self;
    v34 = v24;
    objc_msgSend(v26, "fetchChangesForZoneIDs:completionHandler:", v6, v33);

  }
  v27 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8DA0;
  block[3] = &unk_1002DD5F8;
  p_buf = &buf;
  v32 = v40;
  v30 = v7;
  v28 = v7;
  dispatch_group_notify(v8, v27, block);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v40, 8);

}

- (void)sendNewIDSInvitesForRecord:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[4];
  void *v15;

  v4 = a3;
  v5 = objc_opt_class(CKShare);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = sub_10004D234(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asking ksmd to send new invites if needed for group %@", buf, 0xCu);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController messagingdConnection](self, "messagingdConnection"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000D8B18;
      v12[3] = &unk_1002DD798;
      v13 = v7;
      objc_msgSend(v11, "sendNewInvitesForGroup:completion:", v13, v12);

      v10 = v13;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cannot send invitation for group, share didn't groupify", buf, 2u);
    }

  }
}

- (void)wipe:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, id);
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v4 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "🚨 WIPING KCSHARING DATA. Include cloud data: %{BOOL}d", buf, 8u);
  }

  if (v4)
  {
    v9 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Not actually wiping data because cloud data deletion is not implemented", buf, 2u);
    }

    v19 = NSLocalizedDescriptionKey;
    v20 = CFSTR("Not implemented");
    v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 32, v11));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
    v16 = 0;
    objc_msgSend(v13, "wipeWithError:", &v16);
    v12 = v16;

    v14 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v11 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to delete local data: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Completed data wipe", buf, 2u);
      }
      v12 = 0;
    }
  }

  v6[2](v6, v12);
}

- (id)fetchOutgoingChangesWithScope:(int64_t)a3 cursor:(id)a4
{
  KCSharingStore *store;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;

  store = self->_store;
  v14 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore fetchOutgoingChangesWithCursor:maxChangeCount:maxBatchSizeInBytes:error:](store, "fetchOutgoingChangesWithCursor:maxChangeCount:maxBatchSizeInBytes:error:", a4, 100, 1572864, &v14));
  v8 = v14;
  if (!v7)
  {
    v9 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = CKDatabaseScopeString(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to fetch next record batch for scope=%{public}@ error=%@", buf, 0x16u);

    }
    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v8);
  }

  return v7;
}

- (id)fetchCursorForScope:(int64_t)a3 zoneIDs:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  KCSharingStore *store;
  void *v11;
  id v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  KCSharingOutgoingChangesetCursor *v24;
  KCSharingOutgoingChangesetCursor *v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;

  v6 = a4;
  v7 = CKDatabaseScopeString(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("outgoingChangesetCursor"), v8));

  store = self->_store;
  v31 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore fetchValueForMetadataKey:error:](store, "fetchValueForMetadataKey:error:", v9, &v31));
  v12 = v31;
  if (v11)
    v13 = v12 == 0;
  else
    v13 = 0;
  if (v13)
  {
    v30 = 0;
    v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(KCSharingOutgoingChangesetCursor), v11, &v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v14 = v30;
    v21 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if (!v20 || v14)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v28 = CKDatabaseScopeString(a3);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138412546;
        v33 = v29;
        v34 = 2112;
        v35 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to decode outgoing cursor for scope=%@: %@", buf, 0x16u);

      }
      v24 = -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:desiredZoneIDs:]([KCSharingOutgoingChangesetCursor alloc], "initWithDatabaseScope:desiredZoneIDs:", a3, v6);
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Successfully fetched stored cursor %@", buf, 0xCu);
      }

      v24 = v20;
    }
    v25 = v24;

  }
  else
  {
    v14 = v12;
    if (v12)
    {
      -[KCSharingSyncController isLockedError:](self, "isLockedError:", v12);
      v15 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = CKDatabaseScopeString(a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        *(_DWORD *)buf = 138412546;
        v33 = v18;
        v34 = 2112;
        v35 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to retrieve outgoing cursor for scope=%@: %@", buf, 0x16u);

      }
    }
    else
    {
      v26 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v16 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No stored cursor found, creating and returning fresh one", buf, 2u);
      }
    }

    v25 = -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:desiredZoneIDs:]([KCSharingOutgoingChangesetCursor alloc], "initWithDatabaseScope:desiredZoneIDs:", a3, v6);
  }

  return v25;
}

- (BOOL)saveCursor:(id)a3 forScope:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  KCSharingStore *store;
  unsigned int v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSObject *v35;

  v6 = a3;
  v7 = CKDatabaseScopeString(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("outgoingChangesetCursor"), v8));

  if (v6)
  {
    v29 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v29));
    v11 = v29;
    if (v10)
      v12 = v11 == 0;
    else
      v12 = 0;
    if (!v12)
    {
      v13 = v11;
      v14 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = CKDatabaseScopeString(a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        *(_DWORD *)buf = 138412802;
        v31 = v6;
        v32 = 2112;
        v33 = v17;
        v34 = 2112;
        v35 = v13;
        v18 = "Failed to encode cursor %@ for scope=%@: %@";
LABEL_20:
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v18, buf, 0x20u);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else
  {
    v10 = 0;
  }
  store = self->_store;
  v28 = 0;
  v20 = -[KCSharingStore setValue:forMetadataKey:error:](store, "setValue:forMetadataKey:error:", v10, v9, &v28);
  v21 = v28;
  if (v20)
    v22 = v21 == 0;
  else
    v22 = 0;
  if (!v22)
  {
    v13 = v21;
    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v21);
    v23 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v15 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v27 = CKDatabaseScopeString(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138412802;
      v31 = v6;
      v32 = 2112;
      v33 = v17;
      v34 = 2112;
      v35 = v13;
      v18 = "Failed to set cursor %@ for scope=%@: %@";
      goto LABEL_20;
    }
LABEL_14:

    v24 = 0;
    goto LABEL_18;
  }
  v25 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v13 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Successfully saved/removed cursor", buf, 2u);
  }
  v24 = 1;
LABEL_18:

  return v24;
}

- (BOOL)obtainAuthoritativeGroupsForPrivate:(id)a3 shared:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  dispatch_group_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  uint64_t v25;
  NSObject *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  void **v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *);
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t *v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  id v62;
  NSErrorUserInfoKey v63;
  void *v64;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9 || !v10 || !a5)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingSyncController.m"), 873, CFSTR("Must provide all arguments to this function"));

  }
  v12 = dispatch_group_create();
  v13 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v13, "setName:", CFSTR("authoritativeGroupFetch"));
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_1000D85D8;
  v59 = sub_1000D85E8;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_1000D85D8;
  v53 = sub_1000D85E8;
  v54 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKFetchRecordZonesOperation fetchAllRecordZonesOperation](CKFetchRecordZonesOperation, "fetchAllRecordZonesOperation"));
  objc_msgSend(v14, "setGroup:", v13);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000D85F0;
  v45[3] = &unk_1002DD708;
  v48 = &v55;
  v15 = v12;
  v46 = v15;
  v16 = v9;
  v47 = v16;
  objc_msgSend(v14, "setFetchRecordZonesCompletionBlock:", v45);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKFetchRecordZonesOperation fetchAllRecordZonesOperation](CKFetchRecordZonesOperation, "fetchAllRecordZonesOperation"));
  objc_msgSend(v17, "setGroup:", v13);
  v38 = _NSConcreteStackBlock;
  v39 = 3221225472;
  v40 = sub_1000D88B0;
  v41 = &unk_1002DD708;
  v44 = &v49;
  v18 = v15;
  v42 = v18;
  v19 = v11;
  v43 = v19;
  objc_msgSend(v17, "setFetchRecordZonesCompletionBlock:", &v38);
  dispatch_group_enter(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController container](self, "container", v38, v39, v40, v41));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "privateCloudDatabase"));
  objc_msgSend(v21, "addOperation:", v14);

  dispatch_group_enter(v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController container](self, "container"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sharedCloudDatabase"));
  objc_msgSend(v23, "addOperation:", v17);

  v24 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v18, v24))
  {
    v25 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to complete CloudKit group fetch before deadline", buf, 2u);
    }

    v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 36, 0));
  }
  else if (v56[5] || v50[5])
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v29 = v28;
    if (v56[5])
      objc_msgSend(v28, "addObject:");
    if (v50[5])
      objc_msgSend(v29, "addObject:");
    v63 = NSMultipleUnderlyingErrorsKey;
    v64 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 34, v30));

    v31 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v36 = *a5;
      *(_DWORD *)buf = 138412290;
      v62 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to fetch all known CloudKit groups: %@", buf, 0xCu);
    }

    v27 = 0;
  }
  else
  {
    v34 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Fetched all known CloudKit groups", buf, 2u);
    }

    v27 = 1;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v27;
}

- (id)unmirroredZonesForPrivate:(id)a3 shared:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *k;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
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
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  id v75;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9 || !v10 || !a5)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingSyncController.m"), 970, CFSTR("Must supply arguments to this function"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = objc_msgSend(v9, "mutableCopy");
  v57 = objc_msgSend(v11, "mutableCopy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v70 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchAllSharingGroupsInMirrorWithError:", &v70));
  v16 = v70;

  v56 = v15;
  if (!v15 || v16)
  {
    v47 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v75 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to fetch groups from mirror: %{public}@", buf, 0xCu);
    }

    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v16);
    v46 = v57;
    if (v16)
    {
      v45 = 0;
      *a5 = objc_retainAutorelease(v16);
    }
    else
    {
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 35, 0)));
      *a5 = v49;

      v45 = 0;
    }
  }
  else
  {
    v54 = v11;
    v55 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    v20 = v13;
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v67 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "groupID"));
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v25);

        }
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      }
      while (v21);
    }
    v53 = v12;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v27 = v13;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(_QWORD *)v63 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j);
          v33 = sub_10004CEEC(v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v34));

          if (v35)
            objc_msgSend(v26, "addObject:", v32);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v29);
    }
    v52 = v20;

    objc_msgSend(v27, "removeObjectsForKeys:", v26);
    objc_msgSend(v26, "removeAllObjects");
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v36 = v57;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v59;
      do
      {
        for (k = 0; k != v38; k = (char *)k + 1)
        {
          if (*(_QWORD *)v59 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k);
          v42 = sub_10004CEEC(v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v43));

          if (v44)
            objc_msgSend(v26, "addObject:", v41);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      }
      while (v38);
    }

    objc_msgSend(v36, "removeObjectsForKeys:", v26);
    v12 = v53;
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v27, CFSTR("privateDB"));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v36, CFSTR("sharedDB"));
    v45 = v53;

    v11 = v54;
    v9 = v55;
    v16 = 0;
    v13 = v52;
    v46 = v57;
  }

  return v45;
}

- (BOOL)haveUnmirroredGroups:(id)a3 forDatabase:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
      v14 = 138412546;
      v15 = v6;
      v16 = 2114;
      v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unmirrored %@ CloudKit zones: %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }

  return v8 != 0;
}

- (void)resyncFromRPC:(BOOL)a3 completion:(id)a4
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  BOOL v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _BYTE buf[24];

  v7 = a4;
  if (!v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingSyncController.m"), 1026, CFSTR("Not passing a completion handler here is a bug"));

  }
  v8 = -[KCSharingSyncController currentUserMetadataFeatureUsage](self, "currentUserMetadataFeatureUsage");
  v9 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8 != 1)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v8;
      v12 = "KCSharing feature usage: %lu, proceeding with resync";
      v13 = v10;
      v14 = 12;
      goto LABEL_9;
    }
LABEL_10:

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D7A14;
    v24[3] = &unk_1002E97B8;
    v24[4] = self;
    objc_copyWeak(&v26, (id *)buf);
    v15 = v7;
    v25 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v24));
    v17 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D7AF0;
    block[3] = &unk_1002DD730;
    block[4] = self;
    v22 = v15;
    v23 = a3;
    v18 = v16;
    v21 = v18;
    dispatch_sync(v17, block);

    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v18);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }
  if (a3)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      v12 = "KCSharing appears not to be in use, resyncing anyway because RPC";
      v13 = v10;
      v14 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "KCSharing appears not to be in use, foregoing resync", buf, 2u);
  }

  (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
LABEL_14:

}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  const __CFString *v44;

  v4 = (void (**)(id, _QWORD, id))a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
    v41 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchAllSharingGroupsInMirrorWithError:", &v41));
    v7 = (__CFString *)v41;

    if (!v6 || v7)
    {
      v31 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to fetch groups from mirror: %{public}@", buf, 0xCu);
      }

      -[KCSharingSyncController isLockedError:](self, "isLockedError:", v7);
      if (v7)
      {
        v4[2](v4, 0, v7);
LABEL_33:

        goto LABEL_34;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 35, 0));
      v4[2](v4, 0, v8);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v34 = v6;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupID"));
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v11);
      }

      v16 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
        *(_DWORD *)buf = 138543362;
        v44 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Local group IDs: %{public}@", buf, 0xCu);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v36 = 0;
      v21 = -[KCSharingSyncController obtainAuthoritativeGroupsForPrivate:shared:error:](self, "obtainAuthoritativeGroupsForPrivate:shared:error:", v19, v20, &v36);
      v22 = v36;
      v23 = v22;
      if ((v21 & 1) != 0)
      {
        v35 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController unmirroredZonesForPrivate:shared:error:](self, "unmirroredZonesForPrivate:shared:error:", v19, v20, &v35));
        v25 = v35;

        if (!v24 || v25)
        {
          v6 = v34;
          if (v25)
          {
            v4[2](v4, 0, v25);
          }
          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 34, 0));
            v4[2](v4, 0, v33);

          }
        }
        else
        {
          v26 = -[KCSharingSyncController haveUnmirroredGroups:forDatabase:](self, "haveUnmirroredGroups:forDatabase:", v24, CFSTR("privateDB"));
          v27 = v26 | -[KCSharingSyncController haveUnmirroredGroups:forDatabase:](self, "haveUnmirroredGroups:forDatabase:", v24, CFSTR("sharedDB"));
          v28 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = CFSTR("are");
            if (v27)
              v30 = CFSTR("aren't");
            *(_DWORD *)buf = 138412290;
            v44 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Verification complete, groups %@ in sync", buf, 0xCu);
          }

          v4[2](v4, v27 ^ 1, 0);
          v6 = v34;
        }

      }
      else
      {
        v4[2](v4, 0, v22);
        v25 = v23;
        v6 = v34;
      }

    }
    goto LABEL_33;
  }
LABEL_34:

}

- (id)subscriptionIDForDatabase:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = CKDatabaseScopeString(objc_msgSend(a3, "databaseScope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKSyncEngineDatabaseSubscription-%@"), v4));

  return v5;
}

- (void)lockStateChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v11;

  v3 = a3;
  v5 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = &stru_1002EE888;
    if (v3)
      v7 = CFSTR("un");
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CKKSLockStateTracker notified us of lock state change: %{public}@locked", buf, 0xCu);
  }

  if (!v3)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[KCSharingSyncController queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D7A0C;
    block[3] = &unk_1002EC350;
    block[4] = self;
    dispatch_sync(v8, block);

  }
}

- (id)recordZonesToSaveForSyncEngine:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;

  v4 = a3;
  v5 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
    v8 = CKDatabaseScopeString(objc_msgSend(v7, "databaseScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Requesting zones to save for scope=%{public}@", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
  v25 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fetchZonesToSaveToDatabaseWithScope:error:", objc_msgSend(v11, "databaseScope"), &v25));
  v13 = v25;

  v14 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
      v18 = CKDatabaseScopeString(objc_msgSend(v17, "databaseScope"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138412546;
      v27 = v12;
      v28 = 2114;
      v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Saving new zones=%@ for scope=%{public}@", buf, 0x16u);

    }
    v20 = v12;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
      v23 = CKDatabaseScopeString(objc_msgSend(v22, "databaseScope"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543618;
      v27 = v24;
      v28 = 2112;
      v29 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to fetch zones to save for scope=%{public}@ with error=%@", buf, 0x16u);

    }
    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v13);
  }

  return v12;
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "database"));
    v10 = CKDatabaseScopeString(objc_msgSend(v9, "databaseScope"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138412546;
    v13 = v6;
    v14 = 2114;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully saved zone=%@ for scope=%{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "database"));
    v27 = CKDatabaseScopeString(objc_msgSend(v26, "databaseScope"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138412802;
    v31 = v9;
    v32 = 2114;
    v33 = v28;
    v34 = 2112;
    v35 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to save zone=%@ for scope=%{public}@ with error=%@", buf, 0x20u);

  }
  v13 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "database"));
    v16 = CKDatabaseScopeString(objc_msgSend(v15, "databaseScope"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138412546;
    v31 = v9;
    v32 = 2114;
    v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Dropping outgoing share entry in zone=%@ for scope=%{public}@", buf, 0x16u);

  }
  v18 = objc_alloc((Class)CKRecordID);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneID"));
  v20 = objc_msgSend(v18, "initWithRecordName:zoneID:", CKRecordNameZoneWideShare, v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v29 = 0;
  v22 = objc_msgSend(v21, "dropOutgoingChangeForRecordID:error:", v20, &v29);
  v23 = v29;

  if ((v22 & 1) == 0)
  {
    v24 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v9;
      v32 = 2112;
      v33 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to drop outgoing share entry in zone=%@ with error=%@", buf, 0x16u);
    }

    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v23);
  }

}

- (id)recordZoneIDsToDeleteForSyncEngine:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;

  v4 = a3;
  v5 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
    v8 = CKDatabaseScopeString(objc_msgSend(v7, "databaseScope"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting zone IDs to delete for scope=%{public}@", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
  v25 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fetchZoneIDsToDeleteFromDatabaseWithScope:error:", objc_msgSend(v11, "databaseScope"), &v25));
  v13 = v25;

  v14 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
      v18 = CKDatabaseScopeString(objc_msgSend(v17, "databaseScope"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138412546;
      v27 = v12;
      v28 = 2114;
      v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Deleting zoneIDs=%@ for scope=%{public}@", buf, 0x16u);

    }
    v20 = v12;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "database"));
      v23 = CKDatabaseScopeString(objc_msgSend(v22, "databaseScope"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543618;
      v27 = v24;
      v28 = 2112;
      v29 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to fetch zone IDs to delete for scope=%{public}@ with error=%@", buf, 0x16u);

    }
    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v13);
  }

  return v12;
}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  id v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v19 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v14 = 0;
  v8 = objc_msgSend(v6, "updateMirrorWithDeletedZoneIDs:error:", v7, &v14);
  v9 = v14;

  if ((v8 & 1) == 0)
  {
    v10 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to delete zoneID=%@ from mirror with error=%@", buf, 0x16u);
    }

    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v9);
  }
  v12 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleted zoneID=%@ from mirror", buf, 0xCu);
  }

}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to delete zoneID=%@ from CloudKit with error=%@", buf, 0x16u);
  }

  v13 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "database"));
    v16 = CKDatabaseScopeString(objc_msgSend(v15, "databaseScope"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138412546;
    v26 = v9;
    v27 = 2114;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Dropping outgoing share deletion in zoneID=%@ for scope=%{public}@", buf, 0x16u);

  }
  v18 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", CKRecordNameZoneWideShare, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v24 = 0;
  v20 = objc_msgSend(v19, "dropOutgoingChangeForRecordID:error:", v18, &v24);
  v21 = v24;

  if ((v20 & 1) == 0)
  {
    v22 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v9;
      v27 = 2112;
      v28 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to drop outgoing share deletion in zoneID=%@ with error=%@", buf, 0x16u);
    }

    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v21);
  }

}

- (id)syncEngine:(id)a3 nextBatchOfRecordsToModifyForZoneIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  KCSharingOutgoingChangesetCursor *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  KCSharingOutgoingChangesetCursor *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  KCSharingOutgoingChangesetCursor *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  NSObject *v44;
  _BOOL4 v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
  v9 = CKDatabaseScopeString(objc_msgSend(v8, "databaseScope"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v48 = v10;
    v49 = 2112;
    v50 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting next record batch for scope=%{public}@ in zoneIDs=%@", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
  v14 = (KCSharingOutgoingChangesetCursor *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController fetchCursorForScope:zoneIDs:](self, "fetchCursorForScope:zoneIDs:", objc_msgSend(v13, "databaseScope"), v7));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController fetchOutgoingChangesWithScope:cursor:](self, "fetchOutgoingChangesWithScope:cursor:", objc_msgSend(v15, "databaseScope"), v14));

  if (!v16)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
    -[KCSharingSyncController saveCursor:forScope:](self, "saveCursor:forScope:", 0, objc_msgSend(v21, "databaseScope"));
    v25 = 0;
    v24 = v14;
    goto LABEL_18;
  }
  if (objc_msgSend(v16, "isEmpty"))
  {
    v17 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v48 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Initial change set for scope=%{public}@ was empty; restaging to pick up stragglers",
        buf,
        0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
    -[KCSharingSyncController saveCursor:forScope:](self, "saveCursor:forScope:", 0, objc_msgSend(v19, "databaseScope"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
    v46 = 0;
    objc_msgSend(v20, "stageAllOutgoingChangesWithError:", &v46);
    v21 = v46;

    if (v21)
    {
      v22 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v48 = v10;
        v49 = 2112;
        v50 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to restage scope=%{public}@ outgoing changes: %@", buf, 0x16u);
      }

      -[KCSharingSyncController isLockedError:](self, "isLockedError:", v21);
      v24 = v14;
LABEL_11:

LABEL_12:
      v25 = 0;
      goto LABEL_18;
    }
    v39 = [KCSharingOutgoingChangesetCursor alloc];
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
    v24 = -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:desiredZoneIDs:](v39, "initWithDatabaseScope:desiredZoneIDs:", objc_msgSend(v40, "databaseScope"), v7);

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController fetchOutgoingChangesWithScope:cursor:](self, "fetchOutgoingChangesWithScope:cursor:", objc_msgSend(v41, "databaseScope"), v24));

    if (!v26)
    {
      v21 = 0;
      goto LABEL_12;
    }
    v42 = objc_msgSend(v26, "isEmpty");
    v43 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v44 = objc_claimAutoreleasedReturnValue(v43);
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
    if (v42)
    {
      if (v45)
      {
        *(_DWORD *)buf = 138543618;
        v48 = v10;
        v49 = 2112;
        v50 = v7;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Uploaded all records for scope=%{public}@ in zoneIDs=%@", buf, 0x16u);
      }

      v16 = v26;
      goto LABEL_11;
    }
    if (v45)
    {
      *(_DWORD *)buf = 138543362;
      v48 = v10;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Found changes to upload for scope=%{public}@ after restaging", buf, 0xCu);
    }

  }
  else
  {
    v24 = v14;
    v26 = v16;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cursor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
  -[KCSharingSyncController saveCursor:forScope:](self, "saveCursor:forScope:", v27, objc_msgSend(v28, "databaseScope"));

  v29 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recordsToSave"));
    v32 = objc_msgSend(v31, "count");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recordIDsToDelete"));
    v34 = objc_msgSend(v33, "count");
    *(_DWORD *)buf = 134218754;
    v48 = v32;
    v49 = 2048;
    v50 = v34;
    v51 = 2114;
    v52 = v10;
    v53 = 2112;
    v54 = v7;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Returning batch of %lu + %lu records to upload in scope=%{public}@, zoneIDs=%@", buf, 0x2Au);

  }
  v35 = objc_alloc((Class)CKSyncEngineBatch);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recordsToSave"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "recordIDsToDelete"));
  v25 = objc_msgSend(v35, "initWithRecordsToSave:recordIDsToDelete:", v36, v37);

  objc_msgSend(v25, "setAtomic:", 0);
  v21 = v26;
LABEL_18:

  return v25;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v5;
  KCSharingStore *store;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  id v20;

  v5 = a4;
  store = self->_store;
  v20 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v15 = 0;
  v8 = -[KCSharingStore updateMirrorWithSavedRecords:deletedRecordIDs:error:](store, "updateMirrorWithSavedRecords:deletedRecordIDs:error:", v7, 0, &v15);
  v9 = v15;

  if ((v8 & 1) == 0)
  {
    v10 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordID"));
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to update mirror with saved record %@ with error=%@", buf, 0x16u);

    }
    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v9);
  }
  v12 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Successfully uploaded record=%@", buf, 0xCu);
  }

  -[KCSharingSyncController sendNewIDSInvitesForRecord:](self, "sendNewIDSInvitesForRecord:", v5);
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  KCSharingStore *store;
  unsigned __int8 v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  int IsCode;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordName"));
  v13 = objc_msgSend(v12, "isEqualToString:", CKRecordNameZoneWideShare);

  if (v13)
  {
    v14 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v9;
      v42 = 2112;
      v43 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Dropping outgoing entry for share=%@ that failed to save with error=%@", buf, 0x16u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
    v39 = 0;
    v18 = objc_msgSend(v16, "dropOutgoingChangeForRecordID:error:", v17, &v39);
    v19 = v39;

    if ((v18 & 1) == 0)
    {
      v20 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v9;
        v42 = 2112;
        v43 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to drop outgoing entry for share=%@ with error=%@", buf, 0x16u);
      }

      -[KCSharingSyncController isLockedError:](self, "isLockedError:", v19);
    }
LABEL_17:

    goto LABEL_27;
  }
  if (CKErrorIsCode(v10, 14))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CKRecordChangedErrorServerRecordKey));

    if (v19)
    {
      store = self->_store;
      v38 = 0;
      v24 = -[KCSharingStore stageIncomingRecord:error:](store, "stageIncomingRecord:error:", v19, &v38);
      v25 = v38;
      if ((v24 & 1) == 0)
      {
        v26 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to stage conflicting server record with error=%@", buf, 0xCu);
        }

        -[KCSharingSyncController isLockedError:](self, "isLockedError:", v25);
      }
      v28 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v9;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Staged conflicting server record=%@", buf, 0xCu);
      }

      goto LABEL_17;
    }
  }
  IsCode = CKErrorIsCode(v10, 11);
  v31 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v32 = objc_claimAutoreleasedReturnValue(v31);
  v33 = v32;
  if (IsCode)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
      *(_DWORD *)buf = 138412290;
      v41 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Failed to save recordID=%@ because we missed a deletion, will treat it as deletion now", buf, 0xCu);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
    -[KCSharingSyncController syncEngine:recordWithIDWasDeleted:recordType:](self, "syncEngine:recordWithIDWasDeleted:recordType:", v8, v35, CFSTR("unused"));

    objc_msgSend(v8, "setNeedsToFetchChanges");
  }
  else
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to save record=%@", buf, 0xCu);
    }

    v36 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, " => error=%@", buf, 0xCu);
    }

  }
LABEL_27:

}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v5;
  KCSharingStore *store;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  id v17;

  v5 = a4;
  store = self->_store;
  v17 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v14 = 0;
  v8 = -[KCSharingStore updateMirrorWithSavedRecords:deletedRecordIDs:error:](store, "updateMirrorWithSavedRecords:deletedRecordIDs:error:", 0, v7, &v14);
  v9 = v14;

  if ((v8 & 1) == 0)
  {
    v10 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to update mirror with deleted record with error=%@", buf, 0xCu);
    }

    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v9);
  }
  v12 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleted record with recordID=%@", buf, 0xCu);
  }

}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  NSObject *v22;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
  v10 = objc_msgSend(v9, "isEqualToString:", CKRecordNameZoneWideShare);

  v11 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Dropping outgoing deletion for shareRecordID=%@ that failed to delete with error=%@", buf, 0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
    v18 = 0;
    v15 = objc_msgSend(v14, "dropOutgoingChangeForRecordID:error:", v7, &v18);
    v12 = v18;

    if ((v15 & 1) == 0)
    {
      v16 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v7;
        v21 = 2112;
        v22 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to drop outgoing deletion for shareRecordID=%@ with error=%@", buf, 0x16u);
      }

      -[KCSharingSyncController isLockedError:](self, "isLockedError:", v12);
    }
  }
  else if (v13)
  {
    *(_DWORD *)buf = 138412546;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to delete record for recordID=%@ with error=%@", buf, 0x16u);
  }

}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  KCSharingStore *store;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
    v11 = CKDatabaseScopeString(objc_msgSend(v10, "databaseScope"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    v20 = v12;
    v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sync engine %@ did fetch record %@", buf, 0x16u);

  }
  store = self->_store;
  v18 = 0;
  v14 = -[KCSharingStore stageIncomingRecord:error:](store, "stageIncomingRecord:error:", v7, &v18);
  v15 = v18;
  if ((v14 & 1) == 0)
  {
    v16 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to stage incoming record with error=%@", buf, 0xCu);
    }

    -[KCSharingSyncController isLockedError:duringFetchForEngine:](self, "isLockedError:duringFetchForEngine:", v15, v6);
  }

}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "database"));
    v11 = CKDatabaseScopeString(objc_msgSend(v10, "databaseScope"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    v22 = 2114;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Staging incoming share deletion in zoneID=%@ for scope=%{public}@", buf, 0x16u);

  }
  v13 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", CKRecordNameZoneWideShare, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v19 = 0;
  v15 = objc_msgSend(v14, "stageIncomingDeletionForRecordID:error:", v13, &v19);
  v16 = v19;

  if ((v15 & 1) == 0)
  {
    v17 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to stage incoming share deletion in zoneID=%@ with error=%@", buf, 0x16u);
    }

    -[KCSharingSyncController isLockedError:duringFetchForEngine:](self, "isLockedError:duringFetchForEngine:", v16, v6);
  }

}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  KCSharingStore *store;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "database"));
    v12 = CKDatabaseScopeString(objc_msgSend(v11, "databaseScope"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2114;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Staging incoming record deletion with recordID=%@ for scope=%{public}@", buf, 0x16u);

  }
  store = self->_store;
  v19 = 0;
  v15 = -[KCSharingStore stageIncomingDeletionForRecordID:error:](store, "stageIncomingDeletionForRecordID:error:", v8, &v19);
  v16 = v19;
  if ((v15 & 1) == 0)
  {
    v17 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to stage incoming deletion for recordID=%@ with error=%@", buf, 0x16u);
    }

    -[KCSharingSyncController isLockedError:duringFetchForEngine:](self, "isLockedError:duringFetchForEngine:", v16, v7);
  }

}

- (void)syncEngineDidEndFetchingChanges:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v5 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished staging incoming changes; applying...",
      buf,
      2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v19 = 0;
  v9 = objc_msgSend(v8, "mergeWithUpdateInfos:error:", v7, &v19);
  v10 = v19;

  if ((v9 & 1) == 0)
  {
    v11 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to apply staged incoming changes with error=%@", buf, 0xCu);
    }

    -[KCSharingSyncController isLockedError:duringFetchForEngine:](self, "isLockedError:duringFetchForEngine:", v10, v4);
  }
  if (objc_msgSend(v7, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[KCSharingGroupNotificationConnection sharedInstance](KCSharingGroupNotificationConnection, "sharedInstance"));
    objc_msgSend(v13, "groupsUpdatedWithInfos:", v7);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController xpcListenerDelegate](self, "xpcListenerDelegate"));
  objc_msgSend(v14, "groupsUpdated");

  v15 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  v18 = (void *)KCSharingGroupsUpdatedNotification;
  if (v17)
  {
    *(_DWORD *)buf = 138412290;
    v21 = (id)KCSharingGroupsUpdatedNotification;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "posting notification %@", buf, 0xCu);
  }

  notify_post((const char *)objc_msgSend(v18, "UTF8String"));
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  CKSyncEngine *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  KCSharingStore *store;
  unsigned __int8 v15;
  void *v16;
  KCSharingStore *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v28;

  v6 = (CKSyncEngine *)a3;
  v7 = a4;
  v8 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKSyncEngine database](v6, "database"));
    v11 = CKDatabaseScopeString(objc_msgSend(v10, "databaseScope"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating %@ engine metadata", buf, 0xCu);

  }
  if (self->_privateSyncEngine == v6)
  {
    store = self->_store;
    v26 = 0;
    v15 = -[KCSharingStore setValue:forMetadataKey:error:](store, "setValue:forMetadataKey:error:", v7, CFSTR("CKSyncEnginePrivateMetadata"), &v26);
    v16 = v26;
  }
  else
  {
    if (self->_sharedSyncEngine != v6)
    {
      v13 = 0;
      goto LABEL_9;
    }
    v17 = self->_store;
    v25 = 0;
    v15 = -[KCSharingStore setValue:forMetadataKey:error:](v17, "setValue:forMetadataKey:error:", v7, CFSTR("CKSyncEngineSharedMetadata"), &v25);
    v16 = v25;
  }
  v13 = v16;
  if ((v15 & 1) == 0)
  {
LABEL_9:
    v18 = -[KCSharingSyncController isLockedError:](self, "isLockedError:", v13);
    v19 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        v22 = "Failed to update engine metadata because locked";
        v23 = v20;
        v24 = 2;
LABEL_16:
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      v22 = "Failed to update engine metadata with error=%@";
      v23 = v20;
      v24 = 12;
      goto LABEL_16;
    }

  }
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  KCSharingStore *store;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v5 = a4;
  v6 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting record for recordID=%@", buf, 0xCu);
  }

  store = self->_store;
  v15 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore fetchOutgoingRecordWithRecordID:error:](store, "fetchOutgoingRecordWithRecordID:error:", v5, &v15));
  v10 = v15;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch record for recordID=%@ with error=%@", buf, 0x16u);
    }

    -[KCSharingSyncController isLockedError:](self, "isLockedError:", v10);
  }

  return v9;
}

- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  KCSharingSyncController *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  NSObject *v29;
  unsigned __int8 v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;

  v36 = a3;
  v35 = a4;
  v8 = a5;
  v9 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "database"));
    v12 = CKDatabaseScopeString(objc_msgSend(v11, "scope"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543874;
    v41 = (uint64_t)v13;
    v42 = 2114;
    v43 = (uint64_t)v35;
    v44 = 2114;
    v45 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ sync engine received account changed notification: %{public}@ -> %{public}@", buf, 0x20u);

  }
  v14 = self;
  objc_sync_enter(v14);
  v15 = (void *)os_transaction_create("com.apple.securityd.kcsharing.accountChanged");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](v14, "store"));
  v39 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fetchValueForMetadataKey:error:", CFSTR("CurrentUserMetadata"), &v39));
  v18 = v39;

  if (v17 || !v18)
  {
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("currentUserIdentifier")));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordName"));
    if ((objc_msgSend((id)v22, "isEqual:", v23) & 1) == 0 && v22 | v23)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](v14, "store"));
      v38 = 0;
      v27 = objc_msgSend(v26, "wipeWithError:", &v38);
      v25 = v38;

      if ((v27 & 1) == 0)
      {
        v28 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = (uint64_t)v25;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to wipe store with error %@", buf, 0xCu);
        }

        -[KCSharingSyncController isLockedError:](v14, "isLockedError:", v25);
      }
      v37 = 0;
      v30 = -[KCSharingSyncController updateCurrentUserMetadataForKey:toValue:withError:](v14, "updateCurrentUserMetadataForKey:toValue:withError:", CFSTR("currentUserIdentifier"), v23, &v37);
      v31 = v37;
      if ((v30 & 1) == 0)
      {
        v32 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = (uint64_t)v31;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to update currentUserMetadata after wiping store for account changed notification: %{public}@", buf, 0xCu);
        }

      }
      if (v8)
        -[KCSharingSyncController registerProvisioningActivity](v14, "registerProvisioningActivity");
      else
        -[KCSharingSyncController unregisterProvisioningActivity](v14, "unregisterProvisioningActivity");

      v21 = 0;
    }
    else
    {
      v24 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v41 = v22;
        v42 = 2114;
        v43 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Ignored account changed notification: currentUserIdentifer=%{public}@ -> newUserIdentifier=%{public}@", buf, 0x16u);
      }
      v21 = 1;
    }

  }
  else
  {
    v19 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v41 = (uint64_t)v18;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Ignored account changed notification because we failed to fetch currentUserMetadata: %{public}@", buf, 0xCu);
    }

    -[KCSharingSyncController isLockedError:](v14, "isLockedError:", v18);
    v21 = 1;
  }

  objc_sync_exit(v14);
  if (!v21)
  {
    if (v8)
      -[KCSharingSyncController fetchRemoteChangesForZoneIDs:completion:](v14, "fetchRemoteChangesForZoneIDs:completion:", 0, &stru_1002DD750);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController xpcListenerDelegate](v14, "xpcListenerDelegate"));
    objc_msgSend(v34, "accountChanged");

  }
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v17;
  void *v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController lockStateTracker](self, "lockStateTracker"));
  v7 = objc_msgSend(v6, "isLocked");

  v8 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "database"));
      v12 = CKDatabaseScopeString(objc_msgSend(v11, "databaseScope"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v17 = 138543362;
      v18 = v13;
      v14 = "Declining fetch for scope=%{public}@, we believe the device is locked";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0xCu);

    }
  }
  else if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "database"));
    v15 = CKDatabaseScopeString(objc_msgSend(v11, "databaseScope"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = 138543362;
    v18 = v13;
    v14 = "Accepting fetch for scope=%{public}@, we believe device is unlocked";
    goto LABEL_6;
  }

  return v7 ^ 1;
}

- (id)currentUserMetadata
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchValueForMetadataKey:error:", CFSTR("CurrentUserMetadata"), &v9));
  v5 = v9;

  -[KCSharingSyncController isLockedError:](self, "isLockedError:", v5);
  if (!v4)
  {
    v6 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Current user metadata not found: %{public}@", buf, 0xCu);
    }

  }
  return v4;
}

- (BOOL)updateCurrentUserMetadataForKey:(id)a3 toValue:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  NSObject *v31;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController currentUserMetadata](self, "currentUserMetadata"));
  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v8));
  v16 = objc_msgSend(v15, "isEqual:", v9);

  if (v16)
  {
    v17 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = 1;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CurrentUserMetadata for key %@ already at new value (or removed)", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v14, "setValue:forKey:", v9, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController store](self, "store"));
    v25 = 0;
    v21 = objc_msgSend(v20, "setValue:forMetadataKey:error:", v14, CFSTR("CurrentUserMetadata"), &v25);
    v18 = v25;

    if ((v21 & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      -[KCSharingSyncController isLockedError:](self, "isLockedError:", v18);
      v22 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v27 = v8;
        v28 = 2114;
        v29 = v9;
        v30 = 2114;
        v31 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to update current user metadata for key \"%{public}@\" to value \"%{public}@\" with error: %{public}@", buf, 0x20u);
      }

      if (a5)
      {
        v18 = objc_retainAutorelease(v18);
        v19 = 0;
        *a5 = v18;
      }
      else
      {
        v19 = 0;
      }
    }
  }

  return v19;
}

- (BOOL)isCurrentUserProvisioned
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController currentUserMetadata](self, "currentUserMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("pv")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isCurrentUserIdentifierAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController currentUserMetadata](self, "currentUserMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentUserIdentifier")));
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)currentUserMetadataFeatureUsage
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingSyncController currentUserMetadata](self, "currentUserMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("isInUse")));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

- (BOOL)setCurrentUserMetadataFeatureUsage:(unint64_t)a3
{
  void *v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  id v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v11 = 0;
  v6 = -[KCSharingSyncController updateCurrentUserMetadataForKey:toValue:withError:](self, "updateCurrentUserMetadataForKey:toValue:withError:", CFSTR("isInUse"), v5, &v11);
  v7 = v11;

  if (v7)
  {
    v8 = KCSharingLogObject(CFSTR("KCSharingSyncController"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v13 = a3;
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set feature usage to %lu: %@", buf, 0x16u);
    }

  }
  return v6;
}

- (void)setFeatureInUse
{
  -[KCSharingSyncController setCurrentUserMetadataFeatureUsage:](self, "setCurrentUserMetadataFeatureUsage:", 2);
}

- (KCSharingStore)store
{
  return self->_store;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKSyncEngine)privateSyncEngine
{
  return self->_privateSyncEngine;
}

- (CKSyncEngine)sharedSyncEngine
{
  return self->_sharedSyncEngine;
}

- (KCSharingXPCListenerDelegate)xpcListenerDelegate
{
  return (KCSharingXPCListenerDelegate *)objc_loadWeakRetained((id *)&self->_xpcListenerDelegate);
}

- (void)setXpcListenerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_xpcListenerDelegate, a3);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (KCSharingMessagingdConnection)messagingdConnection
{
  return self->_messagingdConnection;
}

- (void)setMessagingdConnection:(id)a3
{
  objc_storeStrong((id *)&self->_messagingdConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingdConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_destroyWeak((id *)&self->_xpcListenerDelegate);
  objc_storeStrong((id *)&self->_sharedSyncEngine, 0);
  objc_storeStrong((id *)&self->_privateSyncEngine, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_nearFutureScheduler, 0);
  objc_destroyWeak((id *)&self->_resyncOperation);
  objc_destroyWeak((id *)&self->_maintenanceOperation);
  objc_destroyWeak((id *)&self->_initializeEnginesOperation);
  objc_storeStrong((id *)&self->_notificationListener, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

+ (KCSharingSyncController)sharedInstance
{
  if (qword_100341098 != -1)
    dispatch_once(&qword_100341098, &stru_1002DD4C0);
  return (KCSharingSyncController *)(id)qword_1003410A0;
}

@end
