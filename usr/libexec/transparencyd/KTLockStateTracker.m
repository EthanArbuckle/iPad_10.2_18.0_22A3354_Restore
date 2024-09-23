@implementation KTLockStateTracker

- (KTLockStateTracker)initWithProvider:(id)a3
{
  id v5;
  KTLockStateTracker *v6;
  KTLockStateTracker *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSOperationQueue *v12;
  NSOperationQueue *operationQueue;
  uint64_t v14;
  NSHashTable *observers;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  id v20;
  _QWORD handler[4];
  id v22;
  id location;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)KTLockStateTracker;
  v6 = -[KTLockStateTracker init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lockStateProvider, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("lock-state-tracker", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v12;

    v7->_notify_token = -1;
    v7->_queueIsLocked = 1;
    v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    -[KTLockStateTracker resetUnlockDependency](v7, "resetUnlockDependency");
    location = 0;
    objc_initWeak(&location, v7);
    v16 = v7->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10014C750;
    handler[3] = &unk_10023D170;
    objc_copyWeak(&v22, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v7->_notify_token, v16, handler);
    v17 = v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014C77C;
    block[3] = &unk_10023A970;
    objc_copyWeak(&v20, &location);
    dispatch_async(v17, block);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  int notify_token;
  objc_super v4;

  notify_token = self->_notify_token;
  if (notify_token != -1)
    notify_cancel(notify_token);
  v4.receiver = self;
  v4.super_class = (Class)KTLockStateTracker;
  -[KTLockStateTracker dealloc](&v4, "dealloc");
}

- (BOOL)isLocked
{
  OS_dispatch_queue *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10014C888;
  v5[3] = &unk_100246758;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)lastUnlockTime
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
  v10 = sub_10014C97C;
  v11 = sub_10014C98C;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[KTLockStateTracker queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10014C994;
  v6[3] = &unk_10023D540;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (BOOL)hasBeenUnlocked
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLockStateTracker lockStateProvider](self, "lockStateProvider"));
  v3 = objc_msgSend(v2, "hasBeenUnlocked");

  return v3;
}

- (id)description
{
  unsigned int v3;
  unsigned int v4;
  const __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = -[KTLockStateTracker isLocked](self, "isLocked");
  v4 = -[KTLockStateTracker hasBeenUnlocked](self, "hasBeenUnlocked");
  if (v3)
    v5 = CFSTR("locked");
  else
    v5 = CFSTR("unlocked");
  if (v3)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[KTLockStateTracker lastUnlockedTime](self, "lastUnlockedTime"));
  else
    v6 = CFSTR("now");
  v7 = CFSTR(" stillLocked");
  if (v4)
    v7 = &stru_1002508B8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTLockStateTracker: %@ last:%@%@>"), v5, v6, v7));
  if (v3)

  return v8;
}

- (void)resetUnlockDependency
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[KTLockStateTracker unlockDependency](self, "unlockDependency"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLockStateTracker unlockDependency](self, "unlockDependency")),
        v6 = objc_msgSend(v5, "isPending"),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](KTResultOperation, "named:withBlock:", CFSTR("keybag-unlocked-dependency"), &stru_100248168));
    objc_msgSend(v7, "setDescriptionErrorCode:", 2);
    -[KTLockStateTracker setUnlockDependency:](self, "setUnlockDependency:", v7);

  }
}

- (void)_onqueueRecheck
{
  NSObject *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSHashTable *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  dispatch_queue_global_t global_queue;
  NSObject *v19;
  _QWORD v20[5];
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = objc_claimAutoreleasedReturnValue(-[KTLockStateTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[KTLockStateTracker queueIsLocked](self, "queueIsLocked");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLockStateTracker lockStateProvider](self, "lockStateProvider"));
  -[KTLockStateTracker setQueueIsLocked:](self, "setQueueIsLocked:", objc_msgSend(v5, "queryAKSLocked"));

  if (v4 == -[KTLockStateTracker queueIsLocked](self, "queueIsLocked") && (byte_1002A77C0 & 1) != 0)
    return;
  byte_1002A77C0 = 1;
  if (-[KTLockStateTracker queueIsLocked](self, "queueIsLocked"))
  {
    -[KTLockStateTracker resetUnlockDependency](self, "resetUnlockDependency");
    if ((v4 & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTLockStateTracker operationQueue](self, "operationQueue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTLockStateTracker unlockDependency](self, "unlockDependency"));
    objc_msgSend(v6, "addOperation:", v7);

    -[KTLockStateTracker setUnlockDependency:](self, "setUnlockDependency:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[KTLockStateTracker setLastUnlockedTime:](self, "setLastUnlockedTime:", v8);

LABEL_8:
  v9 = -[KTLockStateTracker queueIsLocked](self, "queueIsLocked");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_observers;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = v9 ^ 1;
    v14 = *(_QWORD *)v23;
LABEL_10:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v14)
        objc_enumerationMutation(v10);
      v16 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v15);
      if (!v16)
        break;
      v17 = v16;
      global_queue = dispatch_get_global_queue(21, 0);
      v19 = objc_claimAutoreleasedReturnValue(global_queue);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10014CE78;
      v20[3] = &unk_100248190;
      v20[4] = v17;
      v21 = v13;
      dispatch_async(v19, v20);

      if (v12 == (id)++v15)
      {
        v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          goto LABEL_10;
        break;
      }
    }
  }

}

- (void)recheck
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[KTLockStateTracker queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014CEF4;
  block[3] = &unk_10023A390;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (BOOL)lockedError:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "code") == (id)-25308)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("securityd")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
      v5 = objc_msgSend(v6, "isEqualToString:", kCFErrorDomainOSStatus);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)checkErrorChainForLockState:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  do
  {
    v6 = -[KTLockStateTracker lockedError:](self, "lockedError:", v5);
    if (v6)
      break;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v5 = (void *)v8;
  }
  while (v8);

  return v6;
}

- (BOOL)isLockedError:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = -[KTLockStateTracker checkErrorChainForLockState:](self, "checkErrorChainForLockState:", a3);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[KTLockStateTracker queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014D0B8;
    block[3] = &unk_10023A390;
    block[4] = self;
    dispatch_sync(v5, block);

  }
  return v4;
}

- (void)addLockStateObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTLockStateTracker queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014D188;
  v7[3] = &unk_10023B3A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)globalTracker
{
  if (qword_1002A77D0 != -1)
    dispatch_once(&qword_1002A77D0, &stru_1002481B0);
  return (id)qword_1002A77C8;
}

- (NSOperation)unlockDependency
{
  return (NSOperation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUnlockDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (KTLockStateProviderProtocol)lockStateProvider
{
  return (KTLockStateProviderProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLockStateProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)queueIsLocked
{
  return self->_queueIsLocked;
}

- (void)setQueueIsLocked:(BOOL)a3
{
  self->_queueIsLocked = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)notify_token
{
  return self->_notify_token;
}

- (void)setNotify_token:(int)a3
{
  self->_notify_token = a3;
}

- (NSDate)lastUnlockedTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastUnlockedTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUnlockedTime, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lockStateProvider, 0);
  objc_storeStrong((id *)&self->_unlockDependency, 0);
}

@end
