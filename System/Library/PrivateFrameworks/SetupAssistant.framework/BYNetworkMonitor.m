@implementation BYNetworkMonitor

- (BYNetworkMonitor)init
{
  BYNetworkMonitor *v2;
  uint64_t v3;
  NSMutableDictionary *networkTypeBlocks;
  dispatch_queue_t v5;
  OS_dispatch_queue *networkTypeQueue;
  uint64_t v7;
  NSHashTable *observers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BYNetworkMonitor;
  v2 = -[BYNetworkMonitor init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    networkTypeBlocks = v2->_networkTypeBlocks;
    v2->_networkTypeBlocks = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("by-network-monitor network type", 0);
    networkTypeQueue = v2->_networkTypeQueue;
    v2->_networkTypeQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v2->_currentNetworkType = 0;
  }
  return v2;
}

- (void)dealloc
{
  __SCNetworkReachability *reachability;
  __SCNetworkReachability *v4;
  __CFRunLoop *Main;
  objc_super v6;

  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetCallback(reachability, 0, 0);
    v4 = self->_reachability;
    Main = CFRunLoopGetMain();
    SCNetworkReachabilityUnscheduleFromRunLoop(v4, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);
    CFRelease(self->_reachability);
  }
  v6.receiver = self;
  v6.super_class = (Class)BYNetworkMonitor;
  -[BYNetworkMonitor dealloc](&v6, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_singletonPredicate != -1)
    dispatch_once(&sharedInstance_singletonPredicate, &__block_literal_global_21);
  return (id)sharedInstance___instance;
}

void __34__BYNetworkMonitor_sharedInstance__block_invoke()
{
  BYNetworkMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(BYNetworkMonitor);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (int)currentNetworkType
{
  -[BYNetworkMonitor _initNetworkObservation](self, "_initNetworkObservation");
  return self->_currentNetworkType;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    -[NSHashTable addObject:](self->_observers, "addObject:");
    -[BYNetworkMonitor _initNetworkObservation](self, "_initNetworkObservation");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)withMinimumNetworkType:(int)a3 timeout:(double)a4 runBlock:(id)a5
{
  void (**v8)(id, _QWORD);
  void (**v9)(id, _QWORD);
  uint64_t v10;
  NSObject *networkTypeQueue;
  _QWORD v12[5];
  id v13;
  double v14;
  int v15;
  _QWORD v16[5];
  id v17;

  v8 = (void (**)(id, _QWORD))a5;
  if (v8)
  {
    v9 = v8;
    if (-[BYNetworkMonitor currentNetworkType](self, "currentNetworkType") >= a3)
    {
      v9[2](v9, 0);
    }
    else
    {
      v10 = MEMORY[0x1E0C809B0];
      if (a3 == 1)
      {
        objc_msgSend((id)objc_opt_class(), "setHoldsWiFiAssertion:", 1);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke;
        v16[3] = &unk_1E4E27F90;
        v16[4] = self;
        v17 = v9;
        v9 = (void (**)(id, _QWORD))MEMORY[0x1A85AAF94](v16);

      }
      networkTypeQueue = self->_networkTypeQueue;
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_2;
      v12[3] = &unk_1E4E27FE0;
      v15 = a3;
      v12[4] = self;
      v13 = v9;
      v14 = a4;
      v9 = v9;
      dispatch_async(networkTypeQueue, v12);

    }
  }
}

uint64_t __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "setHoldsWiFiAssertion:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  int v17;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

  v10 = (void *)MEMORY[0x1A85AAF94](*(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "addObject:", v10);

  v11 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_3;
  block[3] = &unk_1E4E27FB8;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v14 = *(NSObject **)(v12 + 40);
  block[1] = 3221225472;
  block[4] = v12;
  v17 = *(_DWORD *)(a1 + 56);
  v16 = v13;
  dispatch_after(v11, v14, block);

}

void __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1A85AAF94](*(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1A85AAF94](*(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "removeObject:", v7);

    dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_4;
    block[3] = &unk_1E4E26FC0;
    v10 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
}

uint64_t __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setCurrentNetworkType:(int)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t currentNetworkType;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *networkTypeQueue;
  _QWORD v16[5];
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_currentNetworkType != a3)
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("Wifi");
      if (!a3)
        v6 = CFSTR("None");
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      v7 = v6;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Network type changed to: %{public}@", buf, 0xCu);

    }
    currentNetworkType = self->_currentNetworkType;
    self->_currentNetworkType = a3;
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "networkChangedFromNetworkType:toNetworkType:", currentNetworkType, self->_currentNetworkType);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
    networkTypeQueue = self->_networkTypeQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__BYNetworkMonitor_setCurrentNetworkType___block_invoke;
    v16[3] = &unk_1E4E28008;
    v17 = a3;
    v16[4] = self;
    dispatch_async(networkTypeQueue, v16);

  }
}

void __42__BYNetworkMonitor_setCurrentNetworkType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD block[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned int *)(a1 + 40);
  if ((v1 & 0x80000000) == 0)
  {
    v2 = a1;
    v3 = MEMORY[0x1E0C809B0];
    v17 = a1;
    do
    {
      v4 = *(void **)(*(_QWORD *)(v2 + 32) + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1, v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
            dispatch_get_global_queue(0, 0);
            v13 = objc_claimAutoreleasedReturnValue();
            block[0] = v3;
            block[1] = 3221225472;
            block[2] = __42__BYNetworkMonitor_setCurrentNetworkType___block_invoke_2;
            block[3] = &unk_1E4E26FC0;
            block[4] = v12;
            dispatch_async(v13, block);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v9);
      }

      v2 = v17;
      v14 = *(void **)(*(_QWORD *)(v17 + 32) + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v15);

      v16 = (int)v1 <= 0;
      v1 = (v1 - 1);
    }
    while (!v16);
  }
}

uint64_t __42__BYNetworkMonitor_setCurrentNetworkType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_initNetworkObservation
{
  void *v3;
  __SCNetworkReachability *v4;
  __SCNetworkReachability *reachability;
  __CFRunLoop *Main;
  SCNetworkReachabilityContext v7;
  SCNetworkReachabilityFlags flags;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!self->_reachability)
  {
    v9[0] = CFSTR("nodename");
    v9[1] = CFSTR("ResolverBypass");
    v10[0] = CFSTR("www.apple.com");
    v10[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (__SCNetworkReachability *)SCNetworkReachabilityCreateWithOptions();
    self->_reachability = v4;
    flags = 0;
    SCNetworkReachabilityGetFlags(v4, &flags);
    -[BYNetworkMonitor setCurrentNetworkType:](self, "setCurrentNetworkType:", -[BYNetworkMonitor _networkTypeFromFlags:](self, "_networkTypeFromFlags:", flags));
    v7.version = 0;
    memset(&v7.retain, 0, 24);
    v7.info = self;
    SCNetworkReachabilitySetCallback(self->_reachability, (SCNetworkReachabilityCallBack)_networkReachabilityCallback, &v7);
    reachability = self->_reachability;
    Main = CFRunLoopGetMain();
    SCNetworkReachabilityScheduleWithRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);

  }
}

- (int)_networkTypeFromFlags:(unsigned int)a3
{
  return (a3 >> 1) & ~(a3 >> 18) & 1;
}

+ (BOOL)holdsWiFiAssertion
{
  return __assertionCount != 0;
}

+ (void)setHoldsWiFiAssertion:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  if (!MGGetBoolAnswer())
    return;
  if (a3)
  {
    v4 = 1;
  }
  else
  {
    if (!__assertionCount)
      goto LABEL_7;
    v4 = -1;
  }
  __assertionCount += v4;
LABEL_7:
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[BYNetworkMonitor setHoldsWiFiAssertion:].cold.4(v5);

  v6 = __assertionCount != 0;
  v7 = __wifiManager;
  if (!__wifiManager)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v13 = getWiFiManagerClientCreateSymbolLoc_ptr;
    v19 = getWiFiManagerClientCreateSymbolLoc_ptr;
    if (!getWiFiManagerClientCreateSymbolLoc_ptr)
    {
      v14 = (void *)MobileWiFiLibrary();
      v13 = dlsym(v14, "WiFiManagerClientCreate");
      v17[3] = (uint64_t)v13;
      getWiFiManagerClientCreateSymbolLoc_ptr = v13;
    }
    _Block_object_dispose(&v16, 8);
    if (v13)
    {
      __wifiManager = ((uint64_t (*)(_QWORD, _BOOL8))v13)(*MEMORY[0x1E0C9AE00], v6);
      return;
    }
LABEL_24:
    +[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
    goto LABEL_25;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v8 = getWiFiManagerClientGetTypeSymbolLoc_ptr;
  v19 = getWiFiManagerClientGetTypeSymbolLoc_ptr;
  if (!getWiFiManagerClientGetTypeSymbolLoc_ptr)
  {
    v9 = (void *)MobileWiFiLibrary();
    v8 = dlsym(v9, "WiFiManagerClientGetType");
    v17[3] = (uint64_t)v8;
    getWiFiManagerClientGetTypeSymbolLoc_ptr = v8;
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
  {
    +[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
    goto LABEL_24;
  }
  if (((unsigned int (*)(uint64_t))v8)(v7) != v6)
  {
    v10 = __wifiManager;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v11 = getWiFiManagerClientSetTypeSymbolLoc_ptr;
    v19 = getWiFiManagerClientSetTypeSymbolLoc_ptr;
    if (!getWiFiManagerClientSetTypeSymbolLoc_ptr)
    {
      v12 = (void *)MobileWiFiLibrary();
      v11 = dlsym(v12, "WiFiManagerClientSetType");
      v17[3] = (uint64_t)v11;
      getWiFiManagerClientSetTypeSymbolLoc_ptr = v11;
    }
    _Block_object_dispose(&v16, 8);
    if (v11)
    {
      ((void (*)(uint64_t, _BOOL8))v11)(v10, v6);
      return;
    }
LABEL_25:
    v15 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTypeQueue, 0);
  objc_storeStrong((id *)&self->_networkTypeBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)setHoldsWiFiAssertion:(os_log_t)log .cold.4(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = __assertionCount;
  _os_log_debug_impl(&dword_1A4E92000, log, OS_LOG_TYPE_DEBUG, "WiFi background assertion count changed: %lu", (uint8_t *)&v1, 0xCu);
}

@end
