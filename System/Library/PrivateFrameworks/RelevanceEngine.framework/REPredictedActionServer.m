@implementation REPredictedActionServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_23);
  return (id)sharedInstance_Server;
}

void __41__REPredictedActionServer_sharedInstance__block_invoke()
{
  REPredictedActionServer *v0;
  void *v1;

  v0 = objc_alloc_init(REPredictedActionServer);
  v1 = (void *)sharedInstance_Server;
  sharedInstance_Server = (uint64_t)v0;

}

- (REPredictedActionServer)init
{
  REPredictedActionServer *v2;
  REPredictedActionServer *v3;
  NSArray *predictions;
  NSArray *v5;
  NSArray *counts;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableArray *fetchCompletionBlocks;
  REObserverStore *v11;
  REObserverStore *observers;
  OS_dispatch_queue *v13;
  uint64_t v14;
  uint64_t v15;
  REUpNextScheduler *scheduler;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD block[4];
  REPredictedActionServer *v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)REPredictedActionServer;
  v2 = -[REPredictedActionServer init](&v31, sel_init);
  v3 = v2;
  if (v2)
  {
    predictions = v2->_predictions;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_predictions = (NSArray *)MEMORY[0x24BDBD1A8];

    counts = v3->_counts;
    v3->_counts = v5;

    v7 = dispatch_queue_create("com.apple.RelevanceEngine.REPredictedActionServer", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v3->_fetchingData = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    fetchCompletionBlocks = v3->_fetchCompletionBlocks;
    v3->_fetchCompletionBlocks = (NSMutableArray *)v9;

    v11 = objc_alloc_init(REObserverStore);
    observers = v3->_observers;
    v3->_observers = v11;

    objc_initWeak(&location, v3);
    v13 = v3->_queue;
    v14 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __31__REPredictedActionServer_init__block_invoke;
    v28[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v29, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v13, v28, 1.0);
    v15 = objc_claimAutoreleasedReturnValue();
    scheduler = v3->_scheduler;
    v3->_scheduler = (REUpNextScheduler *)v15;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)REHandlePredictedActionsUpdated, CFSTR("com.apple.relevanceengine.predictedactionsupdated"), 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v3, sel__requestPredictions_, CFSTR("REShowRecentDeveloperDonationsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    soft_RESignificantLocationUpdateNotification();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v3, sel__requestPredictions_, v20, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    RESignificantTimeChangeNotification();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v3, sel__requestPredictions_, v22, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v3, sel__requestPredictions_, CFSTR("REDeviceLockStateChangedNotification"), 0);

    v24 = v3->_queue;
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __31__REPredictedActionServer_init__block_invoke_2;
    block[3] = &unk_24CF8AAF0;
    v27 = v3;
    dispatch_async(v24, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __31__REPredictedActionServer_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_fetchPredicitions");

}

uint64_t __31__REPredictedActionServer_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchPredicitions");
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.relevanceengine.predictedactionsupdated"), 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("REShowRecentDeveloperDonationsChangedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  soft_RESignificantLocationUpdateNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v6, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, v8, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("REDeviceLockStateChangedNotification"), 0);

  v10.receiver = self;
  v10.super_class = (Class)REPredictedActionServer;
  -[REPredictedActionServer dealloc](&v10, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  REObserverStore *observers;
  id v4;

  observers = self->_observers;
  v4 = a3;
  -[REObserverStore addObserver:](observers, "addObserver:", v4);
  objc_msgSend(v4, "predictedActionsDidUpdate");

}

- (void)removeObserver:(id)a3
{
  -[REObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)fetchPredictedActions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__REPredictedActionServer_fetchPredictedActions___block_invoke;
    v9[3] = &unk_24CF8CD38;
    v10 = v4;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __49__REPredictedActionServer_fetchPredictedActions___block_invoke_2;
    v7[3] = &unk_24CF8B1B0;
    v8 = v10;
    -[REPredictedActionServer _accessOrEnqueueDataRequest:error:](self, "_accessOrEnqueueDataRequest:error:", v9, v7);

  }
}

uint64_t __49__REPredictedActionServer_fetchPredictedActions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__REPredictedActionServer_fetchPredictedActions___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchFirstPerformedActionDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__REPredictedActionServer_fetchFirstPerformedActionDate___block_invoke;
    v9[3] = &unk_24CF8CD38;
    v10 = v4;
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __57__REPredictedActionServer_fetchFirstPerformedActionDate___block_invoke_2;
    v7[3] = &unk_24CF8B1B0;
    v8 = v10;
    -[REPredictedActionServer _accessOrEnqueueDataRequest:error:](self, "_accessOrEnqueueDataRequest:error:", v9, v7);

  }
}

uint64_t __57__REPredictedActionServer_fetchFirstPerformedActionDate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__REPredictedActionServer_fetchFirstPerformedActionDate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_accessOrEnqueueDataRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__REPredictedActionServer__accessOrEnqueueDataRequest_error___block_invoke;
  block[3] = &unk_24CF8CD88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __61__REPredictedActionServer__accessOrEnqueueDataRequest_error___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id location;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[56])
  {
    objc_initWeak(&location, v2);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __61__REPredictedActionServer__accessOrEnqueueDataRequest_error___block_invoke_2;
    v8 = &unk_24CF8CD60;
    objc_copyWeak(&v11, &location);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v4 = (void *)MEMORY[0x2199B2434](&v5);
    objc_msgSend(v3, "addObject:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __61__REPredictedActionServer__accessOrEnqueueDataRequest_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  _QWORD v11[5];
  id v12;
  id v13;
  unint64_t v14;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __108__REPredictedActionServer_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke;
    v11[3] = &unk_24CF8C768;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    dispatch_async(queue, v11);

  }
}

void __108__REPredictedActionServer_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  id v4;

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_queue_setupConnection");
    v3 = *(void **)(a1[4] + 8);
  }
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchPerformedTodayCountForActionWithBundleIdentifer:actionIdentifier:completion:", a1[5], a1[7], a1[6]);

}

void __108__REPredictedActionServer_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  RELogForDomain(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = 136315138;
    v6 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy: %s", (uint8_t *)&v5, 0xCu);

  }
}

- (void)_requestPredictions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  double v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    RELogForDomain(12);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_INFO, "Received %{public}@ notification that will trigger a prediction fetch from relevanced.", (uint8_t *)&v12, 0xCu);

    }
  }
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.relevanceengine.predictedactionsupdated"));

  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("REShowRecentDeveloperDonationsChangedNotification"));

  -[NSDate timeIntervalSinceNow](self->_lastFetchedDate, "timeIntervalSinceNow");
  if (v11 < 0.0)
    v11 = -v11;
  if ((v8 & 1) != 0 || (v10 & 1) != 0 || v11 > 1800.0)
    -[REUpNextScheduler schedule](self->_scheduler, "schedule", v11);

}

- (void)_queue_fetchPredicitions
{
  NSMutableArray *fetchCompletionBlocks;
  id *v4;
  void *v5;
  NSDate *v6;
  NSDate *lastFetchedDate;
  NSXPCConnection *connection;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *queue;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  if (self->_fetchingData)
  {
    objc_initWeak(&location, self);
    fetchCompletionBlocks = self->_fetchCompletionBlocks;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke;
    v25[3] = &unk_24CF8AAC8;
    v4 = &v26;
    objc_copyWeak(&v26, &location);
    v5 = (void *)MEMORY[0x2199B2434](v25);
    -[NSMutableArray addObject:](fetchCompletionBlocks, "addObject:", v5);

  }
  else
  {
    self->_fetchingData = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastFetchedDate = self->_lastFetchedDate;
    self->_lastFetchedDate = v6;

    if (!self->_connection)
      -[REPredictedActionServer _queue_setupConnection](self, "_queue_setupConnection");
    objc_initWeak(&location, self);
    connection = self->_connection;
    v9 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_15;
    v23[3] = &unk_24CF8CDD0;
    v4 = &v24;
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_16;
    v20[3] = &unk_24CF8CDF8;
    objc_copyWeak(&v22, &location);
    v12 = v11;
    v21 = v12;
    objc_msgSend(v10, "requestPredictedActionsWithCompletion:", v20);
    dispatch_group_enter(v12);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_23;
    v17[3] = &unk_24CF8CE20;
    objc_copyWeak(&v19, &location);
    v13 = v12;
    v18 = v13;
    objc_msgSend(v10, "fetchFirstPerformedActionDate:", v17);
    queue = self->_queue;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_26;
    v15[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v16, &location);
    dispatch_group_notify(v13, queue, v15);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);

  }
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  RELogForDomain(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_INFO, "Enqueue prediction fetch since we were already fetching data.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestPredictions:", 0);

}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject **v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[6];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2;
    v7[3] = &unk_24CF8AB18;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

uint64_t __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = 136315138;
    v11 = objc_msgSend(v3, "UTF8String");
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy: %s", (uint8_t *)&v10, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 24);
  v6 = MEMORY[0x24BDBD1A8];
  *(_QWORD *)(v4 + 24) = MEMORY[0x24BDBD1A8];

  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v6;

  objc_msgSend(*(id *)(a1 + 40), "_finishProcessingData");
  return objc_msgSend(*(id *)(a1 + 40), "_notifyObservers");
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NSObject **v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[6];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2_17;
    v10[3] = &unk_24CF8B6F0;
    v11 = v5;
    v12 = v8;
    v13 = v6;
    v14 = *(id *)(a1 + 32);
    dispatch_async(v9, v10);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2_17(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("bundleIdentifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_INFO, "Received requested predictions from daemon: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "re_arrayMappedWithArray:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", *(_QWORD *)(a1 + 48), 1);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  NSObject **v9;
  id v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[6];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2_24;
    block[3] = &unk_24CF8C580;
    v8 = v3;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_INFO, "Received first perfomed action date from daemon: (%@)", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_26(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_finishProcessingData");
    objc_msgSend(v2, "_notifyObservers");
    WeakRetained = v2;
  }

}

- (void)_notifyObservers
{
  -[REObserverStore enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", &__block_literal_global_28);
}

uint64_t __43__REPredictedActionServer__notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predictedActionsDidUpdate");
}

- (void)_finishProcessingData
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  self->_fetchingData = 0;
  v3 = (void *)-[NSMutableArray copy](self->_fetchCompletionBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_fetchCompletionBlocks, "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_queue_setupConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  NSXPCConnection *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.relevanceengine.predictedactionserver"), 4096);
  connection = self->_connection;
  self->_connection = v3;

  v5 = self->_connection;
  REPredictionServerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

  v7 = self->_connection;
  REPredictionClientInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v7, "setExportedInterface:", v8);

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v9 = self->_connection;
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__REPredictedActionServer__queue_setupConnection__block_invoke;
  v14[3] = &unk_24CF8AAC8;
  objc_copyWeak(&v15, &location);
  -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v14);
  v11 = self->_connection;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __49__REPredictedActionServer__queue_setupConnection__block_invoke_30;
  v12[3] = &unk_24CF8AAC8;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v12);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__REPredictedActionServer__queue_setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  RELogForDomain(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "REPredictedActionServer XPC connection interrupted.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

void __49__REPredictedActionServer__queue_setupConnection__block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  __int16 v5[8];

  RELogForDomain(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "REPredictedActionServer XPC connection invalidated.", (uint8_t *)v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[1], "setExportedObject:", 0);

}

- (void)_clearConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__REPredictedActionServer__clearConnection__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__REPredictedActionServer__clearConnection__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
  return objc_msgSend(*(id *)(a1 + 32), "_finishProcessingData");
}

- (void)_invalidateConnection
{
  NSXPCConnection *connection;

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fetchCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_firstPerformedDate, 0);
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
