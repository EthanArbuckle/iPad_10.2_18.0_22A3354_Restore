@implementation SPUIAppService

+ (void)initialize
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  runningInSpotlight = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.springboard"));

}

+ (id)sharedAppService
{
  if (sharedAppService_onceToken != -1)
    dispatch_once(&sharedAppService_onceToken, &__block_literal_global);
  return (id)sharedAppService_sAppService;
}

uint64_t __34__SPUIAppService_sharedAppService__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedAppService_sAppService;
  sharedAppService_sAppService = v0;

  return objc_msgSend((id)sharedAppService_sAppService, "registerAwakeNotifyToken");
}

- (void)_cancelAwakeNotifyToken
{
  SPUIAppService *v2;
  int awakeNotifyToken;

  v2 = self;
  objc_sync_enter(v2);
  awakeNotifyToken = v2->_awakeNotifyToken;
  v2->_awakeNotifyToken = -1;
  objc_sync_exit(v2);

  if (awakeNotifyToken != -1)
    notify_cancel(awakeNotifyToken);
}

- (void)registerAwakeNotifyToken
{
  SPUIAppService *v2;
  int awakeNotifyToken;
  NSObject *appServiceQueue;
  uint32_t v5;
  int v6;
  _QWORD v7[5];
  int out_token;

  v2 = self;
  objc_sync_enter(v2);
  awakeNotifyToken = v2->_awakeNotifyToken;
  if (awakeNotifyToken != -1)
    notify_cancel(awakeNotifyToken);
  out_token = -1;
  appServiceQueue = v2->_appServiceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SPUIAppService_registerAwakeNotifyToken__block_invoke;
  v7[3] = &unk_24DA1CED0;
  v7[4] = v2;
  v5 = notify_register_dispatch("com.apple.searchd.launched", &out_token, appServiceQueue, v7);
  v6 = out_token;
  if (v5)
    v6 = -1;
  v2->_awakeNotifyToken = v6;
  objc_sync_exit(v2);

}

void __42__SPUIAppService_registerAwakeNotifyToken__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v9[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218DEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Got index agent wakeup notification!", buf, 2u);
  }
  v2 = MKBGetDeviceLockState();
  if (!v2 || v2 == 3 || unlocked == 1)
  {
    unlocked = 1;
    if (runningInSpotlight)
    {
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
      v5 = v3;
      kdebug_trace();
      SPFastApplicationsGetNoBuild();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SPFastHiddenAppsGetNoBuild();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sendAppsInfoWithData(v5, v6, v7);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_218DEA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Got index agent wakeup notification in locked state!", v9, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)lockStateChanged, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (SPUIAppService)init
{
  SPUIAppService *v2;
  SPUIAppService *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *appServiceQueue;
  uint64_t v8;
  SPXPCConnection *backgroundConnection;
  uint64_t v10;
  SPXPCConnection *appConnection;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD block[4];
  SPUIAppService *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SPUIAppService;
  v2 = -[SPUIAppService init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_awakeNotifyToken = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.searchd.appservice", v5);
    appServiceQueue = v3->_appServiceQueue;
    v3->_appServiceQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE84990]), "initWithServiceName:onQueue:", CFSTR("com.apple.searchd.background"), v3->_appServiceQueue);
    backgroundConnection = v3->_backgroundConnection;
    v3->_backgroundConnection = (SPXPCConnection *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE84990]), "initWithServiceName:onQueue:", CFSTR("com.apple.searchd"), v3->_appServiceQueue);
    appConnection = v3->_appConnection;
    v3->_appConnection = (SPXPCConnection *)v10;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[SPUIAppService init].cold.1((uint64_t)&v3->_backgroundConnection, v12, v13, v14, v15, v16, v17, v18);
    if (runningInSpotlight)
    {
      v19 = v3->_appServiceQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __22__SPUIAppService_init__block_invoke;
      block[3] = &unk_24DA1CF20;
      v22 = v3;
      dispatch_async(v19, block);

    }
  }
  return v3;
}

void __22__SPUIAppService_init__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  v2 = *(id *)(a1 + 32);
  SPSetAppUpdateBlock();
  v1 = (id)SPFastApplicationsGet();

}

void __22__SPUIAppService_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  sendAppsInfoWithData(*(void **)(*(_QWORD *)(a1 + 32) + 24), a2, a3);
}

- (void)activate
{
  NSObject *appServiceQueue;
  qos_class_t v4;
  dispatch_block_t v5;
  _QWORD block[5];

  if (!self->_activated)
  {
    self->_activated = 1;
    appServiceQueue = self->_appServiceQueue;
    v4 = qos_class_self();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__SPUIAppService_activate__block_invoke;
    block[3] = &unk_24DA1CF20;
    block[4] = self;
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
    dispatch_async(appServiceQueue, v5);

  }
}

void __26__SPUIAppService_activate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  SPFastApplicationsGetNoBuild();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SPFastHiddenAppsGetNoBuild();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  prepareApps(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84998]), "initWithName:", CFSTR("Activate"));
  v6 = v5;
  v7 = MEMORY[0x24BDBD1B8];
  if (v4)
    v8 = v4;
  else
    v8 = (void *)MEMORY[0x24BDBD1B8];
  objc_msgSend(v5, "setRootObject:", v8);
  objc_msgSend(v6, "setInfo:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sendMessage:withReply:", v6, &__block_literal_global_25);
  v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v9)
    __26__SPUIAppService_activate__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

}

void __26__SPUIAppService_activate__block_invoke_2()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v0)
    __26__SPUIAppService_activate__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)deactivate
{
  NSObject *appServiceQueue;
  dispatch_block_t v3;
  _QWORD block[5];

  if (self->_activated)
  {
    self->_activated = 0;
    appServiceQueue = self->_appServiceQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__SPUIAppService_deactivate__block_invoke;
    block[3] = &unk_24DA1CF20;
    block[4] = self;
    v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
    dispatch_async(appServiceQueue, v3);

  }
}

void __28__SPUIAppService_deactivate__block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84998]), "initWithName:", CFSTR("Deactivate"));
  objc_msgSend(v2, "setInfo:", 0);
  objc_msgSend(v2, "setRootObject:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sendMessage:", v2);
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v3)
    __28__SPUIAppService_deactivate__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConnection, 0);
  objc_storeStrong((id *)&self->_backgroundConnection, 0);
  objc_storeStrong((id *)&self->_appServiceQueue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_218DEA000, MEMORY[0x24BDACB70], a3, "App Connection: %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __26__SPUIAppService_activate__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_218DEA000, MEMORY[0x24BDACB70], a3, "activated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __26__SPUIAppService_activate__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_218DEA000, MEMORY[0x24BDACB70], a3, "Received activate reply", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __28__SPUIAppService_deactivate__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_218DEA000, MEMORY[0x24BDACB70], a3, "deactivated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
