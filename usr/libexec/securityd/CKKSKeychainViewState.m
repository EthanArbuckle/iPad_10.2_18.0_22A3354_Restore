@implementation CKKSKeychainViewState

- (CKKSKeychainViewState)initWithZoneID:(id)a3 forContextID:(id)a4 ckksManagedView:(BOOL)a5 priorityView:(BOOL)a6 notifyViewChangedScheduler:(id)a7 notifyViewReadyScheduler:(id)a8
{
  id v15;
  id v16;
  id v17;
  CKKSKeychainViewState *v18;
  uint64_t v19;
  NSString *zoneName;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  NSOperationQueue *v23;
  NSOperationQueue *operationQueue;
  NSMutableDictionary *v25;
  NSMutableDictionary *mutableStateConditions;
  NSSet *allowableStates;
  CKKSKeychainViewState *v28;
  SecLaunchSequence *v29;
  SecLaunchSequence *launch;
  SecLaunchSequence *v31;
  void *v32;
  id v34;
  _QWORD v35[4];
  CKKSKeychainViewState *v36;
  objc_super v37;

  v15 = a3;
  v34 = a4;
  v16 = a7;
  v17 = a8;
  v37.receiver = self;
  v37.super_class = (Class)CKKSKeychainViewState;
  v18 = -[CKKSKeychainViewState init](&v37, "init");
  if (v18)
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName", v34));
    zoneName = v18->_zoneName;
    v18->_zoneName = (NSString *)v19;

    objc_storeStrong((id *)&v18->_zoneID, a3);
    objc_storeStrong((id *)&v18->_contextID, a4);
    v18->_priorityView = a6;
    v18->_ckksManagedView = a5;
    v21 = dispatch_queue_create("key-state", 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v21;

    v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = v23;

    objc_storeStrong((id *)&v18->_notifyViewChangedScheduler, a7);
    objc_storeStrong((id *)&v18->_notifyViewReadyScheduler, a8);
    if (qword_100341028 != -1)
      dispatch_once(&qword_100341028, &stru_1002DCBE0);
    objc_storeStrong((id *)&v18->_allowableStates, (id)qword_100341020);
    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableStateConditions = v18->_mutableStateConditions;
    v18->_mutableStateConditions = v25;

    allowableStates = v18->_allowableStates;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100187DA0;
    v35[3] = &unk_1002E9E20;
    v28 = v18;
    v36 = v28;
    -[NSSet enumerateObjectsUsingBlock:](allowableStates, "enumerateObjectsUsingBlock:", v35);
    -[CKKSKeychainViewState setViewKeyHierarchyState:](v28, "setViewKeyHierarchyState:", CFSTR("initializing"));
    v29 = (SecLaunchSequence *)objc_msgSend(objc_alloc((Class)SecLaunchSequence), "initWithRocketName:", CFSTR("com.apple.security.ckks.launch"));
    launch = v28->_launch;
    v28->_launch = v29;

    v31 = v28->_launch;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
    -[SecLaunchSequence addAttribute:value:](v31, "addAttribute:value:", CFSTR("view"), v32);

    v28->_readyNotificationArmed = 0;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState contextID](self, "contextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState zoneName](self, "zoneName"));
  if (-[CKKSKeychainViewState ckksManagedView](self, "ckksManagedView"))
    v5 = CFSTR("ckks");
  else
    v5 = CFSTR("ext");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState viewKeyHierarchyState](self, "viewKeyHierarchyState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSKeychainViewState(%@): %@(%@), %@>"), v3, v4, v5, v6));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKKSKeychainViewState *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  CKKSKeychainViewState *v11;
  void *v12;

  v4 = [CKKSKeychainViewState alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState zoneID](self, "zoneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState contextID](self, "contextID"));
  v7 = -[CKKSKeychainViewState ckksManagedView](self, "ckksManagedView");
  v8 = -[CKKSKeychainViewState priorityView](self, "priorityView");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState notifyViewReadyScheduler](self, "notifyViewReadyScheduler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState notifyViewReadyScheduler](self, "notifyViewReadyScheduler"));
  v11 = -[CKKSKeychainViewState initWithZoneID:forContextID:ckksManagedView:priorityView:notifyViewChangedScheduler:notifyViewReadyScheduler:](v4, "initWithZoneID:forContextID:ckksManagedView:priorityView:notifyViewChangedScheduler:notifyViewReadyScheduler:", v5, v6, v7, v8, v9, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState viewKeyHierarchyState](self, "viewKeyHierarchyState"));
  -[CKKSKeychainViewState setViewKeyHierarchyState:](v11, "setViewKeyHierarchyState:", v12);

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState zoneName](self, "zoneName"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState contextID](self, "contextID"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_opt_class(CKKSKeychainViewState);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState zoneName](self, "zoneName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
    if (objc_msgSend(v7, "isEqualToString:", v8)
      && (v9 = -[CKKSKeychainViewState ckksManagedView](self, "ckksManagedView"),
          v9 == objc_msgSend(v6, "ckksManagedView")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState viewKeyHierarchyState](self, "viewKeyHierarchyState"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewKeyHierarchyState"));
      if (objc_msgSend(v11, "isEqualToString:", v12))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState contextID](self, "contextID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
        v10 = objc_msgSend(v13, "isEqualToString:", v14);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (OctagonStateString)viewKeyHierarchyState
{
  return self->_viewKeyHierarchyState;
}

- (void)setViewKeyHierarchyState:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  CKKSKeychainViewState *v10;
  SEL v11;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100187B28;
  block[3] = &unk_1002EB3B0;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_sync(v6, block);

}

- (NSDictionary)keyHierarchyConditions
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
  v10 = sub_100187AC0;
  v11 = sub_100187AD0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100187AD8;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)launchComplete
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState launch](self, "launch"));
  objc_msgSend(v3, "launch");

  v4 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100187A5C;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)armReadyNotification
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100187A50;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (SecLaunchSequence)launch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLaunch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)ckksManagedView
{
  return self->_ckksManagedView;
}

- (BOOL)priorityView
{
  return self->_priorityView;
}

- (CKKSNearFutureScheduler)notifyViewChangedScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotifyViewChangedScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CKKSNearFutureScheduler)notifyViewReadyScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNotifyViewReadyScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAllowableStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMutableStateConditions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)readyNotificationArmed
{
  return self->_readyNotificationArmed;
}

- (void)setReadyNotificationArmed:(BOOL)a3
{
  self->_readyNotificationArmed = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mutableStateConditions, 0);
  objc_storeStrong((id *)&self->_allowableStates, 0);
  objc_storeStrong((id *)&self->_notifyViewReadyScheduler, 0);
  objc_storeStrong((id *)&self->_notifyViewChangedScheduler, 0);
  objc_storeStrong((id *)&self->_launch, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_viewKeyHierarchyState, 0);
}

@end
