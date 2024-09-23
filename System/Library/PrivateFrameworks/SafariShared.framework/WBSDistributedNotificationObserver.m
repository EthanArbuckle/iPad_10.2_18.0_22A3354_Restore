@implementation WBSDistributedNotificationObserver

- (WBSDistributedNotificationObserver)init
{

  return 0;
}

- (WBSDistributedNotificationObserver)initWithNotificationName:(id)a3
{
  return -[WBSDistributedNotificationObserver initWithNotificationName:type:](self, "initWithNotificationName:type:", a3, 0);
}

- (WBSDistributedNotificationObserver)initWithNotificationName:(id)a3 type:(int64_t)a4
{
  id v6;
  WBSDistributedNotificationObserver *v7;
  uint64_t v8;
  NSString *notificationName;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *internalQueue;
  WBSDistributedNotificationObserver *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WBSDistributedNotificationObserver;
  v7 = -[WBSDistributedNotificationObserver init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    notificationName = v7->_notificationName;
    v7->_notificationName = (NSString *)v8;

    v7->_notificationType = a4;
    objc_msgSend(CFSTR("com.apple.Safari.WBSCloudBookmarksSyncAgentObserver."), "stringByAppendingString:", v6);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v11;

    v13 = v7;
  }

  return v7;
}

- (void)setNotificationHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSDistributedNotificationObserver_setNotificationHandler___block_invoke;
  block[3] = &unk_1E4B2A708;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __61__WBSDistributedNotificationObserver_setNotificationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8599ED0](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

- (id)notificationHandler
{
  NSObject *internalQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__WBSDistributedNotificationObserver_notificationHandler__block_invoke;
  v5[3] = &unk_1E4B2A8C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (void *)MEMORY[0x1A8599ED0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__WBSDistributedNotificationObserver_notificationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setTimeoutHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSDistributedNotificationObserver_setTimeoutHandler___block_invoke;
  block[3] = &unk_1E4B2A708;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

void __56__WBSDistributedNotificationObserver_setTimeoutHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8599ED0](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

- (id)timeoutHandler
{
  NSObject *internalQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__WBSDistributedNotificationObserver_timeoutHandler__block_invoke;
  v5[3] = &unk_1E4B2A8C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (void *)MEMORY[0x1A8599ED0](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__WBSDistributedNotificationObserver_timeoutHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)waitWithTimeout:(double)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__WBSDistributedNotificationObserver_waitWithTimeout___block_invoke;
  v4[3] = &unk_1E4B2A910;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

uint64_t __54__WBSDistributedNotificationObserver_waitWithTimeout___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_startObserving");
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleTimeoutTimerWithTimeout:", *(double *)(a1 + 40));
}

- (void)stopWaiting
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WBSDistributedNotificationObserver_stopWaiting__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __49__WBSDistributedNotificationObserver_stopWaiting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopObserving");
}

- (void)_startObserving
{
  int64_t notificationType;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (!self->_observing)
  {
    notificationType = self->_notificationType;
    if (notificationType == 1)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)handleNotification, (CFStringRef)self->_notificationName, 0, (CFNotificationSuspensionBehavior)1024);
    }
    else if (!notificationType)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:selector:name:object:suspensionBehavior:", self, sel__didReceiveNotification_, self->_notificationName, 0, 4);

    }
    self->_observing = 1;
  }
}

- (void)_stopObserving
{
  int64_t notificationType;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  -[WBSDistributedNotificationObserver _invalidateTimeoutTimer](self, "_invalidateTimeoutTimer");
  if (self->_observing)
  {
    notificationType = self->_notificationType;
    if (notificationType == 1)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)self->_notificationName, 0);
    }
    else if (!notificationType)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:name:object:", self, self->_notificationName, 0);

    }
    self->_observing = 0;
  }
}

- (void)_scheduleTimeoutTimerWithTimeout:(double)a3
{
  OS_dispatch_source *v5;
  OS_dispatch_source *timeoutTimer;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD handler[5];

  -[WBSDistributedNotificationObserver _invalidateTimeoutTimer](self, "_invalidateTimeoutTimer");
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internalQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v5;

  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_timeoutTimer, v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a3 / 10.0 * 1000000000.0));
  v8 = self->_timeoutTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __71__WBSDistributedNotificationObserver__scheduleTimeoutTimerWithTimeout___block_invoke;
  handler[3] = &unk_1E4B2A078;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
}

uint64_t __71__WBSDistributedNotificationObserver__scheduleTimeoutTimerWithTimeout___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didTimeOut");
  return objc_msgSend(*(id *)(a1 + 32), "_stopObserving");
}

- (void)_invalidateTimeoutTimer
{
  NSObject *timeoutTimer;
  OS_dispatch_source *v4;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
}

- (void)_didReceiveNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__WBSDistributedNotificationObserver__didReceiveNotification___block_invoke;
  v7[3] = &unk_1E4B2A118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __62__WBSDistributedNotificationObserver__didReceiveNotification___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 24))
  {
    v3 = *(_QWORD *)(result + 48);
    if (v3)
    {
      result = (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(result + 48), *(_QWORD *)(a1 + 40));
      if (!(_DWORD)result)
        return result;
      result = *(_QWORD *)(a1 + 32);
    }
    return objc_msgSend((id)result, "_stopObserving");
  }
  return result;
}

- (void)_didTimeOut
{
  void (**timeoutHandler)(void);

  timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
    timeoutHandler[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
