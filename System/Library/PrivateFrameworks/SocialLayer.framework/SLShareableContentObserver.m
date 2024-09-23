@implementation SLShareableContentObserver

+ (SLShareableContentObserver)sharedObserver
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SLShareableContentObserver_sharedObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, block);
  return (SLShareableContentObserver *)(id)sharedObserver_sharedObserver;
}

void __44__SLShareableContentObserver_sharedObserver__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v1;

}

- (SLShareableContentObserver)init
{
  SLShareableContentObserver *v2;
  SLShareableContentObserver *v3;
  SLShareableContentObserver *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLShareableContentObserver;
  v2 = -[SLShareableContentObserver init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SLShareableContentObserver addObservers](v2, "addObservers");
    v4 = v3;
  }

  return v3;
}

- (void)addObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC5EB8], "addUserActivityObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didBecomeActiveNotification_, *MEMORY[0x1E0DC4750], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didEnterBackgroundNotification_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_willResignActiveNotification_, *MEMORY[0x1E0DC4868], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_documentStateChangedNotification_, *MEMORY[0x1E0DC4998], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_activityItemsConfigurationReadyNotification_, CFSTR("ActivityItemsConfigurationReadyNotification"), 0);

}

- (SLDServiceProxy)serviceProxy
{
  SLDServiceProxy *serviceProxy;
  uint64_t v4;
  void *v5;
  SLDServiceProxy *v6;
  SLDServiceProxy *v7;

  serviceProxy = self->_serviceProxy;
  if (!serviceProxy)
  {
    v4 = objc_opt_class();
    -[SLShareableContentObserver serviceQueue](self, "serviceQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SLDServiceProxy proxyForServiceClass:targetSerialQueue:delegate:](SLDServiceProxy, "proxyForServiceClass:targetSerialQueue:delegate:", v4, v5, self);
    v6 = (SLDServiceProxy *)objc_claimAutoreleasedReturnValue();
    v7 = self->_serviceProxy;
    self->_serviceProxy = v6;

    serviceProxy = self->_serviceProxy;
  }
  return serviceProxy;
}

- (OS_dispatch_queue)serviceQueue
{
  OS_dispatch_queue *serviceQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  serviceQueue = self->_serviceQueue;
  if (!serviceQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SocialLayer.ShareableContentObserver.ServiceQueue", v4);
    v6 = self->_serviceQueue;
    self->_serviceQueue = v5;

    serviceQueue = self->_serviceQueue;
  }
  return serviceQueue;
}

- (void)setNeedsRefresh
{
  NSObject *v3;
  uint8_t v4[16];

  -[SLShareableContentObserver setNeedsRefresh:](self, "setNeedsRefresh:", 1);
  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "[observer] set needs refresh", v4, 2u);
  }

  -[SLShareableContentObserver resumeIfNeeded](self, "resumeIfNeeded");
}

- (BOOL)applicationIsActive
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState") == 0;

  return v3;
}

- (BOOL)needsToResume
{
  return !-[SLShareableContentObserver state](self, "state")
      && -[SLShareableContentObserver applicationIsActive](self, "applicationIsActive");
}

- (void)resumeIfNeeded
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = -[SLShareableContentObserver needsToResume](self, "needsToResume");
  SLShareableContentLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[observer] resuming", v6, 2u);
    }

    -[SLShareableContentObserver setState:](self, "setState:", 1);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[observer] resume not needed", buf, 2u);
    }

  }
}

- (BOOL)needsToRefresh
{
  return -[SLShareableContentObserver state](self, "state") == 1
      && -[SLShareableContentObserver needsRefresh](self, "needsRefresh");
}

- (void)refreshIfNeeded
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = -[SLShareableContentObserver needsToRefresh](self, "needsToRefresh");
  SLShareableContentLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[observer] refreshing", v6, 2u);
    }

    -[SLShareableContentObserver setState:](self, "setState:", 2);
    -[SLShareableContentObserver connectAndRefreshNow](self, "connectAndRefreshNow");
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[observer] refresh not needed", buf, 2u);
    }

  }
}

- (void)connectAndRefreshNow
{
  NSObject *v3;
  _QWORD block[5];

  -[SLShareableContentObserver serviceQueue](self, "serviceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SLShareableContentObserver_connectAndRefreshNow__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __50__SLShareableContentObserver_connectAndRefreshNow__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectionActive");

  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "remoteService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refreshShareableContentMetadataInJoinedConversation");

    SLShareableContentLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "[observer] refreshed", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SLShareableContentObserver_connectAndRefreshNow__block_invoke_17;
    block[3] = &unk_1E3794360;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    objc_msgSend(v4, "connect");

  }
}

uint64_t __50__SLShareableContentObserver_connectAndRefreshNow__block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)pause
{
  NSObject *v3;
  uint8_t v4[16];

  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "[observer] pausing", v4, 2u);
  }

  -[SLShareableContentObserver setState:](self, "setState:", 0);
}

- (void)reset
{
  NSObject *v3;
  uint8_t v4[16];

  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "[observer] resetting", v4, 2u);
  }

  -[SLShareableContentObserver setState:](self, "setState:", 0);
  -[SLShareableContentObserver setNeedsRefresh:](self, "setNeedsRefresh:", 0);
}

- (void)didBecomeActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", (uint8_t *)&v7, 0xCu);

  }
  -[SLShareableContentObserver resumeIfNeeded](self, "resumeIfNeeded");

}

- (void)didEnterBackgroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", (uint8_t *)&v7, 0xCu);

  }
  -[SLShareableContentObserver reset](self, "reset");

}

- (void)willResignActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", (uint8_t *)&v7, 0xCu);

  }
  -[SLShareableContentObserver pause](self, "pause");

}

- (void)documentStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = objc_msgSend(v8, "documentState");
    SLShareableContentLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v8;
      v13 = 2048;
      v14 = v9;
      _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_INFO, "[observer] document %@ changed state to %tu", (uint8_t *)&v11, 0x16u);
    }

    if (!v9)
      -[SLShareableContentObserver refreshIfNeeded](self, "refreshIfNeeded");

  }
}

- (void)activityItemsConfigurationReadyNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[observer] notification received: %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SLShareableContentObserver_activityItemsConfigurationReadyNotification___block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __74__SLShareableContentObserver_activityItemsConfigurationReadyNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshIfNeeded");
}

- (void)userActivityWasCreated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[observer] user activity created with type %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SLShareableContentObserver_userActivityWasCreated___block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __53__SLShareableContentObserver_userActivityWasCreated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshIfNeeded");
}

- (void)serviceProxyDidConnect:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  SLShareableContentLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "[observer] service proxy connected", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SLShareableContentObserver_serviceProxyDidConnect___block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __53__SLShareableContentObserver_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 32), "connectAndRefreshNow");
  return result;
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[observer] service proxy disconnected", v4, 2u);
  }

}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
