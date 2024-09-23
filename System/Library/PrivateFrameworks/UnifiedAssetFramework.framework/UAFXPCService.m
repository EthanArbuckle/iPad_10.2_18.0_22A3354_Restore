@implementation UAFXPCService

+ (void)daemonLaunchTasks
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "+[UAFXPCService daemonLaunchTasks]";
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s Running UAF daemon launch tasks", (uint8_t *)&v6, 0xCu);
  }

  +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performDbUpgradeToVersion:", 1);

  if (!+[UAFCommonUtilities isGameModeEnabled](UAFCommonUtilities, "isGameModeEnabled"))
  {
    +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:](UAFAssetSetManager, "configureAssetDelivery:configurationManager:lockIfUnchanged:", v4, v5, 0);

  }
}

- (UAFXPCService)init
{
  return -[UAFXPCService initWithMachServiceName:](self, "initWithMachServiceName:", CFSTR("com.apple.siri.uaf.service"));
}

- (UAFXPCService)initWithMachServiceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  UAFXPCService *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:", v5);

  v7 = -[UAFXPCService initWithXPCListener:](self, "initWithXPCListener:", v6);
  return v7;
}

- (UAFXPCService)initWithXPCListener:(id)a3
{
  id v5;
  UAFXPCService *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UAFXPCService;
  v6 = -[UAFXPCService init](&v15, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".queue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "cStringUsingEncoding:", 1), v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v6->_xpcListener, a3);
    -[NSXPCListener _setQueue:](v6->_xpcListener, "_setQueue:", v6->_queue);
    -[NSXPCListener setDelegate:](v6->_xpcListener, "setDelegate:", v6);
    +[UAFAutoAssetManager observeAllAssetSets](UAFAutoAssetManager, "observeAllAssetSets");

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UAFXPCService _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UAFXPCService;
  -[UAFXPCService dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__UAFXPCService_invalidate__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__UAFXPCService_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSXPCListener *xpcListener;
  NSXPCListener *v4;

  -[UAFXPCService stop](self, "stop");
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    -[NSXPCListener invalidate](xpcListener, "invalidate");
    v4 = self->_xpcListener;
    self->_xpcListener = 0;

  }
}

- (void)startAsync
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__UAFXPCService_startAsync__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__UAFXPCService_startAsync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)start
{
  -[UAFXPCService runUpdates](self, "runUpdates");
  -[NSXPCListener resume](self->_xpcListener, "resume");
}

- (void)_startObservers
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v5;
  __CFNotificationCenter *v6;
  __CFString *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[UAFXPCService _startObservers]";
    _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting observers", (uint8_t *)&v10, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  getAFLanguageCodeDidChangeDarwinNotification_0();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AFLanguageDidChangeCallback_0, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  getkAFPreferencesDidChangeDarwinNotification_0();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_AFPreferencesDidChangeCallback_0, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)_LanguageChangedCallback, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)_GMSAvailabilityDidChangeCallback, CFSTR("com.apple.gms.availability.notification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)stopAsync
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__UAFXPCService_stopAsync__block_invoke;
  block[3] = &unk_24F1F6F88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __26__UAFXPCService_stopAsync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (void)stop
{
  -[UAFXPCService _stopObservers](self, "_stopObservers");
  -[NSXPCListener suspend](self->_xpcListener, "suspend");
}

- (void)_stopObservers
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v5;
  __CFNotificationCenter *v6;
  __CFString *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[UAFXPCService _stopObservers]";
    _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping observers", (uint8_t *)&v10, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  getAFLanguageCodeDidChangeDarwinNotification_0();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0);

  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  getkAFPreferencesDidChangeDarwinNotification_0();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v6, self, v7, 0);

  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v8, self, CFSTR("com.apple.language.changed"), 0);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v9, self, CFSTR("com.apple.gms.availability.notification"), 0);
}

- (void)runUpdates
{
  uint64_t v2;
  void (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __27__UAFXPCService_runUpdates__block_invoke;
  v9[3] = &unk_24F1F6FD8;
  objc_copyWeak(&v10, &location);
  v3 = (void (**)(_QWORD))MEMORY[0x22E2C6D60](v9);
  if (objc_msgSend(MEMORY[0x24BE7A5D0], "isClassCLocked"))
  {
    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[UAFXPCService runUpdates]";
      _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Device is locked, scheduling subscription update for unlock", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x24BE7A5D0];
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __27__UAFXPCService_runUpdates__block_invoke_212;
    v7[3] = &unk_24F1F7D48;
    v8 = v3;
    objc_msgSend(v5, "runBlockWhenDeviceIsClassCUnlocked:", v7);

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[UAFXPCService runUpdates]";
      _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s Device is unlocked, running subscription update", buf, 0xCu);
    }

    v3[2](v3);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __27__UAFXPCService_runUpdates__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  UAFAssetUtilitiesService *v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_assistantPreferencesUpdate");
    objc_msgSend(v2, "_systemLanguageUpdate");
    +[UAFManagedSubscriptions managePlatformSubscription](UAFManagedSubscriptions, "managePlatformSubscription");
    +[UAFManagedSubscriptions manageSummarizationKitSubscription](UAFManagedSubscriptions, "manageSummarizationKitSubscription");
    +[UAFXPCService daemonLaunchTasks](UAFXPCService, "daemonLaunchTasks");
    objc_msgSend(v2, "_startObservers");
    v3 = objc_alloc_init(UAFAssetUtilitiesService);
    v4 = v2[6];
    v2[6] = v3;

    objc_msgSend(v2[6], "switchLanguage:", v2[4]);
    objc_msgSend(v2[6], "startObserver");
    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[UAFXPCService runUpdates]_block_invoke";
      _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s Posting notification of subscription availability", (uint8_t *)&v6, 0xCu);
    }

    notify_post((const char *)kUAFStartedNotification);
  }

}

uint64_t __27__UAFXPCService_runUpdates__block_invoke_212(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[UAFXPCService runUpdates]_block_invoke";
    _os_log_impl(&dword_229282000, v2, OS_LOG_TYPE_DEFAULT, "%s Device has been unlocked, running subscription update", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscribeWithConfig:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = (void *)MEMORY[0x24BDD1540];
          v38 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Configuration key %@ is not an NSArray of %@"), CFSTR("Subscriptions"), objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          UAFGetLogCategory((id *)&UAFLogContextXPCService);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = (void *)objc_opt_class();
            *(_DWORD *)buf = 136315650;
            v33 = "-[UAFXPCService subscribeWithConfig:completion:]";
            v34 = 2112;
            v35 = CFSTR("Subscriptions");
            v36 = 2112;
            v37 = v24;
            v25 = v24;
            _os_log_error_impl(&dword_229282000, v23, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is not an NSArray of %@", buf, 0x20u);

          }
          v6[2](v6, v15);
          goto LABEL_17;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subscriber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subscriber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[UAFAssetSetManager subscribe:subscriptions:storeManager:configurationManager:](UAFAssetSetManager, "subscribe:subscriptions:storeManager:configurationManager:", v13, v12, 0, 0);

  v15 = 0;
  if (!v14)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to subscribe to subscriptions %@ for subscriber %@"), v12, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[UAFXPCService subscribeWithConfig:completion:]";
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v7;
      _os_log_error_impl(&dword_229282000, v19, OS_LOG_TYPE_ERROR, "%s Failed to subscribe to subscriptions %@ for subscriber %@", buf, 0x20u);
    }

  }
  v6[2](v6, v15);

LABEL_17:
}

- (void)unsubscribeWithConfig:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = (void *)MEMORY[0x24BDD1540];
          v38 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Configuration key %@ is not an NSArray of %@"), CFSTR("Subscriptions"), objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          UAFGetLogCategory((id *)&UAFLogContextXPCService);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = (void *)objc_opt_class();
            *(_DWORD *)buf = 136315650;
            v33 = "-[UAFXPCService unsubscribeWithConfig:completion:]";
            v34 = 2112;
            v35 = CFSTR("Subscriptions");
            v36 = 2112;
            v37 = v24;
            v25 = v24;
            _os_log_error_impl(&dword_229282000, v23, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is not an NSArray of %@", buf, 0x20u);

          }
          v6[2](v6, v15);
          goto LABEL_17;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subscriber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Subscriber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[UAFAssetSetManager unsubscribe:subscriptions:storeManager:configurationManager:](UAFAssetSetManager, "unsubscribe:subscriptions:storeManager:configurationManager:", v13, v12, 0, 0);

  v15 = 0;
  if (!v14)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to unsubscribe from subscriptions %@ for subscriber %@"), v12, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[UAFXPCService unsubscribeWithConfig:completion:]";
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v7;
      _os_log_error_impl(&dword_229282000, v19, OS_LOG_TYPE_ERROR, "%s Failed to unsubscribe from subscriptions %@ for subscriber %@", buf, 0x20u);
    }

  }
  v6[2](v6, v15);

LABEL_17:
}

- (void)configureCacheDeleteWithConfig:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  id v48;
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CacheDeleteDisabled"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CacheDeleteDisabled")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        v8,
        (isKindOfClass & 1) == 0))
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Configuration key %@ is not an %@"), CFSTR("CacheDeleteDisabled"), objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v44 = "-[UAFXPCService configureCacheDeleteWithConfig:completion:]";
      v45 = 2112;
      v46 = CFSTR("CacheDeleteDisabled");
      v47 = 2112;
      v48 = (id)objc_opt_class();
      v27 = v48;
LABEL_12:
      _os_log_error_impl(&dword_229282000, v26, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is not an %@", buf, 0x20u);

    }
LABEL_13:

    v6[2](v6, v25);
    goto LABEL_14;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AutoAssetType"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v12 = (void *)v11,
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AutoAssetType")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v14 = objc_opt_isKindOfClass(),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    v28 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Configuration key %@ is not an %@"), CFSTR("AutoAssetType"), objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_opt_class();
      *(_DWORD *)buf = 136315650;
      v44 = "-[UAFXPCService configureCacheDeleteWithConfig:completion:]";
      v45 = 2112;
      v46 = CFSTR("AutoAssetType");
      v47 = 2112;
      v48 = v31;
      v27 = v31;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15
    && (v16 = (void *)v15,
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssetSpecifier")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v18 = objc_opt_isKindOfClass(),
        v17,
        v16,
        (v18 & 1) != 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CacheDeleteDisabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AutoAssetType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFAssetSetManager disableCacheDelete:forAutoAssetType:autoAssetSpecifier:](UAFAssetSetManager, "disableCacheDelete:forAutoAssetType:autoAssetSpecifier:", objc_msgSend(v19, "BOOLValue"), v20, v21);
    v6[2](v6, 0);

  }
  else
  {
    v32 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Configuration key %@ is not an %@"), CFSTR("AssetSpecifier"), objc_opt_class(), v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)objc_opt_class();
      *(_DWORD *)buf = 136315650;
      v44 = "-[UAFXPCService configureCacheDeleteWithConfig:completion:]";
      v45 = 2112;
      v46 = CFSTR("AssetSpecifier");
      v47 = 2112;
      v48 = v37;
      v38 = v37;
      _os_log_error_impl(&dword_229282000, v36, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is not an %@", buf, 0x20u);

    }
    v6[2](v6, v35);

  }
LABEL_14:

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  BOOL v4;
  BOOL v5;
  id v7;
  void *v8;

  if (a4)
    v4 = self->_xpcListener == a3;
  else
    v4 = 0;
  v5 = v4;
  if (v4)
  {
    v7 = a4;
    objc_msgSend(v7, "setRemoteObjectInterface:", 0);
    +[UAFXPCProxyServiceInterface defaultInterface](UAFXPCProxyServiceInterface, "defaultInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v8);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "resume");

  }
  return v5;
}

- (void)operationWithConfig:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  BOOL v17;
  id v18;
  BOOL v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (!v6)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing configuration dictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[UAFXPCService operationWithConfig:completion:]";
      _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s Missing configuration dictionary", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  v36 = 0;
  v8 = +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v6, CFSTR("Operation"), objc_opt_class(), 1, &v36);
  v9 = v36;
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Operation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("Subscribe")))
    {

    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Operation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Unsubscribe"));

      if (!v16)
      {
LABEL_13:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Operation"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("Subscribe"));

        if (v21)
        {
          -[UAFXPCService subscribeWithConfig:completion:](self, "subscribeWithConfig:completion:", v6, v7);
          goto LABEL_9;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Operation"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("Unsubscribe"));

        if (v23)
        {
          -[UAFXPCService unsubscribeWithConfig:completion:](self, "unsubscribeWithConfig:completion:", v6, v7);
          goto LABEL_9;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Operation"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("ConfigureCacheDelete"));

        if (v25)
        {
          -[UAFXPCService configureCacheDeleteWithConfig:completion:](self, "configureCacheDeleteWithConfig:completion:", v6, v7);
          goto LABEL_9;
        }
        v26 = (void *)MEMORY[0x24BDD1540];
        if (v9)
        {
          v45[0] = *MEMORY[0x24BDD0FC8];
          v27 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Operation"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("Configuration key %@ is set to invalid value \"%@\"), CFSTR("Operation"), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v45[1] = *MEMORY[0x24BDD1398];
          v46[0] = v29;
          v46[1] = v9;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v30);
          v31 = objc_claimAutoreleasedReturnValue();

          v9 = (id)v31;
        }
        else
        {
          v43 = *MEMORY[0x24BDD0FC8];
          v32 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Operation"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("Configuration key %@ is set to invalid value \"%@\"), CFSTR("Operation"), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v30);
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }

        UAFGetLogCategory((id *)&UAFLogContextXPCService);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Operation"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v38 = "-[UAFXPCService operationWithConfig:completion:]";
          v39 = 2112;
          v40 = CFSTR("Operation");
          v41 = 2112;
          v42 = v33;
          _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s Configuration key %@ is set to invalid value \"%@\", buf, 0x20u);

        }
        goto LABEL_7;
      }
    }
    v35 = v9;
    v17 = +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v6, CFSTR("Subscriber"), objc_opt_class(), 1, &v35);
    v18 = v35;

    if (!v17)
    {
      v7[2](v7, v18);
      v9 = v18;
      goto LABEL_9;
    }
    v34 = v18;
    v19 = +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v6, CFSTR("Subscriptions"), objc_opt_class(), 1, &v34);
    v9 = v34;

    if (!v19)
      goto LABEL_8;
    goto LABEL_13;
  }
LABEL_8:
  v7[2](v7, v9);
LABEL_9:

}

- (void)diagnosticInformation:(id)a3
{
  void (**v3)(id, void *, id);
  void *v4;
  id v5;
  id v6;

  v6 = 0;
  v3 = (void (**)(id, void *, id))a3;
  +[UAFAssetSetManager generateInformationWithError:](UAFAssetSetManager, "generateInformationWithError:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  v3[2](v3, v4, v5);

}

- (void)lockLatestAtomicInstance:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  void (**v13)(id, id);
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = objc_alloc(MEMORY[0x24BE66BD8]);
  +[UAFAutoAssetManager getConcurrentQueue](UAFAutoAssetManager, "getConcurrentQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = (void *)objc_msgSend(v7, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), CFSTR("manager"), v5, 0, v8, &v14);
  v10 = v14;

  if (v10)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[UAFXPCService lockLatestAtomicInstance:completion:]";
      v17 = 2114;
      v18 = v5;
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ for updating: %{public}@", buf, 0x20u);
    }

    v6[2](v6, v10);
  }
  else if (v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__UAFXPCService_lockLatestAtomicInstance_completion___block_invoke;
    v12[3] = &unk_24F1F74E8;
    v13 = v6;
    +[UAFAutoAssetManager lockLatestAssetSet:completion:](UAFAutoAssetManager, "lockLatestAssetSet:completion:", v9, v12);

  }
  else
  {
    v6[2](v6, 0);
  }

}

uint64_t __53__UAFXPCService_lockLatestAtomicInstance_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)downloadSiriAssets
{
  -[UAFAssetUtilitiesService downloadSiriAssets](self->_assetUtilitiesService, "downloadSiriAssets");
}

- (void)downloadSiriAssetsOverCellular
{
  -[UAFAssetUtilitiesService downloadSiriAssetsOverCellular](self->_assetUtilitiesService, "downloadSiriAssetsOverCellular");
}

- (void)postAssetNotificationIfNeeded
{
  -[UAFAssetUtilitiesService postAssetNotificationIfNeeded](self->_assetUtilitiesService, "postAssetNotificationIfNeeded");
}

- (void)downloadDictationAssetsForLanguage:(id)a3
{
  -[UAFAssetUtilitiesService downloadDictationAssetsForLanguage:](self->_assetUtilitiesService, "downloadDictationAssetsForLanguage:", a3);
}

- (void)postDictationAssetNotificationForLanguage:(id)a3
{
  -[UAFAssetUtilitiesService postDictationAssetNotificationForLanguage:](self->_assetUtilitiesService, "postDictationAssetNotificationForLanguage:", a3);
}

- (void)checkAssetStatus:(id)a3
{
  -[UAFAssetUtilitiesService checkAssetStatus:](self->_assetUtilitiesService, "checkAssetStatus:", a3);
}

- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5
{
  -[UAFAssetUtilitiesService diskSpaceNeededInBytesForLanguage:forClient:completion:](self->_assetUtilitiesService, "diskSpaceNeededInBytesForLanguage:forClient:completion:", a3, a4, a5);
}

- (void)_assistantLanguageUpdate
{
  NSString *v3;
  NSString *v4;
  NSString *languageCode;
  NSObject *v6;
  NSString *v7;
  const __CFString *v8;
  uint64_t v9;
  _BOOL4 v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = self->_languageCode;
  if (self->_assistantEnabled)
  {
    +[UAFCommonUtilities currentAssistantLanguage](UAFCommonUtilities, "currentAssistantLanguage");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  languageCode = self->_languageCode;
  self->_languageCode = v4;

  if (-[NSString isEqualToString:](self->_languageCode, "isEqualToString:", v3))
  {
    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_languageCode;
      v14 = 136315394;
      v15 = "-[UAFXPCService _assistantLanguageUpdate]";
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s Ignoring notification Siri language unchanged from : %{public}@", (uint8_t *)&v14, 0x16u);
    }

  }
  else
  {
    if (+[UAFCommonUtilities deviceSupportAssistantEngine](UAFCommonUtilities, "deviceSupportAssistantEngine"))
    {
      v8 = CFSTR("assistantengine");
      v9 = 3;
    }
    else if (+[UAFCommonUtilities deviceSupportFullUOD](UAFCommonUtilities, "deviceSupportFullUOD"))
    {
      v9 = 0;
      v8 = CFSTR("full");
    }
    else
    {
      v10 = +[UAFCommonUtilities deviceSupportAndUseHybridASR](UAFCommonUtilities, "deviceSupportAndUseHybridASR");
      if (v10)
        v9 = 1;
      else
        v9 = 2;
      if (v10)
        v8 = CFSTR("hybrid");
      else
        v8 = CFSTR("legacy");
    }
    UAFGetLogCategory((id *)&UAFLogContextXPCService);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_languageCode;
      v14 = 136315650;
      v15 = "-[UAFXPCService _assistantLanguageUpdate]";
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_229282000, v11, OS_LOG_TYPE_DEFAULT, "%s Siri language changed to : %{public}@, mode: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    +[UAFManagedSubscriptions manageAssistantSubscription:withMode:](UAFManagedSubscriptions, "manageAssistantSubscription:withMode:", self->_languageCode, v9);
    if (self->_assistantEnabled)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAFManagedSubscriptions manageMorphunSystemLocaleSubscription:](UAFManagedSubscriptions, "manageMorphunSystemLocaleSubscription:", v13);

    }
    else
    {
      +[UAFManagedSubscriptions manageMorphunSystemLocaleSubscription:](UAFManagedSubscriptions, "manageMorphunSystemLocaleSubscription:", 0);
    }
    -[UAFXPCService _assistantGMSAvailabilityUpdate](self, "_assistantGMSAvailabilityUpdate");
    -[UAFAssetUtilitiesService switchLanguage:](self->_assetUtilitiesService, "switchLanguage:", self->_languageCode);
  }

}

- (void)_assistantGMSAvailabilityUpdate
{
  _BOOL8 v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  _BOOL4 v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = +[UAFCommonUtilities gmsWantsAssets](UAFCommonUtilities, "gmsWantsAssets");
  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315650;
    v5 = "-[UAFXPCService _assistantGMSAvailabilityUpdate]";
    v6 = 1024;
    v7 = v2;
    v8 = 2112;
    v9 = CFSTR("en-US");
    _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s Siri IE is now: wants assets: %d, language: %@", (uint8_t *)&v4, 0x1Cu);
  }

  +[UAFManagedSubscriptions manageGMSSiriLanguageSubscription:language:](UAFManagedSubscriptions, "manageGMSSiriLanguageSubscription:language:", v2, CFSTR("en-US"));
}

- (void)_assistantPreferencesUpdate
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  self->_dictationEnabled = +[UAFCommonUtilities isDictationEnabled](UAFCommonUtilities, "isDictationEnabled");
  self->_assistantEnabled = +[UAFCommonUtilities isAssistantEnabled](UAFCommonUtilities, "isAssistantEnabled");
  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_dictationEnabled)
      v4 = "enabled";
    else
      v4 = "disabled";
    v7 = 136315394;
    v8 = "-[UAFXPCService _assistantPreferencesUpdate]";
    v9 = 2080;
    v10 = v4;
    _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s Dictation preferences changed to : %s", (uint8_t *)&v7, 0x16u);
  }

  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_assistantEnabled)
      v6 = "enabled";
    else
      v6 = "disabled";
    v7 = 136315394;
    v8 = "-[UAFXPCService _assistantPreferencesUpdate]";
    v9 = 2080;
    v10 = v6;
    _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s Assistant preferences changed to : %s", (uint8_t *)&v7, 0x16u);
  }

  -[UAFXPCService _assistantLanguageUpdate](self, "_assistantLanguageUpdate");
}

- (void)_systemLanguageUpdate
{
  NSString *v3;
  NSString *systemLanguageCode;
  NSObject *v5;
  NSString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[UAFCommonUtilities systemLanguageLocale](UAFCommonUtilities, "systemLanguageLocale");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  systemLanguageCode = self->_systemLanguageCode;
  self->_systemLanguageCode = v3;

  UAFGetLogCategory((id *)&UAFLogContextXPCService);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_systemLanguageCode;
    v8 = 136315394;
    v9 = "-[UAFXPCService _systemLanguageUpdate]";
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s System language changed to : %{public}@", (uint8_t *)&v8, 0x16u);
  }

  +[UAFManagedSubscriptions manageNLSystemLanguageSubscription:](UAFManagedSubscriptions, "manageNLSystemLanguageSubscription:", self->_systemLanguageCode);
  if (self->_assistantEnabled)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFManagedSubscriptions manageMorphunSystemLocaleSubscription:](UAFManagedSubscriptions, "manageMorphunSystemLocaleSubscription:", v7);

  }
  else
  {
    +[UAFManagedSubscriptions manageMorphunSystemLocaleSubscription:](UAFManagedSubscriptions, "manageMorphunSystemLocaleSubscription:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUtilitiesService, 0);
  objc_storeStrong((id *)&self->_systemLanguageCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
