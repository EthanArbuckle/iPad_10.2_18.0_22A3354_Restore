@implementation BRCAppLibrary

- (BRCPrivateClientZone)defaultClientZone
{
  return (BRCPrivateClientZone *)objc_loadWeakRetained((id *)&self->_defaultClientZone);
}

- (BOOL)isForeground
{
  void *v2;
  char v3;

  -[BRCAppLibrary transferSyncContextIfExists](self, "transferSyncContextIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForeground");

  return v3;
}

- (BRCSyncContext)transferSyncContextIfExists
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCAccountSessionFPFS syncContextProvider](self->_session, "syncContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary mangledID](self, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferSyncContextForMangledID:createIfNeeded:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCSyncContext *)v5;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (NSString)appLibraryID
{
  return self->_appLibraryID;
}

uint64_t __72__BRCAppLibrary__removeAllTargetSharedServerZonesWhenNoLongerForeground__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "removeForegroundClient:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
}

void __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
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
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  objc_msgSend(v4, "_targetSharedServerZonesEnumerator");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v2;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x2348B9F14](v11);
        objc_msgSend(*v3, "_addTargetSharedServerZone:", v15, (_QWORD)v19);
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      v12 = v11;
    }
    while (v11);
  }

  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke_cold_1((uint64_t)v3, (uint64_t)v17, v18);

}

void __40__BRCAppLibrary_removeForegroundClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 81))
  {
    objc_msgSend(*(id *)(v1 + 56), "syncContextProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedMetadataSyncContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeForegroundClient:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = 0;

  }
}

void __37__BRCAppLibrary_addForegroundClient___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v1 = (_QWORD *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "zoneHasShareAlias"))
  {
    *(_BYTE *)(*v1 + 81) = 1;
    objc_msgSend(*(id *)(*v1 + 56), "syncContextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sharedMetadataSyncContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addForegroundClient:", *v1);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __37__BRCAppLibrary_addForegroundClient___block_invoke_cold_1(v1);

  }
}

- (BOOL)zoneHasShareAlias
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT EXISTS (SELECT 1 FROM server_items WHERE zone_rowid = %@ AND item_type = 3 AND item_alias_target like '%%:\\_%%' ESCAPE '\\')"), self->_dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BRCSyncContext)transferSyncContext
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCAccountSessionFPFS syncContextProvider](self->_session, "syncContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary mangledID](self, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferSyncContextForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCSyncContext *)v5;
}

- (void)removeForegroundClient:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  BRCAppLibrary *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary addForegroundClient:].cold.3();

  }
  v5 = self;
  objc_sync_enter(v5);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v5;
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v6;
    _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - removing foreground client %@%@", buf, 0x20u);
  }

  v8 = -[NSMutableSet count](v5->_foregroundClients, "count");
  if ((-[NSMutableSet containsObject:](v5->_foregroundClients, "containsObject:", v4) & 1) == 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary removeForegroundClient:].cold.2();

  }
  -[NSMutableSet removeObject:](v5->_foregroundClients, "removeObject:", v4);
  if (v8 && !-[NSMutableSet count](v5->_foregroundClients, "count"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary removeForegroundClient:].cold.1();

    -[BRCAppLibrary _removeAllTargetSharedServerZonesWhenNoLongerForeground](v5, "_removeAllTargetSharedServerZonesWhenNoLongerForeground");
    -[BRCAppLibrary defaultClientZone](v5, "defaultClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "removeForegroundClient:", v5);
    -[BRCAppLibrary transferSyncContext](v5, "transferSyncContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeForegroundClient:", v5);
    -[BRCAccountSessionFPFS clientDB](v5->_session, "clientDB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serialQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __40__BRCAppLibrary_removeForegroundClient___block_invoke;
    v20[3] = &unk_24FE3FA18;
    v20[4] = v5;
    dispatch_async_with_logs_2(v15, v20);

  }
  objc_sync_exit(v5);

}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[BRCAppLibrary mangledID](self, "mangledID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mangledIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)hash
{
  return -[BRMangledID hash](self->_mangledID, "hash");
}

- (BOOL)hasActiveRecursiveQueries
{
  unint64_t v2;

  v2 = atomic_load(&self->_activeRecursiveQueries);
  return v2 != 0;
}

- (BOOL)hasActiveQueries
{
  unint64_t v2;

  v2 = atomic_load(&self->_activeQueries);
  return v2 != 0;
}

- (id)fetchRootItemInDB:(id)a3
{
  void *v4;
  id v5;
  BRCZoneRootItem *v6;
  void *v7;
  NSObject *v8;

  -[BRCAppLibrary dbRowID](self, "dbRowID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:]([BRCItemID alloc], "_initAsLibraryRootWithAppLibraryRowID:", v4);
    v6 = -[BRCZoneRootItem initWithZoneRootItemID:session:]([BRCZoneRootItem alloc], "initWithZoneRootItemID:session:", v5, self->_session);

  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary fetchRootItemInDB:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[BRCAppLibrary descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (id)descriptionWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = [v4 alloc];
  -[BRCAppLibrary _unwrappedDescriptionWithContext:](self, "_unwrappedDescriptionWithContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("<%@>"), v7);
  return v8;
}

- (BRCALRowID)dbRowID
{
  return self->_dbRowID;
}

- (BRContainer)containerMetadata
{
  return self->_containerMetadata;
}

- (BOOL)containerMetadataNeedsSyncUp
{
  return self->_containerMetadataNeedsSyncUp;
}

- (id)containerMetadataFilledWithTCCInfo
{
  void *v2;
  void *v3;

  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCDaemonContainerHelper sharedHelper](BRCDaemonContainerHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsCloudSyncTCCDisabled:", objc_msgSend(v3, "cloudSyncTCCDisabledForContainerMeta:", v2));

  return v2;
}

- (NSString)containerMetadataEtag
{
  return self->_containerMetadataEtag;
}

- (void)addForegroundClient:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BRCAppLibrary *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  BRCAppLibrary *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary addForegroundClient:].cold.3();

  }
  v5 = self;
  objc_sync_enter(v5);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v5;
    v27 = 2112;
    v28 = v4;
    v29 = 2112;
    v30 = v6;
    _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - adding foreground client %@%@", buf, 0x20u);
  }

  v8 = -[NSMutableSet count](v5->_foregroundClients, "count");
  if (-[NSMutableSet containsObject:](v5->_foregroundClients, "containsObject:", v4))
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary addForegroundClient:].cold.2();

  }
  -[NSMutableSet addObject:](v5->_foregroundClients, "addObject:", v4);
  if (!v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary addForegroundClient:].cold.1();

    -[BRCAppLibrary _resolveTargetSharedClientZonesWhenBecameForeground](v5, "_resolveTargetSharedClientZonesWhenBecameForeground");
    -[BRCAppLibrary defaultClientZone](v5, "defaultClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isCloudDocsZone")
      && (-[BRCAppLibrary mangledID](v5, "mangledID"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v13),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "shouldBoostDefaultZone"),
          v14,
          v13,
          (v15 & 1) == 0))
    {
      brc_bread_crumbs();
      v16 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_230455000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Preventing boosting default server zone%@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v12, "addForegroundClient:", v5);
    }
    -[BRCAppLibrary transferSyncContext](v5, "transferSyncContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addForegroundClient:", v5);
    if (!-[NSMutableSet count](v5->_targetSharedServerZones, "count"))
    {
      -[BRCPQLConnection serialQueue](v5->_db, "serialQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __37__BRCAppLibrary_addForegroundClient___block_invoke;
      v24[3] = &unk_24FE3FA18;
      v24[4] = v5;
      dispatch_async_with_logs_2(v19, v24);

    }
  }
  objc_sync_exit(v5);

}

- (id)_unwrappedDescriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString *appLibraryID;
  BRCALRowID *dbRowID;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t saltingState;
  const __CFString *v25;
  NSData *childBasehashSalt;
  void *v27;
  void *v28;

  v4 = a3;
  -[BRCAppLibrary transferSyncContextIfExists](self, "transferSyncContextIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[BRCAppLibrary isForeground](self, "isForeground"))
    {
      v6 = CFSTR("foreground");
      v7 = 7;
      goto LABEL_7;
    }
    v6 = CFSTR("background");
  }
  else
  {
    v6 = CFSTR("NA");
  }
  v7 = 2;
LABEL_7:
  +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD16A8]);
  appLibraryID = self->_appLibraryID;
  dbRowID = self->_dbRowID;
  BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&applibrary_state_entries, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@[%@] %@ {s:%@} ino:%@ gen:%@"), appLibraryID, dbRowID, v8, v12, self->_fileID, self->_generationID);

  objc_msgSend(v13, "appendString:", CFSTR(" queries:"));
  if (-[BRCAppLibrary hasActiveQueries](self, "hasActiveQueries"))
    objc_msgSend(v13, "appendString:", CFSTR("q"));
  if (-[BRCAppLibrary hasActiveRecursiveQueries](self, "hasActiveRecursiveQueries"))
    objc_msgSend(v13, "appendString:", CFSTR("r"));
  if (-[BRCAppLibrary containerMetadataNeedsSyncUp](self, "containerMetadataNeedsSyncUp"))
    v14 = "needs-sync-up";
  else
    v14 = "idle";
  -[BRCAppLibrary containerMetadataEtag](self, "containerMetadataEtag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shortDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR(" metadata:%s etag:%@ %@"), v14, v15, v17);

  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" bundles:{%@}"), v21);

  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "supportsEnhancedDrivePrivacy");

  if (v23)
  {
    saltingState = (int)self->_saltingState;
    if (saltingState > 3)
      v25 = CFSTR("no server item");
    else
      v25 = off_24FE428E0[saltingState];
    objc_msgSend(v13, "appendFormat:", CFSTR(" salt-st{%@}"), v25);
    childBasehashSalt = self->_childBasehashSalt;
    if (childBasehashSalt)
    {
      -[NSData brc_truncatedSHA256](childBasehashSalt, "brc_truncatedSHA256");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "brc_hexadecimalString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendFormat:", CFSTR(" child-base-salt-validation{%@}"), v28);

    }
  }

  return v13;
}

- (id)_targetSharedServerZonesEnumerator
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT DISTINCT ci.zone_rowid FROM client_items AS ci INNER JOIN client_zones AS cz ON ci.zone_rowid = cz.rowid WHERE ci.app_library_rowid = %@   AND ci.item_state IN (0)   AND (ci.item_sharing_options & 4) != 0   AND cz.zone_owner != %@"), self->_dbRowID, *MEMORY[0x24BDB8E88]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__BRCAppLibrary__targetSharedServerZonesEnumerator__block_invoke;
  v6[3] = &unk_24FE40010;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_resolveTargetSharedClientZonesWhenBecameForeground
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] resolving target shared zones for app library %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_removeAllTargetSharedServerZonesWhenNoLongerForeground
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _foregroundClients.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (id)rootFileObjectID
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE17618]), "initWithRowID:type:", -[BRCALRowID unsignedLongLongValue](self->_dbRowID, "unsignedLongLongValue"), 1);
}

- (id)documentsFolderFileObjectID
{
  void *v3;
  void *v4;
  NSObject *v5;

  if (-[BRCAppLibrary includesDataScope](self, "includesDataScope"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17618]), "initWithRowID:type:", -[BRCALRowID unsignedLongValue](self->_dbRowID, "unsignedLongValue"), 4);
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary(FPFSAdditions) documentsFolderFileObjectID].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)documentsFolder
{
  void *v3;
  void *v4;

  -[BRCAppLibrary db](self, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary documentsFolderWithDB:](self, "documentsFolderWithDB:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)documentsFolderWithDB:(id)a3
{
  id v4;
  BRCItemGlobalID *v5;
  void *v6;
  void *v7;
  BRCItemGlobalID *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[BRCAppLibrary includesDataScope](self, "includesDataScope"))
  {
    v5 = [BRCItemGlobalID alloc];
    -[BRCAppLibrary zoneRowID](self, "zoneRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAppLibrary documentsFolderItemID](self, "documentsFolderItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v5, "initWithZoneRowID:itemID:", v6, v7);

    -[BRCAccountSessionFPFS itemByItemGlobalID:db:](self->_session, "itemByItemGlobalID:db:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[BRCAppLibrary fetchRootItem](self, "fetchRootItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)createDocumentsFolder
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[BRCAppLibrary session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fsImporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE17578];
  -[BRCAppLibrary fetchRootItem](self, "fetchRootItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createAndImportNewDirectoryWithLogicalName:parentItem:error:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)recreateDocumentsFolderIfNeededInDB
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v7;
  NSObject *v8;
  BRMangledID *mangledID;
  uint64_t v10[3];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  BRMangledID *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[BRCAppLibrary includesDataScope](self, "includesDataScope"))
    return 1;
  -[BRCAppLibrary documentsFolder](self, "documentsFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_7:

    return 1;
  }
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"-[BRCAppLibrary(FPFSAdditions) recreateDocumentsFolderIfNeededInDB]", 62, v10);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)buf = 134218498;
    v12 = v10[0];
    v13 = 2112;
    v14 = mangledID;
    v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating a documents folder for app library %@%@", buf, 0x20u);
  }

  -[BRCAppLibrary createDocumentsFolder](self, "createDocumentsFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    __brc_leave_section(v10);
    goto LABEL_7;
  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    -[BRCAppLibrary(FPFSAdditions) recreateDocumentsFolderIfNeededInDB].cold.1((uint64_t)self, (uint64_t)v7, v8);

  __brc_leave_section(v10);
  return 0;
}

- (void)registerQueryIsRecursive:(BOOL)a3
{
  unint64_t *p_activeQueries;
  unint64_t v4;
  unint64_t *p_activeRecursiveQueries;
  unint64_t v6;

  p_activeQueries = &self->_activeQueries;
  do
    v4 = __ldaxr(p_activeQueries);
  while (__stlxr(v4 + 1, p_activeQueries));
  if (a3)
  {
    p_activeRecursiveQueries = &self->_activeRecursiveQueries;
    do
      v6 = __ldaxr(p_activeRecursiveQueries);
    while (__stlxr(v6 + 1, p_activeRecursiveQueries));
  }
}

- (void)unregisterQueryIsRecursive:(BOOL)a3
{
  unint64_t *p_activeRecursiveQueries;
  unint64_t v4;
  unint64_t *p_activeQueries;
  unint64_t v6;

  if (a3)
  {
    p_activeRecursiveQueries = &self->_activeRecursiveQueries;
    do
      v4 = __ldaxr(p_activeRecursiveQueries);
    while (__stlxr(v4 - 1, p_activeRecursiveQueries));
  }
  p_activeQueries = &self->_activeQueries;
  do
    v6 = __ldaxr(p_activeQueries);
  while (__stlxr(v6 - 1, p_activeQueries));
}

- (id)_recursivelyDeleteItemsUnderItemID:(id)a3 filterPredicate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[BRCAppLibrary enumerateChildrenOfItemGlobalID:sortOrder:offset:limit:db:](self, "enumerateChildrenOfItemGlobalID:sortOrder:offset:limit:db:", a3, 0, 0, 0xFFFFFFFFLL, self->_db);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v26;
    *(_QWORD *)&v9 = 138412546;
    v24 = v9;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v6, "evaluateWithObject:", v13, v24))
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            v30 = v13;
            v31 = 2112;
            v32 = v14;
            _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Recurisvely deleting %@%@", buf, 0x16u);
          }

          objc_msgSend(v13, "markRemovedFromFilesystemRecursively:", 1);
          if ((objc_msgSend(v13, "saveToDB") & 1) == 0)
          {
            objc_msgSend(v13, "db");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lastError");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              v20 = v18;
            }
            else
            {
              brc_bread_crumbs();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
                -[BRCAppLibrary(FPFSAdditions) _recursivelyDeleteItemsUnderItemID:filterPredicate:].cold.1((uint64_t)v21, v22);

              objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Failed to save to db without an error"));
              v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            v16 = v20;

            goto LABEL_19;
          }
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (id)deleteAppLibrary
{
  void *v3;
  NSObject *v4;
  BRCPQLConnection *db;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCAppLibrary(FPFSAdditions) deleteAppLibrary].cold.1();

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke;
  v8[3] = &unk_24FE3F3F0;
  v8[4] = self;
  v8[5] = &v9;
  -[BRCPQLConnection groupInBatch:](db, "groupInBatch:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "includesDataScope") & 1) == 0)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "rootItemGlobalID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_recursivelyDeleteItemsUnderItemID:filterPredicate:", v13, v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    brc_bread_crumbs();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "rootItemGlobalID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412802;
      v28 = v25;
      v29 = 2112;
      v30 = (uint64_t)v4;
      v31 = 2112;
      v32 = v15;
      _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Recursively delete items under rootItemGlobalID %@ - %@%@", (uint8_t *)&v27, 0x20u);

    }
    goto LABEL_12;
  }
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke_cold_1((uint64_t)v2, v3);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "rootItemGlobalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_recursivelyDeleteItemsUnderItemID:filterPredicate:", v6, v4);
  v7 = objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "rootItemGlobalID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412802;
    v28 = v24;
    v29 = 2112;
    v30 = v7;
    v31 = 2112;
    v32 = v8;
    _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Recursively delete items under rootItemGlobalID %@ - %@%@", (uint8_t *)&v27, 0x20u);

  }
  if (v7)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v7;

    return;
  }
  v17 = *(void **)(a1 + 32);
  objc_msgSend(v17, "documentsFolder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "itemGlobalID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_recursivelyDeleteItemsUnderItemID:filterPredicate:", v19, v20);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "rootItemGlobalID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412802;
    v28 = v26;
    v29 = 2112;
    v30 = (uint64_t)v15;
    v31 = 2112;
    v32 = v21;
    _os_log_debug_impl(&dword_230455000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Recursively delete items under rootItemGlobalID %@ - %@%@", (uint8_t *)&v27, 0x20u);

  }
  if (v15)
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = v15;
    v16 = *(NSObject **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v15;
LABEL_12:

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "flush");
}

uint64_t __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDocumentsFolder") ^ 1;

  return v3;
}

- (NSString)logName
{
  return self->_appLibraryID;
}

- (BOOL)isCloudDocsAppLibrary
{
  return -[NSString isEqualToString:](self->_appLibraryID, "isEqualToString:", *MEMORY[0x24BE17550]);
}

- (BOOL)isDesktopAppLibrary
{
  return 0;
}

- (BOOL)isDocumentsAppLibrary
{
  return 0;
}

- (BOOL)isiCloudDesktopAppLibrary
{
  return -[BRCAppLibrary isDesktopAppLibrary](self, "isDesktopAppLibrary")
      || -[BRCAppLibrary isDocumentsAppLibrary](self, "isDocumentsAppLibrary");
}

- (unint64_t)syncedFolderType
{
  return 1;
}

- (BOOL)includesDataScope
{
  return !-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary");
}

- (BOOL)rootRecordCreated
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (void)setNeedsSave:(BOOL)a3
{
  void *v5;
  NSObject *v6;

  if (self->_needsSave != a3)
  {
    if (a3)
    {
      -[BRCPQLConnection forceBatchStart](self->_db, "forceBatchStart");
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary setNeedsSave:].cold.1();

    }
    self->_needsSave = a3;
  }
}

- (NSString)absolutePath
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "br_currentMobileDocumentsDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary pathRelativeToRoot](self, "pathRelativeToRoot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] no path for an app library%@", (uint8_t *)&v10, 0xCu);
    }

  }
  return (NSString *)v5;
}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[BRCAppLibrary absolutePath](self, "absolutePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v2, 1);
  else
    v3 = 0;

  return (NSURL *)v3;
}

- (BRCAppLibrary)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[BRCAppLibrary init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (BRCAppLibrary)initWithMangledID:(id)a3 dbRowID:(id)a4 zoneRowID:(id)a5 db:(id)a6 plist:(id)a7 session:(id)a8 initialCreation:(BOOL)a9 createdRootOnDisk:(BOOL)a10 createdCZMMoved:(BOOL)a11 rootFileID:(id)a12 childBasehashSalt:(id)a13 saltingState:(unsigned int)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BRCAppLibrary *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  brc_task_tracker *tracker;
  uint64_t v31;
  NSMutableSet *targetSharedServerZones;
  uint64_t v33;
  NSMutableSet *foregroundClients;
  uint64_t v35;
  NSString *appLibraryID;
  unsigned int state;
  id v38;
  uint64_t v39;
  BRContainer *containerMetadata;
  dispatch_group_t v41;
  OS_dispatch_group *forceIngestionGroup;
  id v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  NSObject *v52;
  id v53;
  void *v54;
  NSObject *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id obj;
  id v63;
  id v64;
  id v65;
  objc_super v66;

  v20 = a3;
  v21 = a4;
  obj = a5;
  v22 = a5;
  v65 = a6;
  v23 = a7;
  v64 = a8;
  v63 = a12;
  v24 = a13;
  if (v21)
  {
    if (v22)
      goto LABEL_3;
    goto LABEL_20;
  }
  v58 = v23;
  v44 = v22;
  brc_bread_crumbs();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.1();

  v22 = v44;
  v23 = v58;
  if (!v22)
  {
LABEL_20:
    v59 = v23;
    v47 = v22;
    brc_bread_crumbs();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.4();

    v22 = v47;
    v23 = v59;
  }
LABEL_3:
  if ((objc_msgSend(v20, "isPrivate") & 1) == 0)
  {
    v60 = v23;
    v50 = v22;
    brc_bread_crumbs();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.3();

    v22 = v50;
    v23 = v60;
  }
  v66.receiver = self;
  v66.super_class = (Class)BRCAppLibrary;
  v25 = -[BRCAppLibrary init](&v66, sel_init);
  if (v25)
  {
    v56 = v22;
    v57 = v23;
    if (v23 && a9)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.2();

    }
    objc_msgSend(v20, "appLibraryOrZoneName");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    brc_task_tracker_create((const char *)objc_msgSend(v28, "UTF8String"));
    v29 = objc_claimAutoreleasedReturnValue();
    tracker = v25->_tracker;
    v25->_tracker = (brc_task_tracker *)v29;

    objc_storeStrong((id *)&v25->_db, a6);
    objc_storeStrong((id *)&v25->_dbRowID, a4);
    objc_storeStrong((id *)&v25->_zoneRowID, obj);
    objc_storeStrong((id *)&v25->_session, a8);
    v31 = objc_opt_new();
    targetSharedServerZones = v25->_targetSharedServerZones;
    v25->_targetSharedServerZones = (NSMutableSet *)v31;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v33 = objc_claimAutoreleasedReturnValue();
    foregroundClients = v25->_foregroundClients;
    v25->_foregroundClients = (NSMutableSet *)v33;

    objc_storeStrong((id *)&v25->_fileID, a12);
    objc_storeStrong((id *)&v25->_mangledID, a3);
    objc_msgSend(v20, "appLibraryOrZoneName");
    v35 = objc_claimAutoreleasedReturnValue();
    appLibraryID = v25->_appLibraryID;
    v25->_appLibraryID = (NSString *)v35;

    if (a9)
    {
      state = v25->_state;
      v25->_state = state | 0x140000;
      v23 = v57;
      v38 = a13;
      if (a11)
        v25->_state = state | 0x340000;
    }
    else
    {
      v23 = v57;
      v38 = a13;
      if (!v21)
      {
        v53 = v24;
        brc_bread_crumbs();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
          -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.1();

        v23 = v57;
        v24 = v53;
      }
      -[BRCAppLibrary updateWithPlist:](v25, "updateWithPlist:", v23);
    }
    objc_msgSend(MEMORY[0x24BE175F8], "containerForMangledID:", v20);
    v39 = objc_claimAutoreleasedReturnValue();
    containerMetadata = v25->_containerMetadata;
    v25->_containerMetadata = (BRContainer *)v39;

    -[BRCAppLibrary _updateIsInCloudDocsZone](v25, "_updateIsInCloudDocsZone");
    v25->_saltingState = a14;
    objc_storeStrong((id *)&v25->_childBasehashSalt, v38);
    v41 = dispatch_group_create();
    forceIngestionGroup = v25->_forceIngestionGroup;
    v25->_forceIngestionGroup = (OS_dispatch_group *)v41;

    v22 = v56;
  }

  return v25;
}

- (void)updateWithPlist:(id)a3
{
  id v4;
  void *v5;
  NSNumber *v6;
  NSNumber *fileID;
  NSNumber *v8;
  NSNumber *generationID;
  NSString *v10;
  NSString *containerMetadataEtag;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_state = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileID"));
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fileID = self->_fileID;
  self->_fileID = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("generationID"));
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  generationID = self->_generationID;
  self->_generationID = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadataChangetag"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  containerMetadataEtag = self->_containerMetadataEtag;
  self->_containerMetadataEtag = v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadataNeedsSyncUp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self->_containerMetadataNeedsSyncUp = objc_msgSend(v12, "BOOLValue");
  -[BRContainer setIsInInitialState:](self->_containerMetadata, "setIsInInitialState:", (-[BRCAppLibrary state](self, "state") >> 18) & 1);
}

- (void)associateWithClientZone:(id)a3
{
  -[BRCAppLibrary associateWithClientZone:offline:](self, "associateWithClientZone:offline:", a3, 0);
}

- (void)associateWithClientZone:(id)a3 offline:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  BRCAppLibrary *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  BRCZoneRowID *zoneRowID;

  v4 = a4;
  v6 = a3;
  if (!v4)
    -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (!v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary associateWithClientZone:offline:].cold.1();

  }
  v9 = self;
  objc_sync_enter(v9);
  if (-[NSMutableSet count](v9->_foregroundClients, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&v9->_defaultClientZone);
    objc_msgSend(WeakRetained, "serverZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeForegroundClient:", v9);

    objc_msgSend(v6, "serverZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addForegroundClient:", v9);

  }
  objc_storeWeak((id *)&v9->_defaultClientZone, v6);
  objc_msgSend(v6, "dbRowID");
  v13 = objc_claimAutoreleasedReturnValue();
  zoneRowID = v9->_zoneRowID;
  v9->_zoneRowID = (BRCZoneRowID *)v13;

  objc_sync_exit(v9);
  objc_msgSend(v6, "addAppLibrary:offline:", v9, v4);
  -[BRCAppLibrary _updateIsInCloudDocsZone](v9, "_updateIsInCloudDocsZone");

}

- (BOOL)isDocumentScopePublic
{
  void *v2;
  char v3;

  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDocumentScopePublic");

  return v3;
}

- (NSMutableDictionary)plist
{
  void *v3;
  void *v4;
  NSNumber *fileID;
  NSNumber *generationID;
  NSString *containerMetadataEtag;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 12);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("state"));

  fileID = self->_fileID;
  if (fileID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", fileID, CFSTR("fileID"));
  generationID = self->_generationID;
  if (generationID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", generationID, CFSTR("generationID"));
  containerMetadataEtag = self->_containerMetadataEtag;
  if (containerMetadataEtag)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", containerMetadataEtag, CFSTR("metadataChangetag"));
  if (self->_containerMetadataNeedsSyncUp)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("metadataNeedsSyncUp"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rootQuotaUsage, CFSTR("rootQuota"));
  return (NSMutableDictionary *)v3;
}

- (void)close
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "appLibraryID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] closing app library: %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (BOOL)isAppInstalled
{
  return (self->_state & 0x800000) == 0;
}

- (void)activate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_activated%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4
{
  void *v7;
  unsigned int state;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  char v23;
  id WeakRetained;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v41;
  void *v42;
  NSObject *v43;
  _QWORD v44[5];
  _QWORD v45[5];
  uint8_t buf[4];
  BRCAppLibrary *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 0x1000000 && (a3 & 0x1000000) != 0)
  {
    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary _activateState:origState:].cold.2();

  }
  if (self->_state != a3)
  {
    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
    self->_state = a3;
  }
  if (-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary")
    || -[BRCAppLibrary isiCloudDesktopAppLibrary](self, "isiCloudDesktopAppLibrary"))
  {
    state = self->_state & 0xFFFBFFFF;
    self->_state = state;
  }
  else
  {
    state = self->_state;
  }
  v9 = state ^ a4;
  if (state != a4)
  {
    if (self->_needsSave)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        BRCPrettyPrintBitmapWithContext(a4, (uint64_t)&applibrary_state_entries, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v47 = self;
        v48 = 2112;
        v49 = v41;
        v50 = 2112;
        v51 = v10;
        _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ state changed, was %@%@", buf, 0x20u);

      }
    }
    if ((v9 & 0x1000000) != 0 && (self->_state & 8) != 0)
      -[BRCAppLibrary reimportLibraryRootAndFinishResetWithCompletion:](self, "reimportLibraryRootAndFinishResetWithCompletion:", 0);
    if ((v9 & 0x80000) != 0 && (self->_state & 0x80000) == 0)
      objc_msgSend(v7, "scheduleSyncUp");
    if ((v9 & 0x1800000) == 0x800000)
    {
      -[BRCAppLibrary fetchRootItem](self, "fetchRootItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileObjectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "asString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __42__BRCAppLibrary__activateState_origState___block_invoke;
      v45[3] = &unk_24FE3F6A0;
      v45[4] = self;
      +[BRCImportUtil forceIngestionForItemID:completionHandler:](BRCImportUtil, "forceIngestionForItemID:completionHandler:", v14, v45);

      if ((a4 & 0x800000) == 0)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v47 = self;
          v48 = 2112;
          v49 = v16;
          _os_log_impl(&dword_230455000, v17, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting everything in %@ because the app was removed%@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x24BDC83F0], "br_sharedProviderManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAppLibrary rootFileObjectID](self, "rootFileObjectID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "asString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v15;
        v44[1] = 3221225472;
        v44[2] = __42__BRCAppLibrary__activateState_origState___block_invoke_22;
        v44[3] = &unk_24FE3F6A0;
        v44[4] = self;
        objc_msgSend(v18, "evictItemWithIdentifier:completionHandler:", v20, v44);

      }
    }
    if ((v9 & 0x40000) != 0)
    {
      v21 = -[BRCAppLibrary state](self, "state");
      -[BRContainer setIsInInitialState:](self->_containerMetadata, "setIsInInitialState:", (v21 >> 18) & 1);
      objc_msgSend(MEMORY[0x24BE175F8], "postContainerListUpdateNotification");
      if (-[BRContainer isInInitialState](self->_containerMetadata, "isInInitialState"))
      {
        if (-[NSString isEqualToString:](self->_appLibraryID, "isEqualToString:", *MEMORY[0x24BE172B0]))
        {
          -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "hasCompletedInitialSyncDownOnce");

          if ((v23 & 1) == 0)
            -[BRCAppLibrary addForegroundClient:](self, "addForegroundClient:", self);
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_pristineFetchOp);
      v25 = WeakRetained;
      if ((v21 & 0x40000) == 0 && WeakRetained)
      {
        objc_msgSend(WeakRetained, "endObservingChangesWithDelegate:", self);
        objc_storeWeak((id *)&self->_pristineFetchOp, 0);
      }

    }
    if ((v9 & 0x4000000) != 0 && (-[BRCAppLibrary state](self, "state") & 0x4000000) != 0)
    {
      v26 = -[BRCAppLibrary includesDataScope](self, "includesDataScope");
      if ((a4 & 0x1000000) == 0 && v26)
      {
        -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAppLibrary documentsFolderItemID](self, "documentsFolderItemID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "itemByItemID:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "asDirectory");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "clientZone");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "itemID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "serverItemByItemID:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "st");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v33)
        {
          objc_msgSend(v33, "st");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setType:", objc_msgSend(v36, "type"));

        }
        else
        {
          objc_msgSend(v34, "setType:", 0);
        }

        brc_bread_crumbs();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          -[BRCAppLibrary _activateState:origState:].cold.1();

        objc_msgSend(v30, "saveToDB");
      }
    }
    if ((-[BRCAppLibrary state](self, "state") & 0x4040000) == 0x40000)
      -[BRCAppLibrary fetchPristineness](self, "fetchPristineness");
    if ((v9 & 0x4000000) != 0 && (-[BRCAppLibrary state](self, "state") & 0x14000000) == 0x4000000)
      -[BRCAppLibrary fetchTrashItems](self, "fetchTrashItems");
    if ((a4 & 0x140000) != 0 && (v9 & 0x140000) != 0)
      objc_msgSend(v7, "scheduleSyncUp");
    if ((v9 & 0x200000) != 0 && !-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary"))
    {
      -[BRCAppLibrary zoneDidChangeMovedToCloudDocsState](self, "zoneDidChangeMovedToCloudDocsState");
      if (-[BRCAppLibrary wasMovedToCloudDocs](self, "wasMovedToCloudDocs"))
      {
        -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "didCompleteCrossZoneMigrationForAppLibrary:", self);

      }
    }
  }
  objc_msgSend(v7, "_flushIdleBlocksIfNeeded");

  return v9;
}

void __42__BRCAppLibrary__activateState_origState___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __42__BRCAppLibrary__activateState_origState___block_invoke_cold_1(a1, (uint64_t)v2, v3);

}

void __42__BRCAppLibrary__activateState_origState___block_invoke_22(uint64_t a1, void *a2)
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
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Finish evicting %@ with error %@%@", (uint8_t *)&v7, 0x20u);
  }

}

- (BOOL)setStateBits:(unsigned int)a3
{
  unsigned int state;
  BOOL v4;

  state = self->_state;
  v4 = (a3 & ~state) != 0;
  -[BRCAppLibrary _activateState:origState:](self, "_activateState:origState:", state | a3);
  return v4;
}

- (void)clearStateBits:(unsigned int)a3
{
  -[BRCAppLibrary _activateState:origState:](self, "_activateState:origState:", self->_state & ~a3);
}

- (void)didUpdateDocumentScopePublic
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  _BYTE v13[22];
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[BRCAppLibrary appLibraryID](self, "appLibraryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAppLibrary containerMetadata](self, "containerMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDocumentScopePublic");
    v8 = CFSTR("private");
    *(_DWORD *)v13 = 138412802;
    *(_QWORD *)&v13[4] = v5;
    *(_WORD *)&v13[12] = 2112;
    if (v7)
      v8 = CFSTR("public");
    *(_QWORD *)&v13[14] = v8;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_INFO, "[INFO] %@ becomes %@%@", v13, 0x20u);

  }
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS recomputeAppSyncBlockStateForPrivateClientZone:](self->_session, "recomputeAppSyncBlockStateForPrivateClientZone:", v9);
  -[BRCAppLibrary fetchPristineness](self, "fetchPristineness");
  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isDocumentScopePublic"))
  {
    v11 = -[BRCAppLibrary wasMovedToCloudDocs](self, "wasMovedToCloudDocs");

    if (!v11)
      objc_msgSend(v9, "clearAndRefetchRecentAndFavoriteDocuments");
  }
  else
  {

  }
  -[BRCAppLibrary documentsFolder](self, "documentsFolder", *(_OWORD *)v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentsDirectoryUpdatedDocumentsScopePublic");
  objc_msgSend(v12, "saveToDB");

}

- (BOOL)isGreedy
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  void *v11;

  -[BRCAppLibrary session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOptimizeStorageEnabled");

  if ((v4 & 1) != 0)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", self->_mangledID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "shouldAppLibraryBeGreedy"))
    {
      brc_bread_crumbs();
      v6 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary isGreedy].cold.1();

LABEL_16:
      v10 = 1;
      goto LABEL_18;
    }
    if (!-[BRCAppLibrary shouldEvictUploadedItems](self, "shouldEvictUploadedItems"))
    {
      -[BRCAppLibrary session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "isGreedy");

      goto LABEL_18;
    }
    brc_bread_crumbs();
    v8 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary isGreedy].cold.2();

  }
  else
  {
    if (!-[BRCAppLibrary shouldEvictUploadedItems](self, "shouldEvictUploadedItems"))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary isGreedy].cold.4();
      goto LABEL_16;
    }
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary isGreedy].cold.3();
  }

  v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)isEqualToAppLibrary:(id)a3
{
  _QWORD *v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[BRMangledID isEqualToMangledID:](self->_mangledID, "isEqualToMangledID:", v4[6]);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BRCAppLibrary *v4;
  BOOL v5;

  v4 = (BRCAppLibrary *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BRCAppLibrary isEqualToAppLibrary:](self, "isEqualToAppLibrary:", v4);
  }

  return v5;
}

- (void)dumpToContext:(id)a3
{
  id v4;
  void *v5;
  BRCAppLibrary *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCAppLibrary descriptionWithContext:](self, "descriptionWithContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("+ app library: %@"), v5);

  if (-[BRCAppLibrary isForeground](self, "isForeground"))
  {
    objc_msgSend(v4, "pushIndentation");
    objc_msgSend(v4, "writeLineWithFormat:", CFSTR("+ foreground clients:"));
    objc_msgSend(v4, "pushIndentation");
    v6 = self;
    objc_sync_enter(v6);
    v7 = (void *)-[NSMutableSet copy](v6->_foregroundClients, "copy");
    objc_sync_exit(v6);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "popIndentation");
    objc_msgSend(v4, "popIndentation");

  }
}

- (id)itemsEnumeratorWithRankMin:(unint64_t)a3 rankMax:(unint64_t)a4 namePrefix:(id)a5 withDeadItems:(BOOL)a6 shouldIncludeFolders:(BOOL)a7 shouldIncludeOnlyFolders:(BOOL)a8 shouldIncludeDocumentsScope:(BOOL)a9 shouldIncludeDataScope:(BOOL)a10 shouldIncludeExternalScope:(BOOL)a11 shouldIncludeTrashScope:(BOOL)a12 count:(unint64_t)a13 db:(id)a14
{
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  BRCAppLibrary *v32;
  void *v33;
  void *v34;
  BRCALRowID *dbRowID;
  int v36;
  uint64_t *v37;
  const __CFString *v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v44;
  NSObject *v45;
  void *v46;
  BRCALRowID *v47;
  BRCALRowID *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  id v59;
  _BOOL4 v60;
  _BOOL4 v61;
  _BOOL4 v62;
  _QWORD v64[5];
  id v65;

  v61 = a8;
  v62 = a7;
  v60 = a6;
  v16 = a5;
  v17 = a14;
  if (itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__once == -1)
  {
    if (a9)
      goto LABEL_9;
  }
  else
  {
    dispatch_once(&itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__once, &__block_literal_global_19);
    if (a9)
      goto LABEL_9;
  }
  if (a10 || a11)
  {
LABEL_9:
    v57 = a4;
    v58 = a3;
    v59 = v16;
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v16, "br_stringByBackslashEscapingCharactersInString:", CFSTR("\\_%"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%%"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%% %@%%"), v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("AND (item_filename LIKE %@ ESCAPE '\\' OR item_filename LIKE %@ ESCAPE '\\')"), v22, v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (a9)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (a9)
        goto LABEL_15;
    }
    if (!a10)
    {
      v19 = 0;
      goto LABEL_20;
    }
LABEL_15:
    v24 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope;
    if (!a9 || !a10)
      v24 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope;
    if (!a9)
      v24 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope;
    v19 = (uint64_t)(id)*v24;
LABEL_20:
    v25 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
    if (a11)
      v26 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
    else
      v26 = 0;
    v27 = v26;
    if (v19 | v27)
    {
      v28 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
      if (!a12)
        v28 = 0;
      v29 = v28;
      v30 = (void *)MEMORY[0x24BEDD638];
      v31 = (void *)v19;
      if (v19)
      {
LABEL_28:
        v32 = self;
        if (v27)
        {
          if (v29)
          {
LABEL_30:
            objc_msgSend(v30, "formatInjection:", CFSTR("AND ((%@) OR (%@) OR (%@))"), v31, v25, v29);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "0", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "0", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "formatInjection:", CFSTR("AND ((%@) OR (%@) OR (%@))"), v31, v25, v34);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = self;
LABEL_33:
        if (v27)
        {
          if (v19)
            goto LABEL_35;
        }
        else
        {

          if (v19)
            goto LABEL_35;
        }

LABEL_35:
        dbRowID = v32->_dbRowID;
        v36 = !v62 || v61;
        if (v60)
        {
          if (v36)
          {
            v37 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
            if (!v62)
              v37 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
            v53 = v33;
            v55 = a13;
            v49 = v18;
            v51 = *v37;
            v47 = v32->_dbRowID;
            v38 = CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, 1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld");
LABEL_44:
            v40 = (void *)objc_msgSend(v17, "fetch:", v38, v58, v57, v47, v49, v51, v53, v55);
LABEL_50:
            v64[0] = MEMORY[0x24BDAC760];
            v64[1] = 3221225472;
            v64[2] = __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke_96;
            v64[3] = &unk_24FE40038;
            v64[4] = v32;
            v65 = v17;
            objc_msgSend(v40, "enumerateObjects:", v64);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v59;
            goto LABEL_51;
          }
          objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v33;
          v56 = a13;
          v50 = v18;
          v52 = v41;
          v48 = dbRowID;
          v42 = CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, 1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld");
        }
        else
        {
          if (v36)
          {
            v39 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
            if (!v62)
              v39 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
            v53 = v33;
            v55 = a13;
            v49 = v18;
            v51 = *v39;
            v47 = v32->_dbRowID;
            v38 = CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld");
            goto LABEL_44;
          }
          objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v33;
          v56 = a13;
          v50 = v18;
          v52 = v41;
          v48 = dbRowID;
          v42 = CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld");
        }
        v40 = (void *)objc_msgSend(v17, "fetch:", v42, v58, v57, v48, v50, v52, v54, v56);

        goto LABEL_50;
      }
    }
    else
    {
      brc_bread_crumbs();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:].cold.1();

      v46 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
      if (!a12)
        v46 = 0;
      v29 = v46;
      v30 = (void *)MEMORY[0x24BEDD638];
    }
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "0", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
    -[BRCAppLibrary itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:].cold.2();
  v20 = 0;
LABEL_51:

  return v20;
}

void __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "item_type != 3", 14);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("item_scope = 2 AND %@"), v14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope = v0;

  objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("item_scope = 1 AND %@"), v14);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope = v2;

  objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("(%@) OR (%@)"), itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope, itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope = v4;

  objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("(   item_scope = 2 OR item_scope = 1) AND item_type = 3"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope = v6;

  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "item_scope = 3", 14);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope = v8;

  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "AND item_type IN (1, 2, 8, 5, 6, 7)", 35);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument = v10;

  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "AND item_type = 0", 17);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder = v12;

}

id __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke_96(uint64_t a1, void *a2, uint64_t a3)
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

- (id)itemsEnumeratorChildOf:(id)a3 withDeadItems:(BOOL)a4 rankMin:(unint64_t)a5 rankMax:(unint64_t)a6 count:(unint64_t)a7 db:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;

  v11 = a4;
  v14 = a8;
  v15 = a3;
  objc_msgSend(v15, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v17 = "";
    v18 = 0;
  }
  else
  {
    v17 = "AND item_state IN (0)";
    v18 = 21;
  }
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneRowID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_parent_id = %@      AND item_notifs_rank >= %lld      AND item_notifs_rank < %lld     %@      AND item_parent_zone_rowid = %@ ORDER BY item_notifs_rank   LIMIT %lld"), v16, a5, a6, v19, v20, a7);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __79__BRCAppLibrary_itemsEnumeratorChildOf_withDeadItems_rankMin_rankMax_count_db___block_invoke;
  v25[3] = &unk_24FE40038;
  v25[4] = self;
  v26 = v14;
  v22 = v14;
  objc_msgSend(v21, "enumerateObjects:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __79__BRCAppLibrary_itemsEnumeratorChildOf_withDeadItems_rankMin_rankMax_count_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

- (id)enumerateChildrenOfItemGlobalID:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 db:(id)a7
{
  int v10;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;

  v10 = a4;
  v12 = a3;
  v13 = a7;
  if (v10 == 1)
  {
    v14 = (void *)MEMORY[0x24BEDD648];
    v15 = "version_mtime DESC";
    v16 = 18;
  }
  else
  {
    if (v10)
    {
      v17 = 0;
      goto LABEL_7;
    }
    v14 = (void *)MEMORY[0x24BEDD648];
    v15 = "item_filename";
    v16 = 13;
  }
  objc_msgSend(v14, "rawInjection:length:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(v12, "itemID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "zoneRowID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v13, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation    FROM client_items   WHERE item_parent_id = %@      AND item_state IN (0)     AND item_parent_zone_rowid = %@ ORDER BY %@   LIMIT  %lld   OFFSET %lld"), v18, v19, v17, a6, a5);

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __75__BRCAppLibrary_enumerateChildrenOfItemGlobalID_sortOrder_offset_limit_db___block_invoke;
  v24[3] = &unk_24FE40038;
  v24[4] = self;
  v25 = v13;
  v21 = v13;
  objc_msgSend(v20, "enumerateObjects:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __75__BRCAppLibrary_enumerateChildrenOfItemGlobalID_sortOrder_offset_limit_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

- (id)enumerateUserVisibleChildrenDirectoriesOfItemGlobalID:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation     FROM client_items    WHERE item_parent_id = %@       AND item_state IN (0)      AND item_type = 0      AND item_parent_zone_rowid = %@       AND item_user_visible = 1  ORDER BY item_filename    LIMIT %lld"), v8, v9, 1000);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__BRCAppLibrary_enumerateUserVisibleChildrenDirectoriesOfItemGlobalID_db___block_invoke;
  v14[3] = &unk_24FE40038;
  v14[4] = self;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v10, "enumerateObjects:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __74__BRCAppLibrary_enumerateUserVisibleChildrenDirectoriesOfItemGlobalID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

- (void)didRemoveDocumentsFolder
{
  -[BRCAppLibrary setStateBits:](self, "setStateBits:", 0x40000);
}

- (void)didCreateDocumentScopedItem
{
  -[BRCAppLibrary clearStateBits:](self, "clearStateBits:", 0x40000);
}

- (void)didCreateDataScopedItem
{
  -[BRCAppLibrary clearStateBits:](self, "clearStateBits:", 0x100000);
}

- (void)fetchPristineness
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Listing documents folder to fetch pristineness for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)scheduleFullLibraryContentsFetch
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: We shouldn't be scheduling a full app library contents fetch when sync is blocked for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)fetchTrashItems
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Listing trash folder for %@%@");
  OUTLINED_FUNCTION_0();
}

void __32__BRCAppLibrary_fetchTrashItems__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  _QWORD block[9];

  if (!a2)
  {
    block[7] = v2;
    block[8] = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__BRCAppLibrary_fetchTrashItems__block_invoke_2;
    block[3] = &unk_24FE3FA18;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);

  }
}

uint64_t __32__BRCAppLibrary_fetchTrashItems__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateBits:", 0x10000000);
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id v6;
  BRCListDirectoryContentsOperation **p_pristineFetchOp;
  id WeakRetained;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  p_pristineFetchOp = &self->_pristineFetchOp;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pristineFetchOp);

  if (WeakRetained == v10
    || (p_pristineFetchOp = &self->_trashFetchOp,
        v9 = objc_loadWeakRetained((id *)&self->_trashFetchOp),
        v9,
        v9 == v10))
  {
    objc_storeWeak((id *)p_pristineFetchOp, v6);
  }

}

- (int64_t)throttleHashWithItemID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[BRCAppLibrary appLibraryID](self, "appLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = objc_msgSend(v4, "hash");

  return v7 ^ v6;
}

- (BOOL)hasUbiquitousDocuments
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items  WHERE item_type NOT IN (0, 9, 10, 4)    AND item_state IN (0)    AND app_library_rowid = %@ LIMIT 1"), self->_dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasLocalChanges
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT auto_document_with_local_changes_count > 0 FROM app_libraries WHERE rowid = %@"), self->_dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)integrityCheckBoosting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BRCAppLibrary *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  int v30;
  BOOL v31;
  NSObject *v32;
  const char *v33;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  BRCAppLibrary *v42;
  __int16 v43;
  BRCAppLibrary *v44;
  __int16 v45;
  NSObject *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOnQueue");

  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadataSyncContextIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAppLibrary transferSyncContextIfExists](self, "transferSyncContextIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableSet count](self->_foregroundClients, "count");
  objc_msgSend(v7, "foregroundClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", self);

  if (v8)
  {
    if ((v10 & 1) == 0)
    {
      brc_bread_crumbs();
      v15 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary integrityCheckBoosting].cold.4();
      goto LABEL_36;
    }
    objc_msgSend(v6, "foregroundClients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", self);

    if ((v12 & 1) == 0)
    {
      brc_bread_crumbs();
      v15 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary integrityCheckBoosting].cold.3();
      goto LABEL_36;
    }
    v36 = v6;
    -[BRCAppLibrary _targetSharedServerZonesEnumerator](self, "_targetSharedServerZonesEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSMutableSet mutableCopy](self->_targetSharedServerZones, "mutableCopy");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = v13;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (!v16)
      goto LABEL_14;
    v17 = v16;
    v18 = *(_QWORD *)v38;
    v35 = v7;
LABEL_6:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v18)
        objc_enumerationMutation(v15);
      v20 = *(BRCAppLibrary **)(*((_QWORD *)&v37 + 1) + 8 * v19);
      if ((-[NSObject containsObject:](v14, "containsObject:", v20, v35) & 1) == 0)
        break;
      -[NSObject removeObject:](v14, "removeObject:", v20);
      -[BRCAppLibrary transferSyncContextIfExists](v20, "transferSyncContextIfExists");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "foregroundClients");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", self);

      if ((v23 & 1) == 0)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          goto LABEL_40;
        goto LABEL_34;
      }
      -[BRCAppLibrary metadataSyncContextIfExists](v20, "metadataSyncContextIfExists");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "foregroundClients");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "containsObject:", self);

      if ((v26 & 1) == 0)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          goto LABEL_34;
LABEL_40:
        *(_DWORD *)buf = 138412802;
        v42 = v20;
        v43 = 2112;
        v44 = self;
        v45 = 2112;
        v46 = v28;
        v33 = "[CRIT] UNREACHABLE: target shared zone %@ of %@ should be boosted%@";
LABEL_41:
        _os_log_fault_impl(&dword_230455000, v32, OS_LOG_TYPE_FAULT, v33, buf, 0x20u);
        goto LABEL_34;
      }
      if (v17 == ++v19)
      {
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        v7 = v35;
        if (v17)
          goto LABEL_6;
LABEL_14:

        if (-[NSObject count](v14, "count"))
        {
          brc_bread_crumbs();
          v27 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v42 = self;
            v43 = 2112;
            v44 = (BRCAppLibrary *)v14;
            v45 = 2112;
            v46 = v27;
            _os_log_fault_impl(&dword_230455000, v28, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has too many target shared server zones %@%@", buf, 0x20u);
          }
          v6 = v36;
LABEL_35:

LABEL_36:
          v31 = 0;
        }
        else
        {
          v31 = 1;
          v6 = v36;
        }

        goto LABEL_38;
      }
    }
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v42 = self;
      v43 = 2112;
      v44 = v20;
      v45 = 2112;
      v46 = v28;
      v33 = "[CRIT] UNREACHABLE: %@ has foreground clients but target shared zone %@ isn't targeted%@";
      goto LABEL_41;
    }
LABEL_34:
    v7 = v35;
    v6 = v36;

    v27 = v15;
    goto LABEL_35;
  }
  if (v10)
  {
    brc_bread_crumbs();
    v15 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary integrityCheckBoosting].cold.1();
    goto LABEL_36;
  }
  objc_msgSend(v6, "foregroundClients");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "containsObject:", self);

  if (v30)
  {
    brc_bread_crumbs();
    v15 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary integrityCheckBoosting].cold.2();
    goto LABEL_36;
  }
  v31 = 1;
LABEL_38:

  return v31;
}

- (BOOL)shouldEvictUploadedItems
{
  return BYTE2(self->_state) >> 7;
}

- (void)recomputeShouldEvictState
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "evicting uploaded items";
  if ((a1 & 1) == 0)
    v1 = "not evicting uploaded items";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v2, v3, "[DEBUG] evict status remains: %s%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_0();
}

- (void)didReceiveHandoffRequest
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataSyncContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[BRCAppLibrary transferSyncContext](self, "transferSyncContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
    objc_msgSend(v6, "didReceiveHandoffRequest");
  objc_msgSend(v5, "didReceiveHandoffRequest");

}

id __51__BRCAppLibrary__targetSharedServerZonesEnumerator__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "numberAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "serverZoneByRowID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asSharedZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isStillTargetingSharedServerZone:(id)a3
{
  id v4;
  BRCPQLConnection *db;
  BRCALRowID *dbRowID;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  BRCAppLibrary *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  db = self->_db;
  dbRowID = self->_dbRowID;
  objc_msgSend(v4, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT rowid FROM client_items WHERE app_library_rowid = %@ AND zone_rowid = %@ AND (item_sharing_options & 4) != 0 AND item_state IN (0) LIMIT 1"), dbRowID, v7);

  v9 = objc_msgSend(v8, "unsignedLongLongValue");
  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v14 = v9;
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Item with rowid %llu is still targeting %@ for %@%@", buf, 0x2Au);
    }

  }
  return v9 != 0;
}

- (void)_addTargetSharedServerZoneForSharedItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCAccountSessionFPFS clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__BRCAppLibrary__addTargetSharedServerZoneForSharedItem___block_invoke;
  v7[3] = &unk_24FE3FA40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_with_logs_2(v5, v7);

}

void __57__BRCAppLibrary__addTargetSharedServerZoneForSharedItem___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serverZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asSharedZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_addTargetSharedServerZone:", v2);

}

- (void)_removeTargetSharedServerZoneIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BRCAppLibrary *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  BRCAppLibrary *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] attempting to remove target server zone %@ from %@%@", buf, 0x20u);
  }

  -[BRCAccountSessionFPFS clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke;
  v11[3] = &unk_24FE3FA88;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v9 = v5;
  v10 = v4;
  dispatch_async_with_logs_2(v8, v11);

}

void __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "containsObject:") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isStillTargetingSharedServerZone:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      brc_bread_crumbs();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v4 = *(_QWORD *)(a1 + 48);
        v9 = 138412802;
        v10 = v4;
        v11 = 2112;
        v12 = v5;
        v13 = 2112;
        v14 = v2;
        v6 = "[DEBUG] not removing target shared zone %@ from %@, because it's still targeting it%@";
LABEL_13:
        _os_log_debug_impl(&dword_230455000, v3, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v9, 0x20u);
      }
    }
    else
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "count"))
        objc_msgSend(*(id *)(a1 + 32), "removeForegroundClient:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "removeObject:", *(_QWORD *)(a1 + 32));
      brc_bread_crumbs();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(a1 + 48);
        v9 = 138412802;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        v13 = 2112;
        v14 = v2;
        v6 = "[DEBUG] %@ is not a target shared zone of %@ anymore%@";
        goto LABEL_13;
      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke_cold_1();
  }

}

- (void)_addTargetSharedServerZone:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  BRCAppLibrary *v12;
  __int16 v13;
  BRCAppLibrary *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "clientZone");
  v5 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v5;
    v13 = 2112;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] attempting to add target shared server zone %@ to %@%@", (uint8_t *)&v11, 0x20u);
  }

  -[BRCAccountSessionFPFS clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v4)
  {
    if (-[NSMutableSet count](self->_foregroundClients, "count"))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412802;
        v12 = self;
        v13 = 2112;
        v14 = v5;
        v15 = 2112;
        v16 = v9;
        _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Added %@ as foreground client to %@%@", (uint8_t *)&v11, 0x20u);
      }

      objc_msgSend(v4, "addForegroundClient:", self);
    }
    -[NSMutableSet addObject:](self->_targetSharedServerZones, "addObject:", v4);
  }

}

- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4
{
  return -[BRCAccountSessionFPFS itemIDByRowID:db:](self->_session, "itemIDByRowID:db:", a3, a4);
}

- (id)itemIDByRowID:(unint64_t)a3
{
  return -[BRCAccountSessionFPFS itemIDByRowID:db:](self->_session, "itemIDByRowID:db:", a3, self->_db);
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  return -[BRCAccountSessionFPFS itemByRowID:db:](self->_session, "itemByRowID:db:", a3, a4);
}

- (id)itemByRowID:(unint64_t)a3
{
  return -[BRCAccountSessionFPFS itemByRowID:](self->_session, "itemByRowID:", a3);
}

- (BOOL)wasMovedToCloudDocs
{
  return (-[BRCAppLibrary state](self, "state") >> 21) & 1;
}

- (BOOL)shouldSaveContainerMetadataServerside
{
  return !-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary");
}

- (id)documentsFolderItemID
{
  _BOOL4 v3;
  BRCItemID *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = -[BRCAppLibrary includesDataScope](self, "includesDataScope");
  v4 = [BRCItemID alloc];
  -[BRCAppLibrary dbRowID](self, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = -[BRCItemID initAsDocumentsWithAppLibraryRowID:](v4, "initAsDocumentsWithAppLibraryRowID:", v5);
  else
    v6 = -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:](v4, "_initAsLibraryRootWithAppLibraryRowID:", v5);
  v7 = (void *)v6;

  return v7;
}

- (id)fetchRootItem
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCAppLibrary db](self, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOnQueue");

  -[BRCAppLibrary db](self, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary fetchRootItemInDB:](self, "fetchRootItemInDB:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchDocumentsDirectoryItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary documentsFolderItemID](self, "documentsFolderItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemByItemID:db:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "asDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchDocumentsDirectoryItem
{
  void *v3;
  void *v4;

  -[BRCAppLibrary db](self, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary fetchDocumentsDirectoryItem:](self, "fetchDocumentsDirectoryItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rootItemID
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;

  -[BRCAppLibrary dbRowID](self, "dbRowID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:]([BRCItemID alloc], "_initAsLibraryRootWithAppLibraryRowID:", v2);
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary fetchRootItemInDB:].cold.1();

    v3 = 0;
  }

  return v3;
}

- (id)rootItemGlobalID
{
  BRCItemGlobalID *v3;
  void *v4;
  void *v5;
  void *v6;
  BRCItemGlobalID *v7;

  v3 = [BRCItemGlobalID alloc];
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary rootItemID](self, "rootItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v3, "initWithZoneRowID:itemID:", v5, v6);

  return v7;
}

- (void)zoneDidChangeMovedToCloudDocsState
{
  -[BRCAppLibrary _updateIsInCloudDocsZone](self, "_updateIsInCloudDocsZone");
  objc_msgSend(MEMORY[0x24BE175F8], "postContainerListUpdateNotification");
}

- (void)_updateIsInCloudDocsZone
{
  id v3;

  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BRContainer setIsInCloudDocsZone:](self->_containerMetadata, "setIsInCloudDocsZone:", objc_msgSend(v3, "isCloudDocsZone"));

}

- (void)setContainerMetadataEtag:(id)a3
{
  objc_storeStrong((id *)&self->_containerMetadataEtag, a3);
  -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
}

- (void)setContainerMetadataNeedsSyncUp:(BOOL)a3
{
  self->_containerMetadataNeedsSyncUp = a3;
  -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
}

- (void)scheduleContainerMetadataSyncUp
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] container-metadata needs sync up for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)flushAndForceIngestRootAndDocumentsFolder
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_group_enter((dispatch_group_t)self->_forceIngestionGroup);
  objc_initWeak(&location, self);
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke;
  v4[3] = &unk_24FE3F9C8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "scheduleFlushWithCheckpoint:whenFlushed:", 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "rootFileObjectID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_cold_2();

    objc_msgSend(v3, "asString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_126;
    v16[3] = &unk_24FE408B8;
    v16[4] = v2;
    v8 = v3;
    v17 = v8;
    +[BRCImportUtil forceIngestionForItemID:completionHandler:](BRCImportUtil, "forceIngestionForItemID:completionHandler:", v6, v16);

    if (objc_msgSend(v2, "includesDataScope"))
    {
      objc_msgSend(v2, "documentsFolderFileObjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_cold_1();

      objc_msgSend(v9, "asString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_127;
      v14[3] = &unk_24FE408B8;
      v14[4] = v2;
      v15 = v9;
      v13 = v9;
      +[BRCImportUtil forceIngestionForItemID:completionHandler:](BRCImportUtil, "forceIngestionForItemID:completionHandler:", v12, v14);

    }
  }

}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_126(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_126_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 32));
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_127()
{
  void *v0;
  NSObject *v1;

  brc_bread_crumbs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_127_cold_1();

}

- (void)waitForRootIngestion
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Finished waiting for force ingestion of %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (NSString)pathRelativeToRoot
{
  return (NSString *)-[BRMangledID mangledIDString](self->_mangledID, "mangledIDString");
}

- (void)setChildBasehashSalt:(id)a3
{
  NSData *v5;
  NSData *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (NSData *)a3;
  v6 = v5;
  if (self->_childBasehashSalt != v5 && !-[NSData isEqualToData:](v5, "isEqualToData:"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[NSData brc_truncatedSHA256](v6, "brc_truncatedSHA256");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "brc_hexadecimalString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSData brc_truncatedSHA256](self->_childBasehashSalt, "brc_truncatedSHA256");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "brc_hexadecimalString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary mangledID](self, "mangledID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = v9;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v7;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning new child basehash salt %@ from %@ for %@%@", buf, 0x2Au);

    }
    if (self->_childBasehashSalt)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary setChildBasehashSalt:].cold.1();

    }
    objc_storeStrong((id *)&self->_childBasehashSalt, a3);
    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
  }

}

- (void)setSaltingState:(unsigned int)a3
{
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t saltingState;
  const __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_saltingState != a3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      if (a3 > 3)
        v7 = CFSTR("no server item");
      else
        v7 = off_24FE428E0[a3];
      saltingState = (int)self->_saltingState;
      if (saltingState > 3)
        v9 = CFSTR("no server item");
      else
        v9 = off_24FE428E0[saltingState];
      -[BRCAppLibrary mangledID](self, "mangledID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning salt state %@ from %@ for %@%@", (uint8_t *)&v11, 0x2Au);

    }
    self->_saltingState = a3;
    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
  }
}

- (brc_task_tracker)tracker
{
  return self->_tracker;
}

- (BRCAppLibraryDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setDbRowID:(id)a3
{
  objc_storeStrong((id *)&self->_dbRowID, a3);
}

- (BRCZoneRowID)zoneRowID
{
  return self->_zoneRowID;
}

- (void)setZoneRowID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneRowID, a3);
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_storeStrong((id *)&self->_fileID, a3);
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
  objc_storeStrong((id *)&self->_generationID, a3);
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setDefaultClientZone:(id)a3
{
  objc_storeWeak((id *)&self->_defaultClientZone, a3);
}

- (unint64_t)containerMetadataSyncRequestID
{
  return self->_containerMetadataSyncRequestID;
}

- (void)setContainerMetadataSyncRequestID:(unint64_t)a3
{
  self->_containerMetadataSyncRequestID = a3;
}

- (NSNumber)rootQuotaUsage
{
  return self->_rootQuotaUsage;
}

- (void)setRootQuotaUsage:(id)a3
{
  objc_storeStrong((id *)&self->_rootQuotaUsage, a3);
}

- (NSData)childBasehashSalt
{
  return self->_childBasehashSalt;
}

- (unsigned)saltingState
{
  return self->_saltingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childBasehashSalt, 0);
  objc_storeStrong((id *)&self->_rootQuotaUsage, 0);
  objc_storeStrong((id *)&self->_containerMetadataEtag, 0);
  objc_storeStrong((id *)&self->_containerMetadata, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_appLibraryID, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_destroyWeak((id *)&self->_trashFetchOp);
  objc_destroyWeak((id *)&self->_pristineFetchOp);
  objc_storeStrong((id *)&self->_foregroundClients, 0);
  objc_storeStrong((id *)&self->_targetSharedServerZones, 0);
  objc_destroyWeak((id *)&self->_defaultClientZone);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_mangledID, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_forceIngestionGroup, 0);
}

- (void)reimportLibraryRootAndFinishResetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BRCAppLibrary rootFileObjectID](self, "rootFileObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__BRCAppLibrary_BRCZoneReset__reimportLibraryRootAndFinishResetWithCompletion___block_invoke;
  v8[3] = &unk_24FE41D48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  +[BRCImportUtil reimportItemsBelowItemWithIdentifier:completionHandler:](BRCImportUtil, "reimportItemsBelowItemWithIdentifier:completionHandler:", v6, v8);

}

void __79__BRCAppLibrary_BRCZoneReset__reimportLibraryRootAndFinishResetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "fp_isFileProviderError:", -1005))
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientTruthWorkloop");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __79__BRCAppLibrary_BRCZoneReset__reimportLibraryRootAndFinishResetWithCompletion___block_invoke_2;
    v9[3] = &unk_24FE409B8;
    v7 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v7;
    dispatch_async(v6, v9);

  }
}

uint64_t __79__BRCAppLibrary_BRCZoneReset__reimportLibraryRootAndFinishResetWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "clearStateBits:", 8);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_updateContainerMetadataFromRecord:(id)a3 stripIcons:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BRCAppLibrary session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "brc_containerMetadataPropertiesData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    if (v10)
    {
      if (!-[BRCAppLibrary shouldSaveContainerMetadataServerside](self, "shouldSaveContainerMetadataServerside"))
      {
LABEL_16:
        objc_initWeak((id *)buf, self);
        v21[0] = v11;
        v21[1] = 3221225472;
        v21[2] = __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke_1;
        v21[3] = &unk_24FE40760;
        objc_copyWeak(&v23, (id *)buf);
        v22 = v6;
        dispatch_async(v9, v21);

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
        goto LABEL_17;
      }
      if (a4)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(v6, "brc_containerMetadataIconPaths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[BRCAppLibrary containerMetadata](self, "containerMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isDocumentScopePublic");

      -[BRCAppLibrary containerMetadata](self, "containerMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateMetadataWithRecordData:iconPaths:", v10, v12);

      -[BRCAppLibrary containerMetadata](self, "containerMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isDocumentScopePublic");

      if (v17 != v20)
      {
        objc_initWeak((id *)buf, self);
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke;
        block[3] = &unk_24FE3F9C8;
        objc_copyWeak(&v25, (id *)buf);
        dispatch_async(v9, block);
        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v6;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_230455000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] no data in record %@%@", buf, 0x16u);
      }

    }
    goto LABEL_16;
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[BRCAppLibrary session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v14;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Serial queue for session %@ is nil%@", buf, 0x16u);

  }
LABEL_17:

}

void __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didUpdateDocumentScopePublic");

}

void __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke_1(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "recordChangeTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setContainerMetadataEtag:", v2);

}

void __48__BRCAppLibrary_FPFSAdditions__deleteAppLibrary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] App Library includes data scope%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)setNeedsSave:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] container state now needs flush: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: dbRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] API MISUSE: unexpected parameter%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: mangledID.isPrivate%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: zoneRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)associateWithClientZone:offline:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: associating nil client zone for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_activateState:origState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Updating documents folder to be of server type %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_activateState:origState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: state == BRCAppLibraryStateNotActivated || !(state & BRCAppLibraryStateNotActivated)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __42__BRCAppLibrary__activateState_origState___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Done Force Ingestion app library %@ container to update the contentPolicy%@", v6);

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

- (void)itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: docsOrDataScopeInjection || externalScopeInjection%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: asking for no scopes?%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addForegroundClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ - app library became foreground%@");
  OUTLINED_FUNCTION_0();
}

- (void)addForegroundClient:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![_foregroundClients containsObject:client]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addForegroundClient:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: client%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __37__BRCAppLibrary_addForegroundClient___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] %@ - SharedDocs became foreground%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)removeForegroundClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ - app library moved to background%@");
  OUTLINED_FUNCTION_0();
}

- (void)removeForegroundClient:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [_foregroundClients containsObject:client]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)integrityCheckBoosting
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: %@ has foreground clients but the transfer sync context doesn't contain self%@");
  OUTLINED_FUNCTION_0();
}

void __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412802;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 88);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_8_3(&dword_230455000, a2, a3, "[DEBUG] resolved target shared zones %@ for app library %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
  OUTLINED_FUNCTION_20();
}

void __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_8_3(&dword_230455000, v0, v1, "[DEBUG] not removing target shared zone %@ from %@%@");
  OUTLINED_FUNCTION_20();
}

- (void)fetchRootItemInDB:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: nil dbRowID for %@%@");
  OUTLINED_FUNCTION_0();
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Forcing ingesting documents %@%@");
  OUTLINED_FUNCTION_0();
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Forcing ingesting root %@%@");
  OUTLINED_FUNCTION_0();
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_126_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_8_3(&dword_230455000, v0, v1, "[DEBUG] Done Force Ingestion of app library %@ with itemIdentifier = %@%@");
  OUTLINED_FUNCTION_20();
}

void __58__BRCAppLibrary_flushAndForceIngestRootAndDocumentsFolder__block_invoke_127_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_8_3(&dword_230455000, v0, v1, "[DEBUG] Done Force Ingestion documents of app library %@ with itemIdentifier = %@%@");
  OUTLINED_FUNCTION_20();
}

- (void)setChildBasehashSalt:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _childBasehashSalt == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
