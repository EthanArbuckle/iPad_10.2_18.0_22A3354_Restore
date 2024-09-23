@implementation BRCUserDefaultsManager

- (id)defaultsForIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  NSMutableDictionary *v7;
  BRCUserDefaults *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BRCUserDefaults *v12;
  void *v13;
  void *v14;
  void *v16;
  NSObject *v17;

  v4 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("default")))
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaultsManager defaultsForIdentifier:].cold.2();

  }
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("default");
  v6 = v5;
  v7 = self->_userDefaultsCache;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_userDefaultsCache, "objectForKeyedSubscript:", v6);
  v8 = (BRCUserDefaults *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!v4
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->_userDefaultsCache, "objectForKeyedSubscript:", CFSTR("default")), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BRCUserDefaultsManager defaultsForIdentifier:].cold.1();

    }
    v12 = [BRCUserDefaults alloc];
    -[NSDictionary objectForKeyedSubscript:](self->_serverConfigurationDict, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_userDefaultsCache, "objectForKeyedSubscript:", CFSTR("default"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BRCUserDefaults initWithServerConfiguration:globalUserDefaults:clientZoneIdentifier:](v12, "initWithServerConfiguration:globalUserDefaults:clientZoneIdentifier:", v13, v14, v4);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userDefaultsCache, "setObject:forKeyedSubscript:", v8, v6);
  }
  objc_sync_exit(v7);

  return v8;
}

- (void)_prepopulateGlobalUserDefaults
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_userDefaultsCache[kBRCGlobalUserDefaultsKey]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (BRCUserDefaultsManager)initWithPersonaID:(id)a3
{
  id v4;
  BRCUserDefaultsManager *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *userDefaultsCache;
  NSOperationQueue *v8;
  NSOperationQueue *downloadQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *callbackQueue;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *defaultsDidChangeNotificationObserver;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BRCUserDefaultsManager;
  v5 = -[BRCUserDefaultsManager init](&v25, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    userDefaultsCache = v5->_userDefaultsCache;
    v5->_userDefaultsCache = v6;

    -[BRCUserDefaultsManager _prepopulateGlobalUserDefaults](v5, "_prepopulateGlobalUserDefaults");
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    downloadQueue = v5->_downloadQueue;
    v5->_downloadQueue = v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_downloadQueue, "setMaxConcurrentOperationCount:", 1);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.bird.defaults-manager", v10);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.bird.defaults-manager-callback", v13);

    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BDD13F0];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke;
    v21[3] = &unk_24FE49420;
    v22 = v4;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v17, 0, 0, v21);
    v18 = objc_claimAutoreleasedReturnValue();
    defaultsDidChangeNotificationObserver = v5->_defaultsDidChangeNotificationObserver;
    v5->_defaultsDidChangeNotificationObserver = v18;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id *WeakRetained;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  uint8_t buf[24];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v4 = *(id *)(a1 + 32)) == 0)
  {
    if (BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personaOnceToken != -1)
      dispatch_once(&BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personaOnceToken, &__block_literal_global_60);
    v5 = (id)BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personalPersona;
    v6 = 1;
  }
  else
  {
    v5 = v4;
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  objc_msgSend(v8, "userPersonaUniqueString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == v5 || (objc_msgSend(v9, "isEqualToString:", v5) & 1) != 0)
  {
    v11 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v26 = 0;
    v16 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v26);
    v17 = v26;
    v18 = v27;
    v27 = v16;

    if (v17)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        -[_BRCOperation completedWithResult:error:].cold.1();

    }
    objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v29 = v21;
        _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_31:

    }
  }
  else
  {
    if (v6 && (objc_msgSend(v8, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v11 = 0;
      goto LABEL_31;
    }
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    memset(buf, 0, sizeof(buf));
    __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager initWithPersonaID:]_block_invoke", 300, buf);
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke_cold_1();

    v15 = WeakRetained[3];
    objc_sync_enter(v15);
    objc_msgSend(WeakRetained[3], "removeAllObjects");
    objc_msgSend(WeakRetained, "_prepopulateGlobalUserDefaults");
    objc_sync_exit(v15);

    __brc_leave_section((uint64_t *)buf);
  }

  _BRRestorePersona();
}

void __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personalPersona;
  BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personalPersona = v0;

}

- (void)_setServerConfigurationURL:(id)a3 whenLoaded:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id configurationPlistDidUpdateBlock;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id location[3];

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_serverConfigurationURL, a3);
  v9 = (void *)MEMORY[0x2348BA0DC](v8);
  configurationPlistDidUpdateBlock = self->_configurationPlistDidUpdateBlock;
  self->_configurationPlistDidUpdateBlock = v9;

  v11 = self->_userDefaultsCache;
  objc_sync_enter(v11);
  -[NSDictionary objectForKeyedSubscript:](self->_serverConfigurationDict, "objectForKeyedSubscript:", CFSTR("etag"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v11);
  if (v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCUserDefaultsManager _setServerConfigurationURL:whenLoaded:].cold.2();

  }
  else
  {
    memset(location, 0, sizeof(location));
    __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager _setServerConfigurationURL:whenLoaded:]", 347, location);
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCUserDefaultsManager _setServerConfigurationURL:whenLoaded:].cold.1();

    -[BRCUserDefaultsManager _loadServerConfigurationDictionary](self, "_loadServerConfigurationDictionary");
    __brc_leave_section((uint64_t *)location);
  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configurationUpdateXPCActivity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, self);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke;
  v23[3] = &unk_24FE49448;
  objc_copyWeak(&v24, location);
  v23[4] = self;
  v19 = v18;
  v20 = v23;
  v21 = v20;
  if (*MEMORY[0x24BE17830])
  {
    ((void (*)(_QWORD *))*MEMORY[0x24BE17830])(v20);
    v22 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v22;
  }
  xpc_activity_unregister("com.apple.bird.configuration-server-update");
  xpc_activity_register("com.apple.bird.configuration-server-update", v19, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(location);

}

void __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t v13[4];
  void *v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (xpc_activity_should_defer(v3))
  {
    if (xpc_activity_set_state(v3, 3))
      goto LABEL_14;
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (xpc_activity_get_state(v3) == 2)
  {
    buf = 0uLL;
    v16 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager _setServerConfigurationURL:whenLoaded:]_block_invoke", 367, &buf);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke_cold_1();

    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke_189;
    block[3] = &unk_24FE3FA18;
    block[4] = WeakRetained;
    dispatch_sync(v9, block);
    if (!xpc_activity_set_state(v3, 5))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done%@", v13, 0xCu);
      }

    }
    __brc_leave_section((uint64_t *)&buf);
  }
LABEL_14:

}

uint64_t __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke_189(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadServerConfigurationDictionary");
}

- (void)setServerConfigurationURL:(id)a3 whenLoaded:(id)a4
{
  id v6;
  id v7;
  NSObject *callbackQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BRCUserDefaultsManager_setServerConfigurationURL_whenLoaded___block_invoke;
  block[3] = &unk_24FE40A80;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(callbackQueue, block);

}

void __63__BRCUserDefaultsManager_setServerConfigurationURL_whenLoaded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BRCUserDefaultsManager_setServerConfigurationURL_whenLoaded___block_invoke_2;
  block[3] = &unk_24FE40A80;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_sync(v4, block);

}

uint64_t __63__BRCUserDefaultsManager_setServerConfigurationURL_whenLoaded___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setServerConfigurationURL:whenLoaded:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *queue;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t v26[3];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager URLSession:downloadTask:didFinishDownloadingToURL:]", 392, v26);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v28 = v26[0];
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx config: download task finished %@, plist %@%@", buf, 0x2Au);
  }

  v13 = (void *)MEMORY[0x24BDBCF48];
  +[BRCUserDefaults cachedServerConfigurationPath](BRCUserDefaults, "cachedServerConfigurationPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v17 = objc_msgSend(v16, "br_forceMoveItemAtURL:toURL:error:", v10, v15, &v25);
  v18 = v25;

  if ((v17 & 1) == 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      -[BRCUserDefaultsManager URLSession:downloadTask:didFinishDownloadingToURL:].cold.1();

  }
  queue = self->_queue;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __76__BRCUserDefaultsManager_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  v23[3] = &unk_24FE3FA40;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  dispatch_sync(queue, v23);

  __brc_leave_section(v26);
}

uint64_t __76__BRCUserDefaultsManager_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parsePlistWithURL:", *(_QWORD *)(a1 + 40));
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
  {
    v9 = 138412802;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_error_impl(&dword_230455000, v8, (os_log_type_t)0x90u, "[ERROR] config: session %@ become invalid: %@%@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a5;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD1308]))
    {
      if (objc_msgSend(v8, "code") == -1000)
      {

      }
      else
      {
        v12 = objc_msgSend(v8, "code");

        if (v12 != -1002)
        {
          v10 = 0;
          goto LABEL_14;
        }
      }
      objc_msgSend(v6, "originalRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "currentRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "isEqual:", v15))
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (URL %@)"), v9, v18);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (original URL: %@, current URL %@)"), v9, v15);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

LABEL_14:
    brc_bread_crumbs();
    v11 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      v17 = &stru_24FE4A790;
      *(_DWORD *)buf = 138413058;
      if (v10)
        v17 = v10;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v11;
      _os_log_error_impl(&dword_230455000, v16, (os_log_type_t)0x90u, "[ERROR] config: can't download task %@%@: %@%@", buf, 0x2Au);
    }

    goto LABEL_16;
  }
  brc_bread_crumbs();
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BRCUserDefaultsManager URLSession:task:didCompleteWithError:].cold.1();
LABEL_16:

}

- (void)loadCachedServerConfiguration
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Loaded cached server configuration %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_parsePlistWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSMutableDictionary *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *callbackQueue;
  void *v19;
  NSObject *v20;
  NSURL *serverConfigurationURL;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  NSURL *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_11:
    callbackQueue = self->_callbackQueue;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __45__BRCUserDefaultsManager__parsePlistWithURL___block_invoke;
    v22[3] = &unk_24FE3FA18;
    v22[4] = self;
    dispatch_async(callbackQueue, v22);
    goto LABEL_15;
  }
  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  if (v6)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_serverConfigurationDict, "objectForKeyedSubscript:", CFSTR("etag"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_5;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("etag"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_serverConfigurationDict, "objectForKeyedSubscript:", CFSTR("etag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if ((v11 & 1) == 0)
    {
LABEL_5:
      v12 = self->_userDefaultsCache;
      objc_sync_enter(v12);
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("etag"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCUserDefaultsManager _parsePlistWithURL:].cold.2(v15, (uint64_t)v13, buf, v14);
      }

      objc_storeStrong((id *)&self->_serverConfigurationDict, v6);
      -[NSMutableDictionary removeAllObjects](self->_userDefaultsCache, "removeAllObjects");
      -[BRCUserDefaultsManager _prepopulateGlobalUserDefaults](self, "_prepopulateGlobalUserDefaults");
      objc_sync_exit(v12);

    }
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCUserDefaultsManager _parsePlistWithURL:].cold.1();

    goto LABEL_11;
  }
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    serverConfigurationURL = self->_serverConfigurationURL;
    *(_DWORD *)buf = 138412802;
    v25 = serverConfigurationURL;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v19;
    _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] failed parsing plist at %@: %@%@", buf, 0x20u);
  }

LABEL_15:
}

uint64_t __45__BRCUserDefaultsManager__parsePlistWithURL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_loadServerConfigurationDictionary
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSOperationQueue *downloadQueue;
  NSURL *serverConfigurationURL;
  _QWORD v11[5];
  uint64_t v12[3];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  NSURL *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v12, 0, sizeof(v12));
  __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager _loadServerConfigurationDictionary]", 487, v12);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    serverConfigurationURL = self->_serverConfigurationURL;
    *(_DWORD *)buf = 134218498;
    v14 = v12[0];
    v15 = 2112;
    v16 = serverConfigurationURL;
    v17 = 2112;
    v18 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx config: asynchronously loading %@%@", buf, 0x20u);
  }

  if (-[NSURL isFileURL](self->_serverConfigurationURL, "isFileURL"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = (uint64_t)v5;
      _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] loading iCloud Drive configuration from disk%@", buf, 0xCu);
    }

    -[BRCUserDefaultsManager _parsePlistWithURL:](self, "_parsePlistWithURL:", self->_serverConfigurationURL);
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = (uint64_t)v7;
      _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading iCloud Drive configuration%@", buf, 0xCu);
    }

    downloadQueue = self->_downloadQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__BRCUserDefaultsManager__loadServerConfigurationDictionary__block_invoke;
    v11[3] = &unk_24FE3FA18;
    v11[4] = self;
    -[NSOperationQueue addOperationWithBlock:](downloadQueue, "addOperationWithBlock:", v11);
  }
  __brc_leave_section(v12);
}

void __60__BRCUserDefaultsManager__loadServerConfigurationDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (v3)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDD17C8], "brc_currentCachesDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDB74B8], "backgroundSessionConfigurationWithIdentifier:", CFSTR("fetch-configuration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHTTPCookieStorage:", 0);
    objc_msgSend(v5, "setURLCredentialStorage:", 0);
    objc_msgSend(v5, "setURLCache:", 0);
    objc_msgSend(v5, "setDiscretionary:", 1);
    objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:delegate:delegateQueue:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v6;

  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (v3)
  {
LABEL_5:
    objc_msgSend(v3, "downloadTaskWithURL:", *(_QWORD *)(v2 + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __60__BRCUserDefaultsManager__loadServerConfigurationDictionary__block_invoke_cold_1();

    objc_msgSend(v9, "resume");
  }
}

- (void)_reset
{
  NSDictionary *serverConfigurationDict;
  NSURL *serverConfigurationURL;
  NSMutableDictionary *obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  obj = self->_userDefaultsCache;
  objc_sync_enter(obj);
  serverConfigurationDict = self->_serverConfigurationDict;
  self->_serverConfigurationDict = 0;

  serverConfigurationURL = self->_serverConfigurationURL;
  self->_serverConfigurationURL = 0;

  -[NSMutableDictionary removeAllObjects](self->_userDefaultsCache, "removeAllObjects");
  -[BRCUserDefaultsManager _prepopulateGlobalUserDefaults](self, "_prepopulateGlobalUserDefaults");
  objc_sync_exit(obj);

}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__BRCUserDefaultsManager_reset__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __31__BRCUserDefaultsManager_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_defaultsDidChangeNotificationObserver);

  v4.receiver = self;
  v4.super_class = (Class)BRCUserDefaultsManager;
  -[BRCUserDefaultsManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong(&self->_configurationPlistDidUpdateBlock, 0);
  objc_storeStrong((id *)&self->_userDefaultsCache, 0);
  objc_storeStrong((id *)&self->_serverConfigurationDict, 0);
  objc_storeStrong((id *)&self->_serverConfigurationURL, 0);
}

void __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] ┏%llx defaults changed%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)defaultsForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: clientZoneIdentifier && _userDefaultsCache[kBRCGlobalUserDefaultsKey]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)defaultsForIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![clientZoneIdentifier isEqualToString:kBRCGlobalUserDefaultsKey]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_setServerConfigurationURL:whenLoaded:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] ┏%llx config: initial load%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_setServerConfigurationURL:whenLoaded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] config: not updating the configuration, waiting for next activity callback%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] ┏%llx config: it's activity time%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)URLSession:downloadTask:didFinishDownloadingToURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] config: failed to move downloaded cache file into place %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] config: download finished for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_parsePlistWithURL:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] config: Loaded server configuration from %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_parsePlistWithURL:(uint8_t *)buf .cold.2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Server configuration changed to etag %@%@", buf, 0x16u);

}

void __60__BRCUserDefaultsManager__loadServerConfigurationDictionary__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] scheduling config download %@%@");
  OUTLINED_FUNCTION_0();
}

@end
