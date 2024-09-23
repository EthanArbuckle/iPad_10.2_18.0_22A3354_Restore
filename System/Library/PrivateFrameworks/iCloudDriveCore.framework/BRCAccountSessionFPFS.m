@implementation BRCAccountSessionFPFS

- (void)enumerateAppLibraries:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_appLibrariesByRowID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x2348B9F14](v7);
      LODWORD(v11) = v4[2](v4, v11);
      objc_autoreleasePoolPop(v12);
      if (!(_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v8 = v7;
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)registerClient:(id)a3
{
  id v4;
  BRCAccountSessionFPFS *v5;
  _BOOL4 isCancelled;
  void *v8;
  NSObject *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[NSMutableSet containsObject:](v5->_xpcClients, "containsObject:", v4))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS registerClient:].cold.1();

  }
  isCancelled = v5->_isCancelled;
  if (!v5->_isCancelled)
    -[NSMutableSet addObject:](v5->_xpcClients, "addObject:", v4);
  objc_sync_exit(v5);

  return !isCancelled;
}

- (void)unregisterClient:(id)a3
{
  id v4;
  BRCAccountSessionFPFS *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((-[NSMutableSet containsObject:](v5->_xpcClients, "containsObject:", v4) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS unregisterClient:].cold.1();

  }
  -[NSMutableSet removeObject:](v5->_xpcClients, "removeObject:", v4);
  objc_sync_exit(v5);

}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BRCNotificationManager)notificationManager
{
  BRCNotificationManager *notificationManager;
  void *v5;
  NSObject *v6;

  notificationManager = self->_notificationManager;
  if (!notificationManager)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS notificationManager].cold.1();

    notificationManager = self->_notificationManager;
  }
  return notificationManager;
}

- (BRCAccountHandler)accountHandler
{
  return self->_accountHandler;
}

- (BRDSIDString)accountDSID
{
  return self->_accountDSID;
}

- (id)itemByFileObjectID:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "type");
    v9 = objc_msgSend(v6, "rawID");
    switch(v8)
    {
      case 0:
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BRCAccountSessionFPFS(ItemFetching) itemByFileObjectID:db:].cold.3();
        goto LABEL_14;
      case 1:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSessionFPFS appLibraryByRowID:](self, "appLibraryByRowID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "fetchRootItemInDB:", v7);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 4:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSessionFPFS appLibraryByRowID:](self, "appLibraryByRowID:", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "includesDataScope") & 1) == 0)
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            -[BRCAccountSessionFPFS(ItemFetching) itemByFileObjectID:db:].cold.4();

        }
        objc_msgSend(v13, "fetchDocumentsDirectoryItem:", v7);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v15 = (void *)v14;

        break;
      case 5:
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BRCAccountSessionFPFS(ItemFetching) itemByFileObjectID:db:].cold.2();
        goto LABEL_14;
      default:
        -[BRCAccountSessionFPFS itemByRowID:db:](self, "itemByRowID:db:", v9, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(ItemFetching) itemByFileObjectID:db:].cold.1();
LABEL_14:

    v15 = 0;
  }

  return v15;
}

- (OS_dispatch_workloop)clientTruthWorkloop
{
  return self->_clientTruthWorkloop;
}

- (BRCPQLConnection)clientDB
{
  return self->_clientDB;
}

- (BRCContainerScheduler)containerScheduler
{
  BRCContainerScheduler *containerScheduler;
  void *v5;
  NSObject *v6;

  containerScheduler = self->_containerScheduler;
  if (!containerScheduler)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS containerScheduler].cold.1();

    containerScheduler = self->_containerScheduler;
  }
  return containerScheduler;
}

- (id)appLibraryByRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.1();

  }
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appLibrariesByRowID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  if (!v5)
  {
    if (-[BRCAccountSessionFPFS isCancelled](self, "isCancelled"))
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find app library in the middle of closing%@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS appLibraryByRowID:].cold.1();
    }

  }
  return v5;
}

- (id)appLibraryByMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_libraryRowIDsByMangledID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_appLibrariesByRowID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);

  return v6;
}

- (id)appLibraryByID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BE17640];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAppLibraryName:", v5);

  -[BRCAccountSessionFPFS appLibraryByMangledID:](self, "appLibraryByMangledID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_mutexZonesLock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: BRCurrentPersonaMatchesID(self.personaIdentifier)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addOfflineServerZone:(id)a3
{
  brc_mutex *p_zonesLock;
  NSMutableDictionary *v5;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *sharedServerZonesByMangledID;
  NSMutableDictionary *v10;
  NSMutableDictionary *privateServerZonesByID;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  id v18;

  v18 = a3;
  p_zonesLock = &self->_zonesLock;
  brc_mutex_lock(&self->_zonesLock.pthread);
  if (!self->_serverZonesByZoneRowID)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    self->_serverZonesByZoneRowID = v5;

  }
  v7 = v18;
  if (!self->_sharedServerZonesByMangledID)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
    self->_sharedServerZonesByMangledID = v8;

    v7 = v18;
  }
  if (!self->_privateServerZonesByID)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    privateServerZonesByID = self->_privateServerZonesByID;
    self->_privateServerZonesByID = v10;

    v7 = v18;
  }
  objc_msgSend(v7, "setSession:", self);
  v12 = self->_serverZonesByZoneRowID;
  objc_msgSend(v18, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v18, v13);

  if (objc_msgSend(v18, "isSharedZone"))
  {
    v14 = self->_sharedServerZonesByMangledID;
    objc_msgSend(v18, "asSharedZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mangledID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, v16);

  }
  else
  {
    v17 = self->_privateServerZonesByID;
    objc_msgSend(v18, "zoneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, v15);
  }

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (void)addOfflineClientZone:(id)a3
{
  brc_mutex *p_zonesLock;
  NSMutableDictionary *v5;
  NSMutableDictionary *privateClientZonesByID;
  NSMutableDictionary *v7;
  NSMutableDictionary *sharedClientZonesByMangledID;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  p_zonesLock = &self->_zonesLock;
  brc_mutex_lock(&self->_zonesLock.pthread);
  if (!self->_privateClientZonesByID)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    privateClientZonesByID = self->_privateClientZonesByID;
    self->_privateClientZonesByID = v5;

  }
  if (!self->_sharedClientZonesByMangledID)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
    self->_sharedClientZonesByMangledID = v7;

  }
  objc_msgSend(v14, "setSession:", self);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  objc_msgSend(v14, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](serverZonesByZoneRowID, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v14, "associateWithServerZone:offline:", v11, 1);
  if (objc_msgSend(v14, "isSharedZone"))
  {
    v12 = self->_sharedClientZonesByMangledID;
    objc_msgSend(v14, "mangledID");
  }
  else
  {
    v12 = self->_privateClientZonesByID;
    objc_msgSend(v14, "zoneName");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, v13);

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (void)addOfflineAppLibrary:(id)a3
{
  brc_mutex *p_zonesLock;
  id v5;
  NSMutableDictionary *appLibrariesByRowID;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;

  p_zonesLock = &self->_zonesLock;
  v5 = a3;
  brc_mutex_lock(&p_zonesLock->pthread);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  if (!appLibrariesByRowID)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = self->_appLibrariesByRowID;
    self->_appLibrariesByRowID = v7;

    appLibrariesByRowID = self->_appLibrariesByRowID;
  }
  objc_msgSend(v5, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](appLibrariesByRowID, "setObject:forKeyedSubscript:", v5, v9);

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (OS_dispatch_workloop)readOnlyWorkloop
{
  return self->_readOnlyWorkloop;
}

- (OS_dispatch_workloop)serverTruthWorkloop
{
  return self->_serverTruthWorkloop;
}

- (unint64_t)databaseIDHash
{
  return -[NSString hash](self->_databaseID, "hash");
}

- (BRCClientState)clientState
{
  return self->_clientState;
}

- (BRCServerPersistedState)serverState
{
  return self->_serverState;
}

- (BRCPQLConnection)serverDB
{
  return self->_serverDB;
}

- (BRCPQLConnection)readOnlyDB
{
  BRCAccountSessionFPFS *v2;
  BRCPQLConnection *v3;
  BRCPQLConnection *v4;
  BRCPQLConnection *v5;
  id v6;
  void *v7;
  BRCPQLConnection *clientDB;
  void *v9;
  NSObject *v10;
  id v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_readOnlyDB;
  if (v3)
  {
    v4 = v3;
    v5 = v4;
  }
  else
  {
    v12 = 0;
    v4 = -[BRCAccountSessionFPFS newConnectionWithLabel:readonly:error:](v2, "newConnectionWithLabel:readonly:error:", CFSTR("readonly-interactive-db"), 1, &v12);
    v6 = v12;
    if (v4)
    {
      -[BRCAccountSessionFPFS readOnlyWorkloop](v2, "readOnlyWorkloop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPQLConnection useSerialQueueWithTarget:](v4, "useSerialQueueWithTarget:", v7);

      objc_storeStrong((id *)&v2->_readOnlyDB, v4);
      clientDB = v4;
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS(BRCDatabaseManager) readOnlyDB].cold.1();

      clientDB = v2->_clientDB;
    }
    v5 = clientDB;

  }
  objc_sync_exit(v2);

  return v5;
}

- (BRCPQLConnection)expensiveReadOnlyDB
{
  BRCAccountSessionFPFS *v2;
  BRCPQLConnection *v3;
  BRCPQLConnection *v4;
  BRCPQLConnection *v5;
  id v6;
  void *v7;
  BRCPQLConnection *clientDB;
  void *v9;
  NSObject *v10;
  id v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_expensiveReadOnlyDB;
  if (v3)
  {
    v4 = v3;
    v5 = v4;
  }
  else
  {
    v12 = 0;
    v4 = -[BRCAccountSessionFPFS newConnectionWithLabel:readonly:error:](v2, "newConnectionWithLabel:readonly:error:", CFSTR("readonly-expensive-db"), 1, &v12);
    v6 = v12;
    if (v4)
    {
      -[BRCAccountSessionFPFS readOnlyWorkloop](v2, "readOnlyWorkloop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPQLConnection useSerialQueueWithTarget:](v4, "useSerialQueueWithTarget:", v7);

      objc_storeStrong((id *)&v2->_expensiveReadOnlyDB, v4);
      clientDB = v4;
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS(BRCDatabaseManager) expensiveReadOnlyDB].cold.1();

      clientDB = v2->_clientDB;
    }
    v5 = clientDB;

  }
  objc_sync_exit(v2);

  return v5;
}

- (void)dbBecameCorruptedWithDescription:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BRCAccountSessionFPFS *v12;
  BRCAccountSessionFPFS *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *dbCorruptionQueue;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  BRCAccountSessionFPFS *v25;
  const char *v26;
  uint8_t buf[4];
  BRCAccountSessionFPFS *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BRCAccountSessionFPFS extensionBackChannel](self, "extensionBackChannel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v9;
      _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] %@ - Invalidating the extension%@", buf, 0x16u);
    }

    -[BRCAccountSessionFPFS extensionBackChannel](self, "extensionBackChannel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateExtension");

  }
  v12 = self;
  objc_sync_enter(v12);
  if (!v12->_dbCorruptionQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("db-corrupting-handler-queue", v16);

    dbCorruptionQueue = v12->_dbCorruptionQueue;
    v12->_dbCorruptionQueue = (OS_dispatch_queue *)v17;

    -[BRCAccountSessionFPFS captureDBCorruptionInfoWithDescription:error:](v12, "captureDBCorruptionInfoWithDescription:error:", v6, v7);
    objc_sync_exit(v12);

    -[BRCAccountSessionFPFS fileUnlinker](v12, "fileUnlinker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](v12->_dbURL, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "renameAndUnlinkInBackgroundItemAtPath:", v20);

    -[BRCAccountSessionFPFS fileUnlinker](v12, "fileUnlinker");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS sessionDirPath](v12, "sessionDirPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "renameAndUnlinkInBackgroundItemAtPath:", v22);

    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("db was corrupted with description - '%@' and due to - %@"), v6, v7);
    objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      brc_append_system_info_to_message();
      v25 = (BRCAccountSessionFPFS *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v25;
      v29 = 2112;
      v30 = v23;
      _os_log_fault_impl(&dword_230455000, v24, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);

    }
    brc_append_system_info_to_message();
    v26 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) dbBecameCorruptedWithDescription:error:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 299, v26);
  }
  brc_bread_crumbs();
  v13 = (BRCAccountSessionFPFS *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Corrupting handling is already in-flight%@", buf, 0xCu);
  }

  objc_sync_exit(v12);
}

- (id)newConnection:(id)a3
{
  id v4;
  BRCPQLConnection *v5;
  BRCPQLConnection *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [BRCPQLConnection alloc];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __59__BRCAccountSessionFPFS_BRCDatabaseManager__newConnection___block_invoke;
  v11 = &unk_24FE3FE88;
  objc_copyWeak(&v12, &location);
  v6 = -[BRCPQLConnection initWithLabel:dbCorruptionHandler:](v5, "initWithLabel:dbCorruptionHandler:", v4, &v8);
  -[BRCPQLConnection setAssertionPersonaIdentifier:](v6, "setAssertionPersonaIdentifier:", self->_personaIdentifier, v8, v9, v10, v11);
  -[BRCPQLConnection setStatementCacheMaxCount:](v6, "setStatementCacheMaxCount:", 10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __59__BRCAccountSessionFPFS_BRCDatabaseManager__newConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "dbBecameCorruptedWithDescription:error:", CFSTR("Invoked from DB Corruption Handler"), v4);

}

+ (id)sessionForBackingUpDatabasesAtURL:(id)a3
{
  NSURL *v3;
  BRCAccountSessionFPFS *v4;
  NSURL *dbURL;

  v3 = (NSURL *)a3;
  v4 = objc_alloc_init(BRCAccountSessionFPFS);
  dbURL = v4->_dbURL;
  v4->_dbURL = v3;

  return v4;
}

+ (id)sessionForDumpingDatabasesAtURL:(id)a3 with:(id)a4
{
  NSURL *v5;
  BRDSIDString *v6;
  BRCAccountSessionFPFS *v7;
  NSURL *dbURL;
  NSURL *v9;
  BRDSIDString *accountDSID;
  BRDSIDString *v11;
  BRCPQLConnection *serverDB;
  void *v13;
  BRCPQLConnection *clientDB;
  void *v15;

  v5 = (NSURL *)a3;
  v6 = (BRDSIDString *)a4;
  v7 = objc_alloc_init(BRCAccountSessionFPFS);
  -[BRCAccountSessionFPFS setupDatabase](v7, "setupDatabase");
  dbURL = v7->_dbURL;
  v7->_dbURL = v5;
  v9 = v5;

  accountDSID = v7->_accountDSID;
  v7->_accountDSID = v6;
  v11 = v6;

  serverDB = v7->_serverDB;
  -[BRCAccountSessionFPFS serverTruthWorkloop](v7, "serverTruthWorkloop");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](serverDB, "useSerialQueueWithTarget:", v13);

  clientDB = v7->_clientDB;
  -[BRCAccountSessionFPFS clientTruthWorkloop](v7, "clientTruthWorkloop");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](clientDB, "useSerialQueueWithTarget:", v15);

  -[BRCAccountSessionFPFS openForDumping](v7, "openForDumping");
  return v7;
}

+ (id)sessionForDumpingDatabasesAtURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sessionForDumpingDatabasesAtURL:with:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sessionForSendingTelemetryAtURL:(id)a3
{
  NSURL *v3;
  BRCAccountSessionFPFS *v4;
  NSURL *dbURL;
  NSURL *v6;
  BRCPQLConnection *serverDB;
  void *v8;
  BRCPQLConnection *clientDB;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = (NSURL *)a3;
  v4 = objc_alloc_init(BRCAccountSessionFPFS);
  -[BRCAccountSessionFPFS setupDatabase](v4, "setupDatabase");
  dbURL = v4->_dbURL;
  v4->_dbURL = v3;
  v6 = v3;

  serverDB = v4->_serverDB;
  -[BRCAccountSessionFPFS serverTruthWorkloop](v4, "serverTruthWorkloop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](serverDB, "useSerialQueueWithTarget:", v8);

  clientDB = v4->_clientDB;
  -[BRCAccountSessionFPFS clientTruthWorkloop](v4, "clientTruthWorkloop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](clientDB, "useSerialQueueWithTarget:", v10);

  -[BRCAccountSessionFPFS openForSendingTelemetry](v4, "openForSendingTelemetry");
  +[BRCDaemonFPFS daemon](BRCDaemonFPFS, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();

  objc_msgSend(v11, "setContainerClass:", v12);
  return v4;
}

+ (id)sessionForCheckingInconsistencies
{
  BRCAccountSessionFPFS *v2;
  BRCPQLConnection *serverDB;
  void *v4;
  BRCPQLConnection *clientDB;
  void *v6;

  v2 = objc_alloc_init(BRCAccountSessionFPFS);
  serverDB = v2->_serverDB;
  -[BRCAccountSessionFPFS serverTruthWorkloop](v2, "serverTruthWorkloop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](serverDB, "useSerialQueueWithTarget:", v4);

  clientDB = v2->_clientDB;
  -[BRCAccountSessionFPFS clientTruthWorkloop](v2, "clientTruthWorkloop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection useSerialQueueWithTarget:](clientDB, "useSerialQueueWithTarget:", v6);

  return v2;
}

- (void)setupDatabase
{
  BRCPQLConnection *v3;
  BRCPQLConnection *serverDB;
  BRCPQLConnection *v5;
  BRCPQLConnection *clientDB;
  id v7;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[BRCAccountSessionFPFS newConnection:](self, "newConnection:", CFSTR("serverTruth"));
  serverDB = self->_serverDB;
  self->_serverDB = v3;

  v5 = -[BRCAccountSessionFPFS newConnection:](self, "newConnection:", CFSTR("clientTruth"));
  clientDB = self->_clientDB;
  self->_clientDB = v5;

  -[BRCPQLConnection setStatementCacheMaxCount:](self->_serverDB, "setStatementCacheMaxCount:", objc_msgSend(v7, "statementCacheMaxCountForServerTruth"));
  -[BRCPQLConnection setStatementCacheMaxCount:](self->_clientDB, "setStatementCacheMaxCount:", objc_msgSend(v7, "statementCacheMaxCountForClientTruth"));

}

- (void)_startWatcher
{
  id v3;
  const char *v4;
  unsigned int v5;
  unsigned int v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *dbWatcher;
  OS_dispatch_source *v9;
  void (**v10)(_QWORD *);
  void *v11;
  dispatch_block_t v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  _QWORD v21[4];
  unsigned int v22;

  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("client.db"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  v5 = open(v4, 33028);
  if ((v5 & 0x80000000) != 0)
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("can't open the client db we've just created %{errno}d"), *__error());
    objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher].cold.1();

    brc_append_system_info_to_message();
    v20 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 391, v20);
  }
  v6 = v5;
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA28], v5, 1uLL, (dispatch_queue_t)self->_dbWatcherQueue);
  dbWatcher = self->_dbWatcher;
  self->_dbWatcher = v7;

  v9 = self->_dbWatcher;
  v10 = (void (**)(_QWORD *))MEMORY[0x24BE17840];
  if (*MEMORY[0x24BE17840])
  {
    ((void (*)(void *))*MEMORY[0x24BE17840])(&__block_literal_global_6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &__block_literal_global_6;
  }
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v11);
  dispatch_source_set_event_handler((dispatch_source_t)v9, v12);

  v13 = self->_dbWatcher;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__BRCAccountSessionFPFS_BRCDatabaseManager___startWatcher__block_invoke_2;
  v21[3] = &__block_descriptor_36_e5_v8__0l;
  v22 = v6;
  v14 = v13;
  v15 = v21;
  v16 = v15;
  if (*v10)
  {
    (*v10)(v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  dispatch_source_set_cancel_handler(v14, v16);

  dispatch_resume((dispatch_object_t)self->_dbWatcher);
}

void __58__BRCAccountSessionFPFS_BRCDatabaseManager___startWatcher__block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  const char *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("someone ripped the database from under our feet"));
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412546;
    v5 = v2;
    v6 = 2112;
    v7 = v0;
    _os_log_fault_impl(&dword_230455000, v1, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v4, 0x16u);

  }
  brc_append_system_info_to_message();
  v3 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 396, v3);
}

uint64_t __58__BRCAccountSessionFPFS_BRCDatabaseManager___startWatcher__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)stopDBWatcher
{
  NSObject *dbWatcherQueue;
  _QWORD block[5];

  dbWatcherQueue = self->_dbWatcherQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__BRCAccountSessionFPFS_BRCDatabaseManager__stopDBWatcher__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_sync(dbWatcherQueue, block);
}

void __58__BRCAccountSessionFPFS_BRCDatabaseManager__stopDBWatcher__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

  }
}

- (BOOL)_openConnection:(id)a3 databaseName:(id)a4 readonly:(BOOL)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  BOOL v12;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  LODWORD(v7) = objc_msgSend((id)objc_opt_class(), "_openConnection:databaseName:baseURL:readonly:error:", v10, v11, self->_dbURL, v7, a6);

  if ((_DWORD)v7)
    v12 = -[BRCAccountSessionFPFS _registerDynamicDBFunctions:error:](self, "_registerDynamicDBFunctions:error:", v10, a6);
  else
    v12 = 0;

  return v12;
}

+ (BOOL)_openConnection:(id)a3 databaseName:(id)a4 baseURL:(id)a5 readonly:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  if (v8)
    v13 = 3145729;
  else
    v13 = 3145734;
  objc_msgSend(a5, "URLByAppendingPathComponent:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "openAtURL:withFlags:error:", v14, v13, a7);

  if (!v15)
    goto LABEL_9;
  if (!v8)
    objc_msgSend(v11, "setSynchronousMode:", objc_msgSend(v12, "isEqualToString:", CFSTR("checker.db")) ^ 1);
  if (+[BRCAccountSessionFPFS _registerStaticDBFunctions:error:](BRCAccountSessionFPFS, "_registerStaticDBFunctions:error:", v11, a7))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v16, "sqliteCacheSize"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v16, "sqliteCacheSpill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BEDD648];
    v20 = objc_retainAutorelease(v17);
    objc_msgSend(v19, "rawInjection:length:", objc_msgSend(v20, "UTF8String"), objc_msgSend(v20, "length"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "execute:", CFSTR("PRAGMA cache_size = %@"), v21);

    v22 = (void *)MEMORY[0x24BEDD648];
    v23 = objc_retainAutorelease(v18);
    objc_msgSend(v22, "rawInjection:length:", objc_msgSend(v23, "UTF8String"), objc_msgSend(v23, "length"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "execute:", CFSTR("PRAGMA cache_spill = %@"), v24);

    v25 = 1;
  }
  else
  {
LABEL_9:
    v25 = 0;
  }

  return v25;
}

+ (BOOL)_registerStaticDBFunctions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke;
  v9[3] = &unk_24FE3FEF0;
  v6 = v5;
  v10 = v6;
  if (objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("migration_is_parented_or_equal_to_old_doc_id"), 2, v9, a4)&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("document_is_evictable"), 1, &__block_literal_global_55, a4)&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("document_is_indexable"), 1, &__block_literal_global_58,
                       a4))
  {
    v7 = objc_msgSend(v6, "registerFunction:nArgs:handler:", CFSTR("ckinfo_etags_are_equal"), 2, &__block_literal_global_61);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  NSObject *v21;
  sqlite3_context *v22;

  pql_sqlite3_value_object();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_1();

    sqlite3_result_null(a2);
    goto LABEL_23;
  }
  v22 = a2;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "newFromSqliteValue:", *(_QWORD *)(a4 + 8));
  v9 = -1000;
  while (1)
  {
    v10 = (void *)MEMORY[0x2348B9F14]();
    if (!v8)
      goto LABEL_18;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("root")) & 1) != 0)
    {
      v19 = 0;
LABEL_16:
      sqlite3_result_int(v22, v19);

      objc_autoreleasePoolPop(v10);
      goto LABEL_22;
    }
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("documents")) & 1) != 0)
    {
      v19 = 1;
      goto LABEL_16;
    }

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v7, "dbRowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "fetch:", CFSTR("SELECT item_parent_id FROM client_items WHERE zone_rowid = %@ AND item_id = %@"), v13, v8);

    if ((objc_msgSend(v14, "next") & 1) == 0)
      break;
    objc_msgSend(v14, "dataAtIndex:", 0);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v10);
    v8 = (void *)v15;
    if (__CFADD__(v9++, 1))
      goto LABEL_19;
  }

LABEL_18:
  objc_autoreleasePoolPop(v10);
  v15 = (uint64_t)v8;
LABEL_19:
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_2();

  sqlite3_result_null(v22);
  v8 = (void *)v15;
LABEL_22:

LABEL_23:
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_54(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v5;

  v5 = sqlite3_value_int64(*a4) & 1;
  sqlite3_result_int(a2, v5);
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  unsigned int v5;

  v5 = (sqlite3_value_int64(*a4) >> 1) & 1;
  sqlite3_result_int(a2, v5);
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_3(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = +[BRFieldCKInfo newFromSqliteValue:](BRFieldCKInfo, "newFromSqliteValue:", *a4);
  v7 = +[BRFieldCKInfo newFromSqliteValue:](BRFieldCKInfo, "newFromSqliteValue:", a4[1]);
  objc_msgSend(v11, "etag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "etag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      sqlite3_result_int(a2, 1);
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v11, "etag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "etag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_result_int(a2, objc_msgSend(v9, "isEqualToString:", v10));

  if (!v8)
    goto LABEL_6;
LABEL_7:

}

- (BOOL)_registerDynamicDBFunctions:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke;
  v17[3] = &unk_24FE3FF78;
  objc_copyWeak(&v18, &location);
  v8 = (void *)MEMORY[0x2348BA0DC](v17);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_63;
  v15[3] = &unk_24FE3FF78;
  objc_copyWeak(&v16, &location);
  v9 = (void *)MEMORY[0x2348BA0DC](v15);
  if (objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("trigger_notification"), 1, v8, a4)&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("bump_notifs_rank"), 0, v9, a4))
  {
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_2;
    v12[3] = &unk_24FE3FFA0;
    v13 = v8;
    v14 = v9;
    v10 = objc_msgSend(v6, "registerFunction:nArgs:handler:error:", CFSTR("bump_notifs_rank_and_trigger_notifs"), 1, v12, a4);

  }
  else
  {
    v10 = 0;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, sqlite3_value **a4)
{
  id WeakRetained;
  sqlite3_int64 v6;
  void *v7;
  NSObject *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = sqlite3_value_int64(*a4);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_cold_1((uint64_t)v7, v6, v8);

  objc_msgSend(WeakRetained, "notificationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queueUpdateForItemAtRowID:", v6);

}

void __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_63(uint64_t a1, sqlite3_context *a2)
{
  void *v3;
  sqlite3_int64 v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allocateNotifRank");

  sqlite3_result_int64(a2, v4);
}

uint64_t __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_setupConnection:(id)a3 readonly:(BOOL)a4 forChecker:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  char v20;
  _BOOL4 v22;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v6 = a5;
  v22 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  if (v6)
    v8 = &unk_24FEB4A38;
  else
    v8 = &unk_24FEB4A50;
  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    v13 = 0x24BDD1000uLL;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(*(id *)(v13 + 1992), "stringWithFormat:", CFSTR("%@.db"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "path");
          v18 = v13;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v25, "attachDBAtPath:as:error:", v19, v15, a6);

          v13 = v18;
          if ((v20 & 1) == 0)
            goto LABEL_16;
        }
        else if (!-[BRCAccountSessionFPFS _openConnection:databaseName:readonly:error:](self, "_openConnection:databaseName:readonly:error:", v25, v16, v22, a6))
        {
LABEL_16:

          v11 = 0;
          goto LABEL_18;
        }

        v11 = 1;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 1;
  }
LABEL_18:

  return v11;
}

- (id)newConnectionWithLabel:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a4;
  v8 = a3;
  v9 = -[BRCAccountSessionFPFS newConnection:](self, "newConnection:", v8);
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("checker"));

  if (-[BRCAccountSessionFPFS _setupConnection:readonly:forChecker:error:](self, "_setupConnection:readonly:forChecker:error:", v9, v6, v10, a5))
  {
    v11 = v9;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (BOOL)_setupBackupDetector:(backup_detector *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  const char *v21;
  const char *v22;
  __darwin_ino64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-odd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-even"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  a3->var2 = 0;
  v9 = objc_retainAutorelease(v7);
  if (create_control_file((char *)objc_msgSend(v9, "fileSystemRepresentation"), &v23, 1))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _setupBackupDetector:error:]";
        v26 = 2080;
        if (!a4)
          v21 = "(ignored by caller)";
        v27 = (unint64_t)v21;
        v28 = 2112;
        v29 = (unint64_t)v10;
        v30 = 2112;
        v31 = v11;
        _os_log_error_impl(&dword_230455000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      goto LABEL_6;
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  a3->var0 = v23;
  if (!create_control_file((char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), &v23, 1))
  {
    a3->var1 = v23;
    brc_bread_crumbs();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 1;
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      *(_DWORD *)buf = 134218754;
      v25 = (const char *)var0;
      v26 = 2048;
      v27 = var1;
      v28 = 2048;
      v29 = var2;
      v30 = 2112;
      v31 = v10;
      _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] database backup detector initialized {old:%llu; new:%llu; c:%llu}%@",
        buf,
        0x2Au);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v25 = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _setupBackupDetector:error:]";
      v26 = 2080;
      if (!a4)
        v22 = "(ignored by caller)";
      v27 = (unint64_t)v22;
      v28 = 2112;
      v29 = (unint64_t)v10;
      v30 = 2112;
      v31 = v15;
      _os_log_error_impl(&dword_230455000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (!a4)
    goto LABEL_13;
LABEL_6:
  v10 = v10;
  v13 = 0;
  v14 = *a4;
  *a4 = v10;
LABEL_7:

LABEL_14:
  return v13;
}

- (BOOL)_stepBackupDetector:(backup_detector *)a3 newState:(backup_detector *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  unint64_t var1;
  void *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  unint64_t var2;
  NSObject *v33;
  const char *v35;
  __darwin_ino64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t var0;
  stat v44;
  uint8_t buf[4];
  const char *st_ino;
  __int16 v47;
  _BYTE v48[18];
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-odd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-even"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  memset(&v44, 0, sizeof(v44));
  if ((a3->var2 & 1) != 0)
    v10 = v9;
  v12 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation", *(_QWORD *)&v44.st_dev);
  if (lstat(v12, &v44))
  {
    v13 = *__error();
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 136315650;
      st_ino = v12;
      v47 = 1024;
      *(_DWORD *)v48 = v13;
      *(_WORD *)&v48[4] = 2112;
      *(_QWORD *)&v48[6] = v14;
      _os_log_error_impl(&dword_230455000, v15, (os_log_type_t)0x90u, "[ERROR] failed stating '%s' %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v13;
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        st_ino = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
        v47 = 2080;
        if (!a5)
          v35 = "(ignored by caller)";
        *(_QWORD *)v48 = v35;
        *(_WORD *)&v48[8] = 2112;
        *(_QWORD *)&v48[10] = v16;
        v49 = 2112;
        v50 = (unint64_t)v17;
        _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      goto LABEL_10;
    goto LABEL_33;
  }
  if (v44.st_ino != a3->var1)
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      var1 = a3->var1;
      *(_DWORD *)buf = 134218754;
      st_ino = (const char *)v44.st_ino;
      v47 = 2048;
      *(_QWORD *)v48 = var1;
      *(_WORD *)&v48[8] = 2080;
      *(_QWORD *)&v48[10] = v12;
      v49 = 2112;
      v50 = (unint64_t)v24;
      _os_log_impl(&dword_230455000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] backup detected: ino %llu instead of %llu at '%s'\n%@", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 70);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_32:
      if (a5)
      {
LABEL_10:
        v16 = objc_retainAutorelease(v16);
        v19 = 0;
        *a5 = v16;
        goto LABEL_41;
      }
LABEL_33:
      v19 = 0;
      goto LABEL_41;
    }
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
LABEL_31:

      goto LABEL_32;
    }
    v29 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    st_ino = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
    v47 = 2080;
    if (!a5)
      v29 = "(ignored by caller)";
LABEL_48:
    *(_QWORD *)v48 = v29;
    *(_WORD *)&v48[8] = 2112;
    *(_QWORD *)&v48[10] = v16;
    v49 = 2112;
    v50 = (unint64_t)v27;
    _os_log_error_impl(&dword_230455000, v28, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_31;
  }
  if ((a3->var2 & 1) != 0)
    v20 = v11;
  else
    v20 = v9;
  v21 = (char *)objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation");
  if (!lstat(v21, &v44))
  {
    if (v44.st_ino != a3->var0)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        var0 = a3->var0;
        *(_DWORD *)buf = 136315906;
        st_ino = v21;
        v47 = 2048;
        *(_QWORD *)v48 = v44.st_ino;
        *(_WORD *)&v48[8] = 2048;
        *(_QWORD *)&v48[10] = var0;
        v49 = 2112;
        v50 = (unint64_t)v30;
        _os_log_debug_impl(&dword_230455000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] mismatch on new control file '%s': %llu != %llu\n%@", buf, 0x2Au);
      }

      goto LABEL_37;
    }
    if (!create_control_file(v21, &v44.st_ino, 1))
    {
      v36 = v44.st_ino;
      a4->var0 = a3->var1;
      a4->var1 = v36;
      a4->var2 = a3->var2 + 1;
      goto LABEL_38;
    }
    goto LABEL_29;
  }
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(BRCDatabaseManager) _stepBackupDetector:newState:error:].cold.1();

  if (create_control_file(v21, &v44.st_ino, 1))
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_32;
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, (os_log_type_t)0x90u))
      goto LABEL_31;
    v29 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    st_ino = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
    v47 = 2080;
    if (!a5)
      v29 = "(ignored by caller)";
    goto LABEL_48;
  }
LABEL_37:
  var2 = a3->var2;
  *(_OWORD *)&a4->var0 = *(_OWORD *)&a3->var0;
  a4->var2 = var2;
  a4->var0 = v44.st_ino;
LABEL_38:
  brc_bread_crumbs();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v37 = a3->var0;
    v38 = a3->var1;
    v39 = a4->var0;
    v40 = a4->var1;
    v41 = a3->var2;
    v42 = a4->var2;
    *(_DWORD *)buf = 134219522;
    st_ino = (const char *)v37;
    v47 = 2048;
    *(_QWORD *)v48 = v39;
    *(_WORD *)&v48[8] = 2048;
    *(_QWORD *)&v48[10] = v38;
    v49 = 2048;
    v50 = v40;
    v51 = 2048;
    v52 = v41;
    v53 = 2048;
    v54 = v42;
    v55 = 2112;
    v56 = v16;
    _os_log_debug_impl(&dword_230455000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] database backup detector updated {old:%llu -> %llu; new:%llu -> %llu; c:%llu -> %llu}%@",
      buf,
      0x48u);
  }

  v19 = 1;
LABEL_41:

  return v19;
}

- (void)preventDatabaseFromBeingReused
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-odd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_dbURL, "URLByAppendingPathComponent:", CFSTR("control-even"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v3, &v15);
  v7 = v15;
  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v3;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't remove %@: %@%@", buf, 0x20u);
    }

  }
  v14 = v7;
  v10 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v14);
  v11 = v14;

  if ((v10 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] can't remove %@: %@%@", buf, 0x20u);
    }

  }
}

- (id)fixObfuscatedMangledID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  if (!self->_forDBDump)
    goto LABEL_6;
  if (fixObfuscatedMangledID__onceToken != -1)
    dispatch_once(&fixObfuscatedMangledID__onceToken, &__block_literal_global_89);
  v5 = objc_msgSend(v4, "length");
  v7 = objc_msgSend((id)fixObfuscatedMangledID____regex, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5);
  if (v7 || v6 != v5)
  {
    objc_msgSend(v4, "substringWithRange:", v7, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

void __68__BRCAccountSessionFPFS_BRCDatabaseManager__fixObfuscatedMangledID___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("[a-zA-Z0-9\\-]+\\.[a-zA-Z0-9\\-\\.]+"), 0, 0);
  v1 = (void *)fixObfuscatedMangledID____regex;
  fixObfuscatedMangledID____regex = v0;

}

- (BOOL)saveServerZone:(id)a3 toDB:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v14;
  NSObject *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveServerZone:toDB:].cold.2();

  }
  objc_msgSend(v5, "plist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "execute:", CFSTR("UPDATE server_zones SET zone_plist = %@ WHERE rowid = %@"), v8, v9);

  if (v10)
  {
    objc_msgSend(v5, "setNeedsSave:", 0);
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveServerZone:toDB:].cold.1();

  }
  return v10;
}

- (BOOL)saveServerZoneToDB:(id)a3
{
  return -[BRCAccountSessionFPFS saveServerZone:toDB:](self, "saveServerZone:toDB:", a3, self->_serverDB);
}

- (BOOL)saveClientZoneToDB:(id)a3
{
  id v4;
  void *v5;
  BRCPQLConnection *clientDB;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v13;
  NSObject *v14;

  v4 = a3;
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveClientZoneToDB:].cold.2();

  }
  clientDB = self->_clientDB;
  objc_msgSend(v4, "plist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("UPDATE client_zones SET zone_plist = %@ WHERE rowid = %@"), v7, v8);

  if (v9)
  {
    objc_msgSend(v4, "setNeedsSave:", 0);
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveClientZoneToDB:].cold.1();

  }
  return v9;
}

- (BOOL)createServerZone:(id)a3
{
  NSObject *v4;
  BRCPQLConnection *serverDB;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  BRCPQLConnection *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  BRCPQLConnection *v27;
  void *v28;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  serverDB = self->_serverDB;
  -[NSObject ownerName](v4, "ownerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject zoneName](v4, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject plist](v4, "plist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(serverDB) = -[BRCPQLConnection execute:](serverDB, "execute:", CFSTR("INSERT OR IGNORE INTO server_zones (zone_owner, zone_name, zone_plist) VALUES (%@, %@, %@)"), v6, v7, v8);

  if ((serverDB & 1) != 0)
  {
    if (-[BRCPQLConnection changes](self->_serverDB, "changes") < 1)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
        -[BRCAccountSessionFPFS(BRCDatabaseManager) createServerZone:].cold.3();

      v19 = self->_serverDB;
      -[NSObject ownerName](v4, "ownerName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject zoneName](v4, "zoneName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PQLConnection numberWithSQL:](v19, "numberWithSQL:", CFSTR("SELECT rowid from server_zones WHERE zone_owner = %@ and zone_name = %@"), v20, v21);

      if (!v10)
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          -[BRCAccountSessionFPFS(BRCDatabaseManager) createServerZone:].cold.2();

      }
      -[NSObject dbRowID](v4, "dbRowID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        brc_bread_crumbs();
        v23 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          -[NSObject dbRowID](v4, "dbRowID");
          v31 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v36 = v31;
          v37 = 2112;
          v38 = (uint64_t)v10;
          v39 = 2112;
          v40 = v23;
          _os_log_fault_impl(&dword_230455000, v24, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: got a new rowid for already existing zone (sct.dbRowID=%@ rowID=%@)%@", buf, 0x20u);

        }
      }
      else
      {
        -[NSObject setDbRowID:](v4, "setDbRowID:", v10);
      }
      v27 = self->_serverDB;
      -[NSObject plist](v4, "plist");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v27) = -[BRCPQLConnection execute:](v27, "execute:", CFSTR("UPDATE server_zones SET zone_plist = %@ WHERE rowid = %@"), v28, v10);

      if ((v27 & 1) != 0)
        goto LABEL_25;
      brc_bread_crumbs();
      v11 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        -[BRCPQLConnection lastError](self->_serverDB, "lastError");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v4;
        v37 = 2112;
        v38 = (uint64_t)v32;
        v39 = 2112;
        v40 = v11;
        _os_log_fault_impl(&dword_230455000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to update plist for zone %@: %@%@", buf, 0x20u);

      }
    }
    else
    {
      -[NSObject dbRowID](v4, "dbRowID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setDbRowID:](v4, "setDbRowID:", v25);

        -[NSObject dbRowID](v4, "dbRowID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
LABEL_26:
          -[NSObject ownerName](v4, "ownerName");
          v14 = objc_claimAutoreleasedReturnValue();
          -[BRCAccountSessionFPFS createUserKeyForOwnerName:](self, "createUserKeyForOwnerName:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15 != 0;
          goto LABEL_27;
        }
        brc_bread_crumbs();
        v10 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BRCAccountSessionFPFS(BRCDatabaseManager) saveServerZone:toDB:].cold.2();
        goto LABEL_24;
      }
      brc_bread_crumbs();
      v10 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      -[NSObject dbRowID](v4, "dbRowID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID");
      *(_DWORD *)buf = 138412802;
      v36 = v12;
      v37 = 2048;
      v38 = v13;
      v39 = 2112;
      v40 = v10;
      _os_log_fault_impl(&dword_230455000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: sct.dbRowID is %@ lastInsertedRow is %lld%@", buf, 0x20u);
    }

    goto LABEL_24;
  }
  brc_bread_crumbs();
  v14 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
  {
    -[BRCPQLConnection lastError](self->_serverDB, "lastError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v36 = v4;
    v37 = 2112;
    v38 = (uint64_t)v30;
    v39 = 2112;
    v40 = v14;
    _os_log_error_impl(&dword_230455000, v15, (os_log_type_t)0x90u, "[ERROR] Failed to create server zone %@:  %@%@", buf, 0x20u);

  }
  v16 = 0;
LABEL_27:

  return v16;
}

- (BOOL)deleteServerZone:(id)a3
{
  BRCPQLConnection *serverDB;
  void *v4;

  serverDB = self->_serverDB;
  objc_msgSend(a3, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(serverDB) = -[BRCPQLConnection execute:](serverDB, "execute:", CFSTR("DELETE FROM server_zones WHERE rowid = %@"), v4);

  return (char)serverDB;
}

- (void)_enumerateAppLibraryRowIDs:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, void *, void *))a4;
  v6 = (void *)objc_msgSend(v10, "fetch:", CFSTR("SELECT container_id, rowid FROM rowid_reservations"));
  if (objc_msgSend(v6, "next"))
  {
    do
    {
      v7 = (void *)MEMORY[0x2348B9F14]();
      objc_msgSend(v6, "stringAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v8, v9);

      objc_autoreleasePoolPop(v7);
    }
    while ((objc_msgSend(v6, "next") & 1) != 0);
  }
  objc_msgSend(v6, "close");

}

- (id)_reserveRowIDForLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  if (!-[BRCPQLConnection execute:](self->_serverDB, "execute:", CFSTR("INSERT INTO rowid_reservations (container_id) VALUES (%@)"), v4))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[BRCPQLConnection lastError](self->_serverDB, "lastError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v11 = v4;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_fault_impl(&dword_230455000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: couldn't allocate a rowid. libraryID %@ error %@%@", buf, 0x20u);

    }
    v5 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) createServerZone:].cold.2();
LABEL_8:

  }
  return v5;
}

- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4 supportsEnhancedDrivePrivacy:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v22;
  NSObject *v23;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "zoneRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:].cold.2();

  }
  objc_msgSend(v7, "plist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "childBasehashSalt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v7, "saltingState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dbRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "execute:", CFSTR("UPDATE app_libraries SET app_library_plist = %@, zone_rowid = %@, child_basehash_salt = %@, salting_state = %@ WHERE rowid = %@"), v10, v11, v12, v13, v14);

    if (v15)
    {
LABEL_4:
      objc_msgSend(v7, "setNeedsSave:", 0);
      v16 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v7, "dbRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "execute:", CFSTR("UPDATE app_libraries SET app_library_plist = %@, zone_rowid = %@ WHERE rowid = %@"), v10, v11, v17);

    if (v18)
      goto LABEL_4;
  }
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    -[BRCAccountSessionFPFS(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:].cold.1();

  v16 = 0;
LABEL_9:

  return v16;
}

- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[BRCAccountSessionFPFS saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:](self, "saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:", v7, v6, objc_msgSend(v8, "supportsEnhancedDrivePrivacy"));

  return (char)self;
}

- (BOOL)saveAppLibraryToDB:(id)a3
{
  return -[BRCAccountSessionFPFS saveAppLibrary:toDB:](self, "saveAppLibrary:toDB:", a3, self->_clientDB);
}

- (id)newAppLibraryFromPQLResultSet:(id)a3 version:(int)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCAppLibrary *v16;
  void *v17;
  BRCAppLibrary *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  objc_msgSend(v6, "numberAtIndex:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  objc_msgSend(v6, "stringAtIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithAppLibraryName:", v9);
  _BRCClassesForContainerState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:atIndex:", v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "numberAtIndex:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 3)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberAtIndex:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v15, "intValue");

  }
  v16 = [BRCAppLibrary alloc];
  objc_msgSend(v6, "db");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v7;
  BYTE2(v20) = 0;
  LOWORD(v20) = 0;
  v18 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v16, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v10, v22, v13, v17, v12, self, v20, 0, v14, v21);

  return v18;
}

- (BOOL)_createAppLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BRCPQLConnection *clientDB;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;

  v4 = a3;
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _createAppLibrary:].cold.2();

  }
  objc_msgSend(v4, "zoneRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:].cold.2();

  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsEnhancedDrivePrivacy");

  clientDB = self->_clientDB;
  objc_msgSend(v4, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLibraryID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneRowID");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v8)
  {
    objc_msgSend(v4, "childBasehashSalt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v4, "saltingState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("INSERT OR REPLACE INTO app_libraries (rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state)  VALUES (%@, %@, %@, %@, %@, %@)"), v10, v11, v12, v14, v15, v16);

  }
  else
  {
    v17 = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("INSERT OR REPLACE INTO app_libraries (rowid, app_library_name, app_library_plist, zone_rowid)  VALUES (%@, %@, %@, %@)"), v10, v11, v12, v13);
  }

  return v17;
}

- (BOOL)_deleteAppLibrary:(id)a3
{
  BRCPQLConnection *clientDB;
  void *v4;

  clientDB = self->_clientDB;
  objc_msgSend(a3, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(clientDB) = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("DELETE FROM app_libraries WHERE rowid = %@"), v4);

  return (char)clientDB;
}

- (id)_appLibrariesEnumerator:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsEnhancedDrivePrivacy");

  if (v6)
    v7 = 3;
  else
    v7 = 2;
  if (self->_forDBDump)
  {
    objc_msgSend(v4, "userVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongValue");

    if (v9 >= 0x7544)
      v7 = v7;
    else
      v7 = 2;
  }
  -[BRCAccountSessionFPFS _appLibrariesEnumerator:version:](self, "_appLibrariesEnumerator:version:", v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_appLibrariesEnumerator:(id)a3 version:(int)a4
{
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  int v12;

  if (a4 <= 2)
    v7 = CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries");
  else
    v7 = CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state FROM app_libraries");
  v8 = (void *)objc_msgSend(a3, "fetch:", v7);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__BRCAccountSessionFPFS_BRCDatabaseManager___appLibrariesEnumerator_version___block_invoke;
  v11[3] = &unk_24FE3FFE8;
  v11[4] = self;
  v12 = a4;
  objc_msgSend(v8, "enumerateObjects:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __77__BRCAccountSessionFPFS_BRCDatabaseManager___appLibrariesEnumerator_version___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newAppLibraryFromPQLResultSet:version:", a2, *(unsigned int *)(a1 + 40));
}

- (id)_appLibraryByName:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsEnhancedDrivePrivacy");

  if (v9)
    v10 = CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state FROM app_libraries WHERE app_library_name = %@");
  else
    v10 = CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries WHERE app_library_name = %@");
  v11 = (void *)objc_msgSend(v6, "fetch:", v10, v7);

  v12 = 0;
  if (objc_msgSend(v11, "next"))
  {
    if (v9)
      v13 = 3;
    else
      v13 = 2;
    v12 = -[BRCAccountSessionFPFS newAppLibraryFromPQLResultSet:version:](self, "newAppLibraryFromPQLResultSet:version:", v11, v13);
  }

  return v12;
}

- (BOOL)_createClientZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BRCPQLConnection *clientDB;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  NSObject *v18;

  v4 = a3;
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveClientZoneToDB:].cold.2();

  }
  objc_msgSend(v4, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)*MEMORY[0x24BDB8E88];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  clientDB = self->_clientDB;
  objc_msgSend(v4, "dbRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("INSERT OR REPLACE INTO client_zones (rowid, zone_owner, zone_name, zone_plist) VALUES (%@, %@, %@, %@)"), v12, v10, v13, v14);
  return v15;
}

- (BOOL)_deleteClientZone:(id)a3
{
  BRCPQLConnection *clientDB;
  void *v4;

  clientDB = self->_clientDB;
  objc_msgSend(a3, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(clientDB) = -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("DELETE FROM client_zones where rowid = %@"), v4);

  return (char)clientDB;
}

- (id)newSharedClientZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCSharedClientZone *v13;
  void *v15;
  NSObject *v16;

  v5 = a3;
  objc_msgSend(v5, "numberAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithZoneName:ownerName:", v9, v7);
  _BRCClassesForContainerState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:atIndex:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) newSharedClientZoneFromPQLResultSet:error:].cold.1();

  }
  v13 = -[BRCClientZone initWithMangledID:dbRowID:plist:session:initialCreation:]([BRCSharedClientZone alloc], "initWithMangledID:dbRowID:plist:session:initialCreation:", v10, v6, v12, self, 0);

  return v13;
}

- (id)_sharedClientZonesEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[BRCAccountSessionFPFS clientDB](self, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner != %@"), *MEMORY[0x24BDB8E88]);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__BRCAccountSessionFPFS_BRCDatabaseManager___sharedClientZonesEnumerator__block_invoke;
  v7[3] = &unk_24FE40010;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __73__BRCAccountSessionFPFS_BRCDatabaseManager___sharedClientZonesEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSharedClientZoneFromPQLResultSet:error:", a2, a3);
}

- (id)newSharedServerZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCSharedServerZone *v13;
  void *v15;
  NSObject *v16;

  v5 = a3;
  objc_msgSend(v5, "numberAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithZoneName:ownerName:", v9, v7);
  _BRCClassesForContainerState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:atIndex:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) newSharedServerZoneFromPQLResultSet:error:].cold.1();

  }
  v13 = -[BRCSharedServerZone initWithMangledID:dbRowID:plist:session:]([BRCSharedServerZone alloc], "initWithMangledID:dbRowID:plist:session:", v10, v6, v12, self);

  return v13;
}

- (id)_sharedServerZonesEnumerator:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v4 = (void *)objc_msgSend(a3, "fetch:", CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner != %@"), *MEMORY[0x24BDB8E88]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__BRCAccountSessionFPFS_BRCDatabaseManager___sharedServerZonesEnumerator___block_invoke;
  v7[3] = &unk_24FE40010;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __74__BRCAccountSessionFPFS_BRCDatabaseManager___sharedServerZonesEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSharedServerZoneFromPQLResultSet:error:", a2, a3);
}

- (id)_sharedServerZoneByName:(id)a3 ownerName:(id)a4 db:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__BRCAccountSessionFPFS_BRCDatabaseManager___sharedServerZoneByName_ownerName_db___block_invoke;
  v6[3] = &unk_24FE40010;
  v6[4] = self;
  return (id)objc_msgSend(a5, "fetchObject:sql:", v6, CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@ AND zone_name = %@"), a4, a3);
}

id __82__BRCAccountSessionFPFS_BRCDatabaseManager___sharedServerZoneByName_ownerName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newSharedServerZoneFromPQLResultSet:error:", a2, a3);
}

- (id)newPrivateClientZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRCPrivateClientZone *v12;
  void *v14;
  NSObject *v15;

  v5 = a3;
  objc_msgSend(v5, "numberAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithZoneName:ownerName:", v8, 0);
  _BRCClassesForContainerState();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:atIndex:", v10, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) newSharedServerZoneFromPQLResultSet:error:].cold.1();

  }
  v12 = -[BRCPrivateClientZone initWithMangledID:dbRowID:plist:session:initialCreation:]([BRCPrivateClientZone alloc], "initWithMangledID:dbRowID:plist:session:initialCreation:", v9, v6, v11, self, 0);

  return v12;
}

- (id)_privateClientZonesEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[BRCAccountSessionFPFS clientDB](self, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@"), *MEMORY[0x24BDB8E88]);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZonesEnumerator__block_invoke;
  v7[3] = &unk_24FE40010;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __74__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZonesEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateClientZoneFromPQLResultSet:error:", a2, a3);
}

- (id)_privateClientZoneByName:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZoneByName_db___block_invoke;
  v5[3] = &unk_24FE40010;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@ AND zone_name = %@ AND zone_plist IS NOT NULL"), *MEMORY[0x24BDB8E88], a3);
}

id __73__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZoneByName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateClientZoneFromPQLResultSet:error:", a2, a3);
}

- (id)_privateClientZoneByID:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZoneByID_db___block_invoke;
  v5[3] = &unk_24FE40010;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@ AND rowid = %@"), *MEMORY[0x24BDB8E88], a3);
}

id __71__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZoneByID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateClientZoneFromPQLResultSet:error:", a2, a3);
}

- (id)newPrivateServerZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRCPrivateServerZone *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;

  v5 = a3;
  objc_msgSend(v5, "numberAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS fixObfuscatedMangledID:](self, "fixObfuscatedMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithZoneName:ownerName:", v8, 0);
  _BRCClassesForContainerState();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:atIndex:", v10, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v9)
      goto LABEL_3;
    goto LABEL_7;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    -[BRCAccountSessionFPFS(BRCDatabaseManager) newSharedClientZoneFromPQLResultSet:error:].cold.1();

  if (!v9)
  {
LABEL_7:
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) newPrivateServerZoneFromPQLResultSet:error:].cold.1();

  }
LABEL_3:
  v12 = -[BRCServerZone initWithMangledID:dbRowID:plist:session:]([BRCPrivateServerZone alloc], "initWithMangledID:dbRowID:plist:session:", v9, v6, v11, self);

  return v12;
}

- (id)_privateServerZoneByName:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__BRCAccountSessionFPFS_BRCDatabaseManager___privateServerZoneByName_db___block_invoke;
  v5[3] = &unk_24FE40010;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@ AND zone_name = %@"), *MEMORY[0x24BDB8E88], a3);
}

id __73__BRCAccountSessionFPFS_BRCDatabaseManager___privateServerZoneByName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateServerZoneFromPQLResultSet:error:", a2, a3);
}

- (id)_privateServerZonesEnumerator:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v4 = (void *)objc_msgSend(a3, "fetch:", CFSTR("SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@"), *MEMORY[0x24BDB8E88]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__BRCAccountSessionFPFS_BRCDatabaseManager___privateServerZonesEnumerator___block_invoke;
  v7[3] = &unk_24FE40010;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __75__BRCAccountSessionFPFS_BRCDatabaseManager___privateServerZonesEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newPrivateServerZoneFromPQLResultSet:error:", a2, a3);
}

- (id)itemsNeedingIndexingEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = (void *)objc_msgSend(v8, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items AS li   WHERE li.item_notifs_rank >= %lld     AND li.item_type != 3   ORDER BY li.item_notifs_rank ASC LIMIT %lld"), a3, a4);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __102__BRCAccountSessionFPFS_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke;
  v13[3] = &unk_24FE40038;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjects:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __102__BRCAccountSessionFPFS_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)itemsWithSideCarInFlightDiffsEnumerator
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = -[BRCPQLConnection fetch:](self->_clientDB, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0"), &unk_24FEB3200);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __84__BRCAccountSessionFPFS_BRCDatabaseManager__itemsWithSideCarInFlightDiffsEnumerator__block_invoke;
  v6[3] = &unk_24FE40010;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __84__BRCAccountSessionFPFS_BRCDatabaseManager__itemsWithSideCarInFlightDiffsEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (id)deviceKeyForName:(id)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT key FROM devices WHERE name = %@"), a3);
}

- (id)createDeviceKeyForNameInServerDB:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  if (!v4)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  -[BRCAccountSessionFPFS deviceKeyForName:db:](self, "deviceKeyForName:db:", v4, self->_serverDB);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_11;
  if (!-[BRCPQLConnection execute:](self->_serverDB, "execute:", CFSTR("INSERT INTO devices (name) VALUES (%@)"), v4))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) createDeviceKeyForNameInServerDB:].cold.2();

    goto LABEL_10;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(BRCDatabaseManager) createDeviceKeyForNameInServerDB:].cold.1();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v5;
}

+ (id)userIdentityForKey:(id)a3 db:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT user_plist FROM users WHERE user_key = %@"), v6);

  return v7;
}

- (id)userIdentityForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "userIdentityForKey:db:", v4, self->_clientDB);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userIdentityForName:(id)a3 db:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT user_plist FROM users WHERE user_name = %@"), v6);

  return v7;
}

- (void)_setUserIdentity:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  objc_msgSend(v6, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "br_formattedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _setUserIdentity:forName:].cold.3();

  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] learning name '%@' for user %@%@", buf, 0x20u);
  }

  if (!v6)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _setUserIdentity:forName:].cold.2();

  }
  v12 = -[BRCAccountSessionFPFS createUserKeyForOwnerName:](self, "createUserKeyForOwnerName:", v7);
  if (!-[BRCPQLConnection execute:](self->_serverDB, "execute:", CFSTR("UPDATE users SET user_plist = %@ WHERE user_name = %@"), v6, v7))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      -[BRCPQLConnection lastError](self->_serverDB, "lastError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v7;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v13;
      _os_log_fault_impl(&dword_230455000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't insert user identity for name '%@': %@%@", buf, 0x20u);

    }
  }
  if (-[BRCPQLConnection changes](self->_serverDB, "changes") != 1)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _setUserIdentity:forName:].cold.1();

  }
}

- (void)learnParticipantIdentitiesForShare:(id)a3 forceUpdate:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  BRFieldUserIdentity *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BRFieldUserIdentity *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  BRCAccountSessionFPFS *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  BRFieldUserIdentity *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33 = self;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v31 = v6;
  objc_msgSend(v6, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v36;
    v34 = *MEMORY[0x24BDB8E88];
    *(_QWORD *)&v9 = 138412290;
    v28 = v9;
    v32 = a4;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
        if ((objc_msgSend(v13, "isCurrentUser", v28) & 1) == 0 && objc_msgSend(v13, "acceptanceStatus") == 2)
        {
          objc_msgSend(v13, "userIdentity");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            -[NSObject userRecordID](v14, "userRecordID");
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              brc_bread_crumbs();
              v17 = (BRFieldUserIdentity *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v40 = v13;
                v41 = 2112;
                v42 = v15;
                v43 = 2112;
                v44 = v17;
                _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] user %@ has identity %@%@", buf, 0x20u);
              }

              -[NSObject userRecordID](v15, "userRecordID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "recordName");
              v20 = objc_claimAutoreleasedReturnValue();

              if ((-[NSObject isEqualToString:](v20, "isEqualToString:", v34) & 1) == 0)
              {
                if (a4
                  || (objc_msgSend((id)objc_opt_class(), "userIdentityForName:db:", v20, v33->_serverDB),
                      v21 = (void *)objc_claimAutoreleasedReturnValue(),
                      v21,
                      !v21))
                {
                  -[NSObject nameComponents](v15, "nameComponents");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v22)
                  {
                    v23 = -[BRFieldUserIdentity initWithCKUserIdentity:]([BRFieldUserIdentity alloc], "initWithCKUserIdentity:", v15);
                    -[BRFieldUserIdentity nameComponents](v23, "nameComponents");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "br_formattedName");
                    v25 = objc_claimAutoreleasedReturnValue();

                    if (!v25)
                    {
                      brc_bread_crumbs();
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      brc_default_log();
                      v26 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = v28;
                        v40 = v30;
                        _os_log_fault_impl(&dword_230455000, v26, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: userFormattedName != nil%@", buf, 0xCu);
                      }

                    }
                    -[BRCAccountSessionFPFS _setUserIdentity:forName:](v33, "_setUserIdentity:forName:", v23, v20);
                    a4 = v32;
                  }
                  else
                  {
                    brc_bread_crumbs();
                    v23 = (BRFieldUserIdentity *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
                    {
                      -[NSObject debugDescription](v15, "debugDescription");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v40 = v29;
                      v41 = 2112;
                      v42 = v20;
                      v43 = 2112;
                      v44 = v23;
                      _os_log_fault_impl(&dword_230455000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: nameless identity: %@ (user %@)%@", buf, 0x20u);

                    }
                  }

                }
              }
              goto LABEL_26;
            }
          }
          else
          {
            if (objc_msgSend(v13, "role") == 1)
            {
              brc_bread_crumbs();
              v16 = objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v13;
                v41 = 2112;
                v42 = v16;
                _os_log_fault_impl(&dword_230455000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: owner %@ with no user identity%@", buf, 0x16u);
              }
            }
            else
            {
              brc_bread_crumbs();
              v16 = objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v13;
                v41 = 2112;
                v42 = v16;
                _os_log_debug_impl(&dword_230455000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Participant %@ has no user identity%@", buf, 0x16u);
              }
            }
LABEL_26:

          }
        }
        ++v12;
      }
      while (v10 != v12);
      v27 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      v10 = v27;
    }
    while (v27);
  }

}

- (id)userKeyForOwnerName:(id)a3 db:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB8E88]) & 1) != 0)
    v7 = &unk_24FEB3218;
  else
    v7 = (void *)objc_msgSend(v6, "numberWithSQL:", CFSTR("SELECT user_key FROM users WHERE user_name = %@"), v5);

  return v7;
}

- (id)userNameForKey:(id)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "stringWithSQL:", CFSTR("SELECT user_name FROM users WHERE user_key = %@"), a3);
}

- (id)createUserKeyForOwnerName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) createUserKeyForOwnerName:].cold.1();

    goto LABEL_15;
  }
  -[BRCAccountSessionFPFS userKeyForOwnerName:db:](self, "userKeyForOwnerName:db:", v4, self->_serverDB);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (-[BRCPQLConnection execute:](self->_serverDB, "execute:", CFSTR("INSERT INTO users (user_name) VALUES (%@)"), v4))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSessionFPFS(BRCDatabaseManager) createUserKeyForOwnerName:].cold.2();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[BRCPQLConnection lastError](self->_serverDB, "lastError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = v12;
      _os_log_fault_impl(&dword_230455000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't insert user name: '%@': %@%@", buf, 0x20u);

    }
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  v7 = v5;
  v6 = v7;
LABEL_11:
  v11 = v7;
LABEL_16:

  return v11;
}

+ (id)nameComponentsForKey:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "br_isEqualToNumber:", &unk_24FEB3218) & 1) == 0)
  {
    objc_msgSend(a1, "userIdentityForKey:db:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "nameComponents");
    else
      +[BRFieldUserIdentity unknownPersonNameComponents](BRFieldUserIdentity, "unknownPersonNameComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)nameComponentsForName:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB8E88]) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "userIdentityForName:db:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "nameComponents");
    else
      +[BRFieldUserIdentity unknownPersonNameComponents](BRFieldUserIdentity, "unknownPersonNameComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_clearNeedsUpgradeErrorsWithBrVersion:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(BRCDatabaseManager) _clearNeedsUpgradeErrorsWithBrVersion:].cold.1();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[BRCAccountSessionFPFS _privateClientZonesEnumerator](self, "_privateClientZonesEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v11, "state") & 0x200000) != 0)
        {
          objc_msgSend(v11, "_forDBUpgrade_setStateBits:clearStateBits:", 16, 0x200000);
          -[BRCAccountSessionFPFS saveClientZoneToDB:](self, "saveClientZoneToDB:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[BRCAccountSessionFPFS _sharedClientZonesEnumerator](self, "_sharedClientZonesEnumerator", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        if ((objc_msgSend(v17, "state") & 0x200000) != 0)
        {
          objc_msgSend(v17, "_forDBUpgrade_setStateBits:clearStateBits:", 16, 0x200000);
          -[BRCAccountSessionFPFS saveClientZoneToDB:](self, "saveClientZoneToDB:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[BRCAccountSessionFPFS clientDB](self, "clientDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "execute:", CFSTR("UPDATE client_items SET item_min_supported_os_rowid = NULL"));

}

+ (void)_registerLastBootIfNeeded:(id)a3 table:(id)a4 skipControlFiles:(BOOL)a5 deviceIDChanged:(BOOL *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  char v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  BOOL *v36;
  __darwin_ino64_t v37;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  OSVersion();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BRVersion();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "br_currentSupportDir");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("device-tracking"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileURLWithPath:isDirectory:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  v18 = objc_retainAutorelease(v17);
  if (file_id_from_control_file((const char *)objc_msgSend(v18, "fileSystemRepresentation"), &v37, v7)
    || (objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v37),
        (v22 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[BRCAccountSessionFPFS(BRCDatabaseManager) _registerLastBootIfNeeded:table:skipControlFiles:deviceIDChanged:].cold.1();

    v21 = 0;
    v22 = 0;
  }
  else
  {
    v21 = 1;
  }
  v23 = (void *)objc_msgSend(v9, "fetch:", CFSTR("SELECT os, br, bird_schema, db_schema, device_id FROM %@ ORDER BY rowid DESC LIMIT 1"), v10);
  if (!objc_msgSend(v23, "next"))
  {
    objc_msgSend(v23, "close");
LABEL_24:
    objc_msgSend(v9, "execute:", CFSTR("INSERT INTO %@ (date,os,br,bird_schema,db_schema,device_id) VALUES (%lu,%@,%@,%u,%@,%@)"), v10, time(0), v11, v12, 32003, v13, v22);
    goto LABEL_25;
  }
  v33 = v21;
  v35 = v12;
  v36 = a6;
  v24 = 1;
  objc_msgSend(v23, "stringAtIndex:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringAtIndex:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v11;
  if (objc_msgSend(v11, "isEqualToString:", v26)
    && objc_msgSend(v35, "isEqualToString:", v25)
    && objc_msgSend(v23, "unsignedIntAtIndex:", 2) == 32003)
  {
    objc_msgSend(v23, "numberAtIndex:", 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v13, "br_isEqualToNumber:", v27);
    if ((v33 & v28) == 1)
    {
      objc_msgSend(v23, "numberAtIndex:", 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v28) = objc_msgSend(v22, "br_isEqualToNumber:", v32);

    }
    v24 = v28 ^ 1;

  }
  if (v36)
  {
    objc_msgSend(v23, "numberAtIndex:", 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      v30 = v33;
    else
      v30 = 0;
    if (v30 == 1)
      v31 = objc_msgSend(v22, "br_isEqualToNumber:", v29) ^ 1;
    else
      v31 = 0;
    *v36 = v31;

  }
  objc_msgSend(v23, "close");
  v11 = v34;
  v12 = v35;
  if ((v24 & 1) != 0)
    goto LABEL_24;
LABEL_25:

}

- (int64_t)lastBootHistoryTime
{
  id v3;
  int64_t v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  v3 = -[PQLConnection numberWithSQL:](self->_clientDB, "numberWithSQL:", CFSTR("SELECT date FROM boot_history ORDER BY rowid DESC LIMIT 1"));
  v4 = objc_msgSend(v3, "longValue");

  return v4;
}

+ (BOOL)_checkIntegrity:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 skipControlFiles:(BOOL)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8
{
  _BOOL8 v10;
  _BOOL4 v12;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  const char *v39;
  const char *v40;
  const char *v41;
  id *v42;
  id v43;
  void *v44;
  __int128 v45;
  uint64_t v46;
  _BYTE buf[24];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v10 = a6;
  v12 = a4;
  v53 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v45 = 0uLL;
  v46 = 0;
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    +[BRCAccountSessionFPFS(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFiles:deviceIDChanged:error:].cold.1(v12);

  if (v12)
  {
    v18 = (void *)objc_msgSend(v14, "numberWithSQL:", CFSTR("SELECT count(*) FROM server_state"));
    if ((objc_msgSend(v18, "br_isEqualToNumber:", &unk_24FEB3230) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEDD640], "nameWithString:", CFSTR("server_boot_history"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_registerLastBootIfNeeded:table:skipControlFiles:deviceIDChanged:", v14, v19, v10, a7);

      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
LABEL_44:
      v28 = 1;
      goto LABEL_47;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:description:", 22, CFSTR("missing entry in the server_state table"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        v39 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[BRCAccountSessionFPFS(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControl"
                             "Files:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a8)
          v39 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2112;
        v48 = v25;
        v49 = 2112;
        v50 = v26;
        _os_log_error_impl(&dword_230455000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a8)
      *a8 = objc_retainAutorelease(v25);

    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v28 = 0;
    goto LABEL_47;
  }
  if (v15)
  {
    v24 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT old, new, counter, os, br FROM backup_detector"));
    if (objc_msgSend(v24, "next"))
    {
      *(_QWORD *)&v45 = objc_msgSend(v24, "unsignedLongLongAtIndex:", 0);
      *((_QWORD *)&v45 + 1) = objc_msgSend(v24, "unsignedLongLongAtIndex:", 1);
      v46 = objc_msgSend(v24, "unsignedLongLongAtIndex:", 2);
      objc_msgSend(v24, "stringAtIndex:", 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringAtIndex:", 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
      v44 = 0;
    }
    objc_msgSend(v24, "close");
    if (!v10)
    {
      *(_OWORD *)buf = v45;
      *(_QWORD *)&buf[16] = v46;
      if (!objc_msgSend(v15, "_stepBackupDetector:newState:error:", buf, &v45, a8))
      {
        v18 = 0;
        v20 = 0;
        v21 = 0;
LABEL_46:
        v28 = 0;
        v23 = v44;
        goto LABEL_47;
      }
    }
    v42 = a8;
  }
  else
  {
    v42 = a8;
    v44 = 0;
    v22 = 0;
    v24 = 0;
  }
  OSVersion();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BRVersion();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqualToString:", v20) & 1) == 0)
    objc_msgSend(v15, "_clearNeedsUpgradeErrorsWithBrVersion:", v20);
  if (v15
    && (objc_msgSend(v14, "execute:", CFSTR("UPDATE backup_detector set old = %llu, new = %llu, counter = %llu, br = %@"), v45, v46, v20) & 1) == 0)
  {
    objc_msgSend(v14, "lastError");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        v41 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[BRCAccountSessionFPFS(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControl"
                             "Files:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!v42)
          v41 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2112;
        v48 = v33;
        v49 = 2112;
        v50 = v34;
        _os_log_error_impl(&dword_230455000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (v42)
      *v42 = objc_retainAutorelease(v33);

    v18 = 0;
    goto LABEL_46;
  }
  v18 = (void *)objc_msgSend(v14, "numberWithSQL:", CFSTR("SELECT count(*) FROM client_state"));
  if ((objc_msgSend(v18, "br_isEqualToNumber:", &unk_24FEB3230) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:description:", 22, CFSTR("missing entry in the client_state table"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        v40 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[BRCAccountSessionFPFS(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControl"
                             "Files:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!v42)
          v40 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2112;
        v48 = v30;
        v49 = 2112;
        v50 = v31;
        _os_log_error_impl(&dword_230455000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (v42)
      *v42 = objc_retainAutorelease(v30);

    goto LABEL_46;
  }
  v43 = v15;
  objc_msgSend(MEMORY[0x24BEDD640], "nameWithString:", CFSTR("boot_history"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_registerLastBootIfNeeded:table:skipControlFiles:deviceIDChanged:", v14, v29, v10, a7);

  v23 = v44;
  if (!objc_msgSend(v44, "isEqualToString:", v21)
    || (objc_msgSend(v22, "isEqualToString:", v20) & 1) == 0)
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    v15 = v43;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2112;
      v48 = v20;
      v49 = 2112;
      v50 = v21;
      v51 = 2112;
      v52 = v36;
      _os_log_impl(&dword_230455000, v37, OS_LOG_TYPE_DEFAULT, "[NOTICE] CloudDocs was upgraded from [%@ on %@] to [%@ on %@]%@", buf, 0x34u);
    }

    if (v43)
      objc_msgSend(v14, "execute:", CFSTR("UPDATE backup_detector SET os = %@"), v21);
    goto LABEL_44;
  }
  v28 = 1;
  v15 = v43;
LABEL_47:

  return v28;
}

+ (id)_classesForClientState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = objc_alloc(MEMORY[0x24BDBCF20]);
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v17, "initWithObjects:", v16, v15, v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
}

- (void)_loadClientStateFromDB:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  BRCClientState *v16;
  BRCClientState **p_clientState;
  BRCClientState *clientState;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  id v26;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:].cold.5();

  v7 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT * FROM client_state"));
  +[BRCAccountSessionFPFS _classesForClientState](BRCAccountSessionFPFS, "_classesForClientState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "next"))
  {
    abc_report_panic_with_signature();
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "lastError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("there should always be one row in client_state {%@}"), v22);
    objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher].cold.1();

    brc_append_system_info_to_message();
    v25 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1615, v25);
  }
  objc_msgSend(v7, "dataAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;
    if (v11)
    {
      v12 = v11;
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error while unarchiving client state %@"), v12);
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v15 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1610, v15);
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v7, "close");
  v16 = -[BRCClientState initWithDictionary:clientStateData:]([BRCClientState alloc], "initWithDictionary:clientStateData:", v10, v9);
  p_clientState = &self->_clientState;
  clientState = self->_clientState;
  self->_clientState = v16;

  if (v10)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:].cold.2(p_clientState);
  }
  else
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:].cold.1(p_clientState);
  }

}

- (BOOL)_finishClientTruthConnectionSetupWithError:(id *)a3
{
  BRCPQLConnection *v4;
  NSString *v5;
  NSString *databaseID;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v4 = self->_clientDB;
  -[BRCAccountSessionFPFS _loadClientStateFromDB:](self, "_loadClientStateFromDB:", v4);
  v5 = -[PQLConnection stringWithSQL:](v4, "stringWithSQL:", CFSTR("SELECT uuid FROM backup_detector"));
  databaseID = self->_databaseID;
  self->_databaseID = v5;

  if (!self->_databaseID)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:].cold.1();

  }
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke;
  v20[3] = &unk_24FE400B0;
  objc_copyWeak(&v21, &location);
  -[BRCPQLConnection setPreFlushHook:](v4, "setPreFlushHook:", v20);
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2;
  v18[3] = &unk_24FE400B0;
  objc_copyWeak(&v19, &location);
  -[BRCPQLConnection setPostFlushHook:](v4, "setPostFlushHook:", v18);
  -[BRCPQLConnection autoRollbackHandler](v4, "autoRollbackHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_241;
  v15[3] = &unk_24FE40118;
  objc_copyWeak(&v17, &location);
  v9 = v8;
  v16 = v9;
  -[BRCPQLConnection setAutoRollbackHandler:](v4, "setAutoRollbackHandler:", v15);
  -[BRCPQLConnection execute:](v4, "execute:", CFSTR("CREATE TEMP TRIGGER child_item_count_notifs  AFTER UPDATE OF visible_child_count ON main.client_items  BEGIN  UPDATE client_items SET item_notifs_rank = bump_notifs_rank_and_trigger_notifs(old.rowid)   WHERE old.visible_child_count != new.visible_child_count     AND rowid = old.rowid     AND item_type = 0 ; END"));
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dbBatchDelay");
  -[BRCPQLConnection usePacedBatchingOnTargetQueue:withInterval:changeCount:](v4, "usePacedBatchingOnTargetQueue:withInterval:changeCount:", self->_clientTruthWorkloop, objc_msgSend(v10, "dbBatchSize"), v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return 1;
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25[3];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3();

  }
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    v6 = WeakRetained[24];
    memset(v25, 0, sizeof(v25));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", 1646, v25);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v27 = v25[0];
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v7;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx db pre-flush: flushing client-state %@%@", buf, 0x20u);
    }

    v9 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_229;
    v23[3] = &unk_24FE40060;
    objc_copyWeak(&v24, v4);
    objc_msgSend(WeakRetained, "enumerateServerZones:", v23);
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_231;
    v21[3] = &unk_24FE40088;
    objc_copyWeak(&v22, v4);
    objc_msgSend(WeakRetained, "enumerateAppLibraries:", v21);
    v20 = 0;
    v10 = objc_msgSend(v6, "hasStateChangesAndClearSaveStatusWithResultingState:", &v20);
    v11 = v20;
    if (v10)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_2();

      if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE client_state SET v = %@"), v11) & 1) == 0)
      {
        abc_report_panic_with_signature();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unable to flush client state, crash to maintain consistency"));
        objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          brc_append_system_info_to_message();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(v18, (uint64_t)v16, (uint64_t)buf, v17);
        }

        brc_append_system_info_to_message();
        v19 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
        __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1668, v19);
      }
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    __brc_leave_section(v25);

  }
}

uint64_t __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_229(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  objc_msgSend(a2, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "needsSave"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "saveClientZoneToDB:", v3);

    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_229_cold_1();

  }
  return 1;
}

uint64_t __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_231(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  v3 = a2;
  if (objc_msgSend(v3, "needsSave"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "saveAppLibraryToDB:", v3);

    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_231_cold_1();

  }
  return 1;
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13[3];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3();

  }
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    memset(v13, 0, sizeof(v13));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", 1682, v13);
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_cold_1(v13);

    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "nextNotifRank");

    objc_msgSend(WeakRetained, "notificationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flushUpdatesWithRank:", v8);

    objc_msgSend(WeakRetained, "enumerateClientZones:", &__block_literal_global_240);
    objc_msgSend(WeakRetained, "recentsEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maxNotifRankWasFlushed");

    __brc_leave_section(v13);
  }

}

uint64_t __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_238(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "flushAppliedTombstones");
  return 1;
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_241(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)*MEMORY[0x24BEDD658])
  {
    v11 = objc_msgSend(v9, "code");

    if (v11 != 13)
      goto LABEL_7;
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_241_cold_2();

    +[BRCDaemonFPFS daemon](BRCDaemonFPFS, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restart");
  }

LABEL_7:
  if (objc_msgSend(v9, "brc_isDatabaseRemovalError"))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_241_cold_1();

    +[BRCDaemonFPFS daemon](BRCDaemonFPFS, "daemon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "restart");

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "extensionBackChannel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      v22 = 138412802;
      v23 = WeakRetained;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v19;
      _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %@ - Got error: %@. Invalidating the extension...%@", (uint8_t *)&v22, 0x20u);
    }

    objc_msgSend(WeakRetained, "extensionBackChannel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "invalidateExtension");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_finishServerTruthConnectionSetupWithError:(id *)a3
{
  BRCPQLConnection *serverDB;
  _QWORD v5[5];

  serverDB = self->_serverDB;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishServerTruthConnectionSetupWithError___block_invoke;
  v5[3] = &unk_24FE40140;
  v5[4] = self;
  return -[BRCPQLConnection performWithFlags:action:](serverDB, "performWithFlags:action:", 1, v5);
}

uint64_t __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishServerTruthConnectionSetupWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BRCServerPersistedState *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT state FROM server_state"));
  if ((objc_msgSend(v4, "next") & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = v6;
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("there should always be one row in server_state: %@"), v10);
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v13 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _finishServerTruthConnectionSetupWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1770, v13);
    }
    objc_msgSend(v4, "close");
    goto LABEL_6;
  }
  objc_msgSend(v4, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 0);
  v5 = (BRCServerPersistedState *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "close");
  if (!v5)
  {
LABEL_6:
    v5 = objc_alloc_init(BRCServerPersistedState);
    -[BRCServerPersistedState saveToDB:](v5, "saveToDB:", v3);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 200);
  *(_QWORD *)(v7 + 200) = v5;

  return 1;
}

- (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 initialVersion:(unsigned int *)a5 lastCurrentVersion:(unsigned int *)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8
{
  _BOOL8 v12;
  id v14;

  v12 = a4;
  v14 = a3;
  LOBYTE(a8) = objc_msgSend((id)objc_opt_class(), "openAndValidateDatabase:serverTruth:session:baseURL:skipControlFiles:initialVersion:lastCurrentVersion:deviceIDChanged:error:", v14, v12, self, self->_dbURL, 0, a5, a6, a7, a8);

  return (char)a8;
}

+ (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 baseURL:(id)a6 skipControlFiles:(BOOL)a7 initialVersion:(unsigned int *)a8 lastCurrentVersion:(unsigned int *)a9 deviceIDChanged:(BOOL *)a10 error:(id *)a11
{
  _BOOL8 v15;
  id v17;
  id v18;
  id v19;
  __CFString *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  char v26;
  void *v27;
  NSObject *v28;
  uint64_t v30;
  __CFString *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _BYTE *v36;
  id v37;
  BOOL *v38;
  int v39;
  int v40;
  BOOL v41;
  BOOL v42;
  uint64_t v43;
  uint8_t v44[4];
  __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v15 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = CFSTR("client.db");
  if (v15)
    v20 = CFSTR("server.db");
  v31 = v20;
  v43 = 0;
  brc_bread_crumbs();
  v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    v51 = v21;
    _os_log_debug_impl(&dword_230455000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Opening DB %@ in base URL: %@%@", buf, 0x20u);
  }

  if (objc_msgSend(a1, "_openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:", v17, v15, v31, v19, (char *)&v43 + 4, &v43, a11))
  {
    if (a8)
      *a8 = HIDWORD(v43);
    if (a9)
      *a9 = v43;
    if (HIDWORD(v43) >> 4 >= 0x753)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        +[BRCAccountSessionFPFS(BRCDatabaseManager) openAndValidateDatabase:serverTruth:session:baseURL:skipControlFiles:initialVersion:lastCurrentVersion:deviceIDChanged:error:].cold.1();

      a7 = 1;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v51 = __Block_byref_object_copy__1;
    v52 = __Block_byref_object_dispose__1;
    v53 = 0;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __170__BRCAccountSessionFPFS_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke;
    v32[3] = &unk_24FE40168;
    v33 = v17;
    v37 = a1;
    v34 = v19;
    v25 = v18;
    v41 = v15;
    v39 = HIDWORD(v43);
    v40 = v43;
    v35 = v25;
    v36 = buf;
    v42 = a7;
    v38 = a10;
    v26 = objc_msgSend(v33, "performWithFlags:action:", 10, v32);
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v44 = 138412802;
      v45 = v31;
      v46 = 2112;
      v47 = v30;
      v48 = 2112;
      v49 = v27;
      _os_log_debug_impl(&dword_230455000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Done with %@ DB: error: %@%@", v44, 0x20u);
    }

    if (a11)
      *a11 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

uint64_t __170__BRCAccountSessionFPFS_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;
  id obj;

  if ((objc_msgSend(*(id *)(a1 + 32), "execute:", CFSTR("PRAGMA recursive_triggers = true")) & 1) == 0)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __170__BRCAccountSessionFPFS_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke_cold_1();

  }
  v4 = *(void **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned __int8 *)(a1 + 88);
  v8 = *(unsigned int *)(a1 + 80);
  v9 = *(unsigned int *)(a1 + 84);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v4, "_validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:", v5, v6, v10, v7, v8, v9, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if (!v12)
    return 0;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(unsigned __int8 *)(a1 + 88);
  v15 = *(unsigned __int8 *)(a1 + 89);
  v16 = *(void **)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 72);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v27 = *(id *)(v19 + 40);
  v20 = objc_msgSend(v16, "_checkIntegrity:serverTruth:session:skipControlFiles:deviceIDChanged:error:", v13, v14, v18, v15, v17, &v27);
  objc_storeStrong((id *)(v19 + 40), v27);
  if (!v20)
    return 0;
  v21 = *(void **)(a1 + 48);
  if (!v21)
    return 1;
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(id *)(v23 + 40);
  v24 = objc_msgSend(v21, "_registerDynamicDBFunctions:error:", v22, &v26);
  objc_storeStrong((id *)(v23 + 40), v26);
  return v24;
}

+ (BOOL)_openConnection:(id)a3 serverTruth:(BOOL)a4 databaseName:(id)a5 baseURL:(id)a6 initialVersion:(unsigned int *)a7 lastCurrentVersion:(unsigned int *)a8 error:(id *)a9
{
  id *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  BOOL v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int v40;
  _UNKNOWN **v41;
  int v42;
  void *v43;
  NSObject *v44;
  id v45;
  int v46;
  int v47;
  void *v48;
  NSObject *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  unint64_t v73;
  void *v74;
  NSObject *v75;
  const char *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  const char *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  const char *v85;
  BOOL v86;
  unsigned int *v87;
  id v88;
  int v89;
  id v90;
  uint8_t buf[4];
  _BYTE v92[28];
  __int16 v93;
  void *v94;
  uint64_t v95;

  v14 = a9;
  v95 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.8();

  v90 = 0;
  v20 = +[BRCAccountSessionFPFS _openConnection:databaseName:baseURL:readonly:error:](BRCAccountSessionFPFS, "_openConnection:databaseName:baseURL:readonly:error:", v15, v16, v17, 0, &v90);
  v21 = v90;
  if (v20)
  {
    objc_msgSend(v15, "userVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntValue");

    if (!(_DWORD)v23)
    {
      v35 = 0;
      v36 = 0;
      if (a4)
      {
LABEL_63:
        if (!a7)
        {
LABEL_65:
          if (a8)
            *a8 = v36;
          v34 = 1;
          goto LABEL_68;
        }
LABEL_64:
        *a7 = v35;
        goto LABEL_65;
      }
      goto LABEL_59;
    }
    v87 = a7;
    +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if ((v23 - 3000) > 0x3EA)
    {
      if (v23 > 0x75)
      {
        if (v23 < 0x7D04 || (v23 - 32000) < 0x3E8)
        {

          goto LABEL_56;
        }
        v86 = a4;
        v73 = v23 / 0x3E8uLL;
        brc_bread_crumbs();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
          +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.3();

        +[BRCDatabaseFromTheFutureException raise:format:](BRCDatabaseFromTheFutureException, "raise:format:", CFSTR("DatabaseFromTheFuture"), CFSTR("database has a major version from the future: %d (want at most %d)"), v73, 32);
      }
      else
      {
        v86 = a4;
        brc_bread_crumbs();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.2();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("old-db-%d.%03d"), 0, v23);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "registerAndSendNewContainerResetWithOutcome:", v39);

      }
    }
    else
    {
      v86 = a4;
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (unsigned __int16)v23 / 0x3E8u;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v92 = (unsigned __int16)v23 / 0x3E8u;
        v29 = (unsigned __int16)v23 % 0x3E8u;
        *(_WORD *)&v92[4] = 1024;
        *(_DWORD *)&v92[6] = v29;
        *(_WORD *)&v92[10] = 2112;
        *(_QWORD *)&v92[12] = v26;
        _os_log_fault_impl(&dword_230455000, v27, OS_LOG_TYPE_FAULT, "[CRIT] Internal users only version %d.%03d has seen an ulterior change and needs to be reset%@", buf, 0x18u);
      }
      else
      {
        v29 = (unsigned __int16)v23 % 0x3E8u;
      }

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("internal-db-%d.%03d"), v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "registerAndSendNewContainerResetWithOutcome:", v30);

      v14 = a9;
    }

    v89 = 61;
    v40 = sqlite3_file_control((sqlite3 *)objc_msgSend(v15, "dbHandle"), 0, 101, &v89);
    v41 = &off_24FE3D000;
    if (v40)
    {
      v42 = v40;
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
      {
        v76 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v15, "dbHandle"));
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v92 = v42;
        *(_WORD *)&v92[4] = 2080;
        *(_QWORD *)&v92[6] = v76;
        *(_WORD *)&v92[14] = 2112;
        *(_QWORD *)&v92[16] = v43;
        _os_log_error_impl(&dword_230455000, v44, (os_log_type_t)0x90u, "[ERROR] unable to truncate database: %d; %s%@",
          buf,
          0x1Cu);
      }

      objc_msgSend(v15, "brc_close");
      objc_msgSend(v15, "url");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v46 = unlink((const char *)objc_msgSend(v45, "fileSystemRepresentation"));

      if (v46 < 0)
      {
        v47 = *__error();
        brc_bread_crumbs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, (os_log_type_t)0x90u))
        {
          objc_msgSend(v15, "url");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v92 = v79;
          *(_WORD *)&v92[8] = 1024;
          *(_DWORD *)&v92[10] = v47;
          *(_WORD *)&v92[14] = 2112;
          *(_QWORD *)&v92[16] = v48;
          _os_log_error_impl(&dword_230455000, v49, (os_log_type_t)0x90u, "[ERROR] can't unlink '%@' %{errno}d%@", buf, 0x1Cu);

        }
        *__error() = v47;
        v41 = &off_24FE3D000;
      }
    }
    else
    {
      objc_msgSend(v15, "brc_close");
    }
    v50 = v41[326];
    v88 = v21;
    v51 = objc_msgSend(v50, "_openConnection:databaseName:baseURL:readonly:error:", v15, v16, v17, 0, &v88);
    v33 = v88;

    if ((v51 & 1) == 0)
    {
      brc_bread_crumbs();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, (os_log_type_t)0x90u))
        +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.4();

      if (v14)
        *v14 = objc_retainAutorelease(v33);
      goto LABEL_51;
    }
    objc_msgSend(v15, "userVersion");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v52, "unsignedIntValue");

    a4 = v86;
    if ((_DWORD)v23)
    {
      +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if ((v23 - 3000) <= 0x3EA)
      {
        brc_bread_crumbs();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v92 = (unsigned __int16)v23 / 0x3E8u;
          v57 = (unsigned __int16)v23 % 0x3E8u;
          *(_WORD *)&v92[4] = 1024;
          *(_DWORD *)&v92[6] = (unsigned __int16)v23 % 0x3E8u;
          *(_WORD *)&v92[10] = 2112;
          *(_QWORD *)&v92[12] = v55;
          _os_log_fault_impl(&dword_230455000, v56, OS_LOG_TYPE_FAULT, "[CRIT] Internal users only version %d.%03d has seen an ulterior change and needs to be reset%@", buf, 0x18u);
        }
        else
        {
          v57 = (unsigned __int16)v23 % 0x3E8u;
        }

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("internal-db-%d.%03d"), (unsigned __int16)v23 / 0x3E8u, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "registerAndSendNewContainerResetWithOutcome:", v58);

LABEL_45:
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:description:", 70, CFSTR("db is stale even after recreating"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
        {
          brc_bread_crumbs();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, (os_log_type_t)0x90u))
          {
            v80 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)v92 = "+[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseUR"
                             "L:initialVersion:lastCurrentVersion:error:]";
            *(_WORD *)&v92[8] = 2080;
            if (!v14)
              v80 = "(ignored by caller)";
            *(_QWORD *)&v92[10] = v80;
            *(_WORD *)&v92[18] = 2112;
            *(_QWORD *)&v92[20] = v64;
            v93 = 2112;
            v94 = v65;
            _os_log_error_impl(&dword_230455000, v66, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (v14)
          *v14 = objc_retainAutorelease(v64);

LABEL_51:
        v34 = 0;
        goto LABEL_69;
      }
      if (v23 <= 0x75)
      {
        brc_bread_crumbs();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
          +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.2();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("old-db-%d.%03d"), 0, v23);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "registerAndSendNewContainerResetWithOutcome:", v63);

        goto LABEL_45;
      }
      if (v23 >= 0x7D04 && (v23 - 32000) >= 0x3E8)
      {
        brc_bread_crumbs();
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
          +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.3();

        +[BRCDatabaseFromTheFutureException raise:format:](BRCDatabaseFromTheFutureException, "raise:format:", CFSTR("DatabaseFromTheFuture"), CFSTR("database has a major version from the future: %d (want at most %d)"), v23 / 0x3E8uLL, 32);
        goto LABEL_45;
      }

    }
    v21 = v33;
LABEL_56:
    a7 = v87;
    if (a4)
    {
      if ((_DWORD)v23)
      {
        v67 = CFSTR("SELECT bird_schema FROM server_boot_history ORDER BY rowid DESC LIMIT 1");
LABEL_62:
        v71 = (void *)objc_msgSend(v15, "numberWithSQL:", v67);
        v36 = objc_msgSend(v71, "unsignedIntValue");

        v35 = v23;
        goto LABEL_63;
      }
      goto LABEL_70;
    }
LABEL_59:
    objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("server.db"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "path");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v15, "attachDBAtPath:as:error:", v69, CFSTR("server"), v14);

    if ((v70 & 1) == 0)
    {
      abc_report_panic_with_signature();
      v81 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v15, "lastError");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "stringWithFormat:", CFSTR("we should be able to attach the server db {%@}"), v82);
      objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v85 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("+[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1887, v85);
    }
    if ((_DWORD)v23)
    {
      v67 = CFSTR("SELECT bird_schema FROM boot_history ORDER BY rowid DESC LIMIT 1");
      goto LABEL_62;
    }
LABEL_70:
    v35 = 0;
    v36 = 0;
    if (!a7)
      goto LABEL_65;
    goto LABEL_64;
  }
  brc_bread_crumbs();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
    +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.7();

  if (!a9)
  {
    v34 = 0;
LABEL_68:
    v33 = v21;
    goto LABEL_69;
  }
  v33 = objc_retainAutorelease(v21);
  v34 = 0;
  *a9 = v33;
LABEL_69:

  return v34;
}

+ (BOOL)_validateDatabase:(id)a3 baseURL:(id)a4 session:(id)a5 serverTruth:(BOOL)a6 initialVersion:(unsigned int)a7 lastCurrentVersion:(unsigned int)a8 error:(id *)a9
{
  _BOOL8 v11;
  void *v14;
  NSObject *v15;
  uint64_t (*v16)(uint64_t, void *, char);
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  uint64_t (*v24)(void *, void *, char);
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  char v31;
  uint64_t (*v32)(void *, void *, char);
  uint64_t v33;
  int v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  void *v39;
  NSObject *v40;
  void *v41;
  char v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  BOOL v49;
  uint64_t (*v50)(void *, void *, int, void **);
  uint64_t v51;
  const char *v52;
  unsigned int v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  id *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  id v68;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint8_t buf[4];
  _BYTE v82[32];
  __int16 v83;
  void *v84;
  uint64_t v85;

  v11 = a6;
  v85 = *MEMORY[0x24BDAC8D0];
  v78 = a3;
  v77 = a4;
  v79 = a5;
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    +[BRCAccountSessionFPFS(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:].cold.3(v11);

  v76 = os_transaction_create();
  v16 = br_internal_fixup_10_000;
  if (br_internal_fixup_10_000)
  {
    v17 = 0;
    v18 = 1;
    do
    {
      v19 = *((_DWORD *)&internal_fixups + 4 * v17);
      if (v19 > a7)
        break;
      if (v19 == a7)
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v82 = a8;
          *(_WORD *)&v82[4] = 1024;
          *(_DWORD *)&v82[6] = a7;
          *(_WORD *)&v82[10] = 2112;
          *(_QWORD *)&v82[12] = v20;
          _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] doing an internal fixup from %d to %d%@", buf, 0x18u);
        }

        v80 = 0;
        v22 = (void *)MEMORY[0x2348B9F14]();
        v23 = ((uint64_t (*)(id, id, _BOOL8, id *))v16)(v79, v78, v11, &v80);
        objc_autoreleasePoolPop(v22);
        if ((v23 & 1) == 0)
        {
          brc_bread_crumbs();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = a9;
          if (os_log_type_enabled(v63, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v82 = a8;
            *(_WORD *)&v82[4] = 1024;
            *(_DWORD *)&v82[6] = a7;
            *(_WORD *)&v82[10] = 2112;
            *(_QWORD *)&v82[12] = v80;
            *(_WORD *)&v82[20] = 2112;
            *(_QWORD *)&v82[22] = v62;
            _os_log_error_impl(&dword_230455000, v63, (os_log_type_t)0x90u, "[ERROR] can't internal fixup from version %d to %d: %@%@", buf, 0x22u);
          }

LABEL_67:
          v45 = v78;
LABEL_68:
          v48 = v77;
          if (v64)
LABEL_69:
            *v64 = objc_retainAutorelease(v80);
LABEL_70:

          v49 = 0;
LABEL_71:
          v67 = (void *)v76;
          goto LABEL_77;
        }

      }
      v17 = v18;
      v16 = (uint64_t (*)(uint64_t, void *, char))*((_QWORD *)&internal_fixups + 2 * v18++ + 1);
    }
    while (v16);
  }
  v24 = br_fixup_tables_4_013;
  if (br_fixup_tables_4_013)
  {
    v25 = 0;
    v26 = 1;
    do
    {
      v27 = *((_DWORD *)&schema_fixups + 4 * v25);
      if (v27 > a7)
        break;
      if (v27 > a8)
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v82 = a8;
          *(_WORD *)&v82[4] = 1024;
          *(_DWORD *)&v82[6] = v27;
          *(_WORD *)&v82[10] = 2112;
          *(_QWORD *)&v82[12] = v28;
          _os_log_impl(&dword_230455000, v29, OS_LOG_TYPE_DEFAULT, "[NOTICE] fixuping database from version %d to %d%@", buf, 0x18u);
        }

        v80 = 0;
        v30 = (void *)MEMORY[0x2348B9F14]();
        v31 = ((uint64_t (*)(id, id, _BOOL8, id *))v24)(v79, v78, v11, &v80);
        objc_autoreleasePoolPop(v30);
        if ((v31 & 1) == 0)
        {
          brc_bread_crumbs();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v66 = objc_claimAutoreleasedReturnValue();
          v64 = a9;
          if (os_log_type_enabled(v66, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v82 = a8;
            *(_WORD *)&v82[4] = 1024;
            *(_DWORD *)&v82[6] = v27;
            *(_WORD *)&v82[10] = 2112;
            *(_QWORD *)&v82[12] = v80;
            *(_WORD *)&v82[20] = 2112;
            *(_QWORD *)&v82[22] = v65;
            _os_log_error_impl(&dword_230455000, v66, (os_log_type_t)0x90u, "[ERROR] can't fixup from version %d to %d: %@%@", buf, 0x22u);
          }

          goto LABEL_67;
        }

      }
      v25 = v26;
      v24 = (uint64_t (*)(void *, void *, char))*((_QWORD *)&schema_fixups + 2 * v26++ + 1);
    }
    while (v24);
  }
  v32 = br_unmigrated_items_fixup;
  if (br_unmigrated_items_fixup)
  {
    v33 = 0;
    v34 = 0;
    do
    {
      v35 = (unsigned int *)((char *)&range_fixups + 16 * v33);
      v36 = *v35;
      v37 = v35[1];
      if (*v35 <= a7 && v37 >= a7)
      {
        brc_bread_crumbs();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v82 = v34;
          *(_WORD *)&v82[4] = 1024;
          *(_DWORD *)&v82[6] = a7;
          *(_WORD *)&v82[10] = 1024;
          *(_DWORD *)&v82[12] = v36;
          *(_WORD *)&v82[16] = 1024;
          *(_DWORD *)&v82[18] = v37;
          *(_WORD *)&v82[22] = 2112;
          *(_QWORD *)&v82[24] = v39;
          _os_log_impl(&dword_230455000, v40, OS_LOG_TYPE_DEFAULT, "[NOTICE] running fixup %d on version %d which is in range [%d,%d]%@", buf, 0x24u);
        }

        v80 = 0;
        v41 = (void *)MEMORY[0x2348B9F14]();
        v42 = ((uint64_t (*)(id, id, _BOOL8, id *))v32)(v79, v78, v11, &v80);
        objc_autoreleasePoolPop(v41);
        if ((v42 & 1) == 0)
        {
          brc_bread_crumbs();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)v82 = v34;
            *(_WORD *)&v82[4] = 1024;
            *(_DWORD *)&v82[6] = a7;
            *(_WORD *)&v82[10] = 1024;
            *(_DWORD *)&v82[12] = v36;
            *(_WORD *)&v82[16] = 1024;
            *(_DWORD *)&v82[18] = v37;
            *(_WORD *)&v82[22] = 2112;
            *(_QWORD *)&v82[24] = v80;
            v83 = 2112;
            v84 = v46;
            _os_log_error_impl(&dword_230455000, v47, (os_log_type_t)0x90u, "[ERROR] can't fixup %d on %d which is in range [%d,%d] - %@%@", buf, 0x2Eu);
          }

          v48 = v77;
          if (a9)
            *a9 = objc_retainAutorelease(v80);

          v49 = 0;
          v45 = v78;
          goto LABEL_71;
        }

      }
      v33 = (v34 + 1);
      v32 = (uint64_t (*)(void *, void *, char))*((_QWORD *)&range_fixups + 2 * v33 + 1);
      ++v34;
    }
    while (v32);
  }
  if (a7 < 0x7D04)
  {
    v45 = v78;
    if (a7 == 32003)
    {
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        +[BRCAccountSessionFPFS(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:].cold.1();
    }
    else
    {
      v50 = br_create_tables_initial;
      if (br_create_tables_initial)
      {
        v51 = 0;
        if (v11)
          v52 = "server";
        else
          v52 = "client";
        v53 = 1;
        while (1)
        {
          v54 = *((unsigned int *)&schema_upgrades + 4 * v51);
          if (v54 > a7)
          {
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)v82 = v52;
              *(_WORD *)&v82[8] = 1024;
              *(_DWORD *)&v82[10] = a7;
              *(_WORD *)&v82[14] = 1024;
              *(_DWORD *)&v82[16] = v54;
              *(_WORD *)&v82[20] = 2112;
              *(_QWORD *)&v82[22] = v55;
              _os_log_impl(&dword_230455000, v56, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating %s database from version %d to %d%@", buf, 0x22u);
            }

            v80 = 0;
            v57 = (void *)MEMORY[0x2348B9F14]();
            v58 = v50(v79, v78, v11, &v80);
            objc_autoreleasePoolPop(v57);
            if ((v58 & 1) == 0)
            {
              brc_bread_crumbs();
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v71 = objc_claimAutoreleasedReturnValue();
              v64 = a9;
              if (os_log_type_enabled(v71, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v82 = a7;
                *(_WORD *)&v82[4] = 1024;
                *(_DWORD *)&v82[6] = v54;
                *(_WORD *)&v82[10] = 2112;
                *(_QWORD *)&v82[12] = v80;
                *(_WORD *)&v82[20] = 2112;
                *(_QWORD *)&v82[22] = v70;
                _os_log_error_impl(&dword_230455000, v71, (os_log_type_t)0x90u, "[ERROR] can't migrate from version %d to %d: %@%@", buf, 0x22u);
              }

              goto LABEL_68;
            }
            if ((objc_msgSend(v78, "setUserVersion:", v54) & 1) == 0)
            {
              objc_msgSend(v78, "lastError");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = v80;
              v80 = v72;

              brc_bread_crumbs();
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v75 = objc_claimAutoreleasedReturnValue();
              v48 = v77;
              if (os_log_type_enabled(v75, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v82 = v54;
                *(_WORD *)&v82[4] = 2112;
                *(_QWORD *)&v82[6] = v80;
                *(_WORD *)&v82[14] = 2112;
                *(_QWORD *)&v82[16] = v74;
                _os_log_error_impl(&dword_230455000, v75, (os_log_type_t)0x90u, "[ERROR] can't set user version to %u: %@%@", buf, 0x1Cu);
              }

              v64 = a9;
              if (a9)
                goto LABEL_69;
              goto LABEL_70;
            }
            objc_msgSend(v78, "userVersion");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            a7 = objc_msgSend(v59, "unsignedIntValue");

            if (a7 != (_DWORD)v54)
            {
              brc_bread_crumbs();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v82 = v60;
                _os_log_fault_impl(&dword_230455000, v61, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: db_version == schema_upgrades[i].version%@", buf, 0xCu);
              }

            }
          }
          v51 = v53;
          v50 = (uint64_t (*)(void *, void *, int, void **))*((_QWORD *)&schema_upgrades + 2 * v53++ + 1);
          if (!v50)
          {
            if (a7 == 32003)
              goto LABEL_76;
            break;
          }
        }
      }
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        +[BRCAccountSessionFPFS(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:].cold.2();
    }
  }
  else
  {
    brc_bread_crumbs();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v78;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v82 = a7;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = 32003;
      *(_WORD *)&v82[10] = 2112;
      *(_QWORD *)&v82[12] = v43;
      _os_log_impl(&dword_230455000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] your database comes from a compatible future (db at version %d, current is %d)%@", buf, 0x18u);
    }
  }

LABEL_76:
  v67 = (void *)v76;
  v68 = (id)objc_opt_self();
  v49 = 1;
  v48 = v77;
LABEL_77:

  return v49;
}

+ (BOOL)upgradeOfflineDB:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t (*v18)(void *, void *, int, void **);
  uint64_t v19;
  const char *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  id *v34;
  const char *v35;
  id v36;
  uint8_t buf[4];
  _BYTE v38[30];
  uint64_t v39;

  v8 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "userVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");

  if (v12 >= 32004)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v38 = v12;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = 32003;
      *(_WORD *)&v38[10] = 2112;
      *(_QWORD *)&v38[12] = v13;
      _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] your database comes from a compatible future (db at version %d, current is %d)%@", buf, 0x18u);
    }

    goto LABEL_12;
  }
  if (v12 == 32003)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[BRCAccountSessionFPFS(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:].cold.1();
LABEL_11:

LABEL_12:
LABEL_13:
    v16 = 1;
    goto LABEL_14;
  }
  if ((v12 - 32000) < 0x3E8)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[BRCAccountSessionFPFS(BRCDatabaseManager) upgradeOfflineDB:serverTruth:session:error:].cold.2();
    goto LABEL_11;
  }
  v18 = br_create_tables_initial;
  if (!br_create_tables_initial)
    goto LABEL_13;
  v34 = a6;
  v19 = 0;
  v20 = "client";
  if (v8)
    v20 = "server";
  v35 = v20;
  v21 = 1;
  while (1)
  {
    v22 = *((unsigned int *)&schema_upgrades + 4 * v19);
    if (v22 <= v12)
      goto LABEL_25;
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)v38 = v35;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = v12;
      *(_WORD *)&v38[14] = 1024;
      *(_DWORD *)&v38[16] = v22;
      *(_WORD *)&v38[20] = 2112;
      *(_QWORD *)&v38[22] = v23;
      _os_log_impl(&dword_230455000, v24, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating %s database from version %d to %d%@", buf, 0x22u);
    }

    v36 = 0;
    v25 = (void *)MEMORY[0x2348B9F14]();
    v26 = v18(v10, v9, v8, &v36);
    objc_autoreleasePoolPop(v25);
    if ((v26 & 1) == 0)
      break;
    if ((objc_msgSend(v9, "setUserVersion:", v22) & 1) == 0)
    {
      objc_msgSend(v9, "lastError");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v36;
      v36 = v30;

      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v38 = v22;
        *(_WORD *)&v38[4] = 2112;
        *(_QWORD *)&v38[6] = v36;
        *(_WORD *)&v38[14] = 2112;
        *(_QWORD *)&v38[16] = v32;
        _os_log_error_impl(&dword_230455000, v33, (os_log_type_t)0x90u, "[ERROR] can't set user version to %u: %@%@", buf, 0x1Cu);
      }

      goto LABEL_33;
    }
    objc_msgSend(v9, "userVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v27, "unsignedIntValue");

LABEL_25:
    v19 = v21;
    v18 = (uint64_t (*)(void *, void *, int, void **))*((_QWORD *)&schema_upgrades + 2 * v21++ + 1);
    if (!v18)
      goto LABEL_13;
  }
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v38 = v12;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v22;
    *(_WORD *)&v38[10] = 2112;
    *(_QWORD *)&v38[12] = v36;
    *(_WORD *)&v38[20] = 2112;
    *(_QWORD *)&v38[22] = v28;
    _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] can't migrate from version %d to %d: %@%@", buf, 0x22u);
  }

LABEL_33:
  if (v34)
    *v34 = objc_retainAutorelease(v36);

  v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)runDatabaseFixups
{
  _BOOL4 v3;

  v3 = -[BRCAccountSessionFPFS runDatabaseFixupsForDB:serverTruth:](self, "runDatabaseFixupsForDB:serverTruth:", self->_clientDB, 0);
  if (v3)
    LOBYTE(v3) = -[BRCAccountSessionFPFS runDatabaseFixupsForDB:serverTruth:](self, "runDatabaseFixupsForDB:serverTruth:", self->_serverDB, 1);
  return v3;
}

- (BOOL)runDatabaseFixupsForDB:(id)a3 serverTruth:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __80__BRCAccountSessionFPFS_BRCDatabaseManager__runDatabaseFixupsForDB_serverTruth___block_invoke;
  v5[3] = &unk_24FE3F978;
  v6 = a4;
  v5[4] = self;
  return objc_msgSend(a3, "performWithFlags:action:", 27, v5);
}

BOOL __80__BRCAccountSessionFPFS_BRCDatabaseManager__runDatabaseFixupsForDB_serverTruth___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  char *v18;
  id v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "numberWithSQL:", CFSTR("SELECT max(fixup_version) + 1 FROM completed_db_fixups"));
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (v5 >= 3)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    v7 = v5;
    v8 = 3 - v5;
    while (1)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = "server";
        if (!*(_BYTE *)(a1 + 40))
          v11 = "client";
        *(_DWORD *)buf = 67109634;
        v21 = v7;
        v22 = 2080;
        v23 = v11;
        v24 = 2112;
        v25 = v9;
        _os_log_impl(&dword_230455000, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] Running db fixup %d for %s db%@", buf, 0x1Cu);
      }

      v12 = (void *)MEMORY[0x2348B9F14]();
      v19 = 0;
      if ((((uint64_t (*)(_QWORD, id, _QWORD, id *))db_fixups[v7])(*(_QWORD *)(a1 + 32), v3, *(unsigned __int8 *)(a1 + 40), &v19) & 1) == 0)break;

      objc_autoreleasePoolPop(v12);
      if ((objc_msgSend(v3, "execute:", CFSTR("INSERT INTO completed_db_fixups (fixup_version) VALUES (%u)"), v7) & 1) == 0)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        {
          objc_msgSend(v3, "lastError");
          v18 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          v21 = v7;
          v22 = 2112;
          v23 = v18;
          v24 = 2112;
          v25 = v15;
          _os_log_error_impl(&dword_230455000, v16, (os_log_type_t)0x90u, "[ERROR] failed registering completion of db fixup %d with error %@%@", buf, 0x1Cu);

        }
        goto LABEL_18;
      }
      v6 = (unint64_t)++v7 >= 3;
      if (!--v8)
        goto LABEL_18;
    }
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109634;
      v21 = v7;
      v22 = 2112;
      v23 = (const char *)v19;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] db fixup %d failed %@%@", buf, 0x1Cu);
    }

    objc_autoreleasePoolPop(v12);
  }
LABEL_18:

  return v6;
}

- (BOOL)reimportFPFSDomainWithError:(id *)a3
{
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)*MEMORY[0x24BDC8228];
  v17 = 0;
  v5 = +[BRCImportUtil reimportItemsBelowItemWithIdentifier:error:](BRCImportUtil, "reimportItemsBelowItemWithIdentifier:error:", v4, &v17);
  v6 = v17;
  v7 = v6;
  if (v5)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      v10 = "[NOTICE] Signalled reimport of all FP items%@";
LABEL_7:
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "br_isFileProviderErrorCode:", -1005))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      v10 = "[WARNING] RootContainerItem not found -> Trying to reimport from a domain that we just added. Skip the reimport...%@";
      goto LABEL_7;
    }
LABEL_8:

    v11 = 1;
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v4;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v13;
    _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] Failed to signal reimport of %@ on startup %@%@", buf, 0x20u);
  }

  if (!a3)
  {
    v11 = 0;
    goto LABEL_10;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  v16 = *MEMORY[0x24BE17300];
  v18 = *MEMORY[0x24BDD1398];
  v19 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "br_errorWithDomain:code:userInfo:description:", v16, 100, v8, CFSTR("Failed to signal reimport of root container on startup"));
  v11 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_10:
  return v11;
}

- (BOOL)_decorateFPFSDomainUserInfoWithError:(id *)a3
{
  return -[BRCAccountSessionFPFS _decorateUserInfoForFPFSDomain:panicOnDomainIDMismatch:withError:](self, "_decorateUserInfoForFPFSDomain:panicOnDomainIDMismatch:withError:", self->_fpDomain, 0, a3);
}

- (BOOL)decorateUserInfoForFPFSDomain:(id)a3 withError:(id *)a4
{
  return -[BRCAccountSessionFPFS _decorateUserInfoForFPFSDomain:panicOnDomainIDMismatch:withError:](self, "_decorateUserInfoForFPFSDomain:panicOnDomainIDMismatch:withError:", a3, 1, a4);
}

- (BOOL)_decorateUserInfoForFPFSDomain:(id)a3 panicOnDomainIDMismatch:(BOOL)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *clientTruthWorkloop;
  id v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  const char *v35;
  id v37;
  _QWORD block[4];
  id v39;
  BRCAccountSessionFPFS *v40;
  _BYTE *v41;
  BOOL v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[24];
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_opt_new();
    v16 = v12;

    *(_QWORD *)v45 = 0;
    *(_QWORD *)&v45[8] = v45;
    *(_QWORD *)&v45[16] = 0x2020000000;
    LOBYTE(v46) = 0;
    if (self->_isDataSeparated)
    {
      objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "br_accountForCurrentPersona");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "accountDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if ((v21 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)&v45[8] + 24) = 1;
        v22 = objc_alloc(MEMORY[0x24BDC83C0]);
        objc_msgSend(v8, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "accountDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "initWithIdentifier:displayName:", v23, v24);

        v8 = (id)v25;
      }

    }
    clientTruthWorkloop = self->_clientTruthWorkloop;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __110__BRCAccountSessionFPFS_BRCDatabaseManager___decorateUserInfoForFPFSDomain_panicOnDomainIDMismatch_withError___block_invoke;
    block[3] = &unk_24FE40190;
    v27 = v16;
    v39 = v27;
    v40 = self;
    v41 = v45;
    v42 = a4;
    dispatch_async_and_wait(clientTruthWorkloop, block);
    if (*(_BYTE *)(*(_QWORD *)&v45[8] + 24))
    {
      objc_msgSend(v8, "setUserInfo:", v27);
      objc_msgSend(MEMORY[0x24BE17630], "br_getProviderIDForDataSeparated:", self->_isDataSeparated);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v15 = objc_msgSend(MEMORY[0x24BDC83F0], "br_addDomain:forProviderIdentifier:error:", v8, v28, &v37);
      v29 = v37;
      if ((v15 & 1) != 0)
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v30;
          _os_log_impl(&dword_230455000, v31, OS_LOG_TYPE_DEFAULT, "[NOTICE] Domain update was successful%@", buf, 0xCu);
        }

      }
      else
      {
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
          -[BRCAccountSessionFPFS(BRCDatabaseManager) _decorateUserInfoForFPFSDomain:panicOnDomainIDMismatch:withError:].cold.1();

        if (a5)
          *a5 = objc_retainAutorelease(v29);
      }

    }
    else
    {
      v15 = 1;
    }

    _Block_object_dispose(v45, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("domain"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)v45 = 136315906;
        *(_QWORD *)&v45[4] = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _decorateUserInfoForFPFSDomain:panicOnDomainIDM"
                             "ismatch:withError:]";
        *(_WORD *)&v45[12] = 2080;
        if (!a5)
          v35 = "(ignored by caller)";
        *(_QWORD *)&v45[14] = v35;
        *(_WORD *)&v45[22] = 2112;
        v46 = v8;
        v47 = 2112;
        v48 = v13;
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v45, 0x2Au);
      }

    }
    if (a5)
    {
      v8 = objc_retainAutorelease(v8);
      v15 = 0;
      *a5 = v8;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

void __110__BRCAccountSessionFPFS_BRCDatabaseManager___decorateUserInfoForFPFSDomain_panicOnDomainIDMismatch_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE17388];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE17388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "fpfsMigrationState") == 2)
  {
    if (v3)
      goto LABEL_11;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "fpfsMigrationState");
    if ((v3 == 0) != (v4 == 1))
      goto LABEL_11;
    if (v4 != 1)
    {
      v5 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "fpfsMigrationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v2);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] Updating migration UUID %@%@", buf, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_11:
  v8 = *MEMORY[0x24BE17380];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE17380]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88)) & 1) == 0)
  {
    if (v9)
      v10 = *(_BYTE *)(a1 + 56) == 0;
    else
      v10 = 1;
    if (!v10)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The domain has a non nil database ID (%@) which is different than our database ID (%@) "), v9, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v17 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _decorateUserInfoForFPFSDomain:panicOnDomainIDMismatch:withError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 2213, v17);
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), v8);
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] Updating domain databaseID to %@%@", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)openDBForNewDomain:(BOOL)a3 deviceIDChanged:(BOOL *)a4 withError:(id *)a5
{
  int v9;
  BRCPQLConnection *serverDB;
  void *v11;
  void *v12;
  BOOL v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BRCPQLConnection *v20;
  uint64_t v21;
  BRCPQLConnection *v22;
  BRCPQLConnection *clientDB;
  BRCPQLConnection *v24;
  NSString *v25;
  void *v26;
  BOOL v27;
  char v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  NSString *databaseID;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  BOOL v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  NSString *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (!self->_offline)
    -[BRCAccountSessionFPFS setupDatabase](self, "setupDatabase");
  -[BRCPQLConnection setCrashIfUsedAfterClose:](self->_clientDB, "setCrashIfUsedAfterClose:", 0);
  -[BRCPQLConnection setCrashIfUsedAfterClose:](self->_serverDB, "setCrashIfUsedAfterClose:", 0);
  v39 = 0;
  v38 = 0;
  if (!self->_offline
    && (!-[BRCAccountSessionFPFS openAndValidateDatabase:serverTruth:initialVersion:lastCurrentVersion:deviceIDChanged:error:](self, "openAndValidateDatabase:serverTruth:initialVersion:lastCurrentVersion:deviceIDChanged:error:", self->_serverDB, 1, 0, &v39, 0, a5)|| !-[BRCAccountSessionFPFS openAndValidateDatabase:serverTruth:initialVersion:lastCurrentVersion:deviceIDChanged:error:](self, "openAndValidateDatabase:serverTruth:initialVersion:lastCurrentVersion:deviceIDChanged:error:", self->_clientDB, 0, 0, (char *)&v39 + 4, &v38, a5)))
  {
    -[BRCPQLConnection brc_close](self->_serverDB, "brc_close");
    serverDB = self->_serverDB;
    self->_serverDB = 0;

    v11 = 0;
    v12 = 0;
LABEL_24:
    -[BRCPQLConnection brc_close](self->_clientDB, "brc_close");
    goto LABEL_25;
  }
  if (a4)
    *a4 = v38;
  if (a3)
  {
    v9 = 0;
  }
  else
  {
    if (HIDWORD(v39))
      v13 = (_DWORD)v39 == 0;
    else
      v13 = 1;
    v9 = v13;
  }
  -[BRCAccountSessionFPFS _startWatcher](self, "_startWatcher");
  -[BRCPQLConnection useSerialQueueWithTarget:](self->_serverDB, "useSerialQueueWithTarget:", self->_serverTruthWorkloop);
  v14 = -[BRCAccountSessionFPFS _finishClientTruthConnectionSetupWithError:](self, "_finishClientTruthConnectionSetupWithError:", a5);
  if (!v14
    || !-[BRCAccountSessionFPFS _finishServerTruthConnectionSetupWithError:](self, "_finishServerTruthConnectionSetupWithError:", a5))
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_22;
  }
  -[BRCAccountSessionFPFS dbLoadingBarrier](self, "dbLoadingBarrier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "signalBarrier");

  -[NSFileProviderDomain userInfo](self->_fpDomain, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_opt_new();
  v11 = v19;

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE17380]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v29 = v9;
  else
    v29 = 1;
  if ((v29 & 1) == 0 && !-[NSString isEqualToString:](self->_databaseID, "isEqualToString:", v12))
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
    {
      databaseID = self->_databaseID;
      *(_DWORD *)buf = 138412802;
      v41 = v12;
      v42 = 2112;
      v43 = databaseID;
      v44 = 2112;
      v45 = v35;
      _os_log_error_impl(&dword_230455000, v30, (os_log_type_t)0x90u, "[ERROR] DatabaseID mismatch %@ vs %@. Signalling reimport%@", buf, 0x20u);
    }

    v31 = +[AppTelemetryTimeSeriesEvent newDatabaseIDMismatchEventWithFPDatabaseID:cloudDocsDatabaseID:](AppTelemetryTimeSeriesEvent, "newDatabaseIDMismatchEventWithFPDatabaseID:cloudDocsDatabaseID:", v12, self->_databaseID);
    -[BRCAccountSessionFPFS analyticsReporter](self, "analyticsReporter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v31);

    +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("OpenAccountSession"), CFSTR("DatabaseMismatch"), 0);

LABEL_38:
    if (!-[BRCAccountSessionFPFS reimportFPFSDomainWithError:](self, "reimportFPFSDomainWithError:", a5))
      goto LABEL_22;
    goto LABEL_39;
  }
  if (v9)
    goto LABEL_38;
LABEL_39:
  if (-[BRCAccountSessionFPFS _decorateFPFSDomainUserInfoWithError:](self, "_decorateFPFSDomainUserInfoWithError:", a5))
  {
    -[BRCAccountSessionFPFS enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", self->_clientDB);
    -[BRCAccountSessionFPFS enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", self->_serverDB);
    v27 = 1;
    -[BRCPQLConnection setCrashIfUsedAfterClose:](self->_clientDB, "setCrashIfUsedAfterClose:", 1);
    -[BRCPQLConnection setCrashIfUsedAfterClose:](self->_serverDB, "setCrashIfUsedAfterClose:", 1);
    goto LABEL_26;
  }
LABEL_22:
  v20 = self->_serverDB;
  v21 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __90__BRCAccountSessionFPFS_BRCDatabaseManager__openDBForNewDomain_deviceIDChanged_withError___block_invoke;
  v37[3] = &unk_24FE40140;
  v37[4] = self;
  -[BRCPQLConnection performWithFlags:action:](v20, "performWithFlags:action:", 1, v37);
  v22 = self->_serverDB;
  self->_serverDB = 0;

  if (!v14)
    goto LABEL_24;
  clientDB = self->_clientDB;
  v36[0] = v21;
  v36[1] = 3221225472;
  v36[2] = __90__BRCAccountSessionFPFS_BRCDatabaseManager__openDBForNewDomain_deviceIDChanged_withError___block_invoke_2;
  v36[3] = &unk_24FE40140;
  v36[4] = self;
  -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 1, v36);
LABEL_25:
  v24 = self->_clientDB;
  self->_clientDB = 0;

  v25 = self->_databaseID;
  self->_databaseID = 0;

  -[BRCAccountSessionFPFS dbLoadingBarrier](self, "dbLoadingBarrier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "signalBarrier");

  v27 = 0;
LABEL_26:

  return v27;
}

uint64_t __90__BRCAccountSessionFPFS_BRCDatabaseManager__openDBForNewDomain_deviceIDChanged_withError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "brc_close");
  return 1;
}

uint64_t __90__BRCAccountSessionFPFS_BRCDatabaseManager__openDBForNewDomain_deviceIDChanged_withError___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "brc_close");
  return 1;
}

- (void)closeDBs
{
  void *v3;
  BRCAccountSessionFPFS *v4;
  BRCPQLConnection *clientDB;
  BRCPQLConnection *serverDB;
  BRCPQLConnection *readOnlyDB;
  BRCPQLConnection *expensiveReadOnlyDB;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  BRCClientState *clientState;
  __int128 v22;
  void *v23;
  _QWORD block[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_clientDB)
  {
    objc_msgSend(v3, "addObject:");
    clientDB = v4->_clientDB;
    v4->_clientDB = 0;

  }
  if (v4->_serverDB)
  {
    objc_msgSend(v3, "addObject:");
    serverDB = v4->_serverDB;
    v4->_serverDB = 0;

  }
  if (v4->_readOnlyDB)
  {
    objc_msgSend(v3, "addObject:");
    readOnlyDB = v4->_readOnlyDB;
    v4->_readOnlyDB = 0;

  }
  if (v4->_expensiveReadOnlyDB)
  {
    objc_msgSend(v3, "addObject:");
    expensiveReadOnlyDB = v4->_expensiveReadOnlyDB;
    v4->_expensiveReadOnlyDB = 0;

  }
  objc_sync_exit(v4);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v26;
    *(_QWORD *)&v11 = 138412290;
    v22 = v11;
    v13 = MEMORY[0x24BDAC760];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
        objc_msgSend(v15, "serialQueue", v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (v17)
        {
          brc_bread_crumbs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v22;
            v30 = v23;
            _os_log_fault_impl(&dword_230455000, v19, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: db.serialQueue%@", buf, 0xCu);
          }

        }
        objc_msgSend(v15, "serialQueue");
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __53__BRCAccountSessionFPFS_BRCDatabaseManager__closeDBs__block_invoke;
        block[3] = &unk_24FE3FA18;
        block[4] = v15;
        dispatch_sync(v18, block);

        ++v14;
      }
      while (v10 != v14);
      v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      v10 = v20;
    }
    while (v20);
  }

  -[BRCAccountSessionFPFS stopDBWatcher](v4, "stopDBWatcher");
  clientState = v4->_clientState;
  v4->_clientState = 0;

}

uint64_t __53__BRCAccountSessionFPFS_BRCDatabaseManager__closeDBs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "brc_close");
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 error:(id *)a4
{
  return -[BRCAccountSessionFPFS initializeOfflineDatabaseWhileUpgrading:loadClientState:error:](self, "initializeOfflineDatabaseWhileUpgrading:loadClientState:error:", a3, 0, a4);
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 error:(id *)a5
{
  return -[BRCAccountSessionFPFS initializeOfflineDatabaseWhileUpgrading:loadClientState:forDBDump:error:](self, "initializeOfflineDatabaseWhileUpgrading:loadClientState:forDBDump:error:", a3, a4, 0, a5);
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 forDBDump:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v8;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  BOOL v19;
  _QWORD v21[5];
  BOOL v22;
  _QWORD v23[7];
  _QWORD block[7];
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v8 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  self->_offline = 1;
  v31 = 0;
  self->_forDBDump = a5;
  -[BRCAccountSessionFPFS clientDB](self, "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke;
  block[3] = &unk_24FE401F8;
  block[4] = self;
  block[5] = &v32;
  v25 = v8;
  block[6] = &v26;
  dispatch_sync(v11, block);

  v13 = v33;
  v14 = *((unsigned __int8 *)v33 + 24);
  if (*((_BYTE *)v33 + 24) && v8)
  {
    -[BRCAccountSessionFPFS serverDB](self, "serverDB");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serialQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_288;
    v23[3] = &unk_24FE40220;
    v23[4] = self;
    v23[5] = &v32;
    v23[6] = &v26;
    dispatch_sync(v16, v23);

    v13 = v33;
    v14 = *((unsigned __int8 *)v33 + 24);
  }
  if (!v14)
  {
    *((_BYTE *)v13 + 24) = 0;
    if (!a6)
      goto LABEL_7;
    goto LABEL_6;
  }
  -[BRCAccountSessionFPFS clientDB](self, "clientDB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2_289;
  v21[3] = &unk_24FE3F978;
  v21[4] = self;
  v22 = a4;
  v18 = objc_msgSend(v17, "performWithFlags:action:", 1, v21);
  *((_BYTE *)v33 + 24) = v18;

  if (a6)
LABEL_6:
    *a6 = objc_retainAutorelease((id)v27[5]);
LABEL_7:
  v19 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v19;
}

void __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  id v13;
  id obj;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(a1 + 56) == 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  LOBYTE(v2) = objc_msgSend(v2, "_setupConnection:readonly:forChecker:error:", v3, v4, 0, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v2;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableDatabaseProfilingForDB:", v7);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && *(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(id *)(v10 + 40);
    v11 = +[BRCAccountSessionFPFS upgradeOfflineDB:serverTruth:session:error:](BRCAccountSessionFPFS, "upgradeOfflineDB:serverTruth:session:error:", v8, 0, v9, &v13);
    objc_storeStrong((id *)(v10 + 40), v13);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;

  }
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSqliteErrorHandler:", &__block_literal_global_287);

}

void __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Encountered an error %@ running stmt %@%@", (uint8_t *)&v9, 0x20u);
  }

}

void __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_288(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "serverDB");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v5 + 40);
    LOBYTE(v3) = objc_msgSend(v3, "_openConnection:databaseName:readonly:error:", v4, CFSTR("server.db"), 0, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v3;

  }
  else
  {
    *(_BYTE *)(v2 + 24) = 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "serverDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v9 + 40);
    v10 = +[BRCAccountSessionFPFS upgradeOfflineDB:serverTruth:session:error:](BRCAccountSessionFPFS, "upgradeOfflineDB:serverTruth:session:error:", v7, 1, v8, &v11);
    objc_storeStrong((id *)(v9 + 40), v11);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;

  }
  else
  {
    *(_BYTE *)(v6 + 24) = 0;
  }
}

uint64_t __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2_289(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedServerZonesEnumerator:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v57 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineServerZone:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v6);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_privateServerZonesEnumerator:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineServerZone:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v11);
  }

  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedClientZonesEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineClientZone:", v20);
        objc_msgSend(v20, "dbRowID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v17);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_privateClientZonesEnumerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v45 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * m);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineClientZone:", v27);
        objc_msgSend(v27, "dbRowID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    }
    while (v24);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v39 = v3;
  objc_msgSend(*(id *)(a1 + 32), "_appLibrariesEnumerator:", v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v41;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v41 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * n);
        objc_msgSend(*(id *)(a1 + 32), "addOfflineAppLibrary:", v34);
        objc_msgSend(v34, "zoneRowID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "asPrivateClientZone");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          objc_msgSend(v34, "associateWithClientZone:", v37);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v31);
  }

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_loadClientStateFromDB:", v39);

  return 1;
}

- (BOOL)dumpFileCoordinationInfoToFileHandle:(id)a3 error:(id *)a4
{
  int v6;
  FILE *v7;
  BRCDumpContext *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = dup(objc_msgSend(a3, "fileDescriptor"));
  v7 = fdopen(v6, "a");
  if (v7)
  {
    v8 = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v7, self->_clientDB);
    -[BRCDumpContext setDumpTrackedPendingDownloads:](v8, "setDumpTrackedPendingDownloads:", 1);
    fclose(v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        v13 = "(passed to caller)";
        v14 = 136315906;
        v15 = "-[BRCAccountSessionFPFS(BRCDatabaseManager) dumpFileCoordinationInfoToFileHandle:error:]";
        v16 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

  }
  return v7 != 0;
}

- (void)_registerObfuscationFunction:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerFunction:nArgs:handler:", CFSTR("OBFUSCATE"), 1, &__block_literal_global_294);
  objc_msgSend(v3, "registerFunction:nArgs:handler:", CFSTR("OBFUSCATE_APPLIBRARY"), 1, &__block_literal_global_297);
  objc_msgSend(v3, "registerFunction:nArgs:handler:", CFSTR("OBFUSCATE_PATH"), 1, &__block_literal_global_308);

}

void __74__BRCAccountSessionFPFS_BRCDatabaseManager___registerObfuscationFunction___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v6;
  const unsigned __int8 *v7;
  void *v8;
  id v9;
  const char *v10;
  int v11;

  v6 = (void *)MEMORY[0x2348B9F14]();
  v7 = sqlite3_value_text(*a4);
  if (v7 && *v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_obfuscatedFilename");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

    v11 = strlen(v10);
    sqlite3_result_text(a2, v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_result_null(a2);
  }
  objc_autoreleasePoolPop(v6);
}

void __74__BRCAccountSessionFPFS_BRCDatabaseManager___registerObfuscationFunction___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v6;
  const unsigned __int8 *v7;
  const char *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  int v16;

  v6 = (void *)MEMORY[0x2348B9F14]();
  v7 = sqlite3_value_text(*a4);
  if (v7 && (v8 = (const char *)v7, *v7))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.CloudDocs")))
    {
      v10 = strlen(v8);
      sqlite3_result_text(a2, v8, v10, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_msgSend(v9, "fp_obfuscatedDotSeparatedComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{"), CFSTR("-"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("}"), CFSTR("-"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_retainAutorelease(v13);
      v15 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");
      v16 = strlen(v15);
      sqlite3_result_text(a2, v15, v16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    }
  }
  else
  {
    sqlite3_result_null(a2);
  }
  objc_autoreleasePoolPop(v6);
}

void __74__BRCAccountSessionFPFS_BRCDatabaseManager___registerObfuscationFunction___block_invoke_3(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v6;
  const unsigned __int8 *v7;
  void *v8;
  id v9;
  const char *v10;
  int v11;

  v6 = (void *)MEMORY[0x2348B9F14]();
  v7 = sqlite3_value_text(*a4);
  if (v7 && *v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_obfuscatedPath");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

    v11 = strlen(v10);
    sqlite3_result_text(a2, v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_result_null(a2);
  }
  objc_autoreleasePoolPop(v6);
}

- (BOOL)backupDatabaseToURL:(id)a3 includeServer:(BOOL)a4 doNotObfuscate:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  int shouldObfuscateFilenames;
  int v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  int v44;
  BOOL v45;
  _BOOL4 v46;
  id obj;
  id *v48;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v8 = a4;
  v60 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v55 = 0u;
  v56 = 0u;
  if (v8)
    v9 = &unk_24FEB4A68;
  else
    v9 = &unk_24FEB4A80;
  v57 = 0uLL;
  v58 = 0uLL;
  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  v48 = a6;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v56;
    v45 = a5;
    v46 = v8;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v56 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v15 = -[BRCAccountSessionFPFS newConnection:](self, "newConnection:", CFSTR("backup"));
        objc_msgSend(v50, "URLByAppendingPathComponent:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sqliteErrorHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x24BDAC760];
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke;
        v53[3] = &unk_24FE402A8;
        v19 = v17;
        v54 = v19;
        objc_msgSend(v15, "setSqliteErrorHandler:", v53);
        objc_msgSend(v15, "autoRollbackHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v18;
        v51[1] = 3221225472;
        v51[2] = __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_315;
        v51[3] = &unk_24FE402A8;
        v21 = v20;
        v52 = v21;
        objc_msgSend(v15, "setAutoRollbackHandler:", v51);
        a6 = v48;
        if (!-[BRCAccountSessionFPFS _openConnection:databaseName:readonly:error:](self, "_openConnection:databaseName:readonly:error:", v15, v14, 1, v48))goto LABEL_19;
        if ((objc_msgSend(v15, "backupToURL:progress:", v16, 0) & 1) == 0)
        {
          if (v48)
          {
            objc_msgSend(v15, "lastError");
            *v48 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "brc_close");
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v15, "brc_close");

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      a5 = v45;
      v8 = v46;
      if (v11)
        continue;
      break;
    }
  }
  if (a5)
  {
    shouldObfuscateFilenames = 0;
    if (!v8)
      goto LABEL_27;
  }
  else
  {
    shouldObfuscateFilenames = fp_shouldObfuscateFilenames();
    if (!v8)
      goto LABEL_27;
  }
  v15 = -[BRCAccountSessionFPFS newConnection:](self, "newConnection:", CFSTR("privacy"));
  if (!objc_msgSend((id)objc_opt_class(), "_openConnection:databaseName:baseURL:readonly:error:", v15, CFSTR("server.db"), v50, 0, a6))
  {
LABEL_20:
    LOBYTE(v23) = 0;
    goto LABEL_21;
  }
  if (shouldObfuscateFilenames)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v25, "sqliteCacheSize"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v25, "sqliteCacheSpill"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BEDD648];
    v29 = objc_retainAutorelease(v26);
    objc_msgSend(v28, "rawInjection:length:", objc_msgSend(v29, "UTF8String"), objc_msgSend(v29, "length"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "execute:", CFSTR("PRAGMA cache_size = %@"), v30);

    v31 = (void *)MEMORY[0x24BEDD648];
    v32 = objc_retainAutorelease(v27);
    objc_msgSend(v31, "rawInjection:length:", objc_msgSend(v32, "UTF8String"), objc_msgSend(v32, "length"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "execute:", CFSTR("PRAGMA cache_spill = %@"), v33);

    -[BRCAccountSessionFPFS _registerObfuscationFunction:](self, "_registerObfuscationFunction:", v15);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_319);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_322);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_325);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_328);
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_331);

    a6 = v48;
  }
  objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_334);
  objc_msgSend(v15, "flush");
  objc_msgSend(v15, "brc_close");

LABEL_27:
  v15 = -[BRCAccountSessionFPFS newConnection:](self, "newConnection:", CFSTR("privacy"));
  v23 = objc_msgSend((id)objc_opt_class(), "_openConnection:databaseName:baseURL:readonly:error:", v15, CFSTR("client.db"), v50, 0, a6);
  if (v23)
  {
    if (shouldObfuscateFilenames)
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v34, "sqliteCacheSize"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v34, "sqliteCacheSpill"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BEDD648];
      v38 = objc_retainAutorelease(v35);
      objc_msgSend(v37, "rawInjection:length:", objc_msgSend(v38, "UTF8String"), objc_msgSend(v38, "length"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "execute:", CFSTR("PRAGMA cache_size = %@"), v39);

      v40 = (void *)MEMORY[0x24BEDD648];
      v41 = objc_retainAutorelease(v36);
      objc_msgSend(v40, "rawInjection:length:", objc_msgSend(v41, "UTF8String"), objc_msgSend(v41, "length"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "execute:", CFSTR("PRAGMA cache_spill = %@"), v42);

      -[BRCAccountSessionFPFS _registerObfuscationFunction:](self, "_registerObfuscationFunction:", v15);
      objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_337);
      objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_340);
      v43 = (void *)objc_msgSend(v15, "numberWithSQL:", CFSTR("SELECT 1 FROM sqlite_master where type = 'table' AND name = 'client_pkg_items'"));
      v44 = objc_msgSend(v43, "BOOLValue");

      if (v44)
        objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_345);
      objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_348);

    }
    objc_msgSend(v15, "groupInTransaction:", &__block_literal_global_351);
    objc_msgSend(v15, "flush");
    objc_msgSend(v15, "brc_close");
  }
LABEL_21:

  return v23;
}

void __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] sqlite error handler called on DB backup - %@ (%@)%@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEDD658]))
  {

    goto LABEL_9;
  }
  v13 = objc_msgSend(v9, "code");

  if (v13 != 13)
  {
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1();

LABEL_10:
}

void __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_315(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v16 = 138412802;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] Auto rollback handler called on DB backup - %@ (%@)%@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEDD658]))
  {

    goto LABEL_9;
  }
  v13 = objc_msgSend(v9, "code");

  if (v13 != 13)
  {
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1();

LABEL_10:
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_318(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE devices SET name = printf(\"%%u - %%s\", key, OBFUSCATE(name)) WHERE name IS NOT NULL"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE server_zones SET zone_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(zone_name)) WHERE zone_name IS NOT NULL"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE server_items SET item_filename = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_filename)), item_origname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_origname)), item_trash_put_back_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(item_trash_put_back_path)), version_name = printf(\"%%u - %%s\", rowid, OBFUSCATE(version_name))"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE rowid_reservations SET container_id = printf(\"%%u - %%s\", rowid,  OBFUSCATE_APPLIBRARY(container_id)) WHERE container_id IS NOT NULL"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_5(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE users SET user_plist = NULL"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_6(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE server_items SET child_basehash_salt = validation_key(child_basehash_salt), content_boundary_key = validation_key(content_boundary_key)"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_7(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE client_zones SET zone_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(zone_name)) WHERE zone_name IS NOT NULL"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_8(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE client_items SET item_localname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_localname)), item_bouncedname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_bouncedname)), item_filename = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_filename)), item_trash_put_back_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(item_trash_put_back_path)), version_name = printf(\"%%u - %%s\", rowid, OBFUSCATE(version_name)), version_block_sync_until_bundle_id = NULL"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_9(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE client_pkg_items SET rel_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(rel_path)) WHERE rel_path IS NOT NULL"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_10(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE app_libraries SET app_library_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(app_library_name)) WHERE app_library_name IS NOT NULL"));
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_11(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "execute:", CFSTR("UPDATE app_libraries SET child_basehash_salt = validation_key(child_basehash_salt)"));
  return 1;
}

- (BOOL)backupDatabaseToURL:(id)a3 error:(id *)a4
{
  return -[BRCAccountSessionFPFS backupDatabaseToURL:includeServer:doNotObfuscate:error:](self, "backupDatabaseToURL:includeServer:doNotObfuscate:error:", a3, 1, 0, a4);
}

- (id)accountStatisticsWithDB:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v3, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("totalNumberOfItems"));

  v6 = (void *)objc_msgSend(v3, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items WHERE item_type = 2"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("totalNumberOfFaults"));

  v7 = (void *)objc_msgSend(v3, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items WHERE item_type = 1"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("totalNumberOfDocuments"));

  v8 = (void *)objc_msgSend(v3, "fetchWithSlowStatementRadar:objectOfClass:sql:", CFSTR("<rdar://problem/29182551>"), objc_opt_class(), CFSTR("SELECT COUNT(1) FROM client_items WHERE item_type = 0"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("totalNumberOfDirectories"));

  return v4;
}

- (void)bumpNotificationRankOnItemGlobalID:(id)a3
{
  BRCPQLConnection *clientDB;
  id v4;
  void *v5;
  id v6;

  clientDB = self->_clientDB;
  v4 = a3;
  objc_msgSend(v4, "itemID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCPQLConnection execute:](clientDB, "execute:", CFSTR("UPDATE client_items SET item_notifs_rank = bump_notifs_rank() WHERE item_id = %@ AND zone_rowid = %@"), v6, v5);
}

- (void)scheduleZoneMovesToCloudDocs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  BRCAccountSessionFPFS *v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCAccountSessionFPFS cloudDocsClientZone](self, "cloudDocsClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAppLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wasMovedToCloudDocs");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __72__BRCAccountSessionFPFS_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke;
    v25[3] = &unk_24FE3FE18;
    v26 = v8;
    v27 = self;
    v9 = v8;
    -[BRCAccountSessionFPFS enumerateAppLibraries:](self, "enumerateAppLibraries:", v25);
    objc_msgSend(v9, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v10;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v22;
    *(_QWORD *)&v13 = 138412290;
    v20 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v17, "isCloudDocsZone", v20, (_QWORD)v21))
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v20;
            v29 = v18;
            _os_log_fault_impl(&dword_230455000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't CZM the clouddocs zone%@", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v17, "scheduleMoveToCloudDocs");
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v14);
  }

}

uint64_t __72__BRCAccountSessionFPFS_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v16;

  v3 = a2;
  if ((objc_msgSend(v3, "wasMovedToCloudDocs") & 1) == 0)
  {
    objc_msgSend(v3, "defaultClientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isCloudDocsZone"))
      goto LABEL_7;
    objc_msgSend(v3, "mangledID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldAutoMigrateToCloudDocs");

    if (v7)
    {
      objc_msgSend(v3, "defaultClientZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serverZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasFetchedServerZoneState");

      if ((v10 & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "serialQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __72__BRCAccountSessionFPFS_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke_2;
        block[3] = &unk_24FE3FA18;
        v16 = v3;
        dispatch_async(v11, block);

        goto LABEL_8;
      }
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v3, "defaultClientZone");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serverZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

LABEL_7:
    }
  }
LABEL_8:

  return 1;
}

void __72__BRCAccountSessionFPFS_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleSyncDown");

}

- (void)disableDatabaseProfilingForDB:(id)a3
{
  objc_msgSend(a3, "setProfilingEnabled:", 0);
}

- (void)enableDatabaseProfilingForDB:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "dbProfiled"))
    -[BRCAccountSessionFPFS _setDatabaseProfilingForDB:enabled:verbose:](self, "_setDatabaseProfilingForDB:enabled:verbose:", v5, 1, objc_msgSend(v4, "dbVerboseProfiled"));

}

- (void)_setDatabaseProfilingForDB:(id)a3 enabled:(BOOL)a4 verbose:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setVerboseProfilingEnabled:", v5);
  objc_msgSend(v7, "setProfilingEnabled:", v6);

}

- (id)getFPFSNonMigratedItemsWithDB:(id)a3
{
  return (id)objc_msgSend(a3, "numberWithSQL:", CFSTR("SELECT count(*) FROM client_items WHERE item_localsyncupstate IN (5, 6)"));
}

- (id)_getFPFSMigrationStatus:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if (!self->_clientState)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(DatabaseAdditions) _getFPFSMigrationStatus:withError:].cold.1((uint64_t)v15, v16);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT MIN(db_schema) FROM boot_history"));
    v9 = objc_msgSend(v8, "unsignedLongValue");

    if (v9 >> 4 > 0x752)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v7 = &unk_24FEB3308;
  }
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("MigrationStatus"));
  -[BRCAccountSessionFPFS getFPFSNonMigratedItemsWithDB:](self, "getFPFSNonMigratedItemsWithDB:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("NonMigratedItems"));
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__BRCAccountSessionFPFS_DatabaseAdditions___getFPFSMigrationStatus_withError___block_invoke;
  v17[3] = &unk_24FE42C18;
  v17[4] = self;
  v11 = v6;
  v18 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348BA0DC](v17);
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationUUIDKey"), CFSTR("MigrationID"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationStartTimeKey"), CFSTR("MigrationStarted"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationInitialItemsNeedMigratingCountKey"), CFSTR("InitialItemsNeedMigratingCount"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationInitialItemCountKey"), CFSTR("InitialItemsCount"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationNewItemsInDBStatKey"), CFSTR("NewItemsInDB"));
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v12)[2](v12, CFSTR("kBRCFPFSMigrationLostItemCountKey"), CFSTR("MigrationLostItemCount"));
  v13 = v11;

LABEL_8:
  return v13;
}

void __78__BRCAccountSessionFPFS_DatabaseAdditions___getFPFSMigrationStatus_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "clientState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v5);

  }
}

- (BOOL)dumpFPFSMigrationStatusToFileHandle:(id)a3 tracker:(id)a4 includeNonMigratedItems:(BOOL)a5 error:(id *)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  BRCPQLConnection *v11;
  BRCPQLConnection *v12;
  int cloudDocsFD;
  void *v14;
  int v15;
  FILE *v16;
  BRCPQLConnection *v17;
  id v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  NSObject *v24;
  const char *v26;
  const char *v27;
  _QWORD *v29;
  id v30;
  _QWORD v31[4];
  BRCPQLConnection *v32;
  BRCAccountSessionFPFS *v33;
  uint64_t *v34;
  _BYTE *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47[3];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  _BYTE v56[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v30 = a4;
  memset(v47, 0, sizeof(v47));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]", 133, v47);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:].cold.1();

  v11 = self->_readOnlyDB;
  v12 = v11;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__16;
  v41 = __Block_byref_object_dispose__16;
  v42 = 0;
  cloudDocsFD = self->_cloudDocsFD;
  if (cloudDocsFD < 0)
  {
    v14 = 0;
    if (!v11)
    {
LABEL_22:
      v21 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    -[BRCAccountSessionFPFS containerScheduler](self, "containerScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_22;
  }
  v15 = dup(objc_msgSend(v8, "fileDescriptor", a6));
  v16 = fdopen(v15, "a");
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        *(_DWORD *)v56 = 136315906;
        *(_QWORD *)&v56[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:incl"
                             "udeNonMigratedItems:error:]";
        *(_WORD *)&v56[12] = 2080;
        if (!v29)
          v27 = "(ignored by caller)";
        *(_QWORD *)&v56[14] = v27;
        *(_WORD *)&v56[22] = 2112;
        v57 = v22;
        LOWORD(v58) = 2112;
        *(_QWORD *)((char *)&v58 + 2) = v23;
        _os_log_error_impl(&dword_230455000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v56, 0x2Au);
      }

    }
    if (v29)
      *v29 = objc_retainAutorelease(v22);

    goto LABEL_22;
  }
  *(_QWORD *)v56 = 0;
  *(_QWORD *)&v56[8] = v56;
  *(_QWORD *)&v56[16] = 0x3032000000;
  v57 = __Block_byref_object_copy__16;
  *(_QWORD *)&v58 = __Block_byref_object_dispose__16;
  *((_QWORD *)&v58 + 1) = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v16, v12);
  objc_msgSend(*(id *)(*(_QWORD *)&v56[8] + 40), "setLiveDaemon:", cloudDocsFD >= 0);
  objc_msgSend(*(id *)(*(_QWORD *)&v56[8] + 40), "setTaskTracker:", v30);
  -[BRCAccountSessionFPFS disableDatabaseProfilingForDB:](self, "disableDatabaseProfilingForDB:", v12);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __118__BRCAccountSessionFPFS_DatabaseAdditions__dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error___block_invoke;
  v31[3] = &unk_24FE42C40;
  v17 = v12;
  v32 = v17;
  v33 = self;
  v34 = &v37;
  v35 = v56;
  v36 = &v43;
  -[BRCPQLConnection performWithFlags:action:](v17, "performWithFlags:action:", 1, v31);
  v18 = (id)v38[5];
  if (v18)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      v26 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v49 = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]";
      v50 = 2080;
      if (!v29)
        v26 = "(ignored by caller)";
      v51 = v26;
      v52 = 2112;
      v53 = v18;
      v54 = 2112;
      v55 = v19;
      _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (v29)
    *v29 = objc_retainAutorelease(v18);

  fclose(v16);
  if (cloudDocsFD >= 0)
    -[BRCAccountSessionFPFS enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v17);
  v21 = *((_BYTE *)v44 + 24) != 0;

  _Block_object_dispose(v56, 8);
LABEL_23:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  __brc_leave_section(v47);

  return v21;
}

uint64_t __118__BRCAccountSessionFPFS_DatabaseAdditions__dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongValue");

  if (v5 >> 4 >= 0x753)
  {
    v6 = *(_QWORD **)(a1 + 40);
    if (v6[24])
    {
      objc_msgSend(v6, "_getFPFSMigrationStatus:withError:", v3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v8 + 40);
        objc_msgSend(MEMORY[0x24BDD1608], "jsonStringFromDictionary:options:error:", v7, 1, &obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v8 + 40), obj);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), v9);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x24BE17300], 15, MEMORY[0x24BDBD1B8], CFSTR("Domain was not migrated"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  return 0;
}

- (id)_computePathOfItemWithName:(id)a3 appLibrary:(id)a4 parentClientZoneRowID:(id)a5 parentID:(id)a6 type:(char)a7 needsLocalName:(BOOL)a8 db:(id)a9
{
  _BOOL4 v9;
  int v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v31;

  v9 = a8;
  v10 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = (void *)objc_opt_new();
  if (v10 == 4)
  {
    v20 = CFSTR("/");
  }
  else
  {
    v31 = v14;
    v21 = (void *)objc_msgSend(v18, "fetch:", CFSTR(" WITH RECURSIVE item_parents (item_id, zone_rowid, item_filename, item_localname) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_filename, item_localname FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_filename, li.item_localname FROM client_items AS li     INNER JOIN item_parents AS p USING (item_id, zone_rowid)) SELECT item_localname, item_filename FROM item_parents"), v17, v16);
    v22 = objc_alloc(MEMORY[0x24BE17640]);
    objc_msgSend(v15, "appLibraryID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithAppLibraryName:", v23);

    objc_msgSend(v24, "mangledIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertObject:atIndex:", v25, 0);

    if (objc_msgSend(v21, "next"))
    {
      do
      {
        objc_msgSend(v21, "stringAtIndex:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringAtIndex:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9 || (v28 = objc_msgSend(v26, "length"), v29 = v26, !v28))
          v29 = v27;
        objc_msgSend(v19, "insertObject:atIndex:", v29, 1);

      }
      while ((objc_msgSend(v21, "next") & 1) != 0);
    }
    v14 = v31;
    objc_msgSend(v19, "addObject:", v31);
    objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v19);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (BOOL)enumerateItemsWithType:(id)a3 itemRowIDs:(id)a4 db:(id)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  int cloudDocsFD;
  char v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  BRCAccountSessionFPFS *v34;
  id v35;
  id v36;
  uint64_t *v37;
  char v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v14 = MEMORY[0x24BDAC760];
  v45 = 0;
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __91__BRCAccountSessionFPFS_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke;
  v39[3] = &unk_24FE42C68;
  v41 = &v42;
  v15 = v12;
  v40 = v15;
  objc_msgSend(v15, "performWithFlags:action:", 1, v39);
  v31 = v11;
  cloudDocsFD = self->_cloudDocsFD;
  -[BRCAccountSessionFPFS disableDatabaseProfilingForDB:](self, "disableDatabaseProfilingForDB:", v15);
  v17 = *((_BYTE *)v43 + 24);
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "1", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v10;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("reserved")) & 1) != 0)
  {
    v19 = "(+item_state = BRC_ITEM_STATE_RESERVED_VALUE)";
    v20 = 45;
LABEL_8:
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = cloudDocsFD;
    v23 = v13;

    v18 = (void *)v21;
    goto LABEL_9;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("br-alias")) & 1) != 0)
  {
    v19 = "item_type = 3";
LABEL_7:
    v20 = 13;
    goto LABEL_8;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("br-bookmark-fault")) & 1) != 0)
  {
    v19 = "item_type = 7";
    goto LABEL_7;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("pkg")) & 1) != 0)
  {
    v19 = "(item_type IN (1, 2, 8) AND HEX(SUBSTR(version_content_signature, 1, 1)) = '1B')";
    v20 = 80;
    goto LABEL_8;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("br-non-uploaded")) & 1) != 0)
  {
    v19 = "item_localsyncupstate = 3";
    v20 = 25;
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("busy")))
  {
    v19 = "item_birthtime IN (443779200, -2082844800)";
    v20 = 42;
    goto LABEL_8;
  }
  v22 = cloudDocsFD;
  v23 = v13;
LABEL_9:
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "1", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("indexset_contains(%p, rowid)"), v31);
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v25;
  }
  objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR(" WHERE %@ AND %@"), v18, v24);
  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = __91__BRCAccountSessionFPFS_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke_2;
  v32[3] = &unk_24FE42C90;
  v37 = &v42;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v38 = v17 ^ 1;
  v33 = v26;
  v34 = self;
  v27 = v15;
  v35 = v27;
  v28 = v23;
  v36 = v28;
  objc_msgSend(v27, "performWithFlags:action:", 1, v32);
  if ((v22 & 0x80000000) == 0)
    -[BRCAccountSessionFPFS enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v27);

  _Block_object_dispose(&v42, 8);
  return 1;
}

uint64_t __91__BRCAccountSessionFPFS_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "userVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)objc_msgSend(v2, "unsignedLongValue") >> 4 > 0x752;

  return 0;
}

uint64_t __91__BRCAccountSessionFPFS_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v4 = CFSTR("SELECT item_filename, item_parent_id, item_parent_zone_rowid, app_library_rowid, item_type, item_file_id, item_doc_id, item_generation FROM client_items %@");
  else
    v4 = CFSTR("SELECT item_filename, item_parent_id, item_parent_zone_rowid, app_library_rowid, item_type, item_localname, item_file_id, item_doc_id, item_generation FROM client_items %@");
  v24 = v3;
  v5 = (void *)objc_msgSend(v3, "fetch:", v4, *(_QWORD *)(a1 + 32));
  while (objc_msgSend(v5, "next"))
  {
    objc_msgSend(v5, "stringAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberAtIndex:", 2);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberAtIndex:", 3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "intAtIndex:", 4);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v11 = v6;
    }
    else
    {
      objc_msgSend(v5, "stringAtIndex:", 5);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    if (!*(_BYTE *)(a1 + 72) || (v13 = objc_msgSend(v11, "length"), v14 = v12, !v13))
      v14 = v6;
    v15 = *(void **)(a1 + 40);
    v28 = v12;
    v16 = v14;
    objc_msgSend(v15, "appLibraryByRowID:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_computePathOfItemWithName:appLibrary:parentClientZoneRowID:parentID:type:needsLocalName:db:", v16, v17, v8, v7, v10, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v8;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      v19 = 5;
    else
      v19 = 6;
    v25 = (void *)v9;
    objc_msgSend(v5, "numberAtIndex:", v19);
    v26 = (void *)v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberAtIndex:", (v19 + 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberAtIndex:", (v19 + 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  objc_msgSend(v5, "close");

  return 0;
}

- (BOOL)dumpItemsURLsToHandle:(id)a3 itemRowIDs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BRCPQLConnection *v10;
  int v11;
  FILE *v12;
  FILE *v13;
  BOOL v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  NSObject *v17;
  const char *v19;
  _QWORD v20[5];
  _BYTE buf[24];
  uint64_t (*v22)(uint64_t, uint64_t);
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = self->_clientDB;
  if (!v10)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v11 = dup(objc_msgSend(v8, "fileDescriptor"));
  v12 = fdopen(v11, "a");
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpItemsURLsToHandle:itemRowIDs:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5)
          v19 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v22 = v15;
        LOWORD(v23) = 2112;
        *(_QWORD *)((char *)&v23 + 2) = v16;
        _os_log_error_impl(&dword_230455000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v15);

    goto LABEL_10;
  }
  v13 = v12;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  *(_QWORD *)&v23 = __Block_byref_object_dispose__16;
  *((_QWORD *)&v23 + 1) = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v12, v10);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setTaskTracker:", 0);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __83__BRCAccountSessionFPFS_DatabaseAdditions__dumpItemsURLsToHandle_itemRowIDs_error___block_invoke;
  v20[3] = &unk_24FE42CB8;
  v20[4] = buf;
  -[BRCAccountSessionFPFS enumerateItemsWithType:itemRowIDs:db:withBlock:](self, "enumerateItemsWithType:itemRowIDs:db:withBlock:", 0, v9, v10, v20);
  fclose(v13);
  _Block_object_dispose(buf, 8);

  v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __83__BRCAccountSessionFPFS_DatabaseAdditions__dumpItemsURLsToHandle_itemRowIDs_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), a3);
}

- (BOOL)dumpItemsToHandle:(id)a3 itemType:(id)a4 tracker:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  BRCPQLConnection *v15;
  int v16;
  FILE *v17;
  int v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  NSObject *v21;
  BOOL v22;
  const char *v24;
  _QWORD v25[7];
  char v26;
  _QWORD v27[3];
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33[3];
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(DatabaseAdditions) dumpItemsToHandle:itemType:tracker:error:]", 360, v33);
  brc_bread_crumbs();
  v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v33[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v35 = v13;
    _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping all %@ items%@", buf, 0x20u);
  }

  v15 = self->_clientDB;
  if (!v15)
    goto LABEL_13;
  v16 = dup(objc_msgSend(v10, "fileDescriptor"));
  v17 = fdopen(v16, "a");
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpItemsToHandle:itemType:tracker:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a6)
          v24 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        v35 = v19;
        LOWORD(v36) = 2112;
        *(_QWORD *)((char *)&v36 + 2) = v20;
        _os_log_error_impl(&dword_230455000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v19);

LABEL_13:
    v22 = 0;
    goto LABEL_18;
  }
  v18 = objc_msgSend(v11, "isEqualToString:", CFSTR("all"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__16;
  *(_QWORD *)&v36 = __Block_byref_object_dispose__16;
  *((_QWORD *)&v36 + 1) = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v17, v15);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setTaskTracker:", v12);
  if (v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setNewLineAfterWrite:", 0);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "writeLineWithFormat:", CFSTR("{"));
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "writeEmptyLine");
  }
  else
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 1;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __85__BRCAccountSessionFPFS_DatabaseAdditions__dumpItemsToHandle_itemType_tracker_error___block_invoke;
  v25[3] = &unk_24FE42CE0;
  v25[4] = buf;
  v25[5] = &v29;
  v26 = v18;
  v25[6] = v27;
  -[BRCAccountSessionFPFS enumerateItemsWithType:itemRowIDs:db:withBlock:](self, "enumerateItemsWithType:itemRowIDs:db:withBlock:", v11, 0, v15, v25);
  if (v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "writeEmptyLine");
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "writeLineWithFormat:", CFSTR("}"));
  }
  fclose(v17);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

  v22 = 1;
LABEL_18:

  __brc_leave_section(v33);
  return v22;
}

void __85__BRCAccountSessionFPFS_DatabaseAdditions__dumpItemsToHandle_itemType_tracker_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v11 = a3;
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if ((objc_msgSend(v12, "shouldKeepDumpingWithItemCount:includeAllItems:") & 1) == 0)
    *a8 = 1;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v11, "br_stringByJSONEscaping");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "br_stringByJSONEscaping");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v15, "writeLineWithFormat:", CFSTR("\t\"%@\": \"%@\"), v13, v14);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      objc_msgSend(v15, "writeLineWithFormat:", CFSTR(","));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "writeEmptyLine");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "writeLineWithFormat:", CFSTR("\t\"%@\": \"%@\"), v13, v14);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), v11);
  }

}

- (int)_resolveDeviceID
{
  id v2;
  int v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  NSHomeDirectory();
  v6 = xmmword_230722E38;
  v7 = 0;
  v5 = 0;
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (getattrlist((const char *)objc_msgSend(v2, "fileSystemRepresentation"), &v6, &v5, 8uLL, 0x20u) < 0)
    v3 = 0x80000000;
  else
    v3 = HIDWORD(v5);

  return v3;
}

- (BOOL)enumerateSharedToMeItemsWithBlock:(id)a3 error:(id *)a4
{
  BRCPQLConnection *v6;
  uint64_t v7;
  BRCPQLConnection *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v28;
  int v29;
  BRCPQLConnection *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  BRCPQLConnection *v34;
  id v35;
  _QWORD v36[4];
  BRCPQLConnection *v37;
  BRCAccountSessionFPFS *v38;
  id v39;
  _BYTE *v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[4];
  BRCPQLConnection *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _BYTE buf[24];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v6 = self->_clientDB;
  v34 = v6;
  if (v6)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v7 = MEMORY[0x24BDAC760];
    v54 = 0;
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __84__BRCAccountSessionFPFS_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke;
    v48[3] = &unk_24FE42C68;
    v50 = &v51;
    v8 = v6;
    v49 = v8;
    -[BRCPQLConnection performWithFlags:action:](v8, "performWithFlags:action:", 1, v48);
    if (*((_BYTE *)v52 + 24))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        -[BRCAccountSessionFPFS(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorMethodNotImplemented:", sel_enumerateSharedToMeItemsWithBlock_error_);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
        {
          v31 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a4)
            v31 = "(ignored by caller)";
          *(_QWORD *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2112;
          v56 = v17;
          v57 = 2112;
          v58 = v18;
          _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);
    }
    else
    {
      v24 = -[BRCAccountSessionFPFS _resolveDeviceID](self, "_resolveDeviceID");
      if (v24 != 0x80000000)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v56 = 0;
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "readerScanBatchSize");

        v44 = 0;
        v45 = &v44;
        v46 = 0x2020000000;
        v47 = 0;
        do
        {
          v36[0] = v7;
          v36[1] = 3221225472;
          v36[2] = __84__BRCAccountSessionFPFS_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke_99;
          v36[3] = &unk_24FE42D08;
          v30 = v8;
          v41 = &v44;
          v42 = v29;
          v40 = buf;
          v37 = v30;
          v38 = self;
          v43 = v24;
          v39 = v35;
          -[BRCPQLConnection performWithFlags:action:](v30, "performWithFlags:action:", 1, v36);

        }
        while (!*((_BYTE *)v45 + 24));
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(buf, 8);
        v23 = 1;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Can't resolve device ID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          v33 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a4)
            v33 = "(ignored by caller)";
          *(_QWORD *)&buf[14] = v33;
          *(_WORD *)&buf[22] = 2112;
          v56 = v17;
          v57 = 2112;
          v58 = v25;
          _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);
    }

    v23 = 0;
LABEL_24:

    _Block_object_dispose(&v51, 8);
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 25, CFSTR("The session has a nil DB"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      v32 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
      *(_WORD *)&buf[12] = 2080;
      if (!a4)
        v32 = "(ignored by caller)";
      *(_QWORD *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2112;
      v56 = v20;
      v57 = 2112;
      v58 = v21;
      _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v20);

  v23 = 0;
LABEL_25:

  return v23;
}

uint64_t __84__BRCAccountSessionFPFS_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "userVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)objc_msgSend(v2, "unsignedLongValue") >> 4 > 0x752;

  return 0;
}

uint64_t __84__BRCAccountSessionFPFS_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke_99(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "fetchWithSlowStatementRadar:sql:", CFSTR("none"), CFSTR("SELECT item_file_id, zone_rowid    FROM client_items   WHERE item_sharing_options != 0    ORDER BY rowid    LIMIT %lld    OFFSET %lld"), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (objc_msgSend(v2, "next"))
  {
    do
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v3 = objc_msgSend(v2, "integerAtIndex:", 0);
      v4 = *(void **)(a1 + 40);
      objc_msgSend(v2, "numberAtIndex:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serverZoneByRowID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "clientZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isSharedZone");

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithDeviceID:fileID:", *(unsigned int *)(a1 + 80), v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      }
    }
    while ((objc_msgSend(v2, "next") & 1) != 0);
  }

  return 0;
}

- (BOOL)dumpDatabaseToFileHandle:(id)a3 zoneName:(id)a4 includeAllItems:(BOOL)a5 verbose:(BOOL)a6 tracker:(id)a7 error:(id *)a8
{
  _BOOL8 v9;
  void *v13;
  NSObject *v14;
  BRCPQLConnection *v15;
  BRCPQLConnection *v16;
  int cloudDocsFD;
  void *v18;
  int v19;
  FILE *v20;
  BRCPQLConnection *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void *v34;
  NSObject *v35;
  const char *v37;
  const char *v38;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  BRCPQLConnection *v44;
  id v45;
  id v46;
  _BYTE *v47;
  uint64_t *v48;
  uint64_t *v49;
  BOOL v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61[3];
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  _BYTE v70[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  __int128 v72;
  uint64_t v73;

  v9 = a6;
  v73 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v40 = a4;
  v41 = a7;
  memset(v61, 0, sizeof(v61));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]", 515, v61);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:].cold.1();

  v15 = self->_clientDB;
  v16 = v15;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__16;
  v55 = __Block_byref_object_dispose__16;
  v56 = 0;
  cloudDocsFD = self->_cloudDocsFD;
  if (cloudDocsFD < 0)
  {
    v18 = 0;
    if (!v15)
    {
LABEL_24:
      v32 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    -[BRCAccountSessionFPFS containerScheduler](self, "containerScheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_24;
  }
  v19 = dup(objc_msgSend(v42, "fileDescriptor"));
  v20 = fdopen(v19, "a");
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        v38 = "(passed to caller)";
        *(_DWORD *)v70 = 136315906;
        *(_QWORD *)&v70[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItem"
                             "s:verbose:tracker:error:]";
        *(_WORD *)&v70[12] = 2080;
        if (!a8)
          v38 = "(ignored by caller)";
        *(_QWORD *)&v70[14] = v38;
        *(_WORD *)&v70[22] = 2112;
        v71 = v33;
        LOWORD(v72) = 2112;
        *(_QWORD *)((char *)&v72 + 2) = v34;
        _os_log_error_impl(&dword_230455000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v70, 0x2Au);
      }

    }
    if (a8)
      *a8 = objc_retainAutorelease(v33);

    goto LABEL_24;
  }
  *(_QWORD *)v70 = 0;
  *(_QWORD *)&v70[8] = v70;
  *(_QWORD *)&v70[16] = 0x3032000000;
  v71 = __Block_byref_object_copy__16;
  *(_QWORD *)&v72 = __Block_byref_object_dispose__16;
  *((_QWORD *)&v72 + 1) = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v20, v16);
  objc_msgSend(*(id *)(*(_QWORD *)&v70[8] + 40), "setLiveDaemon:", cloudDocsFD >= 0);
  objc_msgSend(*(id *)(*(_QWORD *)&v70[8] + 40), "setTaskTracker:", v41);
  objc_msgSend(*(id *)(*(_QWORD *)&v70[8] + 40), "setVerbose:", v9);
  -[BRCAccountSessionFPFS disableDatabaseProfilingForDB:](self, "disableDatabaseProfilingForDB:", v16);
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __116__BRCAccountSessionFPFS_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke;
  v43[3] = &unk_24FE42D70;
  v47 = v70;
  v43[4] = self;
  v21 = v16;
  v44 = v21;
  v45 = v18;
  v50 = a5;
  v46 = v40;
  v48 = &v51;
  v49 = &v57;
  -[BRCPQLConnection performWithFlags:action:](v21, "performWithFlags:action:", 1, v43);
  -[BRCAccountSessionFPFS analyticsReporter](self, "analyticsReporter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v70[8] + 40));

  -[BRCAccountSessionFPFS globalProgress](self, "globalProgress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v70[8] + 40));

  +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor](BRCCloudDocsAppsMonitor, "cloudDocsAppsMonitor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v70[8] + 40));

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "fpfsUploadV2");

  if (v26)
  {
    +[BRCUploadSyncUpRequestsManager defaultManagerWithPersonaIdentifier:](BRCUploadSyncUpRequestsManager, "defaultManagerWithPersonaIdentifier:", self->_personaIdentifier);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v70[8] + 40));

  }
  +[BRCDaemonFPFS daemon](BRCDaemonFPFS, "daemon");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dumpToContext:", *(_QWORD *)(*(_QWORD *)&v70[8] + 40));

  v29 = (id)v52[5];
  if (v29)
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      v37 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v63 = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]";
      v64 = 2080;
      if (!a8)
        v37 = "(ignored by caller)";
      v65 = v37;
      v66 = 2112;
      v67 = v29;
      v68 = 2112;
      v69 = v30;
      _os_log_error_impl(&dword_230455000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a8)
    *a8 = objc_retainAutorelease(v29);

  fclose(v20);
  if (cloudDocsFD >= 0)
    -[BRCAccountSessionFPFS enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v21);
  v32 = *((_BYTE *)v58 + 24) != 0;

  _Block_object_dispose(v70, 8);
LABEL_25:
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  __brc_leave_section(v61);

  return v32;
}

uint64_t __116__BRCAccountSessionFPFS_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  const __CFString *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  uint64_t v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id obj;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  void *v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZ"));
  v112 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT count(*) FROM boot_history"));
  objc_msgSend(v112, "next");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "liveDaemon");
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v4;
  objc_msgSend(v4, "stringFromDate:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "icloudAccountIsInCarry"))
      v11 = "Yes";
    else
      v11 = "No";
    objc_msgSend(MEMORY[0x24BDD17C8], "br_currentHomeDir");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "br_realpath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeLineWithFormat:", CFSTR("dump taken at %@ [account=%@] [inCarry=%s] [home=%@]"), v9, v10, v11, v13);

  }
  else
  {
    objc_msgSend(v6, "writeLineWithFormat:", CFSTR("dump taken at %@"), v8);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", &stru_24FE4A790);
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "userVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "writeLineWithFormat:", CFSTR("database version: %@"), v15);

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("database ID: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(*(id *)(a1 + 40), "userVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedLongValue");

  v18 = CFSTR("FPFS");
  if (v17 >> 4 <= 0x752)
    v18 = CFSTR("Legacy");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("fsType: %@"), v18);
  if (v17 >> 4 >= 0x753)
  {
    v19 = *(_QWORD **)(a1 + 32);
    if (v19[24])
    {
      objc_msgSend(v19, "_getFPFSMigrationStatus:withError:", v3, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MigrationStatus"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        objc_msgSend(v21, "unsignedIntValue");
        objc_msgSend(v23, "writeLineWithFormat:", CFSTR("FPFS import state: %s"), BRCPrettyPrintEnum());
      }
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationUUIDKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("FPFS import UUID: %@"), v24);
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NonMigratedItems"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("FPFS import pending items: %@"), v25);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", &stru_24FE4A790);
  v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  +[BRCDaemonFPFS daemon](BRCDaemonFPFS, "daemon");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "startupDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "timeIntervalSinceNow");
  objc_msgSend(v26, "writeLineWithFormat:", CFSTR("boot_history (startup %.1fs ago)"), -v29);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dumpDateFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setDateFormat:", v31);

  objc_msgSend(v3, "userVersion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "unsignedLongValue");

  if (v33 <= 0x7533)
  {
    v34 = "";
    v35 = 0;
  }
  else
  {
    v34 = ",device_id";
    v35 = 10;
  }
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", v34, v35);
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("server_truth"));
  v113 = (void *)v36;
  v114 = v3;
  v37 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT date,os,br,bird_schema,db_schema%@ FROM server_boot_history ORDER BY rowid DESC LIMIT 10"), v36);
  if (objc_msgSend(v37, "next"))
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v37, "intAtIndex:", 0));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "stringFromDate:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringAtIndex:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringAtIndex:", 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "numberAtIndex:", 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "numberAtIndex:", 4);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 < 0x7534)
      {
        v44 = 0;
      }
      else
      {
        objc_msgSend(v37, "numberAtIndex:", 5);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("  [%@] OS:%@ CloudDocs:%@ BirdSchema:%@ DBSchema:%@ DeviceID:%@"), v39, v40, v41, v42, v43, v44);

    }
    while ((objc_msgSend(v37, "next") & 1) != 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("client_truth"));
  v45 = (void *)objc_msgSend(v114, "fetch:", CFSTR("SELECT date,os,br,bird_schema,db_schema%@ FROM boot_history ORDER BY rowid DESC LIMIT 10"), v113);

  if (objc_msgSend(v45, "next"))
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v45, "intAtIndex:", 0));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "stringFromDate:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringAtIndex:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringAtIndex:", 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "numberAtIndex:", 3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "numberAtIndex:", 4);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 < 0x7534)
      {
        v52 = 0;
      }
      else
      {
        objc_msgSend(v45, "numberAtIndex:", 5);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("  [%@] OS:%@ CloudDocs:%@ BirdSchema:%@ DBSchema:%@ DeviceID:%@"), v47, v48, v49, v50, v51, v52);

    }
    while ((objc_msgSend(v45, "next") & 1) != 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("backup_detector"));
  v53 = v114;
  v54 = (void *)objc_msgSend(v114, "fetch:", CFSTR("SELECT old,new,counter,os,br FROM backup_detector"));

  if (objc_msgSend(v54, "next"))
  {
    objc_msgSend(v54, "numberAtIndex:", 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberAtIndex:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberAtIndex:", 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringAtIndex:", 3);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringAtIndex:", 4);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "userVersion");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v61 = objc_retainAutorelease(v57);
    v62 = objc_msgSend(v61, "UTF8String");
    v63 = objc_retainAutorelease(v58);
    v64 = objc_msgSend(v63, "UTF8String");
    if (v59)
      v65 = objc_msgSend(v59, "longValue");
    else
      v65 = -1;
    objc_msgSend(v60, "writeLineWithFormat:", CFSTR("  [%@|%@|%@] OS:%s CloudDocs:%s DBSchema:%ld"), v110, v55, v56, v62, v64, v65);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
    objc_msgSend(v54, "close");

    v53 = v114;
  }
  v66 = (void *)objc_msgSend(v53, "fetch:", CFSTR("SELECT * FROM server_state"));

  if (objc_msgSend(v66, "next"))
  {
    objc_msgSend(v66, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("server_state"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), v67);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
    objc_msgSend(v66, "close");
  }
  else
  {
    v67 = 0;
  }
  v68 = (void *)objc_msgSend(v53, "fetch:", CFSTR("SELECT * FROM client_state"));

  if (objc_msgSend(v68, "next"))
  {
    +[BRCAccountSessionFPFS _classesForClientState](BRCAccountSessionFPFS, "_classesForClientState");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "unarchivedObjectOfClasses:atIndex:", v69, 0);
    v70 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("client_state"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("%@"), v70);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
    objc_msgSend(v68, "close");

    v111 = (void *)v70;
  }
  else
  {
    v111 = v67;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("devices:"));
  v71 = (void *)objc_msgSend(v53, "fetch:", CFSTR("SELECT key, name FROM devices"));

  if (objc_msgSend(v71, "next"))
  {
    do
    {
      v72 = objc_msgSend(v71, "longAtIndex:", 0);
      objc_msgSend(v71, "stringAtIndex:", 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(v73, "fp_obfuscatedFilename");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "writeLineWithFormat:", CFSTR("    o \"%@\" (%ld)"), v75, v72);

    }
    while ((objc_msgSend(v71, "next") & 1) != 0);
  }
  objc_msgSend(v71, "close");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("users:"));
  v76 = (void *)objc_msgSend(v53, "fetch:", CFSTR("SELECT user_key, user_name, user_plist FROM users"));

  if (objc_msgSend(v76, "next"))
  {
    do
    {
      v77 = objc_msgSend(v76, "longAtIndex:", 0);
      objc_msgSend(v76, "stringAtIndex:", 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectOfClass:atIndex:", objc_opt_class(), 2);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(v79, "nameComponents");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "br_formattedName");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "fp_obfuscatedFilename");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "writeLineWithFormat:", CFSTR("    o \"%@\" %@ (%ld)"), v78, v83, v77);

    }
    while ((objc_msgSend(v76, "next") & 1) != 0);
  }
  objc_msgSend(v76, "close");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
  objc_msgSend(*(id *)(a1 + 48), "dumpToContext:includeAllItems:db:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 40));
  v84 = *(void **)(a1 + 32);
  v85 = *(_QWORD *)(a1 + 56);
  v121 = 0;
  objc_msgSend(v84, "clientZonesMatchingSearchString:error:", v85, &v121);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v121;
  v88 = v87;
  v89 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v86)
  {
    v108 = v87;
    v90 = objc_msgSend(v86, "count");
    v91 = *(const __CFString **)(a1 + 56);
    if (!v91)
      v91 = CFSTR("*");
    objc_msgSend(v89, "writeLineWithFormat:", CFSTR("%u containers matching '%@'"), v90, v91);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v109 = v86;
    v92 = v86;
    v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
    if (v93)
    {
      v94 = v93;
      v95 = *(_QWORD *)v118;
      while (2)
      {
        for (i = 0; i != v94; ++i)
        {
          if (*(_QWORD *)v118 != v95)
            objc_enumerationMutation(v92);
          v97 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i);
          v98 = (void *)MEMORY[0x2348B9F14]();
          brc_bread_crumbs();
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v123 = v97;
            v124 = 2112;
            v125 = v99;
            _os_log_debug_impl(&dword_230455000, v100, OS_LOG_TYPE_DEBUG, "[DEBUG] dumping client zone %@%@", buf, 0x16u);
          }

          if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isCancelled") & 1) != 0)
          {
            objc_autoreleasePoolPop(v98);
            goto LABEL_63;
          }
          v101 = *(void **)(a1 + 32);
          v102 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          v103 = *(unsigned __int8 *)(a1 + 88);
          v104 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          obj = *(id *)(v104 + 40);
          objc_msgSend(v101, "_dumpClientZone:toContext:includeAllItems:error:", v97, v102, v103, &obj);
          objc_storeStrong((id *)(v104 + 40), obj);
          objc_autoreleasePoolPop(v98);
        }
        v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
        if (v94)
          continue;
        break;
      }
    }
LABEL_63:

    v105 = v114;
    v88 = v108;
    v86 = v109;
  }
  else
  {
    objc_msgSend(v89, "writeLineWithFormat:", CFSTR("%@"), v87);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "writeEmptyLine");
    v105 = v114;
  }

  if (*(_BYTE *)(a1 + 88))
    +[BRCPackageItem dumpSession:toContext:db:error:](BRCPackageItem, "dumpSession:toContext:db:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v105, 0);
  objc_msgSend(*(id *)(a1 + 32), "dumpXPCClientsToContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "dumpMiscOperationsToContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "dumpToContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "analyticsReporter");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "dumpDatabaseInfoToContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  objc_msgSend(v112, "close");

  return 0;
}

- (void)_dumpClientZoneBlockedState:(id)a3 toContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if ((objc_msgSend(v9, "state") & 0x10000) != 0)
  {
    objc_msgSend(v5, "highlightedString:type:", CFSTR(">>> BROKEN STRUCTURE"), 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeLineWithFormat:", CFSTR("%@"), v6);

  }
  if (objc_msgSend(v9, "isSyncBlockedBecauseAppNotInstalled"))
  {
    objc_msgSend(v5, "highlightedString:type:", CFSTR(">>> SYNC DISABLED (app not installed)"), 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeLineWithFormat:", CFSTR("%@"), v7);

  }
  if (objc_msgSend(v9, "isSyncBlockedBecauseOSNeedsUpgrade"))
  {
    objc_msgSend(v5, "highlightedString:type:", CFSTR(">>> NEEDS UPGRADE"), 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeLineWithFormat:", CFSTR("%@"), v8);

  }
}

- (BOOL)_dumpClientZoneStatus:(id)a3 toContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "descriptionWithContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeLineWithFormat:", CFSTR("%@"), v10);

  -[BRCAccountSessionFPFS _dumpClientZoneBlockedState:toContext:](self, "_dumpClientZoneBlockedState:toContext:", v8, v9);
  objc_msgSend(v9, "pushIndentation");
  objc_msgSend(v8, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "dumpStatusToContext:error:", v9, a5);

  v12 = (_DWORD)v10 && (objc_msgSend(v8, "dumpStatusToContext:error:", v9, a5) & 1) != 0;
  objc_msgSend(v9, "popIndentation");

  return v12;
}

- (BOOL)_dumpClientZone:(id)a3 toContext:(id)a4 includeAllItems:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "descriptionWithContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeLineWithFormat:", CFSTR("- %@"), v12);

  -[BRCAccountSessionFPFS _dumpClientZoneBlockedState:toContext:](self, "_dumpClientZoneBlockedState:toContext:", v10, v11);
  objc_msgSend(v11, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  if (objc_msgSend(v10, "isPrivateZone"))
  {
    objc_msgSend(v11, "pushIndentation");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v10, "asPrivateClientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appLibraries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dumpToContext:", v11);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    objc_msgSend(v11, "popIndentation");
  }
  objc_msgSend(v11, "writeLineWithFormat:", &stru_24FE4A790);
  objc_msgSend(v11, "pushIndentation");
  objc_msgSend(v10, "serverZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if (objc_msgSend(v10, "isSharedZone"))
    {
      objc_msgSend(v10, "asSharedClientZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "zoneName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ownerName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "db");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS _sharedServerZoneByName:ownerName:db:](self, "_sharedServerZoneByName:ownerName:db:", v21, v22, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "db");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS _privateServerZoneByName:db:](self, "_privateServerZoneByName:db:", v20, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "associateWithServerZone:", v19);
  }
  v24 = objc_msgSend(v10, "dumpActivityToContext:includeExpensiveActivity:error:", v11, v7, a6);
  if (v24)
  {
    objc_msgSend(v11, "writeLineWithFormat:", &stru_24FE4A790);
    v25 = objc_msgSend(v19, "dumpTablesToContext:includeAllItems:error:", v11, v7, a6);
    v26 = objc_msgSend(v10, "dumpTablesToContext:includeAllItems:error:", v11, v7, a6);
    if (v25 && v26)
      objc_msgSend(v11, "writeLineWithFormat:", CFSTR(" - not done dumping items -"));
    objc_msgSend(v11, "popIndentation");
    objc_msgSend(v11, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  }
  else
  {
    objc_msgSend(v11, "popIndentation");
  }

  return v24;
}

- (BOOL)dumpStatusToFileHandle:(id)a3 zoneName:(id)a4 tracker:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  BRCPQLConnection *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  BRCAccountSessionFPFS *v31;
  id v32;
  _BYTE *v33;
  uint64_t v34[3];
  uint8_t v35[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(DatabaseAdditions) dumpStatusToFileHandle:zoneName:tracker:error:]", 855, v34);
  brc_bread_crumbs();
  v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v34[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v44 = v13;
    _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping status for zone: %@%@", buf, 0x20u);
  }

  v15 = self->_clientDB;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy__16;
  v45 = __Block_byref_object_dispose__16;
  v46 = 0;
  -[BRCAccountSessionFPFS disableDatabaseProfilingForDB:](self, "disableDatabaseProfilingForDB:", v15);
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __90__BRCAccountSessionFPFS_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke;
  v28 = &unk_24FE427C0;
  v16 = v10;
  v29 = v16;
  v33 = buf;
  v17 = v12;
  v30 = v17;
  v31 = self;
  v18 = v11;
  v32 = v18;
  -[BRCPQLConnection performWithFlags:action:](v15, "performWithFlags:action:", 1, &v25);
  v19 = *(id *)(*(_QWORD *)&buf[8] + 40);
  if (v19)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      v24 = "(passed to caller)";
      *(_DWORD *)v35 = 136315906;
      v36 = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpStatusToFileHandle:zoneName:tracker:error:]";
      v37 = 2080;
      if (!a6)
        v24 = "(ignored by caller)";
      v38 = v24;
      v39 = 2112;
      v40 = v19;
      v41 = 2112;
      v42 = v20;
      _os_log_error_impl(&dword_230455000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v35, 0x2Au);
    }

  }
  if (a6)
    *a6 = objc_retainAutorelease(v19);

  -[BRCAccountSessionFPFS enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v15, v25, v26, v27, v28);
  v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

  _Block_object_dispose(buf, 8);
  __brc_leave_section(v34);

  return v22;
}

uint64_t __90__BRCAccountSessionFPFS_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  FILE *v5;
  FILE *v6;
  id v7;
  BRCDumpContext *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  FILE *v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = dup(objc_msgSend(*(id *)(a1 + 32), "fileDescriptor"));
  v5 = fdopen(v4, "a");
  if (v5)
  {
    v6 = v5;
    v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v7, "setDateStyle:", 1);
    objc_msgSend(v7, "setTimeStyle:", 2);
    v8 = -[BRCDumpContext initWithFile:db:]([BRCDumpContext alloc], "initWithFile:db:", v6, v3);
    -[BRCDumpContext setLiveDaemon:](v8, "setLiveDaemon:", 1);
    -[BRCDumpContext setOnlyActiveStuff:](v8, "setOnlyActiveStuff:", 1);
    -[BRCDumpContext setTaskTracker:](v8, "setTaskTracker:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT count(*) FROM boot_history"));
    objc_msgSend(v9, "next");
    v10 = *(void **)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v52 = 0;
    objc_msgSend(v10, "clientZonesMatchingSearchString:error:", v11, &v52);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v52;
    v14 = v13;
    if (v12)
    {
      v45 = v6;
      v15 = objc_msgSend(v12, "count");
      v16 = *(void **)(a1 + 56);
      v46 = v3;
      v43 = v9;
      v44 = v7;
      v41 = v14;
      if (v16)
        v17 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      else
        v17 = "*";
      -[BRCDumpContext writeLineWithFormat:](v8, "writeLineWithFormat:", CFSTR("%u containers matching '%s'"), v15, v17);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v42 = v12;
      v29 = v12;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v49 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            v35 = (void *)MEMORY[0x2348B9F14]();
            brc_bread_crumbs();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v54 = v29;
              v55 = 2112;
              v56 = v36;
              _os_log_debug_impl(&dword_230455000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] dumping container %@%@", buf, 0x16u);
            }

            if (-[BRCDumpContext isCancelled](v8, "isCancelled"))
            {
              objc_autoreleasePoolPop(v35);
              goto LABEL_22;
            }
            v38 = *(void **)(a1 + 48);
            v39 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            obj = *(id *)(v39 + 40);
            objc_msgSend(v38, "_dumpClientZoneStatus:toContext:error:", v34, v8, &obj);
            objc_storeStrong((id *)(v39 + 40), obj);
            objc_autoreleasePoolPop(v35);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v31)
            continue;
          break;
        }
      }
LABEL_22:

      v6 = v45;
      v3 = v46;
      v9 = v43;
      v7 = v44;
      v14 = v41;
      v12 = v42;
    }
    else
    {
      -[BRCDumpContext writeLineWithFormat:](v8, "writeLineWithFormat:", CFSTR("%@"), v13);
      -[BRCDumpContext writeEmptyLine](v8, "writeEmptyLine");
    }

    objc_msgSend(v9, "close");
    fclose(v6);

  }
  else
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      __90__BRCAccountSessionFPFS_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke_cold_1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    objc_msgSend(0, "close");
  }

  return 0;
}

- (id)_old_privateAppLibraryByZoneName:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__BRCAccountSessionFPFS_DatabaseMigrationHelpers___old_privateAppLibraryByZoneName_db___block_invoke;
  v5[3] = &unk_24FE40010;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries WHERE app_library_name = %@ AND (app_library_owner = %@ OR app_library_owner IS NULL)"), a3, *MEMORY[0x24BDB8E88]);
}

id __87__BRCAccountSessionFPFS_DatabaseMigrationHelpers___old_privateAppLibraryByZoneName_db___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newAppLibraryFromPQLResultSet:version:", a2, 2);
}

- (id)trashedItemsEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = (void *)objc_msgSend(v8, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items      WHERE item_scope = 3        AND item_notifs_rank >= %lld        AND item_user_visible = 1   ORDER BY item_notifs_rank ASC LIMIT %lld"), a3, a4);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__BRCAccountSessionFPFS_FPFSAdditions__trashedItemsEnumeratorFromNotifRank_batchSize_db___block_invoke;
  v13[3] = &unk_24FE40038;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjects:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __89__BRCAccountSessionFPFS_FPFSAdditions__trashedItemsEnumeratorFromNotifRank_batchSize_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (BOOL)isMigratingToFPFS
{
  void *v3;
  void *v4;
  BOOL v5;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationUUIDKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unsigned)fpfsMigrationState
{
  void *v3;
  unsigned int v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (unint64_t)fpfsMigrationCleanupLastRowID
{
  void *v3;
  unint64_t v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationCleanupLastRowIDKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (unint64_t)fpfsMigrationInvestigatedItemsCount
{
  void *v3;
  unint64_t v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationInvestigatedItemCountKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (id)fpfsMigrationItemsNotMigratedDictionary
{
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  return -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationItemsNotMigratedDictionaryKey"));
}

- (id)fpfsMigrationUUID
{
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  return -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationUUIDKey"));
}

- (id)fpfsMigrationStartTime
{
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  return -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStartTimeKey"));
}

- (id)fpfsMigrationEndTime
{
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  return -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationEndTimeKey"));
}

- (int)fpfsMigrationMigratedTypes
{
  void *v3;
  int v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationMigratedTypesStatKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int)fpfsMigrationNonMigratedTypes
{
  void *v3;
  int v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationNonMigratedTypesStatKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)fpfsMigrationStatusTTRTriggered
{
  void *v3;
  char v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStatusTTRTriggeredKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)fpfsMigrationStatusTTRWasTriggered
{
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("kBRCFPFSMigrationStatusTTRTriggeredKey"));
  -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");
}

- (void)updateFPFSMigrationMigratedTypes:(char)a3
{
  -[BRCAccountSessionFPFS _updateFPFSMigrationItemTypes:withStateKey:isPackage:](self, "_updateFPFSMigrationItemTypes:withStateKey:isPackage:", a3, CFSTR("kBRCFPFSMigrationMigratedTypesStatKey"), 0);
}

- (void)updateFPFSMigrationMigratedTypesWithPackage
{
  -[BRCAccountSessionFPFS _updateFPFSMigrationItemTypes:withStateKey:isPackage:](self, "_updateFPFSMigrationItemTypes:withStateKey:isPackage:", 1, CFSTR("kBRCFPFSMigrationMigratedTypesStatKey"), 1);
}

- (void)updateFPFSMigrationNonMigratedTypes:(char)a3
{
  -[BRCAccountSessionFPFS _updateFPFSMigrationItemTypes:withStateKey:isPackage:](self, "_updateFPFSMigrationItemTypes:withStateKey:isPackage:", a3, CFSTR("kBRCFPFSMigrationNonMigratedTypesStatKey"), 0);
}

- (void)updateFPFSMigrationNonMigratedTypesWithPackage
{
  -[BRCAccountSessionFPFS _updateFPFSMigrationItemTypes:withStateKey:isPackage:](self, "_updateFPFSMigrationItemTypes:withStateKey:isPackage:", 1, CFSTR("kBRCFPFSMigrationNonMigratedTypesStatKey"), 1);
}

- (void)_updateFPFSMigrationItemTypes:(char)a3 withStateKey:(id)a4 isPackage:(BOOL)a5
{
  _BOOL4 v5;
  int v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "intValue");

    setTypeFieldFromDBType(v6, v5, (__int16 *)&v12);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", v11, v8);

    -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");
  }

}

- (int64_t)fpfsMigrationBouncedItemCount
{
  void *v3;
  int64_t v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationBouncedItemCountStatKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (int64_t)fpfsMigrationBouncedMatrix
{
  void *v3;
  int64_t v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationBouncedMatrixStatKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (void)_updateFPFSMigrationBouncedItemType:(char)a3 withExistingItemType:(char)a4
{
  int v4;
  int v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;

  v4 = a4;
  v5 = a3;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationBouncedMatrixStatKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BRCAccountSessionFPFS fpfsMigrationBouncedItemCount](self, "fpfsMigrationBouncedItemCount") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", v8, CFSTR("kBRCFPFSMigrationBouncedItemCountStatKey"));

    -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationBouncedMatrixStatKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "longLongValue");
    v11 = v10 & 0xFFFFFFFFFF000000;

    if (v5 == v4)
    {
      LODWORD(v10) = v10 & 0xEFFFFF | 0x100000;
    }
    else
    {
      switch(v5)
      {
        case 0:
          switch(v4)
          {
            case 1:
              LODWORD(v10) = v10 & 0xFFFFF7 | 8;
              break;
            case 2:
              LODWORD(v10) = v10 & 0xFFFFFB | 4;
              break;
            case 3:
              LODWORD(v10) = v10 & 0xFFFFFD | 2;
              break;
            case 4:
              LODWORD(v10) = v10 & 0xFFFFFE | 1;
              break;
            default:
              brc_bread_crumbs();
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
                goto LABEL_8;
              goto LABEL_9;
          }
          break;
        case 1:
          switch(v4)
          {
            case 0:
              LODWORD(v10) = v10 & 0xFEFFFF | 0x10000;
              break;
            case 2:
              LODWORD(v10) = v10 & 0xF7FFFF | 0x80000;
              break;
            case 3:
              LODWORD(v10) = v10 & 0xFBFFFF | 0x40000;
              break;
            case 4:
              LODWORD(v10) = v10 & 0xFDFFFF | 0x20000;
              break;
            default:
              brc_bread_crumbs();
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
                goto LABEL_8;
              goto LABEL_9;
          }
          break;
        case 2:
          switch(v4)
          {
            case 0:
              LODWORD(v10) = v10 | 0x1000;
              break;
            case 1:
              LODWORD(v10) = v10 & 0xFF7FFF | 0x8000;
              break;
            case 3:
              LODWORD(v10) = v10 & 0xFFBFFF | 0x4000;
              break;
            case 4:
              LODWORD(v10) = v10 & 0xFFDFFF | 0x2000;
              break;
            default:
              brc_bread_crumbs();
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
                goto LABEL_8;
              goto LABEL_9;
          }
          break;
        case 3:
          switch(v4)
          {
            case 0:
              LODWORD(v10) = v10 & 0xFFFEFF | 0x100;
              break;
            case 1:
              LODWORD(v10) = v10 & 0xFFF7FF | 0x800;
              break;
            case 2:
              LODWORD(v10) = v10 & 0xFFFBFF | 0x400;
              break;
            case 4:
              LODWORD(v10) = v10 & 0xFFFDFF | 0x200;
              break;
            default:
              brc_bread_crumbs();
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
                goto LABEL_8;
              goto LABEL_9;
          }
          break;
        case 4:
          switch(v4)
          {
            case 0:
              LODWORD(v10) = v10 & 0xFFFFEF | 0x10;
              break;
            case 1:
              LODWORD(v10) = v10 & 0xFFFF7F | 0x80;
              break;
            case 2:
              LODWORD(v10) = v10 & 0xFFFFBF | 0x40;
              break;
            case 3:
              LODWORD(v10) = v10 & 0xFFFFDF | 0x20;
              break;
            default:
              brc_bread_crumbs();
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
                goto LABEL_8;
              goto LABEL_9;
          }
          break;
        default:
          brc_bread_crumbs();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
LABEL_8:
            -[BRCAccountSessionFPFS(FPFSAdditions) _updateFPFSMigrationBouncedItemType:withExistingItemType:].cold.1();
LABEL_9:

          break;
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10 & 0xFFFFFF | v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", v14, CFSTR("kBRCFPFSMigrationBouncedMatrixStatKey"));

    -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");
  }
}

- (int64_t)fpfsMigrationNewItemsInDB
{
  void *v3;
  int64_t v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationNewItemsInDBStatKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (int64_t)fpfsMigrationNonMigratedItems
{
  void *v3;
  int64_t v4;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCAccountSessionFPFS getFPFSNonMigratedItemsWithDB:](self, "getFPFSNonMigratedItemsWithDB:", self->_clientDB);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (void)updateFPFSMigrationNewItemsInDB
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationNewItemsInDBStatKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationNewItemsInDBStatKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "longLongValue") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", v6, CFSTR("kBRCFPFSMigrationNewItemsInDBStatKey"));

    -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");
  }
}

- (void)setFPFSMigrationState:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v3 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x24BDAC8D0];
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(FPFSAdditions) setFPFSMigrationState:].cold.2((uint64_t)v5, v3, v6);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", v7, CFSTR("kBRCFPFSMigrationStateKey"));

  if ((_DWORD)v3 == 2)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS(FPFSAdditions) setFPFSMigrationState:].cold.1();

    -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationCleanupLastRowIDKey"));
    -[BRCAccountSessionFPFS(FPFSAdditions) fsImporter](self, "fsImporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "signal");

  }
  else if (!(_DWORD)v3)
  {
    -[BRCAccountSessionFPFS fpfsMigrationUUID](self, "fpfsMigrationUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", v9, CFSTR("kBRCFPFSMigrationEndTimeKey"));

      -[BRCAccountSessionFPFS triggerFPFSImportFinishedTelemetryEventIfNeeded](self, "triggerFPFSImportFinishedTelemetryEventIfNeeded");
    }
    else
    {
      -[BRCAccountSessionFPFS _cleanupMigrationClientState](self, "_cleanupMigrationClientState");
    }
  }
  -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("kBRCFPFSMigrationStateKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("kBRCFPFSMigrationStateKey"), 0, v15);

}

- (void)_cleanupMigrationClientState
{
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationStateKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationCleanupLastRowIDKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationLostItemCountKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationChildItemsLostItemCountKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationBusyDateLostItemCountKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationIgnoredFromSyncLostItemCountKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationStartTimeKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationEndTimeKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationInitialItemCountKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationInitialItemsNeedMigratingCountKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationMigratedTypesStatKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationNonMigratedTypesStatKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationBouncedItemCountStatKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationBouncedMatrixStatKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationNewItemsInDBStatKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationStatusMigrationStatsTakenAtKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationStatusLastItemsNotMigratedKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationStatusLastReconciledItemsKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationInvestigatedItemCountKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationItemsNotMigratedDictionaryKey"));
  -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationRecoveryWasInvokedAtKey"));
  -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");
}

- (void)updateFPFSMigrationCleanupLastRowID:(unint64_t)a3 lostItemCount:(unint64_t)a4 childLostItemCount:(unint64_t)a5 busyDateLostItemCount:(unint64_t)a6 ignoredFromSyncLostItemCount:(unint64_t)a7 investigatedItemsCount:(unint64_t)a8 notMigratedItems:(id)a9
{
  void *v16;
  BRCClientState **p_clientState;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a9;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    p_clientState = &self->_clientState;
    -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", v16, CFSTR("kBRCFPFSMigrationCleanupLastRowIDKey"));

    if (a4)
      goto LABEL_3;
  }
  else
  {
    p_clientState = &self->_clientState;
    -[BRCClientState setObject:forKeyedSubscript:](self->_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationCleanupLastRowIDKey"));
    if (a4)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", v18, CFSTR("kBRCFPFSMigrationLostItemCountKey"));

      if (a5)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationLostItemCountKey"));
  if (a5)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", v19, CFSTR("kBRCFPFSMigrationChildItemsLostItemCountKey"));

    if (a6)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationChildItemsLostItemCountKey"));
  if (a6)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", v20, CFSTR("kBRCFPFSMigrationBusyDateLostItemCountKey"));

    if (a7)
      goto LABEL_6;
LABEL_12:
    -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationIgnoredFromSyncLostItemCountKey"));
    if (a8)
      goto LABEL_7;
LABEL_13:
    -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationInvestigatedItemCountKey"));
    goto LABEL_14;
  }
LABEL_11:
  -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", 0, CFSTR("kBRCFPFSMigrationBusyDateLostItemCountKey"));
  if (!a7)
    goto LABEL_12;
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", v21, CFSTR("kBRCFPFSMigrationIgnoredFromSyncLostItemCountKey"));

  if (!a8)
    goto LABEL_13;
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", v22, CFSTR("kBRCFPFSMigrationInvestigatedItemCountKey"));

LABEL_14:
  -[BRCClientState setObject:forKeyedSubscript:](*p_clientState, "setObject:forKeyedSubscript:", v23, CFSTR("kBRCFPFSMigrationItemsNotMigratedDictionaryKey"));
  -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");

}

- (void)_populateNonMigratedItemEventForLocalDataWithEvent:(id)a3 fileIDData:(id)a4 diagnosticDescriptor:(id)a5 migrationStart:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;

  v57 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v57, "investigation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fpfsMigrationNonMigratedItemInvestigation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "mTime");

  objc_msgSend(v12, "timeIntervalSince1970");
  v17 = v16;

  objc_msgSend(v57, "investigation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fpfsMigrationNonMigratedItemInvestigation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMTimeBeforeMigrationStarted:", v17 > (double)v15);

  if (objc_msgSend(v57, "hasInvestigation"))
  {
    objc_msgSend(v57, "investigation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasFpfsMigrationNonMigratedItemInvestigation");

    if (v21)
    {
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        objc_msgSend(v57, "investigation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fpfsMigrationNonMigratedItemInvestigation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "hasFsGenCount"))
        {
          objc_msgSend(v57, "investigation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "fpfsMigrationNonMigratedItemInvestigation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "fsGenCount");

        }
        else
        {
          v26 = 0;
        }

        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "unsignedLongLongValue");

        v29 = v28 - v26;
        v30 = v28 == v26;
        objc_msgSend(v57, "investigation");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "fpfsMigrationNonMigratedItemInvestigation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setDoGenCountsMatchInFileId:", v30);

        objc_msgSend(v57, "investigation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "fpfsMigrationNonMigratedItemInvestigation");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setGencountDiff:", v29);

      }
      if ((unint64_t)objc_msgSend(v10, "count") >= 3)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "unsignedLongLongValue") != 0;
        objc_msgSend(v57, "investigation");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "fpfsMigrationNonMigratedItemInvestigation");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setHasLocalChanges:", v36);

      }
      if ((unint64_t)objc_msgSend(v10, "count") >= 4)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "unsignedLongLongValue");

        v41 = v40 == objc_msgSend(v11, "docID");
        objc_msgSend(v57, "investigation");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "fpfsMigrationNonMigratedItemInvestigation");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setDocIDMatches:", v41);

      }
      if ((unint64_t)objc_msgSend(v10, "count") >= 5)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "BOOLValue");
        objc_msgSend(v57, "investigation");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "fpfsMigrationNonMigratedItemInvestigation");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setAppLibraryMatches:", v45);

        objc_msgSend(v11, "diagnosticAttributes");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x24BDC7E30]);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCAccountSessionFPFS itemByRowID:](self, "itemByRowID:", objc_msgSend(v50, "unsignedLongLongValue"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "parentFileObjectID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "asString");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = objc_msgSend(v53, "isEqualToString:", v49);
          objc_msgSend(v57, "investigation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "fpfsMigrationNonMigratedItemInvestigation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setParentMatches:", v54);

        }
      }
    }
  }

}

- (void)sendNonMigratedItemTelemetryWithfileIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  BRCAccountSessionFPFS *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(FPFSAdditions) sendNonMigratedItemTelemetryWithfileIDs:].cold.1((uint64_t)v4);

  -[BRCAccountSessionFPFS fpfsMigrationUUID](self, "fpfsMigrationUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS fpfsMigrationStartTime](self, "fpfsMigrationStartTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC83F0], "br_sharedProviderManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC83B8]), "initWithFileID:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13), "unsignedLongLongValue"));
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __80__BRCAccountSessionFPFS_FPFSAdditions__sendNonMigratedItemTelemetryWithfileIDs___block_invoke;
  v20[3] = &unk_24FE45EB0;
  v21 = v9;
  v22 = v18;
  v23 = self;
  v24 = v7;
  v15 = v7;
  v16 = v18;
  v17 = v9;
  objc_msgSend(v19, "getDiagnosticAttributesForItems:completionHandler:", v8, v20);

}

void __80__BRCAccountSessionFPFS_FPFSAdditions__sendNonMigratedItemTelemetryWithfileIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v27 = v6;
  if (v6)
  {
    v7 = v6;
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v34 = v26;
      v35 = 2112;
      v36 = v7;
      v37 = 2112;
      v38 = v8;
      _os_log_error_impl(&dword_230455000, v9, (os_log_type_t)0x90u, "[ERROR] error while getting attributes for fileIDs %@: %@%@", buf, 0x20u);
    }

  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v5);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v14, "error");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            brc_bread_crumbs();
            v16 = (id)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
            {
              v18 = objc_msgSend(v14, "fileID");
              objc_msgSend(v14, "error");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v34 = v18;
              v35 = 2112;
              v36 = v19;
              v37 = 2112;
              v38 = v16;
              _os_log_error_impl(&dword_230455000, v17, (os_log_type_t)0x90u, "[ERROR] Error occured while getting diagnostic attributes for fileID: %llu: %@%@", buf, 0x20u);

            }
          }
          else
          {
            v20 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v14, "diagnosticAttributes");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = +[AppTelemetryTimeSeriesEvent newNonMigratedItemEvent:foundInfo:](AppTelemetryTimeSeriesEvent, "newNonMigratedItemEvent:foundInfo:", v20, v21);

            v22 = *(void **)(a1 + 48);
            v23 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v14, "fileID"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "_populateNonMigratedItemEventForLocalDataWithEvent:fileIDData:diagnosticDescriptor:migrationStart:", v16, v25, v14, *(_QWORD *)(a1 + 56));

            objc_msgSend(*(id *)(a1 + 48), "analyticsReporter");
            v17 = objc_claimAutoreleasedReturnValue();
            -[NSObject postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](v17, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 9, v16);
          }

        }
        v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }
  }

}

- (void)markMigrationToFPFSCleanupComplete
{
  if (-[BRCAccountSessionFPFS fpfsMigrationState](self, "fpfsMigrationState") == 2)
    -[BRCAccountSessionFPFS setFPFSMigrationState:](self, "setFPFSMigrationState:", 0);
}

- (void)markMigrationToFPFSComplete
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  if (-[BRCAccountSessionFPFS fpfsMigrationState](self, "fpfsMigrationState") == 1)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS(FPFSAdditions) markMigrationToFPFSComplete].cold.1();

    -[BRCAccountSessionFPFS setFPFSMigrationState:](self, "setFPFSMigrationState:", 2);
    -[BRCPQLConnection flush](self->_clientDB, "flush");
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS(FPFSAdditions) markMigrationToFPFSComplete].cold.2();

  }
}

- (void)setExtensionBackChannel:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBackChannel, a3);
}

- (BRFileProviderExtensionBackChannel)extensionBackChannel
{
  return self->_extensionBackChannel;
}

- (BRCServerChangesApplier)serverChangesApplier
{
  return self->_serverChangesApplier;
}

- (NSString)domainID
{
  return -[NSFileProviderDomain identifier](self->_fpDomain, "identifier");
}

- (id)groupContainerStagePathForCurrentPersonaFromStageType:(signed __int16)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  if (groupContainerStagePathForCurrentPersonaFromStageType__once != -1)
    dispatch_once(&groupContainerStagePathForCurrentPersonaFromStageType__once, &__block_literal_global_36);
  v4 = (id)groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x24BDD17C8], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if ((_DWORD)v3
      || (objc_msgSend(MEMORY[0x24BDD17C8], "brc_groupDownloadStagePath"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          (v11 = v14) == 0))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        v17[0] = 67109634;
        v17[1] = v3;
        v18 = 2112;
        v19 = v5;
        v20 = 2112;
        v21 = v12;
        _os_log_error_impl(&dword_230455000, v13, (os_log_type_t)0x90u, "[ERROR] Can't find group container path of type %d for current persona %@%@", (uint8_t *)v17, 0x1Cu);
      }

      v11 = 0;
    }
    else
    {
      objc_msgSend(v14, "br_realpath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v5);

    }
  }

  objc_sync_exit(v4);
  return v11;
}

void __94__BRCAccountSessionFPFS_FPFSAdditions__groupContainerStagePathForCurrentPersonaFromStageType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID;
  groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID = v0;

}

- (id)downloadStagePathForCurrentPersona
{
  return -[BRCAccountSessionFPFS groupContainerStagePathForCurrentPersonaFromStageType:](self, "groupContainerStagePathForCurrentPersonaFromStageType:", 0);
}

- (id)_createAppTelemetryFPFSMigrationInvestigation:(unsigned int)a3
{
  AppTelemetryFPFSMigrationInvestigation *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = objc_alloc_init(AppTelemetryFPFSMigrationInvestigation);
  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("availableQuota"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryFPFSMigrationInvestigation setAccountQuotaUsage:](v5, "setAccountQuotaUsage:", objc_msgSend(v6, "br_roundedLongLongValue"));

  -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationInitialItemCountKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryFPFSMigrationInvestigation setTotalItemCount:](v5, "setTotalItemCount:", objc_msgSend(v7, "br_roundedLongLongValue"));

  -[AppTelemetryFPFSMigrationInvestigation setIsAccountDataSeparated:](v5, "setIsAccountDataSeparated:", -[BRCAccountSessionFPFS isDataSeparated](self, "isDataSeparated"));
  if (a3)
  {
    -[BRCAccountSessionFPFS fpfsMigrationStartTime](self, "fpfsMigrationStartTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceNow");
    -[AppTelemetryFPFSMigrationInvestigation setImportTime:](v5, "setImportTime:", -v9);

    -[AppTelemetryFPFSMigrationInvestigation setTypesOfMigratedItemsMask:](v5, "setTypesOfMigratedItemsMask:", -[BRCAccountSessionFPFS fpfsMigrationMigratedTypes](self, "fpfsMigrationMigratedTypes"));
    -[AppTelemetryFPFSMigrationInvestigation setBouncedItemsCount:](v5, "setBouncedItemsCount:", -[BRCAccountSessionFPFS fpfsMigrationBouncedItemCount](self, "fpfsMigrationBouncedItemCount"));
    -[AppTelemetryFPFSMigrationInvestigation setBouncedItemsMatrix:](v5, "setBouncedItemsMatrix:", -[BRCAccountSessionFPFS fpfsMigrationBouncedMatrix](self, "fpfsMigrationBouncedMatrix"));
    -[AppTelemetryFPFSMigrationInvestigation setItemsNotFoundInDB:](v5, "setItemsNotFoundInDB:", -[BRCAccountSessionFPFS fpfsMigrationNewItemsInDB](self, "fpfsMigrationNewItemsInDB"));
    if (a3 != 1)
    {
      -[BRCAccountSessionFPFS fpfsMigrationEndTime](self, "fpfsMigrationEndTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;

      -[BRCAccountSessionFPFS fpfsMigrationStartTime](self, "fpfsMigrationStartTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v14);
      -[AppTelemetryFPFSMigrationInvestigation setImportTime:](v5, "setImportTime:");

      -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationLostItemCountKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AppTelemetryFPFSMigrationInvestigation setItemsNotMigratedCount:](v5, "setItemsNotMigratedCount:", objc_msgSend(v15, "br_roundedLongLongValue"));

      -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationChildItemsLostItemCountKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AppTelemetryFPFSMigrationInvestigation setChildItemsNotMigratedCount:](v5, "setChildItemsNotMigratedCount:", objc_msgSend(v16, "br_roundedLongLongValue"));

      -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationBusyDateLostItemCountKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AppTelemetryFPFSMigrationInvestigation setBusyDateNotMigratedCount:](v5, "setBusyDateNotMigratedCount:", objc_msgSend(v17, "br_roundedLongLongValue"));

      -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationIgnoredFromSyncLostItemCountKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AppTelemetryFPFSMigrationInvestigation setIgnoredFromSyncItemsNotMigratedCount:](v5, "setIgnoredFromSyncItemsNotMigratedCount:", objc_msgSend(v18, "br_roundedLongLongValue"));

      -[AppTelemetryFPFSMigrationInvestigation setIsSuccessful:](v5, "setIsSuccessful:", a3 == 2);
      -[AppTelemetryFPFSMigrationInvestigation setTypesOfNonMigratedItemsMask:](v5, "setTypesOfNonMigratedItemsMask:", -[BRCAccountSessionFPFS fpfsMigrationNonMigratedTypes](self, "fpfsMigrationNonMigratedTypes"));

    }
  }
  return v5;
}

- (void)_sendFPFSImportStartTelemetryEvent
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportStartTelemetryEvent].cold.1();

  -[BRCAccountSessionFPFS fpfsMigrationUUID](self, "fpfsMigrationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:UUID:value:](AppTelemetryTimeSeriesEvent, "newIntEvent:UUID:value:", 400, v5, 1);
  -[BRCAccountSessionFPFS _createAppTelemetryFPFSMigrationInvestigation:](self, "_createAppTelemetryFPFSMigrationInvestigation:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "investigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFpfsMigrationInvestigation:", v7);

  -[BRCAccountSessionFPFS analyticsReporter](self, "analyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 4, v6);

}

- (void)_reportForFPFSImportStatusTelemetryEventIfNeeded:(unsigned int)a3 completionHandler:(id)a4
{
  id v4;
  id v5;
  _QWORD v6[5];
  BRCFPImportReport *v7;

  v4 = a4;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__29;
  v6[4] = __Block_byref_object_dispose__29;
  v7 = objc_alloc_init(BRCFPImportReport);
  v5 = v4;
  BRPerformWithPersonaAndError();

  _Block_object_dispose(v6, 8);
}

void __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  int v10;

  if (a2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_cold_1(a1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE17630], "br_getProviderDomainIDForCurrentPersona");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC8270], "sharedConnectionProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_80;
    v8[3] = &unk_24FE45EF8;
    v10 = *(_DWORD *)(a1 + 56);
    v7 = *(_OWORD *)(a1 + 40);
    v6 = (id)v7;
    v9 = v7;
    objc_msgSend(v5, "importProgressForDomainWithID:completionHandler:", v3, v8);

    v4 = v9;
  }

}

void __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "fp_prettyDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v15;
      v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed querying the import status: %@%@", buf, 0x16u);

    }
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BE17300];
    objc_msgSend(v7, "fp_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "br_errorWithDomain:code:userInfo:description:", v17, 94, &unk_24FEB4C00, CFSTR("importProgressForDomainWithID failed: %@"), v8, v28);
LABEL_19:
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setImportError:", v18);

    goto LABEL_28;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFpReport:", v5);
  if (!objc_msgSend(v5, "status"))
  {
    if (*(_DWORD *)(a1 + 48) == 2)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v19;
        _os_log_impl(&dword_230455000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Migration might be stuck in MigrationNeedsClean status - send telemtry error!%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x24BE17300], 95, &unk_24FEB4C28, CFSTR("Migration might be stuck in MigrationNeedsClean status and FP migration status is <%ld>"), objc_msgSend(v5, "status"));
    }
    else
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v21;
        _os_log_impl(&dword_230455000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] There's no import ongoing in fp - send telemtry error!%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x24BE17300], 96, &unk_24FEB4C50, CFSTR("Bird assuming BRMigrationInProgress but FP migration status is <%ld>"), objc_msgSend(v5, "status"));
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setImportError:", v8);
LABEL_28:

    goto LABEL_29;
  }
  if ((objc_msgSend(v5, "status") == 2 || objc_msgSend(v5, "status") == 1) && objc_msgSend(v5, "numberOfItemsInError"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v5, "errorDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "retryCount") >= 4)
          {
            brc_bread_crumbs();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
              __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_80_cold_1();

            v25 = (void *)MEMORY[0x24BDD1540];
            v26 = *MEMORY[0x24BE17300];
            v27 = objc_msgSend(v5, "numberOfItemsInError");
            objc_msgSend(v5, "errorDetails");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "br_errorWithDomain:code:userInfo:description:", v26, 97, &unk_24FEB4C78, CFSTR("FP has %ld items in error: <%@>"), v27, v8);
            goto LABEL_19;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v10)
          continue;
        break;
      }
    }
    goto LABEL_28;
  }
LABEL_29:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)_getAndUpdateDaysSinceLastMigrationProgress:(int64_t)a3 itemsNotMigrated:(int64_t)a4 reconciledItems:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  -[BRCAccountSessionFPFS clientDB](self, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertOnQueue");

  -[BRCAccountSessionFPFS clientState](self, "clientState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStatusLastItemsNotMigratedKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAccountSessionFPFS clientState](self, "clientState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStatusLastReconciledItemsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAccountSessionFPFS clientState](self, "clientState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStatusMigrationStatsTakenAtKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[BRCAccountSessionFPFS clientState](self, "clientState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("kBRCFPFSMigrationStatusTTRTriggeredKey"));

LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS clientState](self, "clientState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("kBRCFPFSMigrationStatusMigrationStatsTakenAtKey"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS clientState](self, "clientState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("kBRCFPFSMigrationStatusLastItemsNotMigratedKey"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS clientState](self, "clientState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("kBRCFPFSMigrationStatusLastReconciledItemsKey"));

    -[BRCAccountSessionFPFS clientDB](self, "clientDB");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "forceBatchStart");

    v17 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v11, "longLongValue") != a4
    || objc_msgSend(v16, "fpfsStuckMigrationTakeReconciledItemsIntoAccount")
    && objc_msgSend(v13, "longLongValue") != a5)
  {
    goto LABEL_7;
  }
  v17 = a3 - objc_msgSend(v15, "longLongValue");
LABEL_8:

  return v17;
}

- (BOOL)_shouldTriggerTapToRadar:(int64_t)a3 daysSinceLastMigrationProgress:(int64_t)a4
{
  BOOL v5;
  void *v6;

  if (!a4 || -[BRCAccountSessionFPFS fpfsMigrationStatusTTRTriggered](self, "fpfsMigrationStatusTTRTriggered"))
    return 0;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "fpfsImportStatusTelemetryStuckMigrationDaysThreshold") <= a3;

  return v5;
}

- (id)_createRecoveryExecutedErrorForImportError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  v5 = (void *)MEMORY[0x24BDD1540];
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -objc_msgSend(v4, "code");
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 131, CFSTR("FPFS Migration Recovery Initiated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted:(int64_t)a3 daysSinceLastMigrationProgress:(int64_t)a4 importError:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  int64_t v15;
  time_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD block[4];
  id v30;
  uint8_t buf[4];
  int64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[BRCAccountSessionFPFS clientDB](self, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertOnQueue");

  -[BRCAccountSessionFPFS clientState](self, "clientState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationRecoveryWasInvokedAtKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = (int64_t)v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Recovery was already invoked once, ignoring%@", buf, 0xCu);
    }

    -[BRCAccountSessionFPFS _createRecoveryExecutedErrorForImportError:](self, "_createRecoveryExecutedErrorForImportError:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!objc_msgSend(MEMORY[0x24BE17688], "isRunningOnMacOS")
    || (objc_msgSend(MEMORY[0x24BE17688], "isSeedBuild") & 1) == 0
    && (objc_msgSend(MEMORY[0x24BE17688], "isInternalBuild") & 1) == 0)
  {
    v14 = v8;
LABEL_16:
    v22 = v14;
    goto LABEL_17;
  }
  v15 = -[BRCAccountSessionFPFS lastBootHistoryTime](self, "lastBootHistoryTime");
  v16 = time(0);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = (v16 - v15) / 86400;
  if (!v15 || v19 < objc_msgSend(v17, "fpfsStuckMigrationRecoveryDaysSinceUpgradeThreshold"))
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] Days since last boot history (%ld) are less then threshold%@", buf, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(v18, "fpfsStuckMigrationRecoveryDaysSinceImportStartedThreshold") > a3)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v32 = a3;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] Days since import started (%lld) are less then threshold%@", buf, 0x16u);
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v18, "fpfsStuckMigrationRecoveryDaysWithoutProgressThreshold") <= a4)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v32 = a4;
      v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_230455000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Migration progress is stuck for %lld days, invoking recovery flow...%@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    -[BRCAccountSessionFPFS clientTruthWorkloop](self, "clientTruthWorkloop");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke;
    block[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v30, (id *)buf);
    dispatch_async(v28, block);

    -[BRCAccountSessionFPFS _createRecoveryExecutedErrorForImportError:](self, "_createRecoveryExecutedErrorForImportError:", v8);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }
  brc_bread_crumbs();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v32 = a4;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_230455000, v25, OS_LOG_TYPE_DEFAULT, "[NOTICE] Days import is stuck (%lld) are less then threshold%@", buf, 0x16u);
  }

LABEL_13:
  v22 = v8;
LABEL_14:

LABEL_17:
  return v22;
}

void __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v1 = *MEMORY[0x24BDC8228];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_2;
  v2[3] = &unk_24FE3F588;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  +[BRCImportUtil reimportItemsBelowItemWithIdentifier:completionHandler:](BRCImportUtil, "reimportItemsBelowItemWithIdentifier:completionHandler:", v1, v2);
  objc_destroyWeak(&v3);
}

void __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  _QWORD block[5];

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_2_cold_1((uint64_t)v3);
    goto LABEL_6;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "clientTruthWorkloop");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_113;
    block[3] = &unk_24FE3FA18;
    block[4] = v4;
    dispatch_async(v5, block);
LABEL_6:

  }
}

void __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_113(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("kBRCFPFSMigrationRecoveryWasInvokedAtKey"));

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceBatchStart");

}

- (void)_populateFPFSImportStatusTelemetryEventForEvent:(id)a3 withFPImportReport:(id)a4 itemsNotMigrated:(int64_t)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  id v89;

  v89 = a3;
  v8 = a4;
  objc_msgSend(v89, "investigation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasFpfsMigrationInvestigation");

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fpfsMigrationInvestigation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setItemsNotMigratedCount:", v12);

    -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStatusLastItemsNotMigratedKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = objc_msgSend(v15, "longLongValue") - a5;
    else
      v17 = -1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fpfsMigrationInvestigation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setItemsNotMigratedDelta:", v19);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "numberOfItemsReconciled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fpfsMigrationInvestigation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setItemsReconciledInFileProvider:", v23);

    -[BRCClientState objectForKeyedSubscript:](self->_clientState, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStatusLastReconciledItemsKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = objc_msgSend(v8, "numberOfItemsReconciled");
      v28 = v27 - objc_msgSend(v26, "longLongValue");
    }
    else
    {
      v28 = -1;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fpfsMigrationInvestigation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setItemsReconciledInFileProviderDelta:", v30);

    v33 = (void *)MEMORY[0x24BDD16E0];
    v34 = (double)objc_msgSend(v8, "dbCreationTimestamp");
    -[BRCAccountSessionFPFS fpfsMigrationStartTime](self, "fpfsMigrationStartTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "timeIntervalSince1970");
    objc_msgSend(v33, "numberWithDouble:", v34 - v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "fpfsMigrationInvestigation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDurationBetweenDbCreationAndMigrationStart:", v38);

    v41 = objc_msgSend(v8, "isStreamResetRunning");
    objc_msgSend(v89, "investigation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "fpfsMigrationInvestigation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setIsStreamResetRunning:", v41);

    v44 = objc_msgSend(v8, "stateOfDownloadJobs");
    objc_msgSend(v89, "investigation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "fpfsMigrationInvestigation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setStateOfDownloadJobs:", v44);

    v47 = objc_msgSend(v8, "stateOfUploadJobs");
    objc_msgSend(v89, "investigation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "fpfsMigrationInvestigation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setStateOfUploadJobs:", v47);

    v50 = objc_msgSend(v8, "stateOfOtherJobs");
    objc_msgSend(v89, "investigation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "fpfsMigrationInvestigation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setStateOfOtherJobs:", v50);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "numberOfItemsPendingReconciliation"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "fpfsMigrationInvestigation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setNumberOfItemsPendingReconciliation:", v54);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "numberOfItemsPendingSelection"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "fpfsMigrationInvestigation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setNumberOfItemsPendingSelection:", v58);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "numberOfItemsPendingScanningDisk"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "fpfsMigrationInvestigation");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setNumberOfItemsPendingScanningDisk:", v62);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "numberOfItemsPendingScanningProvider"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "fpfsMigrationInvestigation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setNumberOfItemsPendingScanningProvider:", v66);

    v69 = objc_msgSend(v8, "xpcActivityRegisteredWithDuet");
    objc_msgSend(v89, "investigation");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "fpfsMigrationInvestigation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setXpcActivityRegisteredWithDuet:", v69);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "xpcActivityTimeSinceLastRegistration"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "fpfsMigrationInvestigation");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setXpcActivityTimeSinceLastRegistration:", v73);

    v76 = objc_msgSend(v8, "xpcActivityIsActive");
    objc_msgSend(v89, "investigation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "fpfsMigrationInvestigation");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setXpcActivityIsActive:", v76);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "xpcActivityTimeSinceLastActivation"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "br_roundedLongLongValue");
    objc_msgSend(v89, "investigation");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "fpfsMigrationInvestigation");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setXpcActivityTimeSinceLastActivation:", v80);

    v83 = objc_msgSend(v8, "xpcActivityTimeSinceLastAbleToRun");
    objc_msgSend(v89, "investigation");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "fpfsMigrationInvestigation");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setXpcActivityTimeSinceLastAbleToRun:", v83);

    v86 = objc_msgSend(v8, "xpcActivityDasdContext");
    objc_msgSend(v89, "investigation");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "fpfsMigrationInvestigation");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setXpcActivityDasdContext:", v86);

  }
}

- (void)_sendTelemetryEventWithDiagnosticAttributes:(id)a3 event:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  +[AppTelemetryTimeSeriesEvent nonMigratedItemInvestigationWithFoundInfo:](AppTelemetryTimeSeriesEvent, "nonMigratedItemInvestigationWithFoundInfo:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "investigation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFpfsMigrationNonMigratedItemInvestigation:", v9);

  -[BRCAccountSessionFPFS analyticsReporter](self, "analyticsReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 10, v6);

}

- (void)_sendItemsPendingReconciliation:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  AppTelemetryStuckStatus *v11;

  v6 = a4;
  v7 = a3;
  v11 = objc_alloc_init(AppTelemetryStuckStatus);
  -[AppTelemetryStuckStatus setItemPendingReconciliationIsLocked:](v11, "setItemPendingReconciliationIsLocked:", objc_msgSend(v7, "itemPendingReconciliationIsLocked"));
  -[AppTelemetryStuckStatus setItemPendingReconciliationIsLockedInDB:](v11, "setItemPendingReconciliationIsLockedInDB:", objc_msgSend(v7, "itemPendingReconciliationIsLockedInDB"));
  -[AppTelemetryStuckStatus setItemPendingReconciliationJobCode:](v11, "setItemPendingReconciliationJobCode:", objc_msgSend(v7, "itemPendingReconciliationJobCode"));
  -[AppTelemetryStuckStatus setItemPendingReconciliationJobSchedulingState:](v11, "setItemPendingReconciliationJobSchedulingState:", objc_msgSend(v7, "itemPendingReconciliationJobSchedulingState"));
  -[AppTelemetryStuckStatus setItemPendingReconciliationJobBlockingCode:](v11, "setItemPendingReconciliationJobBlockingCode:", objc_msgSend(v7, "itemPendingReconciliationJobBlockingCode"));
  objc_msgSend(v6, "investigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStuckStatus:", v11);

  objc_msgSend(v7, "diagnosticAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "diagnosticAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS _sendTelemetryEventWithDiagnosticAttributes:event:](self, "_sendTelemetryEventWithDiagnosticAttributes:event:", v10, v6);

}

- (void)_sendItemsPendingScanningDisk:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AppTelemetryStuckStatus *v20;

  v6 = a4;
  v7 = a3;
  v20 = objc_alloc_init(AppTelemetryStuckStatus);
  -[AppTelemetryStuckStatus setItemPendingScanningDiskEnumerationStatus:](v20, "setItemPendingScanningDiskEnumerationStatus:", objc_msgSend(v7, "itemPendingScanningDiskEnumerationStatus"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskHasMultiplePagesEnumeration:](v20, "setItemPendingScanningDiskHasMultiplePagesEnumeration:", objc_msgSend(v7, "itemPendingScanningDiskHasMultiplePagesEnumeration"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingReconciliation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:", objc_msgSend(v8, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:](v20, "setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:", objc_msgSend(v9, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:", objc_msgSend(v10, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:", objc_msgSend(v11, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:", objc_msgSend(v12, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncUp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:", objc_msgSend(v13, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:", objc_msgSend(v14, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncDown"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:", objc_msgSend(v15, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingRejection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingRejection:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingRejection:", objc_msgSend(v16, "br_roundedLongLongValue"));

  objc_msgSend(v6, "investigation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setStuckStatus:", v20);

  objc_msgSend(v7, "diagnosticAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "diagnosticAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS _sendTelemetryEventWithDiagnosticAttributes:event:](self, "_sendTelemetryEventWithDiagnosticAttributes:event:", v19, v6);

}

- (void)_sendItemsPendingScanningProvider:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AppTelemetryStuckStatus *v14;

  v6 = a4;
  v7 = a3;
  v14 = objc_alloc_init(AppTelemetryStuckStatus);
  -[AppTelemetryStuckStatus setItemPendingScanningProviderEnumerationStatus:](v14, "setItemPendingScanningProviderEnumerationStatus:", objc_msgSend(v7, "itemPendingScanningProviderEnumerationStatus"));
  -[AppTelemetryStuckStatus setItemPendingScanningProviderHasMultiplePagesEnumeration:](v14, "setItemPendingScanningProviderHasMultiplePagesEnumeration:", objc_msgSend(v7, "itemPendingScanningProviderHasMultiplePagesEnumeration"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningProviderNumberOfChildren"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningProviderNumberOfChildren:](v14, "setItemPendingScanningProviderNumberOfChildren:", objc_msgSend(v8, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningProviderNumberOfChildrenPendingCreation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningProviderNumberOfChildrenPendingCreation:](v14, "setItemPendingScanningProviderNumberOfChildrenPendingCreation:", objc_msgSend(v9, "br_roundedLongLongValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningProviderNumberOfChildrenFailingCreation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryStuckStatus setItemPendingScanningProviderNumberOfChildrenFailingCreation:](v14, "setItemPendingScanningProviderNumberOfChildrenFailingCreation:", objc_msgSend(v10, "br_roundedLongLongValue"));

  -[AppTelemetryStuckStatus setItemPendingScanningProviderRemovalOfDatalessBitStatus:](v14, "setItemPendingScanningProviderRemovalOfDatalessBitStatus:", objc_msgSend(v7, "itemPendingScanningProviderRemovalOfDatalessBitStatus"));
  objc_msgSend(v6, "investigation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStuckStatus:", v14);

  objc_msgSend(v7, "diagnosticAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "diagnosticAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS _sendTelemetryEventWithDiagnosticAttributes:event:](self, "_sendTelemetryEventWithDiagnosticAttributes:event:", v13, v6);

}

- (void)_sendTelemetryEventForPendingItemsWithFPReport:(id)a3 migrationUUID:(id)a4 daysSinceImportStarted:(int64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  int i;
  unint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  objc_msgSend(v25, "itemsPendingReconciliation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v25, "itemsPendingScanningDisk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  objc_msgSend(v25, "itemsPendingScanningProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "migrationStatusPendingItemsTelemetryLimit");

  v24 = v8;
  v17 = +[AppTelemetryTimeSeriesEvent newLongEvent:UUID:value:](AppTelemetryTimeSeriesEvent, "newLongEvent:UUID:value:", 404, v8, a5);
  for (i = 0; i != 3; ++i)
  {
    if (v16)
    {
      for (j = 0; v16 != j; ++j)
      {
        if (i || j >= v10)
        {
          if (i == 1 && j < v12)
          {
            objc_msgSend(v25, "itemsPendingScanningDisk");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", j);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            -[BRCAccountSessionFPFS _sendItemsPendingScanningDisk:event:](self, "_sendItemsPendingScanningDisk:event:", v21, v17);
          }
          else
          {
            if (i != 2 || j >= v14)
              break;
            objc_msgSend(v25, "itemsPendingScanningProvider");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndexedSubscript:", j);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            -[BRCAccountSessionFPFS _sendItemsPendingScanningProvider:event:](self, "_sendItemsPendingScanningProvider:event:", v21, v17);
          }
        }
        else
        {
          objc_msgSend(v25, "itemsPendingReconciliation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", j);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[BRCAccountSessionFPFS _sendItemsPendingReconciliation:event:](self, "_sendItemsPendingReconciliation:event:", v21, v17);
        }

      }
    }
  }

}

- (void)_sendFPFSImportStatusTelemetryEvent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  BRCAccountSessionFPFS *v20;
  id v21[2];
  _BYTE location[12];
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS fpfsMigrationUUID](self, "fpfsMigrationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRCAccountSessionFPFS fpfsMigrationState](self, "fpfsMigrationState");
  if ((v4 - 3) >= 0xFFFFFFFE)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS fpfsMigrationStartTime](self, "fpfsMigrationStartTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "day");

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fpfsImportStatusTelemetryDaysThreshold");

    if ((uint64_t)v10 >= v12)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportStatusTelemetryEvent].cold.1();

      objc_initWeak((id *)location, self);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke;
      v18[3] = &unk_24FE45F70;
      objc_copyWeak(v21, (id *)location);
      v17 = v3;
      v21[1] = v10;
      v19 = v17;
      v20 = self;
      -[BRCAccountSessionFPFS _reportForFPFSImportStatusTelemetryEventIfNeeded:completionHandler:](self, "_reportForFPFSImportStatusTelemetryEventIfNeeded:completionHandler:", v5, v18);

      objc_destroyWeak(v21);
      objc_destroyWeak((id *)location);
    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 134218498;
        *(_QWORD *)&location[4] = v10;
        v23 = 1024;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Not sending FPFS Import status telemetry because: Days since import started: %ld. Threshold: %d%@", location, 0x1Cu);
      }

    }
  }

}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13[2];

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[6];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2;
    block[3] = &unk_24FE45F48;
    v7 = *(id *)(a1 + 32);
    v13[1] = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = v7;
    v11 = v8;
    v12 = v3;
    objc_copyWeak(v13, (id *)(a1 + 48));
    dispatch_async(v6, block);
    objc_destroyWeak(v13);

  }
}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  char v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v43 = +[AppTelemetryTimeSeriesEvent newLongEvent:UUID:value:](AppTelemetryTimeSeriesEvent, "newLongEvent:UUID:value:", 402, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "_createAppTelemetryFPFSMigrationInvestigation:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "investigation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFpfsMigrationInvestigation:", v2);

  objc_msgSend(*(id *)(a1 + 48), "importError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "fetchAccountWaitOperationWithAccountReady:", &v46);
  if (!v46)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 137, CFSTR("Account is not ready"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "fpfsMigrationNonMigratedItems");
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "fpReport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_populateFPFSImportStatusTelemetryEventForEvent:withFPImportReport:itemsNotMigrated:", v43, v9, v7);

  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "fpReport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_sendTelemetryEventForPendingItemsWithFPReport:migrationUUID:daysSinceImportStarted:", v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));

  v12 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "fpReport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "_getAndUpdateDaysSinceLastMigrationProgress:itemsNotMigrated:reconciledItems:", v13, v7, objc_msgSend(v14, "numberOfItemsReconciled"));

  objc_msgSend(*(id *)(a1 + 40), "_triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted:daysSinceLastMigrationProgress:importError:", *(_QWORD *)(a1 + 64), v15, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_cold_2((_QWORD *)(a1 + 32));
    goto LABEL_10;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v48 = v19;
    v49 = 2112;
    v50 = v16;
    v51 = 2112;
    v52 = v17;
    _os_log_impl(&dword_230455000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Sending Error FPFS migration status telemetry event (%@) with error: %@%@", buf, 0x20u);
  }

  v20 = objc_msgSend(v16, "code");
  objc_msgSend(v43, "investigation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setErrorCode:", v20);

  objc_msgSend(v16, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "investigation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setErrorDomain:", v22);

  v24 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v16, "fp_prettyDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "investigation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setErrorDescription:", v26);

  objc_msgSend(v16, "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("OriginatorID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v29, "stringValue");
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "investigation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setOperationType:", v30);

LABEL_10:
  }

  objc_msgSend(*(id *)(a1 + 40), "analyticsReporter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 6, v43);

  objc_msgSend(*(id *)(a1 + 40), "_fixImportStatusErrorIfPossible:", v16);
  if ((!v16 || (objc_msgSend(v16, "br_isCloudDocsErrorCode:", 96) & 1) == 0)
    && objc_msgSend(*(id *)(a1 + 40), "_shouldTriggerTapToRadar:daysSinceLastMigrationProgress:", *(_QWORD *)(a1 + 64), v15))
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_cold_1();

    v35 = (void *)MEMORY[0x24BDD17C8];
    v36 = objc_msgSend(v43, "telemetrySchema");
    if ((int)v36 > 299)
    {
      switch((int)v36)
      {
        case 500:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_NEW_WITH_EXISTING");
          break;
        case 501:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW");
          break;
        case 502:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_EXISTING");
          break;
        case 503:
          v37 = CFSTR("ITEM_BOUNCE_BY_SERVER");
          break;
        case 504:
          v37 = CFSTR("ITEM_BOUNCE_CREATE_ITEM_WITH_EXISTING");
          break;
        case 505:
          v37 = CFSTR("ITEM_BOUNCE_CHANGE_ITEM_WITH_EXISTING");
          break;
        case 506:
          v37 = CFSTR("ITEM_BOUNCE_SHARE_ACCEPT_EXISTING_WITH_NEW");
          break;
        case 507:
          v37 = CFSTR("ITEM_BOUNCE_SHARE_ACCEPT_NEW_WITH_EXISTING");
          break;
        case 508:
          v37 = CFSTR("ITEM_BOUNCE_TRASHED_ITEM");
          break;
        case 509:
          v37 = CFSTR("ITEM_BOUNCE_ITEM_DIRECTORY_MERGE");
          break;
        case 510:
          v37 = CFSTR("ITEM_BOUNCE_NEW_DIRECTORY_WITH_EXISTING");
          break;
        case 511:
          v37 = CFSTR("ITEM_BOUNCE_EXISTING_WITH_NEW_DIRECTORY");
          break;
        case 512:
          v37 = CFSTR("ITEM_BOUNCE_ITEM_WITH_DOCUMENTS_FOLDER");
          break;
        case 513:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_DEAD_EXISTING_WITH_NEW");
          break;
        case 514:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_NOT_KNOWN_BY_SERVER_WITH_NEW");
          break;
        case 515:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_LOCAL_DIFF_REPARENT_WITH_NEW");
          break;
        case 516:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_LOCAL_DIFF_FILE_NAME_WITH_NEW");
          break;
        case 517:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_INITIAL_SCAN_WITH_NEW");
          break;
        case 518:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_SHARED_ITEM_WITH_NEW_SHARED_ITEM_UNTITLED_FILE_NAME");
          break;
        case 519:
          v37 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW_UNTITLED_FILE_NAME");
          break;
        default:
          switch((int)v36)
          {
            case 400:
              v37 = CFSTR("FPFS_MIGRATION_STARTED");
              break;
            case 401:
              v37 = CFSTR("FPFS_MIGRATION_FINISHED");
              break;
            case 402:
              v37 = CFSTR("FPFS_MIGRATION_STATUS_REPORT");
              break;
            case 403:
              v37 = CFSTR("FPFS_MIGRATION_NON_MIGRATED_ITEM_REPORT");
              break;
            case 404:
              v37 = CFSTR("FPFS_MIGRATION_STUCK_STATUS");
              break;
            default:
              if ((_DWORD)v36 == 300)
              {
                v37 = CFSTR("INITIAL_SCAN_REJECTED_MISMATCH_TYPE");
              }
              else
              {
LABEL_50:
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v36);
                v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
          break;
      }
    }
    else
    {
      v37 = CFSTR("UNKNOWN");
      switch((int)v36)
      {
        case 0:
          break;
        case 1:
          v37 = CFSTR("_UNUSED_SYNC_UP_BACKOFF_RATIO");
          break;
        case 2:
          v37 = CFSTR("FOLDER_SHARING_ITEM_COUNT_MISMATCH");
          break;
        case 3:
          v37 = CFSTR("MISSING_PUSH");
          break;
        case 4:
          v37 = CFSTR("PERMANENTLY_INCONSISTENT");
          break;
        case 5:
          v37 = CFSTR("DROPPED_EVENTS");
          break;
        case 6:
          v37 = CFSTR("TEST_METRIC");
          break;
        case 7:
          v37 = CFSTR("SHARE_ALIAS_IN_SHARED_FOLDER");
          break;
        case 8:
          v37 = CFSTR("MALIGNANT_ZONE_RESET");
          break;
        case 9:
          v37 = CFSTR("BENIGN_ZONE_RESET");
          break;
        case 10:
          v37 = CFSTR("DB_RESET");
          break;
        case 11:
          v37 = CFSTR("APPLY_SCHEDULER_MISSING_JOBS");
          break;
        case 12:
          v37 = CFSTR("SYNC_UP_MISSING_JOBS");
          break;
        case 13:
          v37 = CFSTR("READER_MISSING_JOBS");
          break;
        case 14:
          v37 = CFSTR("UPLOADER_MISSING_JOBS");
          break;
        case 15:
          v37 = CFSTR("DOWNLOADER_MISSING_JOBS");
          break;
        case 16:
          v37 = CFSTR("_UNUSED_SYNC_UP_BACKOFF_DELAY");
          break;
        case 17:
          v37 = CFSTR("FOLDER_SHARING_PCS_CHAINING");
          break;
        case 18:
          v37 = CFSTR("NEW_SHARE_ACCEPTATION");
          break;
        case 19:
          v37 = CFSTR("FS_EVENT_TO_SYNC_UP");
          break;
        case 20:
          v37 = CFSTR("USER_DOWNLOAD");
          break;
        case 21:
          v37 = CFSTR("CORRUPT_PACKAGE_DOWNLOAD");
          break;
        case 22:
          v37 = CFSTR("DIRECTORY_MISSING_CHAINPCS");
          break;
        case 23:
          v37 = CFSTR("SYNC_BOOSTING_PROBLEM_COUNT");
          break;
        case 24:
          v37 = CFSTR("DEEP_SCAN");
          break;
        case 25:
          v37 = CFSTR("OPERATION_TIMED_OUT");
          break;
        case 26:
          v37 = CFSTR("MISSING_SHARE_ALIAS");
          break;
        case 27:
          v37 = CFSTR("ASSET_CONTENT_NOT_FOUND");
          break;
        case 28:
          v37 = CFSTR("QBS_DIR_FAULT_COUNT");
          break;
        case 29:
          v37 = CFSTR("FILE_BOUNCED_MANY_TIMES");
          break;
        case 30:
          v37 = CFSTR("SYNC_UP_BACKOFF_RATIO_SUMMARY");
          break;
        case 31:
          v37 = CFSTR("SYNC_UP_BACKOFF_DELAY_SUMMARY");
          break;
        case 32:
          v37 = CFSTR("QBS_PERFORMANCE");
          break;
        case 33:
          v37 = CFSTR("ACCOUNT_SESSION_OPEN_ERROR");
          break;
        case 34:
          v37 = CFSTR("CORRUPT_SHARING_OPTIONS");
          break;
        case 35:
          v37 = CFSTR("INCORRECT_CONTENT_POLICY_COUNT");
          break;
        case 36:
          v37 = CFSTR("CORRUPT_BASEHASH_SALT_COUNT");
          break;
        case 37:
          v37 = CFSTR("EDP_KEYS_MISMATCH");
          break;
        case 38:
          v37 = CFSTR("DATABASE_ID_MISMATCH");
          break;
        case 39:
          v37 = CFSTR("COLLABORATION_UPLOAD");
          break;
        case 40:
          v37 = CFSTR("DANGLING_ZOMBIE_DIRECTORY_COUNT");
          break;
        case 41:
          v37 = CFSTR("RECORD_VALUE_ERROR");
          break;
        case 42:
          v37 = CFSTR("AGGRESSIVE_SALTING");
          break;
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
          goto LABEL_50;
        case 100:
          v37 = CFSTR("FULLY_CONSISTENT");
          break;
        case 101:
          v37 = CFSTR("FILE_CHECKSUM_MISMATCH");
          break;
        case 102:
          v37 = CFSTR("PACKAGE_CHECKSUM_MISMATCH");
          break;
        case 103:
          v37 = CFSTR("CHILD_COUNT_MISMATCH");
          break;
        case 104:
          v37 = CFSTR("RECURSIVE_ITEM_COUNT_MISMATCH");
          break;
        case 105:
          v37 = CFSTR("SHARE_ALIAS_COUNT_MISMATCH");
          break;
        case 106:
          v37 = CFSTR("SHARE_COUNT_MISMATCH");
          break;
        case 107:
          v37 = CFSTR("CONSISTENCY_CHECKER_FAILED");
          break;
        case 108:
          v37 = CFSTR("FILE_READ_ERROR");
          break;
        default:
          switch((int)v36)
          {
            case 200:
              v37 = CFSTR("CA_TOTAL_ERROR_COUNT");
              break;
            case 201:
              v37 = CFSTR("CA_UPLOAD_ERROR_COUNT");
              break;
            case 202:
              v37 = CFSTR("CA_DOWNLOAD_ERROR_COUNT");
              break;
            case 203:
              v37 = CFSTR("CA_SYNC_UP_ITEM_ERROR_COUNT");
              break;
            case 204:
              v37 = CFSTR("CA_SYNC_UP_ZONE_ERROR_COUNT");
              break;
            case 205:
              v37 = CFSTR("CA_SYNC_DOWN_ERROR_COUNT");
              break;
            case 210:
              v37 = CFSTR("CA_UPLOAD_ERROR");
              break;
            case 211:
              v37 = CFSTR("CA_DOWNLOAD_ERROR");
              break;
            case 212:
              v37 = CFSTR("CA_SYNC_UP_ITEM_ERROR");
              break;
            case 213:
              v37 = CFSTR("CA_SYNC_UP_ZONE_ERROR");
              break;
            case 214:
              v37 = CFSTR("CA_SYNC_DOWN_ERROR");
              break;
            case 215:
              v37 = CFSTR("CA_DAMAGED_FILE_UPLOAD_ERROR");
              break;
            case 216:
              v37 = CFSTR("CA_NIL_APP_LIBRARY");
              break;
            default:
              goto LABEL_50;
          }
          break;
      }
    }
    objc_msgSend(v16, "domain");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("%@ (%@: %ld)"), v37, v38, objc_msgSend(v16, "code"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FPFS Migration is running for then %ld days and might be stuck.\nError: %@"), *(_QWORD *)(a1 + 64), v16);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *(void **)(*(_QWORD *)(a1 + 40) + 152);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorStuckFPFSMigration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_130;
    v44[3] = &unk_24FE3F588;
    objc_copyWeak(&v45, (id *)(a1 + 56));
    objc_msgSend(v41, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:", v39, v40, &unk_24FEB4AB0, MEMORY[0x24BDBD1A8], 1, CFSTR("FPFS migration seem stuck"), v42, v44);

    objc_destroyWeak(&v45);
  }

}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_130(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  NSObject **v7;
  _QWORD block[7];

  if (!a2)
  {
    block[5] = v2;
    block[6] = v3;
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      v6 = WeakRetained[6];
      block[1] = 3221225472;
      block[2] = __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_131;
      block[3] = &unk_24FE3FA18;
      block[4] = v5;
      v7 = v5;
      block[0] = MEMORY[0x24BDAC760];
      dispatch_async_and_wait(v6, block);
      v5 = v7;
    }

  }
}

uint64_t __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_131(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fpfsMigrationStatusTTRWasTriggered");
}

- (void)triggerFPFSImportFinishedTelemetryEventIfNeeded
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];

  if (-[BRCAccountSessionFPFS isMigratingToFPFS](self, "isMigratingToFPFS"))
  {
    v3 = -[BRCAccountSessionFPFS fpfsMigrationState](self, "fpfsMigrationState");
    if (v3 == 1)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __87__BRCAccountSessionFPFS_FPFSAdditions__triggerFPFSImportFinishedTelemetryEventIfNeeded__block_invoke;
      v6[3] = &unk_24FE45F98;
      v6[4] = self;
      -[BRCAccountSessionFPFS _reportForFPFSImportStatusTelemetryEventIfNeeded:completionHandler:](self, "_reportForFPFSImportStatusTelemetryEventIfNeeded:completionHandler:", 1, v6);
    }
    else if (!v3)
    {
      -[BRCAccountSessionFPFS _triggerFPFSImportFinishedTelemetryEvent](self, "_triggerFPFSImportFinishedTelemetryEvent");
    }
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS(FPFSAdditions) triggerFPFSImportFinishedTelemetryEventIfNeeded].cold.1();

  }
}

void __87__BRCAccountSessionFPFS_FPFSAdditions__triggerFPFSImportFinishedTelemetryEventIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "importError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fixImportStatusErrorIfPossible:", v3);

}

- (void)_fixImportStatusErrorIfPossible:(id)a3
{
  NSObject *clientTruthWorkloop;
  _QWORD block[5];

  if (objc_msgSend(a3, "br_isCloudDocsErrorCode:", 96))
  {
    clientTruthWorkloop = self->_clientTruthWorkloop;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__BRCAccountSessionFPFS_FPFSAdditions___fixImportStatusErrorIfPossible___block_invoke;
    block[3] = &unk_24FE3FA18;
    block[4] = self;
    dispatch_async(clientTruthWorkloop, block);
  }
}

uint64_t __72__BRCAccountSessionFPFS_FPFSAdditions___fixImportStatusErrorIfPossible___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_230455000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Seems that we missed the notification about migration complete. Completing it now.%@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "markMigrationToFPFSComplete");
}

- (void)_triggerFPFSImportFinishedTelemetryEvent
{
  BRPerformWithPersonaAndError();
}

void __80__BRCAccountSessionFPFS_FPFSAdditions___triggerFPFSImportFinishedTelemetryEvent__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  if (a2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_cold_1(a1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE17630], "br_getProviderDomainIDForCurrentPersona");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __80__BRCAccountSessionFPFS_FPFSAdditions___triggerFPFSImportFinishedTelemetryEvent__block_invoke_cold_1((uint64_t)v3);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationLostItemCountKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "br_roundedLongLongValue");

    objc_msgSend(*(id *)(a1 + 32), "fpfsMigrationUUID");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x24BE17300], 90, MEMORY[0x24BDBD1B8], CFSTR("Found approximately %llu items that were not migrated by FP"), v8);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "_sendFPFSImportFinishedTelemetryEvent:", v8);

  }
}

- (void)_sendFPFSImportFinishedTelemetryEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  __CFString *v36;
  void *v37;
  BRCTapToRadarManager *tapToRadarManager;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCAccountSessionFPFS fpfsMigrationUUID](self, "fpfsMigrationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:UUID:value:](AppTelemetryTimeSeriesEvent, "newIntEvent:UUID:value:", 401, v5, v4 == 0);
  if (!v4)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v21 = 2;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportFinishedTelemetryEvent:].cold.4((uint64_t)v5);
    goto LABEL_8;
  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v40 = v5;
    v41 = 2112;
    v42 = v4;
    v43 = 2112;
    v44 = v7;
    _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Sending Error FPFS migration finished telemetry event (%@) with error: %@%@", buf, 0x20u);
  }

  v9 = objc_msgSend(v4, "code");
  objc_msgSend(v6, "investigation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setErrorCode:", v9);

  objc_msgSend(v4, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "investigation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setErrorDomain:", v11);

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "fp_prettyDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "investigation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setErrorDescription:", v15);

  objc_msgSend(v4, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("OriginatorID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "stringValue");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "investigation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setOperationType:", v19);

    v21 = 3;
LABEL_8:

    goto LABEL_10;
  }
  v21 = 3;
LABEL_10:

  -[BRCAccountSessionFPFS _createAppTelemetryFPFSMigrationInvestigation:](self, "_createAppTelemetryFPFSMigrationInvestigation:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "investigation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFpfsMigrationInvestigation:", v22);

  brc_bread_crumbs();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportFinishedTelemetryEvent:].cold.3(v6, (uint64_t)v24, v25);

  -[BRCAccountSessionFPFS analyticsReporter](self, "analyticsReporter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 5, v6);

  if (v4)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "testDevice"))
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportFinishedTelemetryEvent:].cold.1();
    }
    else
    {
      +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("FPFSMigration"), CFSTR("MigrationFailure"), v4);

      objc_msgSend(v27, "sendTapToRadarForMigrationErrors");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "code"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "containsObject:", v32);

      if (v33)
      {
        v34 = (void *)MEMORY[0x24BDD17C8];
        v35 = objc_msgSend(v6, "telemetrySchema");
        if ((int)v35 > 299)
        {
          switch((int)v35)
          {
            case 500:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_NEW_WITH_EXISTING");
              break;
            case 501:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW");
              break;
            case 502:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_EXISTING");
              break;
            case 503:
              v36 = CFSTR("ITEM_BOUNCE_BY_SERVER");
              break;
            case 504:
              v36 = CFSTR("ITEM_BOUNCE_CREATE_ITEM_WITH_EXISTING");
              break;
            case 505:
              v36 = CFSTR("ITEM_BOUNCE_CHANGE_ITEM_WITH_EXISTING");
              break;
            case 506:
              v36 = CFSTR("ITEM_BOUNCE_SHARE_ACCEPT_EXISTING_WITH_NEW");
              break;
            case 507:
              v36 = CFSTR("ITEM_BOUNCE_SHARE_ACCEPT_NEW_WITH_EXISTING");
              break;
            case 508:
              v36 = CFSTR("ITEM_BOUNCE_TRASHED_ITEM");
              break;
            case 509:
              v36 = CFSTR("ITEM_BOUNCE_ITEM_DIRECTORY_MERGE");
              break;
            case 510:
              v36 = CFSTR("ITEM_BOUNCE_NEW_DIRECTORY_WITH_EXISTING");
              break;
            case 511:
              v36 = CFSTR("ITEM_BOUNCE_EXISTING_WITH_NEW_DIRECTORY");
              break;
            case 512:
              v36 = CFSTR("ITEM_BOUNCE_ITEM_WITH_DOCUMENTS_FOLDER");
              break;
            case 513:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_DEAD_EXISTING_WITH_NEW");
              break;
            case 514:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_NOT_KNOWN_BY_SERVER_WITH_NEW");
              break;
            case 515:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_LOCAL_DIFF_REPARENT_WITH_NEW");
              break;
            case 516:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_LOCAL_DIFF_FILE_NAME_WITH_NEW");
              break;
            case 517:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_INITIAL_SCAN_WITH_NEW");
              break;
            case 518:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_SHARED_ITEM_WITH_NEW_SHARED_ITEM_UNTITLED_FILE_NAME");
              break;
            case 519:
              v36 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW_UNTITLED_FILE_NAME");
              break;
            default:
              switch((int)v35)
              {
                case 400:
                  v36 = CFSTR("FPFS_MIGRATION_STARTED");
                  break;
                case 401:
                  v36 = CFSTR("FPFS_MIGRATION_FINISHED");
                  break;
                case 402:
                  v36 = CFSTR("FPFS_MIGRATION_STATUS_REPORT");
                  break;
                case 403:
                  v36 = CFSTR("FPFS_MIGRATION_NON_MIGRATED_ITEM_REPORT");
                  break;
                case 404:
                  v36 = CFSTR("FPFS_MIGRATION_STUCK_STATUS");
                  break;
                default:
                  if ((_DWORD)v35 == 300)
                  {
                    v36 = CFSTR("INITIAL_SCAN_REJECTED_MISMATCH_TYPE");
                  }
                  else
                  {
LABEL_53:
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v35);
                    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          v36 = CFSTR("UNKNOWN");
          switch((int)v35)
          {
            case 0:
              break;
            case 1:
              v36 = CFSTR("_UNUSED_SYNC_UP_BACKOFF_RATIO");
              break;
            case 2:
              v36 = CFSTR("FOLDER_SHARING_ITEM_COUNT_MISMATCH");
              break;
            case 3:
              v36 = CFSTR("MISSING_PUSH");
              break;
            case 4:
              v36 = CFSTR("PERMANENTLY_INCONSISTENT");
              break;
            case 5:
              v36 = CFSTR("DROPPED_EVENTS");
              break;
            case 6:
              v36 = CFSTR("TEST_METRIC");
              break;
            case 7:
              v36 = CFSTR("SHARE_ALIAS_IN_SHARED_FOLDER");
              break;
            case 8:
              v36 = CFSTR("MALIGNANT_ZONE_RESET");
              break;
            case 9:
              v36 = CFSTR("BENIGN_ZONE_RESET");
              break;
            case 10:
              v36 = CFSTR("DB_RESET");
              break;
            case 11:
              v36 = CFSTR("APPLY_SCHEDULER_MISSING_JOBS");
              break;
            case 12:
              v36 = CFSTR("SYNC_UP_MISSING_JOBS");
              break;
            case 13:
              v36 = CFSTR("READER_MISSING_JOBS");
              break;
            case 14:
              v36 = CFSTR("UPLOADER_MISSING_JOBS");
              break;
            case 15:
              v36 = CFSTR("DOWNLOADER_MISSING_JOBS");
              break;
            case 16:
              v36 = CFSTR("_UNUSED_SYNC_UP_BACKOFF_DELAY");
              break;
            case 17:
              v36 = CFSTR("FOLDER_SHARING_PCS_CHAINING");
              break;
            case 18:
              v36 = CFSTR("NEW_SHARE_ACCEPTATION");
              break;
            case 19:
              v36 = CFSTR("FS_EVENT_TO_SYNC_UP");
              break;
            case 20:
              v36 = CFSTR("USER_DOWNLOAD");
              break;
            case 21:
              v36 = CFSTR("CORRUPT_PACKAGE_DOWNLOAD");
              break;
            case 22:
              v36 = CFSTR("DIRECTORY_MISSING_CHAINPCS");
              break;
            case 23:
              v36 = CFSTR("SYNC_BOOSTING_PROBLEM_COUNT");
              break;
            case 24:
              v36 = CFSTR("DEEP_SCAN");
              break;
            case 25:
              v36 = CFSTR("OPERATION_TIMED_OUT");
              break;
            case 26:
              v36 = CFSTR("MISSING_SHARE_ALIAS");
              break;
            case 27:
              v36 = CFSTR("ASSET_CONTENT_NOT_FOUND");
              break;
            case 28:
              v36 = CFSTR("QBS_DIR_FAULT_COUNT");
              break;
            case 29:
              v36 = CFSTR("FILE_BOUNCED_MANY_TIMES");
              break;
            case 30:
              v36 = CFSTR("SYNC_UP_BACKOFF_RATIO_SUMMARY");
              break;
            case 31:
              v36 = CFSTR("SYNC_UP_BACKOFF_DELAY_SUMMARY");
              break;
            case 32:
              v36 = CFSTR("QBS_PERFORMANCE");
              break;
            case 33:
              v36 = CFSTR("ACCOUNT_SESSION_OPEN_ERROR");
              break;
            case 34:
              v36 = CFSTR("CORRUPT_SHARING_OPTIONS");
              break;
            case 35:
              v36 = CFSTR("INCORRECT_CONTENT_POLICY_COUNT");
              break;
            case 36:
              v36 = CFSTR("CORRUPT_BASEHASH_SALT_COUNT");
              break;
            case 37:
              v36 = CFSTR("EDP_KEYS_MISMATCH");
              break;
            case 38:
              v36 = CFSTR("DATABASE_ID_MISMATCH");
              break;
            case 39:
              v36 = CFSTR("COLLABORATION_UPLOAD");
              break;
            case 40:
              v36 = CFSTR("DANGLING_ZOMBIE_DIRECTORY_COUNT");
              break;
            case 41:
              v36 = CFSTR("RECORD_VALUE_ERROR");
              break;
            case 42:
              v36 = CFSTR("AGGRESSIVE_SALTING");
              break;
            case 43:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
            case 58:
            case 59:
            case 60:
            case 61:
            case 62:
            case 63:
            case 64:
            case 65:
            case 66:
            case 67:
            case 68:
            case 69:
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
            case 75:
            case 76:
            case 77:
            case 78:
            case 79:
            case 80:
            case 81:
            case 82:
            case 83:
            case 84:
            case 85:
            case 86:
            case 87:
            case 88:
            case 89:
            case 90:
            case 91:
            case 92:
            case 93:
            case 94:
            case 95:
            case 96:
            case 97:
            case 98:
            case 99:
              goto LABEL_53;
            case 100:
              v36 = CFSTR("FULLY_CONSISTENT");
              break;
            case 101:
              v36 = CFSTR("FILE_CHECKSUM_MISMATCH");
              break;
            case 102:
              v36 = CFSTR("PACKAGE_CHECKSUM_MISMATCH");
              break;
            case 103:
              v36 = CFSTR("CHILD_COUNT_MISMATCH");
              break;
            case 104:
              v36 = CFSTR("RECURSIVE_ITEM_COUNT_MISMATCH");
              break;
            case 105:
              v36 = CFSTR("SHARE_ALIAS_COUNT_MISMATCH");
              break;
            case 106:
              v36 = CFSTR("SHARE_COUNT_MISMATCH");
              break;
            case 107:
              v36 = CFSTR("CONSISTENCY_CHECKER_FAILED");
              break;
            case 108:
              v36 = CFSTR("FILE_READ_ERROR");
              break;
            default:
              switch((int)v35)
              {
                case 200:
                  v36 = CFSTR("CA_TOTAL_ERROR_COUNT");
                  break;
                case 201:
                  v36 = CFSTR("CA_UPLOAD_ERROR_COUNT");
                  break;
                case 202:
                  v36 = CFSTR("CA_DOWNLOAD_ERROR_COUNT");
                  break;
                case 203:
                  v36 = CFSTR("CA_SYNC_UP_ITEM_ERROR_COUNT");
                  break;
                case 204:
                  v36 = CFSTR("CA_SYNC_UP_ZONE_ERROR_COUNT");
                  break;
                case 205:
                  v36 = CFSTR("CA_SYNC_DOWN_ERROR_COUNT");
                  break;
                case 210:
                  v36 = CFSTR("CA_UPLOAD_ERROR");
                  break;
                case 211:
                  v36 = CFSTR("CA_DOWNLOAD_ERROR");
                  break;
                case 212:
                  v36 = CFSTR("CA_SYNC_UP_ITEM_ERROR");
                  break;
                case 213:
                  v36 = CFSTR("CA_SYNC_UP_ZONE_ERROR");
                  break;
                case 214:
                  v36 = CFSTR("CA_SYNC_DOWN_ERROR");
                  break;
                case 215:
                  v36 = CFSTR("CA_DAMAGED_FILE_UPLOAD_ERROR");
                  break;
                case 216:
                  v36 = CFSTR("CA_NIL_APP_LIBRARY");
                  break;
                default:
                  goto LABEL_53;
              }
              break;
          }
        }
        objc_msgSend(v4, "domain");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("%@ (%@: %ld)"), v36, v37, objc_msgSend(v4, "code"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        tapToRadarManager = self->_tapToRadarManager;
        objc_msgSend(v4, "description");
        v29 = objc_claimAutoreleasedReturnValue();
        -[BRCTapToRadarManager requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:](tapToRadarManager, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:", v28, v29, &unk_24FEB4AC8, MEMORY[0x24BDBD1A8], 1, CFSTR("it failed to migrate to FPFS"), v4);
      }
      else
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportFinishedTelemetryEvent:].cold.2();
      }
    }

  }
  -[BRCAccountSessionFPFS _cleanupMigrationClientState](self, "_cleanupMigrationClientState");

}

- (id)_postImportAnalysisForProviderDomainID:(id)a3 withLostItemCount:(unint64_t)a4 withMigrationID:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x24BE17300], 90, MEMORY[0x24BDBD1B8], CFSTR("Found approximately %llu items that were not migrated by FP"), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_clientZonesMatchingSearchString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD);
  id v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  BRCAccountSessionFPFS *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  char v60;
  _QWORD v61[4];
  id v62;
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v4) ^ 1;

  }
  v8 = objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v4;
    v11 = (id)*MEMORY[0x24BDB8E88];
  }
  else
  {
    v12 = v8;
    v13 = v9;
    objc_msgSend(v4, "substringToIndex:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", v12 + v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v11;
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("."));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE17640], "validateContainerID:", v15))
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithZoneName:ownerName:", v15, v14);
    -[BRCAccountSessionFPFS clientZoneByMangledID:](self, "clientZoneByMangledID:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (id)v17;
      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke;
      v61[3] = &unk_24FE45FC0;
      v62 = v15;
      v20 = v19;
      v63 = v20;
      -[BRCAccountSessionFPFS enumerateSharedClientZones:](self, "enumerateSharedClientZones:", v61);
      objc_msgSend(v20, "addObject:", v18);
      v21 = v63;
      v22 = v20;

      v23 = v62;
      v24 = v22;
      goto LABEL_22;
    }

  }
  v49 = self;
  v25 = MEMORY[0x24BDAC760];
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_2;
  v59[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
  v60 = v6;
  v26 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BA0DC](v59);
  v27 = objc_alloc(MEMORY[0x24BDD1798]);
  ((void (**)(_QWORD, void *))v26)[2](v26, v15);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (const __CFString *)v28;
  else
    v30 = CFSTR("*");
  v31 = (void *)objc_msgSend(v27, "initWithPattern:options:error:", v30, 0, 0);

  v32 = objc_alloc(MEMORY[0x24BDD1798]);
  objc_msgSend(v14, "lowercaseString");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (const __CFString *)v33;
  else
    v35 = CFSTR("*");
  v36 = (void *)objc_msgSend(v32, "initWithPattern:options:error:", v35, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v25;
  v55[1] = 3221225472;
  v55[2] = __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_3;
  v55[3] = &unk_24FE46008;
  v38 = v14;
  v39 = v26;
  v58 = v39;
  v40 = v31;
  v56 = v40;
  v41 = v37;
  v57 = v41;
  v42 = (void *)MEMORY[0x2348BA0DC](v55);
  v50[0] = v25;
  v50[1] = 3221225472;
  v50[2] = __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_4;
  v50[3] = &unk_24FE46030;
  v54 = v39;
  v51 = v40;
  v52 = v36;
  v43 = v41;
  v53 = v43;
  v22 = v36;
  v16 = v40;
  v18 = v39;
  v44 = (void *)MEMORY[0x2348BA0DC](v50);
  if (!v38)
    -[BRCAccountSessionFPFS enumeratePrivateClientZones:](v49, "enumeratePrivateClientZones:", v42);
  -[BRCAccountSessionFPFS enumerateSharedClientZones:](v49, "enumerateSharedClientZones:", v44, v38);
  objc_msgSend(v43, "sortUsingComparator:", &__block_literal_global_37);
  brc_bread_crumbs();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v65 = v4;
    v66 = 2112;
    v67 = v43;
    v68 = 2112;
    v69 = v45;
    _os_log_debug_impl(&dword_230455000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] containers matching '%@': %@%@", buf, 0x20u);
  }

  v23 = v43;
  v24 = v23;
  v14 = v48;
LABEL_22:

  return v24;
}

uint64_t __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 1;
}

id __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 32))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  return 1;
}

uint64_t __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(*(id *)(a1 + 40), "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }

  return 1;
}

uint64_t __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 129);
  return v7;
}

- (id)clientZonesMatchingSearchString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BRCAccountSessionFPFS _clientZonesMatchingSearchString:](self, "_clientZonesMatchingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorClientZoneNotFound:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = "(passed to caller)";
        v14 = 136315906;
        v15 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) clientZonesMatchingSearchString:error:]";
        v16 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

    v8 = 0;
  }

  return v8;
}

- (id)singleClientZoneMatchingSearchString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  const char *v27;
  const char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BRCAccountSessionFPFS _clientZonesMatchingSearchString:](self, "_clientZonesMatchingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      objc_msgSend(v7, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v14, "isPrivateZone"))
          {
            objc_msgSend(v14, "zoneName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);
          }
          else
          {
            objc_msgSend(v14, "mangledID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "mangledIDString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BE17300];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "br_errorWithDomain:code:description:", v18, 12, CFSTR("Too many containers matching '%@': {%@}"), v6, v19, (_QWORD)v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v28 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v35 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) singleClientZoneMatchingSearchString:error:]";
        v36 = 2080;
        if (!a4)
          v28 = "(ignored by caller)";
        v37 = v28;
        v38 = 2112;
        v39 = v20;
        v40 = 2112;
        v41 = v21;
        _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAppLibraryNotFound:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v35 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) singleClientZoneMatchingSearchString:error:]";
        v36 = 2080;
        if (!a4)
          v27 = "(ignored by caller)";
        v37 = v27;
        v38 = 2112;
        v39 = v8;
        v40 = 2112;
        v41 = v23;
        _os_log_error_impl(&dword_230455000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  v25 = 0;
LABEL_26:

  return v25;
}

- (id)_appLibrariesMatchingSearchString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  char v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v4) ^ 1;

  }
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (-[BRCAccountSessionFPFS appLibraryByID:](self, "appLibraryByID:", v8),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void (**)(_QWORD, _QWORD))v9;
    v40[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke;
    v32[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
    v33 = v6;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BA0DC](v32);
    v14 = objc_alloc(MEMORY[0x24BDD1798]);
    ((void (**)(_QWORD, void *))v13)[2](v13, v8);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = CFSTR("*");
    v18 = (void *)objc_msgSend(v14, "initWithPattern:options:error:", v17, 0, 0);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = v12;
    v26 = 3221225472;
    v27 = __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_2;
    v28 = &unk_24FE46098;
    v31 = v13;
    v29 = v18;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v19;
    v20 = v18;
    v10 = v13;
    v21 = (void *)MEMORY[0x2348BA0DC](&v25);
    -[BRCAccountSessionFPFS enumerateAppLibraries:](self, "enumerateAppLibraries:", v21, v25, v26, v27, v28);
    objc_msgSend(v19, "sortUsingComparator:", &__block_literal_global_22_0);
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v35 = v4;
      v36 = 2112;
      v37 = v19;
      v38 = 2112;
      v39 = v22;
      _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] containers matching '%@': %@%@", buf, 0x20u);
    }

    v11 = v19;
  }

  return v11;
}

id __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 32))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "appLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  return 1;
}

uint64_t __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "appLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 129);
  return v7;
}

- (id)appLibrariesMatchingSearchString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BRCAccountSessionFPFS _appLibrariesMatchingSearchString:](self, "_appLibrariesMatchingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorClientZoneNotFound:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = "(passed to caller)";
        v14 = 136315906;
        v15 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) appLibrariesMatchingSearchString:error:]";
        v16 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

    v8 = 0;
  }

  return v8;
}

- (id)singleAppLibraryMatchingSearchString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BRCAccountSessionFPFS _appLibrariesMatchingSearchString:](self, "_appLibrariesMatchingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      objc_msgSend(v7, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13), "appLibraryID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BE17300];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "br_errorWithDomain:code:description:", v16, 12, CFSTR("Too many containers matching '%@': {%@}"), v6, v17, (_QWORD)v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        v26 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v33 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) singleAppLibraryMatchingSearchString:error:]";
        v34 = 2080;
        if (!a4)
          v26 = "(ignored by caller)";
        v35 = v26;
        v36 = 2112;
        v37 = v18;
        v38 = 2112;
        v39 = v19;
        _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAppLibraryNotFound:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v33 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) singleAppLibraryMatchingSearchString:error:]";
        v34 = 2080;
        if (!a4)
          v25 = "(ignored by caller)";
        v35 = v25;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v21;
        _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  v23 = 0;
LABEL_23:

  return v23;
}

- (BOOL)shouldPerformPCSMigration
{
  void *v3;
  char v4;

  if (-[BRCAccountSessionFPFS PCSMigrationComplete](self, "PCSMigrationComplete"))
    return 0;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldPreparePCSMigration");

  return v4;
}

- (BOOL)PCSMigrationComplete
{
  void *v2;
  void *v3;
  char v4;

  -[BRCAccountSessionFPFS clientState](self, "clientState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hasCompletedPCSMigration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setNeedsPCSMigration:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS clientState](self, "clientState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("hasCompletedPCSMigration"));

  -[BRCPQLConnection forceBatchStart](self->_clientDB, "forceBatchStart");
}

- (BRCAccountSessionFPFS)init
{
  BRCAccountSessionFPFS *v2;
  BRCAccountSessionFPFS *v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dbWatcherQueue;
  id v12;
  dispatch_workloop_t v13;
  OS_dispatch_workloop *clientTruthWorkloop;
  id v15;
  dispatch_workloop_t v16;
  OS_dispatch_workloop *serverTruthWorkloop;
  id v18;
  dispatch_workloop_t v19;
  OS_dispatch_workloop *readOnlyWorkloop;
  uint64_t v21;
  NSHashTable *miscOperations;
  uint64_t v23;
  NSString *personaIdentifier;
  BRCBarrier *v25;
  BRCBarrier *dbLoadingBarrier;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)BRCAccountSessionFPFS;
  v2 = -[BRCAccountSessionFPFS init](&v28, sel_init);
  v3 = v2;
  if (v2)
  {
    brc_mutex_init_recursive(&v2->_zonesLock.pthread);
    brc_mutex_init(&v3->_zonesCreationLock.pthread);
    v3->_cloudDocsFD = -1;
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "br_currentPersonaID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    BRPersonaSpecificName();
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v7, v9);

    dbWatcherQueue = v3->_dbWatcherQueue;
    v3->_dbWatcherQueue = (OS_dispatch_queue *)v10;

    BRPersonaSpecificName();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_workloop_create((const char *)objc_msgSend(v12, "UTF8String"));
    clientTruthWorkloop = v3->_clientTruthWorkloop;
    v3->_clientTruthWorkloop = (OS_dispatch_workloop *)v13;

    BRPersonaSpecificName();
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = dispatch_workloop_create((const char *)objc_msgSend(v15, "UTF8String"));
    serverTruthWorkloop = v3->_serverTruthWorkloop;
    v3->_serverTruthWorkloop = (OS_dispatch_workloop *)v16;

    BRPersonaSpecificName();
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = dispatch_workloop_create((const char *)objc_msgSend(v18, "UTF8String"));
    readOnlyWorkloop = v3->_readOnlyWorkloop;
    v3->_readOnlyWorkloop = (OS_dispatch_workloop *)v19;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    miscOperations = v3->_miscOperations;
    v3->_miscOperations = (NSHashTable *)v21;

    objc_msgSend(MEMORY[0x24BDD17C8], "br_currentPersonaIDWithIsDataSeparated:", &v3->_isDataSeparated);
    v23 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v3->_personaIdentifier;
    v3->_personaIdentifier = (NSString *)v23;

    v25 = objc_alloc_init(BRCBarrier);
    dbLoadingBarrier = v3->_dbLoadingBarrier;
    v3->_dbLoadingBarrier = v25;

    v3->_isOpen = 0;
  }
  return v3;
}

- (BRCAccountSessionFPFS)initWithACAccountID:(id)a3 dbAccountDSID:(id)a4 salt:(id)a5 accountHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BRCAccountSessionFPFS *v15;
  BRCAccountSessionFPFS *v16;
  NSMutableSet *v17;
  NSMutableSet *xpcClients;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BRCFileUnlinker *v24;
  BRCFileUnlinker *fileUnlinker;
  void *v26;
  uint64_t v27;
  NSURL *dbURL;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[BRCAccountSessionFPFS init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_acAccountID, a3);
    objc_storeStrong((id *)&v16->_accountDSID, a4);
    objc_storeStrong((id *)&v16->_ubiquityTokenSalt, a5);
    objc_storeStrong((id *)&v16->_accountHandler, a6);
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    xpcClients = v16->_xpcClients;
    v16->_xpcClients = v17;

    objc_msgSend(MEMORY[0x24BDD17C8], "br_currentSupportDir");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x24BE174A0];
    objc_msgSend(v19, "stringByAppendingPathComponent:", *MEMORY[0x24BE174A0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS setSessionDirPath:](v16, "setSessionDirPath:", v21);

    objc_msgSend(MEMORY[0x24BDD17C8], "brc_currentCachesDir");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS setCacheDirPath:](v16, "setCacheDirPath:", v23);

    v24 = -[BRCFileUnlinker initWithCacheDirPath:]([BRCFileUnlinker alloc], "initWithCacheDirPath:", v22);
    fileUnlinker = v16->_fileUnlinker;
    v16->_fileUnlinker = v24;

    -[NSString stringByAppendingPathComponent:](v16->_sessionDirPath, "stringByAppendingPathComponent:", CFSTR("db"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v26, 1);
    v27 = objc_claimAutoreleasedReturnValue();
    dbURL = v16->_dbURL;
    v16->_dbURL = (NSURL *)v27;

  }
  return v16;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: session wasn't properly closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("session{account:%@}"), self->_accountDSID);
}

- (BRCTapToRadarManager)tapToRadarManager
{
  return self->_tapToRadarManager;
}

- (BRCSyncUpStagingProtocol)syncUpStager
{
  return (BRCSyncUpStagingProtocol *)self->_stageRegistry;
}

- (BRCDownloadStagingProtocol)downloadStager
{
  return (BRCDownloadStagingProtocol *)self->_stageRegistry;
}

- (BRCNamedThrottleManager)namedThrottleManager
{
  return self->_namedThrottleManager;
}

- (BRCBouncingAnalyzer)bouncingAnalyzer
{
  return self->_bouncingAnalyzer;
}

- (void)addMiscOperation:(id)a3
{
  -[NSHashTable addObject:](self->_miscOperations, "addObject:", a3);
}

- (id)getMiscOperations
{
  return (id)-[NSHashTable copy](self->_miscOperations, "copy");
}

- (void)closeXPCClientsSync
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx closing XPC connections%@");
  OUTLINED_FUNCTION_0();
}

- (BOOL)icloudAccountIsInCarry
{
  NSNumber *isInCarry;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSNumber *v17;
  NSNumber *v18;
  BOOL v19;

  isInCarry = self->_isInCarry;
  if (isInCarry)
    return -[NSNumber BOOLValue](isInCarry, "BOOLValue");
  +[BRCAccountHandler currentiCloudAccount](BRCAccountHandler, "currentiCloudAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "br_isEnabledForCloudDocs"))
  {
    -[BRCAccountSessionFPFS accountDSID](self, "accountDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "br_dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      objc_msgSend(v5, "propertiesForDataclass:", *MEMORY[0x24BDB4668]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "host");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "carryPartitions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && (objc_msgSend(v16, "containsObject:", v14) & 1) != 0)
          v17 = (NSNumber *)MEMORY[0x24BDBD1C8];
        else
          v17 = (NSNumber *)MEMORY[0x24BDBD1C0];
        v18 = self->_isInCarry;
        self->_isInCarry = v17;

      }
    }
  }
  v19 = -[NSNumber BOOLValue](self->_isInCarry, "BOOLValue");

  return v19;
}

- (void)_setupSharedPackageExtensionsPlist
{
  objc_msgSend(MEMORY[0x24BDD17C8], "brc_loadForcedPackageExtensionsForCurrentPersona");
}

- (void)_closeSharedPackageExtensionsPlist
{
  objc_msgSend(MEMORY[0x24BDD17C8], "brc_closeForcedPackageExtensionsForPersona:", self->_personaIdentifier);
}

- (void)_createAccountSupportPathIfNeeded:(id)a3 protectParent:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  void *v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  char v55;
  char v56;
  int v57;
  int v58;
  void *v59;
  NSObject *v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72[3];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t buf[4];
  _BYTE v78[10];
  id v79;
  _BYTE v80[10];
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v4 = a4;
  v93 = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:]", 489, v72);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v78 = v72[0];
    *(_WORD *)&v78[8] = 2112;
    v79 = v66;
    *(_WORD *)v80 = 2112;
    *(_QWORD *)&v80[2] = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating '%@'%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v66, 1, 0, &v71);
  v9 = v71;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    if ((objc_msgSend(v9, "br_isCocoaErrorCode:", 516) & 1) == 0)
    {
      brc_bread_crumbs();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v78 = v66;
        *(_WORD *)&v78[8] = 2112;
        v79 = v10;
        *(_WORD *)v80 = 2112;
        *(_QWORD *)&v80[2] = v59;
        _os_log_fault_impl(&dword_230455000, v60, OS_LOG_TYPE_FAULT, "[CRIT] can't create directory at '%@': %@%@", buf, 0x20u);
      }

LABEL_69:
      exit(1);
    }
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:].cold.2((uint64_t)v66);

  }
  v70 = v10;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v66, &v70);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v70;

  v15 = v14 == 0;
  if (v14)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v45 = objc_msgSend(objc_retainAutorelease(v66), "fileSystemRepresentation");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v78 = v45;
      *(_WORD *)&v78[8] = 2112;
      v79 = v14;
      *(_WORD *)v80 = 2112;
      *(_QWORD *)&v80[2] = v16;
      _os_log_fault_impl(&dword_230455000, v17, OS_LOG_TYPE_FAULT, "[CRIT] can't retrieve attributes of item at '%s': %@%@", buf, 0x20u);
    }

  }
  objc_msgSend(v13, "fileOwnerAccountName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSUserName();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v13, "fileOwnerAccountName");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      NSUserName();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v78 = v46;
      *(_WORD *)&v78[8] = 2112;
      v79 = v47;
      *(_WORD *)v80 = 2112;
      *(_QWORD *)&v80[2] = v21;
      _os_log_fault_impl(&dword_230455000, v22, OS_LOG_TYPE_FAULT, "[CRIT] created directory has a wrong owner (value: %@, expected: %@)%@", buf, 0x20u);

    }
    v15 = 0;
  }
  if ((objc_msgSend(v13, "filePosixPermissions") & 0x180) == 0)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v65 = aPcDBLSW[(unsigned __int16)objc_msgSend(v13, "filePosixPermissions") >> 12];
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x100) != 0)
        v48 = 114;
      else
        v48 = 45;
      v64 = v48;
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x80) != 0)
        v49 = 119;
      else
        v49 = 45;
      v63 = v49;
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x40) != 0)
        v50 = 120;
      else
        v50 = 45;
      v62 = v50;
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x20) != 0)
        v51 = 114;
      else
        v51 = 45;
      v61 = v51;
      if ((objc_msgSend(v13, "filePosixPermissions") & 0x10) != 0)
        v52 = 119;
      else
        v52 = 45;
      if ((objc_msgSend(v13, "filePosixPermissions") & 8) != 0)
        v53 = 120;
      else
        v53 = 45;
      if ((objc_msgSend(v13, "filePosixPermissions") & 4) != 0)
        v54 = 114;
      else
        v54 = 45;
      v55 = objc_msgSend(v13, "filePosixPermissions");
      v56 = objc_msgSend(v13, "filePosixPermissions");
      *(_DWORD *)buf = 67111682;
      *(_DWORD *)v78 = v65;
      if ((v55 & 2) != 0)
        v57 = 119;
      else
        v57 = 45;
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v64;
      if ((v56 & 1) != 0)
        v58 = 120;
      else
        v58 = 45;
      LOWORD(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 2) = v63;
      HIWORD(v79) = 1024;
      *(_DWORD *)v80 = v62;
      *(_WORD *)&v80[4] = 1024;
      *(_DWORD *)&v80[6] = v61;
      v81 = 1024;
      v82 = v52;
      v83 = 1024;
      v84 = v53;
      v85 = 1024;
      v86 = v54;
      v87 = 1024;
      v88 = v57;
      v89 = 1024;
      v90 = v58;
      v91 = 2112;
      v92 = v23;
      _os_log_fault_impl(&dword_230455000, v24, OS_LOG_TYPE_FAULT, "[CRIT] created directory doesn't have read/write access for owner (permission: %c%c%c%c%c%c%c%c%c%c)%@", buf, 0x48u);
    }

    v15 = 0;
  }
  v25 = *MEMORY[0x24BDD0CF0];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CF0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BDD0CE0];
  v28 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDD0CE0]);

  if ((v28 & 1) != 0)
  {
    v29 = v14;
  }
  else
  {
    v75 = v25;
    v76 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v14;
    v31 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v30, v66, &v69);
    v29 = v69;

    if ((v31 & 1) == 0)
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v78 = v66;
        *(_WORD *)&v78[8] = 2112;
        v79 = v29;
        *(_WORD *)v80 = 2112;
        *(_QWORD *)&v80[2] = v32;
        _os_log_fault_impl(&dword_230455000, v33, OS_LOG_TYPE_FAULT, "[CRIT] can't protect directory at '%@': %@%@", buf, 0x20u);
      }

    }
  }
  if (v4)
  {
    objc_msgSend(v66, "stringByDeletingLastPathComponent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v29;
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v34, &v68);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v68;

    objc_msgSend(v35, "objectForKeyedSubscript:", v25);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", v27);

    if ((v38 & 1) != 0)
    {
      v29 = v36;
    }
    else
    {
      v73 = v25;
      v74 = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v36;
      v40 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v39, v34, &v67);
      v29 = v67;

      if ((v40 & 1) == 0)
      {
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v78 = v34;
          *(_WORD *)&v78[8] = 2112;
          v79 = v29;
          *(_WORD *)v80 = 2112;
          *(_QWORD *)&v80[2] = v41;
          _os_log_fault_impl(&dword_230455000, v42, OS_LOG_TYPE_FAULT, "[CRIT] can't protect directory at '%@': %@%@", buf, 0x20u);
        }

      }
    }

  }
  else
  {
    v35 = v13;
  }

  if (!v15)
    goto LABEL_69;
  brc_bread_crumbs();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:].cold.1();

  __brc_leave_section(v72);
}

- (void)markAccountMigrationComplete
{
  -[BRCAccountHandler markMigrationCompletedForDSID:](self->_accountHandler, "markMigrationCompletedForDSID:", self->_accountDSID);
}

- (void)_setupThrottles
{
  void *v3;
  void *v4;
  BRCThrottle *v5;
  BRCThrottle *appLibraryScanThrottle;
  void *v7;
  BRCThrottle *v8;
  BRCThrottle *appLibraryResetThrottle;
  void *v10;
  BRCThrottle *v11;
  BRCThrottle *sharedAppLibraryResetThrottle;
  void *v13;
  BRCThrottle *v14;
  BRCThrottle *appLibraryAliasRemovalThrottle;
  void *v16;
  BRCThrottle *v17;
  BRCThrottle *lostItemThrottle;
  void *v19;
  BRCThrottle *v20;
  BRCThrottle *operationFailureThrottle;
  void *v22;
  BRCThrottle *v23;
  BRCThrottle *syncClientZoneThrottle;
  BRCThrottle *v25;
  BRCThrottle *syncClientZoneErrorThrottle;
  id v27;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLibraryScanThrottleParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("fsreader.container.throttle"), v4);
  appLibraryScanThrottle = self->_appLibraryScanThrottle;
  self->_appLibraryScanThrottle = v5;

  objc_msgSend(v3, "appLibraryResetThrottleParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("container.reset.throttle"), v7);
  appLibraryResetThrottle = self->_appLibraryResetThrottle;
  self->_appLibraryResetThrottle = v8;

  objc_msgSend(v3, "sharedAppLibraryResetThrottleParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("shared-container.reset.throttle"), v10);
  sharedAppLibraryResetThrottle = self->_sharedAppLibraryResetThrottle;
  self->_sharedAppLibraryResetThrottle = v11;

  objc_msgSend(v3, "appLibraryAliasRemovalThrottleParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("container.reset.alias-removal.throttle"), v13);
  appLibraryAliasRemovalThrottle = self->_appLibraryAliasRemovalThrottle;
  self->_appLibraryAliasRemovalThrottle = v14;

  objc_msgSend(v3, "lostItemThrottleParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("fsreader.lost.throttle"), v16);
  lostItemThrottle = self->_lostItemThrottle;
  self->_lostItemThrottle = v17;

  objc_msgSend(v3, "operationFailureThrottleParams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("operation.failure.throttle"), v19);
  operationFailureThrottle = self->_operationFailureThrottle;
  self->_operationFailureThrottle = v20;

  objc_msgSend(v3, "syncClientZoneThrottleParams");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("sync.container.throttle"), v22);
  syncClientZoneThrottle = self->_syncClientZoneThrottle;
  self->_syncClientZoneThrottle = v23;

  objc_msgSend(v3, "syncClientZoneErrorThrottleParams");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v25 = -[BRCThrottle initWithName:andParameters:]([BRCThrottle alloc], "initWithName:andParameters:", CFSTR("sync.container.error.throttle"), v27);
  syncClientZoneErrorThrottle = self->_syncClientZoneErrorThrottle;
  self->_syncClientZoneErrorThrottle = v25;

}

- (void)resetThrottles
{
  -[BRCThrottle reset](self->_appLibraryScanThrottle, "reset");
  -[BRCThrottle reset](self->_appLibraryResetThrottle, "reset");
  -[BRCThrottle reset](self->_appLibraryAliasRemovalThrottle, "reset");
  -[BRCThrottle reset](self->_sharedAppLibraryResetThrottle, "reset");
  -[BRCThrottle reset](self->_lostItemThrottle, "reset");
  -[BRCThrottle reset](self->_operationFailureThrottle, "reset");
  -[BRCThrottle reset](self->_syncClientZoneThrottle, "reset");
  -[BRCThrottle reset](self->_syncClientZoneErrorThrottle, "reset");
}

- (void)_removeXattr:(id)a3 onPath:(id)a4
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation");
  v7 = objc_retainAutorelease(v5);
  if (removexattr(v6, (const char *)objc_msgSend(v7, "UTF8String"), 0) < 0)
  {
    if (*__error() == 93)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = v7;
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ XATTR doesn't exist%@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v7;
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v8;
        v11 = "[WARNING] Failed removing %@: %@%@";
        goto LABEL_9;
      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v7;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v8;
      v11 = "[NOTICE] Success removing %@: %@%@";
LABEL_9:
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)_clearLegacyConflictVersionsAsync
{
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_49);

}

void __58__BRCAccountSessionFPFS__clearLegacyConflictVersionsAsync__block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __58__BRCAccountSessionFPFS__clearLegacyConflictVersionsAsync__block_invoke_cold_1();

  objc_msgSend(MEMORY[0x24BE3AE90], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE3AE80];
  objc_msgSend(MEMORY[0x24BE17610], "homeDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v2, "removeAdditionsInNamespace:underPath:withMatchingPredicate:errorPerAddition:error:", v3, v5, &__block_literal_global_37_0, 0, &v10);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] Couldn't clear the legacy additions after migrating to FPFS - %@%@", buf, 0x16u);
    }

  }
}

uint64_t __58__BRCAccountSessionFPFS__clearLegacyConflictVersionsAsync__block_invoke_35(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE3AE88], "brc_isLegacyConflictAddition:", a2);
}

- (void)_setICloudDesktopEnabled:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = a4;
  objc_msgSend(v5, "br_setEnabledForiCloudDesktop:", v4);
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__BRCAccountSessionFPFS__setICloudDesktopEnabled_forAccount___block_invoke;
  v8[3] = &unk_24FE42E78;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "saveAccount:withCompletionHandler:", v7, v8);

}

void __61__BRCAccountSessionFPFS__setICloudDesktopEnabled_forAccount___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_230455000, v7, (os_log_type_t)0x90u, "[ERROR] can't save account %@: %@%@", (uint8_t *)&v9, 0x20u);
    }

  }
}

- (BOOL)_addOrImportDomainIfNeededWithError:(id *)a3 domainAdded:(BOOL *)a4 domainImported:(BOOL *)a5
{
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  const char *v30;
  id v32;
  __CFString *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  BRCAccountSessionFPFS *v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountWithIdentifier:", self->_acAccountID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "isDataSeparatedAccount"))
  {
    objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userPersonaUniqueString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = CFSTR("iCloudDrive");
    if (!v11)
      goto LABEL_5;
LABEL_6:
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__40;
    v59 = __Block_byref_object_dispose__40;
    v60 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__40;
    v45 = __Block_byref_object_dispose__40;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__40;
    v39 = __Block_byref_object_dispose__40;
    v40 = 0;
    v32 = v11;
    v33 = v10;
    v34 = v9;
    BRPerformWithPersonaAndError();
    v15 = (void *)v56[5];
    v16 = v15 == 0;
    if (v15)
    {
      v17 = v15;
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        v30 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v62 = (BRCAccountSessionFPFS *)"-[BRCAccountSessionFPFS _addOrImportDomainIfNeededWithError:domainAdded:domainImported:]";
        v63 = 2080;
        if (!a3)
          v30 = "(ignored by caller)";
        v64 = v30;
        v65 = 2112;
        v66 = v17;
        v67 = 2112;
        v68 = v18;
        _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a3)
        *a3 = objc_retainAutorelease(v17);

    }
    else if (!*((_BYTE *)v52 + 24))
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        if (*((_BYTE *)v48 + 24))
          v22 = "Importing";
        else
          v22 = "Adding";
        v23 = (void *)v42[5];
        v24 = (void *)v36[5];
        *(_DWORD *)buf = 138413314;
        v62 = self;
        v63 = 2080;
        v64 = v22;
        v65 = 2112;
        v66 = v23;
        v67 = 2112;
        v68 = v24;
        v69 = 2112;
        v70 = v20;
        _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - %s Provider Domain %@/%@ was successful%@", buf, 0x34u);
      }

      if (a5)
        *a5 = *((_BYTE *)v48 + 24);
      if (a4)
        *a4 = *((_BYTE *)v48 + 24) ^ 1;
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);

    goto LABEL_22;
  }
  objc_msgSend(v9, "accountDescription");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "br_personaIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_6;
LABEL_5:
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSharedIPad");

  if ((v14 & 1) != 0)
    goto LABEL_6;
  brc_bread_crumbs();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS _addOrImportDomainIfNeededWithError:domainAdded:domainImported:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 116, CFSTR("Can't get persona for accountID %@"), self->_acAccountID);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (a3)
    *a3 = objc_retainAutorelease(v28);

  v16 = 0;
LABEL_22:

  return v16;
}

void __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  NSObject *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  int v104;
  void *v105;
  uint64_t v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  id v113;
  const char *v114;
  uint64_t v115;
  NSObject *v116;
  NSObject *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  void *v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  void *v133;
  NSObject *v134;
  NSObject *v135;
  NSObject *v136;
  NSObject *obj;
  id obja;
  void *v139;
  void *v140;
  id v141;
  id v142;
  id v143;
  _QWORD v144[6];
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _QWORD v149[5];
  id v150;
  _QWORD v151[5];
  id v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  id v160;
  uint8_t v161[128];
  uint8_t buf[4];
  uint64_t v163;
  __int16 v164;
  NSObject *v165;
  __int16 v166;
  NSObject *v167;
  __int16 v168;
  void *v169;
  __int16 v170;
  uint64_t v171;
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  void *v175;
  uint64_t v176;

  v176 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (!v4)
  {
    v152 = 0;
    objc_msgSend(MEMORY[0x24BDC83F0], "br_getDomainForCurrentPersonaWithError:", &v152);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v152;
    v7 = v152;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 128);
    *(_QWORD *)(v8 + 128) = v5;

    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
    {
      brc_bread_crumbs();
      v10 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v163 = v12;
        v164 = 2112;
        v165 = v10;
        _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Found an existing FPFS domain%@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      goto LABEL_85;
    }
    if (v7)
    {
      brc_bread_crumbs();
      v13 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v80 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v163 = v80;
        v164 = 2112;
        v165 = v7;
        v166 = 2112;
        v167 = v13;
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] %@ - Got an error while looking for FPFS domain, fail the request to open account. Error: %@%@", buf, 0x20u);
      }

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v6);
      goto LABEL_85;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "brc_ciconiaWorkDirForCurrentPersona");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "brc_ciconiaDumpDirForCurrentPersona");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v15, "path");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (access((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 0) < 0)
    {
      objc_msgSend(v16, "path");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = access((const char *)objc_msgSend(v18, "fileSystemRepresentation"), 0);

      if (v19 < 0)
        goto LABEL_17;
    }
    else
    {

    }
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v98 = *(_QWORD *)(a1 + 32);
      v99 = *(NSObject **)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v163 = v98;
      v164 = 2112;
      v165 = v99;
      v166 = 2112;
      v167 = v15;
      v168 = 2112;
      v169 = v20;
      _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Cleaning Ciconia for persona ID: %@ at: %@%@", buf, 0x2Au);
    }

    v22 = (void *)objc_opt_new();
    v151[0] = MEMORY[0x24BDAC760];
    v151[1] = 3221225472;
    v151[2] = __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_51;
    v151[3] = &unk_24FE3F6A0;
    v151[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v22, "cleanupCiconiaAtURL:diagnosticsURL:completionHandler:", v15, v16, v151);

LABEL_17:
    objc_msgSend(MEMORY[0x24BE17630], "br_getProviderDomainIDForCurrentPersona");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringByDeletingLastPathComponent](v23, "stringByDeletingLastPathComponent");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    v134 = v23;
    -[NSObject lastPathComponent](v23, "lastPathComponent");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    +[BRCStringAdditions _br_currentMobileDocumentsDirForLegacy](BRCStringAdditions, "_br_currentMobileDocumentsDirForLegacy");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "fileExistsAtPath:", v30);

    if (v32)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v30, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      BRCGetAccountDSIDForMobileDocsRoot(v33, 0);
      v34 = objc_claimAutoreleasedReturnValue();

      BRCGetXattrValueForKeyOnPath(v30, CFSTR("com.apple.file-provider-domain-id"));
      v136 = objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138413058;
        v163 = v37;
        v164 = 2112;
        v165 = v34;
        v166 = 2112;
        v167 = v136;
        v168 = 2112;
        v169 = v35;
        _os_log_impl(&dword_230455000, v36, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Found LMD folder with legacy XATTR '%@' and FP XATTR '%@', checking if it's valid for import%@", buf, 0x2Au);
      }

      v135 = v34;
      if (v34)
      {
        if ((-[NSObject isEqualToString:](v34, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)) & 1) == 0)
        {
          brc_bread_crumbs();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = *(_QWORD *)(a1 + 32);
            v41 = *(NSObject **)(v40 + 208);
            *(_DWORD *)buf = 138413058;
            v163 = v40;
            v164 = 2112;
            v165 = v135;
            v166 = 2112;
            v167 = v41;
            v168 = 2112;
            v169 = v38;
            v42 = "[WARNING] %@ - Mobile Documents folder owner (%@) DOES NOT match the session owner (%@). Deleting fold"
                  "er and not invoking import%@";
LABEL_63:
            _os_log_impl(&dword_230455000, v39, OS_LOG_TYPE_DEFAULT, v42, buf, 0x2Au);
            goto LABEL_64;
          }
          goto LABEL_64;
        }
      }
      else if (v136 && (-[NSObject isEqualToString:](v136, "isEqualToString:", v134) & 1) == 0)
      {
        brc_bread_crumbs();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v94 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138413058;
          v163 = v94;
          v164 = 2112;
          v165 = v136;
          v166 = 2112;
          v167 = v134;
          v168 = 2112;
          v169 = v38;
          v42 = "[WARNING] %@ - Mobile Documents FP XATTR (%@) DOES NOT match the domain ID (%@). Deleting folder and not"
                " invoking import%@";
          goto LABEL_63;
        }
LABEL_64:

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "renameAndUnlinkInBackgroundItemAtPath:", v30);
        BRCRecursiveRemoveBelow(*(void **)(*(_QWORD *)(a1 + 32) + 544));
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x24BE17300], 99, 0, CFSTR("Found unknown account data on disk"));
        v95 = objc_claimAutoreleasedReturnValue();
        v96 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v97 = *(void **)(v96 + 40);
        *(_QWORD *)(v96 + 40) = v95;
LABEL_84:

LABEL_85:
        goto LABEL_86;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "stringByAppendingString:", CFSTR(".CloudDocs"));
      v46 = objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v47 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v163 = v49;
        v164 = 2112;
        v165 = v46;
        v166 = 2112;
        v167 = v47;
        _os_log_impl(&dword_230455000, v48, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Mobile Documents folder owner matches the session owner. We can safely import. Adding legacy XATTR = %@ to LMD and removing FP XATTRs%@", buf, 0x20u);
      }

      BRCSetXattrValueForKeyOnPath(v30, CFSTR("com.apple.ubd.prsid"), v46);
      objc_msgSend(*(id *)(a1 + 32), "_removeXattr:onPath:", CFSTR("com.apple.file-provider-domain-id"), v30);
      v50 = *(void **)(a1 + 32);
      objc_msgSend(CFSTR("com.apple.file-provider-domain-id"), "stringByAppendingString:", CFSTR("#PN"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "_removeXattr:onPath:", v51, v30);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      v43 = v135;
      v44 = v136;
    }
    else
    {
      brc_bread_crumbs();
      v43 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v163 = v45;
        v164 = 2112;
        v165 = v43;
        _os_log_impl(&dword_230455000, v44, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Didn't find LMD folder. Will start from scratch%@", buf, 0x16u);
      }
    }

    brc_bread_crumbs();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
        v54 = "import";
      else
        v54 = "add";
      v55 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v56 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      v57 = *(_QWORD *)(a1 + 32);
      v58 = *(_QWORD *)(a1 + 40);
      v59 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413826;
      v163 = v57;
      v164 = 2080;
      v165 = v54;
      v166 = 2112;
      v167 = v55;
      v168 = 2112;
      v169 = v56;
      v170 = 2112;
      v171 = v58;
      v172 = 2112;
      v173 = v59;
      v174 = 2112;
      v175 = v52;
      _os_log_impl(&dword_230455000, v53, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Will attempt to %s domain: providerID = %@ , domainID = %@, persona = %@, displayName = %@%@", buf, 0x48u);
    }

    v60 = objc_msgSend(objc_alloc(MEMORY[0x24BDC83C0]), "initWithIdentifier:displayName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(a1 + 48));
    v61 = *(_QWORD *)(a1 + 32);
    v62 = *(void **)(v61 + 128);
    *(_QWORD *)(v61 + 128) = v60;

    objc_msgSend(*(id *)(a1 + 56), "br_dsid");
    v63 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "userInfo");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v64, "mutableCopy");
    v66 = v65;
    if (v65)
      v67 = v65;
    else
      v67 = objc_opt_new();
    v68 = v67;

    -[NSObject setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v63, *MEMORY[0x24BE17378]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setUserInfo:", v68);
    v133 = v30;
    v135 = v63;
    v136 = v68;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "_clearLegacyConflictVersionsAsync");
      if (objc_msgSend(*(id *)(a1 + 56), "isDataSeparatedAccount"))
      {
        objc_msgSend(MEMORY[0x24BDC83F0], "br_getLegacyEnterpriseProviderManager");
        v150 = 0;
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "br_getFPDomainsWithError:", &v150);
        v69 = objc_claimAutoreleasedReturnValue();
        v132 = v150;
        if (v132)
        {
          brc_bread_crumbs();
          obj = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, (os_log_type_t)0x90u))
          {
            v127 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            v163 = v127;
            v164 = 2112;
            v165 = v132;
            v166 = 2112;
            v167 = obj;
            _os_log_error_impl(&dword_230455000, v70, (os_log_type_t)0x90u, "[ERROR] %@ - couldn't get existing domains: %@%@", buf, 0x20u);
          }

        }
        else
        {
          v130 = v15;
          brc_bread_crumbs();
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            v83 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v139, "providerIdentifier");
            v84 = v69;
            v85 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v163 = v83;
            v164 = 2112;
            v165 = v84;
            v166 = 2112;
            v167 = v85;
            v168 = 2112;
            v169 = v81;
            _os_log_impl(&dword_230455000, v82, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Found the following domains: %@ from provider: %@%@", buf, 0x2Au);

            v69 = v84;
          }

          v149[0] = MEMORY[0x24BDAC760];
          v149[1] = 3221225472;
          v149[2] = __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_69;
          v149[3] = &unk_24FE473C8;
          v149[4] = *(_QWORD *)(a1 + 88);
          -[NSObject br_copy_if:](v69, "br_copy_if:", v149);
          v145 = 0u;
          v146 = 0u;
          v147 = 0u;
          v148 = 0u;
          obj = objc_claimAutoreleasedReturnValue();
          v86 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
          if (v86)
          {
            v87 = v86;
            v128 = v69;
            v88 = *(_QWORD *)v146;
            do
            {
              for (i = 0; i != v87; ++i)
              {
                if (*(_QWORD *)v146 != v88)
                  objc_enumerationMutation(obj);
                v90 = *(NSObject **)(*((_QWORD *)&v145 + 1) + 8 * i);
                brc_bread_crumbs();
                v91 = objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v92 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  v93 = *(_QWORD *)(a1 + 32);
                  *(_DWORD *)buf = 138412802;
                  v163 = v93;
                  v164 = 2112;
                  v165 = v90;
                  v166 = 2112;
                  v167 = v91;
                  _os_log_impl(&dword_230455000, v92, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Trying to remove domain %@%@", buf, 0x20u);
                }

                v144[0] = MEMORY[0x24BDAC760];
                v144[1] = 3221225472;
                v144[2] = __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_72;
                v144[3] = &unk_24FE408B8;
                v144[4] = *(_QWORD *)(a1 + 32);
                v144[5] = v90;
                objc_msgSend(v139, "br_removeDomain:sync:completionHandler:", v90, 1, v144);
              }
              v87 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
            }
            while (v87);
            v7 = 0;
            v15 = v130;
            v30 = v133;
            v69 = v128;
          }
          else
          {
            v15 = v130;
          }
        }

      }
      v100 = (void *)MEMORY[0x24BDC83F0];
      v101 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
      v102 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v30);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = 0;
      LOBYTE(v100) = objc_msgSend(v100, "br_importDomain:forProviderIdentifier:fromDirectoryAtURL:error:", v101, v102, v103, &v143);
      v75 = v143;

      if ((v100 & 1) == 0)
      {
        v104 = objc_msgSend(v75, "br_isCocoaErrorCode:", 3328);
        v105 = (void *)MEMORY[0x24BDD1540];
        v106 = *MEMORY[0x24BE17300];
        if (v104)
        {
          v159 = *MEMORY[0x24BDD1398];
          v160 = v75;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = CFSTR("volume not supported by FPFS");
          v109 = v105;
          v110 = v106;
          v111 = 121;
        }
        else
        {
          v157 = *MEMORY[0x24BDD1398];
          v158 = v75;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = CFSTR("Can't import FPFS domain");
          v109 = v105;
          v110 = v106;
          v111 = 92;
        }
        objc_msgSend(v109, "br_errorWithDomain:code:userInfo:description:", v110, v111, v107, v108);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_73;
      }
    }
    else
    {
      v71 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
      v72 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v142 = 0;
      v73 = objc_msgSend(MEMORY[0x24BDC83F0], "br_addDomain:forProviderIdentifier:error:", v71, v72, &v142);
      v74 = v142;
      v75 = v74;
      if ((v73 & 1) == 0)
      {
        if (objc_msgSend(v74, "br_isCocoaErrorCode:", 3328))
        {
          v76 = (void *)MEMORY[0x24BDD1540];
          v77 = *MEMORY[0x24BE17300];
          v155 = *MEMORY[0x24BDD1398];
          v156 = v75;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "br_errorWithDomain:code:userInfo:description:", v77, 121, v78, CFSTR("volume not supported by FPFS"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v75 = v75;
          v79 = v75;
        }
        goto LABEL_73;
      }
    }
    v79 = 0;
LABEL_73:

    if (v79)
    {
      v141 = 0;
      objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainWithID:cachePolicy:error:", v134, 0, &v141);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v141;
      if (!v113 && objc_msgSend(v112, "disconnectionState") == 6)
      {
        v129 = v16;
        v131 = v15;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
          v114 = "importing";
        else
          v114 = "adding";
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed %s domain. Device out of space for domain %@"), v114, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
        v115 = objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v116 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v117 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          v118 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          v163 = v118;
          v164 = 2112;
          v165 = v115;
          v166 = 2112;
          v167 = v116;
          _os_log_impl(&dword_230455000, v117, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - %@%@", buf, 0x20u);
        }

        v119 = (void *)MEMORY[0x24BDD1540];
        obja = (id)*MEMORY[0x24BE17300];
        v140 = (void *)v115;
        v153 = *MEMORY[0x24BDD1398];
        v120 = (void *)objc_msgSend(v79, "copy");
        v154 = v120;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
        v121 = a1;
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "br_errorWithDomain:code:userInfo:description:", obja, 85, v122, CFSTR("%@"), v115);
        v123 = objc_claimAutoreleasedReturnValue();

        a1 = v121;
        v124 = *(_QWORD *)(v121 + 32);
        v125 = *(void **)(v124 + 128);
        *(_QWORD *)(v124 + 128) = 0;

        v79 = (void *)v123;
        v16 = v129;
        v15 = v131;
      }

    }
    v126 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v97 = *(void **)(v126 + 40);
    *(_QWORD *)(v126 + 40) = v79;
    v30 = v133;
    goto LABEL_84;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
LABEL_86:

}

void __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] %@ - Cleaning up Ciconia failed: %@%@", (uint8_t *)&v7, 0x20u);
    }

  }
}

uint64_t __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_69(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v4;
}

void __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138413058;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v3;
      v16 = 2112;
      v17 = v4;
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] %@ - couldn't remove domain %@: %@%@", (uint8_t *)&v10, 0x2Au);
    }
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412802;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Successfully removed domain %@%@", (uint8_t *)&v10, 0x20u);
    }
  }

}

- (void)fixFileProviderDomainDecorations
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDC83F0], "br_getDomainForCurrentPersonaWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_storeStrong((id *)&self->_fpDomain, v3);
    -[BRCAccountSessionFPFS decorateUserInfoForFPFSDomain:withError:](self, "decorateUserInfoForFPFSDomain:withError:", self->_fpDomain, 0);
    v3 = v4;
  }

}

- (void)_createGroupContainerStageOfType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  NSObject *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BEBF268], "br_isInSyncBubble"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS _createGroupContainerStageOfType:].cold.1();
  }
  else
  {
    -[BRCAccountSessionFPFS groupContainerStagePathForCurrentPersonaFromStageType:](self, "groupContainerStagePathForCurrentPersonaFromStageType:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if ((objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v5, 0) & 1) == 0)
    {
      v11 = 0;
      v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v11);
      v6 = v11;
      if ((v8 & 1) == 0)
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v13 = v5;
          v14 = 2112;
          v15 = v6;
          v16 = 2112;
          v17 = v9;
          _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] Unable to create directory at '%@'; %@%@",
            buf,
            0x20u);
        }

      }
    }

  }
}

- (void)_prepareGroupContainerLocations
{
  -[BRCAccountSessionFPFS _createGroupContainerStageOfType:](self, "_createGroupContainerStageOfType:", 0);
}

- (void)_refreshRootsCache
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] New mobile documents dir = %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_submitSessionOpenFailedTelemetryEventIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Checking if there is a need to submit ACCOUNT_SESSION_OPEN_ERROR telemetry%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_submitDBCorruptionTelemetryEventIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Checking if there is a need to submit DB_RESET telemetry%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (BOOL)openWithError:(id *)a3 pushWorkloop:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *libraryRowIDsByMangledID;
  NSMutableDictionary *v11;
  NSMutableDictionary *appLibrariesByRowID;
  NSMutableDictionary *v13;
  NSMutableDictionary *serverZonesByZoneRowID;
  NSMutableDictionary *v15;
  NSMutableDictionary *sharedServerZonesByMangledID;
  NSMutableDictionary *v17;
  NSMutableDictionary *sharedClientZonesByMangledID;
  NSMutableDictionary *v19;
  NSMutableDictionary *privateServerZonesByID;
  NSMutableDictionary *v21;
  NSMutableDictionary *privateClientZonesByID;
  id v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSURL *v28;
  NSObject *v29;
  uint64_t v30;
  NSURL *v31;
  BRCVolume *v32;
  BRCVolume *volume;
  BOOL v34;
  id v35;
  void *v36;
  BRCStageRegistry *v37;
  BRCStageRegistry *stageRegistry;
  void *v39;
  int v40;
  BRCFairScheduler *v41;
  BRCFairScheduler *fairClientDBScheduler;
  BRCDeadlineScheduler *v43;
  BRCDeadlineScheduler *defaultScheduler;
  BRCContainerScheduler *v45;
  BRCContainerScheduler *containerScheduler;
  BRCApplyScheduler *v47;
  BRCApplyScheduler *applyScheduler;
  BRCFSImporter *v49;
  BRCFSImporter *fsImporter;
  BRCFSUploader *v51;
  BRCFSUploader *fsUploader;
  BRCFSDownloader *v53;
  BRCFSDownloader *fsDownloader;
  BRCSyncUpScheduler *v55;
  BRCSyncUpScheduler *syncUpScheduler;
  BRCNotificationManager *v57;
  BRCNotificationManager *notificationManager;
  BRCSyncContextProvider *v59;
  BRCSyncContextProvider *syncContextProvider;
  BRCNamedThrottleManager *v61;
  BRCNamedThrottleManager *namedThrottleManager;
  BRCTapToRadarManager *v63;
  BRCTapToRadarManager *tapToRadarManager;
  BRCDownloadTrackers *v65;
  BRCDownloadTrackers *downloadTrackers;
  NSObject *v67;
  OS_dispatch_queue *v68;
  OS_dispatch_queue *resetQueue;
  NSObject *v70;
  OS_dispatch_queue *v71;
  OS_dispatch_queue *dbFixupQueue;
  void *v73;
  BRCRecentsEnumerator *v74;
  BRCRecentsEnumerator *recentsEnumerator;
  BRCUserNotification *v76;
  BRCUserNotification *userNotification;
  void *v78;
  id v79;
  BRCDiskSpaceReclaimer *v80;
  BRCDiskSpaceReclaimer *diskReclaimer;
  void *v82;
  void *v83;
  void *v84;
  BOOL v85;
  void *v86;
  BRCGlobalProgress *v87;
  BRCGlobalProgress *globalProgress;
  BRCServerChangesApplier *v89;
  BRCServerChangesApplier *serverChangesApplier;
  BRCAnalyticsReporter *v91;
  BRCAnalyticsReporter *analyticsReporter;
  NSObject *clientTruthWorkloop;
  id v94;
  void *v95;
  NSObject *v96;
  const char *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  const char *v103;
  void *v104;
  NSObject *v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  const char *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  const char *v114;
  void *v115;
  _QWORD v116[5];
  char v117;
  _QWORD v118[5];
  id v119;
  __int16 v120;
  _QWORD block[4];
  NSURL *v122;
  uint64_t v123[3];
  uint64_t v124;
  void *v125;
  uint8_t buf[4];
  const char *v127;
  __int16 v128;
  BRCAccountSessionFPFS *v129;
  __int16 v130;
  id v131;
  __int16 v132;
  void *v133;
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self->_isOpen)
  {
    brc_bread_crumbs();
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS openWithError:pushWorkloop:].cold.5();

  }
  memset(v123, 0, sizeof(v123));
  __brc_create_section(1, (uint64_t)"-[BRCAccountSessionFPFS openWithError:pushWorkloop:]", 1045, v123);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v127 = (const char *)v123[0];
    v128 = 2112;
    v129 = self;
    v130 = 2112;
    v131 = v7;
    _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ - Opening session%@", buf, 0x20u);
  }

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = v15;

  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = v21;

  -[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:](self, "_createAccountSupportPathIfNeeded:protectParent:", self->_sessionDirPath, 1);
  -[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:](self, "_createAccountSupportPathIfNeeded:protectParent:", self->_cacheDirPath, 1);
  if (self->_cloudDocsFD == -1)
  {
    -[NSString stringByDeletingLastPathComponent](self->_sessionDirPath, "stringByDeletingLastPathComponent");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = open((const char *)objc_msgSend(v23, "fileSystemRepresentation"), 33028);
    self->_cloudDocsFD = v24;
    if (v24 < 0)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to open file at path '%@' %{errno}d"), v23, *__error());
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
      {
        brc_append_system_info_to_message();
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSessionFPFS openWithError:pushWorkloop:].cold.1(v109, (uint64_t)v107, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v110 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSessionFPFS openWithError:pushWorkloop:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 1070, v110);
    }
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS openWithError:pushWorkloop:].cold.4((uint64_t)v23);

    if (flock(self->_cloudDocsFD, 2) < 0)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to lock file at path '%@' %{errno}d"), v23, *__error());
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_FAULT))
      {
        brc_append_system_info_to_message();
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSessionFPFS openWithError:pushWorkloop:].cold.1(v113, (uint64_t)v111, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v114 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCAccountSessionFPFS openWithError:pushWorkloop:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 1074, v114);
    }

  }
  -[NSURL path](self->_dbURL, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:](self, "_createAccountSupportPathIfNeeded:protectParent:", v27, 0);

  -[BRCAccountSessionFPFS _prepareGroupContainerLocations](self, "_prepareGroupContainerLocations");
  v28 = self->_dbURL;
  dispatch_get_global_queue(0, 0);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke;
  block[3] = &unk_24FE3FA18;
  v31 = v28;
  v122 = v31;
  dispatch_async(v29, block);

  -[BRCAccountSessionFPFS _setupSharedPackageExtensionsPlist](self, "_setupSharedPackageExtensionsPlist");
  -[BRCAccountSessionFPFS _setupThrottles](self, "_setupThrottles");
  v32 = objc_alloc_init(BRCVolume);
  volume = self->_volume;
  self->_volume = v32;

  objc_msgSend(MEMORY[0x24BE175E0], "clearAccountDescriptorCache");
  v120 = 0;
  v119 = 0;
  v34 = -[BRCAccountSessionFPFS _addOrImportDomainIfNeededWithError:domainAdded:domainImported:](self, "_addOrImportDomainIfNeededWithError:domainAdded:domainImported:", &v119, (char *)&v120 + 1, &v120);
  v35 = v119;
  v36 = v35;
  if (!v34)
  {
    if ((objc_msgSend(v35, "br_isCloudDocsErrorCode:", 85) & 1) != 0
      || (objc_msgSend(v36, "br_isCloudDocsErrorCode:", 92) & 1) != 0
      || (objc_msgSend(v36, "br_isCloudDocsErrorCode:", 99) & 1) != 0
      || (objc_msgSend(v36, "br_isCloudDocsErrorCode:", 116) & 1) != 0
      || objc_msgSend(v36, "br_isCloudDocsErrorCode:", 121))
    {
      v94 = v36;
      if (v94)
      {
        brc_bread_crumbs();
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, (os_log_type_t)0x90u))
        {
          v98 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v127 = "-[BRCAccountSessionFPFS openWithError:pushWorkloop:]";
          v128 = 2080;
          if (!a3)
            v98 = "(ignored by caller)";
          v129 = (BRCAccountSessionFPFS *)v98;
          v130 = 2112;
          v131 = v94;
          v132 = 2112;
          v133 = v95;
          _os_log_error_impl(&dword_230455000, v96, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a3)
        *a3 = objc_retainAutorelease(v94);
    }
    else
    {
      v99 = (void *)MEMORY[0x24BDD1540];
      v124 = *MEMORY[0x24BDD1398];
      v125 = v36;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x24BE17300], 81, v100, CFSTR("Can't create FPFS domain"));
      v94 = (id)objc_claimAutoreleasedReturnValue();

      if (v94)
      {
        brc_bread_crumbs();
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v102 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, (os_log_type_t)0x90u))
        {
          v103 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v127 = "-[BRCAccountSessionFPFS openWithError:pushWorkloop:]";
          v128 = 2080;
          if (!a3)
            v103 = "(ignored by caller)";
          v129 = (BRCAccountSessionFPFS *)v103;
          v130 = 2112;
          v131 = v94;
          v132 = 2112;
          v133 = v101;
          _os_log_error_impl(&dword_230455000, v102, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a3)
        *a3 = objc_retainAutorelease(v94);
    }

    goto LABEL_32;
  }
  if (!-[BRCVolume setupWithError:](self->_volume, "setupWithError:", a3)
    || (-[BRCAccountSessionFPFS _refreshRootsCache](self, "_refreshRootsCache"),
        v37 = -[BRCStageRegistry initWithAccountSession:]([BRCStageRegistry alloc], "initWithAccountSession:", self), stageRegistry = self->_stageRegistry, self->_stageRegistry = v37, stageRegistry, -[BRCStageRegistry open](self->_stageRegistry, "open"), buf[0] = 0, !-[BRCAccountSessionFPFS openDBForNewDomain:deviceIDChanged:withError:](self, "openDBForNewDomain:deviceIDChanged:withError:", (HIBYTE(v120) | v120) != 0, buf, a3)))
  {
LABEL_32:
    v85 = 0;
    goto LABEL_33;
  }
  -[BRCAccountSessionFPFS _markDBOpened](self, "_markDBOpened");
  if (buf[0])
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "shouldPurgeUploadsOnDeviceIDChange");

    if (v40)
      -[BRCStageRegistry purgeAllUploads](self->_stageRegistry, "purgeAllUploads");
  }
  v41 = -[BRCFairScheduler initWithWorkloop:name:]([BRCFairScheduler alloc], "initWithWorkloop:name:", self->_clientTruthWorkloop, CFSTR("client-db"));
  fairClientDBScheduler = self->_fairClientDBScheduler;
  self->_fairClientDBScheduler = v41;

  v43 = -[BRCDeadlineScheduler initWithName:fairScheduler:]([BRCDeadlineScheduler alloc], "initWithName:fairScheduler:", CFSTR("com.apple.bird.main-scheduler"), self->_fairClientDBScheduler);
  defaultScheduler = self->_defaultScheduler;
  self->_defaultScheduler = v43;

  v45 = -[BRCContainerScheduler initWithAccountSession:pushWorkloop:]([BRCContainerScheduler alloc], "initWithAccountSession:pushWorkloop:", self, v6);
  containerScheduler = self->_containerScheduler;
  self->_containerScheduler = v45;

  v47 = -[BRCApplyScheduler initWithAccountSession:]([BRCApplyScheduler alloc], "initWithAccountSession:", self);
  applyScheduler = self->_applyScheduler;
  self->_applyScheduler = v47;

  v49 = -[BRCFSImporter initWithAccountSession:]([BRCFSImporter alloc], "initWithAccountSession:", self);
  fsImporter = self->_fsImporter;
  self->_fsImporter = v49;

  v51 = -[BRCFSUploader initWithAccountSession:]([BRCFSUploader alloc], "initWithAccountSession:", self);
  fsUploader = self->_fsUploader;
  self->_fsUploader = v51;

  v53 = -[BRCFSDownloader initWithAccountSession:]([BRCFSDownloader alloc], "initWithAccountSession:", self);
  fsDownloader = self->_fsDownloader;
  self->_fsDownloader = v53;

  v55 = -[BRCSyncUpScheduler initWithAccountSession:]([BRCSyncUpScheduler alloc], "initWithAccountSession:", self);
  syncUpScheduler = self->_syncUpScheduler;
  self->_syncUpScheduler = v55;

  v57 = -[BRCNotificationManager initWithAccountSession:]([BRCNotificationManager alloc], "initWithAccountSession:", self);
  notificationManager = self->_notificationManager;
  self->_notificationManager = v57;

  v59 = -[BRCSyncContextProvider initWithAccountSession:]([BRCSyncContextProvider alloc], "initWithAccountSession:", self);
  syncContextProvider = self->_syncContextProvider;
  self->_syncContextProvider = v59;

  v61 = -[BRCNamedThrottleManager initWithDB:]([BRCNamedThrottleManager alloc], "initWithDB:", self->_clientDB);
  namedThrottleManager = self->_namedThrottleManager;
  self->_namedThrottleManager = v61;

  v63 = -[BRCTapToRadarManager initWithNamedThrottleManager:]([BRCTapToRadarManager alloc], "initWithNamedThrottleManager:", self->_namedThrottleManager);
  tapToRadarManager = self->_tapToRadarManager;
  self->_tapToRadarManager = v63;

  v65 = -[BRCDownloadTrackers initWithSession:]([BRCDownloadTrackers alloc], "initWithSession:", self);
  downloadTrackers = self->_downloadTrackers;
  self->_downloadTrackers = v65;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bird.reset", v67);

  resetQueue = self->_resetQueue;
  self->_resetQueue = v68;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v70 = objc_claimAutoreleasedReturnValue();
  v71 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bird.db.fixup", v70);

  dbFixupQueue = self->_dbFixupQueue;
  self->_dbFixupQueue = v71;

  dispatch_suspend((dispatch_object_t)self->_resetQueue);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v70) = objc_msgSend(v73, "spotlightIndexingEnabled");

  if ((_DWORD)v70)
  {
    v74 = -[BRCRecentsEnumerator initWithAccountSession:]([BRCRecentsEnumerator alloc], "initWithAccountSession:", self);
    recentsEnumerator = self->_recentsEnumerator;
    self->_recentsEnumerator = v74;

  }
  v76 = objc_alloc_init(BRCUserNotification);
  userNotification = self->_userNotification;
  self->_userNotification = v76;

  -[BRCAccountSessionFPFS _loadClientZonesFromDisk](self, "_loadClientZonesFromDisk");
  objc_msgSend(MEMORY[0x24BE17640], "cloudDocsMangledID");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[BRCAccountSessionFPFS getOrCreateAppLibraryAndPrivateZonesIfNecessary:](self, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v78);

  v80 = -[BRCDiskSpaceReclaimer initWithAccountSession:]([BRCDiskSpaceReclaimer alloc], "initWithAccountSession:", self);
  diskReclaimer = self->_diskReclaimer;
  self->_diskReclaimer = v80;

  -[BRCContainerScheduler setup](self->_containerScheduler, "setup");
  objc_msgSend(MEMORY[0x24BE17640], "cloudDocsMangledID");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS getOrCreateAppLibraryAndPrivateZonesIfNecessary:](self, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "defaultClientZone");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = v84 != 0;
  if (v84)
  {
    objc_msgSend(v84, "defaultAppLibrary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v86)
    {
      brc_bread_crumbs();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS openWithError:pushWorkloop:].cold.3();

    }
    v87 = -[BRCGlobalProgress initWithSession:]([BRCGlobalProgress alloc], "initWithSession:", self);
    globalProgress = self->_globalProgress;
    self->_globalProgress = v87;

    v89 = -[BRCServerChangesApplier initWithAccountSession:]([BRCServerChangesApplier alloc], "initWithAccountSession:", self);
    serverChangesApplier = self->_serverChangesApplier;
    self->_serverChangesApplier = v89;

    v91 = -[BRCAnalyticsReporter initWithSession:]([BRCAnalyticsReporter alloc], "initWithSession:", self);
    analyticsReporter = self->_analyticsReporter;
    self->_analyticsReporter = v91;

    -[BRCAccountSessionFPFS _submitDBCorruptionTelemetryEventIfNeeded](self, "_submitDBCorruptionTelemetryEventIfNeeded");
    -[BRCAccountSessionFPFS _submitSessionOpenFailedTelemetryEventIfNeeded](self, "_submitSessionOpenFailedTelemetryEventIfNeeded");
    v118[0] = v30;
    v118[1] = 3221225472;
    v118[2] = __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke_133;
    v118[3] = &unk_24FE47418;
    v118[4] = self;
    -[BRCAccountSessionFPFS fetchUserRecordIDWithCompletionHandler:](self, "fetchUserRecordIDWithCompletionHandler:", v118);
    clientTruthWorkloop = self->_clientTruthWorkloop;
    v116[0] = v30;
    v116[1] = 3221225472;
    v116[2] = __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke_2;
    v116[3] = &unk_24FE41910;
    v117 = v120;
    v116[4] = self;
    dispatch_async(clientTruthWorkloop, v116);
    +[BRCSQLBackedSet clearTempDatabases](BRCSQLBackedSet, "clearTempDatabases");
    self->_isOpen = 1;

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 4);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_33:
  __brc_leave_section(v123);

  return v85;
}

void __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2348B9F14]();
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS openWithError:pushWorkloop:]_block_invoke", 1100, v14);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v16 = v14[0];
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx including %@ in backup%@", buf, 0x20u);
  }

  v5 = *(void **)(a1 + 32);
  v6 = *MEMORY[0x24BDBCC68];
  v13 = 0;
  v7 = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C0], v6, &v13);
  v8 = v13;
  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = (uint64_t)v12;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] Unable to include '%@' from backups: %@%@", buf, 0x20u);

    }
  }
  __brc_leave_section(v14);

  objc_autoreleasePoolPop(v2);
}

uint64_t __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "enablePushNotifications");
}

uint64_t __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "_sendFPFSImportStartTelemetryEvent");
  else
    return objc_msgSend(v2, "triggerFPFSImportFinishedTelemetryEventIfNeeded");
}

- (void)_markDBOpened
{
  self->_isDBOpened = 1;
}

- (void)_pcsChainAllItemsWithActivity:(id)a3
{
  id v4;
  NSObject *clientTruthWorkloop;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke;
  v7[3] = &unk_24FE3FA40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientTruthWorkloop, v7);

}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_2();

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_136;
  v7[3] = &unk_24FE47468;
  v4 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v10 = &v11;
  objc_msgSend(v8, "enumerateAppLibraries:", v7);
  if (!*((_BYTE *)v12 + 24) && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_1();

  }
  _Block_object_dispose(&v11, 8);
}

BOOL __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_136(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  _BOOL8 v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BRCPCSChainingOperation *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  BRCPCSChainingOperation *v24;
  NSObject *v25;
  _QWORD *v26;
  NSObject *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  dispatch_block_t v31;
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  BRCPCSChainingOperation *v39;
  id location;
  _QWORD v41[6];

  v3 = a2;
  objc_msgSend(v3, "containerMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDocumentScopePublic") & 1) == 0)
  {

LABEL_11:
    v12 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v3, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSyncBlocked");

  if ((v6 & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v3, "mangledID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "aggressivelyPCSChainWithSession:", *(_QWORD *)(a1 + 32));

  if (!v9)
    goto LABEL_11;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_136_cold_1();

    }
    v12 = 0;
  }
  else
  {
    objc_msgSend(v3, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_137;
    v41[3] = &unk_24FE40010;
    v41[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "documentsFolderItemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultClientZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dbRowID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v14, "fetchObject:sql:", v41, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND zone_rowid = %@ AND item_filename != '.Trash' AND pcs_state NOT IN (2, 3) LIMIT 1"), v16, v18);

    v12 = v19 == 0;
    if (v19)
    {
      v20 = -[BRCPCSChainingOperation initWithRootItem:appLibrary:sessionContext:syncUpCallback:]([BRCPCSChainingOperation alloc], "initWithRootItem:appLibrary:sessionContext:syncUpCallback:", v19, v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608));
      objc_msgSend(MEMORY[0x24BDB9190], "br_aggressiveChaining");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation setGroup:](v20, "setGroup:", v21);

      -[BRCPCSChainingOperation setQualityOfService:](v20, "setQualityOfService:", 9);
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "serialQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v22);

      dispatch_source_set_timer(v23, 0, 0x2540BE400uLL, 0xB2D05E00uLL);
      v37[0] = v15;
      v37[1] = 3221225472;
      v37[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2;
      v37[3] = &unk_24FE3FA40;
      v38 = *(id *)(a1 + 40);
      v24 = v20;
      v39 = v24;
      v25 = v23;
      v26 = v37;
      v27 = v25;
      v28 = v26;
      v29 = v28;
      v30 = v28;
      if (*MEMORY[0x24BE17840])
      {
        ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v31 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v30);
      dispatch_source_set_event_handler(v27, v31);

      dispatch_resume(v27);
      v33[0] = v15;
      v33[1] = 3221225472;
      v33[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_143;
      v33[3] = &unk_24FE47440;
      v32 = v27;
      v34 = v32;
      objc_copyWeak(&v36, &location);
      v35 = *(id *)(a1 + 40);
      -[BRCPCSChainingOperation setPcsChainCompletionBlock:](v24, "setPcsChainCompletionBlock:", v33);
      -[_BRCOperation schedule](v24, "schedule");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);

    }
  }
LABEL_12:

  return v12;
}

id __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_137(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newServerItemFromPQLResultSet:error:", a2, a3);
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "cancel");
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      brc_bread_crumbs();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, (os_log_type_t)0x90u))
        __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2_cold_1();

    }
  }
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_143(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject **WeakRetained;
  NSObject **v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v7 = a3;
  v8 = a5;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v10 = WeakRetained;
  if (v8 || !WeakRetained)
  {
    if ((objc_msgSend(v8, "brc_isCloudKitCancellationError") & 1) == 0
      && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_143_cold_1();

    }
  }
  else
  {
    if (v7)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_144;
      v17[3] = &unk_24FE408B8;
      v17[4] = WeakRetained;
      v18 = *(id *)(a1 + 40);
      objc_msgSend(v7, "addPreFlushDirectoryListCompletionBlock:", v17);
      objc_msgSend(v7, "beginObservingChangesWithDelegate:", 0);
      v11 = v18;
    }
    else
    {
      v14 = WeakRetained[6];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_3;
      v15[3] = &unk_24FE3FA40;
      v15[4] = WeakRetained;
      v16 = *(id *)(a1 + 40);
      dispatch_async(v14, v15);
      v11 = v16;
    }

  }
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_144(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 48);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2_145;
  v4[3] = &unk_24FE3FA40;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2_145(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pcsChainAllItemsWithActivity:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pcsChainAllItemsWithActivity:", *(_QWORD *)(a1 + 40));
}

- (id)_getPartiallySaltedItemWithAppLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  objc_msgSend(v4, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  if (objc_msgSend(v4, "saltingState") != 2)
    goto LABEL_4;
  objc_msgSend(v4, "rootItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemByItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_4:
    objc_msgSend(v5, "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "fetch:", CFSTR("SELECT item_id FROM server_items WHERE salting_state = 2 AND item_type IN (0, 9, 10) AND zone_rowid = %@ LIMIT 1"), v10);

    if (objc_msgSend(v11, "next")
      && (objc_msgSend(v11, "objectOfClass:atIndex:", objc_opt_class(), 0),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      objc_msgSend(v5, "itemByItemID:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "asDirectory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)_saltPartiallySaltedItemsWithActivity:(id)a3
{
  id v4;
  NSObject *clientTruthWorkloop;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke;
  v7[3] = &unk_24FE3FA40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientTruthWorkloop, v7);

}

void __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_cold_2();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_152;
  v9[3] = &unk_24FE474B8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v4, "enumerateAppLibraries:", v9);
  if (!*((_BYTE *)v14 + 24) && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_1();

  }
  _Block_object_dispose(&v13, 8);
}

BOOL __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_152(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _BOOL8 v10;
  void *v12;
  BRCSaltingBatchOperation *v13;
  id v14;
  BRCSaltingBatchOperation *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v3 = a2;
  objc_msgSend(v3, "defaultClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSyncBlocked") & 1) != 0)
    goto LABEL_12;
  objc_msgSend(v3, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "finishSaltingPartiallySaltedDirectories")
    || (objc_msgSend(v4, "enhancedDrivePrivacyEnabled") & 1) == 0)
  {

    goto LABEL_12;
  }
  v7 = objc_msgSend(v4, "isBusy");

  if ((v7 & 1) != 0)
  {
LABEL_12:
    v10 = 1;
    goto LABEL_13;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_152_cold_1();

    }
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_getPartiallySaltedItemWithAppLibrary:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, *(id *)(a1 + 40));
    v10 = v12 == 0;
    if (v12)
    {
      v13 = [BRCSaltingBatchOperation alloc];
      v14 = objc_loadWeakRetained(&location);
      v15 = -[BRCSaltingBatchOperation initWithParentItem:sessionContext:](v13, "initWithParentItem:sessionContext:", v12, v14);

      objc_msgSend(MEMORY[0x24BDB9190], "br_partialSaltingCompletion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation setGroup:](v15, "setGroup:", v16);

      -[_BRCOperation setNonDiscretionary:](v15, "setNonDiscretionary:", 1);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_154;
      v18[3] = &unk_24FE47490;
      objc_copyWeak(&v22, &location);
      v19 = v12;
      v17 = v4;
      v20 = v17;
      v21 = *(id *)(a1 + 32);
      -[BRCSaltingBatchOperation setMetadataCompletionBlock:](v15, "setMetadataCompletionBlock:", v18);
      objc_msgSend(v17, "addOutOfBandOperation:", v15);
      -[_BRCOperation schedule](v15, "schedule");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

      objc_destroyWeak(&v22);
    }
    objc_destroyWeak(&location);

  }
LABEL_13:

  return v10;
}

void __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_154(id *a1, int a2, int a3, void *a4)
{
  id v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "analyticsReporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugItemIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "mangledID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1[5], "enhancedDrivePrivacyEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aggregateReportForAppTelemetryIdentifier:itemID:zoneMangledID:enhancedDrivePrivacyEnabled:error:", 42, v12, v13, v14, v7);

    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = a1[4];
      *(_DWORD *)buf = 138413314;
      v25 = v18;
      v26 = 1024;
      v27 = a2;
      v28 = 1024;
      v29 = a3;
      v30 = 2112;
      v31 = v7;
      v32 = 2112;
      v33 = v15;
      _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished metadata salting a batch for item %@ when completed: %d validation: %d error: %@%@", buf, 0x2Cu);
    }

    if (!v7
      || (objc_msgSend(v7, "brc_isSaltingError") & 1) != 0
      || (a3 & 1) != 0
      || objc_msgSend(v7, "brc_isCloudKitCancellationError"))
    {
      v17 = v9[6];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_156;
      v19[3] = &unk_24FE3FAD8;
      v20 = v7;
      v21 = a1[5];
      v22 = v9;
      v23 = a1[6];
      dispatch_async(v17, v19);

    }
  }

}

uint64_t __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_156(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitCancellationError") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "scheduleSyncDown");
  return objc_msgSend(*(id *)(a1 + 48), "_saltPartiallySaltedItemsWithActivity:", *(_QWORD *)(a1 + 56));
}

- (unsigned)_recoverAndReportBoosting
{
  BRCAccountSessionFPFS *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__BRCAccountSessionFPFS__recoverAndReportBoosting__block_invoke;
  v5[3] = &unk_24FE474E0;
  v5[4] = &v6;
  -[BRCAccountSessionFPFS enumerateAppLibraries:](self, "enumerateAppLibraries:", v5);
  v3 = +[AppTelemetryTimeSeriesEvent newSyncBoostingProblemCountWithProblemCount:](AppTelemetryTimeSeriesEvent, "newSyncBoostingProblemCountWithProblemCount:", *((unsigned int *)v7 + 6));
  -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](v2->_analyticsReporter, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v3);
  LODWORD(v2) = *((_DWORD *)v7 + 6);

  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __50__BRCAccountSessionFPFS__recoverAndReportBoosting__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "integrityCheckBoosting") & 1) == 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (unsigned)_recoverAndReportBrokenShareOptions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id v16;
  BRCAccountSessionFPFS *v18;
  void *v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = -[BRCPQLConnection fetch:](self->_clientDB, "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci LEFT JOIN server_items AS si ON ci.item_id = si.item_id AND ci.zone_rowid = si.zone_rowid WHERE ci.zone_rowid != ci.item_parent_zone_rowid AND (ci.item_sharing_options & 4) = 0 AND (si.item_id IS NULL OR item_id_is_root(si.item_parent_id))"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__BRCAccountSessionFPFS__recoverAndReportBrokenShareOptions__block_invoke;
  v20[3] = &unk_24FE40010;
  v18 = self;
  v19 = v3;
  v20[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v10, "clientZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isSharedZone");

        if (v13)
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v10;
            v27 = 2112;
            v28 = v14;
            _os_log_impl(&dword_230455000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is missing a shareID%@", buf, 0x16u);
          }

          objc_msgSend(v10, "setSharingOptions:", objc_msgSend(v10, "sharingOptions") | 4);
          objc_msgSend(v10, "markForceNeedsSyncUp");
          objc_msgSend(v10, "saveToDB");
          v7 = (v7 + 1);
        }
        objc_autoreleasePoolPop(v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v16 = +[AppTelemetryTimeSeriesEvent newCorruptSharingOptionsProblemWithProblemCount:](AppTelemetryTimeSeriesEvent, "newCorruptSharingOptionsProblemWithProblemCount:", v7);
  -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](v18->_analyticsReporter, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v16);

  return v7;
}

id __60__BRCAccountSessionFPFS__recoverAndReportBrokenShareOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (unsigned)_reportBasehashSalting
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BRCPQLConnection *clientDB;
  void *v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  uint8_t buf[4];
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = -[BRCPQLConnection fetch:](self->_clientDB, "fetch:", CFSTR("SELECT COUNT(*), child.item_id, child.zone_rowid FROM server_items AS child INNER JOIN server_items AS parent ON child.item_parent_id = parent.item_id AND child.zone_rowid = parent.zone_rowid WHERE IFNULL(child.basehash_salt_validation_key, 0) != IFNULL(validation_key(parent.child_basehash_salt), 0) AND LENGTH(child.item_filename) > 0 AND child.item_type != 3 AND (parent.salting_state = 3 OR child.basehash_salt_validation_key IS NOT NULL)"));
  if ((objc_msgSend(v3, "next") & 1) == 0)
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS _reportBasehashSalting].cold.2();

  }
  v4 = objc_msgSend(v3, "intAtIndex:", 0);
  if (v4)
  {
    objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberAtIndex:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS serverZoneByRowID:](self, "serverZoneByRowID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mangledID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "debugItemIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v42 = v4;
      v43 = 2112;
      v44 = v10;
      v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Found %d items with basehash salting issues example itemID %@%@", buf, 0x1Cu);

    }
  }
  else
  {
    v37 = 0;
    v5 = 0;
  }
  v11 = MEMORY[0x24BDAC760];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke;
  v40[3] = &unk_24FE3FEF0;
  v40[4] = self;
  v12 = MEMORY[0x2348BA0DC](v40);
  v39[0] = v11;
  v39[1] = 3221225472;
  v39[2] = __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke_164;
  v39[3] = &unk_24FE3FEF0;
  v39[4] = self;
  v13 = (void *)MEMORY[0x2348BA0DC](v39);
  clientDB = self->_clientDB;
  v38 = (void *)v12;
  v15 = (void *)MEMORY[0x2348BA0DC](v12);
  v16 = (void *)MEMORY[0x2348BA0DC](v13);
  v17 = -[BRCPQLConnection fetch:](clientDB, "fetch:", CFSTR("SELECT COUNT(*), item_id, zone_rowid FROM server_items AS child WHERE item_id_is_app_library_root(child.item_parent_id) AND IFNULL(child.basehash_salt_validation_key, 0) != IFNULL(call_block(%p, child.item_parent_id), 0) AND LENGTH(child.item_filename) > 0 AND child.item_type != 3 AND (call_block(%p, child.item_parent_id) = 3 OR child.basehash_salt_validation_key IS NOT NULL)"), v15, v16);

  if ((objc_msgSend(v17, "next") & 1) == 0)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS _reportBasehashSalting].cold.2();

  }
  v18 = objc_msgSend(v17, "intAtIndex:", 0);
  v19 = (v18 + v4);
  if (v18)
  {
    v20 = v18;
    objc_msgSend(v17, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "numberAtIndex:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS serverZoneByRowID:](self, "serverZoneByRowID:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mangledID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v21, "debugItemIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      v42 = v20;
      v43 = 2112;
      v44 = v27;
      v45 = 2112;
      v46 = v24;
      v47 = 2112;
      v48 = v25;
      _os_log_impl(&dword_230455000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Found %d items parented to root with basehash salting issues example itemID %@ zone %@%@", buf, 0x26u);

    }
  }
  else
  {
    v24 = v37;
    v21 = v5;
  }
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS _reportBasehashSalting].cold.1((uint64_t)v28, v19, v29);

  objc_msgSend(v21, "itemIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = +[AppTelemetryTimeSeriesEvent newBasehashSaltingProblemCountWithProblemCount:mangledID:itemIDString:](AppTelemetryTimeSeriesEvent, "newBasehashSaltingProblemCountWithProblemCount:mangledID:itemIDString:", v19, v24, v30);

  -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](self->_analyticsReporter, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v31);
  return v19;
}

void __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;

  v6 = +[BRCItemID newFromSqliteValue:](BRCItemID, "newFromSqliteValue:", *a4);
  if ((objc_msgSend(v6, "isNonDesktopRoot") & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke_cold_1();

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "appLibraryRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLibraryByRowID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childBasehashSalt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "brc_truncatedSHA256");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  sqlite3_result_blob(a2, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

void __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke_164(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;

  v6 = +[BRCItemID newFromSqliteValue:](BRCItemID, "newFromSqliteValue:", *a4);
  if ((objc_msgSend(v6, "isNonDesktopRoot") & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke_cold_1();

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "appLibraryRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLibraryByRowID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "saltingState");

  sqlite3_result_int(a2, v10);
}

- (unsigned)_recoverAndReportDanglingLostZombieDirectories
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = -[BRCPQLConnection fetch:](self->_clientDB, "fetch:", CFSTR("SELECT ci1.rowid, ci1.zone_rowid, ci1.item_id, ci1.item_creator_id, ci1.item_sharing_options, ci1.item_side_car_ckinfo, ci1.item_parent_zone_rowid, ci1.item_localsyncupstate, ci1.item_local_diffs, ci1.item_notifs_rank, ci1.app_library_rowid, ci1.item_min_supported_os_rowid, ci1.item_user_visible, ci1.item_stat_ckinfo, ci1.item_state, ci1.item_type, ci1.item_mode, ci1.item_birthtime, ci1.item_lastusedtime, ci1.item_favoriterank,ci1.item_parent_id, ci1.item_filename, ci1.item_hidden_ext, ci1.item_finder_tags, ci1.item_xattr_signature, ci1.item_trash_put_back_path, ci1.item_trash_put_back_parent_id, ci1.item_alias_target, ci1.item_creator, ci1.item_processing_stamp, ci1.item_bouncedname, ci1.item_scope, ci1.item_local_change_count, ci1.item_old_version_identifier, ci1.fp_creation_item_identifier, ci1.version_name, ci1.version_ckinfo, ci1.version_mtime, ci1.version_size, ci1.version_thumb_size, ci1.version_thumb_signature, ci1.version_content_signature, ci1.version_xattr_signature, ci1.version_edited_since_shared, ci1.version_device, ci1.version_conflict_loser_etags, ci1.version_quarantine_info, ci1.version_uploaded_assets, ci1.version_upload_error, ci1.version_old_zone_item_id, ci1.version_old_zone_rowid, ci1.version_local_change_count, ci1.version_old_version_identifier, ci1.item_live_conflict_loser_etags, ci1.item_file_id, ci1.item_generation FROM client_items AS ci1                             LEFT JOIN client_items AS ci2                             ON ci2.version_old_zone_item_id = ci1.item_id AND ci2.version_old_zone_rowid = ci1.zone_rowid                             WHERE ci2.version_old_zone_rowid IS NULL                               AND ci2.version_old_zone_item_id IS NULL                               AND ci1.item_state = -3                               AND ci1.item_type IN (0, 9, 10)"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __71__BRCAccountSessionFPFS__recoverAndReportDanglingLostZombieDirectories__block_invoke;
  v19[3] = &unk_24FE40010;
  v19[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v6 = v5;
    LODWORD(v7) = 0;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2348B9F14]();
        if ((objc_msgSend(v10, "isDirectory") & 1) == 0)
        {
          v18 = v3;
          brc_bread_crumbs();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v13;
            _os_log_fault_impl(&dword_230455000, v14, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: zombieItem.isDirectory%@", buf, 0xCu);
          }

          v3 = v18;
        }
        objc_msgSend(v10, "markRemovedFromFilesystemRecursively:", 1);
        objc_msgSend(v10, "markForceNeedsSyncUp");
        objc_msgSend(v10, "markForceNotify");
        objc_msgSend(v10, "asDirectory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "forceSignalPropagationToChildren");

        objc_msgSend(v10, "saveToDB");
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v6 != v9);
      v7 = (v7 + v6);
      v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      v6 = v15;
    }
    while (v15);

    if ((_DWORD)v7)
    {
      v16 = +[AppTelemetryTimeSeriesEvent newDanglingZombieProblemCountWithProblemCount:](AppTelemetryTimeSeriesEvent, "newDanglingZombieProblemCountWithProblemCount:", v7);
      -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](self->_analyticsReporter, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v16);

    }
  }
  else
  {

    LODWORD(v7) = 0;
  }

  return v7;
}

id __71__BRCAccountSessionFPFS__recoverAndReportDanglingLostZombieDirectories__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (void)recoverAndReportContentPolicyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *clientTruthWorkloop;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  BRCAccountSessionFPFS *v18;
  _QWORD v19[5];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[3];
  int v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v5 = dispatch_group_create();
  -[BRCAccountSessionFPFS hasOptimizeStorageEnabled](self, "hasOptimizeStorageEnabled");
  dispatch_group_enter(v5);
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC82E8], "br_fpItemIDFromItemIdentifier:", *MEMORY[0x24BDC8228]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke;
  v19[3] = &unk_24FE47528;
  v19[4] = self;
  v21 = v22;
  v9 = v5;
  v20 = v9;
  objc_msgSend(v6, "fetchItemForItemID:completionHandler:", v7, v19);

  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_175;
  v16[3] = &unk_24FE3FE18;
  v10 = v9;
  v17 = v10;
  v18 = self;
  -[BRCAccountSessionFPFS enumerateAppLibraries:](self, "enumerateAppLibraries:", v16);
  clientTruthWorkloop = self->_clientTruthWorkloop;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_178;
  block[3] = &unk_24FE47578;
  v14 = v4;
  v15 = v22;
  v12 = v4;
  dispatch_group_notify(v10, clientTruthWorkloop, block);

  _Block_object_dispose(v22, 8);
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(a2, "contentPolicy");
  +[BRCQueryItemUtil sharedQueryItemUtil](BRCQueryItemUtil, "sharedQueryItemUtil");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentPolicyForRootContainerWithSessionContext:", *(_QWORD *)(a1 + 32));

  if (v5 != v3)
  {
    +[BRCImportUtil forceIngestionForItemID:completionHandler:](BRCImportUtil, "forceIngestionForItemID:completionHandler:", *MEMORY[0x24BDC8228], &__block_literal_global_173);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2_cold_1((uint64_t)v2);

}

uint64_t __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  if ((objc_msgSend(v3, "isCloudDocsAppLibrary") & 1) != 0)
    objc_msgSend(v3, "rootFileObjectID");
  else
    objc_msgSend(v3, "documentsFolderFileObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDC82E8];
  objc_msgSend(v4, "asString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_fpItemIDFromItemIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2_176;
  v14[3] = &unk_24FE47550;
  v10 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v15 = v3;
  v16 = v9;
  v17 = v4;
  v18 = v10;
  v11 = v4;
  v12 = v3;
  objc_msgSend(v5, "fetchItemForItemID:completionHandler:", v8, v14);

  return 1;
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2_176(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = objc_msgSend(a2, "contentPolicy");
  v4 = objc_msgSend(*(id *)(a1 + 32), "isCloudDocsAppLibrary");
  +[BRCQueryItemUtil sharedQueryItemUtil](BRCQueryItemUtil, "sharedQueryItemUtil");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v4)
    +[BRCQueryItemInfo queryItemInfoForAppLibrary:](BRCQueryItemInfo, "queryItemInfoForAppLibrary:", v6);
  else
    +[BRCQueryItemInfo queryItemInfoForDocumentsFolderWithAppLibrary:](BRCQueryItemInfo, "queryItemInfoForDocumentsFolderWithAppLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "contentPolicyForItemInfo:sessionContext:", v7, *(_QWORD *)(a1 + 40));

  if (v8 != v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "asString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_3;
    v10[3] = &unk_24FE3F6A0;
    v11 = *(id *)(a1 + 48);
    +[BRCImportUtil forceIngestionForItemID:completionHandler:](BRCImportUtil, "forceIngestionForItemID:completionHandler:", v9, v10);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "asString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Done Force Ingestion %@ container to update the contentPolicy - %@%@", (uint8_t *)&v7, 0x20u);

  }
}

uint64_t __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_178(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)_recoverAndReportStateIntegrityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  BRCPQLConnection *clientDB;
  uint64_t v10;
  id v11;
  NSObject *clientTruthWorkloop;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  BRCAccountSessionFPFS *v22;
  _QWORD *v23;
  _QWORD v24[4];

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS _recoverAndReportStateIntegrityWithCompletion:].cold.1();

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v7 = dispatch_group_create();
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  clientDB = self->_clientDB;
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke;
  v20[3] = &unk_24FE475A0;
  v11 = v8;
  v22 = self;
  v23 = v24;
  v21 = v11;
  -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 8, v20);
  if (objc_msgSend(v11, "integrityCheckContentPolicy"))
  {
    dispatch_group_enter(v7);
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke_2;
    v17[3] = &unk_24FE475C8;
    v17[4] = self;
    v19 = v24;
    v18 = v7;
    -[BRCAccountSessionFPFS recoverAndReportContentPolicyWithCompletion:](self, "recoverAndReportContentPolicyWithCompletion:", v17);

  }
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke_3;
  v14[3] = &unk_24FE47578;
  v15 = v4;
  v16 = v24;
  v13 = v4;
  dispatch_group_notify(v7, clientTruthWorkloop, v14);

  _Block_object_dispose(v24, 8);
}

uint64_t __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckMissingShareOptions"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "_recoverAndReportBrokenShareOptions");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckApplyJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckSyncUpJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 608), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckDownloadJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 600), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckUploadJobs"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 592), "recoverAndReportMissingJobs");
  if (objc_msgSend(*(id *)(a1 + 32), "integrityCheckBoosting"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "_recoverAndReportBoosting");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckBasehashSalting"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "_reportBasehashSalting");
  if (objc_msgSend(*(id *)(a1 + 32), "dbIntegrityCheckLostZombieDirectories"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "_recoverAndReportDanglingLostZombieDirectories");
  return 1;
}

void __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke_2(uint64_t a1, unsigned int a2)
{
  id v4;

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a2;
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)_cleanupOldCiconiaLocations
{
  id v3;
  BRCFileUnlinker *fileUnlinker;
  void *v5;
  id v6;

  if (self->_isDataSeparated)
  {
    objc_msgSend(MEMORY[0x24BE17610], "cloudDocsAppSupportURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("ciconia"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (!access((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0))
    {
      fileUnlinker = self->_fileUnlinker;
      objc_msgSend(v3, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](fileUnlinker, "renameAndUnlinkInBackgroundItemAtPath:", v5);

    }
  }
}

- (id)_prepareXPCActivityIdentifierWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDataSeparatedPersona");

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[BRCAccountSessionFPFS volume](self, "volume");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%d"), v4, objc_msgSend(v9, "deviceID"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (void)_registerBackgroundXPCActivities
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  id v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location[2];

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  -[BRCAccountSessionFPFS _prepareXPCActivityIdentifierWithName:](self, "_prepareXPCActivityIdentifierWithName:", CFSTR("com.apple.bird.aggressive-pcs-chain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "aggressivelyPCSChainWithSession:", self);
  v6 = objc_retainAutorelease(v4);
  v7 = v6;
  if (v5)
  {
    v8 = (const char *)objc_msgSend(v6, "UTF8String");
    objc_msgSend(v3, "aggressivePCSChainActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke;
    v37[3] = &unk_24FE40900;
    objc_copyWeak(&v38, location);
    v10 = v9;
    v11 = v37;
    v12 = v11;
    if (*MEMORY[0x24BE17830])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17830])(v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    xpc_activity_unregister(v8);
    xpc_activity_register(v8, v10, v12);

    objc_destroyWeak(&v38);
  }
  else
  {
    v14 = (const char *)objc_msgSend(v6, "UTF8String");
    v15 = (id)*MEMORY[0x24BDAC5A0];
    if (*MEMORY[0x24BE17830])
    {
      ((void (*)(void *))*MEMORY[0x24BE17830])(&__block_literal_global_806);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = &__block_literal_global_806;
    }
    xpc_activity_unregister(v14);
    xpc_activity_register(v14, v15, v16);

  }
  -[BRCAccountSessionFPFS _prepareXPCActivityIdentifierWithName:](self, "_prepareXPCActivityIdentifierWithName:", CFSTR("com.apple.bird.db-integrity-check"));
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (const char *)objc_msgSend(v17, "UTF8String");
  objc_msgSend(v3, "dbIntegrityCheckXPCActivity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_195;
  v35[3] = &unk_24FE40900;
  objc_copyWeak(&v36, location);
  v20 = v19;
  v21 = v35;
  v22 = v21;
  if (*MEMORY[0x24BE17830])
  {
    ((void (*)(_QWORD *))*MEMORY[0x24BE17830])(v21);
    v23 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v23;
  }
  xpc_activity_unregister(v18);
  xpc_activity_register(v18, v20, v22);

  -[BRCAccountSessionFPFS _prepareXPCActivityIdentifierWithName:](self, "_prepareXPCActivityIdentifierWithName:", CFSTR("com.apple.bird.finish-salting-partially-salted-directories"));
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = (const char *)objc_msgSend(v24, "UTF8String");
  objc_msgSend(v3, "finishSaltingPartiallySaltedDirectoriesActivity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_201;
  v32[3] = &unk_24FE47678;
  v27 = v3;
  v33 = v27;
  objc_copyWeak(&v34, location);
  v28 = v26;
  v29 = v32;
  v30 = v29;
  if (*MEMORY[0x24BE17830])
  {
    ((void (*)(_QWORD *))*MEMORY[0x24BE17830])(v29);
    v31 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v31;
  }
  xpc_activity_unregister(v25);
  xpc_activity_register(v25, v28, v30);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(location);
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id *WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3))
        goto LABEL_23;
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v5;
        _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }

    }
    if (xpc_activity_get_state(v3) == 2)
    {
      if (!xpc_activity_set_state(v3, 4))
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
          __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_cold_4();

      }
      +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[13], "acAccountID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "personaIdentifierForACAccountID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "isEqualToString:", CFSTR("__defaultPersonaID__")))
        v12 = 0;
      else
        v12 = v11;
      v13 = v12;
      v14 = v11;
      if (!v13)
      {
        if (_block_invoke___personaOnceToken_3 != -1)
          dispatch_once(&_block_invoke___personaOnceToken_3, &__block_literal_global_190_0);
        v14 = (id)_block_invoke___personalPersona_3;
      }
      objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentPersona");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0;
      objc_msgSend(v16, "userPersonaUniqueString");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17 == v14 || (objc_msgSend(v17, "isEqualToString:", v14) & 1) != 0)
      {
        v19 = 0;
      }
      else
      {
        if (voucher_process_can_use_arbitrary_personas())
        {
          v29 = 0;
          v20 = (void *)objc_msgSend(v16, "copyCurrentPersonaContextWithError:", &v29);
          v21 = v29;
          v22 = v30;
          v30 = v20;

          if (v21)
          {
            brc_bread_crumbs();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
              -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v21);

          }
          objc_msgSend(v16, "generateAndRestorePersonaContextWithPersonaUniqueString:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
            goto LABEL_22;
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v32 = v11;
            v33 = 2112;
            v34 = v19;
            v35 = 2112;
            v36 = v25;
            _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
          }
        }
        else
        {
          if (v13 || (objc_msgSend(v16, "isDataSeparatedPersona") & 1) != 0)
          {
            brc_bread_crumbs();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[_BRCOperation completedWithResult:error:].cold.2();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[_BRCOperation completedWithResult:error:].cold.3();
          v19 = 0;
        }

      }
LABEL_22:
      objc_msgSend(WeakRetained, "_pcsChainAllItemsWithActivity:", v3);

      _BRRestorePersona();
    }
  }
LABEL_23:

}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_189()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke___personalPersona_3;
  _block_invoke___personalPersona_3 = v0;

}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_195(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  NSObject *v4;
  xpc_activity_t activity;
  _QWORD block[5];
  _xpc_activity_s *v7;

  activity = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && xpc_activity_get_state(activity) == 2)
  {
    v4 = WeakRetained[6];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_2;
    block[3] = &unk_24FE3FA40;
    block[4] = WeakRetained;
    v7 = activity;
    dispatch_async_and_wait(v4, block);

  }
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "acAccountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifierForACAccountID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;
  v7 = v4;
  if (!v6)
  {
    if (_block_invoke_2___personaOnceToken_0 != -1)
      dispatch_once(&_block_invoke_2___personaOnceToken_0, &__block_literal_global_196);
    v7 = (id)_block_invoke_2___personalPersona_0;
  }
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  objc_msgSend(v9, "userPersonaUniqueString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v7 || (objc_msgSend(v10, "isEqualToString:", v7) & 1) != 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v27 = 0;
    v16 = (void *)objc_msgSend(v9, "copyCurrentPersonaContextWithError:", &v27);
    v17 = v27;
    v18 = v28;
    v28 = v16;

    if (v17)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v17);

    }
    objc_msgSend(v9, "generateAndRestorePersonaContextWithPersonaUniqueString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v30 = v4;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v21;
        _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_32:

    }
  }
  else
  {
    if (!v6 && (objc_msgSend(v9, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v12 = 0;
      goto LABEL_32;
    }
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 4))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v13;
      _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't continue activity%@", buf, 0xCu);
    }

  }
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_197;
  v25[3] = &unk_24FE47630;
  v15 = *(void **)(a1 + 32);
  v26 = *(id *)(a1 + 40);
  objc_msgSend(v15, "_recoverAndReportStateIntegrityWithCompletion:", v25);

  _BRRestorePersona();
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_3()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_2___personalPersona_0;
  _block_invoke_2___personalPersona_0 = v0;

}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_197(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    brc_bread_crumbs();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_230455000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't finish activity%@", (uint8_t *)&v3, 0xCu);
    }

  }
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_201(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id *WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "finishSaltingPartiallySaltedDirectories"))
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      if (xpc_activity_should_defer(v3))
      {
        if (xpc_activity_set_state(v3, 3))
          goto LABEL_24;
        brc_bread_crumbs();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v5;
          _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
        }

      }
      if (xpc_activity_get_state(v3) == 2)
      {
        if (!xpc_activity_set_state(v3, 4))
        {
          brc_bread_crumbs();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
            __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_201_cold_4();

        }
        +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained[13], "acAccountID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personaIdentifierForACAccountID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isEqualToString:", CFSTR("__defaultPersonaID__")))
          v12 = 0;
        else
          v12 = v11;
        v13 = v12;
        v14 = v11;
        if (!v13)
        {
          if (_block_invoke_3___personaOnceToken_0 != -1)
            dispatch_once(&_block_invoke_3___personaOnceToken_0, &__block_literal_global_203);
          v14 = (id)_block_invoke_3___personalPersona_0;
        }
        objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentPersona");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0;
        objc_msgSend(v16, "userPersonaUniqueString");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 == v14 || (objc_msgSend(v17, "isEqualToString:", v14) & 1) != 0)
        {
          v19 = 0;
        }
        else
        {
          if (voucher_process_can_use_arbitrary_personas())
          {
            v29 = 0;
            v20 = (void *)objc_msgSend(v16, "copyCurrentPersonaContextWithError:", &v29);
            v21 = v29;
            v22 = v30;
            v30 = v20;

            if (v21)
            {
              brc_bread_crumbs();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
                -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v21);

            }
            objc_msgSend(v16, "generateAndRestorePersonaContextWithPersonaUniqueString:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              goto LABEL_23;
            brc_bread_crumbs();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              v32 = v11;
              v33 = 2112;
              v34 = v19;
              v35 = 2112;
              v36 = v25;
              _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
            }
          }
          else
          {
            if (v13 || (objc_msgSend(v16, "isDataSeparatedPersona") & 1) != 0)
            {
              brc_bread_crumbs();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                -[_BRCOperation completedWithResult:error:].cold.2();

              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
            brc_bread_crumbs();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              -[_BRCOperation completedWithResult:error:].cold.3();
            v19 = 0;
          }

        }
LABEL_23:
        objc_msgSend(WeakRetained, "_saltPartiallySaltedItemsWithActivity:", v3);

        _BRRestorePersona();
      }
    }
LABEL_24:

  }
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_202()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_3___personalPersona_0;
  _block_invoke_3___personalPersona_0 = v0;

}

- (void)_fixupItemsAtStartup
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx fixing up items%@");
  OUTLINED_FUNCTION_0();
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasNeverSyncedDown");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "changeState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "clientRequestID");

    v9 = objc_msgSend(v4, "currentRequestID");
    if (v8 >= v9)
    {
      v10 = v9;
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "mangledID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138413058;
        v18 = v16;
        v19 = 2048;
        v20 = v8;
        v21 = 2048;
        v22 = v10;
        v23 = 2112;
        v24 = v11;
        _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Will acknowledge the last sync down again for %@ (server:%lld, client:%lld)%@", (uint8_t *)&v17, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    }
  }
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v4, "mangledID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v13, "mangledIDIsPendingMigration:", v14);

  if ((_DWORD)v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

  return 1;
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_206(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2;
        v12[3] = &unk_24FE40140;
        v12[4] = v10;
        objc_msgSend(v3, "performWithFlags:action:", 8, v12);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "nextRank");
  return 1;
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "allocateRanksWhenCaughtUp:", 1);
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        memset(v14, 0, sizeof(v14));
        __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _fixupItemsAtStartup]_block_invoke_3", 1996, v14);
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v20 = v14[0];
          v21 = 2112;
          v22 = v7;
          v23 = 2112;
          v24 = v8;
          _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Acknowledge the last sync down again for %@%@", buf, 0x20u);
        }

        v10 = *(void **)(*(_QWORD *)(a1 + 40) + 576);
        objc_msgSend(v7, "changeState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didSyncDownZone:requestID:upToRank:caughtUpWithServer:", v7, objc_msgSend(v11, "clientRequestID"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0);

        __brc_leave_section(v14);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v4);
  }

  return 1;
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_207(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "state") & 2) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

void __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_209(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _fixupItemsAtStartup]_block_invoke_2", 2021, v22);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_209_cold_1();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "scheduleSyncDown");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v8 = *(void **)(a1 + 40);
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_210;
  v17[3] = &unk_24FE476F0;
  v10 = *(_QWORD *)(a1 + 56);
  v17[4] = v8;
  v17[5] = v10;
  objc_msgSend(v8, "enumerateServerZones:", v17);
  v11 = *(void **)(a1 + 48);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_211;
  v14[3] = &unk_24FE47718;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 40);
  v15 = v12;
  v16 = v13;
  objc_msgSend(v12, "groupInBatch:", v14);

  __brc_leave_section(v22);
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_210(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "rescheduleSuspendedJobsMatching:inState:", v3, 16);
  if (objc_msgSend(v3, "hasFetchedRecentsAndFavorites"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "rescheduleJobsPendingRecentsAndFavoritesFetchInZone:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "rescheduleJobsPendingRecentsAndFavoritesFetchInZone:", v3);
  }
  if (objc_msgSend(v3, "isSharedZone"))
  {
    objc_msgSend(v3, "clientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asSharedClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllShareAcceptationSidefaults");

  }
  return 1;
}

void __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_211(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v46 = a2;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_localsyncupstate = 7"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v4 = MEMORY[0x24BDAC760];
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_3_214;
  v58[3] = &unk_24FE40010;
  v47 = a1;
  v58[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjects:", v58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v60 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v10, "asDocument");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reIngestFromFileProvider");

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v47 + 40) + 160), "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci WHERE ci.item_localsyncupstate = 4 AND item_min_supported_os_rowid IS NULL AND NOT EXISTS (SELECT 1 FROM client_sync_up AS su WHERE su.throttle_id = ci.rowid AND su.throttle_state != 0)"));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v53[0] = v4;
  v53[1] = 3221225472;
  v53[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_4;
  v53[3] = &unk_24FE40010;
  v53[4] = *(_QWORD *)(v47 + 40);
  v44 = v13;
  objc_msgSend(v13, "enumerateObjects:", v53);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x2348B9F14]();
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v65 = v20;
          v66 = 2112;
          v67 = v22;
          _os_log_fault_impl(&dword_230455000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ is missing a sync up throttle%@", buf, 0x16u);
        }

        objc_msgSend(v20, "clientZone");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dbRowID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "markLatestSyncRequestFailedInZone:", v25);

        if (objc_msgSend(v20, "isSharedToMeChildItem"))
        {
          objc_msgSend(v20, "markLatestSyncRequestFailedInZone:", &unk_24FEB3608);
          objc_msgSend(*(id *)(*(_QWORD *)(v47 + 40) + 568), "scheduleSyncUpForSideCar");
          v17 = 1;
        }
        if (objc_msgSend(v20, "isSharedToMeTopLevelItem"))
        {
          objc_msgSend(v20, "parentClientZone");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dbRowID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "markLatestSyncRequestFailedInZone:", v27);

        }
        objc_msgSend(v20, "saveToDB");
        objc_autoreleasePoolPop(v21);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  v28 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v47 + 40) + 160), "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci LEFT JOIN client_sync_up AS su ON su.throttle_id = ci.rowid AND su.zone_rowid = ci.zone_rowid LEFT JOIN client_uploads AS cu ON cu.throttle_id = ci.rowid AND cu.zone_rowid = ci.zone_rowid WHERE ci.item_localsyncupstate = 3 AND ci.item_type IN (1, 6) AND (IFNULL(cu.throttle_state, 0) = 0 OR (cu.throttle_state = 31 AND IFNULL(su.throttle_state, 0) = 0))"));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_220;
  v48[3] = &unk_24FE40010;
  v48[4] = *(_QWORD *)(v47 + 40);
  v45 = v28;
  objc_msgSend(v28, "enumerateObjects:", v48);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
        v35 = (void *)MEMORY[0x2348B9F14]();
        brc_bread_crumbs();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v65 = v34;
          v66 = 2112;
          v67 = v36;
          _os_log_fault_impl(&dword_230455000, v37, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has a corrupt upload throttle%@", buf, 0x16u);
        }

        objc_msgSend(v34, "asDocument");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "markNeedsReading");

        objc_msgSend(v34, "saveToDB");
        objc_autoreleasePoolPop(v35);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    }
    while (v31);
  }

  if ((v17 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v47 + 40) + 568), "sideCarSyncPersistedState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "needsSync");

    if ((v40 & 1) == 0)
    {
      v41 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v47 + 40) + 160), "numberWithSQL:", CFSTR("SELECT throttle_id FROM client_sync_up WHERE zone_rowid = %@ AND throttle_state != 0"), &unk_24FEB3608);
      if (objc_msgSend(v41, "BOOLValue"))
      {
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_211_cold_1((uint64_t)v41);

        objc_msgSend(*(id *)(*(_QWORD *)(v47 + 40) + 568), "scheduleSyncUpForSideCar");
      }

    }
  }

}

id __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_3_214(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

id __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

id __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_220(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (void)resumeIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: qos_class_self() == QOS_CLASS_UTILITY%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

uint64_t __42__BRCAccountSessionFPFS_resumeIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "maxNotifRankWasFlushed");
}

- (void)waitForUploadsToCompleteInSyncBubbleWithReply:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  BRCUploadAllFilesTrackerOperation *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInSyncBubble");

  if ((v6 & 1) != 0)
  {
    -[BRCAccountSessionFPFS appLibraries](self, "appLibraries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BRCUploadAllFilesTrackerOperation initWithSession:appLibraries:]([BRCUploadAllFilesTrackerOperation alloc], "initWithSession:appLibraries:", self, v7);
    -[_BRCFrameworkOperation setIgnoreMissingRemoteClientProxy:](v8, "setIgnoreMissingRemoteClientProxy:", 1);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__BRCAccountSessionFPFS_waitForUploadsToCompleteInSyncBubbleWithReply___block_invoke;
    v10[3] = &unk_24FE439F0;
    v11 = v4;
    -[_BRCOperation setFinishBlock:](v8, "setFinishBlock:", v10);
    -[BRCAccountSessionFPFS addMiscOperation:](self, "addMiscOperation:", v8);
    -[_BRCOperation schedule](v8, "schedule");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE17300], 122, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v9);

  }
}

uint64_t __71__BRCAccountSessionFPFS_waitForUploadsToCompleteInSyncBubbleWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidateAccountStatus
{
  BRCAccountSessionFPFS *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_accountIsReady = 0;
  objc_sync_exit(obj);

}

- (BRCAccountWaitOperation)accountWaitOperation
{
  BRCAccountSessionFPFS *v2;
  BRCAccountWaitOperation *v3;
  BRCAccountWaitOperation *accountWaitOperation;
  void *v5;
  void *v6;
  void *v7;
  BRCAccountWaitOperation *v8;
  BRCAccountWaitOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_accountIsReady)
  {
    v3 = 0;
  }
  else
  {
    accountWaitOperation = v2->_accountWaitOperation;
    if (!accountWaitOperation)
    {
      -[BRCAccountSessionFPFS syncContextProvider](v2, "syncContextProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultSyncContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ckContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[BRCAccountWaitOperation initWithCKContainer:]([BRCAccountWaitOperation alloc], "initWithCKContainer:", v7);
      v9 = v2->_accountWaitOperation;
      v2->_accountWaitOperation = v8;

      objc_initWeak(&location, v2);
      -[BRCAccountSessionFPFS syncClientZoneErrorThrottle](v2, "syncClientZoneErrorThrottle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BRCOperation setOperationFailureThrottle:](v2->_accountWaitOperation, "setOperationFailureThrottle:", v10);

      -[_BRCOperation operationFailureThrottle](v2->_accountWaitOperation, "operationFailureThrottle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[BRCAccountSessionFPFS accountWaitOperation].cold.1();

      }
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __45__BRCAccountSessionFPFS_accountWaitOperation__block_invoke;
      v20 = &unk_24FE450A8;
      objc_copyWeak(&v21, &location);
      -[_BRCOperation setFinishBlock:](v2->_accountWaitOperation, "setFinishBlock:", &v17);
      objc_msgSend(v7, "privateCloudDatabase", v17, v18, v19, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "operationQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addOperation:", v2->_accountWaitOperation);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      accountWaitOperation = v2->_accountWaitOperation;
    }
    v3 = accountWaitOperation;
  }
  objc_sync_exit(v2);

  return v3;
}

void __45__BRCAccountSessionFPFS_accountWaitOperation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = WeakRetained;
    objc_sync_enter(v2);
    *((_BYTE *)v2 + 488) = 1;
    v3 = (void *)*((_QWORD *)v2 + 62);
    *((_QWORD *)v2 + 62) = 0;

    objc_sync_exit(v2);
    WeakRetained = v4;
  }

}

- (id)fetchAccountWaitOperationWithAccountReady:(BOOL *)a3
{
  BRCAccountSessionFPFS *v4;
  BRCAccountWaitOperation *v5;

  v4 = self;
  objc_sync_enter(v4);
  if (a3)
    *a3 = v4->_accountIsReady;
  if (v4->_accountIsReady)
    v5 = 0;
  else
    v5 = v4->_accountWaitOperation;
  objc_sync_exit(v4);

  return v5;
}

- (void)captureSessionOpenFailedInfoWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "br_accountSessionOpenErrorInfoPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CFSTR("Error");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAccountSessionOpenFailed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)

  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (!v7)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_fault_impl(&dword_230455000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Failed to encode session open failed info %@: %@%@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v4, v7, 0);

  if (v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v13;
      _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully created %@ - with data - %@%@", buf, 0x20u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS captureSessionOpenFailedInfoWithError:].cold.1((uint64_t)v4);
  }

}

- (void)captureDBCorruptionInfoWithDescription:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "br_isCloudDocsErrorCode:", 99) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "br_corruptedDBInfoPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = CFSTR("Description");
    v25[1] = CFSTR("Error");
    v26[0] = v5;
    v8 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorCorruptedDB");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)

    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    if (!v10)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v20 = v9;
        v21 = 2112;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        _os_log_fault_impl(&dword_230455000, v13, OS_LOG_TYPE_FAULT, "[CRIT] Failed to encode corruption info %@: %@%@", buf, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "createFileAtPath:contents:attributes:", v7, v10, 0);

    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v20 = v7;
        v21 = 2112;
        v22 = v9;
        v23 = 2112;
        v24 = v16;
        _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully created %@ - with data - %@%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSessionFPFS captureSessionOpenFailedInfoWithError:].cold.1((uint64_t)v7);
    }

  }
}

- (void)close
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx cancelling _defaultScheduler...%@");
  OUTLINED_FUNCTION_0();
}

uint64_t __30__BRCAccountSessionFPFS_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

uint64_t __30__BRCAccountSessionFPFS_close__block_invoke_234(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPostFlushHook:", 0);
  return 1;
}

- (void)closeAndResetLocalStateWithDescription:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRCPQLConnection *clientDB;
  BRCAccountHandler *v11;
  void *v12;
  NSObject *v13;
  NSObject *resetQueue;
  OS_dispatch_queue *v15;
  BRCAccountHandler *accountHandler;
  uint64_t v17[3];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  BRCAccountSessionFPFS *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCAccountSessionFPFS closeAndResetLocalStateWithDescription:error:]", 2647, v17);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v19 = v17[0];
    v20 = 2112;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ - Resetting local state%@", buf, 0x20u);
  }

  clientDB = self->_clientDB;
  v11 = self->_accountHandler;
  if (!self->_resumed)
  {
    resetQueue = self->_resetQueue;
    if (resetQueue)
    {
      dispatch_resume(resetQueue);
      v15 = self->_resetQueue;
    }
    else
    {
      v15 = 0;
    }
    self->_resetQueue = 0;

    if (!clientDB)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (clientDB)
  {
LABEL_12:
    -[BRCAccountSessionFPFS close](self, "close");
    goto LABEL_13;
  }
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[BRCAccountSessionFPFS closeAndResetLocalStateWithDescription:error:].cold.1();

LABEL_13:
  -[BRCAccountSessionFPFS stopDBWatcher](self, "stopDBWatcher");
  -[BRCAccountSessionFPFS captureDBCorruptionInfoWithDescription:error:](self, "captureDBCorruptionInfoWithDescription:error:", v6, v7);
  BRCRecursiveRemove(self->_cacheDirPath);
  BRCRecursiveRemoveBelow(self->_sessionDirPath);
  if (!clientDB)
    -[BRCAccountSessionFPFS close](self, "close");
  self->_isCancelled = 0;
  accountHandler = self->_accountHandler;
  self->_accountHandler = v11;

  __brc_leave_section(v17);
}

- (void)_validatePersona
{
  void *v3;
  NSString *personaIdentifier;
  void *v5;
  NSObject *v6;
  const char *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_currentPersonaID");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  personaIdentifier = self->_personaIdentifier;
  if (personaIdentifier && !-[NSString isEqualToString:](personaIdentifier, "isEqualToString:", v8))
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not removing account data on an account with the wrong persona %@ expecting %@"), v8, self->_personaIdentifier);
    objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CKRecordID(BRCItemAdditions) brc_itemIDWithSession:].cold.1();

    brc_append_system_info_to_message();
    v7 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCAccountSessionFPFS _validatePersona]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 2684, v7);
  }

}

- (BOOL)_recursivelyPrepareFolderForLogOutAtURL:(id)a3 pruneEmptyFolders:(BOOL)a4 pruneEmptyTopLevelFolder:(BOOL)a5 maxDepth:(unint64_t)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  BRCFileUnlinker *fileUnlinker;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  NSObject *v38;
  BRCFileUnlinker *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  NSObject *v44;
  void *v45;
  int v46;
  id v47;
  int v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  const char *v61;
  int v62;
  id v63;
  BOOL v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  BRCFileUnlinker *v76;
  void *v77;
  void *v79;
  _BOOL4 v80;
  NSObject *v81;
  void *v82;
  unint64_t v83;
  uint64_t v84;
  void *v85;
  int v86;
  BRCFileUnlinker *v87;
  unsigned int v88;
  BRCAccountSessionFPFS *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BOOL4 v93;
  uint64_t v94;
  uint64_t v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  void *v112;
  _BYTE v113[128];
  _QWORD v114[6];

  v7 = a5;
  v93 = a4;
  v114[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = v9;
  if (a6)
  {
    if (v9)
    {
      v80 = v7;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v11 = objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "maxRelativePathDepth");

      v14 = *MEMORY[0x24BDBCC98];
      v84 = *MEMORY[0x24BDBCC60];
      v114[0] = *MEMORY[0x24BDBCC60];
      v114[1] = v14;
      v94 = v14;
      v15 = *MEMORY[0x24BDBCCA0];
      v92 = *MEMORY[0x24BDBCC80];
      v114[2] = *MEMORY[0x24BDBCC80];
      v114[3] = v15;
      v95 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v11;
      v82 = v10;
      -[NSObject enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, v16, 1, &__block_literal_global_240_0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v18, "uploadMaxFileSize");
      v79 = v18;
      v90 = objc_msgSend(v18, "uploadMaxPkgFileSize");
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      obj = v17;
      v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
      if (v99)
      {
        v88 = 2 * v13;
        v83 = a6 - 1;
        v97 = 0;
        v98 = *(_QWORD *)v106;
        v89 = self;
        while (1)
        {
          for (i = 0; i != v99; ++i)
          {
            if (*(_QWORD *)v106 != v98)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
            v100 = MEMORY[0x2348B9F14]();
            +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "excludedFilenamesWorthPreserving");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "excludedExtensionsWorthPreserving");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            brc_bread_crumbs();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v110 = v20;
              v111 = 2112;
              v112 = v25;
              _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerate URL [%@]%@", buf, 0x16u);
            }

            if (objc_msgSend(v20, "br_isExternalDocumentReference"))
            {
              brc_bread_crumbs();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v20, "path");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v110 = v67;
                v111 = 2112;
                v112 = v27;
                _os_log_debug_impl(&dword_230455000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] unlinking br security bookmark %@%@", buf, 0x16u);

              }
              fileUnlinker = self->_fileUnlinker;
              objc_msgSend(v20, "path");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](fileUnlinker, "renameAndUnlinkInBackgroundItemAtPath:", v30);

              v31 = 0;
              v32 = 0;
              v33 = 0;
              v34 = 0;
              goto LABEL_55;
            }
            v104 = 0;
            v35 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v104, v95, 0);
            v36 = v104;
            v34 = v36;
            if (v35 && objc_msgSend(v36, "BOOLValue"))
            {
              brc_bread_crumbs();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v20, "path");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v110 = v74;
                v111 = 2112;
                v112 = v37;
                _os_log_debug_impl(&dword_230455000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] unlinking symlink %@%@", buf, 0x16u);

              }
              v39 = self->_fileUnlinker;
              objc_msgSend(v20, "path");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](v39, "renameAndUnlinkInBackgroundItemAtPath:", v40);

              v31 = 0;
              v32 = 0;
              v33 = 0;
              goto LABEL_55;
            }
            objc_msgSend(v20, "path");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "br_isExcludedButPreservedAtLogOutWithFilenames:extensions:", v22, v24);

            if (v42)
            {
              brc_bread_crumbs();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v20, "path");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v110 = v73;
                v111 = 2112;
                v112 = v43;
                _os_log_debug_impl(&dword_230455000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] keeping preserved item %@%@", buf, 0x16u);

              }
              v31 = 0;
              v32 = 0;
              goto LABEL_23;
            }
            v103 = 0;
            v46 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v103, v94, 0);
            v47 = v103;
            v31 = v47;
            if (v46 && (objc_msgSend(v47, "BOOLValue") & 1) != 0)
            {
              v32 = 0;
            }
            else
            {
              v102 = 0;
              v48 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v102, v92, 0);
              v49 = v102;
              v32 = v49;
              if (!v48 || !objc_msgSend(v49, "BOOLValue"))
                goto LABEL_35;
            }
            objc_msgSend(v20, "path");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v32, "BOOLValue");
            if (objc_msgSend(v32, "BOOLValue"))
              v52 = v90;
            else
              v52 = v91;
            v53 = objc_msgSend(v50, "br_isDocumentTooLargeForUpload:maxUploadDocumentSize:", v51, v52);

            if (v53)
            {
              brc_bread_crumbs();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v20, "path");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v110 = v54;
                v111 = 2112;
                v112 = v43;
                _os_log_debug_impl(&dword_230455000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] keeping item too large to upload %@%@", buf, 0x16u);

              }
LABEL_23:
              v45 = (void *)v100;

              v33 = 0;
LABEL_58:
              ++v97;
              goto LABEL_59;
            }
LABEL_35:
            if ((objc_msgSend(v31, "BOOLValue") & 1) != 0 || (objc_msgSend(v32, "BOOLValue") & 1) != 0)
            {
              v33 = 0;
LABEL_38:
              if (v93)
              {
                objc_msgSend(v20, "path");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v55, "br_isExcludedWithMaximumDepth:", v88);

                if (v56)
                {
                  brc_bread_crumbs();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v58 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v20, "path");
                    v85 = v57;
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v110 = v59;
                    v111 = 2112;
                    v112 = v85;
                    v60 = v58;
                    v61 = "[DEBUG] unlinking excluded item %@%@";
                    goto LABEL_53;
                  }
                  goto LABEL_54;
                }
                objc_msgSend(v20, "lastPathComponent");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "isEqualToString:", CFSTR(".localized"));

                if (v66)
                {
                  brc_bread_crumbs();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v58 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v20, "path");
                    v85 = v57;
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v110 = v59;
                    v111 = 2112;
                    v112 = v85;
                    v60 = v58;
                    v61 = "[DEBUG] unlinking .localized file %@%@";
                    goto LABEL_53;
                  }
                  goto LABEL_54;
                }
                objc_msgSend(v20, "lastPathComponent");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "br_pathExtension");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = objc_msgSend(v69, "isEqualToString:", CFSTR("app"));

                if (v86)
                {
                  objc_msgSend(v20, "path");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  BRCGetXattrValueForKeyOnPath(v70, CFSTR("com.apple.clouddocs.app-uploaded"));
                  v71 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v71)
                  {
                    brc_bread_crumbs();
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v58 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v20, "path");
                      v85 = v57;
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v110 = v59;
                      v111 = 2112;
                      v112 = v85;
                      v60 = v58;
                      v61 = "[DEBUG] unlinking uploaded .app file %@%@";
LABEL_53:
                      _os_log_debug_impl(&dword_230455000, v60, OS_LOG_TYPE_DEBUG, v61, buf, 0x16u);

                      v57 = v85;
                    }
LABEL_54:

                    v87 = v89->_fileUnlinker;
                    objc_msgSend(v20, "path");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](v87, "renameAndUnlinkInBackgroundItemAtPath:", v72);

                    self = v89;
LABEL_55:
                    v45 = (void *)v100;
                    goto LABEL_59;
                  }
                }
                self = v89;
              }
              v45 = (void *)v100;
              goto LABEL_58;
            }
            v101 = 0;
            v62 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v101, v84, 0);
            v63 = v101;
            v33 = v63;
            if (!v62 || (objc_msgSend(v63, "BOOLValue") & 1) == 0)
              goto LABEL_38;
            v64 = -[BRCAccountSessionFPFS _recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:](self, "_recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:", v20, v93, 0, v83);
            v45 = (void *)v100;
            if (!v64)
              goto LABEL_58;
LABEL_59:

            objc_autoreleasePoolPop(v45);
          }
          v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
          if (!v99)
            goto LABEL_66;
        }
      }
      v97 = 0;
LABEL_66:

      LOBYTE(a6) = v97 == 0;
      v10 = v82;
      if ((v93 || v80) && !v97)
      {
        v76 = self->_fileUnlinker;
        objc_msgSend(v82, "path");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAtPath:](v76, "renameAndUnlinkInBackgroundItemAtPath:", v77);

      }
      v75 = v81;
    }
    else
    {
      brc_bread_crumbs();
      obj = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS _recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:].cold.1();
      LOBYTE(a6) = 0;
    }

  }
  return a6;
}

uint64_t __117__BRCAccountSessionFPFS__recursivelyPrepareFolderForLogOutAtURL_pruneEmptyFolders_pruneEmptyTopLevelFolder_maxDepth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    v9 = 138412802;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_230455000, v7, (os_log_type_t)0x90u, "[ERROR] Unable to enumerate URL [%@] with Error [%@]%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (void)_unlinkContainersWithRootURL:(id)a3 containers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  if (!-[BRCAccountSessionFPFS isOpen](self, "isOpen"))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS _unlinkContainersWithRootURL:containers:].cold.2();

  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS _unlinkContainersWithRootURL:containers:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__BRCAccountSessionFPFS__unlinkContainersWithRootURL_containers___block_invoke;
  v14[3] = &unk_24FE40620;
  v15 = v10;
  v11 = v10;
  -[BRCAccountSessionFPFS enumerateAppLibraries:](self, "enumerateAppLibraries:", v14);
  -[BRCAccountSessionFPFS _unlinkContainersWithPristineContainerIDs:containersActualRoot:containers:](self, "_unlinkContainersWithPristineContainerIDs:containersActualRoot:containers:", v11, v7, v6);

}

uint64_t __65__BRCAccountSessionFPFS__unlinkContainersWithRootURL_containers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "containerMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInInitialState"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  return 1;
}

- (void)destroyLocalData
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  BRCFileUnlinker *v10;
  NSString *cacheDirPath;
  NSString *sessionDirPath;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16[3];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  BRCAccountSessionFPFS *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS destroyLocalData]", 2934, v16);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v18 = v16[0];
    v19 = 2112;
    v20 = self;
    v21 = 2112;
    v22 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx destroying local account data for %@%@", buf, 0x20u);
  }

  v5 = dispatch_group_create();
  dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INTERACTIVE, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("com.apple.bird.destroy-account-data", v7);

  v9 = (void *)os_transaction_create();
  -[BRCAccountSessionFPFS _validatePersona](self, "_validatePersona");
  v10 = self->_fileUnlinker;
  BRCRecursiveRemove(self->_cacheDirPath);
  cacheDirPath = self->_cacheDirPath;
  self->_cacheDirPath = 0;

  BRCRecursiveRemoveBelow(self->_sessionDirPath);
  sessionDirPath = self->_sessionDirPath;
  self->_sessionDirPath = 0;

  dispatch_group_async(v5, v8, &__block_literal_global_248);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_249;
  v14[3] = &unk_24FE3FA18;
  v15 = v9;
  v13 = v9;
  dispatch_group_notify(v5, v8, v14);

  __brc_leave_section(v16);
}

void __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke()
{
  void *v0;
  NSObject *v1;

  TCCAccessReset();
  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_cold_1();

}

void __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_249()
{
  void *v0;
  NSObject *v1;

  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_249_cold_1();

}

- (void)_loadClientZonesFromDisk
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx loading app libraries%@");
  OUTLINED_FUNCTION_0();
}

uint64_t __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v34 = a2;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3011, &v43);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_cold_2();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_privateServerZonesEnumerator:", v34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v8);
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v9;
          v49 = 2112;
          v50 = v10;
          _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded server zone: %@%@", buf, 0x16u);
        }

        objc_msgSend(v9, "setSession:", *(_QWORD *)(a1 + 32));
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v9, "mangledID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v13);

        v14 = *(void **)(a1 + 48);
        objc_msgSend(v9, "dbRowID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v15);

        v16 = *(void **)(a1 + 56);
        objc_msgSend(v9, "dbRowID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addZoneRowID:", v17);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v6);
  }

  __brc_leave_section(&v43);
  v43 = 0;
  v44 = 0;
  v45 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3022, &v43);
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_cold_1();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedServerZonesEnumerator:", v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v36;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v23);
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = v24;
          v49 = 2112;
          v50 = v25;
          _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded server zone: %@%@", buf, 0x16u);
        }

        objc_msgSend(v24, "setSession:", *(_QWORD *)(a1 + 32));
        v27 = *(void **)(a1 + 40);
        objc_msgSend(v24, "mangledID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, v28);

        v29 = *(void **)(a1 + 48);
        objc_msgSend(v24, "dbRowID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, v30);

        v31 = *(void **)(a1 + 56);
        objc_msgSend(v24, "dbRowID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addZoneRowID:", v32);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v21);
  }

  __brc_leave_section(&v43);
  return 1;
}

uint64_t __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_251(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  char v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  void *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t m;
  void *v97;
  void *v98;
  void *v99;
  _BYTE *v100;
  id v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *obj;
  uint64_t obja;
  uint64_t objb;
  id context;
  id contexta;
  id contextb;
  id contextc;
  _QWORD v115[5];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint8_t buf[24];
  void *v141;
  _BYTE v142[128];
  uint8_t v143[24];
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v102 = a2;
  memset(v143, 0, sizeof(v143));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3040, v143);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_251_cold_4();

  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_privateClientZonesEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v132, v142, 16);
  if (v6)
  {
    context = *(id *)v133;
    v105 = *MEMORY[0x24BE17300];
    obj = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(id *)v133 != context)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x2348B9F14]();
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v10;
          _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded client zone: %@%@", buf, 0x16u);
        }

        objc_msgSend(v8, "setSession:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v8, "setDelegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568));
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v8, "dbRowID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (objc_msgSend(v14, "isPrivateZone"))
          {
            objc_msgSend(v14, "zoneName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "zoneName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if ((v17 & 1) != 0)
            {
              objc_msgSend(v8, "associateWithServerZone:offline:", v14, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121));
              goto LABEL_20;
            }
          }
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v14;
            *(_WORD *)&buf[22] = 2112;
            v141 = v18;
            _os_log_fault_impl(&dword_230455000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: [client|server]zoneNames mismatch:  %@ does not match with %@%@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v105, 77, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "dbBecameCorruptedWithDescription:error:", CFSTR("Zone names mistmatch"), v20);

        }
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v21;
          _os_log_impl(&dword_230455000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring client zone because it's missing a server zone%@", buf, 0xCu);
        }

        v23 = *(void **)(a1 + 48);
        objc_msgSend(v8, "dbRowID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addZoneRowID:", v24);

        v14 = 0;
LABEL_20:

        objc_autoreleasePoolPop(v9);
      }
      v5 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v142, 16);
    }
    while (v6);
  }

  __brc_leave_section((uint64_t *)v143);
  memset(v143, 0, sizeof(v143));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3066, v143);
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_251_cold_3();

  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedClientZonesEnumerator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
  if (v28)
  {
    obja = *(_QWORD *)v129;
    v106 = *MEMORY[0x24BE17300];
    v103 = v27;
    do
    {
      v29 = 0;
      contexta = (id)v28;
      do
      {
        if (*(_QWORD *)v129 != obja)
          objc_enumerationMutation(v103);
        v30 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)v29);
        v31 = (void *)MEMORY[0x2348B9F14]();
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v32;
          _os_log_debug_impl(&dword_230455000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded shared client zone: %@%@", buf, 0x16u);
        }

        objc_msgSend(v30, "setSession:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v30, "setDelegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568));
        v34 = *(void **)(a1 + 40);
        objc_msgSend(v30, "dbRowID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          if (objc_msgSend(v36, "isSharedZone"))
          {
            objc_msgSend(v36, "zoneName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "zoneName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v37, "isEqual:", v38) & 1) != 0)
            {
              objc_msgSend(v36, "ownerName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "ownerName");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v39, "isEqual:", v40);

              if ((v41 & 1) != 0)
              {
                objc_msgSend(v30, "associateWithServerZone:offline:", v36, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121));
                goto LABEL_43;
              }
            }
            else
            {

            }
          }
          brc_bread_crumbs();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v36;
            *(_WORD *)&buf[22] = 2112;
            v141 = v42;
            _os_log_fault_impl(&dword_230455000, v43, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: [client|server]zoneName or ownerss mismatch:  %@ does not match with %@%@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v106, 78, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "dbBecameCorruptedWithDescription:error:", CFSTR("Zone names or owners mismatch"), v44);

        }
        brc_bread_crumbs();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v45;
          _os_log_impl(&dword_230455000, v46, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring shared client zone because it's missing a server zone%@", buf, 0xCu);
        }

        v47 = *(void **)(a1 + 48);
        objc_msgSend(v30, "dbRowID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addZoneRowID:", v48);

        v36 = 0;
LABEL_43:

        objc_autoreleasePoolPop(v31);
        v29 = (char *)v29 + 1;
      }
      while (contexta != v29);
      v27 = v103;
      v28 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
    }
    while (v28);
  }

  __brc_leave_section((uint64_t *)v143);
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3094, buf);
  brc_bread_crumbs();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS _loadClientZonesFromDisk].cold.1();

  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_appLibrariesEnumerator:", v102);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v125;
    contextb = v51;
    do
    {
      for (j = 0; j != v52; ++j)
      {
        if (*(_QWORD *)v125 != v53)
          objc_enumerationMutation(contextb);
        v55 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
        v56 = (void *)MEMORY[0x2348B9F14]();
        brc_bread_crumbs();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v143 = 138412546;
          *(_QWORD *)&v143[4] = v55;
          *(_WORD *)&v143[12] = 2112;
          *(_QWORD *)&v143[14] = v57;
          _os_log_debug_impl(&dword_230455000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded app library: %@%@", v143, 0x16u);
        }

        v59 = *(void **)(a1 + 40);
        objc_msgSend(v55, "zoneRowID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKeyedSubscript:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "clientZone");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "asPrivateClientZone");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          objc_msgSend(v55, "associateWithClientZone:offline:", v63, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 121));
          objc_msgSend(v55, "appLibraryID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v55, "wasMovedToCloudDocs"))
          {
            if ((objc_msgSend(v63, "isCloudDocsZone") & 1) != 0)
            {
LABEL_64:
              if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121)
                && objc_msgSend(v55, "containerMetadataNeedsSyncUp"))
              {
                objc_msgSend(v55, "scheduleContainerMetadataSyncUp");
              }
              v70 = *(void **)(a1 + 56);
              objc_msgSend(v55, "dbRowID");
              v65 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setObject:forKeyedSubscript:", v55, v65);
              goto LABEL_68;
            }
          }
          else
          {
            objc_msgSend(v63, "zoneName");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "isEqualToString:", v64);

            if ((v67 & 1) != 0)
              goto LABEL_64;
          }
          brc_bread_crumbs();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v143 = 138412290;
            *(_QWORD *)&v143[4] = v68;
            _os_log_fault_impl(&dword_230455000, v69, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: appLibrary.wasMovedToCloudDocs ? clientZone.isCloudDocsZone : [clientZone.zoneName isEqualToString:appLibraryID]%@", v143, 0xCu);
          }

          goto LABEL_64;
        }
        brc_bread_crumbs();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v143 = 138412290;
          *(_QWORD *)&v143[4] = v64;
          _os_log_debug_impl(&dword_230455000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring app library because it's missing a client zone%@", v143, 0xCu);
        }
LABEL_68:

        objc_autoreleasePoolPop(v56);
      }
      v51 = contextb;
      v52 = objc_msgSend(contextb, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
    }
    while (v52);
  }

  __brc_leave_section((uint64_t *)buf);
  brc_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 216));
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3128, buf);
  brc_bread_crumbs();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_251_cold_1();

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  objc_msgSend(*(id *)(a1 + 64), "allValues");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
  if (v74)
  {
    v107 = *(_QWORD *)v121;
    v104 = v73;
    do
    {
      objb = v74;
      for (k = 0; k != objb; ++k)
      {
        if (*(_QWORD *)v121 != v107)
          objc_enumerationMutation(v104);
        v76 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
        contextc = (id)MEMORY[0x2348B9F14]();
        objc_msgSend(v76, "clientZone");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v77)
        {
LABEL_80:
          brc_bread_crumbs();
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v143 = 138412546;
            *(_QWORD *)&v143[4] = v76;
            *(_WORD *)&v143[12] = 2112;
            *(_QWORD *)&v143[14] = v81;
            _os_log_impl(&dword_230455000, v82, OS_LOG_TYPE_DEFAULT, "[WARNING] dropping %@ because it's missing its client zone or app library%@", v143, 0x16u);
          }
          goto LABEL_96;
        }
        if (objc_msgSend(v76, "isPrivateZone"))
        {
          objc_msgSend(v76, "clientZone");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "asPrivateClientZone");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "hasDefaultAppLibrary");

          if ((v80 & 1) == 0)
            goto LABEL_80;
        }
        else
        {

        }
        objc_msgSend(v76, "clientZone");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
        {
          brc_bread_crumbs();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v143 = 138412546;
            *(_QWORD *)&v143[4] = v81;
            *(_WORD *)&v143[12] = 2112;
            *(_QWORD *)&v143[14] = v83;
            _os_log_debug_impl(&dword_230455000, v84, OS_LOG_TYPE_DEBUG, "[DEBUG] activating %@%@", v143, 0x16u);
          }

          objc_msgSend(v81, "resume");
        }
        v85 = *(void **)(a1 + 48);
        objc_msgSend(v76, "dbRowID");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "removeZoneRowID:", v86);

        v87 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
        objc_msgSend(v76, "dbRowID");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setObject:forKeyedSubscript:", v76, v88);

        if (objc_msgSend(v76, "isSharedZone"))
        {
          objc_msgSend(v76, "mangledID");
          v82 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "setObject:forKeyedSubscript:", v76, v82);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "setObject:forKeyedSubscript:", v81, v82);
        }
        else
        {
          v89 = *(void **)(*(_QWORD *)(a1 + 32) + 392);
          objc_msgSend(v76, "zoneName");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setObject:forKeyedSubscript:", v76, v90);

          v91 = *(void **)(*(_QWORD *)(a1 + 32) + 400);
          objc_msgSend(v81, "zoneName");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setObject:forKeyedSubscript:", v81, v92);

          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          objc_msgSend(v81, "asPrivateClientZone");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "appLibraries");
          v82 = objc_claimAutoreleasedReturnValue();

          v94 = -[NSObject countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
          if (v94)
          {
            v95 = *(_QWORD *)v117;
            do
            {
              for (m = 0; m != v94; ++m)
              {
                if (*(_QWORD *)v117 != v95)
                  objc_enumerationMutation(v82);
                v97 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * m);
                v98 = *(void **)(*(_QWORD *)(a1 + 32) + 360);
                objc_msgSend(v97, "dbRowID");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, v99);

              }
              v94 = -[NSObject countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
            }
            while (v94);
          }
        }
LABEL_96:

        objc_autoreleasePoolPop(contextc);
      }
      v73 = v104;
      v74 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
    }
    while (v74);
  }

  __brc_leave_section((uint64_t *)buf);
  v100 = *(_BYTE **)(a1 + 32);
  if (!v100[121])
  {
    objc_msgSend(v100, "enumerateAppLibraries:", &__block_literal_global_257);
    v100 = *(_BYTE **)(a1 + 32);
  }
  v115[0] = MEMORY[0x24BDAC760];
  v115[1] = 3221225472;
  v115[2] = __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_258;
  v115[3] = &unk_24FE477E8;
  v115[4] = v100;
  objc_msgSend(v100, "_enumerateAppLibraryRowIDs:usingBlock:", v102, v115);
  brc_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 216));

  return 1;
}

uint64_t __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_256(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_256_cold_1((uint64_t)v2);

  objc_msgSend(v2, "activate");
  return 1;
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_258(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BE17640];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithAppLibraryName:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setObject:forKeyedSubscript:", v6, v8);
}

- (void)_handleUnloadedZones:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *clientTruthWorkloop;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  BRCAccountSessionFPFS *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "handleUnloadedZones");

    if ((v6 & 1) != 0)
    {
      clientTruthWorkloop = self->_clientTruthWorkloop;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke;
      v10[3] = &unk_24FE3FA40;
      v11 = v4;
      v12 = self;
      dispatch_async(clientTruthWorkloop, v10);
      v8 = v11;
    }
    else
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] We found %@ unloaded zones, but handling logic is disabled by user defaults%@", buf, 0x16u);
      }

    }
  }

}

uint64_t __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke_2;
  v3[3] = &unk_24FE433A0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateIndexesUsingBlock:", v3);
}

void __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = a2;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Checking if unloaded zone %lu is being referenced by a client item%@", buf, 0x16u);
  }

  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE zone_rowid = %lu LIMIT 1"), a2);
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke_2_cold_1((uint64_t)v10, a2, v11);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE17300], 142, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dbBecameCorruptedWithDescription:error:", CFSTR("Unloaded zone is referenced by item"), v12);
    *a3 = 1;

  }
}

- (id)_unloadClientZones
{
  BRCPQLConnection *v3;
  void *v4;
  NSObject *v5;
  BRCPQLConnection *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *libraryRowIDsByMangledID;
  NSMutableDictionary *appLibrariesByRowID;
  NSMutableDictionary *serverZonesByZoneRowID;
  NSMutableDictionary *sharedServerZonesByMangledID;
  NSMutableDictionary *privateServerZonesByID;
  NSMutableDictionary *sharedClientZonesByMangledID;
  NSMutableDictionary *privateClientZonesByID;

  v3 = self->_clientDB;
  -[BRCPQLConnection serialQueue](v3, "serialQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BRCPQLConnection serialQueue](v3, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v5);

  }
  v6 = self->_serverDB;
  -[BRCPQLConnection serialQueue](v6, "serialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BRCPQLConnection serialQueue](v6, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

  }
  brc_mutex_lock(&self->_zonesCreationLock.pthread);
  brc_mutex_lock(&self->_zonesLock.pthread);
  -[NSMutableDictionary allValues](self->_privateClientZonesByID, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NSMutableDictionary allValues](self->_sharedClientZonesByMangledID, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = 0;

  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = 0;

  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = 0;

  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = 0;

  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = 0;

  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = 0;

  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = 0;

  brc_mutex_unlock(&self->_zonesLock.pthread);
  brc_mutex_unlock(&self->_zonesCreationLock.pthread);
  return v12;
}

- (id)sharedServerZoneRowIDsByOwnerNamePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_sharedServerZonesByMangledID, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "ownerName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrefix:", v4);

        if (v13)
        {
          objc_msgSend(v11, "dbRowID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v5;
}

- (id)serverZoneByMangledID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *privateClientZonesByID;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  if (objc_msgSend(v4, "isShared"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedClientZonesByMangledID, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    privateClientZonesByID = self->_privateClientZonesByID;
    objc_msgSend(v4, "appLibraryOrZoneName");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](privateClientZonesByID, "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v7;
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)serverZoneByCKZoneID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BE17640];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithRecordZoneID:", v5);

  -[BRCAccountSessionFPFS serverZoneByMangledID:](self, "serverZoneByMangledID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)serverZoneByName:(id)a3 ownerName:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BE17640];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithZoneName:ownerName:", v8, v7);

  -[BRCAccountSessionFPFS serverZoneByMangledID:](self, "serverZoneByMangledID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)serverZoneByRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  if (a3)
  {
    v4 = a3;
    -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serverZonesByZoneRowID, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v5)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS serverZoneByRowID:].cold.2();

    }
    objc_msgSend(v5, "clientZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS serverZoneByRowID:].cold.1();

    }
    objc_msgSend(v5, "clientZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v5;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)clientZoneByMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isShared"))
  {
    -[BRCAccountSessionFPFS sharedClientZoneByMangledID:](self, "sharedClientZoneByMangledID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCAccountSessionFPFS appLibraryByMangledID:](self, "appLibraryByMangledID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "defaultClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
  }

  return v5;
}

- (void)enumerateServerZones:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, void *))a3;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_serverZonesByZoneRowID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x2348B9F14](v7);
        objc_msgSend(v11, "clientZone", (_QWORD)v16);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = v4[2](v4, v11);

          if ((v15 & 1) == 0)
          {
            objc_autoreleasePoolPop(v12);
            goto LABEL_12;
          }
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)appLibraries
{
  void *v3;

  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_appLibrariesByRowID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v3;
}

- (id)fallbackAppLibraryForClientZone:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE172B0]);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentPersona");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEnterprisePersona");

    if (v12)
    {
      -[BRCAccountSessionFPFS appLibraryByID:](self, "appLibraryByID:", *MEMORY[0x24BE17550]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "zoneName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS appLibraryByID:](self, "appLibraryByID:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v6, "zoneName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE172D0]);

  if (v16)
  {
    objc_msgSend(v6, "zoneName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS appLibraryByID:](self, "appLibraryByID:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v18;
  }
  if (!v13)
  {
    objc_msgSend(v6, "mangledID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "iworkShareableExtensions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "containsObject:", v7))
    {
      if ((objc_msgSend(v7, "containsString:", CFSTR("pages")) & 1) != 0)
      {
        v24 = (_QWORD *)MEMORY[0x24BE172C8];
      }
      else if ((objc_msgSend(v7, "containsString:", CFSTR("key")) & 1) != 0)
      {
        v24 = (_QWORD *)MEMORY[0x24BE172B8];
      }
      else
      {
        if (!objc_msgSend(v7, "containsString:", CFSTR("numbers")))
          goto LABEL_19;
        v24 = (_QWORD *)MEMORY[0x24BE172C0];
      }
      -[BRCAccountSessionFPFS appLibraryByID:](self, "appLibraryByID:", *v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v19 = v25;
        v20 = v19;
LABEL_20:

        goto LABEL_21;
      }
    }
LABEL_19:
    -[BRCAccountSessionFPFS appLibraryByID:](self, "appLibraryByID:", *MEMORY[0x24BE17550]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    goto LABEL_20;
  }
  v19 = v13;
  v20 = v19;
LABEL_21:

  return v20;
}

- (id)privateServerZoneByID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateServerZonesByID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)enumeratePrivateServerZones:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS enumeratePrivateServerZones:].cold.1();

  }
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_privateServerZonesByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x2348B9F14](v7);
      LODWORD(v11) = v4[2](v4, v11);
      objc_autoreleasePoolPop(v12);
      if (!(_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 = v7;
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

}

- (id)cloudDocsClientZone
{
  return -[BRCAccountSessionFPFS privateClientZoneByID:](self, "privateClientZoneByID:", *MEMORY[0x24BE17550]);
}

- (id)privateClientZoneByID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateClientZonesByID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)enumerateClientZones:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, void *))a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS enumeratePrivateServerZones:].cold.1();

  }
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_serverZonesByZoneRowID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x2348B9F14]();
      objc_msgSend(v11, "clientZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v11;
          v25 = 2112;
          v26 = v14;
          _os_log_fault_impl(&dword_230455000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: missing client zone for %@%@", buf, 0x16u);
        }

      }
      v16 = v4[2](v4, v13);

      objc_autoreleasePoolPop(v12);
      if (!v16)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v8)
          goto LABEL_4;
        break;
      }
    }
  }

}

- (id)clientZones
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableDictionary count](self->_serverZonesByZoneRowID, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_serverZonesByZoneRowID, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v9, "clientZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v3;
}

- (void)enumeratePrivateClientZones:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS enumeratePrivateServerZones:].cold.1();

  }
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_privateClientZonesByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x2348B9F14](v7);
      LODWORD(v11) = v4[2](v4, v11);
      objc_autoreleasePoolPop(v12);
      if (!(_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 = v7;
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

}

- (id)sharedServerZoneByMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedServerZonesByMangledID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)sharedClientZoneByMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedClientZonesByMangledID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_mutex_unlock(&self->_zonesLock.pthread);
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)enumerateSharedClientZones:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, void *))a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS enumeratePrivateServerZones:].cold.1();

  }
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  -[NSMutableDictionary allValues](self->_sharedClientZonesByMangledID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x2348B9F14](v7);
        objc_msgSend(v11, "serverZone", (_QWORD)v18);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = v4[2](v4, v11);

          if ((v15 & 1) == 0)
          {
            objc_autoreleasePoolPop(v12);
            goto LABEL_13;
          }
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)performBlock:(id)a3 whileRemovingPrivateClientZone:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *privateClientZonesByID;
  void *v13;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v15;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (!self->_isCancelled)
  {
    -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
    -[BRCPQLConnection serialQueue](self->_serverDB, "serialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v9);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS performBlock:whileRemovingPrivateClientZone:].cold.1();

    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    if (v6)
      v6[2](v6);
    -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
    privateClientZonesByID = self->_privateClientZonesByID;
    objc_msgSend(v7, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](privateClientZonesByID, "removeObjectForKey:", v13);

    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    objc_msgSend(v7, "dbRowID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](serverZonesByZoneRowID, "removeObjectForKey:", v15);

    brc_mutex_unlock(&self->_zonesLock.pthread);
    brc_mutex_unlock(&self->_zonesCreationLock.pthread);
    objc_msgSend(v7, "close");
  }

}

- (void)destroySharedClientZone:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  brc_mutex *p_zonesCreationLock;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v14;
  BRCPQLConnection *clientDB;
  uint64_t v16;
  id v17;
  id v18;
  BRCPQLConnection *serverDB;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  BRCAccountSessionFPFS *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  BRCAccountSessionFPFS *v36;
  id v37;

  v4 = a3;
  v5 = v4;
  if (!self->_isCancelled)
  {
    if ((objc_msgSend(v4, "state") & 0x100) == 0)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS destroySharedClientZone:].cold.3();

    }
    if ((objc_msgSend(v5, "state") & 0x20000) == 0)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS destroySharedClientZone:].cold.2();

    }
    -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v6);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
    -[BRCPQLConnection serialQueue](self->_serverDB, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v7);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
    objc_msgSend(v5, "serverZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mangledID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS destroySharedClientZone:].cold.1((uint64_t)v9);

    p_zonesCreationLock = &self->_zonesCreationLock;
    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
    -[NSMutableDictionary removeObjectForKey:](self->_sharedClientZonesByMangledID, "removeObjectForKey:", v9);
    -[NSMutableDictionary removeObjectForKey:](self->_sharedServerZonesByMangledID, "removeObjectForKey:", v9);
    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    objc_msgSend(v5, "dbRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](serverZonesByZoneRowID, "removeObjectForKey:", v14);

    brc_mutex_unlock(&self->_zonesLock.pthread);
    clientDB = self->_clientDB;
    v16 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke;
    v34[3] = &unk_24FE40868;
    v17 = v9;
    v35 = v17;
    v36 = self;
    v18 = v5;
    v37 = v18;
    -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 27, v34);
    serverDB = self->_serverDB;
    v27 = v16;
    v28 = 3221225472;
    v29 = __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_273;
    v30 = &unk_24FE40868;
    v20 = v17;
    v31 = v20;
    v32 = self;
    v21 = v8;
    v33 = v21;
    -[BRCPQLConnection performWithFlags:action:](serverDB, "performWithFlags:action:", 11, &v27);

    brc_mutex_unlock(&p_zonesCreationLock->pthread);
    objc_msgSend(v18, "close", v27, v28, v29, v30);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(p_zonesCreationLock) = objc_msgSend(v22, "sessionZombiesEnabled");

    if ((_DWORD)p_zonesCreationLock)
    {
      objc_msgSend(MEMORY[0x24BE176B8], "turnObjectIntoZombie:", v21);
      objc_msgSend(MEMORY[0x24BE176B8], "turnObjectIntoZombie:", v18);
    }

  }
}

uint64_t __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "_deleteClientZone:", *(_QWORD *)(a1 + 48));
}

uint64_t __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_273(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_273_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "deleteServerZone:", *(_QWORD *)(a1 + 48));
}

- (void)assertNotOnZoneMutex
{
  brc_mutex_assert_unlocked(&self->_zonesLock.pthread);
}

- (id)__getOrCreateServerZone:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;
  __objc2_class **v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  v5 = objc_msgSend(v4, "isShared");
  objc_msgSend(v4, "appLibraryOrZoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedServerZonesByMangledID, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v7)
    {
      v8 = off_24FE3DD50;
      goto LABEL_9;
    }
LABEL_5:
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS __getOrCreateServerZone:].cold.3();
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateServerZonesByID, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  brc_mutex_unlock(&self->_zonesLock.pthread);
  if (v7)
    goto LABEL_5;
  v8 = off_24FE3DCE0;
LABEL_9:
  v7 = (id)objc_msgSend(objc_alloc(*v8), "initWithMangledID:dbRowID:plist:session:", v4, 0, 0, self);
  if (!-[BRCAccountSessionFPFS createServerZone:](self, "createServerZone:", v7))
  {
    v14 = 0;
    goto LABEL_14;
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS __getOrCreateServerZone:].cold.2((uint64_t)v7);

  objc_msgSend(v7, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS __getOrCreateServerZone:].cold.1();
LABEL_7:

  }
  v7 = v7;
  v14 = v7;
LABEL_14:

  return v14;
}

- (id)__getOrCreateClientZone:(id)a3 withServerZone:(id)a4 alreadyExists:(BOOL *)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  __objc2_class *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v25;
  NSObject *v26;

  v8 = a3;
  v9 = a4;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  v10 = objc_msgSend(v8, "isShared");
  objc_msgSend(v8, "appLibraryOrZoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = 0;
  -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedClientZonesByMangledID, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v12)
    {
      v13 = BRCSharedClientZone;
LABEL_12:
      v16 = [v13 alloc];
      objc_msgSend(v9, "dbRowID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v16, "initWithMangledID:dbRowID:plist:session:initialCreation:", v8, v17, 0, self, 1);

      if (!-[BRCAccountSessionFPFS _createClientZone:](self, "_createClientZone:", v12))
      {

        v12 = 0;
      }
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSessionFPFS __getOrCreateClientZone:withServerZone:alreadyExists:].cold.2((uint64_t)v12);

      if (v12)
      {
        objc_msgSend(v12, "setDelegate:", self->_containerScheduler);
        objc_msgSend(v12, "associateWithServerZone:", v9);
        objc_msgSend(v12, "dbRowID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dbRowID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "br_isEqualToNumber:", v21);

        if ((v22 & 1) == 0)
        {
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[BRCAccountSessionFPFS __getOrCreateClientZone:withServerZone:alreadyExists:].cold.1();

        }
      }
      goto LABEL_18;
    }
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_privateClientZonesByID, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v12)
    {
      v13 = BRCPrivateClientZone;
      goto LABEL_12;
    }
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS __getOrCreateClientZone:withServerZone:alreadyExists:].cold.3();

  if (a5)
    *a5 = 1;
LABEL_18:
  v23 = v12;

  return v23;
}

- (id)__getOrCreateAppLibrary:(id)a3 rowID:(id)a4 alreadyExists:(BOOL *)a5 withClientZone:(id)a6 createCZMMoved:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BRCAppLibrary *v19;
  BRCAppLibrary *v20;
  BRCAppLibrary *v21;
  BRCAppLibrary *v22;
  void *v23;
  void *v24;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  if (!v13)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(BRCDatabaseManager) createServerZone:].cold.2();

  }
  objc_msgSend(v12, "appLibraryOrZoneName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS appLibraryByID:](self, "appLibraryByID:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS __getOrCreateAppLibrary:rowID:alreadyExists:withClientZone:createCZMMoved:].cold.1();

    if (a5)
      *a5 = 1;
    v19 = v16;
  }
  else
  {
    v22 = [BRCAppLibrary alloc];
    objc_msgSend(v14, "dbRowID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 1;
    BYTE2(v28) = a7;
    LOWORD(v28) = 1;
    v20 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v22, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v12, v13, v23, self->_clientDB, 0, self, v28, 0, 0, v29);

    if (!-[BRCAccountSessionFPFS _createPrivateAppLibrary:](self, "_createPrivateAppLibrary:", v20)
      || (-[BRCAppLibrary associateWithClientZone:](v20, "associateWithClientZone:", v14),
          -[BRCAppLibrary setDelegate:](v20, "setDelegate:", self->_containerScheduler),
          objc_msgSend(v14, "serverZone"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:](self, "__registerServerZone:clientZone:appLibrary:isShared:", v24, v14, v20, 0), v24, !-[BRCAppLibrary recreateDocumentsFolderIfNeededInDB](v20, "recreateDocumentsFolderIfNeededInDB")))
    {
      v21 = 0;
      goto LABEL_15;
    }
    -[BRCAppLibrary flushAndForceIngestRootAndDocumentsFolder](v20, "flushAndForceIngestRootAndDocumentsFolder");
    if (a5)
      *a5 = 0;
    v19 = v20;
  }
  v20 = v19;
  v21 = v19;
LABEL_15:

  return v21;
}

- (void)__registerServerZone:(id)a3 clientZone:(id)a4 appLibrary:(id)a5 isShared:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *sharedServerZonesByMangledID;
  id v21;
  void *v22;
  NSMutableDictionary *privateServerZonesByID;
  void *v24;
  NSMutableDictionary *privateClientZonesByID;
  NSMutableDictionary *serverZonesByZoneRowID;
  void *v27;
  NSMutableDictionary *appLibrariesByRowID;
  void *v29;
  void *v30;
  NSMutableDictionary *libraryRowIDsByMangledID;
  NSObject *v32;
  void *v33;
  NSObject *v34;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((v12 == 0) != v6)
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:].cold.4();

  }
  objc_msgSend(v10, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13 || v6)
  {

    if (!v14)
      goto LABEL_5;
LABEL_9:
    -[BRCAccountSessionFPFS _mutexZonesLock](self, "_mutexZonesLock");
    if (v10 && v11)
    {
      if (v6)
      {
        objc_msgSend(v10, "mangledID");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          brc_bread_crumbs();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:].cold.2();
          goto LABEL_19;
        }
        v19 = (void *)v18;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedClientZonesByMangledID, "setObject:forKeyedSubscript:", v11, v18);
        sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
        v21 = v10;
      }
      else
      {
        objc_msgSend(v10, "zoneName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          brc_bread_crumbs();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:].cold.3();
          goto LABEL_19;
        }
        privateServerZonesByID = self->_privateServerZonesByID;
        objc_msgSend(v10, "zoneName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](privateServerZonesByID, "setObject:forKeyedSubscript:", v10, v24);

        privateClientZonesByID = self->_privateClientZonesByID;
        objc_msgSend(v10, "zoneName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        sharedServerZonesByMangledID = privateClientZonesByID;
        v21 = v11;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](sharedServerZonesByMangledID, "setObject:forKeyedSubscript:", v21, v19);

      serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
      objc_msgSend(v10, "dbRowID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](serverZonesByZoneRowID, "setObject:forKeyedSubscript:", v10, v27);

    }
    if (!v12)
    {
LABEL_20:
      brc_mutex_unlock(&self->_zonesLock.pthread);
      goto LABEL_21;
    }
    appLibrariesByRowID = self->_appLibrariesByRowID;
    objc_msgSend(v12, "dbRowID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](appLibrariesByRowID, "setObject:forKeyedSubscript:", v12, v29);

    objc_msgSend(v12, "dbRowID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
    objc_msgSend(v12, "mangledID");
    v32 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](libraryRowIDsByMangledID, "setObject:forKeyedSubscript:", v30, v32);
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v12, "dbRowID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_9;
LABEL_5:
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:].cold.1();

LABEL_21:
}

- (BOOL)_shouldPrivateAppLibraryBeCZMMoved:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isCloudDocsMangledID") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[BRCAccountSessionFPFS appLibraryByID:](self, "appLibraryByID:", *MEMORY[0x24BE17550]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "wasMovedToCloudDocs"))
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "shouldAutoMigrateToCloudDocs");

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 creationFlags:(unsigned int *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BRCPQLConnection *serverDB;
  uint64_t v24;
  id v25;
  BRCPQLConnection *clientDB;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  _BYTE *v43;
  unsigned int *v44;
  BOOL v45;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  _BYTE *v49;
  BOOL v50;
  uint64_t v51[3];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  __int128 v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__40;
  v68 = __Block_byref_object_dispose__40;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__40;
  v62 = __Block_byref_object_dispose__40;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__40;
  v56 = __Block_byref_object_dispose__40;
  v57 = 0;
  -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
  -[BRCPQLConnection serialQueue](self->_serverDB, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
  if (a4)
    *a4 = 0;
  v9 = -[BRCAccountSessionFPFS _shouldPrivateAppLibraryBeCZMMoved:](self, "_shouldPrivateAppLibraryBeCZMMoved:", v6);
  memset(v51, 0, sizeof(v51));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:]", 3928, v51);
  brc_bread_crumbs();
  v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v51[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v71 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating app library and zones: %@ if needed%@", buf, 0x20u);
  }

  if (v6 && !objc_msgSend(v6, "isShared"))
  {
    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    -[BRCAccountSessionFPFS appLibraryByMangledID:](self, "appLibraryByMangledID:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v65[5];
    v65[5] = v15;

    objc_msgSend((id)v65[5], "defaultClientZone");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v59[5];
    v59[5] = v17;

    objc_msgSend((id)v59[5], "privateServerZone");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v53[5];
    v53[5] = v19;

    if (v53[5])
    {
      brc_mutex_unlock(&self->_zonesCreationLock.pthread);
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v33 = v53[5];
        v34 = v59[5];
        v35 = (uint64_t (*)(uint64_t, uint64_t))v65[5];
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2112;
        v71 = v35;
        LOWORD(v72) = 2112;
        *(_QWORD *)((char *)&v72 + 2) = v21;
        _os_log_debug_impl(&dword_230455000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] returning early server zone: %@\nclient zone: %@\napp library: %@%@", buf, 0x2Au);
      }

      if (a4)
        *a4 = 1;
    }
    else
    {
      if (!-[BRCAccountSessionFPFS isCancelled](self, "isCancelled"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v71 = __Block_byref_object_copy__40;
        *(_QWORD *)&v72 = __Block_byref_object_dispose__40;
        *((_QWORD *)&v72 + 1) = 0;
        serverDB = self->_serverDB;
        v24 = MEMORY[0x24BDAC760];
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke;
        v46[3] = &unk_24FE47810;
        v50 = v9;
        v48 = &v52;
        v46[4] = self;
        v25 = v6;
        v47 = v25;
        v49 = buf;
        -[BRCPQLConnection performWithFlags:action:](serverDB, "performWithFlags:action:", 19, v46);
        if (v53[5])
        {
          clientDB = self->_clientDB;
          v38[0] = v24;
          v38[1] = 3221225472;
          v38[2] = __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_279;
          v38[3] = &unk_24FE47838;
          v45 = v9;
          v40 = &v58;
          v38[4] = self;
          v39 = v25;
          v41 = &v52;
          v42 = &v64;
          v43 = buf;
          v44 = a4;
          -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 23, v38);

        }
        _Block_object_dispose(buf, 8);

      }
      brc_mutex_unlock(&self->_zonesCreationLock.pthread);
      if (v65[5])
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v29 = v65[5];
          v30 = v53[5];
          v31 = (uint64_t (*)(uint64_t, uint64_t))v59[5];
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2112;
          v71 = v31;
          LOWORD(v72) = 2112;
          *(_QWORD *)((char *)&v72 + 2) = v27;
          _os_log_debug_impl(&dword_230455000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] returning app library %@\nserver zone:%@\n, client zone: %@%@", buf, 0x2Au);
        }
      }
      else
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        {
          v36 = v53[5];
          v37 = (uint64_t (*)(uint64_t, uint64_t))v59[5];
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2112;
          v71 = v37;
          LOWORD(v72) = 2112;
          *(_QWORD *)((char *)&v72 + 2) = v27;
          _os_log_error_impl(&dword_230455000, v28, (os_log_type_t)0x90u, "[ERROR] couldn't create app library\n appID: %@\nserverZone: %@\nclientZone: %@%@", buf, 0x2Au);
        }
      }

    }
    v14 = (id)v65[5];
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:].cold.1((uint64_t)v6);

    v14 = 0;
  }
  __brc_leave_section(v51);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  return v14;
}

uint64_t __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v4, "privateServerZoneByID:", *MEMORY[0x24BE17550]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      goto LABEL_8;
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS serverZoneByRowID:].cold.2();

  }
  else
  {
    objc_msgSend(v4, "__getOrCreateServerZone:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asPrivateZone");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
LABEL_8:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "getOrReserveLibraryRowIDForLibrary:", *(_QWORD *)(a1 + 40));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  return 1;
}

uint64_t __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_279(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int *v18;
  int v19;
  char v21;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(v4, "__getOrCreateClientZone:withServerZone:alreadyExists:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asPrivateClientZone");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v4, "privateClientZoneByID:", *MEMORY[0x24BE17550]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_279_cold_1();

    goto LABEL_7;
  }
LABEL_8:
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v13)
  {
    v21 = 0;
    objc_msgSend(*(id *)(a1 + 32), "__getOrCreateAppLibrary:rowID:alreadyExists:withClientZone:createCZMMoved:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), &v21, v13, *(unsigned __int8 *)(a1 + 88));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v17)
    {
      v18 = *(int **)(a1 + 80);
      if (v21)
      {
        if (v18)
        {
          v19 = 1;
LABEL_15:
          *v18 = v19;
        }
      }
      else
      {
        if (v18)
        {
          v19 = 2 * (*(_BYTE *)(a1 + 88) != 0);
          goto LABEL_15;
        }
        if (!*(_BYTE *)(a1 + 88) && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "resume");
          v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        }
        objc_msgSend(v17, "activate");
      }
    }
  }

  return 1;
}

- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3
{
  return -[BRCAccountSessionFPFS _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:](self, "_getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:", a3, 0);
}

- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 appLibraryExists:(BOOL *)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  int v12;
  int v13;

  v13 = 0;
  -[BRCAccountSessionFPFS _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:](self, "_getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:", a3, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v13 != 1)
  {
    -[BRCAccountSessionFPFS clientDB](self, "clientDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __90__BRCAccountSessionFPFS_getOrCreateAppLibraryAndPrivateZonesIfNecessary_appLibraryExists___block_invoke;
    v10[3] = &unk_24FE40450;
    v12 = v13;
    v11 = v6;
    dispatch_sync(v8, v10);

  }
  if (a4)
    *a4 = v13 == 1;
  return v6;
}

uint64_t __90__BRCAccountSessionFPFS_getOrCreateAppLibraryAndPrivateZonesIfNecessary_appLibraryExists___block_invoke(uint64_t a1)
{
  void *v2;

  if (!*(_DWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resume");

  }
  return objc_msgSend(*(id *)(a1 + 32), "activate");
}

- (id)getOrCreateSharedZones:(id)a3
{
  return -[BRCAccountSessionFPFS getOrCreateSharedZones:shareAcceptOp:](self, "getOrCreateSharedZones:shareAcceptOp:", a3, 0);
}

- (id)getOrCreateSharedZones:(id)a3 shareAcceptOp:(id)a4
{
  id v6;
  id v7;
  BRCPQLConnection *v8;
  void *v9;
  NSObject *v10;
  BRCPQLConnection *v11;
  void *v12;
  NSObject *v13;
  brc_mutex *p_zonesCreationLock;
  NSObject *clientTruthWorkloop;
  void *v16;
  BRCPQLConnection *serverDB;
  uint64_t v18;
  id v19;
  BRCPQLConnection *clientDB;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  BRCAccountSessionFPFS *v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  _QWORD block[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isShared") & 1) == 0)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS getOrCreateSharedZones:shareAcceptOp:].cold.1();

  }
  v8 = self->_serverDB;
  -[BRCPQLConnection serialQueue](v8, "serialQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[BRCPQLConnection serialQueue](v8, "serialQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v10);

  }
  v11 = self->_clientDB;
  -[BRCPQLConnection serialQueue](v11, "serialQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[BRCPQLConnection serialQueue](v11, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v13);

  }
  p_zonesCreationLock = &self->_zonesCreationLock;
  brc_mutex_lock(&self->_zonesCreationLock.pthread);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__40;
  v49 = __Block_byref_object_dispose__40;
  -[BRCAccountSessionFPFS clientZoneByMangledID:](self, "clientZoneByMangledID:", v6);
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__40;
  v43 = __Block_byref_object_dispose__40;
  objc_msgSend((id)v46[5], "serverZone");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (v40[5])
  {
    if (v7)
    {
      clientTruthWorkloop = self->_clientTruthWorkloop;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke;
      block[3] = &unk_24FE429C0;
      v38 = &v45;
      v37 = v7;
      dispatch_async_and_wait(clientTruthWorkloop, block);

    }
    brc_mutex_unlock(&p_zonesCreationLock->pthread);
    objc_msgSend((id)v46[5], "asSharedClientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    serverDB = self->_serverDB;
    v18 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke_2;
    v33[3] = &unk_24FE466F0;
    v35 = &v39;
    v33[4] = self;
    v19 = v6;
    v34 = v19;
    -[BRCPQLConnection performWithFlags:action:](serverDB, "performWithFlags:action:", 19, v33);
    clientDB = self->_clientDB;
    v24 = v18;
    v25 = 3221225472;
    v26 = __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke_3;
    v27 = &unk_24FE47860;
    v31 = &v45;
    v28 = self;
    v29 = v19;
    v32 = &v39;
    v30 = v7;
    -[BRCPQLConnection performWithFlags:action:](clientDB, "performWithFlags:action:", 19, &v24);
    brc_mutex_unlock(&self->_zonesCreationLock.pthread);
    objc_msgSend((id)v46[5], "asSharedClientZone", v24, v25, v26, v27, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v16;
}

uint64_t __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addSyncDownDependency:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "__getOrCreateServerZone:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

uint64_t __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v7;

  v7 = 0;
  objc_msgSend(*(id *)(a1 + 32), "__getOrCreateClientZone:withServerZone:alreadyExists:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), &v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) && v7 == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "__registerServerZone:clientZone:appLibrary:isShared:");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "resume");
    }
  }
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addSyncDownDependency:");
  return 1;
}

- (id)getOrReserveLibraryRowIDForLibrary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCPQLConnection assertOnQueue](self->_serverDB, "assertOnQueue");
  if (objc_msgSend(v4, "isShared"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS getOrReserveLibraryRowIDForLibrary:].cold.1();

    v7 = 0;
  }
  else
  {
    brc_mutex_lock(&self->_zonesLock.pthread);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_libraryRowIDsByMangledID, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v4, "appLibraryOrZoneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS _reserveRowIDForLibrary:](self, "_reserveRowIDForLibrary:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = 138412802;
        v13 = v7;
        v14 = 2112;
        v15 = v4;
        v16 = 2112;
        v17 = v9;
        _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] reserved rowid %@ for %@%@", (uint8_t *)&v12, 0x20u);
      }

      if (v7)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_libraryRowIDsByMangledID, "setObject:forKeyedSubscript:", v7, v4);
    }
    brc_mutex_unlock(&self->_zonesLock.pthread);
  }

  return v7;
}

- (void)fetchUserRecordIDWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (fetchUserRecordIDWithCompletionHandler__onceToken != -1)
    dispatch_once(&fetchUserRecordIDWithCompletionHandler__onceToken, &__block_literal_global_282);
  v5 = fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_24FE409B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("fetch-user-recordID", v0);

  v2 = (void *)fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue;
  fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue = (uint64_t)v1;

}

void __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  NSObject *v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 192);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__40;
  v23 = __Block_byref_object_dispose__40;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__40;
  v17[4] = __Block_byref_object_dispose__40;
  v18 = 0;
  objc_sync_enter(CFSTR("currentUserRecordID"));
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentUserRecordID"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v20[5];
  v20[5] = v3;

  objc_sync_exit(CFSTR("currentUserRecordID"));
  if (!v20[5])
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_2_cold_1();

    v7 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 32), "syncContextProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultSyncContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ckContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_284;
    v12[3] = &unk_24FE478D0;
    v15 = v17;
    v16 = &v19;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v2;
    v11 = v7;
    v14 = v11;
    objc_msgSend(v10, "fetchUserRecordIDWithCompletionHandler:", v12);

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v19, 8);
}

void __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_284(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched user record id %@ with error %@%@", buf, 0x20u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v10 = *(void **)(a1 + 40);
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_285;
    v14[3] = &unk_24FE478A8;
    v12 = v10;
    v18 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v16 = v13;
    v17 = *(id *)(a1 + 48);
    dispatch_async(v11, v14);

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

intptr_t __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_285(uint64_t a1)
{
  objc_sync_enter(CFSTR("currentUserRecordID"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("currentUserRecordID"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "forceBatchStart");
  objc_sync_exit(CFSTR("currentUserRecordID"));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)cachedCurrentUserRecordName
{
  void *v2;
  void *v4;
  NSObject *v5;

  -[BRCAccountSessionFPFS cachedCurrentUserRecordNameIfExists](self, "cachedCurrentUserRecordNameIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS cachedCurrentUserRecordName].cold.1();

  }
  return v2;
}

- (id)cachedCurrentUserRecordNameIfExists
{
  BRCClientState *v2;
  void *v3;
  void *v4;

  v2 = self->_clientState;
  objc_sync_enter(CFSTR("currentUserRecordID"));
  -[BRCClientState objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("currentUserRecordID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(CFSTR("currentUserRecordID"));
  return v4;
}

- (void)_cloudDocsAppsListDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  _QWORD v13[7];
  uint64_t v14[3];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  if (!self->_isCancelled)
  {
    if (objc_msgSend(MEMORY[0x24BEBF268], "br_isInSyncBubble"))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSessionFPFS _cloudDocsAppsListDidChange:].cold.1();

    }
    else
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__40;
      v21 = __Block_byref_object_dispose__40;
      v22 = 0;
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__40;
      v15[4] = __Block_byref_object_dispose__40;
      v16 = 0;
      memset(v14, 0, sizeof(v14));
      __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _cloudDocsAppsListDidChange:]", 4237, v14);
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[BRCAccountSessionFPFS _cloudDocsAppsListDidChange:].cold.2();

      v9 = MEMORY[0x24BDAC760];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke;
      v13[3] = &unk_24FE47948;
      v13[4] = self;
      v13[5] = &v17;
      v13[6] = v15;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);
      objc_msgSend((id)v18[5], "invalidate");
      -[BRCAccountSessionFPFS clientDB](self, "clientDB");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serialQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_6;
      block[3] = &unk_24FE3FA18;
      block[4] = self;
      dispatch_sync(v11, block);

      __brc_leave_section(v14);
      _Block_object_dispose(v15, 8);

      _Block_object_dispose(&v17, 8);
    }
  }

}

void __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  _BYTE *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithAppLibraryName:", v7);
  objc_msgSend(*(id *)(a1 + 32), "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_2;
  v21[3] = &unk_24FE47920;
  v12 = *(_QWORD *)(a1 + 32);
  v24 = *(_QWORD *)(a1 + 40);
  v21[4] = v12;
  v13 = v10;
  v14 = *(_QWORD *)(a1 + 48);
  v22 = v13;
  v25 = v14;
  v15 = v7;
  v23 = v15;
  v26 = &v27;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v21);
  v16 = *(_BYTE **)(a1 + 32);
  if (v16[529])
  {
    *a4 = 1;
  }
  else if (*((_BYTE *)v28 + 24))
  {
    objc_msgSend(v16, "clientDB");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serialQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_5;
    block[3] = &unk_24FE3FA18;
    v20 = v13;
    dispatch_sync(v18, block);

  }
  _Block_object_dispose(&v27, 8);

}

void __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  id v21;
  id v22;
  int8x16_t v23;

  v5 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    BRCBundleServiceConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 529))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "containerMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "versionNumberForBundleIdentifier:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE176B0]), "initWithXPCObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_3;
    v20 = &unk_24FE478F8;
    v15 = *(_QWORD *)(a1 + 48);
    v21 = *(id *)(a1 + 40);
    v22 = v5;
    v23 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
    objc_msgSend(v14, "extractMetadataForContainerID:bundleID:minimumBundleVersion:reply:", v15, v22, v10, &v17);
    v16 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "result", v17, v18, v19, v20);

  }
}

void __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "containerMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDocumentScopePublic");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "containerMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "updateMetadataWithExtractorProperties:iconPaths:bundleID:", v7, v8, *(_QWORD *)(a1 + 40));

    if (v13)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDocumentScopePublic");

  if (v11 != v15)
  {
    brc_task_tracker_create("apps-list-did-change");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "db");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serialQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_4;
    v19[3] = &unk_24FE3FA18;
    v20 = *(id *)(a1 + 32);
    brc_task_tracker_async_with_logs(v16, v18, v19, 0);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setBoolResult:error:", v9 == 0, v9);

}

uint64_t __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateDocumentScopePublic");
}

uint64_t __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleContainerMetadataSyncUp");
}

void __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_7;
  v3[3] = &unk_24FE47970;
  v3[4] = &v4;
  objc_msgSend(v2, "enumeratePrivateClientZones:", v3);
  if (*((_BYTE *)v5 + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "refreshPushRegistrationAfterAppsListChanged");
  _Block_object_dispose(&v4, 8);
}

uint64_t __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_7(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "recomputeAppSyncBlockState"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

- (void)cloudDocsAppsListDidChange:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BRPerformWithPersonaAndError();

}

void __52__BRCAccountSessionFPFS_cloudDocsAppsListDidChange___block_invoke(uint64_t a1, uint64_t a2)
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
      __52__BRCAccountSessionFPFS_cloudDocsAppsListDidChange___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cloudDocsAppsListDidChange:", *(_QWORD *)(a1 + 40));
  }
}

- (void)recomputeAppSyncBlockStateForPrivateClientZone:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BRCAccountSessionFPFS clientDB](self, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  LODWORD(v5) = objc_msgSend(v4, "recomputeAppSyncBlockState");
  if ((_DWORD)v5)
    -[BRCContainerScheduler refreshPushRegistrationAfterAppsListChanged](self->_containerScheduler, "refreshPushRegistrationAfterAppsListChanged");
}

- (BOOL)hasOptimizeStorageEnabled
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  char v10;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)*MEMORY[0x24BE175B0];
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnterprisePersona");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x24BE175A8], self->_accountDSID);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  objc_msgSend(v3, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[BRCAccountSessionFPFS setOptimizeStorageEnabled:forKey:synchronous:](self, "setOptimizeStorageEnabled:forKey:synchronous:", 1, v4, 0);
    v9 = (void *)MEMORY[0x24BDBD1C8];
  }
  v10 = objc_msgSend(v9, "BOOLValue");

  return v10;
}

- (void)setOptimizeStorageEnabled:(BOOL)a3 forKey:(id)a4 synchronous:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  const char *v20;
  _QWORD v21[4];
  NSObject *v22;
  BOOL v23;
  _QWORD v24[4];
  NSObject *v25;
  BOOL v26;
  uint64_t v27[3];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v5 = a5;
  v6 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS setOptimizeStorageEnabled:forKey:synchronous:]", 4353, v27);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    v29 = v27[0];
    if (v6)
      v19 = "enabling";
    else
      v19 = "disabling";
    v30 = 2080;
    v31 = v19;
    v20 = "YES";
    v32 = 2112;
    v33 = v8;
    if (!v5)
      v20 = "NO";
    v34 = 2080;
    v35 = v20;
    v36 = 2112;
    v37 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s storage optimization for %@ synchronous %s%@", buf, 0x34u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, v8);

  objc_msgSend(v9, "synchronize");
  v13 = dispatch_group_create();
  v14 = v13;
  if (v5)
    dispatch_group_enter(v13);
  v15 = MEMORY[0x24BDAC760];
  v16 = *MEMORY[0x24BDC8228];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke;
  v24[3] = &unk_24FE418E8;
  v26 = v5;
  v17 = v14;
  v25 = v17;
  +[BRCImportUtil forceIngestionForItemID:completionHandler:](BRCImportUtil, "forceIngestionForItemID:completionHandler:", v16, v24);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_299;
  v21[3] = &unk_24FE479C0;
  v23 = v5;
  v18 = v17;
  v22 = v18;
  -[BRCAccountSessionFPFS enumerateAppLibraries:](self, "enumerateAppLibraries:", v21);
  dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  BRPostAccountTokenChangedNotification();

  __brc_leave_section(v27);
}

void __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_cold_1();

  if (*(_BYTE *)(a1 + 40))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_299(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  v3 = a2;
  if ((objc_msgSend(v3, "isAppInstalled") & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 40))
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    objc_msgSend(v3, "rootFileObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2;
    v7[3] = &unk_24FE47998;
    v8 = v3;
    v10 = *(_BYTE *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    +[BRCImportUtil forceIngestionForItemID:completionHandler:](BRCImportUtil, "forceIngestionForItemID:completionHandler:", v5, v7);

  }
  return 1;
}

void __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2_cold_1();

  if (*(_BYTE *)(a1 + 48))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)setOptimizeStorageEnabled:(BOOL)a3 synchronous:(BOOL)a4
{
  -[BRCAccountSessionFPFS setOptimizeStorageEnabled:forKey:synchronous:](self, "setOptimizeStorageEnabled:forKey:synchronous:", a3, *MEMORY[0x24BE175B0], a4);
}

- (BOOL)isGreedy
{
  BOOL v2;
  void *v3;
  NSObject *v4;

  v2 = -[BRCAccountSessionFPFS hasOptimizeStorageEnabled](self, "hasOptimizeStorageEnabled");
  if (!v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BRCAccountSessionFPFS isGreedy].cold.1();

  }
  return !v2;
}

- (BOOL)isOptimizeStorage
{
  return !-[BRCAccountSessionFPFS isGreedy](self, "isGreedy");
}

- (void)dumpXPCClientsToContext:(id)a3
{
  id v4;
  BRCAccountSessionFPFS *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableSet copy](v5->_xpcClients, "copy");
  objc_sync_exit(v5);

  objc_msgSend(v4, "writeLineWithFormat:", &stru_24FE4A790);
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%ld xpc clients:"), objc_msgSend(v6, "count"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "dumpToContext:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "writeLineWithFormat:", &stru_24FE4A790);
}

- (void)dumpMiscOperationsToContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSHashTable allObjects](self->_miscOperations, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeLineWithFormat:", &stru_24FE4A790);
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%ld misc operations:"), objc_msgSend(v5, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "descriptionWithContext:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%@"), v12);

        }
        else
        {
          objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%@"), v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)openForDumping
{
  BRCFairScheduler *v3;
  BRCFairScheduler *fairClientDBScheduler;
  BRCDeadlineScheduler *v5;
  BRCDeadlineScheduler *defaultScheduler;
  BRCApplyScheduler *v7;
  BRCApplyScheduler *applyScheduler;
  BRCFSImporter *v9;
  BRCFSImporter *fsImporter;
  BRCFSUploader *v11;
  BRCFSUploader *fsUploader;
  BRCFSDownloader *v13;
  BRCFSDownloader *fsDownloader;
  BRCStageRegistry *v15;
  BRCStageRegistry *stageRegistry;
  NSMutableDictionary *v17;
  NSMutableDictionary *libraryRowIDsByMangledID;
  NSMutableDictionary *v19;
  NSMutableDictionary *appLibrariesByRowID;
  NSMutableDictionary *v21;
  NSMutableDictionary *serverZonesByZoneRowID;
  NSMutableDictionary *v23;
  NSMutableDictionary *sharedServerZonesByMangledID;
  NSMutableDictionary *v25;
  NSMutableDictionary *sharedClientZonesByMangledID;
  NSMutableDictionary *v27;
  NSMutableDictionary *privateServerZonesByID;
  NSMutableDictionary *v29;
  NSMutableDictionary *privateClientZonesByID;
  NSObject *v31;
  OS_dispatch_queue *v32;
  OS_dispatch_queue *resetQueue;
  NSObject *v34;

  v3 = -[BRCFairScheduler initWithWorkloop:name:]([BRCFairScheduler alloc], "initWithWorkloop:name:", self->_clientTruthWorkloop, CFSTR("client-db"));
  fairClientDBScheduler = self->_fairClientDBScheduler;
  self->_fairClientDBScheduler = v3;

  v5 = -[BRCDeadlineScheduler initWithName:fairScheduler:]([BRCDeadlineScheduler alloc], "initWithName:fairScheduler:", CFSTR("com.apple.bird.main-scheduler"), self->_fairClientDBScheduler);
  defaultScheduler = self->_defaultScheduler;
  self->_defaultScheduler = v5;

  v7 = -[BRCApplyScheduler initWithAccountSession:]([BRCApplyScheduler alloc], "initWithAccountSession:", self);
  applyScheduler = self->_applyScheduler;
  self->_applyScheduler = v7;

  v9 = -[BRCFSImporter initWithAccountSession:]([BRCFSImporter alloc], "initWithAccountSession:", self);
  fsImporter = self->_fsImporter;
  self->_fsImporter = v9;

  v11 = -[BRCFSUploader initWithAccountSession:]([BRCFSUploader alloc], "initWithAccountSession:", self);
  fsUploader = self->_fsUploader;
  self->_fsUploader = v11;

  v13 = -[BRCFSDownloader initWithAccountSession:]([BRCFSDownloader alloc], "initWithAccountSession:", self);
  fsDownloader = self->_fsDownloader;
  self->_fsDownloader = v13;

  v15 = -[BRCStageRegistry initWithAccountSession:]([BRCStageRegistry alloc], "initWithAccountSession:", self);
  stageRegistry = self->_stageRegistry;
  self->_stageRegistry = v15;

  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = v21;

  v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = v23;

  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = v27;

  v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = v29;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v34, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (OS_dispatch_queue *)dispatch_queue_create("reset-queue", v31);

  resetQueue = self->_resetQueue;
  self->_resetQueue = v32;

}

- (void)openForSendingTelemetry
{
  BRCAnalyticsReporter *v3;
  BRCAnalyticsReporter *analyticsReporter;
  BRCSyncContextProvider *v5;
  BRCSyncContextProvider *syncContextProvider;

  -[BRCAccountSessionFPFS openForDumping](self, "openForDumping");
  v3 = -[BRCAnalyticsReporter initWithSession:]([BRCAnalyticsReporter alloc], "initWithSession:", self);
  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = v3;

  v5 = -[BRCSyncContextProvider initWithAccountSession:]([BRCSyncContextProvider alloc], "initWithAccountSession:", self);
  syncContextProvider = self->_syncContextProvider;
  self->_syncContextProvider = v5;

  -[BRCAccountSessionFPFS _setupThrottles](self, "_setupThrottles");
}

- (void)_handleTrashedItemsMigration
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BRCPQLConnection *clientDB;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[BRCPQLConnection assertOnQueue](self->_clientDB, "assertOnQueue");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dbMigrationBatchSize");

  v5 = MEMORY[0x24BDAC760];
  do
  {
    clientDB = self->_clientDB;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __53__BRCAccountSessionFPFS__handleTrashedItemsMigration__block_invoke;
    v7[3] = &unk_24FE479E8;
    v7[5] = &v8;
    v7[6] = v4;
    v7[4] = self;
    -[BRCPQLConnection groupInBatch:](clientDB, "groupInBatch:", v7);
  }
  while (!*((_BYTE *)v9 + 24));
  _Block_object_dispose(&v8, 8);
}

void __53__BRCAccountSessionFPFS__handleTrashedItemsMigration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v24 = a2;
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_scope = 3 AND item_localsyncupstate = 5 LIMIT %lld"), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __53__BRCAccountSessionFPFS__handleTrashedItemsMigration__block_invoke_2;
  v29[3] = &unk_24FE40010;
  v22 = v3;
  v23 = a1;
  v29[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjects:", v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v10, "clientZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverItemByItemID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "markNeedsDeleteForRescheduleOfItem:", v14);
        objc_msgSend(v10, "markDoneMigratingToFPFS");
        objc_msgSend(v4, "insertObject:atIndex:", v10, 0);

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  objc_msgSend(v22, "close");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v20, "saveToDB");
        objc_autoreleasePoolPop(v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v17);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v23 + 40) + 8) + 24) = objc_msgSend(v15, "count") == 0;
}

id __53__BRCAccountSessionFPFS__handleTrashedItemsMigration__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (NSString)sessionDirPath
{
  NSString *sessionDirPath;
  void *v5;
  NSObject *v6;

  sessionDirPath = self->_sessionDirPath;
  if (!sessionDirPath)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS sessionDirPath].cold.1();

    sessionDirPath = self->_sessionDirPath;
  }
  return sessionDirPath;
}

- (NSString)cacheDirPath
{
  NSString *cacheDirPath;
  void *v5;
  NSObject *v6;

  cacheDirPath = self->_cacheDirPath;
  if (!cacheDirPath)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS cacheDirPath].cold.1();

    cacheDirPath = self->_cacheDirPath;
  }
  return cacheDirPath;
}

- (BRCApplyScheduler)applyScheduler
{
  BRCApplyScheduler *applyScheduler;
  void *v5;
  NSObject *v6;

  applyScheduler = self->_applyScheduler;
  if (!applyScheduler)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS applyScheduler].cold.1();

    applyScheduler = self->_applyScheduler;
  }
  return applyScheduler;
}

- (BRCFSImporter)fsImporter
{
  BRCFSImporter *fsImporter;
  void *v5;
  NSObject *v6;

  fsImporter = self->_fsImporter;
  if (!fsImporter)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS fsImporter].cold.1();

    fsImporter = self->_fsImporter;
  }
  return fsImporter;
}

- (BRCStageRegistry)stageRegistry
{
  BRCStageRegistry *stageRegistry;
  void *v5;
  NSObject *v6;

  stageRegistry = self->_stageRegistry;
  if (!stageRegistry)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS stageRegistry].cold.1();

    stageRegistry = self->_stageRegistry;
  }
  return stageRegistry;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (BRCBarrier)dbLoadingBarrier
{
  return self->_dbLoadingBarrier;
}

- (void)setSessionDirPath:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDirPath, a3);
}

- (void)setCacheDirPath:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDirPath, a3);
}

- (NSString)ubiquityTokenSalt
{
  return self->_ubiquityTokenSalt;
}

- (BRCDeadlineScheduler)defaultScheduler
{
  return self->_defaultScheduler;
}

- (BRCFairScheduler)fairClientDBScheduler
{
  return self->_fairClientDBScheduler;
}

- (BRCVolume)volume
{
  return self->_volume;
}

- (BRCFSUploader)fsUploader
{
  return self->_fsUploader;
}

- (BRCFSDownloader)fsDownloader
{
  return self->_fsDownloader;
}

- (BRCSyncUpScheduler)syncUpScheduler
{
  return self->_syncUpScheduler;
}

- (BRCDownloadTrackers)downloadTrackers
{
  return self->_downloadTrackers;
}

- (BRCUserNotification)userNotification
{
  return self->_userNotification;
}

- (BRCDiskSpaceReclaimer)diskReclaimer
{
  return self->_diskReclaimer;
}

- (BRCFileUnlinker)fileUnlinker
{
  return self->_fileUnlinker;
}

- (BRCRecentsEnumerator)recentsEnumerator
{
  return self->_recentsEnumerator;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BRCThrottle)appLibraryScanThrottle
{
  return self->_appLibraryScanThrottle;
}

- (BRCThrottle)appLibraryResetThrottle
{
  return self->_appLibraryResetThrottle;
}

- (BRCThrottle)sharedAppLibraryResetThrottle
{
  return self->_sharedAppLibraryResetThrottle;
}

- (BRCThrottle)appLibraryAliasRemovalThrottle
{
  return self->_appLibraryAliasRemovalThrottle;
}

- (BRCThrottle)lostItemThrottle
{
  return self->_lostItemThrottle;
}

- (BRCThrottle)operationFailureThrottle
{
  return self->_operationFailureThrottle;
}

- (BRCThrottle)syncClientZoneThrottle
{
  return self->_syncClientZoneThrottle;
}

- (BRCThrottle)syncClientZoneErrorThrottle
{
  return self->_syncClientZoneErrorThrottle;
}

- (BRCGlobalProgress)globalProgress
{
  return self->_globalProgress;
}

- (OS_dispatch_queue)resetQueue
{
  return self->_resetQueue;
}

- (OS_dispatch_queue)dbFixupQueue
{
  return self->_dbFixupQueue;
}

- (BRCAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (BRCSyncContextProvider)syncContextProvider
{
  return self->_syncContextProvider;
}

- (BOOL)isDataSeparated
{
  return self->_isDataSeparated;
}

- (BOOL)offline
{
  return self->_offline;
}

- (NSFileProviderDomain)fpDomain
{
  return self->_fpDomain;
}

- (void)setFpDomain:(id)a3
{
  objc_storeStrong((id *)&self->_fpDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_dbFixupQueue, 0);
  objc_storeStrong((id *)&self->_resetQueue, 0);
  objc_storeStrong((id *)&self->_syncClientZoneErrorThrottle, 0);
  objc_storeStrong((id *)&self->_syncClientZoneThrottle, 0);
  objc_storeStrong((id *)&self->_operationFailureThrottle, 0);
  objc_storeStrong((id *)&self->_lostItemThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryAliasRemovalThrottle, 0);
  objc_storeStrong((id *)&self->_sharedAppLibraryResetThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryResetThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryScanThrottle, 0);
  objc_storeStrong((id *)&self->_recentsEnumerator, 0);
  objc_storeStrong((id *)&self->_diskReclaimer, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong((id *)&self->_downloadTrackers, 0);
  objc_storeStrong((id *)&self->_syncUpScheduler, 0);
  objc_storeStrong((id *)&self->_fsDownloader, 0);
  objc_storeStrong((id *)&self->_fsUploader, 0);
  objc_storeStrong((id *)&self->_fairClientDBScheduler, 0);
  objc_storeStrong((id *)&self->_applyScheduler, 0);
  objc_storeStrong((id *)&self->_containerScheduler, 0);
  objc_storeStrong((id *)&self->_ubiquityTokenSalt, 0);
  objc_storeStrong((id *)&self->_cacheDirPath, 0);
  objc_storeStrong((id *)&self->_sessionDirPath, 0);
  objc_storeStrong((id *)&self->_dbLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_syncContextProvider, 0);
  objc_storeStrong((id *)&self->_isInCarry, 0);
  objc_storeStrong((id *)&self->_accountWaitOperation, 0);
  objc_storeStrong((id *)&self->_globalProgress, 0);
  objc_storeStrong((id *)&self->_xpcClients, 0);
  objc_storeStrong((id *)&self->_acAccountID, 0);
  objc_storeStrong((id *)&self->_extensionBackChannel, 0);
  objc_storeStrong((id *)&self->_serverChangesApplier, 0);
  objc_storeStrong((id *)&self->_fsImporter, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_fileUnlinker, 0);
  objc_storeStrong((id *)&self->_stageRegistry, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_privateClientZonesByID, 0);
  objc_storeStrong((id *)&self->_privateServerZonesByID, 0);
  objc_storeStrong((id *)&self->_sharedClientZonesByMangledID, 0);
  objc_storeStrong((id *)&self->_sharedServerZonesByMangledID, 0);
  objc_storeStrong((id *)&self->_serverZonesByZoneRowID, 0);
  objc_storeStrong((id *)&self->_appLibrariesByRowID, 0);
  objc_storeStrong((id *)&self->_libraryRowIDsByMangledID, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_serverState, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_expensiveReadOnlyDB, 0);
  objc_storeStrong((id *)&self->_readOnlyDB, 0);
  objc_storeStrong((id *)&self->_serverDB, 0);
  objc_storeStrong((id *)&self->_clientDB, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
  objc_storeStrong((id *)&self->_bouncingAnalyzer, 0);
  objc_storeStrong((id *)&self->_namedThrottleManager, 0);
  objc_storeStrong((id *)&self->_fpDomain, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandler, 0);
  objc_storeStrong((id *)&self->_miscOperations, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong(&self->_dbProfilingHook, 0);
  objc_storeStrong((id *)&self->_readOnlyWorkloop, 0);
  objc_storeStrong((id *)&self->_serverTruthWorkloop, 0);
  objc_storeStrong((id *)&self->_clientTruthWorkloop, 0);
  objc_storeStrong((id *)&self->_dbCorruptionQueue, 0);
  objc_storeStrong((id *)&self->_dbWatcherQueue, 0);
  objc_storeStrong((id *)&self->_dbWatcher, 0);
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_defaultScheduler, 0);
}

- (id)newLocalItemFromPQLResultSet:(id)a3 db:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  __objc2_class *v11;
  void *v12;
  NSObject *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = (char)objc_msgSend(v8, "intAtIndex:", 15);
  switch(v10)
  {
    case 0:
    case 4:
    case 9:
      v11 = BRCDirectoryItem;
      goto LABEL_12;
    case 1:
    case 2:
      v11 = BRCDocumentItem;
      goto LABEL_12;
    case 3:
      v11 = BRCAliasItem;
      goto LABEL_12;
    case 5:
      v11 = BRCSymlinkItem;
      goto LABEL_12;
    case 6:
    case 7:
      v11 = BRCFinderBookmarkItem;
      goto LABEL_12;
    case 8:
      v11 = BRCShareAcceptationDocumentFault;
      goto LABEL_12;
    case 10:
      v11 = BRCShareAcceptationDirectoryFault;
LABEL_12:
      v14 = (void *)objc_msgSend([v11 alloc], "initFromPQLResultSet:session:db:error:", v8, self, v9, a5);
      break;
    default:
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        +[BRCItemID(CKConversions) structureRecordPrefixForItemType:targetZoneShared:].cold.1((uint64_t)v12, v10, v13);

      v14 = 0;
      break;
  }

  return v14;
}

- (id)newServerItemFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  __objc2_class **v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "numberAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS serverZoneByRowID:](self, "serverZoneByRowID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isSharedZone");
  v10 = off_24FE3DD48;
  if (!v9)
    v10 = off_24FE3DD30;
  v11 = (void *)objc_msgSend(objc_alloc(*v10), "initFromPQLResultSet:serverZone:error:", v6, v8, a4);

  return v11;
}

- (id)itemIDByRowID:(unint64_t)a3
{
  return -[BRCAccountSessionFPFS itemIDByRowID:db:](self, "itemIDByRowID:db:", a3, self->_clientDB);
}

- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4
{
  return (id)objc_msgSend(a4, "itemIDWithSQL:", CFSTR("SELECT item_id FROM client_items   WHERE rowid = %lld"), a3);
}

- (id)itemByRowID:(unint64_t)a3
{
  return -[BRCAccountSessionFPFS itemByRowID:db:](self, "itemByRowID:db:", a3, self->_clientDB);
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__BRCAccountSessionFPFS_ItemFetching__itemByRowID_db___block_invoke;
  v10[3] = &unk_24FE40038;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = (void *)objc_msgSend(v7, "fetchObject:sql:", v10, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE rowid = %lld"), a3);

  return v8;
}

id __54__BRCAccountSessionFPFS_ItemFetching__itemByRowID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)itemByFileObjectID:(id)a3
{
  return -[BRCAccountSessionFPFS itemByFileObjectID:db:](self, "itemByFileObjectID:db:", a3, self->_clientDB);
}

- (id)serverAliasItemForSharedItem:(id)a3
{
  return -[BRCAccountSessionFPFS serverAliasItemForSharedItem:db:](self, "serverAliasItemForSharedItem:db:", a3, self->_clientDB);
}

- (id)serverAliasItemForSharedItem:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS privateClientZoneByID:](self, "privateClientZoneByID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (objc_msgSend(v10, "serverZone"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        -[BRCAccountSessionFPFS serverAliasItemForSharedItem:inZone:db:](self, "serverAliasItemForSharedItem:inZone:db:", v6, v11, v7), v12 = (void *)objc_claimAutoreleasedReturnValue(), v11, !v12))
  {
    -[BRCAccountSessionFPFS serverAliasItemForSharedItem:inZone:db:](self, "serverAliasItemForSharedItem:inZone:db:", v6, 0, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4
{
  return -[BRCAccountSessionFPFS serverAliasItemForSharedItem:inZone:db:](self, "serverAliasItemForSharedItem:inZone:db:", a3, a4, self->_clientDB);
}

- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSharedZone");

  if ((v12 & 1) == 0)
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(ItemFetching) serverAliasItemForSharedItem:inZone:db:].cold.1();

  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "mangledID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __78__BRCAccountSessionFPFS_ItemFetching__serverAliasItemForSharedItem_inZone_db___block_invoke;
  v26[3] = &unk_24FE40010;
  v26[4] = self;
  if (v8)
  {
    v19 = (void *)MEMORY[0x24BEDD638];
    objc_msgSend(v8, "dbRowID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "formatInjection:", CFSTR("AND +si.zone_rowid = %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v9, "fetchObject:sql:", v26, CFSTR("SELECT si.zone_rowid, si.item_rank, si.item_origname, si.pcs_state, si.item_id, si.item_creator_id, si.item_sharing_options, si.item_side_car_ckinfo, si.item_stat_ckinfo, si.item_state, si.item_type, si.item_mode, si.item_birthtime, si.item_lastusedtime, si.item_favoriterank,si.item_parent_id, si.item_filename, si.item_hidden_ext, si.item_finder_tags, si.item_xattr_signature, si.item_trash_put_back_path, si.item_trash_put_back_parent_id, si.item_alias_target, si.item_creator, si.version_name, si.version_ckinfo, si.version_mtime, si.version_size, si.version_thumb_size, si.version_thumb_signature, si.version_content_signature, si.version_xattr_signature, si.version_edited_since_shared, si.version_device, si.version_conflict_loser_etags, si.version_quarantine_info, si.child_basehash_salt, si.salting_state, si.basehash_salt_validation_key, si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count, ci.item_id FROM server_items AS si LEFT JOIN client_items AS ci ON si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid WHERE si.item_alias_target = %@ AND si.item_type = 3 AND si.item_state = 0 AND (ci.item_id IS NULL OR ci.item_state != 1) %@ ORDER BY si.item_id"), v18, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v9, "fetchObject:sql:", v26, CFSTR("SELECT si.zone_rowid, si.item_rank, si.item_origname, si.pcs_state, si.item_id, si.item_creator_id, si.item_sharing_options, si.item_side_car_ckinfo, si.item_stat_ckinfo, si.item_state, si.item_type, si.item_mode, si.item_birthtime, si.item_lastusedtime, si.item_favoriterank,si.item_parent_id, si.item_filename, si.item_hidden_ext, si.item_finder_tags, si.item_xattr_signature, si.item_trash_put_back_path, si.item_trash_put_back_parent_id, si.item_alias_target, si.item_creator, si.version_name, si.version_ckinfo, si.version_mtime, si.version_size, si.version_thumb_size, si.version_thumb_signature, si.version_content_signature, si.version_xattr_signature, si.version_edited_since_shared, si.version_device, si.version_conflict_loser_etags, si.version_quarantine_info, si.child_basehash_salt, si.salting_state, si.basehash_salt_validation_key, si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count, ci.item_id FROM server_items AS si LEFT JOIN client_items AS ci ON si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid WHERE si.item_alias_target = %@ AND si.item_type = 3 AND si.item_state = 0 AND (ci.item_id IS NULL OR ci.item_state != 1) %@ ORDER BY si.item_id"), v18, v20);
  }

  return v22;
}

id __78__BRCAccountSessionFPFS_ItemFetching__serverAliasItemForSharedItem_inZone_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "newServerItemFromPQLResultSet:error:", a2, a3);
}

- (id)localAliasForSharedItem:(id)a3 inZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCPQLConnection *clientDB;
  void *v17;
  id v18;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSharedZone");

  if ((v9 & 1) == 0)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCAccountSessionFPFS(ItemFetching) serverAliasItemForSharedItem:inZone:db:].cold.1();

  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "mangledID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  clientDB = self->_clientDB;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __70__BRCAccountSessionFPFS_ItemFetching__localAliasForSharedItem_inZone___block_invoke;
  v22[3] = &unk_24FE40010;
  v22[4] = self;
  objc_msgSend(v6, "dbRowID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[BRCPQLConnection fetchObject:sql:](clientDB, "fetchObject:sql:", v22, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND +zone_rowid = %@ ORDER BY item_id"), v15, v17);
  return v18;
}

id __70__BRCAccountSessionFPFS_ItemFetching__localAliasForSharedItem_inZone___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (id)itemByItemGlobalID:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  BRCZoneRootItem *v10;
  id v11;
  BRCZoneRootItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNonDesktopRoot");

  if (v9)
  {
    v10 = [BRCZoneRootItem alloc];
    objc_msgSend(v7, "itemID");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v12 = -[BRCZoneRootItem initWithZoneRootItemID:session:](v10, "initWithZoneRootItemID:session:", v11, self);
  }
  else
  {
    objc_msgSend(v7, "zoneRowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS serverZoneByRowID:](self, "serverZoneByRowID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __61__BRCAccountSessionFPFS_ItemFetching__itemByItemGlobalID_db___block_invoke;
    v19[3] = &unk_24FE40038;
    v20 = v15;
    v21 = v6;
    v11 = v15;
    objc_msgSend(v7, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (BRCZoneRootItem *)objc_msgSend(v21, "fetchObject:sql:", v19, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v16, v17);
  }

  return v12;
}

id __61__BRCAccountSessionFPFS_ItemFetching__itemByItemGlobalID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)itemByItemGlobalID:(id)a3
{
  return -[BRCAccountSessionFPFS itemByItemGlobalID:db:](self, "itemByItemGlobalID:db:", a3, self->_clientDB);
}

- (BOOL)globalID:(id)a3 isStrictChildOfGlobalID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  BOOL v12;
  BRCPQLConnection *clientDB;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  BRCItemGlobalID *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  BRCAccountSessionFPFS *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maxSyncPathDepth");

  if ((objc_msgSend(v6, "isEqualToItemGlobalID:", v7) & 1) != 0
    || (objc_msgSend(v6, "itemID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isNonDesktopRoot"),
        v10,
        (v11 & 1) != 0))
  {
    v12 = 0;
  }
  else
  {
    clientDB = self->_clientDB;
    objc_msgSend(v6, "zoneRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BRCPQLConnection fetch:](clientDB, "fetch:", CFSTR("WITH RECURSIVE item_parents (item_id, zone_rowid) AS(    SELECT item_parent_id, item_parent_zone_rowid FROM client_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid FROM client_items AS li INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT item_id, zone_rowid FROM item_parents WHERE item_id_is_root(item_id) OR (item_id = %@ AND zone_rowid = %@) LIMIT 1"), v14, v15, v9, v16, v17);

    if ((objc_msgSend(v18, "next") & 1) != 0)
    {
      objc_msgSend(v18, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberAtIndex:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v20, v19);
      v12 = -[BRCItemGlobalID isEqualToItemGlobalID:](v21, "isEqualToItemGlobalID:", v7);

    }
    else
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413314;
        v29 = self;
        v30 = 1024;
        v31 = v9;
        v32 = 2112;
        v33 = v7;
        v34 = 2112;
        v35 = v6;
        v36 = 2112;
        v37 = v22;
        _os_log_fault_impl(&dword_230455000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because the hierarchy is deeper than %u under %@ when looking for %@%@", buf, 0x30u);
      }

      objc_msgSend(v6, "zoneRowID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS serverZoneByRowID:](self, "serverZoneByRowID:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "clientZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "scheduleResetServerAndClientTruthsForReason:", CFSTR("hierarchy-too-deep"));

      v12 = 0;
    }

  }
  return v12;
}

- (void)enumerateItemsWithShareIDUnderParent:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(id, void *, uint64_t, _BYTE *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BRCItemGlobalID *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  _BYTE v40[128];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, uint64_t, _BYTE *))a4;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxFolderEnumerationCount");

  LODWORD(v7) = objc_msgSend(v5, "isZoneRoot");
  v9 = (void *)MEMORY[0x24BEDD638];
  objc_msgSend(v5, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dbRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if ((_DWORD)v7)
    v14 = CFSTR("item_parent_zone_rowid = %@ AND item_parent_id = %@");
  else
    v14 = CFSTR("zone_rowid = %@ AND item_id = %@");
  objc_msgSend(v9, "formatInjection:", v14, v11, v12);
  v15 = objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v34 = v5;
  objc_msgSend(v5, "db");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v15;
  v17 = (void *)objc_msgSend(v16, "fetch:", CFSTR("WITH RECURSIVE item_children_with_shared_items (item_id, zone_rowid, shared_items_count) AS(    SELECT item_id, zone_rowid, (shared_by_me_count | shared_to_me_count) FROM item_recursive_properties      WHERE %@ AND (shared_by_me_count | shared_to_me_count) != 0  UNION ALL     SELECT ip.item_id, ip.zone_rowid, (ip.shared_by_me_count | ip.shared_to_me_count) FROM item_recursive_properties AS ip INNER JOIN item_children_with_shared_items AS p WHERE ip.item_parent_id = p.item_id AND ip.item_parent_zone_rowid = p.zone_rowid AND (ip.shared_by_me_count | ip.shared_to_me_count) != 0      LIMIT %llu) SELECT ic.item_id, ic.zone_rowid, li.item_sharing_options FROM item_children_with_shared_items AS ic INNER JOIN client_items AS li WHERE ic.shared_items_count = 1 AND li.item_id = ic.item_id AND li.zone_rowid = ic.zone_rowid AND (li.item_sharing_options & 4) != 0"), v15, v8);

  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v17, "next"))
  {
    do
    {
      objc_msgSend(v17, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectOfClass:atIndex:", objc_opt_class(), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (int)objc_msgSend(v17, "intAtIndex:", 2);
      v22 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v20, v19);
      v41[0] = v22;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v24);

    }
    while ((objc_msgSend(v17, "next") & 1) != 0);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v18;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
LABEL_8:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v28)
        objc_enumerationMutation(v25);
      if (v39)
        break;
      v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v29);
      objc_msgSend(v30, "objectAtIndex:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndex:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v31, objc_msgSend(v32, "unsignedLongValue"), &v39);

      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v27)
          goto LABEL_8;
        break;
      }
    }
  }

}

- (void)enumerateContainersWithDB:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15[3];

  v6 = a3;
  v7 = a4;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(ItemFetching) enumerateContainersWithDB:handler:]", 320, v15);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCAccountSessionFPFS(ItemFetching) enumerateContainersWithDB:handler:].cold.1(v15, (uint64_t)v8, v9);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__BRCAccountSessionFPFS_ItemFetching__enumerateContainersWithDB_handler___block_invoke;
  v12[3] = &unk_24FE49A60;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  -[BRCAccountSessionFPFS enumerateAppLibraries:](self, "enumerateAppLibraries:", v12);

  __brc_leave_section(v15);
}

uint64_t __73__BRCAccountSessionFPFS_ItemFetching__enumerateContainersWithDB_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "containerMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRootItemInDB:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCNotification notificationFromItem:](BRCNotification, "notificationFromItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE17670], "containerItemForContainer:withRepresentativeItem:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 1;
}

- (id)_containerMetadataRecordsToSaveWithBatchSize:(unint64_t)a3 requestID:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  BRCAccountSessionFPFS *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPQLConnection serialQueue](self->_clientDB, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke;
  v16 = &unk_24FE4A0B0;
  v17 = self;
  v18 = v7;
  v19 = a4;
  v20 = a3;
  v9 = v7;
  dispatch_sync(v8, &v13);

  if (objc_msgSend(v9, "count", v13, v14, v15, v16, v17))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

void __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2;
  v5[3] = &unk_24FE4A088;
  v7 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v8 = v4;
  objc_msgSend(v2, "enumerateAppLibraries:", v5);

}

uint64_t __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = a2;
  if ((objc_msgSend(v3, "shouldSaveContainerMetadataServerside") & 1) == 0)
  {
    objc_msgSend(v3, "setContainerMetadataNeedsSyncUp:", 0);
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  if (!objc_msgSend(v3, "containerMetadataNeedsSyncUp"))
    goto LABEL_10;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2_cold_1(v3, (uint64_t)v4, v5);

  objc_msgSend(v3, "setContainerMetadataSyncRequestID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDB91D8], "brc_containerMetadataRecordWithContainer:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  v8 = *(_QWORD *)(a1 + 48);

  if (v7 < v8)
    goto LABEL_10;
  v9 = 0;
LABEL_11:

  return v9;
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] API MISUSE: is_parented_or_equal_to(Container, parent_id, parentId_or_Set)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: we have a cycle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[DEBUG] recursive update of %lld%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0(&dword_230455000, a4, a3, "[CRIT] %@%@", (uint8_t *)a3);

}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Saving client state data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: sself%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_229_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Saved zone state for %@%@");
  OUTLINED_FUNCTION_0();
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_231_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Saved app library state for %@%@");
  OUTLINED_FUNCTION_0();
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] ┏%llx db post flush%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_241_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Ciconia DB was likely dropped - domain removal will happen on next start%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_241_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] disk is full, restarting: %@%@", v1);
  OUTLINED_FUNCTION_0();
}

void __170__BRCAccountSessionFPFS_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke_cold_1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(*v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_230455000, v2, v3, "[CRIT] UNREACHABLE: Failed to enable recursive triggers - %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] disk is full - will fail%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __90__BRCAccountSessionFPFS_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_230455000, a2, a3, "[ERROR] Failed opening file handle%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Failed adopting persona %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_80_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] Items in error - import won't complete%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_2_cold_1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_230455000, v1, (os_log_type_t)0x90u, "[ERROR] FPFS Migration recovery failed: %@%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Triggering TTR due to stuck migration%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_cold_2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Sending FPFS Import status telemetry event (%@)%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __80__BRCAccountSessionFPFS_FPFSAdditions___triggerFPFSImportFinishedTelemetryEvent__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Running post import analysis to validate import success for domain: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)registerClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![_xpcClients containsObject:client]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)unregisterClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [_xpcClients containsObject:client]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createAccountSupportPathIfNeeded:protectParent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] permissions checked%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createAccountSupportPathIfNeeded:(uint64_t)a1 protectParent:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] '%@' already exists%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __58__BRCAccountSessionFPFS__clearLegacyConflictVersionsAsync__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] Clearing Legacy Conflict Versions Due To Migration to FPFS%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_addOrImportDomainIfNeededWithError:domainAdded:domainImported:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Can't get persona for accountID %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_createGroupContainerStageOfType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Running in sync bubble. Should not try to create the group container download stage folder%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)openWithError:(uint64_t)a3 pushWorkloop:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_4_0(&dword_230455000, v6, v4, "[CRIT] %@%@", v5);

}

- (void)openWithError:pushWorkloop:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: defaultAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)openWithError:(uint64_t)a1 pushWorkloop:.cold.4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] flocking '%@'%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)openWithError:pushWorkloop:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_isOpen%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Failed to set the xpc activity state to done%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Checking for items that need pcs chaining%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_136_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Failed to defer the pcs chain state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Failed to defer the activity state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_143_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] failed to defer the activity state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Checking for items that need salting%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_152_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Failed to defer the salting state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_reportBasehashSalting
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: rs.next%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: itemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Done Force Ingestion root container to update the contentPolicy - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_recoverAndReportStateIntegrityWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Starting _recoverAndReportStateIntegrity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] failed to continue the pcs chain state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_201_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] failed to continue the salting state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_209_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Fixing up bounced and staged items%@");
  OUTLINED_FUNCTION_0();
}

void __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_211_cold_1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: side car forgot to schedule sync up throttle %@!%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)accountWaitOperation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _accountWaitOperation.operationFailureThrottle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)captureSessionOpenFailedInfoWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Failed to create %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)closeAndResetLocalStateWithDescription:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: hasDB%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: directoryURL is nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_unlinkContainersWithRootURL:containers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Calculating pristineContainerIDs before logout.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_unlinkContainersWithRootURL:containers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isOpen The session must be open in order to calculate pristine containers%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] did reset TCC access%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_249_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] done deleting local account data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx loading shared server zones%@");
  OUTLINED_FUNCTION_0();
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx loading server zones%@");
  OUTLINED_FUNCTION_0();
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_251_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx registering and activating zones%@");
  OUTLINED_FUNCTION_0();
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_251_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx loading shared client zones%@");
  OUTLINED_FUNCTION_0();
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_251_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx loading client zones%@");
  OUTLINED_FUNCTION_0();
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_256_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] activating %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4_0(&dword_230455000, a3, (uint64_t)a3, "[CRIT] UNREACHABLE: Found zoneRowID %lu which was skipped on load but is referenced by an item on DB%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)serverZoneByRowID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: serverZone.clientZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)serverZoneByRowID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: serverZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)enumeratePrivateServerZones:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: block%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)performBlock:whileRemovingPrivateClientZone:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "zoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] Deactivating private client zone %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)destroySharedClientZone:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Destroying shared client zone %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)destroySharedClientZone:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: sharedClientZone.state & BRCClientZoneStateWantsDataUnlinked%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)destroySharedClientZone:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: sharedClientZone.state & BRCClientZoneStateIsResetting%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] deleting shared zone and library for %@ from local db%@");
  OUTLINED_FUNCTION_0();
}

void __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_273_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] deleting shared container %@ from server db%@");
  OUTLINED_FUNCTION_0();
}

- (void)appLibraryByRowID:.cold.1()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "unsignedLongLongValue");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, v2, "[CRIT] UNREACHABLE: can't find app library for %lld%@", v3);
}

- (void)__getOrCreateServerZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: serverZone.dbRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)__getOrCreateServerZone:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Created server zone: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)__getOrCreateServerZone:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] server zone already exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)__getOrCreateClientZone:withServerZone:alreadyExists:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [clientZone.dbRowID br_isEqualToNumber:serverZone.dbRowID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)__getOrCreateClientZone:(uint64_t)a1 withServerZone:alreadyExists:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Created client zone: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)__getOrCreateClientZone:withServerZone:alreadyExists:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] client zone already exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)__getOrCreateAppLibrary:rowID:alreadyExists:withClientZone:createCZMMoved:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] app library already exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No db rowID on an app library or server zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No mangledID on a server zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no zone name on a server zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: isShared == (appLibrary == nil)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(uint64_t)a1 creationFlags:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: invalid containerID: %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

void __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_279_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't find the default client zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)getOrCreateSharedZones:shareAcceptOp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: mangledID.isShared%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)getOrReserveLibraryRowIDForLibrary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't reserve library rowID for a shared zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] fetching the user record id because it wasn't set in the client state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)cachedCurrentUserRecordName
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: userRecordName != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_cloudDocsAppsListDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Running in sync bubble. Ignoring app list did change event%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_cloudDocsAppsListDidChange:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx CloudDocs apps list did change%@");
  OUTLINED_FUNCTION_0();
}

void __52__BRCAccountSessionFPFS_cloudDocsAppsListDidChange___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Couldn't change personas during app list refresh%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Done Force Ingestion root container to update the contentPolicy%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "rootFileObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] Done Force Ingestion AppLibrary %@ to update the contentPolicy%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)isGreedy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] greediness enforced because optimize storage is disabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)sessionDirPath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: sessionDirPath was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)cacheDirPath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: cacheDirPath was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)applyScheduler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: applyScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)containerScheduler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: containerScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)fsImporter
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: fsImporter was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)notificationManager
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: notificationManager was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)stageRegistry
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: stageRegistry was accessed after being closed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "containerMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] preparing to sync up %@%@", v6);

}

@end
