@implementation BRCXPCClient

- (id)_entitlementValueForKey:(id)a3 ofClass:(Class)a4
{
  NSXPCConnection **p_connection;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  p_connection = &self->_connection;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_personaMonitorCounts, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_appLibraries, 0);
  objc_storeStrong((id *)&self->_foregroundBackgroundHandlingQueue, 0);
  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, 0);
  objc_storeStrong((id *)&self->__session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)setSession:(id)a3
{
  BRCAccountSessionFPFS *v5;
  BRCXPCClient *v6;
  BRCAccountSessionFPFS *session;
  void **p_session;
  void *v9;
  void *v10;
  NSObject *v11;

  v5 = (BRCAccountSessionFPFS *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if ((*((_BYTE *)v6 + 32) & 1) == 0)
  {
    p_session = (void **)&v6->__session;
    session = v6->__session;
    if (session != v5)
    {
      -[BRCAccountSessionFPFS unregisterClient:](session, "unregisterClient:", v6);
      if (!v5)
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BRCXPCClient setSession:].cold.1();

      }
      objc_storeStrong((id *)&v6->__session, a3);
      if (!-[BRCAccountSessionFPFS registerClient:](v6->__session, "registerClient:", v6))
      {
        v9 = *p_session;
        *p_session = 0;

      }
    }
  }
  objc_sync_exit(v6);

}

- (void)setPrivilegesDescriptor:(id)a3
{
  id v5;
  BRCClientPrivilegesDescriptor *clientPriviledgesDescriptor;
  id WeakRetained;

  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, a3);
  v5 = a3;
  clientPriviledgesDescriptor = self->_clientPriviledgesDescriptor;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "setUserInfo:", clientPriviledgesDescriptor);

}

- (BRCXPCClient)initWithConnection:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BRCXPCClient;
  v5 = -[BRCXPCClient init](&v24, sel_init);
  if (v5)
  {
    if (initWithConnection__onceToken != -1)
      dispatch_once(&initWithConnection__onceToken, &__block_literal_global_56);
    brc_task_tracker_create("XPC Client task tracker");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    objc_storeWeak((id *)v5 + 15, v4);
    *((_DWORD *)v5 + 18) = objc_msgSend(v4, "processIdentifier");
    if (v4)
    {
      objc_msgSend(v4, "auditToken");
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
    }
    *(_OWORD *)(v5 + 76) = v22;
    *(_OWORD *)(v5 + 92) = v23;
    v8 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    v9 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v8;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("xpc-client-queue-%d"), *((unsigned int *)v5 + 18));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = initWithConnection__xpcWorkloop;
    dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create_with_target_V2(v11, v14, v13);

    v16 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v15;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("foreground-background-handling", v18);

    v20 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v19;

  }
  return (BRCXPCClient *)v5;
}

- (BRCAccountSessionFPFS)session
{
  return self->__session;
}

- (void)invalidate
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id WeakRetained;
  BRCXPCClient *obj;
  id *obja;
  uint64_t v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  BRCXPCClient *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  obj = self;
  objc_sync_enter(obj);
  if ((*((_BYTE *)obj + 32) & 1) != 0)
  {
    objc_sync_exit(obj);

    return;
  }
  *((_BYTE *)obj + 32) |= 1u;
  brc_task_tracker_cancel(obj->_tracker);
  -[BRCXPCClient session](obj, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(obj);

  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCXPCClient invalidate]", 331, v15);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v17 = v15[0];
    v18 = 2112;
    v19 = obj;
    v20 = 2112;
    v21 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx invalidating connection with %@%@", buf, 0x20u);
  }

  -[BRCXPCClient _stopMonitoringProcess](obj, "_stopMonitoringProcess");
  objc_msgSend(v2, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pipeDelegateInvalidated:", obj);

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "fpfsUploadV2"))
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  -[BRCXPCClient bundleID](obj, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")))
  {

LABEL_10:
    objc_msgSend(v2, "personaIdentifier", obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUploadSyncUpRequestsManager defaultManagerWithPersonaIdentifier:](BRCUploadSyncUpRequestsManager, "defaultManagerWithPersonaIdentifier:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", obj->_clientPid);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateRequestsOfClient:", v11);

LABEL_11:
    goto LABEL_12;
  }
  -[BRCXPCClient bundleID](obj, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));

  if (v9)
    goto LABEL_10;
LABEL_12:
  objc_msgSend(v2, "unregisterClient:", obj, obj);
  objc_msgSend(obja[8], "cancelAllOperations");
  WeakRetained = objc_loadWeakRetained(obja + 15);
  objc_msgSend(WeakRetained, "invalidate");

  __brc_leave_section(v15);
}

- (void)_stopMonitoringProcess
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] stop monitoring %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)process:(int)a3 didBecomeForeground:(BOOL)a4
{
  void *v4;
  void *v5;

  -[BRCXPCClient session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BRPerformWithPersonaAndError();

}

- (void)_process:(int)a3 didBecomeForeground:(BOOL)a4
{
  NSObject *foregroundBackgroundHandlingQueue;
  _QWORD v5[5];
  BOOL v6;

  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__BRCXPCClient__process_didBecomeForeground___block_invoke;
  v5[3] = &unk_24FE41910;
  v5[4] = self;
  v6 = a4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, v5);
}

void __44__BRCXPCClient_process_didBecomeForeground___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;

  if (a2)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __44__BRCXPCClient_process_didBecomeForeground___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_process:didBecomeForeground:", *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
  }
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) & 1) == *(_BYTE *)(a1 + 40))
  {
    v2 = 0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 40))
    {
      brc_bread_crumbs();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_2();
    }
    else
    {
      brc_bread_crumbs();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_1();
    }

    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) & 0xFE | *(_BYTE *)(a1 + 40);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(a1 + 40))
          objc_msgSend(v10, "addForegroundClient:", v11);
        else
          objc_msgSend(v10, "removeForegroundClient:", v11, (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (NSString)bundleID
{
  BRCXPCClient *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[BRCClientPrivilegesDescriptor applicationIdentifier](v2->_clientPriviledgesDescriptor, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v3;
}

void __33__BRCXPCClient_removeAppLibrary___block_invoke(uint64_t a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 32) & 1) == 0)
  {
    v3 = *(_BYTE *)(v1 + 109);
    v4 = objc_msgSend(*(id *)(v1 + 56), "countForObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = "YES";
      v14 = 138413058;
      if (v4 == 1)
        v11 = "YES";
      else
        v11 = "NO";
      v15 = v9;
      v16 = 2080;
      if ((v3 & 1) == 0)
        v10 = "NO";
      v17 = v11;
      v18 = 2080;
      v19 = v10;
      v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - shouldNotify: %s, isForeground: %s%@", (uint8_t *)&v14, 0x2Au);
    }

    if ((v3 & 1) != 0 && v4 == 1)
    {
      brc_bread_crumbs();
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "logName");
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        v18 = 2112;
        v19 = v7;
        _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - is no longer monitoring %@%@", (uint8_t *)&v14, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "removeForegroundClient:", *(_QWORD *)(a1 + 32));
    }
  }
}

void __30__BRCXPCClient_addAppLibrary___block_invoke(uint64_t a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 32) & 1) == 0)
  {
    v3 = *(_BYTE *)(v1 + 109);
    objc_msgSend(*(id *)(v1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "countForObject:", *(_QWORD *)(a1 + 40));
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = "YES";
      v14 = 138413058;
      if (v4 == 1)
        v11 = "YES";
      else
        v11 = "NO";
      v15 = v9;
      v16 = 2080;
      if ((v3 & 1) == 0)
        v10 = "NO";
      v17 = v11;
      v18 = 2080;
      v19 = v10;
      v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - shouldNotify: %s, isForeground: %s%@", (uint8_t *)&v14, 0x2Au);
    }

    if ((v3 & 1) != 0 && v4 == 1)
    {
      brc_bread_crumbs();
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "logName");
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        v18 = 2112;
        v19 = v7;
        _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - is now monitoring %@%@", (uint8_t *)&v14, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "addForegroundClient:", *(_QWORD *)(a1 + 32));
    }
  }
}

- (void)removeAppLibrary:(id)a3
{
  id v4;
  NSObject *foregroundBackgroundHandlingQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__BRCXPCClient_removeAppLibrary___block_invoke;
  block[3] = &unk_24FE3FA40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, block);

}

- (void)addAppLibrary:(id)a3
{
  id v4;
  NSObject *foregroundBackgroundHandlingQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__BRCXPCClient_addAppLibrary___block_invoke;
  block[3] = &unk_24FE3FA40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, block);
  -[BRCXPCClient _startMonitoringProcessIfNeeded](self, "_startMonitoringProcessIfNeeded");

}

- (void)_startMonitoringProcessIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] starting monitoring %@%@");
  OUTLINED_FUNCTION_0();
}

- (BOOL)_isAutomationEntitled
{
  BRCXPCClient *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BRCClientPrivilegesDescriptor isAutomationEntitled](v2->_clientPriviledgesDescriptor, "isAutomationEntitled");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_entitlementBooleanValueForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BRCXPCClient _entitlementValueForKey:ofClass:](self, "_entitlementValueForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (id)_getCloudDocsUnsupportedError
{
  return 0;
}

void __35__BRCXPCClient_initWithConnection___block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("xpc-client-workloop");
  v1 = (void *)initWithConnection__xpcWorkloop;
  initWithConnection__xpcWorkloop = (uint64_t)v0;

}

- (void)wait
{
  brc_task_tracker_wait((uint64_t)self->_tracker);
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_operationQueue, "waitUntilAllOperationsAreFinished");
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  BRCXPCClient *v5;
  void *v6;

  -[BRCXPCClient session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = &stru_24FE4A790;
  else
    v4 = CFSTR(" (Logged out)");
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5->_clientPriviledgesDescriptor, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return (NSString *)v6;
}

- (void)dumpToContext:(id)a3
{
  BRCXPCClient *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "writeLineWithFormat:", CFSTR(" o %@"), v4);
  objc_sync_exit(v4);

}

- (void)addOperation:(id)a3
{
  BRCXPCClient *v4;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v6;
  NSOperationQueue *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
    objc_msgSend(v12, "cancel");
  operationQueue = v4->_operationQueue;
  if (!operationQueue)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v7 = v4->_operationQueue;
    v4->_operationQueue = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("misc-operations", v9);

    -[NSOperationQueue setUnderlyingQueue:](v4->_operationQueue, "setUnderlyingQueue:", v10);
    operationQueue = v4->_operationQueue;
  }
  -[NSOperationQueue addOperation:](operationQueue, "addOperation:", v12);
  objc_sync_exit(v4);

  -[BRCXPCClient session](v4, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addMiscOperation:", v12);

}

- (BOOL)checkTCCAccess
{
  BRCXPCClient *v2;
  void *v3;

  v2 = self;
  -[BRCXPCClient session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[BRCXPCClient checkTCCAccessForSession:](v2, "checkTCCAccessForSession:", v3);

  return (char)v2;
}

- (BOOL)checkTCCAccessForSession:(id)a3
{
  return 1;
}

- (void)notificationPipe:(id)a3 willObserveAppLibrary:(id)a4
{
  -[BRCXPCClient addAppLibrary:](self, "addAppLibrary:", a4);
}

- (void)notificationPipe:(id)a3 didObserveAppLibrary:(id)a4
{
  -[BRCXPCClient removeAppLibrary:](self, "removeAppLibrary:", a4);
}

- (char)cloudEnabledStatus
{
  BRCXPCClient *v2;
  BRCClientPrivilegesDescriptor *clientPriviledgesDescriptor;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  clientPriviledgesDescriptor = v2->_clientPriviledgesDescriptor;
  -[BRCXPCClient session](v2, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(clientPriviledgesDescriptor) = -[BRCClientPrivilegesDescriptor cloudEnabledStatusWithHasSession:](clientPriviledgesDescriptor, "cloudEnabledStatusWithHasSession:", v4 != 0);

  objc_sync_exit(v2);
  return (char)clientPriviledgesDescriptor;
}

- (BOOL)_hasAccessToAppLibraryID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v14;
  id v15;
  __int16 v16;
  BRCXPCClient *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[BRCXPCClient _isAppLibraryProxyEntitled](self, "_isAppLibraryProxyEntitled"))
    goto LABEL_12;
  if (!-[BRCXPCClient isSandboxed](self, "isSandboxed") && -[BRCXPCClient checkTCCAccess](self, "checkTCCAccess"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] granting access to %@ for non-sandboxed app %@%@", (uint8_t *)&v14, 0x20u);
    }

    goto LABEL_12;
  }
  -[BRCXPCClient entitledAppLibraryIDs](self, "entitledAppLibraryIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    if (!v6
      || (objc_msgSend(v6, "appLibraryOrZoneName"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "containsObject:", v10),
          v10,
          v11))
    {
      if (-[BRCXPCClient cloudEnabledStatus](self, "cloudEnabledStatus") == 1)
      {

LABEL_12:
        v12 = 1;
        goto LABEL_16;
      }
    }
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 1, CFSTR("Not entitled to access container"));
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (BOOL)_canCreateAppLibraryWithID:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (!-[BRCXPCClient _isAppLibraryProxyEntitled](self, "_isAppLibraryProxyEntitled"))
  {
    -[BRCXPCClient entitledAppLibraryIDs](self, "entitledAppLibraryIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v6, "appLibraryOrZoneName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9
        && objc_msgSend(v8, "containsObject:", v9)
        && -[BRCXPCClient cloudEnabledStatus](self, "cloudEnabledStatus") == 1)
      {

        v7 = 1;
LABEL_12:

        goto LABEL_13;
      }

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 1, CFSTR("Not entitled to create container"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    goto LABEL_12;
  }
  v7 = 1;
LABEL_13:

  return v7;
}

- (BOOL)_isAppLibraryProxyWithError:(id *)a3
{
  BOOL result;
  void *v6;
  NSObject *v7;
  id v8;

  if (-[BRCXPCClient _isAppLibraryProxyEntitled](self, "_isAppLibraryProxyEntitled")
    || !-[BRCXPCClient isSandboxed](self, "isSandboxed") && -[BRCXPCClient checkTCCAccess](self, "checkTCCAccess"))
  {
    return 1;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    -[BRCXPCClient _isAppLibraryProxyWithError:].cold.1();

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 1, CFSTR("Not a container proxy"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v8;
  return result;
}

- (BOOL)_hasPrivateIPCEntitlementForSelector:(SEL)a3 error:(id *)a4
{
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  BRCXPCClient *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[BRCXPCClient _isAutomationEntitled](self, "_isAutomationEntitled"))
    return 1;
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCXPCClient _entitlementValueForKey:ofClass:](self, "_entitlementValueForKey:ofClass:", *MEMORY[0x24BE173F0], objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "containsObject:", v8);
  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] %@: is trying to call %@, but has no access%@", buf, 0x20u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 1, CFSTR("Not entitled to access: %@"), v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (BRMangledID)defaultMangledID
{
  BRCXPCClient *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[BRCClientPrivilegesDescriptor defaultAppLibraryID](v2->_clientPriviledgesDescriptor, "defaultAppLibraryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BE17640]);
    -[BRCClientPrivilegesDescriptor defaultAppLibraryID](v2->_clientPriviledgesDescriptor, "defaultAppLibraryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithAppLibraryName:", v5);

  }
  else
  {
    v6 = 0;
  }

  objc_sync_exit(v2);
  return (BRMangledID *)v6;
}

- (NSSet)entitledAppLibraryIDs
{
  BRCXPCClient *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[BRCClientPrivilegesDescriptor appLibraryIDs](v2->_clientPriviledgesDescriptor, "appLibraryIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)_isAppLibraryProxyEntitled
{
  BRCXPCClient *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BRCClientPrivilegesDescriptor isProxyEntitled](v2->_clientPriviledgesDescriptor, "isProxyEntitled");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasPrivateSharingInterfaceEntitlement
{
  BRCXPCClient *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BRCClientPrivilegesDescriptor isSharingPrivateInterfaceEntitled](v2->_clientPriviledgesDescriptor, "isSharingPrivateInterfaceEntitled");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSandboxed
{
  return 1;
}

- (void)_auditURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  BRCXPCClient *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "br_isSideFaultName"))
  {
LABEL_6:

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0);

  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      objc_msgSend(v4, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_230455000, v7, (os_log_type_t)0x90u, "[ERROR] Client %@ gave us a non-existing fault URL path %@%@", (uint8_t *)&v9, 0x20u);

    }
    goto LABEL_6;
  }
LABEL_7:

}

- (id)_auditedURLFromPath:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCXPCClient _auditURL:](self, "_auditURL:", v4);
  return v4;
}

- (BOOL)canAccessPath:(const char *)a3 accessKind:(int64_t)a4
{
  __int128 v7;
  int v8;
  __int128 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  const char *v18;
  _BYTE buf[32];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = *(_OWORD *)&self->auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->auditToken.val;
  *(_OWORD *)&buf[16] = v7;
  v18 = a3;
  v8 = sandbox_check_by_audit_token();
  if (!a4 && !v8)
  {
    v9 = *(_OWORD *)&self->auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->auditToken.val;
    *(_OWORD *)&buf[16] = v9;
    v18 = a3;
    if (sandbox_check_by_audit_token())
      goto LABEL_4;
LABEL_9:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (!v8)
    goto LABEL_9;
LABEL_4:
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (!v10)
    return v10;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) != 0)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v14;
      v16 = "[DEBUG] %@: denied access to %s%@";
LABEL_14:
      _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0x20u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v14;
      v16 = "[DEBUG] %@: file doesn't exist at path: %s%@";
      goto LABEL_14;
    }
  }

  LOBYTE(v10) = 0;
  return v10;
}

- (void)performBlockWithAnySession:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void (**v6)(_QWORD);
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(_QWORD))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__48;
  v14 = __Block_byref_object_dispose__48;
  -[BRCXPCClient session](self, "session");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v11[5])
  {
    v4[2](v4);
  }
  else
  {
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__BRCXPCClient_performBlockWithAnySession___block_invoke;
    v7[3] = &unk_24FE48728;
    v9 = &v10;
    v6 = v4;
    v8 = v6;
    objc_msgSend(v5, "enumerateAccountHandlers:", v7);

    if (!v11[5])
      ((void (*)(void (**)(_QWORD), _QWORD))v6[2])(v6, 0);

  }
  _Block_object_dispose(&v10, 8);

}

void __43__BRCXPCClient_performBlockWithAnySession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v8 = v3;
    objc_msgSend(v3, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v8;
    if (v4)
    {
      objc_msgSend(v8, "session");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v3 = v8;
    }
  }

}

- (void)_becameXPCCLientOfSession:(id)a3
{
  BRCAccountSessionFPFS *v4;
  BRCXPCClient *v5;
  NSMutableDictionary *personaMonitorCounts;
  uint64_t v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v4 = (BRCAccountSessionFPFS *)a3;
  v5 = self;
  objc_sync_enter(v5);
  personaMonitorCounts = v5->_personaMonitorCounts;
  if (!personaMonitorCounts)
  {
    v7 = objc_opt_new();
    v8 = v5->_personaMonitorCounts;
    v5->_personaMonitorCounts = (NSMutableDictionary *)v7;

    personaMonitorCounts = v5->_personaMonitorCounts;
  }
  -[BRCAccountSessionFPFS personaIdentifier](v4, "personaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](personaMonitorCounts, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "longLongValue");
  v12 = v11;
  if (v11 < 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCXPCClient _becameXPCCLientOfSession:].cold.1();

  }
  else if (!v11 && v5->__session != v4)
  {
    -[BRCAccountSessionFPFS registerClient:](v4, "registerClient:", v5);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v12 + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5->_personaMonitorCounts;
  -[BRCAccountSessionFPFS personaIdentifier](v4, "personaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  objc_sync_exit(v5);
}

- (void)_finishedXPCClientOfSession:(id)a3
{
  BRCAccountSessionFPFS *v4;
  BRCXPCClient *v5;
  NSMutableDictionary *personaMonitorCounts;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v4 = (BRCAccountSessionFPFS *)a3;
  v5 = self;
  objc_sync_enter(v5);
  personaMonitorCounts = v5->_personaMonitorCounts;
  -[BRCAccountSessionFPFS personaIdentifier](v4, "personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](personaMonitorCounts, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "longLongValue");
  v10 = v9;
  if (v9 <= 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      -[BRCAccountSessionFPFS personaIdentifier](v4, "personaIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCXPCClient _finishedXPCClientOfSession:].cold.1(v15, (uint64_t)v13, (uint64_t)v19);
    }

    goto LABEL_8;
  }
  if (v9 != 1)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v10 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5->_personaMonitorCounts;
    -[BRCAccountSessionFPFS personaIdentifier](v4, "personaIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

    goto LABEL_9;
  }
  v11 = v5->_personaMonitorCounts;
  -[BRCAccountSessionFPFS personaIdentifier](v4, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v12);

  if (v5->__session != v4)
    -[BRCAccountSessionFPFS unregisterClient:](v4, "unregisterClient:", v5);
LABEL_9:

  objc_sync_exit(v5);
}

- (BOOL)canAccessPhysicalURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LOBYTE(self) = -[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", objc_msgSend(v4, "fileSystemRepresentation"), 0);

  return (char)self;
}

- (id)issueContainerExtensionForURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)*MEMORY[0x24BE17338];
  v6 = a3;
  objc_msgSend(v6, "brc_issueSandboxExtensionOfClass:error:", objc_msgSend(v5, "UTF8String"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_setupAppLibrary:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  brc_task_tracker *tracker;
  id v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__48;
  v21 = __Block_byref_object_dispose__48;
  v22 = 0;
  v7 = MEMORY[0x24BDAC760];
  tracker = self->_tracker;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__BRCXPCClient__setupAppLibrary_error___block_invoke;
  v13[3] = &unk_24FE48750;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v15 = &v17;
  v16 = a4;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __39__BRCXPCClient__setupAppLibrary_error___block_invoke_79;
  v12[3] = &__block_descriptor_40_e5_v8__0l;
  v12[4] = a4;
  brc_task_tracker_sync(tracker, v13, v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __39__BRCXPCClient__setupAppLibrary_error___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id *v13;
  uint64_t v14;
  const char *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_canCreateAppLibraryWithID:error:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v5);
  else
    objc_msgSend(v3, "appLibraryByMangledID:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v9 = "create";
    if (!v2)
      v9 = "load";
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:description:", 1, CFSTR("can't %s app library for %@"), v9, *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v14 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        if (v14)
          v15 = "(passed to caller)";
        else
          v15 = "(ignored by caller)";
        v17 = "-[BRCXPCClient _setupAppLibrary:error:]_block_invoke";
        v18 = 2080;
        v19 = v15;
        v20 = 2112;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        _os_log_error_impl(&dword_230455000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    v13 = *(id **)(a1 + 56);
    if (v13)
      objc_storeStrong(v13, v10);

  }
}

void __39__BRCXPCClient__setupAppLibrary_error___block_invoke_79(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id *v5;
  uint64_t v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorOperationCancelled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 136315906;
      if (v6)
        v7 = "(passed to caller)";
      else
        v7 = "(ignored by caller)";
      v9 = "-[BRCXPCClient _setupAppLibrary:error:]_block_invoke";
      v10 = 2080;
      v11 = v7;
      v12 = 2112;
      v13 = v2;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_230455000, v4, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v8, 0x2Au);
    }

  }
  v5 = *(id **)(a1 + 32);
  if (v5)
    objc_storeStrong(v5, v2);

}

- (void)_waitForContainerToBeForcedIngestWithContainerID:(id)a3 containerURL:(id)a4 sandboxExtension:(id)a5 bundleVersion:(id)a6 error:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, id, id, id, id);
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  BRCXPCClient *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, id, id, id, id))a8;
  if (v15)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[BRCXPCClient _waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:].cold.2();

    -[BRCXPCClient session](self, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appLibraryByID:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "waitForRootIngestion");
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413570;
        v37 = self;
        v38 = 2112;
        v39 = v15;
        v40 = 2112;
        v41 = v16;
        v42 = 2112;
        v43 = v17;
        v44 = 2112;
        v45 = v18;
        v46 = 2112;
        v47 = v24;
        _os_log_impl(&dword_230455000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
      }

      v19[2](v19, v15, v16, v17, v18);
    }
    else
    {
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[BRCXPCClient _waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:].cold.1();
      v35 = v16;

      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("containerID"), v14);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v37 = self;
        v38 = 2112;
        v39 = 0;
        v40 = 2112;
        v41 = 0;
        v42 = 2112;
        v43 = 0;
        v44 = 2112;
        v45 = v33;
        v46 = 2112;
        v47 = v31;
        _os_log_impl(&dword_230455000, v32, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);

      }
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("containerID"), v14);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, 0, 0, v34);

      v16 = v35;
    }
  }
  else
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("containerID"), v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v37 = self;
      v38 = 2112;
      v39 = 0;
      v40 = 2112;
      v41 = 0;
      v42 = 2112;
      v43 = 0;
      v44 = 2112;
      v45 = v28;
      v46 = 2112;
      v47 = v26;
      _os_log_impl(&dword_230455000, v27, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("containerID"), v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, 0, 0, 0, v23);
  }

}

- (void)_setupAppLibraryAndZoneWithID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD block[5];
  id v25;
  id location;
  uint8_t buf[4];
  BRCXPCClient *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  location = 0;
  v9 = a5;
  -[BRCXPCClient _setupAppLibrary:error:](self, "_setupAppLibrary:error:", v8, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v6)
    {
      -[BRCXPCClient session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientTruthWorkloop");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke;
      block[3] = &unk_24FE3FA40;
      block[4] = self;
      v25 = v10;
      dispatch_async_and_wait(v12, block);

    }
    objc_msgSend(v10, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BRCXPCClient canAccessPhysicalURL:](self, "canAccessPhysicalURL:", v13))
    {
      v14 = 0;
    }
    else
    {
      obj = location;
      -[BRCXPCClient issueContainerExtensionForURL:error:](self, "issueContainerExtensionForURL:error:", v13, &obj);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(&location, obj);
      if (!v14)
      {

        v13 = 0;
      }
    }
    objc_msgSend(v10, "containerMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCXPCClient bundleID](self, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "versionNumberForBundleIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCXPCClient addAppLibrary:](self, "addAppLibrary:", v10);
    objc_msgSend(v8, "appLibraryOrZoneName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(location, "brc_wrappedError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCXPCClient _waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:](self, "_waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:", v21, v13, v14, v20, v22, v9);

    v9 = (id)v14;
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(location, "brc_wrappedError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v28 = self;
      v29 = 2112;
      v30 = 0;
      v31 = 2112;
      v32 = 0;
      v33 = 2112;
      v34 = 0;
      v35 = 2112;
      v36 = v17;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);

    }
    objc_msgSend(location, "brc_wrappedError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, 0, v13);
  }

}

void __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke_2;
  v4[3] = &unk_24FE40140;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performWithFlags:action:", 4, v4);

}

uint64_t __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recreateDocumentsFolderIfNeededInDB");
}

- (void)setupNonSandboxedAccessForUbiquityContainers:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  BRCXPCClient *v8;
  BRCClientPrivilegesDescriptor *v9;
  __int128 v10;
  BRCClientPrivilegesDescriptor *v11;
  void *v12;
  NSObject *v13;
  _BYTE v14[32];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [BRCClientPrivilegesDescriptor alloc];
  v10 = *(_OWORD *)&v8->auditToken.val[4];
  *(_OWORD *)v14 = *(_OWORD *)v8->auditToken.val;
  *(_OWORD *)&v14[16] = v10;
  v11 = -[BRCClientPrivilegesDescriptor initWithNonSandboxedAppWithAppLibraryIDs:bundleID:auditToken:](v9, "initWithNonSandboxedAppWithAppLibraryIDs:bundleID:auditToken:", v6, v7, v14);
  -[BRCXPCClient setPrivilegesDescriptor:](v8, "setPrivilegesDescriptor:", v11);

  objc_sync_exit(v8);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v14 = 138413058;
    *(_QWORD *)&v14[4] = v8;
    *(_WORD *)&v14[12] = 2112;
    *(_QWORD *)&v14[14] = v6;
    *(_WORD *)&v14[22] = 2112;
    *(_QWORD *)&v14[24] = v7;
    v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: unsandboxed app is now using %@ as %@%@", v14, 0x2Au);
  }

}

- (void)_startSharingOperationAfterAcceptation:(id)a3 client:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setRemoteClientProxy:", a4);
  objc_msgSend(v9, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isSharedZone"))
  {
    objc_msgSend(v9, "clientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asSharedClientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v9, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shareAcceptOperationForItemID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412802;
      v19 = v14;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v15;
      _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] add dependency %@ for operation %@%@", (uint8_t *)&v18, 0x20u);
    }

    objc_msgSend(v8, "addDependency:", v14);
  }
  -[BRCXPCClient session](self, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addMiscOperation:", v8);

  objc_msgSend(v8, "schedule");
}

- (BRCClientPrivilegesDescriptor)clientPriviledgesDescriptor
{
  return self->_clientPriviledgesDescriptor;
}

- (void)setClientPriviledgesDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (BOOL)dieOnInvalidate
{
  return self->_dieOnInvalidate;
}

- (void)setSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: session != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] %@ - is now background%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] %@ - is now foreground%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __44__BRCXPCClient_process_didBecomeForeground___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona, bailing out%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_isAppLibraryProxyWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] %@ is talking to us without container proxy right%@");
  OUTLINED_FUNCTION_0();
}

- (void)_becameXPCCLientOfSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: count >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_finishedXPCClientOfSession:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_4_0(&dword_230455000, v6, v4, "[CRIT] UNREACHABLE: No xpc client group found for %@%@", v5);

}

- (void)_waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: Container %@ should really exist!%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Waiting for %@ to be forced ingest%@");
  OUTLINED_FUNCTION_0();
}

@end
