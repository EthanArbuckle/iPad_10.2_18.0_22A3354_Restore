@implementation _LTDDaemon

+ (void)initialize
{
  objc_opt_class();
}

+ (id)buildDateWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "attributesOfItemAtPath:error:", v10, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  if (a3 && v12)
  {
    v13 = 0;
    *a3 = objc_retainAutorelease(v12);
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0C98]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0C58]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

- (_LTDDaemon)init
{
  _LTDDaemon *v2;
  uint64_t v3;
  NSMutableArray *connections;
  _LTTranslationServer *v5;
  _LTTranslationServer *server;
  dispatch_queue_t v7;
  OS_dispatch_queue *listenerQueue;
  void *v9;
  _LTDDaemon *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_LTDDaemon;
  v2 = -[_LTDDaemon init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v3;

    v5 = objc_alloc_init(_LTTranslationServer);
    server = v2->_server;
    v2->_server = v5;

    +[_LTDAssetService setCleanupScheduler:](_LTDAssetService, "setCleanupScheduler:", v2->_server);
    v7 = dispatch_queue_create("com.apple.translation.daemon.listener", 0);
    listenerQueue = v2->_listenerQueue;
    v2->_listenerQueue = (OS_dispatch_queue *)v7;

    +[_LTDAssetService bootstrapWithCompletion:](_LTDAssetService, "bootstrapWithCompletion:", 0);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerDefaults:", &unk_251A509C0);

    v10 = v2;
  }

  return v2;
}

- (void)run
{
  NSObject *v3;
  NSObject *v4;
  int *v5;
  char *v6;
  NSXPCListener *v7;
  NSXPCListener *translationListener;
  NSXPCListener *v9;
  NSXPCListener *textTranslationListener;
  void *v11;
  int v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v3 = _LTOSLogSandbox();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = __error();
      v6 = strerror(*v5);
      v12 = 136446210;
      v13 = v6;
      _os_log_error_impl(&dword_2491B9000, v4, OS_LOG_TYPE_ERROR, "Failed to set user dir suffix: %{public}s", (uint8_t *)&v12, 0xCu);

    }
  }
  -[_LTDDaemon _enterSandbox](self, "_enterSandbox");
  -[_LTDDaemon _setupMemoryWarningListener](self, "_setupMemoryWarningListener");
  v7 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.translationd"));
  translationListener = self->_translationListener;
  self->_translationListener = v7;

  -[NSXPCListener _setQueue:](self->_translationListener, "_setQueue:", self->_listenerQueue);
  -[NSXPCListener setDelegate:](self->_translationListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_translationListener, "resume");
  v9 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.translation.text"));
  textTranslationListener = self->_textTranslationListener;
  self->_textTranslationListener = v9;

  -[NSXPCListener _setQueue:](self->_textTranslationListener, "_setQueue:", self->_listenerQueue);
  -[NSXPCListener setDelegate:](self->_textTranslationListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_textTranslationListener, "resume");
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "run");

  exit(1);
}

- (void)_setupMemoryWarningListener
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41___LTDDaemon__setupMemoryWarningListener__block_invoke;
  v2[3] = &unk_251A111A0;
  objc_copyWeak(&v3, &location);
  if (_setupMemoryWarningListener_once != -1)
    dispatch_once(&_setupMemoryWarningListener_once, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (id)_cacheDirectoryPath
{
  NSObject *v3;
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!confstr(65538, v4, 0x400uLL))
  {
    v3 = _LTOSLogSandbox();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[_LTDDaemon _cacheDirectoryPath].cold.1(v3);
    exit(1);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *translationListener;
  void *v9;
  char v10;
  _LTClientConnection *v11;
  BOOL v12;
  NSObject *v13;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_listenerQueue);
  translationListener = self->_translationListener;
  if (translationListener != v6)
  {
    if (self->_textTranslationListener == v6)
      goto LABEL_5;
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.private.translation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) == 0)
  {
    v13 = _LTOSLogXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_LTDDaemon listener:shouldAcceptNewConnection:].cold.1(v13, v7);
    goto LABEL_8;
  }
LABEL_5:
  v11 = -[_LTClientConnection initWithConnection:server:trusted:]([_LTClientConnection alloc], "initWithConnection:server:trusted:", v7, self->_server, translationListener == v6);
  -[_LTClientConnection setDelegate:](v11, "setDelegate:", self);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v11);
  objc_msgSend(v7, "resume");

  v12 = 1;
LABEL_9:

  return v12;
}

- (void)clientConnectionClosed:(id)a3
{
  id v4;
  NSObject *listenerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  listenerQueue = self->_listenerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37___LTDDaemon_clientConnectionClosed___block_invoke;
  block[3] = &unk_251A10FD0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(listenerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (id)realPathFor:(id)a3 error:(id *)a4
{
  char *v5;
  char *v6;
  void *v7;

  v5 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_textTranslationListener, 0);
  objc_storeStrong((id *)&self->_translationListener, 0);
}

- (void)_cacheDirectoryPath
{
  NSObject *v1;
  int *v2;
  char *v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = __error();
  v3 = strerror(*v2);
  v4 = 136446210;
  v5 = v3;
  _os_log_error_impl(&dword_2491B9000, v1, OS_LOG_TYPE_ERROR, "Failed to get cache directory: %{public}s", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_9();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4[0] = 67109378;
  v4[1] = objc_msgSend(a2, "processIdentifier");
  v5 = 2114;
  v6 = CFSTR("com.apple.private.translation");
  _os_log_error_impl(&dword_2491B9000, v3, OS_LOG_TYPE_ERROR, "Rejected Translation client with PID %d lacking the appropriate entitlement (%{public}@).", (uint8_t *)v4, 0x12u);

  OUTLINED_FUNCTION_9();
}

@end
