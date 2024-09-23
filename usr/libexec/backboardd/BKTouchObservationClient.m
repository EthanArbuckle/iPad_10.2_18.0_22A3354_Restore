@implementation BKTouchObservationClient

- (BKTouchObservationClient)initWithConnection:(id)a3 pid:(int)a4
{
  id v6;
  BKTouchObservationClient *v7;
  BKTouchObservationClient *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKTouchObservationClient;
  v7 = -[BKTouchObservationClient init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_connection, v6);
    v8->_pid = a4;
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)_didRespondToTouchDelivery
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_waitingOnClient = 0;
  self->_lock_updateSentTimestamp = 0.0;
  -[BKTouchObservationClient _lock_sendQueuedUpdatesToClient](self, "_lock_sendQueuedUpdatesToClient");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_sendQueuedUpdatesToClient
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _BYTE location[12];
  __int16 v15;
  void *v16;

  if (-[NSMutableArray count](self->_lock_pendingUpdates, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "remoteTarget"));

    v5 = -[NSMutableArray copy](self->_lock_pendingUpdates, "copy");
    v6 = BKLogTouchDeliveryObserver(-[NSMutableArray removeAllObjects](self->_lock_pendingUpdates, "removeAllObjects"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", v5));
      v10 = BSProcessDescriptionForPID(self->_pid);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v9;
      v15 = 2114;
      v16 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "post updates:%{public}@ to:%{public}@", location, 0x16u);

    }
    self->_lock_waitingOnClient = 1;
    self->_lock_updateSentTimestamp = BSContinuousMachTimeNow(v8);
    objc_initWeak((id *)location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100032B10;
    v12[3] = &unk_1000EA3E0;
    objc_copyWeak(&v13, (id *)location);
    objc_msgSend(v4, "observeTouchEventDeliveryDidOccur:response:", v5, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);

  }
}

- (void)sendTouchUpdate:(id)a3
{
  id v4;
  NSMutableArray *lock_pendingUpdates;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v10;
  NSObject *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  uint64_t v14;
  void *v15;
  int v16;
  double v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingUpdates = self->_lock_pendingUpdates;
  if (self->_lock_waitingOnClient)
  {
    v6 = (uint64_t)-[NSMutableArray count](lock_pendingUpdates, "count");
    v8 = BSContinuousMachTimeNow(v6) - self->_lock_updateSentTimestamp;
    if (v6 >= 1 && v8 > 2.0)
    {
      v10 = BKLogTouchDeliveryObserver(v7);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = BSProcessDescriptionForPID(self->_pid);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = 134218498;
        v17 = v8;
        v18 = 1024;
        v19 = v6;
        v20 = 2114;
        v21 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "waiting for %g seconds; dropping %d updates for %{public}@",
          (uint8_t *)&v16,
          0x1Cu);

      }
      -[NSMutableArray removeAllObjects](self->_lock_pendingUpdates, "removeAllObjects");
    }
    -[NSMutableArray addObject:](self->_lock_pendingUpdates, "addObject:", v4);
  }
  else
  {
    if (!lock_pendingUpdates)
    {
      v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v13 = self->_lock_pendingUpdates;
      self->_lock_pendingUpdates = v12;

      lock_pendingUpdates = self->_lock_pendingUpdates;
    }
    -[NSMutableArray addObject:](lock_pendingUpdates, "addObject:", v4);
    -[BKTouchObservationClient _lock_sendQueuedUpdatesToClient](self, "_lock_sendQueuedUpdatesToClient");
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_pendingUpdates, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end
