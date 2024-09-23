@implementation PCPersistentInterfaceManager

- (void)addDelegate:(id)a3 queue:(id)a4
{
  NSRecursiveLock *lock;
  id v7;
  id v8;
  PCDelegateInfo *v9;

  lock = self->_lock;
  v7 = a4;
  v8 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  v9 = objc_alloc_init(PCDelegateInfo);
  -[PCDelegateInfo setQueue:](v9, "setQueue:", v7);

  -[NSMapTable setObject:forKey:](self->_delegatesAndQueues, "setObject:forKey:", v9, v8);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

- (void)removeDelegate:(id)a3
{
  NSRecursiveLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[NSMapTable removeObjectForKey:](self->_delegatesAndQueues, "removeObjectForKey:", v5);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isWWANInterfaceUp
{
  BOOL isWWANInterfaceUp;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isWWANInterfaceUp = self->_isWWANInterfaceUp;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isWWANInterfaceUp;
}

- (BOOL)isPowerStateDetectionSupported
{
  BOOL isPowerStateDetectionSupported;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isPowerStateDetectionSupported = self->_isPowerStateDetectionSupported;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isPowerStateDetectionSupported;
}

- (BOOL)isInternetReachable
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = -[PCPersistentInterfaceManager _isInternetReachableLocked](self, "_isInternetReachableLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)isInCall
{
  BOOL isInCall;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isInCall = self->_isInCall;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isInCall;
}

- (BOOL)_isInternetReachableLocked
{
  void *v3;
  char v4;
  void *v5;

  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInterfaceUsable") && self->_isWWANInterfaceUp)
  {
    v4 = 1;
  }
  else
  {
    +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isInterfaceUsable");

  }
  return v4;
}

- (NSString)currentLinkQualityString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkQualityString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkQualityString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("wwan is %@; wifi is %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)enableWiFiAutoAssociation:(BOOL)a3 forDelegate:(id)a4
{
  _BOOL4 v4;
  NSRecursiveLock *lock;
  id v7;
  __CFSet *WiFiAutoAssociationDelegates;
  PCSimpleTimer *v9;
  PCSimpleTimer *WiFiAutoAssociationDisableTimer;
  PCSimpleTimer *v11;
  void *v12;
  __CFRunLoop *Main;

  v4 = a3;
  lock = self->_lock;
  v7 = a4;
  -[NSRecursiveLock lock](lock, "lock");
  WiFiAutoAssociationDelegates = self->_WiFiAutoAssociationDelegates;
  if (v4)
    CFSetAddValue(WiFiAutoAssociationDelegates, v7);
  else
    CFSetRemoveValue(WiFiAutoAssociationDelegates, v7);

  if (CFSetGetCount(self->_WiFiAutoAssociationDelegates) < 1)
  {
    if (!self->_WiFiAutoAssociationDisableTimer)
    {
      v9 = -[PCSimpleTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]([PCSimpleTimer alloc], "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("interfacemanager-wifiautoassoc"), self, sel__adjustWiFiAutoAssociation, 0, 60.0);
      WiFiAutoAssociationDisableTimer = self->_WiFiAutoAssociationDisableTimer;
      self->_WiFiAutoAssociationDisableTimer = v9;

      -[PCSimpleTimer setDisableSystemWaking:](self->_WiFiAutoAssociationDisableTimer, "setDisableSystemWaking:", 1);
      v11 = self->_WiFiAutoAssociationDisableTimer;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSimpleTimer scheduleInRunLoop:](v11, "scheduleInRunLoop:", v12);

      Main = CFRunLoopGetMain();
      CFRunLoopWakeUp(Main);
    }
  }
  else
  {
    -[PCPersistentInterfaceManager _adjustWiFiAutoAssociationLocked](self, "_adjustWiFiAutoAssociationLocked");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_adjustWiFiAutoAssociationLocked
{
  PCSimpleTimer *WiFiAutoAssociationDisableTimer;
  PCSimpleTimer *v4;
  CFIndex Count;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WiFiAutoAssociationDisableTimer = self->_WiFiAutoAssociationDisableTimer;
  if (WiFiAutoAssociationDisableTimer)
  {
    -[PCSimpleTimer invalidate](WiFiAutoAssociationDisableTimer, "invalidate");
    v4 = self->_WiFiAutoAssociationDisableTimer;
    self->_WiFiAutoAssociationDisableTimer = 0;

  }
  Count = CFSetGetCount(self->_WiFiAutoAssociationDelegates);
  objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasWiFiAutoAssociationClientToken:", CFSTR("PCAutoAssociateToken"));

  if (Count > 0 != v7)
  {
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "disabling";
      if (Count > 0)
        v9 = "enabling";
      v12 = 136315138;
      v13 = v9;
      _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, "Interface manager: %s WiFi association on wake", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (Count < 1)
      objc_msgSend(v10, "removeWiFiAutoAssociationClientToken:", CFSTR("PCAutoAssociateToken"));
    else
      objc_msgSend(v10, "addWiFiAutoAssociationClientToken:", CFSTR("PCAutoAssociateToken"));

  }
}

- (void)enableWakeOnWiFi:(BOOL)a3 forDelegate:(id)a4
{
  _BOOL4 v4;
  NSRecursiveLock *lock;
  id v7;
  __CFSet *wakeOnWiFiDelegates;
  PCSimpleTimer *v9;
  PCSimpleTimer *wakeOnWiFiDisableTimer;
  PCSimpleTimer *v11;
  void *v12;
  __CFRunLoop *Main;

  v4 = a3;
  lock = self->_lock;
  v7 = a4;
  -[NSRecursiveLock lock](lock, "lock");
  wakeOnWiFiDelegates = self->_wakeOnWiFiDelegates;
  if (v4)
    CFSetAddValue(wakeOnWiFiDelegates, v7);
  else
    CFSetRemoveValue(wakeOnWiFiDelegates, v7);

  if (-[PCPersistentInterfaceManager _wantsWakeOnWiFiEnabled](self, "_wantsWakeOnWiFiEnabled"))
  {
    -[PCPersistentInterfaceManager _adjustWakeOnWiFiLocked](self, "_adjustWakeOnWiFiLocked");
  }
  else if (!self->_wakeOnWiFiDisableTimer)
  {
    v9 = -[PCSimpleTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]([PCSimpleTimer alloc], "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("interfacemanager-wow"), self, sel__adjustWakeOnWiFi, 0, 60.0);
    wakeOnWiFiDisableTimer = self->_wakeOnWiFiDisableTimer;
    self->_wakeOnWiFiDisableTimer = v9;

    -[PCSimpleTimer setDisableSystemWaking:](self->_wakeOnWiFiDisableTimer, "setDisableSystemWaking:", 1);
    v11 = self->_wakeOnWiFiDisableTimer;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCSimpleTimer scheduleInRunLoop:](v11, "scheduleInRunLoop:", v12);

    Main = CFRunLoopGetMain();
    CFRunLoopWakeUp(Main);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)_wantsWakeOnWiFiEnabled
{
  void *v2;
  char v3;

  if (CFSetGetCount(self->_wakeOnWiFiDelegates) < 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWoWSupported");

  return v3;
}

- (BOOL)doesWWANInterfaceExist
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_WWANInterfaceName != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_adjustWakeOnWiFiLocked
{
  PCSimpleTimer *wakeOnWiFiDisableTimer;
  PCSimpleTimer *v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  wakeOnWiFiDisableTimer = self->_wakeOnWiFiDisableTimer;
  if (wakeOnWiFiDisableTimer)
  {
    -[PCSimpleTimer invalidate](wakeOnWiFiDisableTimer, "invalidate");
    v4 = self->_wakeOnWiFiDisableTimer;
    self->_wakeOnWiFiDisableTimer = 0;

  }
  v5 = -[PCPersistentInterfaceManager _wantsWakeOnWiFiEnabled](self, "_wantsWakeOnWiFiEnabled");
  objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasWoWClient:", self);

  if (v5 != v7)
  {
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "disabling";
      if (v5)
        v9 = "enabling";
      v12 = 136315138;
      v13 = v9;
      _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, "Interface manager: %s wake-on-WiFi", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
      objc_msgSend(v10, "addWoWClient:", self);
    else
      objc_msgSend(v10, "removeWoWClient:", self);

  }
}

void __46__PCPersistentInterfaceManager_sharedInstance__block_invoke()
{
  PCPersistentInterfaceManager *v0;
  void *v1;

  v0 = objc_alloc_init(PCPersistentInterfaceManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (PCPersistentInterfaceManager)init
{
  PCPersistentInterfaceManager *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  uint64_t v5;
  NSMapTable *delegatesAndQueues;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PCPersistentInterfaceManager;
  v2 = -[PCPersistentInterfaceManager init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v2->_lock;
    v2->_lock = v3;

    -[NSRecursiveLock lock](v2->_lock, "lock");
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    delegatesAndQueues = v2->_delegatesAndQueues;
    v2->_delegatesAndQueues = (NSMapTable *)v5;

    v2->_WiFiAutoAssociationDelegates = CFSetCreateMutable(0, 0, 0);
    v2->_wakeOnWiFiDelegates = CFSetCreateMutable(0, 0, 0);
    v2->_ctIsWWANInHomeCountry = 1;
    v2->_isWWANInterfaceActivationPermitted = 0;
    -[PCPersistentInterfaceManager _createCTConnection](v2, "_createCTConnection");
    +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C80D38];
    objc_msgSend(v7, "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);

    +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addDelegate:queue:", v2, v8);

    -[PCPersistentInterfaceManager _updateWWANInterfaceUpStateLocked](v2, "_updateWWANInterfaceUpStateLocked");
    objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addDelegate:", v2);

    -[NSRecursiveLock unlock](v2->_lock, "unlock");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  __CFSet *WiFiAutoAssociationDelegates;
  __CFSet *wakeOnWiFiDelegates;
  void *interfaceAssertion;
  void *ctServerConnection;
  objc_super v10;

  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDelegate:", self);

  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDelegate:", self);

  objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:", self);

  WiFiAutoAssociationDelegates = self->_WiFiAutoAssociationDelegates;
  if (WiFiAutoAssociationDelegates)
    CFRelease(WiFiAutoAssociationDelegates);
  wakeOnWiFiDelegates = self->_wakeOnWiFiDelegates;
  if (wakeOnWiFiDelegates)
    CFRelease(wakeOnWiFiDelegates);
  interfaceAssertion = self->_interfaceAssertion;
  if (interfaceAssertion)
    CFRelease(interfaceAssertion);
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
    CFRelease(ctServerConnection);
  v10.receiver = self;
  v10.super_class = (Class)PCPersistentInterfaceManager;
  -[PCPersistentInterfaceManager dealloc](&v10, sel_dealloc);
}

- (void)_createCTConnection
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  CoreTelephonyClient *v10;
  CoreTelephonyClient *ctClient;
  CoreTelephonyClient *v12;
  CoreTelephonyClient *v13;
  id v14;
  id v15;
  CoreTelephonyClient *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  CoreTelephonyClient *v23;
  void *v24;
  id v25;
  NSObject *v26;
  CoreTelephonyClient *v27;
  CoreTelephonyClient *v28;
  CoreTelephonyClient *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD block[5];
  id v39;
  id v40[5];
  id v41;
  NSObject *v42;
  uint8_t buf[4];
  PCPersistentInterfaceManager *v44;
  __int16 v45;
  CoreTelephonyClient *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (self->_ctClient || self->_interfaceAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PCPersistentInterfaceManager.m"), 171, CFSTR("CTServerConnectionRef already exists"));

  }
  PCCreateQueue("PCPersistentInterfaceManager-ctserverqueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCPersistentIdentifiers processNameAndPidIdentifier](PCPersistentIdentifiers, "processNameAndPidIdentifier");
  v6 = MEMORY[0x1E0C809B0];
  v40[1] = (id)MEMORY[0x1E0C809B0];
  v40[2] = (id)3221225472;
  v40[3] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke;
  v40[4] = &unk_1E8743210;
  v7 = v5;
  v41 = v7;
  v8 = v4;
  v42 = v8;
  v9 = (void *)_CTServerConnectionCreateOnTargetQueue();
  self->_ctServerConnection = v9;
  if (v9)
    _CTServerConnectionRegisterForNotification();
  v10 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v8);
  ctClient = self->_ctClient;
  self->_ctClient = v10;

  v12 = self->_ctClient;
  if (v12)
  {
    -[CoreTelephonyClient setDelegate:](v12, "setDelegate:", self);
    v13 = self->_ctClient;
    v40[0] = 0;
    -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](v13, "getCurrentDataSubscriptionContextSync:", v40);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v40[0];
    if (v15 || !v14)
    {
      +[PCLog interfaceManager](PCLog, "interfaceManager");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v27 = self->_ctClient;
        *(_DWORD *)buf = 138412802;
        v44 = self;
        v45 = 2112;
        v46 = v27;
        v47 = 2112;
        v48 = v15;
        _os_log_error_impl(&dword_1CBC1B000, v22, OS_LOG_TYPE_ERROR, "%@ failed to get currentDataSimContext for ctclient %@ error %@", buf, 0x20u);
      }

    }
    else
    {
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_3;
      block[3] = &unk_1E8743238;
      block[4] = self;
      v14 = v14;
      v39 = v14;
      dispatch_async(v8, block);
      v16 = self->_ctClient;
      v37 = 0;
      -[CoreTelephonyClient getConnectionState:connectionType:error:](v16, "getConnectionState:connectionType:error:", v14, 0, &v37);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v37;
      v31 = v17;
      if (v18)
      {
        +[PCLog interfaceManager](PCLog, "interfaceManager");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v28 = self->_ctClient;
          *(_DWORD *)buf = 138412802;
          v44 = self;
          v45 = 2112;
          v46 = v28;
          v47 = 2112;
          v48 = v18;
          _os_log_error_impl(&dword_1CBC1B000, v19, OS_LOG_TYPE_ERROR, "%@ failed to get connection state for ctclient %@ error %@", buf, 0x20u);
        }

      }
      else
      {
        v35[0] = v6;
        v35[1] = 3221225472;
        v35[2] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_4;
        v35[3] = &unk_1E8743238;
        v35[4] = self;
        v36 = v17;
        dispatch_async(v8, v35);

      }
      v23 = self->_ctClient;
      v34 = 0;
      -[CoreTelephonyClient getDataStatus:error:](v23, "getDataStatus:error:", v14, &v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v34;
      if (v25)
      {
        +[PCLog interfaceManager](PCLog, "interfaceManager");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v29 = self->_ctClient;
          *(_DWORD *)buf = 138412802;
          v44 = self;
          v45 = 2112;
          v46 = v29;
          v47 = 2112;
          v48 = v25;
          _os_log_error_impl(&dword_1CBC1B000, v26, OS_LOG_TYPE_ERROR, "%@ failed to get data status for ctclient %@ error %@", buf, 0x20u);
        }

      }
      else
      {
        v32[0] = v6;
        v32[1] = 3221225472;
        v32[2] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_25;
        v32[3] = &unk_1E8743238;
        v32[4] = self;
        v33 = v24;
        dispatch_async(v8, v32);

      }
    }
  }
  else
  {
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CBC1B000, v20, OS_LOG_TYPE_DEFAULT, "Interface manager: unable to create a connection to the CT Server. Will retry connection to the CT server later.", buf, 2u);
    }

    v21 = objc_alloc(MEMORY[0x1E0C99D20]);
    v15 = (id)objc_msgSend(v21, "initWithObjects:", *MEMORY[0x1E0C99860], 0);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performSelector:target:argument:order:modes:", sel__mainThreadCTConnectionAttempt, self, 0, 0, v15);
  }

}

void __51__PCPersistentInterfaceManager__createCTConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = (void *)MEMORY[0x1D17A4604]();
  objc_msgSend(*(id *)(a1 + 32), "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a2, "copy");
  v9 = (void *)objc_msgSend(a3, "copy");
  if (v7)
  {
    v10 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_2;
    block[3] = &unk_1E87431E8;
    v12 = v8;
    v13 = v7;
    v14 = v9;
    dispatch_async(v10, block);

  }
  objc_autoreleasePoolPop(v6);
}

uint64_t __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CA7148]);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_processCallStatusChanged:", *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
  objc_msgSend(*(id *)(a1 + 32), "_processCurrentDataSimChangedLocked:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
}

uint64_t __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
  objc_msgSend(*(id *)(a1 + 32), "_processConnectionStatusLocked:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
}

uint64_t __51__PCPersistentInterfaceManager__createCTConnection__block_invoke_25(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
  objc_msgSend(*(id *)(a1 + 32), "_processDataStatusLocked:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
}

- (void)_mainThreadCTConnectionAttempt
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0C99D20]);
  v4 = (id)objc_msgSend(v3, "initWithObjects:", *MEMORY[0x1E0C99860], 0);
  -[PCPersistentInterfaceManager performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__ctConnectionAttempt, 0, v4, 10.0);

}

- (void)_ctConnectionAttempt
{
  void *v3;
  void *v4;
  void *v5;
  void *interfaceAssertion;
  CoreTelephonyClient *ctClient;
  CTXPCServiceSubscriptionContext *currentDataSimContext;

  v3 = (void *)MEMORY[0x1D17A4604](self, a2);
  -[NSRecursiveLock lock](self->_lock, "lock");
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelPerformSelector:target:argument:", sel__mainThreadCTConnectionAttempt, self, 0);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__ctConnectionAttempt, 0);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelPerformSelector:target:argument:", sel__ctConnectionAttempt, self, 0);

  interfaceAssertion = self->_interfaceAssertion;
  if (interfaceAssertion)
  {
    CFRelease(interfaceAssertion);
    self->_interfaceAssertion = 0;
  }
  ctClient = self->_ctClient;
  self->_ctClient = 0;

  currentDataSimContext = self->_currentDataSimContext;
  self->_currentDataSimContext = 0;

  -[PCPersistentInterfaceManager _createCTConnection](self, "_createCTConnection");
  -[PCPersistentInterfaceManager _updateWWANInterfaceAssertionsLocked](self, "_updateWWANInterfaceAssertionsLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  objc_autoreleasePoolPop(v3);
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  -[PCPersistentInterfaceManager _updateWWANInterfaceUpState](self, "_updateWWANInterfaceUpState", a3, *(_QWORD *)&a4);
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[PCPersistentInterfaceManager _scheduleCalloutsForSelector:](self, "_scheduleCalloutsForSelector:", sel_interfaceManagerInternetReachabilityChanged_);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)interfaceReachabilityChanged:(id)a3
{
  -[PCPersistentInterfaceManager _updateWWANInterfaceUpState](self, "_updateWWANInterfaceUpState", a3);
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[PCPersistentInterfaceManager _scheduleCalloutsForSelector:](self, "_scheduleCalloutsForSelector:", sel_interfaceManagerInternetReachabilityChanged_);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)handleMachMessage:(void *)a3
{
  pcdeprecated_CTServerConnectionHandleReply(a3, a2);
}

- (void)currentDataSimChanged:(id)a3
{
  NSRecursiveLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[PCPersistentInterfaceManager _processCurrentDataSimChangedLocked:](self, "_processCurrentDataSimChangedLocked:", v5);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8;
  NSRecursiveLock *lock;
  id v10;
  id v11;

  v8 = a5;
  if (!a4)
  {
    v11 = v8;
    lock = self->_lock;
    v10 = a3;
    -[NSRecursiveLock lock](lock, "lock");
    LODWORD(lock) = -[PCPersistentInterfaceManager _isCurrentDataSimContextLocked:](self, "_isCurrentDataSimContextLocked:", v10);

    if ((_DWORD)lock)
      -[PCPersistentInterfaceManager _processConnectionStatusLocked:](self, "_processConnectionStatusLocked:", v11);
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    v8 = v11;
  }

}

- (void)connectionActivationError:(id)a3 connection:(int)a4 error:(int)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  PCPersistentInterfaceManager *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!a4
    && -[PCPersistentInterfaceManager _isCurrentDataSimContextLocked:](self, "_isCurrentDataSimContextLocked:", v8))
  {
    -[CoreTelephonyClient getDataStatus:error:](self->_ctClient, "getDataStatus:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cellularDataPossible");

    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109120;
      LODWORD(v15) = a5;
      _os_log_impl(&dword_1CBC1B000, v11, OS_LOG_TYPE_DEFAULT, "Interface manager: received connectionActivationError %u", (uint8_t *)&v14, 8u);
    }

    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      if (v10)
        v13 = CFSTR("YES");
      v14 = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Interface manager: setting _isWWANInterfaceActivationPermitted to %{public}@ due to kCTRegistrationCellularDataPlanActivateFailedNotification", (uint8_t *)&v14, 0x16u);
    }

    self->_isWWANInterfaceActivationPermitted = v10;
    -[PCPersistentInterfaceManager _updateWWANInterfaceAssertionsLocked](self, "_updateWWANInterfaceAssertionsLocked");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  NSRecursiveLock *lock;
  id v7;
  id v8;

  v8 = a4;
  lock = self->_lock;
  v7 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  LODWORD(lock) = -[PCPersistentInterfaceManager _isCurrentDataSimContextLocked:](self, "_isCurrentDataSimContextLocked:", v7);

  if ((_DWORD)lock)
    -[PCPersistentInterfaceManager _processDataStatusLocked:](self, "_processDataStatusLocked:", v8);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (BOOL)_isCurrentDataSimContextLocked:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_currentDataSimContext)
  {
    v6 = objc_msgSend(v4, "slotID");
    v7 = v6 == -[CTXPCServiceSubscriptionContext slotID](self->_currentDataSimContext, "slotID");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_processCurrentDataSimChangedLocked:(id)a3
{
  id v4;
  NSObject *v5;
  CTXPCServiceSubscriptionContext *currentDataSimContext;
  CTXPCServiceSubscriptionContext *v7;
  CTXPCServiceSubscriptionContext *v8;
  int v9;
  CTXPCServiceSubscriptionContext *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PCLog interfaceManager](PCLog, "interfaceManager");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    currentDataSimContext = self->_currentDataSimContext;
    v9 = 138412546;
    v10 = currentDataSimContext;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "Interface manager: updating currentDataSimContext. {old: %@; new: %@}",
      (uint8_t *)&v9,
      0x16u);
  }

  v7 = (CTXPCServiceSubscriptionContext *)objc_msgSend(v4, "copy");
  v8 = self->_currentDataSimContext;
  self->_currentDataSimContext = v7;

}

- (void)_processConnectionStatusLocked:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  NSString *v8;
  NSString *WWANInterfaceName;
  NSObject *v10;
  NSString *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  v6 = objc_msgSend(v4, "suspended");
  objc_msgSend(v4, "interfaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSString isEqualToString:](self->_WWANInterfaceName, "isEqualToString:", v7))
  {
    v8 = (NSString *)objc_msgSend(v7, "copy");
    WWANInterfaceName = self->_WWANInterfaceName;
    self->_WWANInterfaceName = v8;

    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_WWANInterfaceName;
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "Interface manager: wwan interface name changed to %@", (uint8_t *)&v16, 0xCu);
    }

  }
  if (self->_isWWANInterfaceDataActive != (v5 == 2))
  {
    -[PCPersistentInterfaceManager _updateCTIsWWANInHomeCountry:isWWANInterfaceDataActive:](self, "_updateCTIsWWANInHomeCountry:isWWANInterfaceDataActive:", self->_ctIsWWANInHomeCountry, v5 == 2);
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isWWANInterfaceDataActive)
        v13 = "true";
      else
        v13 = "false";
      v16 = 136315138;
      v17 = (void *)v13;
      _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context _isWWANInterfaceDataActive status changed to %s", (uint8_t *)&v16, 0xCu);
    }

  }
  if (self->_isWWANInterfaceSuspended != v6)
  {
    self->_isWWANInterfaceSuspended = v6;
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isWWANInterfaceSuspended)
        v15 = "true";
      else
        v15 = "false";
      v16 = 136315138;
      v17 = (void *)v15;
      _os_log_impl(&dword_1CBC1B000, v14, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context _isWWANInterfaceSuspended status changed to  %s", (uint8_t *)&v16, 0xCu);
    }

  }
  -[PCPersistentInterfaceManager _updateWWANInterfaceUpStateLocked](self, "_updateWWANInterfaceUpStateLocked");

}

- (void)_processDataStatusLocked:(id)a3
{
  id v4;
  unsigned int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  CFAbsoluteTime Current;
  double lastActivationTime;
  NSObject *v20;
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "indicator");
  v6 = v5 < 6;
  v7 = objc_msgSend(v4, "indicator") != 0;
  v8 = objc_msgSend(v4, "cellularDataPossible");
  v9 = objc_msgSend(v4, "inHomeCountry");
  if (self->_isWWANInterfaceInProlongedHighPowerState != v6)
  {
    self->_isWWANInterfaceInProlongedHighPowerState = v6;
    if (v5 <= 5)
      self->_isPowerStateDetectionSupported = 1;
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isWWANInterfaceInProlongedHighPowerState)
        v11 = "active";
      else
        v11 = "inactive";
      v22 = 136315394;
      v23 = (void *)v11;
      v24 = 1024;
      v25 = objc_msgSend(v4, "indicator");
      _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "Interface manager: WWAN radio power level notification; high power state changed to %s with data indicator %d",
        (uint8_t *)&v22,
        0x12u);
    }

    -[PCPersistentInterfaceManager _scheduleCalloutsForSelector:](self, "_scheduleCalloutsForSelector:", sel_interfaceManagerWWANInterfaceChangedPowerState_);
  }
  if (self->_ctIsWWANInHomeCountry != (_DWORD)v9)
  {
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "false";
      if ((_DWORD)v9)
        v13 = "true";
      v22 = 136315138;
      v23 = (void *)v13;
      _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context _ctIsWWANInHomeCountry status changed to %s", (uint8_t *)&v22, 0xCu);
    }

    -[PCPersistentInterfaceManager _updateCTIsWWANInHomeCountry:isWWANInterfaceDataActive:](self, "_updateCTIsWWANInHomeCountry:isWWANInterfaceDataActive:", v9, self->_isWWANInterfaceDataActive);
  }
  if (self->_hasWWANStatusIndicator != v7)
  {
    self->_hasWWANStatusIndicator = v7;
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v4, "indicator");
      v22 = 67109120;
      LODWORD(v23) = v15;
      _os_log_impl(&dword_1CBC1B000, v14, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context WWANStatusIndicator changed to %u.", (uint8_t *)&v22, 8u);
    }

  }
  if (self->_isWWANInterfaceActivationPermitted != v8)
  {
    self->_isWWANInterfaceActivationPermitted = v8;
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isWWANInterfaceActivationPermitted)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v22 = 138543362;
      v23 = (void *)v17;
      _os_log_impl(&dword_1CBC1B000, v16, OS_LOG_TYPE_DEFAULT, "Interface manager: PDP context _isWWANInterfaceActivationPermitted to %{public}@ (isWWANInterfaceDataAttached).", (uint8_t *)&v22, 0xCu);
    }

  }
  -[PCPersistentInterfaceManager _updateWWANInterfaceUpStateLocked](self, "_updateWWANInterfaceUpStateLocked");
  if (!self->_isWWANInterfaceDataActive)
  {
    if (v8)
    {
      if (self->_hasWWANStatusIndicator)
      {
        if (-[PCPersistentInterfaceManager _wantsWWANInterfaceAssertion](self, "_wantsWWANInterfaceAssertion"))
        {
          Current = CFAbsoluteTimeGetCurrent();
          lastActivationTime = self->_lastActivationTime;
          if (lastActivationTime > Current || lastActivationTime + 900.0 < Current)
          {
            +[PCLog interfaceManager](PCLog, "interfaceManager");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v22) = 0;
              _os_log_impl(&dword_1CBC1B000, v20, OS_LOG_TYPE_DEFAULT, "Interface manager: data attached but not active; activating context",
                (uint8_t *)&v22,
                2u);
            }

            v21 = (id)-[CoreTelephonyClient setPacketContextActiveByServiceType:connectionType:active:](self->_ctClient, "setPacketContextActiveByServiceType:connectionType:active:", self->_currentDataSimContext, 0, 1);
            self->_lastActivationTime = Current;
          }
        }
      }
    }
  }

}

- (BOOL)_isCellularCall:(__CTCall *)a3
{
  const void *v3;

  if (!a3)
    return 0;
  v3 = (const void *)CTCallGetCallSubType();
  return CFEqual(v3, (CFTypeRef)*MEMORY[0x1E0CA7150]) != 0;
}

- (void)_processCallStatusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  NSTimer *inCallWWANOverrideTimer;
  _BOOL4 isInCall;
  NSTimer *v13;
  NSTimer *v14;
  NSObject *v15;
  NSTimer *v16;
  void *v17;
  __CFRunLoop *Main;
  int v19;
  PCPersistentInterfaceManager *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  NSTimer *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA7140]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "intValue") - 6 < 0xFFFFFFFE;
  else
    v7 = 0;
  v8 = v7 & -[PCPersistentInterfaceManager _isCellularCall:](self, "_isCellularCall:", objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA7130]));
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_isInCall != v8)
  {
    self->_isInCall = v8;
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isInCall)
        v10 = "in";
      else
        v10 = "not in";
      v19 = 136315138;
      v20 = (PCPersistentInterfaceManager *)v10;
      _os_log_impl(&dword_1CBC1B000, v9, OS_LOG_TYPE_DEFAULT, "Interface manager: call status is %s call", (uint8_t *)&v19, 0xCu);
    }

    inCallWWANOverrideTimer = self->_inCallWWANOverrideTimer;
    -[PCPersistentInterfaceManager _clearInCallWWANOverrideTimerLocked](self, "_clearInCallWWANOverrideTimerLocked");
    isInCall = self->_isInCall;
    if (self->_isInCall)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__inCallWWANOverrideTimerFired, 0, 0, 15.0);
      v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v14 = self->_inCallWWANOverrideTimer;
      self->_inCallWWANOverrideTimer = v13;

      +[PCLog interfaceManager](PCLog, "interfaceManager");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_inCallWWANOverrideTimer;
        v19 = 138543874;
        v20 = self;
        v21 = 2048;
        v22 = 0x402E000000000000;
        v23 = 2114;
        v24 = v16;
        _os_log_impl(&dword_1CBC1B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Interface manager: overriding WWAN interface while on call for %f seconds: %{public}@", (uint8_t *)&v19, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addTimer:forMode:", self->_inCallWWANOverrideTimer, *MEMORY[0x1E0C99860]);

      Main = CFRunLoopGetMain();
      CFRunLoopWakeUp(Main);
      isInCall = 1;
    }
    if (isInCall != (inCallWWANOverrideTimer != 0))
      -[PCPersistentInterfaceManager _updateWWANInterfaceUpStateLocked](self, "_updateWWANInterfaceUpStateLocked");
    -[PCPersistentInterfaceManager _updateWWANInterfaceAssertionsLocked](self, "_updateWWANInterfaceAssertionsLocked");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)_inCallWWANOverrideTimerFired
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[PCPersistentInterfaceManager _clearInCallWWANOverrideTimerLocked](self, "_clearInCallWWANOverrideTimerLocked");
  -[PCPersistentInterfaceManager _updateWWANInterfaceUpStateLocked](self, "_updateWWANInterfaceUpStateLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_clearInCallWWANOverrideTimerLocked
{
  NSObject *v3;
  NSTimer *inCallWWANOverrideTimer;
  NSTimer *v5;
  int v6;
  PCPersistentInterfaceManager *v7;
  __int16 v8;
  NSTimer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_inCallWWANOverrideTimer)
  {
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      inCallWWANOverrideTimer = self->_inCallWWANOverrideTimer;
      v6 = 138543618;
      v7 = self;
      v8 = 2114;
      v9 = inCallWWANOverrideTimer;
      _os_log_impl(&dword_1CBC1B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Interface manager: Clearing _inCallWWANOverrideTimer: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    -[NSTimer invalidate](self->_inCallWWANOverrideTimer, "invalidate");
    v5 = self->_inCallWWANOverrideTimer;
    self->_inCallWWANOverrideTimer = 0;

  }
}

- (id)_nonCellularMonitor
{
  return +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
}

- (void)_updateWWANInterfaceUpStateLocked
{
  _BOOL4 isWWANInterfaceUp;
  void *v4;
  int v5;
  char isWWANInterfaceDataActive;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  _BYTE v14[22];
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  isWWANInterfaceUp = self->_isWWANInterfaceUp;
  if (self->_inCallWWANOverrideTimer && self->_isInCall)
  {
    -[PCPersistentInterfaceManager _nonCellularMonitor](self, "_nonCellularMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInterfaceUsable");

  }
  else
  {
    v5 = 0;
  }
  isWWANInterfaceDataActive = self->_isWWANInterfaceDataActive;
  if (isWWANInterfaceDataActive)
  {
    isWWANInterfaceDataActive = v5 ^ 1;
    if (!self->_hasWWANStatusIndicator)
      isWWANInterfaceDataActive = 0;
  }
  self->_isWWANInterfaceUp = isWWANInterfaceDataActive;
  +[PCLog interfaceManager](PCLog, "interfaceManager");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (isWWANInterfaceUp)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    if (self->_isWWANInterfaceUp)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    *(_DWORD *)v14 = 138544386;
    if (-[PCPersistentInterfaceManager _wantsWWANInterfaceAssertion](self, "_wantsWWANInterfaceAssertion"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    *(_QWORD *)&v14[4] = self;
    if (v5)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    *(_WORD *)&v14[12] = 2114;
    *(_QWORD *)&v14[14] = v8;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1CBC1B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ _updateWWANInterfaceUpState wasUp %{public}@ isUp %{public}@ wantsInterfaceAssertion %{public}@ avoidWWANOnCall %{public}@", v14, 0x34u);
  }

  if (isWWANInterfaceUp != self->_isWWANInterfaceUp)
  {
    if (-[PCPersistentInterfaceManager _wantsWWANInterfaceAssertion](self, "_wantsWWANInterfaceAssertion")
      || isWWANInterfaceUp
      && !self->_hasWWANStatusIndicator
      && (+[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "isInternetReachable"), v12, v13))
    {
      -[PCPersistentInterfaceManager _scheduleCalloutsForSelector:](self, "_scheduleCalloutsForSelector:", sel_interfaceManagerWWANInterfaceStatusChanged_, *(_OWORD *)v14);
    }
    -[PCPersistentInterfaceManager _scheduleCalloutsForSelector:](self, "_scheduleCalloutsForSelector:", sel_interfaceManagerInternetReachabilityChanged_, *(_QWORD *)v14);
  }
  -[PCPersistentInterfaceManager _updateWWANInterfaceAssertionsLocked](self, "_updateWWANInterfaceAssertionsLocked", *(_QWORD *)v14);
}

- (void)_updateWWANInterfaceUpState
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[PCPersistentInterfaceManager _updateWWANInterfaceUpStateLocked](self, "_updateWWANInterfaceUpStateLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_updateCTIsWWANInHomeCountry:(BOOL)a3 isWWANInterfaceDataActive:(BOOL)a4
{
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = -[PCPersistentInterfaceManager _isWWANInHomeCountryLocked](self, "_isWWANInHomeCountryLocked");
  self->_ctIsWWANInHomeCountry = a3;
  self->_isWWANInterfaceDataActive = a4;
  v8 = -[PCPersistentInterfaceManager _isWWANInHomeCountryLocked](self, "_isWWANInHomeCountryLocked");
  if (v7 != v8)
  {
    v9 = v8;
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "false";
      if (v9)
        v11 = "true";
      v12 = 136315138;
      v13 = v11;
      _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "Interface manager: isWWANInHomeCountry status changed to %s", (uint8_t *)&v12, 0xCu);
    }

    -[PCPersistentInterfaceManager _scheduleCalloutsForSelector:](self, "_scheduleCalloutsForSelector:", sel_interfaceManagerInHomeCountryStatusChanged_);
  }
}

- (BOOL)_wwanIsPoorLinkQuality
{
  void *v2;
  char v3;

  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPoorLinkQuality");

  return v3;
}

- (BOOL)_wifiIsPoorLinkQuality
{
  void *v2;
  char v3;

  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPoorLinkQuality");

  return v3;
}

- (void)_scheduleCalloutsForSelector:(SEL)a3
{
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[6];
  id v15;
  SEL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_delegatesAndQueues;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_delegatesAndQueues, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "queue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "queue");
          v13 = objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __61__PCPersistentInterfaceManager__scheduleCalloutsForSelector___block_invoke;
          v14[3] = &unk_1E8743260;
          v14[4] = self;
          v14[5] = v10;
          v15 = v11;
          v16 = a3;
          dispatch_async(v13, v14);

        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

void __61__PCPersistentInterfaceManager__scheduleCalloutsForSelector___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "queue");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
  if (v3 == v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "performSelector:withObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));

}

- (BOOL)isWWANBetterThanWiFi
{
  int v3;
  void *v4;
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_isWWANInterfaceUp)
  {
    LOBYTE(v3) = 1;
    +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isInterfaceHistoricallyUsable") & 1) == 0)
    {
      +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "isInterfaceUsable") ^ 1;

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSString)WWANInterfaceName
{
  NSString *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_WWANInterfaceName;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)isWWANInterfaceSuspended
{
  BOOL isWWANInterfaceSuspended;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isWWANInterfaceSuspended = self->_isWWANInterfaceSuspended;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isWWANInterfaceSuspended;
}

- (BOOL)isWWANInterfaceInProlongedHighPowerState
{
  BOOL isWWANInterfaceInProlongedHighPowerState;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isWWANInterfaceInProlongedHighPowerState = self->_isWWANInterfaceInProlongedHighPowerState;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isWWANInterfaceInProlongedHighPowerState;
}

- (BOOL)isWWANInterfaceActivationPermitted
{
  BOOL isWWANInterfaceActivationPermitted;

  -[NSRecursiveLock lock](self->_lock, "lock");
  isWWANInterfaceActivationPermitted = self->_isWWANInterfaceActivationPermitted;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return isWWANInterfaceActivationPermitted;
}

- (BOOL)_isWWANInHomeCountryLocked
{
  return !self->_isWWANInterfaceDataActive || self->_ctIsWWANInHomeCountry;
}

- (BOOL)isWWANInHomeCountry
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = -[PCPersistentInterfaceManager _isWWANInHomeCountryLocked](self, "_isWWANInHomeCountryLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)isInternetReachableViaWiFi
{
  void *v3;
  char v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternetReachable");

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (BOOL)_isWiFiUsable
{
  void *v3;
  char v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInterfaceUsable");

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (BOOL)isWakeOnWiFiSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWoWSupported");

  return v3;
}

- (BOOL)areAllNetworkInterfacesDisabled
{
  char v3;
  const __SCPreferences *v4;
  const __SCPreferences *v5;
  BOOL v6;
  void *v7;
  char v8;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[PCPersistentInterfaceManager _isInternetReachableLocked](self, "_isInternetReachableLocked"))
    goto LABEL_2;
  v4 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.persistentconnection"), CFSTR("com.apple.radios.plist"), 0);
  if (v4)
  {
    v5 = v4;
    v6 = SCPreferencesGetValue(v4, CFSTR("AirplaneMode")) == (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D13240], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isWiFiEnabled");

  if (!v6 && self->_WWANInterfaceName && self->_isWWANInterfaceActivationPermitted)
LABEL_2:
    v3 = 0;
  else
    v3 = v8 ^ 1;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)cutWiFiManagerDeviceAttached:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PCLog interfaceManager](PCLog, "interfaceManager");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "cutWiFiManagerDeviceAttached called: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[PCPersistentInterfaceManager _adjustWakeOnWiFi](self, "_adjustWakeOnWiFi");
}

- (BOOL)_wantsWWANInterfaceAssertion
{
  void *v2;
  int v3;

  if (self->_isWWANInterfaceActivationPermitted)
  {
    if (self->_isInCall)
    {
      +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "isInterfaceUsable") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_updateWWANInterfaceAssertions
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[PCPersistentInterfaceManager _updateWWANInterfaceAssertionsLocked](self, "_updateWWANInterfaceAssertionsLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_updateWWANInterfaceAssertionsLocked
{
  _BOOL4 v3;
  void *interfaceAssertion;
  NSObject *v5;
  id v6;
  CoreTelephonyClient *ctClient;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  v3 = -[PCPersistentInterfaceManager _wantsWWANInterfaceAssertion](self, "_wantsWWANInterfaceAssertion");
  interfaceAssertion = self->_interfaceAssertion;
  if (v3)
  {
    if (!interfaceAssertion && self->_ctClient)
    {
      +[PCLog interfaceManager](PCLog, "interfaceManager");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1CBC1B000, v5, OS_LOG_TYPE_DEFAULT, "Interface manager: asserting packet context active", (uint8_t *)buf, 2u);
      }

      v6 = (id)-[CoreTelephonyClient setPacketContextActiveByServiceType:connectionType:active:](self->_ctClient, "setPacketContextActiveByServiceType:connectionType:active:", self->_currentDataSimContext, 0, 1);
      objc_initWeak(buf, self);
      ctClient = self->_ctClient;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __68__PCPersistentInterfaceManager__updateWWANInterfaceAssertionsLocked__block_invoke;
      v9[3] = &unk_1E8743288;
      objc_copyWeak(&v10, buf);
      self->_interfaceAssertion = (void *)-[CoreTelephonyClient createAssertionForConnectionType:allocator:error:onReAssertError:](ctClient, "createAssertionForConnectionType:allocator:error:onReAssertError:", 0, 0, 0, v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
  }
  else if (interfaceAssertion)
  {
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, "Interface manager: clearing packet context assertion", (uint8_t *)buf, 2u);
    }

    CFRelease(self->_interfaceAssertion);
    self->_interfaceAssertion = 0;
  }
}

void __68__PCPersistentInterfaceManager__updateWWANInterfaceAssertionsLocked__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && WeakRetained[7])
  {
    +[PCLog interfaceManager](PCLog, "interfaceManager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1CBC1B000, v6, OS_LOG_TYPE_DEFAULT, "Interface manager: reAssert failed, dropping assertion {reAssertError: %@}", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v5[1], "lock");
    v7 = v5[7];
    if (v7)
    {
      CFRelease(v7);
      v5[7] = 0;
    }
    objc_msgSend(v5[1], "unlock");
  }

}

- (void)_adjustWiFiAutoAssociation
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[PCPersistentInterfaceManager _adjustWiFiAutoAssociationLocked](self, "_adjustWiFiAutoAssociationLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_adjustWakeOnWiFi
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[PCPersistentInterfaceManager _adjustWakeOnWiFiLocked](self, "_adjustWakeOnWiFiLocked");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)allowBindingToWWAN
{
  _BOOL4 v3;

  v3 = -[PCPersistentInterfaceManager doesWWANInterfaceExist](self, "doesWWANInterfaceExist");
  if (v3)
  {
    v3 = -[PCPersistentInterfaceManager isWWANInterfaceActivationPermitted](self, "isWWANInterfaceActivationPermitted");
    if (v3)
    {
      if (-[PCPersistentInterfaceManager isInCall](self, "isInCall"))
        LOBYTE(v3) = !-[PCPersistentInterfaceManager _isWiFiUsable](self, "_isWiFiUsable");
      else
        LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)hasWWANStatusIndicator
{
  return self->_hasWWANStatusIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSimContext, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_inCallWWANOverrideTimer, 0);
  objc_storeStrong((id *)&self->_WWANInterfaceName, 0);
  objc_storeStrong((id *)&self->_wakeOnWiFiDisableTimer, 0);
  objc_storeStrong((id *)&self->_WiFiAutoAssociationDisableTimer, 0);
  objc_storeStrong((id *)&self->_delegatesAndQueues, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
