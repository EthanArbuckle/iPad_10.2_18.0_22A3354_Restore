@implementation ISNetworkObserver

uint64_t __32__ISNetworkObserver_networkType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

id __35__ISNetworkObserver_sharedInstance__block_invoke()
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  sharedInstance_sObserver = (uint64_t)result;
  return result;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ISNetworkObserver_sharedInstance__block_invoke;
  block[3] = &unk_24C43C670;
  block[4] = a1;
  if (sharedInstance_sOnce != -1)
    dispatch_once(&sharedInstance_sOnce, block);
  return (id)sharedInstance_sObserver;
}

- (NSString)connectionTypeHeader
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  -[ISNetworkObserver networkType](self, "networkType");
  v4 = SSGetStringForNetworkType();
  if (v4)
  {
    objc_msgSend(v3, "appendString:", v4);
    if (SSNetworkTypeIsCellularType())
    {
      v5 = -[ISNetworkObserver operatorName](self, "operatorName");
      if (-[NSString length](v5, "length"))
        objc_msgSend(v3, "appendFormat:", CFSTR("/%@"), v5);
    }
  }
  return (NSString *)v3;
}

- (int64_t)networkType
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__ISNetworkObserver_networkType__block_invoke;
  v5[3] = &unk_24C43C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (ISNetworkObserver)init
{
  id v3;
  uint64_t v4;
  const __SCNetworkReachability *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  SCNetworkReachabilityContext context;
  uint64_t v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  objc_super v16;
  sockaddr address;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  __ISRecordSPIClassUsage(self);
  v16.receiver = self;
  v16.super_class = (Class)ISNetworkObserver;
  v3 = -[ISNetworkObserver init](&v16, sel_init);
  if (v3)
  {
    *((_QWORD *)v3 + 2) = dispatch_queue_create("com.apple.itunesstore.ISNetworkObserver", 0);
    *((_QWORD *)v3 + 8) = dispatch_queue_create("com.apple.itunesstore.ISNetworkObserver.notifications", 0);
    *((_BYTE *)v3 + 24) = 1;
    *((CFAbsoluteTime *)v3 + 4) = CFAbsoluteTimeGetCurrent();
    v12 = 0;
    v14 = 0u;
    v15 = 0;
    v13 = v3;
    v4 = _CTServerConnectionCreate();
    *((_QWORD *)v3 + 11) = v4;
    if (v4)
    {
      _CTServerConnectionSetTargetQueue();
      _CTServerConnectionRegisterForNotification();
    }
    address = (sockaddr)xmmword_20B7B94E0;
    v5 = SCNetworkReachabilityCreateWithAddress(0, &address);
    *((_QWORD *)v3 + 10) = v5;
    if (v5)
    {
      context.version = 0;
      context.info = v3;
      context.retain = 0;
      context.release = 0;
      context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x24BDBBC58];
      SCNetworkReachabilitySetCallback(v5, (SCNetworkReachabilityCallBack)__ReachabilityCallback, &context);
      SCNetworkReachabilitySetDispatchQueue(*((SCNetworkReachabilityRef *)v3 + 10), *((dispatch_queue_t *)v3 + 2));
    }
    v6 = objc_msgSend(v3, "_currentNetworkReachabilityFlags");
    *((_DWORD *)v3 + 10) = v6;
    *((_QWORD *)v3 + 7) = objc_msgSend(v3, "_networkTypeForReachabilityFlags:", v6);
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__applicationForegroundNotification_, CFSTR("UIApplicationDidEnterForegroundNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__applicationForegroundNotification_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    v8 = objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__telephonyOperatorNameDidChangeNotification_, *MEMORY[0x24BEB2B88], v8);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__telephonyRegistrationDidChangeNotification_, *MEMORY[0x24BEB2B98], v8);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__CarrierChangeNotification, (CFStringRef)*MEMORY[0x24BDC29F8], 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__CarrierChangeNotification, (CFStringRef)*MEMORY[0x24BDC2A00], 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__AutoDownloadsSettingsChangedNotification, (CFStringRef)*MEMORY[0x24BEB2C68], 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__NetworkTypeOverrideChangedNotification, (CFStringRef)*MEMORY[0x24BEB2C78], 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return (ISNetworkObserver *)v3;
}

- (int64_t)_networkTypeForReachabilityFlags:(unsigned int)a3
{
  int64_t v3;
  void *v6;
  uint64_t v7;

  if ((a3 & 2) != 0)
  {
    v6 = (void *)CFPreferencesCopyAppValue(CFSTR("SSNetworkTypeOverride"), (CFStringRef)*MEMORY[0x24BEB2C88]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "integerValue");
    }
    else
    {
      if ((a3 & 0x40000) == 0)
      {
        v3 = 1000;
LABEL_9:

        return v3;
      }
      v7 = -[ISNetworkObserver _networkTypeFromDataIndicator:](self, "_networkTypeFromDataIndicator:", -[ISNetworkObserver _dataStatusIndicator](self, "_dataStatusIndicator"));
    }
    v3 = v7;
    goto LABEL_9;
  }
  return 0;
}

- (unsigned)_currentNetworkReachabilityFlags
{
  __SCNetworkReachability *reachability;
  SCNetworkReachabilityFlags flags;

  flags = 0;
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilityGetFlags(reachability, &flags);
    LODWORD(reachability) = flags;
  }
  return reachability;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *dispatchQueue;
  NSObject *notificationQueue;
  __SCNetworkReachability *reachability;
  objc_super v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
  v4 = objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB2B88], v4);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB2B98], v4);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BDC29F8], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BDC2A00], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB2C68], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB2C78], 0);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
    dispatch_release(notificationQueue);
  -[NSMutableSet makeObjectsPerformSelector:withObject:](self->_observedDownloadQueues, "makeObjectsPerformSelector:withObject:", sel_removeObserver_, self);

  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetDispatchQueue(reachability, 0);
    CFRelease(self->_reachability);
    self->_reachability = 0;
  }
  if (self->_telephonyServer)
  {
    _CTServerConnectionUnregisterForNotification();
    CFRelease(self->_telephonyServer);
    self->_telephonyServer = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)ISNetworkObserver;
  -[ISNetworkObserver dealloc](&v9, sel_dealloc);
}

- (void)beginObservingDownloadQueue:(id)a3
{
  NSObject *dispatchQueue;
  int v5;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__ISNetworkObserver_beginObservingDownloadQueue___block_invoke;
  v6[3] = &unk_24C43C698;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(dispatchQueue, v6);
  v5 = *((unsigned __int8 *)v8 + 24);
  if (*((unsigned __int8 *)v12 + 24) != v5)
    -[ISNetworkObserver _postUsageChangedToValue:](self, "_postUsageChangedToValue:", v5 != 0);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

uint64_t __49__ISNetworkObserver_beginObservingDownloadQueue___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[9])
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "_ntsIsUsingNetwork");
  objc_msgSend(*(id *)(a1 + 40), "addObserver:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "_ntsIsUsingNetwork");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)beginUsingNetwork
{
  NSObject *dispatchQueue;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__ISNetworkObserver_beginUsingNetwork__block_invoke;
  v5[3] = &unk_24C43C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  if (*((_BYTE *)v7 + 24))
    -[ISNetworkObserver _postUsageChangedToValue:](self, "_postUsageChangedToValue:", 1);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x24BEB2B30], 0);
  _Block_object_dispose(&v6, 8);
}

uint64_t __38__ISNetworkObserver_beginUsingNetwork__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = (*(_QWORD *)(*(_QWORD *)(result + 32) + 48))++ == 0;
  return result;
}

- (id)copyValueForCarrierBundleKey:(id)a3
{
  NSObject *v4;
  id v5;
  dispatch_time_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__ISNetworkObserver_copyValueForCarrierBundleKey___block_invoke;
  v17[3] = &unk_24C43C710;
  v17[4] = v5;
  v17[5] = a3;
  v17[6] = v4;
  v17[7] = &v18;
  objc_msgSend(v5, "getSubscriptionInfo:", v17);
  v6 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v4, v6))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v7)
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    v9 = objc_msgSend(v7, "shouldLogToDisk");
    v10 = objc_msgSend(v7, "OSLogObject");
    if (v9)
      v8 |= 2u;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      v11 = objc_opt_class();
      v24 = 138543618;
      v25 = v11;
      v26 = 2112;
      v27 = a3;
      LODWORD(v16) = 22;
      v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v24, v16);
        free(v13);
        SSFileLog();
      }
    }
  }
  dispatch_release(v4);
  v14 = (void *)objc_msgSend((id)v19[5], "copy");
  _Block_object_dispose(&v18, 8);
  return v14;
}

intptr_t __50__ISNetworkObserver_copyValueForCarrierBundleKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_msgSend(a2, "subscriptions");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
        if (objc_msgSend(v8, "slotID") == 1)
        {
          v10 = *(void **)(a1 + 32);
          v11 = *(_QWORD *)(a1 + 40);
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = __50__ISNetworkObserver_copyValueForCarrierBundleKey___block_invoke_2;
          v13[3] = &unk_24C43C6E8;
          v14 = *(_OWORD *)(a1 + 48);
          objc_msgSend(v10, "copyCarrierBundleValue:key:bundleType:completion:", v8, v11, v9, v13);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __50__ISNetworkObserver_copyValueForCarrierBundleKey___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)endObservingDownloadQueue:(id)a3
{
  NSObject *dispatchQueue;
  int v5;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__ISNetworkObserver_endObservingDownloadQueue___block_invoke;
  v6[3] = &unk_24C43C738;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(dispatchQueue, v6);
  v5 = *((unsigned __int8 *)v8 + 24);
  if (*((unsigned __int8 *)v12 + 24) != v5)
    -[ISNetworkObserver _postUsageChangedToValue:](self, "_postUsageChangedToValue:", v5 != 0);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

uint64_t __47__ISNetworkObserver_endObservingDownloadQueue___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_ntsIsUsingNetwork");
  objc_msgSend(*(id *)(a1 + 40), "removeObserver:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "_ntsIsUsingNetwork");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)endUsingNetwork
{
  NSObject *dispatchQueue;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__ISNetworkObserver_endUsingNetwork__block_invoke;
  v5[3] = &unk_24C43BF00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  if (*((_BYTE *)v7 + 24))
    -[ISNetworkObserver _postUsageChangedToValue:](self, "_postUsageChangedToValue:", 0);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x24BEB2B38], 0);
  _Block_object_dispose(&v6, 8);
}

uint64_t __36__ISNetworkObserver_endUsingNetwork__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  if (v1 >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1 == 1;
    --*(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  }
  return result;
}

- (BOOL)isUsingNetwork
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__ISNetworkObserver_isUsingNetwork__block_invoke;
  v5[3] = &unk_24C43C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__ISNetworkObserver_isUsingNetwork__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_ntsIsUsingNetwork");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)lastNetworkTypeChangeTime
{
  NSObject *dispatchQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  unint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0xFFEFFFFFFFFFFFFFLL;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__ISNetworkObserver_lastNetworkTypeChangeTime__block_invoke;
  v5[3] = &unk_24C43C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __46__ISNetworkObserver_lastNetworkTypeChangeTime__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 32);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)networkReachabilityFlags
{
  NSObject *dispatchQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__ISNetworkObserver_networkReachabilityFlags__block_invoke;
  v5[3] = &unk_24C43C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__ISNetworkObserver_networkReachabilityFlags__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (BOOL)shouldShowCellularAutomaticDownloadsSwitch
{
  id v2;
  char v3;

  v2 = -[ISNetworkObserver copyValueForCarrierBundleKey:](self, "copyValueForCarrierBundleKey:", CFSTR("ShowiTunesStoreAutoDownloadOverCellularSwitch"));
  if (v2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = objc_msgSend(v2, "BOOLValue");
    else
      v3 = 0;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

+ (BOOL)isLikelyToReachRemoteServerWithReachabilityFlags:(unsigned int)a3
{
  return (a3 & 6) == 2;
}

- (NSString)dataStatusIndicator
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__ISNetworkObserver_dataStatusIndicator__block_invoke;
  v5[3] = &unk_24C43C6C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __40__ISNetworkObserver_dataStatusIndicator__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_dataStatusIndicator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isWiFiEnabled
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver"), "isWiFiEnabled");
}

- (NSString)mobileSubscriberCountryCode
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB2090], "sharedController"), "mobileSubscriberCountryCode");
}

- (NSString)mobileSubscriberNetworkCode
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB2090], "sharedController"), "mobileSubscriberNetworkCode");
}

- (NSString)modemRegistrationStatus
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB2090], "sharedController"), "registrationStatus");
}

- (NSString)operatorName
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB2090], "sharedController"), "operatorName");
}

- (NSString)providerName
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB2090], "sharedController"), "providerName");
}

- (NSString)phoneNumber
{
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB2090], "sharedController"), "phoneNumber");
}

- (void)reloadNetworkType
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ISNetworkObserver_reloadNetworkType__block_invoke;
  block[3] = &unk_24C43C670;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __38__ISNetworkObserver_reloadNetworkType__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadNetworkType");
}

- (void)setNetworkType:(int64_t)a3
{
  NSObject *dispatchQueue;
  uint64_t v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__ISNetworkObserver_setNetworkType___block_invoke;
  block[3] = &unk_24C43C760;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  v6 = v9[3];
  if (v6 != a3)
    -[ISNetworkObserver _postTypeChangedNotificationFromValue:toValue:](self, "_postTypeChangedNotificationFromValue:toValue:", v6, a3);
  _Block_object_dispose(&v8, 8);
}

uint64_t __36__ISNetworkObserver_setNetworkType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setNetworkType:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)downloadQueueNetworkUsageChanged:(id)a3
{
  _BOOL8 v5;

  v5 = -[ISNetworkObserver isUsingNetwork](self, "isUsingNetwork");
  if (v5 == objc_msgSend(a3, "isUsingNetwork"))
    -[ISNetworkObserver _postUsageChangedToValue:](self, "_postUsageChangedToValue:", v5);
}

- (void)_applicationForegroundNotification:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ISNetworkObserver__applicationForegroundNotification___block_invoke;
  block[3] = &unk_24C43C670;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __56__ISNetworkObserver__applicationForegroundNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadDataStatusIndicator");
  return objc_msgSend(*(id *)(a1 + 32), "_reloadNetworkType");
}

- (void)_telephonyOperatorNameDidChangeNotification:(id)a3
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ISNetworkObserver__telephonyOperatorNameDidChangeNotification___block_invoke;
  block[3] = &unk_24C43C670;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __65__ISNetworkObserver__telephonyOperatorNameDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("ISNetworkObserverOperatorNameChangedNotification"), *(_QWORD *)(a1 + 32));
}

- (void)_telephonyRegistrationDidChangeNotification:(id)a3
{
  NSObject *notificationQueue;
  _QWORD block[5];

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ISNetworkObserver__telephonyRegistrationDidChangeNotification___block_invoke;
  block[3] = &unk_24C43C670;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __65__ISNetworkObserver__telephonyRegistrationDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("ISNetworkObserverModemRegistrationChanged"), *(_QWORD *)(a1 + 32));
}

- (void)_handleTelephonyNotificationWithName:(__CFString *)a3 userInfo:(__CFDictionary *)a4
{
  if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x24BDC2B88], 0) == kCFCompareEqualTo)
  {

    self->_dataStatusIndicator = (NSString *)(id)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x24BDC2B20]);
    -[ISNetworkObserver _reloadNetworkType](self, "_reloadNetworkType");
  }
}

- (void)_copyConnectionDataStatus:(id)a3
{
  _CTServerConnectionCopyDataStatus();
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (id)_dataStatusIndicator
{
  id result;
  _QWORD v4[5];

  result = self->_dataStatusIndicator;
  if (!result)
  {
    if (self->_telephonyServer)
    {
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __41__ISNetworkObserver__dataStatusIndicator__block_invoke;
      v4[3] = &unk_24C43C788;
      v4[4] = self;
      -[ISNetworkObserver _copyConnectionDataStatus:](self, "_copyConnectionDataStatus:", v4);
      return self->_dataStatusIndicator;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __41__ISNetworkObserver__dataStatusIndicator__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = a2;
  return result;
}

- (int64_t)_networkTypeFromDataIndicator:(id)a3
{
  uint64_t v4;
  _QWORD v6[25];

  v4 = 0;
  v6[24] = *MEMORY[0x24BDAC8D0];
  v6[0] = *MEMORY[0x24BDC2B28];
  v6[1] = 1;
  v6[2] = *MEMORY[0x24BDC2B30];
  v6[3] = 1;
  v6[4] = *MEMORY[0x24BDC2B38];
  v6[5] = 2;
  v6[6] = *MEMORY[0x24BDC2B40];
  v6[7] = 2;
  v6[8] = *MEMORY[0x24BDC2B48];
  v6[9] = 2;
  v6[10] = *MEMORY[0x24BDC2B80];
  v6[11] = 3;
  v6[12] = *MEMORY[0x24BDC2B50];
  v6[13] = 3;
  v6[14] = *MEMORY[0x24BDC2B58];
  v6[15] = 4;
  v6[16] = *MEMORY[0x24BDC2B60];
  v6[17] = 5;
  v6[18] = *MEMORY[0x24BDC2B68];
  v6[19] = 6;
  v6[20] = *MEMORY[0x24BDC2B70];
  v6[21] = 7;
  v6[22] = *MEMORY[0x24BDC2B78];
  v6[23] = 8;
  while (!objc_msgSend(a3, "isEqualToString:", v6[v4]))
  {
    v4 += 2;
    if (v4 == 24)
      return 0;
  }
  return v6[v4 + 1];
}

- (BOOL)_ntsIsUsingNetwork
{
  char v2;
  NSMutableSet *observedDownloadQueues;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = self->_networkUsageCount > 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  observedDownloadQueues = self->_observedDownloadQueues;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](observedDownloadQueues, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(observedDownloadQueues);
        if ((v2 & 1) != 0)
          v2 = 1;
        else
          v2 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isUsingNetwork");
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](observedDownloadQueues, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return v2;
}

- (void)_postReachabilityFlagsChangedNotificationFromValue:(unsigned int)a3 toValue:(unsigned int)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = objc_alloc(MEMORY[0x24BDBCE70]);
  v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = *MEMORY[0x24BDD0E80];
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v11 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x24BDD0E70], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("ISNetworkReachabilityFlagsChangedNotification"), self, v11);

}

- (void)_postTypeChangedNotificationFromValue:(int64_t)a3 toValue:(int64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = objc_alloc(MEMORY[0x24BDBCE70]);
  v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = *MEMORY[0x24BDD0E80];
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v11 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x24BDD0E70], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("ISNetworkTypeChangedNotification"), self, v11);

}

- (void)_postUsageChangedToValue:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCE70]);
  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (id)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, *MEMORY[0x24BDD0E70], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("ISNetworkUsageStateChangedNotification"), self, v7);

}

- (void)_reloadCellularRestriction
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ISNetworkObserver__reloadCellularRestriction__block_invoke;
  block[3] = &unk_24C43C670;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __47__ISNetworkObserver__reloadCellularRestriction__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ISNetworkObserver__reloadCellularRestriction__block_invoke_2;
  block[3] = &unk_24C43C670;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __47__ISNetworkObserver__reloadCellularRestriction__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("ISNetworkObserverCellularRestrictionChangedNotification"), *(_QWORD *)(a1 + 32));
}

- (void)_reloadDataStatusIndicator
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47__ISNetworkObserver__reloadDataStatusIndicator__block_invoke;
  v2[3] = &unk_24C43C788;
  v2[4] = self;
  -[ISNetworkObserver _copyConnectionDataStatus:](self, "_copyConnectionDataStatus:", v2);
}

void __47__ISNetworkObserver__reloadDataStatusIndicator__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = a2;
  }
}

- (void)_reloadNetworkType
{
  -[ISNetworkObserver _reloadNetworkTypeWithReachabilityFlags:](self, "_reloadNetworkTypeWithReachabilityFlags:", -[ISNetworkObserver _currentNetworkReachabilityFlags](self, "_currentNetworkReachabilityFlags"));
}

- (void)_reloadNetworkTypeWithReachabilityFlags:(unsigned int)a3
{
  int64_t v5;
  int64_t v6;
  unsigned int networkReachabilityFlags;
  NSObject *notificationQueue;
  _QWORD block[7];
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  BOOL v14;

  v5 = -[ISNetworkObserver _networkTypeForReachabilityFlags:](self, "_networkTypeForReachabilityFlags:");
  v6 = -[ISNetworkObserver _setNetworkType:](self, "_setNetworkType:", v5);
  networkReachabilityFlags = self->_networkReachabilityFlags;
  self->_networkReachabilityFlags = a3;
  if (v6 != v5 || networkReachabilityFlags != a3)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__ISNetworkObserver__reloadNetworkTypeWithReachabilityFlags___block_invoke;
    block[3] = &unk_24C43C7B0;
    v13 = v6 != v5;
    block[4] = self;
    block[5] = v6;
    block[6] = v5;
    v14 = networkReachabilityFlags != a3;
    v11 = networkReachabilityFlags;
    v12 = a3;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __61__ISNetworkObserver__reloadNetworkTypeWithReachabilityFlags___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 64))
    result = objc_msgSend(*(id *)(result + 32), "_postTypeChangedNotificationFromValue:toValue:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
  if (*(_BYTE *)(v1 + 65))
    return objc_msgSend(*(id *)(v1 + 32), "_postReachabilityFlagsChangedNotificationFromValue:toValue:", *(unsigned int *)(v1 + 56), *(unsigned int *)(v1 + 60));
  return result;
}

- (int64_t)_setNetworkType:(int64_t)a3
{
  int64_t networkType;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  networkType = self->_networkType;
  if (networkType != a3)
  {
    self->_networkType = a3;
    self->_lastNetworkTypeChangeTime = CFAbsoluteTimeGetCurrent();
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v4)
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v6 &= 2u;
    if (v6)
    {
      v11 = 138412546;
      v12 = objc_opt_class();
      v13 = 2112;
      v14 = SSGetStringForNetworkType();
      LODWORD(v10) = 22;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v11, v10);
        free(v8);
        SSFileLog();
      }
    }
  }
  return networkType;
}

@end
