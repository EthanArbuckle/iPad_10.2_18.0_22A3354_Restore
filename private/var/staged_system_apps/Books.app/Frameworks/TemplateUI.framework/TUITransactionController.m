@implementation TUITransactionController

- (void)setUpdateCallback:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_7587C;
    v5[3] = &unk_23F670;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    -[TUITransactionController setUpdateBlock:](self, "setUpdateBlock:", v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

- (id)newWillUpdateObserver:(id)a3
{
  id v4;
  _TUITransactionControllerJSObserver *v5;

  v4 = a3;
  v5 = -[_TUITransactionControllerJSObserver initWithWillUpdateValue:didUpdateValue:]([_TUITransactionControllerJSObserver alloc], "initWithWillUpdateValue:didUpdateValue:", v4, 0);

  -[TUITransactionController addObserver:](self, "addObserver:", v5);
  return v5;
}

- (id)newDidUpdateObserver:(id)a3
{
  id v4;
  _TUITransactionControllerJSObserver *v5;

  v4 = a3;
  v5 = -[_TUITransactionControllerJSObserver initWithWillUpdateValue:didUpdateValue:]([_TUITransactionControllerJSObserver alloc], "initWithWillUpdateValue:didUpdateValue:", 0, v4);

  -[TUITransactionController addObserver:](self, "addObserver:", v5);
  return v5;
}

- (void)performUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUITransactionController coordinator](self, "coordinator"));
  objc_msgSend(v5, "performUpdateForTransactionGroup:", v4);

}

- (TUITransactionCoordinator)coordinator
{
  return self->_coordinator;
}

- (TUITransactionController)initWithQueue:(id)a3
{
  id v4;
  TUITransactionController *v5;
  id v6;
  NSObject *v7;
  unint64_t uniqueIdentifier;
  _TUITransactionControllerWorkQueueContext *v9;
  TUIWorkQueueContext *queueContext;
  TUITransactionCoordinator *v11;
  TUITransactionCoordinator *coordinator;
  uint64_t v13;
  NSHashTable *observers;
  objc_super v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  TUITransactionController *v20;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUITransactionController;
  v5 = -[TUITransactionController init](&v16, "init");
  if (v5)
  {
    v5->_feedId.uniqueIdentifier = TUIFeedIdentifierGenerate();
    v6 = TUIDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uniqueIdentifier = v5->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      v18 = uniqueIdentifier;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "[fid:%lu] created %@", buf, 0x16u);
    }

    v9 = -[_TUITransactionControllerWorkQueueContext initWithQueue:]([_TUITransactionControllerWorkQueueContext alloc], "initWithQueue:", v4);
    queueContext = v5->_queueContext;
    v5->_queueContext = (TUIWorkQueueContext *)v9;

    v11 = -[TUITransactionCoordinator initWithFeedId:layoutQueueContext:delegate:]([TUITransactionCoordinator alloc], "initWithFeedId:layoutQueueContext:delegate:", v5->_feedId.uniqueIdentifier, v5->_queueContext, v5);
    coordinator = v5->_coordinator;
    v5->_coordinator = v11;

    -[TUITransactionCoordinator setManuallyScheduleUpdates:](v5->_coordinator, "setManuallyScheduleUpdates:", 1);
    v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v13;

    v5->_accessLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  if (a3)
  {
    p_accessLock = &self->_accessLock;
    v5 = a3;
    os_unfair_lock_lock(p_accessLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  if (a3)
  {
    p_accessLock = &self->_accessLock;
    v5 = a3;
    os_unfair_lock_lock(p_accessLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (void)transactionCoordinator:(id)a3 updateWithTransactionGroup:(id)a4
{
  _objc_msgSend(a4, "applyNonVisualUpdates", a3);
}

- (void)transactionCoordinator:(id)a3 willBeginUpdateWithTransactionGroup:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(p_accessLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "transactionControllerWillProcessUpdate:", self, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)transactionCoordinator:(id)a3 didEndUpdateWithTransactionGroup:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
  os_unfair_lock_unlock(p_accessLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "transactionControllerDidProcessUpdate:", self, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)transactionCoordinator:(id)a3 performUpdateForTransactionGroup:(id)a4
{
  void (**updateBlock)(id, id);

  updateBlock = (void (**)(id, id))self->_updateBlock;
  if (updateBlock)
    updateBlock[2](updateBlock, a4);
  else
    objc_msgSend(a3, "performUpdateForTransactionGroup:", a4);
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_queueContext, 0);
}

@end
