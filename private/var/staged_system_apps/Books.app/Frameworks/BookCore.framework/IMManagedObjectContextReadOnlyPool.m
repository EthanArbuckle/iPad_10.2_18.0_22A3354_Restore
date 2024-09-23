@implementation IMManagedObjectContextReadOnlyPool

- (IMManagedObjectContextReadOnlyPool)initWithContextProvider:(id)a3
{
  id v4;
  IMManagedObjectContextReadOnlyPool *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMManagedObjectContextReadOnlyPool;
  v5 = -[IMManagedObjectContextReadOnlyPool init](&v24, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("IMManagedObjectContextReadOnlyPool", 0);
    -[IMManagedObjectContextReadOnlyPool setSync:](v5, "setSync:", v6);

    v7 = objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool sync](v5, "sync"));
    dispatch_queue_set_specific(v7, off_309848, off_309848, 0);

    -[IMManagedObjectContextReadOnlyPool setProviderBlock:](v5, "setProviderBlock:", v4);
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 8);
    -[IMManagedObjectContextReadOnlyPool setContexts:](v5, "setContexts:", v8);

    v9 = objc_alloc_init((Class)NSMutableArray);
    -[IMManagedObjectContextReadOnlyPool setPendingBlocks:](v5, "setPendingBlocks:", v9);

    v10 = objc_alloc_init((Class)NSMutableIndexSet);
    -[IMManagedObjectContextReadOnlyPool setAvailableContextIndexes:](v5, "setAvailableContextIndexes:", v10);

    -[IMManagedObjectContextReadOnlyPool setMinInstanceCount:](v5, "setMinInstanceCount:", 1);
    -[IMManagedObjectContextReadOnlyPool setMaxInstanceCount:](v5, "setMaxInstanceCount:", 8);
    objc_initWeak(&location, v5);
    v11 = objc_alloc((Class)BUCoalescingCallBlock);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_9FD84;
    v21 = &unk_28BD38;
    objc_copyWeak(&v22, &location);
    v12 = objc_msgSend(v11, "initWithNotifyBlock:blockDescription:", &v18, CFSTR("IMManagedObjectContextReadOnlyPool"));
    -[IMManagedObjectContextReadOnlyPool setCoalescingCleanup:](v5, "setCoalescingCleanup:", v12, v18, v19, v20, v21);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool coalescingCleanup](v5, "coalescingCleanup"));
    objc_msgSend(v13, "setCoalescingDelay:", 5.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool coalescingCleanup](v5, "coalescingCleanup"));
    objc_msgSend(v14, "setMaximumDelay:", 10.0);

    v15 = objc_opt_new(NSMutableDictionary);
    -[IMManagedObjectContextReadOnlyPool setLastUsedTime:](v5, "setLastUsedTime:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v5, "_managedObjectContextDidSaveNotification:", NSManagedObjectContextDidSaveNotification, 0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)IMManagedObjectContextReadOnlyPool;
  -[IMManagedObjectContextReadOnlyPool dealloc](&v4, "dealloc");
}

- (void)_cleanupWithCompletion:(id)a3
{
  id v4;
  NSObject *sync;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sync = self->_sync;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9FEB8;
  v7[3] = &unk_28C080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sync, v7);

}

- (void)_updateUseCountTime
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[IMManagedObjectContextReadOnlyPool inUseCount](self, "inUseCount");
  if (v3 > -[IMManagedObjectContextReadOnlyPool minInstanceCount](self, "minInstanceCount"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool lastUsedTime](self, "lastUsedTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IMManagedObjectContextReadOnlyPool inUseCount](self, "inUseCount")));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool coalescingCleanup](self, "coalescingCleanup"));
    objc_msgSend(v10, "signalWithCompletion:", &stru_28FFD8);

  }
}

- (void)remoteContextDidSave:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *sync;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  _QWORD v14[5];
  id v15;
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
  _BYTE v27[128];

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_A03E4;
  v25 = sub_A03F4;
  v26 = 0;
  if (dispatch_get_specific(off_309848))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool contexts](self, "contexts"));
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)v22[5];
    v22[5] = (uint64_t)v6;

  }
  else
  {
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A03FC;
    block[3] = &unk_28B700;
    block[4] = self;
    block[5] = &v21;
    dispatch_sync(sync, block);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)v22[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_A044C;
        v14[3] = &unk_28B808;
        v14[4] = v13;
        v15 = v4;
        objc_msgSend(v13, "performBlock:", v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    }
    while (v10);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_managedObjectContextDidSaveNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *sync;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];

  v17 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_A03E4;
  v29 = sub_A03F4;
  v30 = 0;
  if (dispatch_get_specific(off_309848))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool contexts](self, "contexts"));
    v5 = objc_msgSend(v4, "copy");
    v6 = (void *)v26[5];
    v26[5] = (uint64_t)v5;

  }
  else
  {
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A06F8;
    block[3] = &unk_28B700;
    block[4] = self;
    block[5] = &v25;
    dispatch_sync(sync, block);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "object"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentStoreCoordinator"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (id)v26[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (v14 != v8)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "persistentStoreCoordinator"));
          v16 = objc_msgSend(v15, "hasStoreInCommonWith:", v9);

          if (v16)
          {
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_A0748;
            v18[3] = &unk_28B808;
            v18[4] = v14;
            v19 = v17;
            objc_msgSend(v14, "performBlock:", v18);

          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    }
    while (v11);
  }

  _Block_object_dispose(&v25, 8);
}

- (void)_makeAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool sync](self, "sync"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A07EC;
  v7[3] = &unk_28B808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)performReadOnlyBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[IMManagedObjectContextReadOnlyPool sync](self, "sync"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_A0A14;
    v6[3] = &unk_28C080;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (unint64_t)minInstanceCount
{
  return self->_minInstanceCount;
}

- (void)setMinInstanceCount:(unint64_t)a3
{
  self->_minInstanceCount = a3;
}

- (unint64_t)maxInstanceCount
{
  return self->_maxInstanceCount;
}

- (void)setMaxInstanceCount:(unint64_t)a3
{
  self->_maxInstanceCount = a3;
}

- (id)providerBlock
{
  return self->_providerBlock;
}

- (void)setProviderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
  objc_storeStrong((id *)&self->_contexts, a3);
}

- (NSMutableIndexSet)availableContextIndexes
{
  return self->_availableContextIndexes;
}

- (void)setAvailableContextIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_availableContextIndexes, a3);
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
  objc_storeStrong((id *)&self->_sync, a3);
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void)setPendingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBlocks, a3);
}

- (BUCoalescingCallBlock)coalescingCleanup
{
  return self->_coalescingCleanup;
}

- (void)setCoalescingCleanup:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingCleanup, a3);
}

- (NSMutableDictionary)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedTime, a3);
}

- (unint64_t)inUseCount
{
  return self->_inUseCount;
}

- (void)setInUseCount:(unint64_t)a3
{
  self->_inUseCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
  objc_storeStrong((id *)&self->_coalescingCleanup, 0);
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_availableContextIndexes, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong(&self->_providerBlock, 0);
}

@end
