@implementation SRUIFCachedPreferences

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SRUIFCachedPreferences_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __40__SRUIFCachedPreferences_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (SRUIFCachedPreferences)init
{
  SRUIFCachedPreferences *v2;
  uint64_t v3;
  NSHashTable *observers;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSUserDefaults *textInputDefaults;
  void *v9;
  UAFAssetUtilities *v10;
  UAFAssetUtilities *assetUtilities;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SRUIFCachedPreferences;
  v2 = -[SRUIFCachedPreferences init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_create("SRUIFCachedPreferences", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.textinput"));
    textInputDefaults = v2->_textInputDefaults;
    v2->_textInputDefaults = (NSUserDefaults *)v7;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_textInputDefaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("SiriUITextInputEnabled"), 5, &SRUIFCachedPreferencesContext);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_textInputDefaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("SiriUITextInputHTTEnabled"), 5, &SRUIFCachedPreferencesContext);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_updatePreferences, *MEMORY[0x24BE08EB8], 0);

    -[SRUIFCachedPreferences updatePreferences](v2, "updatePreferences");
    v10 = (UAFAssetUtilities *)objc_alloc_init(MEMORY[0x24BEBEE88]);
    assetUtilities = v2->_assetUtilities;
    v2->_assetUtilities = v10;

    -[UAFAssetUtilities setDelegate:](v2->_assetUtilities, "setDelegate:", v2);
    -[UAFAssetUtilities startObserversWithOptions:](v2->_assetUtilities, "startObserversWithOptions:", 17);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[NSUserDefaults removeObserver:forKeyPath:context:](self->_textInputDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("SiriUITextInputEnabled"), &SRUIFCachedPreferencesContext);
  -[NSUserDefaults removeObserver:forKeyPath:context:](self->_textInputDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("SiriUITextInputHTTEnabled"), &SRUIFCachedPreferencesContext);
  -[NSHashTable removeAllObjects](self->_observers, "removeAllObjects");
  v4.receiver = self;
  v4.super_class = (Class)SRUIFCachedPreferences;
  -[SRUIFCachedPreferences dealloc](&v4, sel_dealloc);
}

- (void)updatePreferences
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SRUIFCachedPreferences updatePreferences]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s Syncing cached SiriUIPreferences.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SRUIFCachedPreferences_updatePreferences__block_invoke;
  block[3] = &unk_24DC1A810;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __43__SRUIFCachedPreferences_updatePreferences__block_invoke(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[17] = AFPreferencesStreamingDictationEnabled();
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained[18] = objc_msgSend(v3, "disableAssistantWhilePasscodeLocked") ^ 1;

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __43__SRUIFCachedPreferences_updatePreferences__block_invoke_2;
    v5[3] = &unk_24DC1B5F0;
    objc_copyWeak(&v6, v1);
    objc_msgSend(v4, "getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:", v5);

    objc_destroyWeak(&v6);
  }

}

void __43__SRUIFCachedPreferences_updatePreferences__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_setAnnounceNotificationsInCarPlayTemporarilyDisabled:", a2);
    WeakRetained = v4;
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SRUIFCachedPreferences_addObserver___block_invoke;
  block[3] = &unk_24DC1A838;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__SRUIFCachedPreferences_addObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[4], "addObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SRUIFCachedPreferences_removeObserver___block_invoke;
  block[3] = &unk_24DC1A838;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__SRUIFCachedPreferences_removeObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[4], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (BOOL)isHoldToTalkForTextInputEnabled
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SRUIFCachedPreferences_isHoldToTalkForTextInputEnabled__block_invoke;
  block[3] = &unk_24DC1B618;
  objc_copyWeak(&v6, &location);
  block[4] = &v8;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

void __57__SRUIFCachedPreferences_isHoldToTalkForTextInputEnabled__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[16];

}

- (BOOL)isStreamingDictationEnabled
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SRUIFCachedPreferences_isStreamingDictationEnabled__block_invoke;
  block[3] = &unk_24DC1B618;
  objc_copyWeak(&v6, &location);
  block[4] = &v8;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

void __53__SRUIFCachedPreferences_isStreamingDictationEnabled__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[17];

}

- (BOOL)isSiriSafeForLockScreen
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SRUIFCachedPreferences_isSiriSafeForLockScreen__block_invoke;
  block[3] = &unk_24DC1B618;
  objc_copyWeak(&v6, &location);
  block[4] = &v8;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

void __49__SRUIFCachedPreferences_isSiriSafeForLockScreen__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[18];

}

- (BOOL)announceNotificationsInCarPlayTemporarilyDisabled
{
  NSObject *queue;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__SRUIFCachedPreferences_announceNotificationsInCarPlayTemporarilyDisabled__block_invoke;
  block[3] = &unk_24DC1B618;
  objc_copyWeak(&v6, &location);
  block[4] = &v8;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

void __75__SRUIFCachedPreferences_announceNotificationsInCarPlayTemporarilyDisabled__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[19];

}

- (BOOL)assetsNeedSpace
{
  void *v2;
  BOOL v3;

  -[SRUIFCachedPreferences assetStatus](self, "assetStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 6;

  return v3;
}

- (BOOL)assetsDownloading
{
  void *v2;
  BOOL v3;

  -[SRUIFCachedPreferences assetStatus](self, "assetStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 3;

  return v3;
}

- (BOOL)understandingOnDeviceAssetsAvailable
{
  NSObject *queue;
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SRUIFCachedPreferences_understandingOnDeviceAssetsAvailable__block_invoke;
  v5[3] = &unk_24DC1B640;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__SRUIFCachedPreferences_understandingOnDeviceAssetsAvailable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (UAFAssetStatus)assetStatus
{
  NSObject *queue;
  id v3;
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SRUIFCachedPreferences_assetStatus__block_invoke;
  v5[3] = &unk_24DC1B640;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UAFAssetStatus *)v3;
}

void __37__SRUIFCachedPreferences_assetStatus__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (NSDictionary)assistantUODStatus
{
  NSObject *queue;
  id v3;
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SRUIFCachedPreferences_assistantUODStatus__block_invoke;
  v5[3] = &unk_24DC1B640;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __44__SRUIFCachedPreferences_assistantUODStatus__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)siriUODStatusDidChange
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__SRUIFCachedPreferences_siriUODStatusDidChange__block_invoke;
  v4[3] = &unk_24DC1A810;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SRUIFCachedPreferences_siriUODStatusDidChange__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[5], "assistantUODStatus");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAssistantUODStatus:", v2);

    WeakRetained = v3;
  }

}

- (void)siriUODAvailabilityDidChange:(BOOL)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SRUIFCachedPreferences_siriUODAvailabilityDidChange___block_invoke;
  block[3] = &unk_24DC1ADB0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__SRUIFCachedPreferences_siriUODAvailabilityDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setUnderstandingOnDeviceAssetsAvailable:", *(unsigned __int8 *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)handleAssetStatusUpdated
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SRUIFCachedPreferences_handleAssetStatusUpdated__block_invoke;
  v4[3] = &unk_24DC1A810;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SRUIFCachedPreferences_handleAssetStatusUpdated__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[5], "currentAssetStatus");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAssetStatus:", v2);

    WeakRetained = v3;
  }

}

- (void)_setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  if (-[SRUIFCachedPreferences announceNotificationsInCarPlayTemporarilyDisabled](self, "announceNotificationsInCarPlayTemporarilyDisabled") != a3)
  {
    self->_announceNotificationsInCarPlayTemporarilyDisabled = a3;
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __80__SRUIFCachedPreferences__setAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke;
    v5[3] = &unk_24DC1B668;
    objc_copyWeak(&v6, &location);
    v7 = a3;
    -[SRUIFCachedPreferences _notifyObserversOfSettingsChangeWithBlock:](self, "_notifyObserversOfSettingsChangeWithBlock:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __80__SRUIFCachedPreferences__setAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v4, "cachedPreferences:announceNotificationsInCarPlayTemporarilyDisabledChanged:", WeakRetained, *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NSUserDefaults *v11;
  id v12;
  NSObject *queue;
  objc_super v14;
  _QWORD block[4];
  id v16;
  SRUIFCachedPreferences *v17;

  v10 = a3;
  v11 = (NSUserDefaults *)a4;
  v12 = a5;
  if (a6 == &SRUIFCachedPreferencesContext)
  {
    if (self->_textInputDefaults == v11)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__SRUIFCachedPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_24DC1ADD8;
      v16 = v10;
      v17 = self;
      dispatch_async(queue, block);

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SRUIFCachedPreferences;
    -[SRUIFCachedPreferences observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __73__SRUIFCachedPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("SiriUITextInputHTTEnabled")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", CFSTR("SiriUITextInputHTTEnabled"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = objc_msgSend(v2, "BOOLValue");

  }
}

- (void)_notifyObserversOfSettingsChangeWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_observers;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setUnderstandingOnDeviceAssetsAvailable:(BOOL)a3
{
  self->_understandingOnDeviceAssetsAvailable = a3;
}

- (void)setAssistantUODStatus:(id)a3
{
  objc_storeStrong((id *)&self->_assistantUODStatus, a3);
}

- (void)setAssetStatus:(id)a3
{
  objc_storeStrong((id *)&self->_assetStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetStatus, 0);
  objc_storeStrong((id *)&self->_assistantUODStatus, 0);
  objc_storeStrong((id *)&self->_assetUtilities, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_textInputDefaults, 0);
}

@end
