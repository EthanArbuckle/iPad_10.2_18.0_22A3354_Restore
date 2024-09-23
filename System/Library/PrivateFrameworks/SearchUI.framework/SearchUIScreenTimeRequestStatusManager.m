@implementation SearchUIScreenTimeRequestStatusManager

+ (SearchUIScreenTimeRequestStatusManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1);
  return (SearchUIScreenTimeRequestStatusManager *)(id)sharedManager_sharedObserver;
}

void __55__SearchUIScreenTimeRequestStatusManager_sharedManager__block_invoke()
{
  SearchUIScreenTimeRequestStatusManager *v0;
  void *v1;

  v0 = objc_alloc_init(SearchUIScreenTimeRequestStatusManager);
  v1 = (void *)sharedManager_sharedObserver;
  sharedManager_sharedObserver = (uint64_t)v0;

}

- (SearchUIScreenTimeRequestStatusManager)init
{
  SearchUIScreenTimeRequestStatusManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *requestStatuses;
  NSNotificationCenter *v5;
  NSNotificationCenter *notificationCenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIScreenTimeRequestStatusManager;
  v2 = -[SearchUIScreenTimeRequestStatusManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestStatuses = v2->_requestStatuses;
    v2->_requestStatuses = v3;

    v5 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x1E0CB37D0]);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v5;

    -[SearchUIScreenTimeRequestStatusManager setupSink](v2, "setupSink");
  }
  return v2;
}

- (void)setupSink
{
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_queue_t v13;
  _QWORD v14[4];
  id v15;
  id location;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.SearchUI.SearchUIScreenTimeRequestStatusManager.queue", v3);

  v13 = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:waking:", CFSTR("com.apple.SearchUI.SearchUIScreenTimeRequestStatusManager.queue"), v4, 0);
  objc_initWeak(&location, self);
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Family");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ScreenTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "DSLPublisher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribeOn:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__SearchUIScreenTimeRequestStatusManager_setupSink__block_invoke_2;
  v14[3] = &unk_1EA1F61A0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_13, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIScreenTimeRequestStatusManager setBiomeSink:](self, "setBiomeSink:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __51__SearchUIScreenTimeRequestStatusManager_setupSink__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "updateWithEvent:", v4);
}

- (int)statusForRequestID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SearchUIScreenTimeRequestStatusManager requestStatuses](self, "requestStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "intValue");
  return (int)v4;
}

- (id)addObserver:(id)a3
{
  id v4;
  NSNotificationCenter *notificationCenter;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  notificationCenter = self->_notificationCenter;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SearchUIScreenTimeRequestStatusManager_addObserver___block_invoke;
  v9[3] = &unk_1EA1F61C8;
  v10 = v4;
  v6 = v4;
  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](notificationCenter, "addObserverForName:object:queue:usingBlock:", CFSTR("ScreentimeRequestStatusDidChangeNotification"), 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __54__SearchUIScreenTimeRequestStatusManager_addObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("requestID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v4, objc_msgSend(v6, "intValue"));

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:");
}

- (void)updateWithEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSNotificationCenter *notificationCenter;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIScreenTimeRequestStatusManager requestStatuses](self, "requestStatuses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  notificationCenter = self->_notificationCenter;
  v15[0] = CFSTR("requestID");
  objc_msgSend(v5, "requestID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("status");
  v16[0] = v10;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend(v5, "status");

  objc_msgSend(v11, "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter postNotificationName:object:userInfo:](notificationCenter, "postNotificationName:object:userInfo:", CFSTR("ScreentimeRequestStatusDidChangeNotification"), 0, v14);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SearchUIScreenTimeRequestStatusManager biomeSink](self, "biomeSink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)SearchUIScreenTimeRequestStatusManager;
  -[SearchUIScreenTimeRequestStatusManager dealloc](&v4, sel_dealloc);
}

- (BPSSink)biomeSink
{
  return self->_biomeSink;
}

- (void)setBiomeSink:(id)a3
{
  objc_storeStrong((id *)&self->_biomeSink, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (NSMutableDictionary)requestStatuses
{
  return self->_requestStatuses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStatuses, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_biomeSink, 0);
}

@end
