@implementation WBSHistoryService

void __69__WBSHistoryService_connectWithOptions_connection_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  objc_msgSend(v2, "_openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:", v3, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (!v4)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __69__WBSHistoryService_connectWithOptions_connection_completionHandler___block_invoke_cold_1();
  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)_openOrReuseExistingDatabaseWithOptions:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  WBSHistoryServiceDatabase *v18;
  WBSHistoryServiceDatabase *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  NSObject *v36;
  id v37;
  char *v38;
  void *v39;
  WBSHistoryServiceDatabase *v40;
  OS_dispatch_group *fileOperationGroup;
  WBSHistoryServiceDatabase *v42;
  id v43;
  NSObject *v44;
  id v45;
  void *v46;
  NSObject *v47;
  double v48;
  NSObject *v49;
  void *v51;
  void *v52;
  char v53;
  NSObject *v54;
  __int128 v55;
  void *v57;
  id v58;
  id v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  double v63;
  uint64_t v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x1E0C80C00];
  v58 = a3;
  objc_msgSend(v58, "safari_stringForKey:", CFSTR("WBSHistoryConnectionOptionDatabaseID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (id)*MEMORY[0x1E0D89E20];
  objc_msgSend(v58, "safari_URLForKey:", CFSTR("WBSHistoryConnectionOptionDatabaseURL"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v57)
    {
      objc_msgSend(v12, "addObject:");
      if (!a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

        if ((v16 & 1) == 0)
        {
          if (!a5)
          {
            v19 = 0;
            goto LABEL_45;
          }
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v64 = *MEMORY[0x1E0CB3308];
          v65[0] = v57;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
          v18 = (WBSHistoryServiceDatabase *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, v18);
          v19 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

LABEL_45:
          goto LABEL_46;
        }
      }
    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[WBSHistoryService _openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:].cold.3();
    }
    if ((objc_msgSend(v58, "safari_BOOLForKey:", CFSTR("WBSHistoryConnectionOptionNoMemoryFallback")) & 1) == 0)
    {
      WBSHistoryInMemoryDatabaseURL();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v21);

    }
    if (objc_msgSend(v58, "safari_BOOLForKey:", CFSTR("WBSHistoryConnectionOptionTruncate")))
    {
      v22 = v57;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "absoluteString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeItemAtURL:error:", v22, 0);
      v25 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("-lock"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URLWithString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeItemAtURL:error:", v27, 0);

      v28 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("-shm"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URLWithString:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeItemAtURL:error:", v30, 0);

      v31 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("-wal"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "URLWithString:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeItemAtURL:error:", v33, 0);

    }
    -[NSMapTable objectForKey:](self->_databases, "objectForKey:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v36 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[WBSHistoryService _openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:].cold.2();
      v18 = v34;
      v19 = v18;
    }
    else
    {
      v37 = 0;
      *(_QWORD *)&v35 = 138478083;
      v55 = v35;
      while (1)
      {
        if (!objc_msgSend(v13, "count", v55))
          goto LABEL_40;
        objc_msgSend(v13, "firstObject");
        v38 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectAtIndex:", 0);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = [WBSHistoryServiceDatabase alloc];
        fileOperationGroup = self->_fileOperationGroup;
        v59 = 0;
        v42 = -[WBSHistoryServiceDatabase initWithID:url:options:fileOperationGroup:error:](v40, "initWithID:url:options:fileOperationGroup:error:", v7, v38, v58, fileOperationGroup, &v59);
        v43 = v59;
        if (v42)
          break;
        v44 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v43, "safari_privacyPreservingDescription");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v55;
          v61 = v38;
          v62 = 2114;
          v63 = *(double *)&v46;
          _os_log_error_impl(&dword_1A3D90000, v44, OS_LOG_TYPE_ERROR, "Failed to open database %{private}@: %{public}@", buf, 0x16u);

        }
        if (v43)
        {
          v45 = v43;

          v37 = v45;
        }
        if (objc_msgSend(v43, "safari_isSQLiteCorruptionError"))
        {
          v49 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            -[WBSHistoryService _openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:].cold.1();

LABEL_40:
          if (a5)
          {
            v37 = objc_retainAutorelease(v37);
            v18 = 0;
            *a5 = v37;
          }
          else
          {
            v18 = 0;
          }
          goto LABEL_43;
        }

      }
      v47 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v39, "timeIntervalSinceNow");
        *(_DWORD *)buf = 136446466;
        v61 = "open_or_reuse_opening_database";
        v62 = 2048;
        v63 = -v48;
        _os_log_impl(&dword_1A3D90000, v47, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", buf, 0x16u);
      }

      -[NSMapTable setObject:forKey:](self->_databases, "setObject:forKey:", v42, v7);
      v18 = v42;

LABEL_43:
      v19 = v18;
    }
    goto LABEL_44;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D89E20]))
  {
    +[WBSHistory historyDatabaseURL](WBSHistory, "historyDatabaseURL");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("test")) & 1) != 0
    || objc_msgSend(v7, "hasPrefix:", CFSTR("_test")))
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(".db"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

LABEL_9:
    v57 = (void *)v11;
    goto LABEL_10;
  }
  +[WBSHistory profileDirectoryURLForProfileID:](WBSHistory, "profileDirectoryURLForProfileID:", v7);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "path");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "fileExistsAtPath:", v52);

    if ((v53 & 1) != 0)
    {
      objc_msgSend(v57, "URLByAppendingPathComponent:", CFSTR("History.db"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v54 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    -[WBSHistoryService _openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:].cold.4((uint64_t)v7, v54);
  v19 = 0;
LABEL_46:

  return v19;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  WBSHistoryConnection *v7;
  NSObject *v8;
  double v9;
  NSDate *initDate;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WBSHistoryConnectionInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  v7 = -[WBSHistoryConnection initWithHistoryService:]([WBSHistoryConnection alloc], "initWithHistoryService:", self);
  objc_msgSend(v5, "setExportedObject:", v7);

  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_60);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_11_1);
  objc_msgSend(v5, "resume");
  if (self->_initDate)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[NSDate timeIntervalSinceNow](self->_initDate, "timeIntervalSinceNow");
      -[WBSHistoryService listener:shouldAcceptNewConnection:].cold.1(v12, v8, v9);
    }

    initDate = self->_initDate;
    self->_initDate = 0;

  }
  return 1;
}

- (void)connectWithOptions:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *fileOperationGroup;
  NSObject *historyServiceQueue;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = v11;
  if (!-[WBSHistoryService _connectionIsEntitledToUseUserDatabase:](self, "_connectionIsEntitledToUseUserDatabase:", v9))
  {
    if (v11)
    {
      v13 = objc_msgSend(v11, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    objc_msgSend(v11, "safari_stringForKey:", CFSTR("WBSHistoryConnectionOptionDatabaseID"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = (void *)*MEMORY[0x1E0D89E20];
    if (v15)
      v17 = (void *)v15;
    v18 = v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?pid=%i"), v18, objc_msgSend(v9, "processIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("WBSHistoryConnectionOptionDatabaseID"));

    WBSHistoryInMemoryDatabaseURL();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("WBSHistoryConnectionOptionDatabaseURL"));

    v12 = v14;
  }
  historyServiceQueue = self->_historyServiceQueue;
  fileOperationGroup = self->_fileOperationGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WBSHistoryService_connectWithOptions_connection_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v26 = v12;
  v27 = v10;
  v23 = v12;
  v24 = v10;
  dispatch_group_notify(fileOperationGroup, historyServiceQueue, block);

}

- (BOOL)_connectionIsEntitledToUseUserDatabase:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.private.Safari.History"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = objc_msgSend(v3, "processIdentifier");
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_DEFAULT, "Process %d is missing history entitlement. Process will be restricted to private in-memory database", (uint8_t *)v8, 8u);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBSHistoryService _connectionIsEntitledToUseUserDatabase:].cold.1((uint8_t *)v8, objc_msgSend(v3, "processIdentifier"), v6);
LABEL_8:

    v5 = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v4, "BOOLValue");
LABEL_9:

  return v5;
}

- (WBSHistoryService)init
{
  return -[WBSHistoryService initWithListener:](self, "initWithListener:", 0);
}

- (WBSHistoryService)initWithListener:(id)a3
{
  id v5;
  WBSHistoryService *v6;
  WBSHistoryService *v7;
  uint64_t v8;
  NSDate *initDate;
  WBSHistoryDatabaseAccessBroker *v10;
  void *v11;
  uint64_t v12;
  WBSHistoryDatabaseAccessBroker *databaseAccessBroker;
  dispatch_queue_t v14;
  OS_dispatch_queue *historyServiceQueue;
  dispatch_group_t v16;
  OS_dispatch_group *fileOperationGroup;
  uint64_t v18;
  NSMapTable *databases;
  WBSHistoryService *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WBSHistoryService;
  v6 = -[WBSHistoryService init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    initDate = v7->_initDate;
    v7->_initDate = (NSDate *)v8;

    v10 = [WBSHistoryDatabaseAccessBroker alloc];
    -[WBSHistoryService databaseURL](v7, "databaseURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WBSHistoryDatabaseAccessBroker initWithHistoryDatabaseURL:](v10, "initWithHistoryDatabaseURL:", v11);
    databaseAccessBroker = v7->_databaseAccessBroker;
    v7->_databaseAccessBroker = (WBSHistoryDatabaseAccessBroker *)v12;

    v14 = dispatch_queue_create("com.apple.Safari.History.HistoryService", 0);
    historyServiceQueue = v7->_historyServiceQueue;
    v7->_historyServiceQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_group_create();
    fileOperationGroup = v7->_fileOperationGroup;
    v7->_fileOperationGroup = (OS_dispatch_group *)v16;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    databases = v7->_databases;
    v7->_databases = (NSMapTable *)v18;

    v20 = v7;
  }

  return v7;
}

- (id)_createListener
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.Safari.History.Service"));
}

- (void)resume
{
  void *v3;
  NSXPCListener *listener;
  NSXPCListener *v5;
  NSXPCListener *v6;

  v3 = (void *)MEMORY[0x1A8599CE4](self, a2);
  listener = self->_listener;
  if (!listener)
  {
    -[WBSHistoryService _createListener](self, "_createListener");
    v5 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    v6 = self->_listener;
    self->_listener = v5;

    listener = self->_listener;
  }
  -[NSXPCListener setDelegate:](listener, "setDelegate:", self);
  objc_autoreleasePoolPop(v3);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)shutdown
{
  NSObject *fileOperationGroup;
  NSObject *historyServiceQueue;
  NSXPCListener *listener;
  _QWORD block[5];

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  historyServiceQueue = self->_historyServiceQueue;
  fileOperationGroup = self->_fileOperationGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WBSHistoryService_shutdown__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_group_async(fileOperationGroup, historyServiceQueue, block);
  listener = self->_listener;
  self->_listener = 0;

  dispatch_group_wait((dispatch_group_t)self->_fileOperationGroup, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __29__WBSHistoryService_shutdown__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
        v9[0] = v5;
        v9[1] = 3221225472;
        v9[2] = __29__WBSHistoryService_shutdown__block_invoke_2;
        v9[3] = &unk_1E4B2A2C8;
        v9[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v7, "forceCloseWithCompletionHandler:", v9);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

void __29__WBSHistoryService_shutdown__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

void __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_cold_1();
}

void __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_10()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_10_cold_1();
}

- (NSURL)databaseURL
{
  return (NSURL *)+[WBSHistory historyDatabaseURL](WBSHistory, "historyDatabaseURL");
}

- (void)listDatabaseURLsWithCompletionHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void (**v19)(id, _QWORD, id);
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x1E0C80C00];
  v19 = (void (**)(id, _QWORD, id))a3;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[WBSHistory historyDatabaseURL](WBSHistory, "historyDatabaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D89E20]);

  v4 = *MEMORY[0x1E0C999D0];
  v5 = *MEMORY[0x1E0C99A90];
  v30[0] = *MEMORY[0x1E0C999D0];
  v30[1] = v5;
  v21 = v5;
  v30[2] = *MEMORY[0x1E0C99AA8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safari_profilesDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v23, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, v6, 4, &v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v28;

  if (v20 && (objc_msgSend(v20, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0CB28A8], 260, v18) & 1) == 0)
  {
    v19[2](v19, 0, v20);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v18;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "resourceValuesForKeys:error:", v6, 0, v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "safari_BOOLForKey:", v4) & 1) != 0)
          {
            objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("History.db"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v23, "fileExistsAtPath:", v15);

            if ((v16 & 1) != 0)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", v21);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, v17);

            }
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    ((void (**)(id, id, id))v19)[2](v19, v22, 0);
  }

}

- (void)openDatabaseWithID:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *fileOperationGroup;
  NSObject *historyServiceQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  WBSHistoryService *v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  historyServiceQueue = self->_historyServiceQueue;
  fileOperationGroup = self->_fileOperationGroup;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__WBSHistoryService_openDatabaseWithID_createIfNeeded_completionHandler___block_invoke;
  v14[3] = &unk_1E4B3B340;
  v15 = v8;
  v16 = self;
  v18 = a4;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_group_async(fileOperationGroup, historyServiceQueue, v14);

}

void __73__WBSHistoryService_openDatabaseWithID_createIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    v2 = *MEMORY[0x1E0D89E20];
  v9[0] = CFSTR("WBSHistoryConnectionOptionDatabaseID");
  v9[1] = CFSTR("WBSHistoryConnectionOptionNoMemoryFallback");
  v10[0] = v2;
  v10[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(unsigned __int8 *)(a1 + 56);
  v8 = 0;
  objc_msgSend(v4, "_openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:", v3, v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  NSXPCConnection *v7;
  NSXPCConnection *completionListProviderConnection;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v10);
  completionListProviderConnection = self->_completionListProviderConnection;
  self->_completionListProviderConnection = v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE73D358);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_completionListProviderConnection, "setRemoteObjectInterface:", v9);

  -[NSXPCConnection resume](self->_completionListProviderConnection, "resume");
  v6[2](v6, 0);

}

- (WBSHistoryCompletionListVendorProtocol)completionListProvider
{
  return (WBSHistoryCompletionListVendorProtocol *)-[NSXPCConnection remoteObjectProxy](self->_completionListProviderConnection, "remoteObjectProxy");
}

- (WBSHistoryDatabaseAccessBroker)databaseAccessBroker
{
  return self->_databaseAccessBroker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseAccessBroker, 0);
  objc_storeStrong((id *)&self->_completionListProviderConnection, 0);
  objc_storeStrong((id *)&self->_initDate, 0);
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_fileOperationGroup, 0);
  objc_storeStrong((id *)&self->_historyServiceQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_connectionIsEntitledToUseUserDatabase:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "History entitlement for process id %d is not of the correct type (expected a BOOL)", buf, 8u);
}

- (void)listener:(double)a3 shouldAcceptNewConnection:.cold.1(uint8_t *buf, NSObject *a2, double a3)
{
  *(_DWORD *)buf = 134217984;
  *(double *)(buf + 4) = -a3;
  _os_log_debug_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_DEBUG, "XPC ServiceConnection time from launch -> first connection: %f...", buf, 0xCu);
}

void __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "XPC ServiceConnection was invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __56__WBSHistoryService_listener_shouldAcceptNewConnection___block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "XPC ServiceConnection was interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Database is corrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Database was already opened. Returning existing database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_openOrReuseExistingDatabaseWithOptions:createIfNeeded:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to retrieve history database URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_openOrReuseExistingDatabaseWithOptions:(uint64_t)a1 createIfNeeded:(NSObject *)a2 error:.cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain profile directory for identifier: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __69__WBSHistoryService_connectWithOptions_connection_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Could not open database, returning...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
