@implementation PLChangeHandlingNotificationObserver

- (PLChangeHandlingNotificationObserver)initWithLowPriorityThrottleInterval:(double)a3 targetWorkloop:(id)a4
{
  id v8;
  PLChangeHandlingNotificationObserver *v9;
  PLChangeHandlingNotificationObserver *v10;
  id notificationBlock;
  uint64_t v12;
  OS_dispatch_queue *lowNotifyQueue;
  uint64_t v14;
  OS_dispatch_queue *highNotifyQueue;
  NSObject *v16;
  uint64_t v17;
  PLChangeHandlingNotificationObserver *v18;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  PLChangeHandlingNotificationObserver *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLChangeHandlingNotificationObserver.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetWorkloop"));

  }
  v21.receiver = self;
  v21.super_class = (Class)PLChangeHandlingNotificationObserver;
  v9 = -[PLChangeHandlingNotificationObserver init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_throttleInterval = a3;
    *(_QWORD *)&v9->_lock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
    v9->_notifyTokenHigh = -1;
    notificationBlock = v9->_notificationBlock;
    v9->_notificationBlock = 0;

    objc_storeStrong((id *)&v10->_targetWorkloop, a4);
    s_dispatch_queue_create_for_notifications("com.apple.photos.PLChangeHandlingNotificationObserver.lowNotifyQueue", v10->_targetWorkloop);
    v12 = objc_claimAutoreleasedReturnValue();
    lowNotifyQueue = v10->_lowNotifyQueue;
    v10->_lowNotifyQueue = (OS_dispatch_queue *)v12;

    PLIsForegroundApplication();
    s_dispatch_queue_create_for_notifications("com.apple.photos.PLChangeHandlingNotificationObserver.highNotifyQueue", v10->_targetWorkloop);
    v14 = objc_claimAutoreleasedReturnValue();
    highNotifyQueue = v10->_highNotifyQueue;
    v10->_highNotifyQueue = (OS_dispatch_queue *)v14;

    PLPhotosObjectLifecycleGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v23 = v17;
      v24 = 2048;
      v25 = v10;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "%@ %p initWithLowPriorityThrottleInterval:%f", buf, 0x20u);
    }

    v18 = v10;
  }

  return v10;
}

uint64_t __83__PLChangeHandlingNotificationObserver_startObservingRemoteNotificationsWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_startObservingRemoteNotificationsWithBlock:", *(_QWORD *)(a1 + 40));
}

- (void)startObservingRemoteNotificationsWithBlock:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLSafeRunWithUnfairLock();

}

- (void)_locked_startObservingRemoteNotificationsWithBlock:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id notificationBlock;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLChangeHandlingNotificationObserver.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationBlock != nil"));

  }
  if (self->_notifyTokenLow != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLChangeHandlingNotificationObserver.m"), 129, CFSTR("Notify token should be invalid, but is: %d (low)"), self->_notifyTokenLow);

  }
  if (self->_notifyTokenHigh != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLChangeHandlingNotificationObserver.m"), 130, CFSTR("Notify token should be invalid, but is: %d (high)"), self->_notifyTokenHigh);

  }
  if (self->_notificationBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLChangeHandlingNotificationObserver.m"), 131, CFSTR("Notification block is already set"));

  }
  PLChangeHandlingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)MEMORY[0x19AEC174C](v5);
    *(_DWORD *)buf = 134217984;
    v17 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Change handling notification: Start observerving notifications with block: %p", buf, 0xCu);

  }
  v8 = (void *)objc_msgSend(v5, "copy");
  notificationBlock = self->_notificationBlock;
  self->_notificationBlock = v8;

  objc_initWeak((id *)buf, self);
  v14[1] = (id)MEMORY[0x1E0C809B0];
  v14[2] = (id)3221225472;
  v14[3] = __91__PLChangeHandlingNotificationObserver__locked_startObservingRemoteNotificationsWithBlock___block_invoke;
  v14[4] = &unk_1E3667998;
  objc_copyWeak(&v15, (id *)buf);
  pl_notify_register_dispatch_with_retry();
  objc_copyWeak(v14, (id *)buf);
  pl_notify_register_dispatch_with_retry();
  objc_destroyWeak(v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  PLChangeHandlingNotificationObserver *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v7 = objc_opt_class();
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  if (-[PLChangeHandlingNotificationObserver stopObservingRemoteNotifications](self, "stopObservingRemoteNotifications"))
  {
    PLChangeHandlingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_FAULT, "Deallocated PLChangeHandlingNotificationObserver while still observing notifications", buf, 2u);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)PLChangeHandlingNotificationObserver;
  -[PLChangeHandlingNotificationObserver dealloc](&v5, sel_dealloc);
}

- (int)notifyTokenLow
{
  PLChangeHandlingNotificationObserver *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_notifyTokenLow;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (int)notifyTokenHigh
{
  PLChangeHandlingNotificationObserver *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_notifyTokenHigh;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (id)notificationBlock
{
  PLResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_inq_handleLowPriorityNotification
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetWorkloop);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLChangeHandlingNotificationObserver _inq_handleLowPriorityNotification]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLChangeHandlingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    qos_class_self();
    PLStringFromQoSClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Change handling notification: Handling low priority notification at QoS: %@", buf, 0xCu);

  }
  -[PLChangeHandlingNotificationObserver _inq_suspendIfThrottling](self, "_inq_suspendIfThrottling");
  -[PLChangeHandlingNotificationObserver notificationBlock](self, "notificationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PLChangeHandlingNotificationObserver__inq_handleLowPriorityNotification__block_invoke;
  v10[3] = &unk_1E3675C58;
  v11 = v3;
  v12 = v6;
  v8 = v3;
  v9 = v6;
  objc_msgSend(v7, "sync:identifyingBlock:library:", v10, 0, 0);

}

- (void)_inq_suspendIfThrottling
{
  NSObject *v3;
  void *v4;
  dispatch_time_t v5;
  NSObject *lowNotifyQueue;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetWorkloop);
  if (self->_throttleInterval > 0.0)
  {
    PLChangeHandlingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      qos_class_self();
      PLStringFromQoSClass();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Change handling notification: Suspending low priority notifications at QoS: %@", buf, 0xCu);

    }
    notify_suspend(-[PLChangeHandlingNotificationObserver notifyTokenLow](self, "notifyTokenLow"));
    objc_initWeak((id *)buf, self);
    v5 = dispatch_time(0, (uint64_t)(self->_throttleInterval * 1000000000.0));
    lowNotifyQueue = self->_lowNotifyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PLChangeHandlingNotificationObserver__inq_suspendIfThrottling__block_invoke;
    block[3] = &unk_1E3677D48;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_after(v5, lowNotifyQueue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_inq_handleThrottleTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetWorkloop);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLChangeHandlingNotificationObserver _inq_handleThrottleTimer]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLChangeHandlingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    qos_class_self();
    PLStringFromQoSClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Change handling notification: Resuming low priority notifications at QoS: %@", (uint8_t *)&v6, 0xCu);

  }
  notify_resume(-[PLChangeHandlingNotificationObserver notifyTokenLow](self, "notifyTokenLow"));
  objc_msgSend(v3, "stillAlive");

}

- (void)_inq_handleHighPriorityNotification
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetWorkloop);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLChangeHandlingNotificationObserver _inq_handleHighPriorityNotification]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLChangeHandlingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    qos_class_self();
    PLStringFromQoSClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Change handling notification: Handling high priority notification at QoS: %@", buf, 0xCu);

  }
  -[PLChangeHandlingNotificationObserver notificationBlock](self, "notificationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PLChangeHandlingNotificationObserver__inq_handleHighPriorityNotification__block_invoke;
  v10[3] = &unk_1E3675C58;
  v11 = v3;
  v12 = v6;
  v8 = v3;
  v9 = v6;
  objc_msgSend(v7, "sync:identifyingBlock:library:", v10, 0, 0);

}

- (BOOL)stopObservingRemoteNotifications
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLSafeRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)_locked_stopObservingRemoteNotifications
{
  NSObject *v3;
  void *v4;
  int notifyTokenLow;
  int notifyTokenHigh;
  BOOL v7;
  id notificationBlock;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  PLChangeHandlingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (void *)MEMORY[0x19AEC174C](self->_notificationBlock);
    v10 = 134217984;
    v11 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Change handling notification: Stop observerving notifications with block: %p", (uint8_t *)&v10, 0xCu);

  }
  notifyTokenLow = self->_notifyTokenLow;
  if (notifyTokenLow == -1)
  {
    notifyTokenHigh = self->_notifyTokenHigh;
    if (notifyTokenHigh == -1)
    {
      v7 = self->_notificationBlock != 0;
      goto LABEL_9;
    }
  }
  else
  {
    notify_cancel(notifyTokenLow);
    notifyTokenHigh = self->_notifyTokenHigh;
    if (notifyTokenHigh == -1)
      goto LABEL_8;
  }
  notify_cancel(notifyTokenHigh);
LABEL_8:
  v7 = 1;
LABEL_9:
  *(_QWORD *)&self->_notifyTokenLow = -1;
  notificationBlock = self->_notificationBlock;
  self->_notificationBlock = 0;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong((id *)&self->_highNotifyQueue, 0);
  objc_storeStrong((id *)&self->_lowNotifyQueue, 0);
  objc_storeStrong((id *)&self->_targetWorkloop, 0);
}

uint64_t __72__PLChangeHandlingNotificationObserver_stopObservingRemoteNotifications__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_locked_stopObservingRemoteNotifications");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __75__PLChangeHandlingNotificationObserver__inq_handleHighPriorityNotification__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, *(_QWORD *)(a1 + 32));
  return result;
}

void __64__PLChangeHandlingNotificationObserver__inq_suspendIfThrottling__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_handleThrottleTimer");

}

uint64_t __74__PLChangeHandlingNotificationObserver__inq_handleLowPriorityNotification__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __91__PLChangeHandlingNotificationObserver__locked_startObservingRemoteNotificationsWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_handleLowPriorityNotification");

}

void __91__PLChangeHandlingNotificationObserver__locked_startObservingRemoteNotificationsWithBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_handleHighPriorityNotification");

}

id __57__PLChangeHandlingNotificationObserver_notificationBlock__block_invoke(uint64_t a1)
{
  return (id)MEMORY[0x19AEC174C](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

@end
