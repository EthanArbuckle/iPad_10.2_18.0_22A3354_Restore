@implementation RTTTelephonyUtilities

void __46__RTTTelephonyUtilities_sharedUtilityProvider__block_invoke()
{
  RTTTelephonyUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(RTTTelephonyUtilities);
  v1 = (void *)sharedUtilityProvider_UtilityProvider;
  sharedUtilityProvider_UtilityProvider = (uint64_t)v0;

}

- (RTTTelephonyUtilities)init
{
  RTTTelephonyUtilities *v2;
  NSObject *v3;
  void *v4;
  dispatch_queue_t v5;
  uint64_t v6;
  AXDispatchTimer *icloudAccountConsolidator;
  uint64_t v8;
  AXDispatchTimer *icloudRelayConsolidator;
  RTTTelephonyUtilities *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v17;
  void *v18;
  _QWORD block[4];
  RTTTelephonyUtilities *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)RTTTelephonyUtilities;
  v2 = -[RTTTelephonyUtilities init](&v22, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("ttyTelephonyQueue", 0);
    -[RTTTelephonyUtilities setTelephonyUpdateQueue:](v2, "setTelephonyUpdateQueue:", v3);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v3);
    objc_msgSend(v4, "setDelegate:", v2);
    -[RTTTelephonyUtilities setTelephonyClient:](v2, "setTelephonyClient:", v4);
    v5 = dispatch_queue_create("ttyAccountStoreQueue", 0);
    -[RTTTelephonyUtilities setAccountStoreQueue:](v2, "setAccountStoreQueue:", v5);

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", v3);
    icloudAccountConsolidator = v2->_icloudAccountConsolidator;
    v2->_icloudAccountConsolidator = (AXDispatchTimer *)v6;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_icloudAccountConsolidator, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", v3);
    icloudRelayConsolidator = v2->_icloudRelayConsolidator;
    v2->_icloudRelayConsolidator = (AXDispatchTimer *)v8;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__RTTTelephonyUtilities_init__block_invoke;
    block[3] = &unk_24D2039E0;
    v10 = v2;
    v21 = v10;
    dispatch_async(v3, block);
    v11 = objc_alloc(MEMORY[0x24BDBACF8]);
    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_msgSend(v11, "initWithConfiguration:", v12);
    -[RTTTelephonyUtilities setContactStore:](v10, "setContactStore:", v13);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_36, sel_TTYHardwareEnabled, v10);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_36, sel_TTYSoftwareEnabled, v10);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)transportMethodDidChange, CFSTR("AXTTYPreferredTransportMethodChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[RTTTelephonyUtilities listenForCloudRelayChanges](v10, "listenForCloudRelayChanges");
    v17 = (void *)MEMORY[0x24BEB4930];
    dispatch_get_global_queue(21, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addDelegate:queue:", v10, v18);

  }
  return v2;
}

- (void)setTelephonyUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyUpdateQueue, a3);
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setAccountStoreQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountStoreQueue, a3);
}

- (void)listenForCloudRelayChanges
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *telephonyUpdateQueue;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[RTTTelephonyUtilities currentProcessHandlesCloudRelay](self, "currentProcessHandlesCloudRelay");
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v15 = v3;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Listening for cloud relay changes: %d", buf, 8u);
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDD1378];
    objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_iCloudRTTRelayDidChange_, v6, v7);

    objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronize");

    v9 = MEMORY[0x24BDAC760];
    telephonyUpdateQueue = self->_telephonyUpdateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke;
    block[3] = &unk_24D2039E0;
    block[4] = self;
    dispatch_async(telephonyUpdateQueue, block);
    -[RTTTelephonyUtilities accountStoreQueue](self, "accountStoreQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke_91;
    v12[3] = &unk_24D2039E0;
    v12[4] = self;
    dispatch_async(v11, v12);

  }
}

- (void)didChangeRelayCallingAvailability
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[RTTTelephonyUtilities currentProcessHandlesCloudRelay](self, "currentProcessHandlesCloudRelay"))
  {
    v2 = objc_msgSend(MEMORY[0x24BEB4930], "supportsRelayCalling");
    v3 = objc_msgSend(MEMORY[0x24BEB4930], "isRelayCallingEnabled");
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSupportsRelayCalling:", v2);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsRelayCallingEnabled:", v3);

    AXLogRTT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Did change relay calling availability %d %d", (uint8_t *)v7, 0xEu);
    }

  }
}

- (BOOL)currentProcessHandlesCloudRelay
{
  return objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHeard");
}

- (void)updateHeadphoneState
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v16;
  int v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = -[RTTTelephonyUtilities currentPreferredTransportMethod](self, "currentPreferredTransportMethod");
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeForKey:", *MEMORY[0x24BE64858]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "attributeForKey:", *MEMORY[0x24BE64850]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[RTTTelephonyUtilities setHeadphoneJackSupportsTTY:](self, "setHeadphoneJackSupportsTTY:", v6 & v8);
  AXLogRTT();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 67109376;
    v17 = v6;
    v18 = 1024;
    v19 = v8;
    _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Headphone state changed [%d, %d]", (uint8_t *)&v16, 0xEu);
  }

  AXLogRTT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = -[RTTTelephonyUtilities currentPreferredTransportMethod](self, "currentPreferredTransportMethod");
    v16 = 67109376;
    v17 = v3;
    v18 = 1024;
    v19 = v11;
    _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Current method %d, preferred method %d", (uint8_t *)&v16, 0xEu);
  }

  if (v3 != -[RTTTelephonyUtilities currentPreferredTransportMethod](self, "currentPreferredTransportMethod"))
  {
    AXLogRTT();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = -[RTTTelephonyUtilities currentPreferredTransportMethod](self, "currentPreferredTransportMethod");
      v16 = 67109120;
      v17 = v13;
      _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Preferred TTY method changed to %d", (uint8_t *)&v16, 8u);
    }

    AXLogRTT();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21473C000, v14, OS_LOG_TYPE_INFO, "Posting transport changed because headphone state changed", (uint8_t *)&v16, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("AXTTYPreferredTransportMethodChangedNotification"), 0);

  }
}

- (BOOL)contactIsTTYContact:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[RTTTelephonyUtilities currentPreferredTransportMethod](self, "currentPreferredTransportMethod"))
  {
    v5 = 1;
  }
  else
  {
    +[RTTServer sharedInstance](RTTServer, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "contactIsTTYContact:", v4);

  }
  return v5;
}

- (unint64_t)currentPreferredTransportMethod
{
  void *v3;
  unint64_t v4;

  -[RTTTelephonyUtilities defaultVoiceContext](self, "defaultVoiceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTTTelephonyUtilities currentPreferredTransportMethodForContext:](self, "currentPreferredTransportMethodForContext:", v3);

  return v4;
}

- (unint64_t)currentPreferredTransportMethodForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  _BYTE v17[10];
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPhone"))
    goto LABEL_8;
  -[RTTTelephonyUtilities callCapabilitiesSupportsTelephonyCalls](self, "callCapabilitiesSupportsTelephonyCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "BOOLValue"))
    goto LABEL_7;
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "TTYHardwareEnabledForContext:", v4) & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  v7 = -[RTTTelephonyUtilities headphoneJackSupportsTTY](self, "headphoneJackSupportsTTY");

  if (v7)
  {
    v8 = 1;
    goto LABEL_10;
  }
LABEL_8:
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "TTYSoftwareEnabledForContext:", v4);

  if (!v10)
  {
    AXLogRTT();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      *(_QWORD *)v17 = v4;
      _os_log_impl(&dword_21473C000, v14, OS_LOG_TYPE_INFO, "No TTY transport method support, so not migrating or priming server: %@", (uint8_t *)&v16, 0xCu);
    }
    v8 = 0;
    goto LABEL_17;
  }
  v8 = 2;
LABEL_10:
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldMigrateSettings");

  AXLogRTT();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 67109634;
    *(_DWORD *)v17 = v8;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v12;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_21473C000, v13, OS_LOG_TYPE_INFO, "Current preferred transport is : %d - %d = %@", (uint8_t *)&v16, 0x18u);
  }

  if (v12)
  {
    +[RTTServer sharedInstance](RTTServer, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject primeRTTServer](v14, "primeRTTServer");
LABEL_17:

  }
  return v8;
}

- (CTXPCServiceSubscriptionContext)defaultVoiceContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 48, 1);
}

+ (id)sharedUtilityProvider
{
  if (sharedUtilityProvider_onceToken != -1)
    dispatch_once(&sharedUtilityProvider_onceToken, &__block_literal_global_0);
  return (id)sharedUtilityProvider_UtilityProvider;
}

- (NSNumber)callCapabilitiesSupportsTelephonyCalls
{
  RTTTelephonyUtilities *v2;
  NSNumber *callCapabilitiesSupportsTelephonyCalls;
  uint64_t v4;
  NSNumber *v5;
  NSObject *v6;
  NSNumber *v7;
  void *v8;
  int v10;
  NSNumber *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  callCapabilitiesSupportsTelephonyCalls = v2->_callCapabilitiesSupportsTelephonyCalls;
  if (!callCapabilitiesSupportsTelephonyCalls)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BEB4930], "supportsTelephonyCalls"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_callCapabilitiesSupportsTelephonyCalls;
    v2->_callCapabilitiesSupportsTelephonyCalls = (NSNumber *)v4;

    AXLogRTT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v2->_callCapabilitiesSupportsTelephonyCalls;
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Retrieving new telephony supports calling: %@", (uint8_t *)&v10, 0xCu);
    }

    callCapabilitiesSupportsTelephonyCalls = v2->_callCapabilitiesSupportsTelephonyCalls;
  }
  v8 = (void *)-[NSNumber copy](callCapabilitiesSupportsTelephonyCalls, "copy");
  objc_sync_exit(v2);

  return (NSNumber *)v8;
}

- (void)setHeadphoneJackSupportsTTY:(BOOL)a3
{
  self->_headphoneJackSupportsTTY = a3;
}

uint64_t __29__RTTTelephonyUtilities_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "registerNotifications");
  objc_msgSend(*(id *)(a1 + 32), "reloadDefaultVoiceContext");
  objc_msgSend(*(id *)(a1 + 32), "didChangeRelayCallingAvailability");
  return objc_msgSend(*(id *)(a1 + 32), "updateHeadphoneState");
}

- (void)reloadDefaultVoiceContext
{
  OUTLINED_FUNCTION_0(&dword_21473C000, a2, a3, "Could not retrieve default voice context: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setDefaultVoiceContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setAllVoiceContexts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setActiveContextCount:(unint64_t)a3
{
  self->_activeContextCount = a3;
}

- (void)registerNotifications
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)MEMORY[0x24BE64860];
  v5 = (_QWORD *)MEMORY[0x24BE647E0];
  v6 = *MEMORY[0x24BE647E0];
  v14[0] = *MEMORY[0x24BE64860];
  v14[1] = v6;
  v7 = (uint64_t *)MEMORY[0x24BE64908];
  v14[2] = *MEMORY[0x24BE64908];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttribute:forKey:error:", v8, *MEMORY[0x24BE64930], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_headphoneStateChangedNotification_, *v4, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_headphoneStateChangedNotification_, *v5, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *v7;
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_mediaServerDied, v12, v13);

}

- (id)activeContexts
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[RTTTelephonyUtilities cachedActiveContexts](self, "cachedActiveContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTTTelephonyUtilities cachedActiveContexts](self, "cachedActiveContexts");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[RTTTelephonyUtilities telephonyClient](self, "telephonyClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v5, "getActiveContexts:", &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;

    if (v7)
    {
      AXLogRTT();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Error getting contexts %@", buf, 0xCu);
      }

    }
    -[RTTTelephonyUtilities setCachedActiveContexts:](self, "setCachedActiveContexts:", v6);
    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[RTTTelephonyUtilities cachedActiveContexts](self, "cachedActiveContexts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Caching active contexts %@", buf, 0xCu);

    }
    -[RTTTelephonyUtilities cachedActiveContexts](self, "cachedActiveContexts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

- (CTXPCContexts)cachedActiveContexts
{
  return (CTXPCContexts *)objc_getProperty(self, a2, 112, 1);
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setCachedActiveContexts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

void __50__RTTTelephonyUtilities_reloadDefaultVoiceContext__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = (void *)a1[4];
  if (v5)
  {
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      objc_msgSend(v4, "context");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[6] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      AXLogRTT();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
        v19 = 138412290;
        v20 = v12;
        _os_log_impl(&dword_21473C000, v11, OS_LOG_TYPE_INFO, "Checking voice preferred context %@", (uint8_t *)&v19, 0xCu);
      }

    }
  }
  else if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(v3, "context");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  objc_msgSend(v4, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)a1[5];
    objc_msgSend(v4, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

  }
}

+ (id)sharedCallCenter
{
  if (sharedCallCenter_onceToken != -1)
    dispatch_once(&sharedCallCenter_onceToken, &__block_literal_global_23);
  return (id)sharedCallCenter_CallCenter;
}

void __41__RTTTelephonyUtilities_sharedCallCenter__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedCallCenter_CallCenter;
  sharedCallCenter_CallCenter = v0;

}

+ (void)performCallCenterTask:(id)a3
{
  void (**v3)(_QWORD);
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;
  void (**v9)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v3[2](v3);
  }
  else
  {
    v4 = dispatch_semaphore_create(0);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__RTTTelephonyUtilities_performCallCenterTask___block_invoke;
    v7[3] = &unk_24D203CF8;
    v8 = v4;
    v9 = v3;
    v5 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
    v6 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v5, v6);

  }
}

intptr_t __47__RTTTelephonyUtilities_performCallCenterTask___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)TTYHardwareEnabledForAnyActiveContext
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__RTTTelephonyUtilities_TTYHardwareEnabledForAnyActiveContext__block_invoke;
    v11[3] = &unk_24D203D20;
    v11[4] = &v13;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
    v5 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    AXLogRTT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "HW No active subscriptions, falling back to default voice context", buf, 2u);
    }

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultVoiceContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "TTYHardwareEnabledForContext:", v9);

  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __62__RTTTelephonyUtilities_TTYHardwareEnabledForAnyActiveContext__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "TTYHardwareEnabledForContext:", v8);
  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)TTYSoftwareEnabledForAnyActiveContext
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__RTTTelephonyUtilities_TTYSoftwareEnabledForAnyActiveContext__block_invoke;
    v11[3] = &unk_24D203D20;
    v11[4] = &v13;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
    v5 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    AXLogRTT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "SW No active subscriptions, falling back to default voice context", buf, 2u);
    }

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultVoiceContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "TTYSoftwareEnabledForContext:", v9);

  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __62__RTTTelephonyUtilities_TTYSoftwareEnabledForAnyActiveContext__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "TTYSoftwareEnabledForContext:", v8);
  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)isTTYSupported
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultVoiceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isTTYSupportedForContext:", v4);

  return v5;
}

+ (BOOL)isRTTSupported
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultVoiceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isTTYOverIMSSupportedForContext:", v5);

  v7 = objc_msgSend(a1, "isRelayRTTSupported");
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109376;
    v10[1] = v6;
    v11 = 1024;
    v12 = v7;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "isRTTSupported: %d, relay: %d", (uint8_t *)v10, 0xEu);
  }

  return v6 | v7;
}

+ (BOOL)isOnlyRTTSupported
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultVoiceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RTTTelephonyUtilities isOnlyRTTSupportedForContext:](RTTTelephonyUtilities, "isOnlyRTTSupportedForContext:", v3);

  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "checking only RTT: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

+ (BOOL)shouldUseRTT
{
  void *v2;
  void *v3;
  BOOL v4;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultVoiceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RTTTelephonyUtilities shouldUseRTTForContext:](RTTTelephonyUtilities, "shouldUseRTTForContext:", v3);

  return v4;
}

+ (BOOL)relayIsSupported
{
  void *v2;
  void *v3;
  BOOL v4;

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "TTYSoftwareEnabled"))
  {
    +[RTTTelephonyUtilities relayPhoneNumber](RTTTelephonyUtilities, "relayPhoneNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)currentSupportedTextingType
{
  if (!+[RTTTelephonyUtilities hardwareTTYIsSupported](RTTTelephonyUtilities, "hardwareTTYIsSupported")
    && !+[RTTTelephonyUtilities softwareTTYIsSupported](RTTTelephonyUtilities, "softwareTTYIsSupported"))
  {
    return 4;
  }
  if (+[RTTTelephonyUtilities isOnlyRTTSupported](RTTTelephonyUtilities, "isOnlyRTTSupported"))
    return 1;
  if (+[RTTTelephonyUtilities isRTTSupported](RTTTelephonyUtilities, "isRTTSupported"))
    return 3;
  if (+[RTTTelephonyUtilities isRelayRTTSupported](RTTTelephonyUtilities, "isRelayRTTSupported"))
    return 1;
  return 2;
}

+ (id)relayPhoneNumber
{
  void *v2;
  void *v3;

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredRelayNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)hardwareTTYIsSupported
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allVoiceContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (+[RTTTelephonyUtilities hardwareTTYIsSupportedForContext:](RTTTelephonyUtilities, "hardwareTTYIsSupportedForContext:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)isRelayRTTSupported
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportsRelayCalling"))
  {
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isRelayCallingEnabled");

  }
  else
  {
    v4 = 0;
  }

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "continuityRTTIsSupported");

  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109376;
    v9[1] = v4;
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "Relay supported: TU supports: %d, continuity: %d", (uint8_t *)v9, 0xEu);
  }

  if (v4)
    return v6;
  else
    return 0;
}

+ (BOOL)softwareTTYIsSupported
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allVoiceContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (+[RTTTelephonyUtilities softwareTTYIsSupportedForContext:](RTTTelephonyUtilities, "softwareTTYIsSupportedForContext:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)))
        {

          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }

  return objc_msgSend(a1, "isRelayRTTSupported");
}

+ (BOOL)isTTYSupportedForContext:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTTYSupportedForContext:", v3);

  return v5;
}

+ (BOOL)isRTTSupportedForContext:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTTYOverIMSSupportedForContext:", v3);

  return v5;
}

+ (BOOL)isOnlyRTTSupportedForContext:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = !+[RTTTelephonyUtilities isTTYSupportedForContext:](RTTTelephonyUtilities, "isTTYSupportedForContext:", v3)&& +[RTTTelephonyUtilities isRTTSupportedForContext:](RTTTelephonyUtilities, "isRTTSupportedForContext:", v3);

  return v4;
}

+ (BOOL)hardwareTTYIsSupportedForContext:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x2199D46B8]();
  if (+[RTTTelephonyUtilities isTTYSupportedForContext:](RTTTelephonyUtilities, "isTTYSupportedForContext:", v3))
  {
    v5 = objc_msgSend(MEMORY[0x24BEB4930], "supportsPrimaryCalling");
  }
  else
  {
    v5 = 0;
  }
  objc_autoreleasePoolPop(v4);

  return v5;
}

+ (BOOL)softwareTTYIsSupportedForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  _BOOL4 v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  _BOOL4 v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x2199D46B8]();
  if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall")
    && (+[RTTSettings sharedInstance](RTTSettings, "sharedInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "internalOverrideTTYAvailability"),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    v19 = v4;
    v8 = +[RTTTelephonyUtilities isTTYSupportedForContext:](RTTTelephonyUtilities, "isTTYSupportedForContext:", v3);
    v9 = objc_msgSend(MEMORY[0x24BEB4930], "supportsPrimaryCalling");
    v10 = objc_msgSend(MEMORY[0x24BEB4930], "isThumperCallingEnabled");
    v11 = objc_msgSend(MEMORY[0x24BEB4930], "isDirectTelephonyCallingCurrentlyAvailable");
    v12 = objc_msgSend(MEMORY[0x24BEB4930], "isRelayCallingEnabled");
    v13 = +[RTTTelephonyUtilities isRTTSupportedForContext:](RTTTelephonyUtilities, "isRTTSupportedForContext:", v3);
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "continuityRTTIsSupported");

    AXLogRTT();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BEB4930], "thumperCallingCapabilityInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110912;
      v21 = v8;
      v22 = 1024;
      v23 = v9;
      v24 = 1024;
      v25 = v10;
      v26 = 1024;
      v27 = v11;
      v28 = 1024;
      v29 = v12;
      v30 = 1024;
      v31 = v15;
      v32 = 1024;
      v33 = v13;
      v34 = 1024;
      v35 = objc_msgSend(v17, "provisioningStatus");
      _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_INFO, "SW TTY enabled=%d, Primary calling: %d, Thumper: %d, Direct: %d, Relay: %d, RTTRelay: %d, RTT supported %d, Thumper provisioning: %d", buf, 0x32u);

    }
    v7 = v8 & v9 | v15 | (v9 | v10 | v11 | v12) & v13;
    v4 = v19;
  }
  objc_autoreleasePoolPop(v4);

  return v7;
}

+ (BOOL)shouldUseRTTForContext:(id)a3
{
  void *v3;
  BOOL v4;

  if (!+[RTTTelephonyUtilities isRTTSupportedForContext:](RTTTelephonyUtilities, "isRTTSupportedForContext:", a3))return 0;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentPreferredTransportMethod") == 2;

  return v4;
}

+ (BOOL)relayIsSupportedForContext:(id)a3
{
  void *v3;
  BOOL v4;

  +[RTTTelephonyUtilities relayPhoneNumberForContext:](RTTTelephonyUtilities, "relayPhoneNumberForContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

+ (id)relayPhoneNumberForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relayNumberForContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isRTTCallHoldSupportedForContext:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRTTCallHoldSupportedForContext:", v3);

  return v5;
}

void __29__RTTTelephonyUtilities_init__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AXTTYPreferredTransportMethodChangedNotification"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RTTTelephonyUtilities;
  -[RTTTelephonyUtilities dealloc](&v4, sel_dealloc);
}

- (void)setTTYDictionaryAvailability:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  RTTDictionaryManager *v5;

  v3 = a3;
  v5 = objc_alloc_init(RTTDictionaryManager);
  if (objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHeard"))
  {
    if (v3)
      -[RTTDictionaryManager downloadIfNeeded](v5, "downloadIfNeeded");
    else
      -[RTTDictionaryManager deleteIfNeeded](v5, "deleteIfNeeded");
  }
  else
  {
    +[RTTServer sharedInstance](RTTServer, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTTYDictionaryAvailability:", v3);

  }
}

- (void)didChangeTelephonyCallingSupport
{
  NSObject *v2;
  uint8_t v3[16];

  -[RTTTelephonyUtilities setCallCapabilitiesSupportsTelephonyCalls:](self, "setCallCapabilitiesSupportsTelephonyCalls:", 0);
  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Reseting telephony calling support", v3, 2u);
  }

}

- (void)headphoneStateChangedNotification:(id)a3
{
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = dispatch_time(0, 500000000);
  -[RTTTelephonyUtilities telephonyUpdateQueue](self, "telephonyUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__RTTTelephonyUtilities_headphoneStateChangedNotification___block_invoke;
  block[3] = &unk_24D2039E0;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

uint64_t __59__RTTTelephonyUtilities_headphoneStateChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHeadphoneState");
}

- (void)mediaServerDied
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Media server died.", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTTTelephonyUtilities performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_registerNotifications, 0, 2.0);
  -[RTTTelephonyUtilities headphoneStateChangedNotification:](self, "headphoneStateChangedNotification:", 0);
}

- (void)setCallCapabilitiesSupportsTelephonyCalls:(id)a3
{
  RTTTelephonyUtilities *v4;
  uint64_t v5;
  NSNumber *callCapabilitiesSupportsTelephonyCalls;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  callCapabilitiesSupportsTelephonyCalls = v4->_callCapabilitiesSupportsTelephonyCalls;
  v4->_callCapabilitiesSupportsTelephonyCalls = (NSNumber *)v5;

  objc_sync_exit(v4);
}

- (BOOL)relayIsSupported
{
  return +[RTTTelephonyUtilities relayIsSupported](RTTTelephonyUtilities, "relayIsSupported");
}

- (id)myPhoneNumber
{
  void *v3;
  void *v4;

  -[RTTTelephonyUtilities defaultVoiceContext](self, "defaultVoiceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTTelephonyUtilities phoneNumberForContext:](self, "phoneNumberForContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)phoneNumberForContext:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *phoneNumberInfoCache;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    phoneNumberInfoCache = self->_phoneNumberInfoCache;
    if (!phoneNumberInfoCache)
    {
      v6 = (NSMutableDictionary *)objc_opt_new();
      v7 = self->_phoneNumberInfoCache;
      self->_phoneNumberInfoCache = v6;

      phoneNumberInfoCache = self->_phoneNumberInfoCache;
    }
    -[NSObject uuid](v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](phoneNumberInfoCache, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = self->_phoneNumberInfoCache;
      -[NSObject uuid](v4, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[RTTTelephonyUtilities telephonyClient](self, "telephonyClient");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v17, "getPhoneNumber:error:", v4, &v23);
      v12 = objc_claimAutoreleasedReturnValue();
      v16 = v23;

      AXLogRTT();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v12;
        v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_21473C000, v18, OS_LOG_TYPE_INFO, "Retrieved phone number %@ from context %@ for caching", buf, 0x16u);
      }

      if (v16)
        goto LABEL_15;
    }
    if (-[NSObject isPresent](v12, "isPresent"))
    {
      -[NSObject number](v12, "number");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_phoneNumberInfoCache;
      -[NSObject uuid](v4, "uuid");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v12, v15);
      v16 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v16 = 0;
LABEL_15:
    v19 = self->_phoneNumberInfoCache;
    v20 = (void *)objc_opt_new();
    -[NSObject uuid](v4, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v20, v21);

    AXLogRTT();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v4;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_21473C000, v15, OS_LOG_TYPE_INFO, "Cached blank phone number for context %@. Error? %@", buf, 0x16u);
    }
    v13 = 0;
    goto LABEL_18;
  }
  AXLogRTT();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[RTTTelephonyUtilities phoneNumberForContext:].cold.1(v16);
  v13 = 0;
LABEL_19:

  return v13;
}

- (id)ttyMeContact
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  if (_AXSInUnitTestMode())
  {
    if (ttyMeContact_onceToken != -1)
      dispatch_once(&ttyMeContact_onceToken, &__block_literal_global_57);
    return (id)ttyMeContact_unitTestMe;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BDBA288];
    v11[0] = v3;
    v11[1] = v4;
    v11[2] = *MEMORY[0x24BDBA348];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    return v9;
  }
}

void __37__RTTTelephonyUtilities_ttyMeContact__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBACA0]);
  v1 = (void *)ttyMeContact_unitTestMe;
  ttyMeContact_unitTestMe = (uint64_t)v0;

}

- (BOOL)contactPathIsMe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1690], "decimalDigitCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invert");
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", &stru_24D204B08);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Is contact path %@ (%@) me?", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v19 = 0;
  -[RTTTelephonyUtilities subscriptionContexts](self, "subscriptionContexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__RTTTelephonyUtilities_contactPathIsMe___block_invoke;
  v14[3] = &unk_24D203D68;
  v14[4] = self;
  v10 = v5;
  v15 = v10;
  v11 = v4;
  v16 = v11;
  v17 = buf;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  v12 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v12;
}

void __41__RTTTelephonyUtilities_contactPathIsMe___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "phoneNumberForContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", &stru_24D204B08);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Finding own contact path from context %@ with phone number %@", (uint8_t *)&v12, 0x16u);
  }

  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 48)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
    AXLogRTT();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_21473C000, v11, OS_LOG_TYPE_INFO, "Yes it's my phone number!", (uint8_t *)&v12, 2u);
    }

  }
}

- (id)contactPathForCall:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;

  objc_msgSend(a3, "dialRequestForRedial");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localSenderIdentityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTTelephonyUtilities phoneNumberFromUUID:](self, "phoneNumberFromUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad");
  if (!objc_msgSend(v7, "length") || (_AXSInUnitTestMode() ? (v9 = 1) : (v9 = v8), v9 == 1))
  {
    ttyLocString(CFSTR("TTYPersonMe"));
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  return v7;
}

- (id)phoneNumberFromUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  RTTTelephonyUtilities *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[RTTTelephonyUtilities subscriptionContexts](self, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__RTTTelephonyUtilities_phoneNumberFromUUID___block_invoke;
  v9[3] = &unk_24D203D90;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __45__RTTTelephonyUtilities_phoneNumberFromUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "phoneNumberForContext:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

- (id)labelFromUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  RTTTelephonyUtilities *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[RTTTelephonyUtilities subscriptionContexts](self, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__RTTTelephonyUtilities_labelFromUUID___block_invoke;
  v9[3] = &unk_24D203D90;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __39__RTTTelephonyUtilities_labelFromUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "telephonyClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getSimLabel:error:", v19, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
      v14 = (id)objc_msgSend(*(id *)(a1 + 40), "phoneNumberForContext:", v19);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
    {
      objc_msgSend(v19, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
    *a4 = 1;
  }

}

- (BOOL)answerRTTCallAsMutedForCall:(id)a3
{
  id v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "isEmergency");
  v5 = objc_msgSend(v3, "supportsTTYWithVoice");

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "answerRTTCallsAsMuted");

  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v4 ^ 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109632;
    v11[1] = v7;
    v12 = 1024;
    v13 = v9;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Mute call on answer? Preference: %d Not emergency: %d Supports RTT: %d", (uint8_t *)v11, 0x14u);
  }

  return v7 & v9 & v5;
}

- (void)purgePhoneNumberInfoCache
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Purging phone number info cache", v4, 2u);
  }

  -[NSMutableDictionary removeAllObjects](self->_phoneNumberInfoCache, "removeAllObjects");
}

- (BOOL)deviceIsTinker
{
  return 0;
}

- (void)carrierSettingsDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Carrier settings did change, reloading context and relay phone numbers", v4, 2u);
  }

  -[RTTTelephonyUtilities reloadDefaultVoiceContext](self, "reloadDefaultVoiceContext");
  -[RTTTelephonyUtilities reloadRelayPhoneNumbers](self, "reloadRelayPhoneNumbers");
  -[RTTTelephonyUtilities purgePhoneNumberInfoCache](self, "purgePhoneNumberInfoCache");
  -[RTTTelephonyUtilities setCachedSubscriptionContexts:](self, "setCachedSubscriptionContexts:", 0);
  -[RTTTelephonyUtilities setCachedActiveContexts:](self, "setCachedActiveContexts:", 0);
}

- (id)subscriptionContexts
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[RTTTelephonyUtilities cachedSubscriptionContexts](self, "cachedSubscriptionContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTTTelephonyUtilities cachedSubscriptionContexts](self, "cachedSubscriptionContexts");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[RTTTelephonyUtilities telephonyClient](self, "telephonyClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v5, "getSubscriptionInfoWithError:", &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;

    if (v7)
    {
      AXLogRTT();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v7;
        _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Error getting subscriptionInfo %@", buf, 0xCu);
      }

    }
    objc_msgSend(v6, "subscriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTTelephonyUtilities setCachedSubscriptionContexts:](self, "setCachedSubscriptionContexts:", v9);

    AXLogRTT();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[RTTTelephonyUtilities cachedSubscriptionContexts](self, "cachedSubscriptionContexts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Caching subscription contexts %@", buf, 0xCu);

    }
    -[RTTTelephonyUtilities cachedSubscriptionContexts](self, "cachedSubscriptionContexts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

- (id)contextForCall:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTTelephonyUtilities subscriptionContexts](self, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__RTTTelephonyUtilities_contextForCall___block_invoke;
  v12[3] = &unk_24D203DB8;
  v6 = v4;
  v13 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v12);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "No context found for call %@", buf, 0xCu);
    }

    v9 = 0;
  }
  else
  {
    -[RTTTelephonyUtilities subscriptionContexts](self, "subscriptionContexts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

uint64_t __40__RTTTelephonyUtilities_contextForCall___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localSenderIdentityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)reloadRelayPhoneNumbers
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[6];
  uint8_t buf[16];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHeard"))
  {
    AXLogRTT();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Updating relay number with carrier bundle", buf, 2u);
    }

    -[RTTTelephonyUtilities activeContexts](self, "activeContexts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__RTTTelephonyUtilities_reloadRelayPhoneNumbers__block_invoke;
    v8[3] = &unk_24D203DE0;
    v8[4] = self;
    v8[5] = &v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  }
  v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __48__RTTTelephonyUtilities_reloadRelayPhoneNumbers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relayNumberForContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredRelayNumberForContext:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
    {
      AXLogRTT();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v6;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_21473C000, v11, OS_LOG_TYPE_INFO, "setting relay number: %@ for context: %@", (uint8_t *)&v15, 0x16u);

      }
      +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPreferredRelayNumber:forContext:", v6, v14);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (id)getCarrierValueForKey:(id)a3 andContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTTelephonyUtilities getCarrierValueForKeyHierarchy:andContext:](self, "getCarrierValueForKeyHierarchy:andContext:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)getCarrierValueForKeyHierarchy:(id)a3 andContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[8];
  id v14;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    AXLogRTT();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Empty context", v13, 2u);
    }
    goto LABEL_8;
  }
  -[RTTTelephonyUtilities telephonyClient](self, "telephonyClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "context:getCarrierBundleValue:error:", v7, v6, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (v10)
  {
    AXLogRTT();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RTTTelephonyUtilities getCarrierValueForKeyHierarchy:andContext:].cold.1((uint64_t)v6, (uint64_t)v10, v11);

LABEL_8:
    v9 = 0;
  }

  return v9;
}

- (BOOL)isTTYOverIMSSupportedForContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTTelephonyUtilities getCarrierValueForKeyHierarchy:andContext:](self, "getCarrierValueForKeyHierarchy:andContext:", &unk_24D209D88, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v4;
    v14 = 1024;
    v15 = v6;
    v16 = 2112;
    v17 = v5;
    v18 = 1024;
    v19 = objc_msgSend(v8, "continuityRTTIsSupported");
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "RTT supported %@ - %d = %@ -- %d", (uint8_t *)&v12, 0x22u);

  }
  if ((v6 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "continuityRTTIsSupported");

  }
  return v9;
}

- (BOOL)isTTYSupportedForContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTTelephonyUtilities getCarrierValueForKey:andContext:](self, "getCarrierValueForKey:andContext:", CFSTR("ShowTTY"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "TTY supported %@ - %d", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (id)relayNumberForContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTTelephonyUtilities getCarrierValueForKey:andContext:](self, "getCarrierValueForKey:andContext:", CFSTR("TTYRelayNumber"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  if (objc_msgSend(v6, "length"))
  {
    v7 = v5;
  }
  else
  {
    -[RTTTelephonyUtilities getCarrierValueForKeyHierarchy:andContext:](self, "getCarrierValueForKeyHierarchy:andContext:", &unk_24D209DA0, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;

      v6 = v8;
    }
    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Checking IMSConfig for relay number %@", (uint8_t *)&v11, 0xCu);
    }

  }
  return v6;
}

- (BOOL)isRTTCallHoldSupportedForContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTTelephonyUtilities getCarrierValueForKeyHierarchy:andContext:](self, "getCarrierValueForKeyHierarchy:andContext:", &unk_24D209DB8, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "RTT call hold supported %@ for context %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

uint64_t __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Processing icloud settings for RTT", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "iCloudAccountDidChange:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "iCloudRTTRelayDidChange:", 0);
}

void __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke_91(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "RTT fetching account store", buf, 2u);
  }

  v3 = objc_alloc_init(MEMORY[0x24BDB4398]);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB3FD8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountsWithAccountType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogRTT();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "retrieved accounts: %@", buf, 0xCu);
  }

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __51__RTTTelephonyUtilities_listenForCloudRelayChanges__block_invoke_93(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_iCloudAccountDidChange_, *MEMORY[0x24BDB41E0], 0);

}

- (void)didChangeOutgoingRelayCallerID
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[RTTTelephonyUtilities currentProcessHandlesCloudRelay](self, "currentProcessHandlesCloudRelay"))
  {
    AXLogRTT();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Did change outgoing relay caller ID", v4, 2u);
    }

    -[RTTTelephonyUtilities iCloudRTTRelayDidChange:](self, "iCloudRTTRelayDidChange:", 0);
  }
}

- (void)didChangeRelayCallingCapabilities
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[RTTTelephonyUtilities currentProcessHandlesCloudRelay](self, "currentProcessHandlesCloudRelay"))
  {
    v2 = objc_msgSend(MEMORY[0x24BEB4930], "supportsRelayCalling");
    v3 = objc_msgSend(MEMORY[0x24BEB4930], "isRelayCallingEnabled");
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSupportsRelayCalling:", v2);

    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsRelayCallingEnabled:", v3);

    AXLogRTT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_21473C000, v6, OS_LOG_TYPE_INFO, "Did change relay calling capibilities %d %d", (uint8_t *)v7, 0xEu);
    }

  }
}

- (void)iCloudRTTRelayDidChange:(id)a3
{
  NSObject *v4;
  AXDispatchTimer *icloudRelayConsolidator;
  _QWORD v6[5];
  uint8_t buf[16];

  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Cloud relay updated", buf, 2u);
  }

  icloudRelayConsolidator = self->_icloudRelayConsolidator;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__RTTTelephonyUtilities_iCloudRTTRelayDidChange___block_invoke;
  v6[3] = &unk_24D2039E0;
  v6[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](icloudRelayConsolidator, "afterDelay:processBlock:", v6, 3.0);
}

uint64_t __49__RTTTelephonyUtilities_iCloudRTTRelayDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");

  v3 = objc_msgSend(*(id *)(a1 + 32), "relayRTTIsSupported");
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Relay supported? %d", (uint8_t *)v8, 8u);
  }

  +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContinuityRTTIsSupported:", v3);

  if (!+[RTTTelephonyUtilities softwareTTYIsSupported](RTTTelephonyUtilities, "softwareTTYIsSupported"))
  {
    +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTTYSoftwareEnabled:", 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "headphoneStateChangedNotification:", 0);
}

- (void)iCloudAccountDidChange:(id)a3
{
  id v4;
  NSObject *telephonyUpdateQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RTTTelephonyUtilities *v9;

  v4 = a3;
  telephonyUpdateQueue = self->_telephonyUpdateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__RTTTelephonyUtilities_iCloudAccountDidChange___block_invoke;
  v7[3] = &unk_24D203A08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(telephonyUpdateQueue, v7);

}

uint64_t __48__RTTTelephonyUtilities_iCloudAccountDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "iCloud Account did change: %@", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 24);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__RTTTelephonyUtilities_iCloudAccountDidChange___block_invoke_96;
  v7[3] = &unk_24D2039E0;
  v7[4] = v4;
  return objc_msgSend(v5, "afterDelay:processBlock:", v7, 3.0);
}

uint64_t __48__RTTTelephonyUtilities_iCloudAccountDidChange___block_invoke_96(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processiCloudAccountForRTT");
}

- (void)_processiCloudAccountForRTT
{
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v17;
  _BYTE v18[10];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(MEMORY[0x24BEB4930], "supportsPrimaryCalling");
  if ((objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHeard") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsPreferences");
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v17 = 67109376;
    *(_DWORD *)v18 = v3;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "iCloud changed: pushing changes: primary calling supported: %d for right process: %d", (uint8_t *)&v17, 0xEu);
  }

  if ((v3 & v4) == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v6, "dictionaryForKey:", CFSTR("RTTCloudRelayNumberKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTTelephonyUtilities defaultVoiceContext](self, "defaultVoiceContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTTelephonyUtilities phoneNumberFromUUID:](self, "phoneNumberFromUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      *(_QWORD *)v18 = v13;
      *(_WORD *)&v18[8] = 2112;
      v19 = v12;
      _os_log_impl(&dword_21473C000, v14, OS_LOG_TYPE_INFO, "Phone num: %@ for %@", (uint8_t *)&v17, 0x16u);
    }

    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[RTTTelephonyUtilities isRTTSupported](RTTTelephonyUtilities, "isRTTSupported"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v15, v13);

      AXLogRTT();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        *(_QWORD *)v18 = v9;
        _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_DEFAULT, "Storing relay phones: %@ for RTT", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("RTTCloudRelayNumberKey"));
      objc_msgSend(v6, "synchronize");
    }

  }
}

- (BOOL)relayRTTIsSupported
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  int v9;
  NSObject *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BEB4930], "supportsTelephonyRelayCalling"))
  {
    objc_msgSend(MEMORY[0x24BEB4930], "outgoingRelayCallerID");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryForKey:", CFSTR("RTTCloudRelayNumberKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogRTT();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = v2;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Checking %@ in %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(v4, "objectForKey:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    AXLogRTT();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21473C000, v2, OS_LOG_TYPE_INFO, "Device doesn't support relay calls", (uint8_t *)&v9, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)activeContextCount
{
  return self->_activeContextCount;
}

- (NSSet)allVoiceContexts
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)headphoneJackSupportsTTY
{
  return self->_headphoneJackSupportsTTY;
}

- (OS_dispatch_queue)telephonyUpdateQueue
{
  return self->_telephonyUpdateQueue;
}

- (OS_dispatch_queue)accountStoreQueue
{
  return self->_accountStoreQueue;
}

- (NSArray)cachedSubscriptionContexts
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCachedSubscriptionContexts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)phoneNumberInfoCache
{
  return self->_phoneNumberInfoCache;
}

- (void)setPhoneNumberInfoCache:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberInfoCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberInfoCache, 0);
  objc_storeStrong((id *)&self->_cachedActiveContexts, 0);
  objc_storeStrong((id *)&self->_cachedSubscriptionContexts, 0);
  objc_storeStrong((id *)&self->_accountStoreQueue, 0);
  objc_storeStrong((id *)&self->_telephonyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_allVoiceContexts, 0);
  objc_storeStrong((id *)&self->_defaultVoiceContext, 0);
  objc_storeStrong((id *)&self->_icloudRelayConsolidator, 0);
  objc_storeStrong((id *)&self->_icloudAccountConsolidator, 0);
  objc_storeStrong((id *)&self->_callCapabilitiesSupportsTelephonyCalls, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)phoneNumberForContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21473C000, log, OS_LOG_TYPE_ERROR, "Attempted to retrieve phone number using a nil context", v1, 2u);
}

- (void)getCarrierValueForKeyHierarchy:(os_log_t)log andContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21473C000, log, OS_LOG_TYPE_ERROR, "Error getting carrier key %@ - %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
