@implementation KTAccountStateTracker

- (id)init:(id)a3 nsnotificationCenterClass:(Class)a4
{
  id v7;
  KTAccountStateTracker *v8;
  KTAccountStateTracker *v9;
  uint64_t v10;
  NSMapTable *ckChangeListeners;
  CKAccountInfo *currentCKAccountInfo;
  KTCondition *v13;
  KTCondition *ckAccountInfoInitialized;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  KTCondition *v19;
  KTCondition *finishedInitialDispatches;
  void *v21;
  NSObject *v22;
  KTNearFutureScheduler *v23;
  KTNearFutureScheduler *v24;
  KTNearFutureScheduler *fetchCKAccountStatusScheduler;
  _QWORD v27[4];
  id v28;
  objc_super v29;
  _BYTE buf[24];

  v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)KTAccountStateTracker;
  v8 = -[KTAccountStateTracker init](&v29, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nsnotificationCenterClass, a4);
    v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    ckChangeListeners = v9->_ckChangeListeners;
    v9->_ckChangeListeners = (NSMapTable *)v10;

    currentCKAccountInfo = v9->_currentCKAccountInfo;
    v9->_currentCKAccountInfo = 0;

    v13 = objc_alloc_init(KTCondition);
    ckAccountInfoInitialized = v9->_ckAccountInfoInitialized;
    v9->_ckAccountInfoInitialized = v13;

    objc_storeStrong((id *)&v9->_container, a3);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("ck-account-state", v16);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v17;

    *(_WORD *)&v9->_firstCKAccountFetch = 0;
    v9->_reloadLock._os_unfair_lock_opaque = 0;
    v19 = objc_alloc_init(KTCondition);
    finishedInitialDispatches = v9->_finishedInitialDispatches;
    v9->_finishedInitialDispatches = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class defaultCenter](-[KTAccountStateTracker nsnotificationCenterClass](v9, "nsnotificationCenterClass"), "defaultCenter"));
    if (qword_1002A7720 != -1)
      dispatch_once(&qword_1002A7720, &stru_100247708);
    v22 = qword_1002A7728;
    if (os_log_type_enabled((os_log_t)qword_1002A7728, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Registering with notification center %@", buf, 0xCu);
    }
    objc_msgSend(v21, "addObserver:selector:name:object:", v9, "notifyCKAccountStatusChange:", CKAccountChangedNotification, 0);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v9);
    v23 = [KTNearFutureScheduler alloc];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10013770C;
    v27[3] = &unk_10023A970;
    objc_copyWeak(&v28, (id *)buf);
    v24 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v23, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("ckstatus-refetch"), 5000000000, 600000000000, 0, 0, v27, 1.1);
    fetchCKAccountStatusScheduler = v9->_fetchCKAccountStatusScheduler;
    v9->_fetchCKAccountStatusScheduler = v24;

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

  }
  return v9;
}

- (void)performInitialDispatches
{
  void *v3;
  id v4;
  void *v5;

  v3 = objc_autoreleasePoolPush();
  v4 = -[KTAccountStateTracker notifyCKAccountStatusChange:](self, "notifyCKAccountStatusChange:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker finishedInitialDispatches](self, "finishedInitialDispatches"));
  objc_msgSend(v5, "fulfill");

  objc_autoreleasePoolPop(v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class defaultCenter](-[KTAccountStateTracker nsnotificationCenterClass](self, "nsnotificationCenterClass"), "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)KTAccountStateTracker;
  -[KTAccountStateTracker dealloc](&v4, "dealloc");
}

- (id)descriptionInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v4, v5));

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker descriptionInternal:](self, "descriptionInternal:", v4));

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KTAccountStateTracker;
  v3 = -[KTAccountStateTracker description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker descriptionInternal:](self, "descriptionInternal:", v4));

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
  v6 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100137A2C;
  block[3] = &unk_10023D398;
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
  unsigned int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id location;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  location = 0;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100138030;
  v17[3] = &unk_1002477D0;
  objc_copyWeak(&v19, &location);
  v6 = v5;
  v18 = v6;
  v7 = objc_retainBlock(v17);
  os_unfair_lock_lock(&self->_reloadLock);
  v8 = -[KTAccountStateTracker forceReload](self, "forceReload");
  -[KTAccountStateTracker setForceReload:](self, "setForceReload:", 0);
  os_unfair_lock_unlock(&self->_reloadLock);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker container](self, "container"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001383E8;
    v13[3] = &unk_100247818;
    objc_copyWeak(&v16, &location);
    v14 = v6;
    v15 = v7;
    objc_msgSend(v9, "reloadAccountWithCompletionHandler:", v13);

    objc_destroyWeak(&v16);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker container](self, "container"));
    objc_msgSend(v10, "accountInfoWithCompletionHandler:", v7);

  }
  v11 = v6;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_onqueueUpdateAccountState:(id)a3 deliveredSemaphore:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  NSObject *v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = dispatch_group_create();
  if (v9)
  {
    -[KTAccountStateTracker _onqueueUpdateAccountState:dispatchGroup:](self, "_onqueueUpdateAccountState:dispatchGroup:", v6, v9);
    v10 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100138734;
    block[3] = &unk_10023A390;
    v13 = v7;
    dispatch_group_notify(v9, v10, block);

  }
  else
  {
    if (qword_1002A7720 != -1)
      dispatch_once(&qword_1002A7720, &stru_100247838);
    v11 = qword_1002A7728;
    if (os_log_type_enabled((os_log_t)qword_1002A7728, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Unable to get dispatch group.", buf, 2u);
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
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
  v10 = objc_msgSend(v9, "isEqual:", v6);

  if (!v10)
  {
    v17 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
    v18 = (void *)v17;
    if (!v6 || v17)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
      if ((id)v19 == v6)
      {

LABEL_16:
        goto LABEL_17;
      }
      v20 = (void *)v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
      v22 = objc_msgSend(v21, "isEqual:", v6);

      if ((v22 & 1) != 0)
        goto LABEL_17;
    }
    if (qword_1002A7720 != -1)
      dispatch_once(&qword_1002A7720, &stru_100247878);
    v23 = (void *)qword_1002A7728;
    if (os_log_type_enabled((os_log_t)qword_1002A7728, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker container](self, "container"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "options"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "accountOverrideInfo"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "altDSID"));
      v30 = 138412546;
      v31 = v28;
      v32 = 2112;
      v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "moving to CK Account info(altDSID: %@): %@", (uint8_t *)&v30, 0x16u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker currentCKAccountInfo](self, "currentCKAccountInfo"));
    -[KTAccountStateTracker setCurrentCKAccountInfo:](self, "setCurrentCKAccountInfo:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker ckAccountInfoInitialized](self, "ckAccountInfoInitialized"));
    objc_msgSend(v29, "fulfill");

    -[KTAccountStateTracker _onqueueDeliverCloudKitStateChanges:dispatchGroup:](self, "_onqueueDeliverCloudKitStateChanges:dispatchGroup:", v18, v7);
    goto LABEL_16;
  }
  if (qword_1002A7720 != -1)
    dispatch_once(&qword_1002A7720, &stru_100247858);
  v11 = (void *)qword_1002A7728;
  if (os_log_type_enabled((os_log_t)qword_1002A7728, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker container](self, "container"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "options"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountOverrideInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "altDSID"));
    v30 = 138412546;
    v31 = v16;
    v32 = 2112;
    v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "received another notification of CK Account State(altDSID: %@) %@", (uint8_t *)&v30, 0x16u);

  }
LABEL_17:

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
  v7 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker ckChangeListeners](self, "ckChangeListeners"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyEnumerator"));

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker ckChangeListeners](self, "ckChangeListeners"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

      -[KTAccountStateTracker _onqueueDeliverCurrentCloudKitState:listenerQueue:oldStatus:group:](self, "_onqueueDeliverCurrentCloudKitState:listenerQueue:oldStatus:group:", v13, v11, v15, v6);
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
  KTAccountStateTracker *v17;
  id v18;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  location = 0;
  objc_initWeak(&location, v13);

  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100138CB4;
    v15[3] = &unk_10023A868;
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
  os_unfair_lock_s *p_reloadLock;
  id v4;

  p_reloadLock = &self->_reloadLock;
  os_unfair_lock_lock(&self->_reloadLock);
  -[KTAccountStateTracker setForceReload:](self, "setForceReload:", 1);
  os_unfair_lock_unlock(p_reloadLock);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker fetchCKAccountStatusScheduler](self, "fetchCKAccountStatusScheduler"));
  objc_msgSend(v4, "trigger");

}

- (BOOL)notifyCKAccountStatusChangeAndWait:(unint64_t)a3
{
  NSObject *v4;
  dispatch_time_t v5;

  v4 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker notifyCKAccountStatusChange:](self, "notifyCKAccountStatusChange:", 0));
  v5 = dispatch_time(0, a3);
  LOBYTE(a3) = dispatch_semaphore_wait(v4, v5) == 0;

  return a3;
}

- (void)notifyCKAccountStatusChangeAndWaitForSignal
{
  -[KTAccountStateTracker notifyCKAccountStatusChangeAndWait:](self, "notifyCKAccountStatusChangeAndWait:", -1);
}

- (id)checkForAllDeliveries
{
  dispatch_group_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v9[5];
  NSObject *v10;
  uint8_t buf[16];

  v3 = dispatch_group_create();
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[KTAccountStateTracker queue](self, "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100138F08;
    v9[3] = &unk_10023B3A8;
    v9[4] = self;
    v5 = v3;
    v10 = v5;
    dispatch_sync(v4, v9);

    v6 = v5;
  }
  else
  {
    if (qword_1002A7720 != -1)
      dispatch_once(&qword_1002A7720, &stru_100247898);
    v7 = qword_1002A7728;
    if (os_log_type_enabled((os_log_t)qword_1002A7728, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Unable to get dispatch group.", buf, 2u);
    }
  }

  return v3;
}

- (KTCondition)finishedInitialDispatches
{
  return (KTCondition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFinishedInitialDispatches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CKAccountInfo)currentCKAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentCKAccountInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (KTCondition)ckAccountInfoInitialized
{
  return (KTCondition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCkAccountInfoInitialized:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTNearFutureScheduler)fetchCKAccountStatusScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 40, 1);
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMapTable)ckChangeListeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCkChangeListeners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)firstCKAccountFetch
{
  return self->_firstCKAccountFetch;
}

- (void)setFirstCKAccountFetch:(BOOL)a3
{
  self->_firstCKAccountFetch = a3;
}

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_ckChangeListeners, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nsnotificationCenterClass, 0);
  objc_storeStrong((id *)&self->_fetchCKAccountStatusScheduler, 0);
  objc_storeStrong((id *)&self->_ckAccountInfoInitialized, 0);
  objc_storeStrong((id *)&self->_currentCKAccountInfo, 0);
  objc_storeStrong((id *)&self->_finishedInitialDispatches, 0);
}

@end
