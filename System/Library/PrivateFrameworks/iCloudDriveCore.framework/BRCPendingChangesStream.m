@implementation BRCPendingChangesStream

- (id)_getChangesStreamSafeDBHolder
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BRCSafeDBHolder *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void (**v14)(_QWORD);
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  dispatch_source_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  dispatch_time_t v26;
  id v27;
  void (**v28)(_QWORD);
  NSObject *v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  dispatch_block_t v33;
  _QWORD v35[5];

  if (_getChangesStreamSafeDBHolder_onceToken != -1)
    dispatch_once(&_getChangesStreamSafeDBHolder_onceToken, &__block_literal_global_52);
  v3 = (id)_pendingChangesStreamPool;
  objc_sync_enter(v3);
  objc_msgSend((id)_pendingChangesStreamPool, "objectForKey:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCPendingChangesStream _getChangesStreamSafeDBHolder].cold.3();

    -[BRCPendingChangesStream _openDB](self, "_openDB");
  }
  v7 = self->_dbSafeHolder;
  v8 = (void *)_pendingChangesStreamPool;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, self);

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pendingChangesStreamSoftOpenCount");

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "pendingChangesStreamHardOpenCount");

  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __56__BRCPendingChangesStream__getChangesStreamSafeDBHolder__block_invoke_102;
  v35[3] = &__block_descriptor_40_e5_v8__0l;
  v35[4] = v11;
  v14 = (void (**)(_QWORD))MEMORY[0x2348BA0DC](v35);
  if (objc_msgSend((id)_pendingChangesStreamPool, "count") <= v13)
  {
    if (objc_msgSend((id)_pendingChangesStreamPool, "count") > v11 && !_getChangesStreamSafeDBHolder__closeChangesTimer)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRCPendingChangesStream _getChangesStreamSafeDBHolder].cold.2();

      -[BRCClientZone db](self->_clientZone, "db");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "serialQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v20);
      v22 = (void *)_getChangesStreamSafeDBHolder__closeChangesTimer;
      _getChangesStreamSafeDBHolder__closeChangesTimer = (uint64_t)v21;

      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "pendingChangesStreamCloseDelay");

      v25 = _getChangesStreamSafeDBHolder__closeChangesTimer;
      v26 = dispatch_time(0, v24);
      dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, v24 / 0xA);
      v27 = (id)_getChangesStreamSafeDBHolder__closeChangesTimer;
      v28 = v14;
      v29 = v27;
      v30 = v28;
      v31 = v30;
      v32 = v30;
      if (*MEMORY[0x24BE17840])
      {
        ((void (*)(_QWORD))*MEMORY[0x24BE17840])(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v32);
      dispatch_source_set_event_handler(v29, v33);

      dispatch_resume((dispatch_object_t)_getChangesStreamSafeDBHolder__closeChangesTimer);
    }
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCPendingChangesStream _getChangesStreamSafeDBHolder].cold.1();

    v14[2](v14);
  }

  objc_sync_exit(v3);
  return v7;
}

void __56__BRCPendingChangesStream__getChangesStreamSafeDBHolder__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_pendingChangesStreamPool;
  _pendingChangesStreamPool = v0;

}

void __56__BRCPendingChangesStream__getChangesStreamSafeDBHolder__block_invoke_102(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (id)_pendingChangesStreamPool;
  objc_sync_enter(v2);
  NSAllMapTableKeys((NSMapTable *)_pendingChangesStreamPool);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_104);
  v5 = 0;
  *(_QWORD *)&v6 = 138412546;
  v12 = v6;
  while (1)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v5 + v7 >= (unint64_t)objc_msgSend(v4, "count", v12))
      break;
    objc_msgSend(v4, "objectAtIndex:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v12;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Closing changes stream %@%@", buf, 0x16u);
    }

    objc_msgSend(v8, "_closeChangeStream");
    ++v5;
  }
  if (_getChangesStreamSafeDBHolder__closeChangesTimer)
  {
    dispatch_source_cancel((dispatch_source_t)_getChangesStreamSafeDBHolder__closeChangesTimer);
    v11 = (void *)_getChangesStreamSafeDBHolder__closeChangesTimer;
    _getChangesStreamSafeDBHolder__closeChangesTimer = 0;

  }
  objc_sync_exit(v2);

}

uint64_t __56__BRCPendingChangesStream__getChangesStreamSafeDBHolder__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)_pendingChangesStreamPool;
  v5 = a3;
  objc_msgSend(v4, "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_pendingChangesStreamPool, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
}

- (void)_wasClosed
{
  id obj;

  self->_dbHasOpened = 0;
  obj = (id)_pendingChangesStreamPool;
  objc_sync_enter(obj);
  objc_msgSend((id)_pendingChangesStreamPool, "removeObjectForKey:", self);
  objc_sync_exit(obj);

}

- (void)_dbBecameCorrupted:(id)a3 withDescription:(id)a4
{
  id v7;
  id v8;
  id v9;
  _BOOL4 dbHasOpened;
  void *v11;
  char v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_error, a3);
  v9 = (id)_pendingChangesStreamPool;
  objc_sync_enter(v9);
  dbHasOpened = self->_dbHasOpened;
  -[BRCPendingChangesStream _wasClosed](self, "_wasClosed");
  objc_sync_exit(v9);

  if (dbHasOpened)
  {
    objc_msgSend(0, "db");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isInTransaction");

    if ((v12 & 1) == 0)
    {
      v24 = 0;
      v13 = objc_msgSend(0, "closeWithError:", &v24);
      v14 = v24;
      if ((v13 & 1) == 0)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[BRCPendingChangesStream _dbBecameCorrupted:withDescription:].cold.3();

        objc_msgSend(v14, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BEDD658]))
        {
          v18 = objc_msgSend(v14, "code");

          if (v18 == 5)
          {
            brc_bread_crumbs();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
              -[BRCPendingChangesStream _dbBecameCorrupted:withDescription:].cold.2();

            goto LABEL_16;
          }
        }
        else
        {

        }
      }

    }
  }
  -[BRCClientZone session](self->_clientZone, "session");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "diskReclaimer");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[NSURL path](self->_databaseURL, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[BRCPendingChangesStream _dbBecameCorrupted:withDescription:].cold.1();

  objc_msgSend(v14, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, v19);
LABEL_16:

}

- (id)_initDeltaSyncWithChangeToken:(id)a3 serverZone:(id)a4
{
  id v7;
  id v8;
  BRCPendingChangesStream *v9;
  BRCPendingChangesStream *v10;
  uint64_t v11;
  BRCClientZone *clientZone;
  void *v13;
  void *v14;
  CKServerChangeToken *startingChangeToken;
  void *v16;
  uint64_t v17;
  NSURL *databaseURL;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *label;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)BRCPendingChangesStream;
  v9 = -[BRCPendingChangesStream init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingChangeToken, a3);
    objc_msgSend(v8, "clientZone");
    v11 = objc_claimAutoreleasedReturnValue();
    clientZone = v10->_clientZone;
    v10->_clientZone = (BRCClientZone *)v11;

    objc_storeStrong((id *)&v10->_serverZone, a4);
    objc_msgSend(v8, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stageRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    startingChangeToken = v10->_startingChangeToken;
    objc_msgSend(v8, "zoneID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pendingDeltaFetchRecordDirWithStartingChangeToken:recordZoneID:", startingChangeToken, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    databaseURL = v10->_databaseURL;
    v10->_databaseURL = (NSURL *)v17;

    v10->_hasBeenCreated = -[NSURL checkResourceIsReachableAndReturnError:](v10->_databaseURL, "checkResourceIsReachableAndReturnError:", 0);
    objc_msgSend(v8, "mangledID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v19, "appLibraryOrZoneName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("change-stream/%@"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    label = v10->_label;
    v10->_label = (NSString *)v22;

  }
  return v10;
}

- (BRCPendingChangesStream)initWithServerZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCPendingChangesStream *v7;

  v4 = a3;
  objc_msgSend(v4, "changeState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCPendingChangesStream _initDeltaSyncWithChangeToken:serverZone:](self, "_initDeltaSyncWithChangeToken:serverZone:", v6, v4);

  return v7;
}

- (id)initForListingWithParent:(id)a3 serverZone:(id)a4
{
  id v6;
  id v7;
  BRCPendingChangesStream *v8;
  void *v9;
  uint64_t v10;
  CKServerChangeToken *startingChangeToken;
  void *v12;
  uint64_t v13;
  NSURL *databaseURL;
  uint64_t v15;
  BRCClientZone *clientZone;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  __CFString *v23;
  uint64_t v24;
  NSString *label;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)BRCPendingChangesStream;
  v8 = -[BRCPendingChangesStream init](&v30, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "changeState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changeToken");
    v10 = objc_claimAutoreleasedReturnValue();
    startingChangeToken = v8->_startingChangeToken;
    v8->_startingChangeToken = (CKServerChangeToken *)v10;

    objc_msgSend(v7, "session");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stageRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pendingListRecordDirWithStartingChangeToken:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    databaseURL = v8->_databaseURL;
    v8->_databaseURL = (NSURL *)v13;

    v8->_hasBeenCreated = -[NSURL checkResourceIsReachableAndReturnError:](v8->_databaseURL, "checkResourceIsReachableAndReturnError:", 0);
    objc_msgSend(v7, "clientZone");
    v15 = objc_claimAutoreleasedReturnValue();
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v15;

    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "recordName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoneName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ownerName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDB8E88]);
    if ((v22 & 1) != 0)
    {
      v23 = &stru_24FE4A790;
    }
    else
    {
      objc_msgSend(v6, "zoneID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "ownerName");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v28, "stringWithFormat:", CFSTR("list-dir/%@/%@%@"), v17, v19, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    label = v8->_label;
    v8->_label = (NSString *)v24;

    if ((v22 & 1) == 0)
    {

    }
  }

  return v8;
}

- (BOOL)_dropExistingTablesWithDB:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  char v6;

  v3 = a3;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCPendingChangesStream _dropExistingTablesWithDB:].cold.1();

  if (objc_msgSend(v3, "execute:", CFSTR("DROP TABLE IF EXISTS fetch_state"))
    && objc_msgSend(v3, "execute:", CFSTR("DROP TABLE IF EXISTS list_state"))
    && objc_msgSend(v3, "execute:", CFSTR("DROP TABLE IF EXISTS record_changes")))
  {
    v6 = objc_msgSend(v3, "execute:", CFSTR("DROP INDEX IF EXISTS \"record_changes/record_type\"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_createSchemaIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[5];
  int v8;

  -[BRCSafeDBHolder db](self->_dbSafeHolder, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5 <= 1)
  {
    -[BRCSafeDBHolder db](self->_dbSafeHolder, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke;
    v7[3] = &unk_24FE47EB0;
    v8 = v5;
    v7[4] = self;
    objc_msgSend(v6, "performWithFlags:action:", 8, v7);

  }
}

uint64_t __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;

  v3 = a2;
  if ((*(_DWORD *)(a1 + 40) != 1 || objc_msgSend(*(id *)(a1 + 32), "_dropExistingTablesWithDB:", v3))
    && objc_msgSend(v3, "execute:", CFSTR("CREATE TABLE fetch_state (server_token blob, client_token integer)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE TABLE list_state (cont_token blob, completed integer not null)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE TABLE record_changes (record_id text primary key, record_type integer not null, record blob)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX \"record_changes/record_type\" ON record_changes (record_type)"))&& objc_msgSend(v3, "execute:", CFSTR("INSERT INTO fetch_state (server_token, client_token) VALUES (%@, NULL)"),
                       *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    && objc_msgSend(v3, "execute:", CFSTR("INSERT INTO list_state (cont_token, completed) VALUES (NULL, 0)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE TABLE records_needing_subresources (record_id text PRIMARY KEY, record_type integer not null, record blob, xattr_sig BLOB, record_id_needing_fetch text, record_id_blocking_save text)"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX \"records_needing_subresources/xattr_sig\" ON records_needing_subresources(xattr_sig) WHERE xattr_sig IS NOT NULL"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX \"records_needing_subresources/record_id_needing_fetch\" ON records_needing_subresources(record_id_needing_fetch) WHERE record_id_needing_fetch IS NOT NULL"))&& objc_msgSend(v3, "execute:", CFSTR("CREATE INDEX \"records_needing_subresources/record_id_blocking_save\" ON records_needing_subresources(record_id_blocking_save) WHERE record_id_blocking_save IS NOT NULL"))
    && objc_msgSend(v3, "execute:", CFSTR("CREATE TRIGGER \"records_needing_subresources/resources_finished\" AFTER UPDATE ON records_needing_subresources BEGIN INSERT INTO record_changes (record_id, record_type, record)  SELECT record_id, record_type, record  FROM records_needing_subresources WHERE xattr_sig IS NULL AND record_id_needing_fetch IS NULL AND record_id_blocking_save IS NULL AND record IS NOT NULL AND record_id = new.record_id; DELETE FROM records_needing_subresources WHERE xattr_sig IS NULL AND record_id_needing_fetch IS NULL AND record_id_blocking_save IS NULL AND record IS NOT NULL AND record_id = new.record_id; END")))
  {
    v4 = objc_msgSend(v3, "execute:", CFSTR("CREATE TRIGGER \"records_needing_subresources/unblock_save\" AFTER INSERT ON record_changes BEGIN UPDATE records_needing_subresources SET record_id_blocking_save = NULL WHERE record_id_blocking_save = new.record_id AND new.record IS NOT NULL; END"));
  }
  else
  {
    v4 = 0;
  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v5, "sqliteCacheSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v5, "sqliteCacheSpill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BEDD648];
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "rawInjection:length:", objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "execute:", CFSTR("PRAGMA cache_size = %@"), v10);

  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke_cold_2();

  }
  v14 = (void *)MEMORY[0x24BEDD648];
  v15 = objc_retainAutorelease(v7);
  objc_msgSend(v14, "rawInjection:length:", objc_msgSend(v15, "UTF8String"), objc_msgSend(v15, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "execute:", CFSTR("PRAGMA cache_spill = %@"), v16);

  if ((v17 & 1) == 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke_cold_1();

  }
  if ((_DWORD)v4)
    v4 = objc_msgSend(v3, "setUserVersion:", 2);

  return v4;
}

- (void)_openDB
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a4, a3, "[DEBUG] database is opening so creating at %@%@", (uint8_t *)a3);

}

void __34__BRCPendingChangesStream__openDB__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;

  v6 = a4;
  v7 = a3;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    __34__BRCPendingChangesStream__openDB__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dbBecameCorrupted:withDescription:", v7, CFSTR("DB Corruption Handler of BRCPendingChangesStream"));

  v6[2](v6);
}

void __34__BRCPendingChangesStream__openDB__block_invoke_159(uint64_t a1, void *a2, void *a3, void *a4)
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
  id WeakRetained;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v17 = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] sqlite error handler called on pending sync db - %@ (%@)%@", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEDD658]))
  {
    v13 = objc_msgSend(v9, "code");

    if (v13 == 13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __34__BRCPendingChangesStream__openDB__block_invoke_159_cold_1();

      exit(1);
    }
  }
  else
  {

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dbBecameCorrupted:withDescription:", v9, CFSTR("DB Error Handler of BRCPendingChangesStream"));

}

void __34__BRCPendingChangesStream__openDB__block_invoke_163(uint64_t a1, void *a2, void *a3, void *a4)
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
  id WeakRetained;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v17 = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] Auto rollback handler called on pending sync db - %@ (%@)%@", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEDD658]))
  {
    v13 = objc_msgSend(v9, "code");

    if (v13 == 13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __34__BRCPendingChangesStream__openDB__block_invoke_159_cold_1();

      exit(1);
    }
  }
  else
  {

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dbBecameCorrupted:withDescription:", v9, CFSTR("Auto Rollback Handler of BRCPendingChangesStream"));

}

- (void)_closeChangeStream
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ - Closing the database (setting to nil)%@");
  OUTLINED_FUNCTION_0();
}

- (void)fetchTokenState:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSError *v11;
  NSError *error;
  _QWORD v13[5];
  void (**v14)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone session](self->_clientZone, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertNotOnZoneMutex");

    if (!self->_error)
    {
      if (v6)
      {
        objc_msgSend(v6, "db");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __43__BRCPendingChangesStream_fetchTokenState___block_invoke;
        v13[3] = &unk_24FE45E88;
        v13[4] = self;
        v14 = v5;
        objc_msgSend(v8, "performWithFlags:action:", 1, v13);

        goto LABEL_7;
      }
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCPendingChangesStream fetchTokenState:].cold.1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Trying to fetch token state without a db"));
      v11 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v11;

    }
    v5[2](v5, 0, 0);
LABEL_7:

    goto LABEL_8;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
LABEL_8:

}

uint64_t __43__BRCPendingChangesStream_fetchTokenState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v4 = a2;
  v5 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT server_token, client_token FROM fetch_state"));
  v6 = objc_msgSend(v5, "next");
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v5, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "longLongAtIndex:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(v5, "error");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      v10 = 0;
      v11 = (void *)v8;
    }
    else
    {
      objc_msgSend(v4, "lastError");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v2 = (void *)v12;
        v10 = 0;
        v11 = (void *)v12;
      }
      else
      {
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          __43__BRCPendingChangesStream_fetchTokenState___block_invoke_cold_1();

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: There should always be one entry"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = 0;
        v10 = 1;
      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v11);
    if (v10)

    if (!v9)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return v6;
}

- (void)fetchQueryCursor:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSError *v11;
  NSError *error;
  _QWORD v13[5];
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v4;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone session](self->_clientZone, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertNotOnZoneMutex");

    if (!self->_error)
    {
      if (v6)
      {
        objc_msgSend(v6, "db");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __44__BRCPendingChangesStream_fetchQueryCursor___block_invoke;
        v13[3] = &unk_24FE45E88;
        v13[4] = self;
        v14 = v5;
        objc_msgSend(v8, "performWithFlags:action:", 1, v13);

        goto LABEL_7;
      }
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCPendingChangesStream fetchQueryCursor:].cold.1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Trying to fetch query cursor without a db"));
      v11 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v11;

    }
    v5[2](v5, 0, 0, 0);
LABEL_7:

    goto LABEL_8;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0, 0);
LABEL_8:

}

uint64_t __44__BRCPendingChangesStream_fetchQueryCursor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  v4 = a2;
  v5 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT cont_token, completed FROM list_state"));
  v6 = objc_msgSend(v5, "next");
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v5, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "BOOLValue");

    v9 = (void *)objc_msgSend(v4, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT server_token FROM fetch_state"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(v5, "error");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v12 = 0;
      v13 = (void *)v10;
    }
    else
    {
      objc_msgSend(v4, "lastError");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v2 = (void *)v14;
        v12 = 0;
        v13 = (void *)v14;
      }
      else
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          __43__BRCPendingChangesStream_fetchTokenState___block_invoke_cold_1();

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: There should always be one entry"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = 0;
        v12 = 1;
      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v13);
    if (v12)

    if (!v11)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return v6;
}

- (BOOL)enumerateRecordsOfType:(int64_t)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v12;
  NSObject *v13;
  NSError *v14;
  NSError *error;
  _QWORD v16[5];
  id v17;
  int64_t v18;

  v6 = a4;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone session](self->_clientZone, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assertNotOnZoneMutex");

    if (!self->_error)
    {
      if (v7)
      {
        objc_msgSend(v7, "db");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __56__BRCPendingChangesStream_enumerateRecordsOfType_block___block_invoke;
        v16[3] = &unk_24FE47ED8;
        v18 = a3;
        v16[4] = self;
        v17 = v6;
        v9 = objc_msgSend(v10, "performWithFlags:action:", 1, v16);

        goto LABEL_7;
      }
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCPendingChangesStream enumerateRecordsOfType:block:].cold.1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Trying to enumerate records without a db"));
      v14 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v14;

    }
    v9 = 0;
LABEL_7:

    goto LABEL_8;
  }
  v9 = 1;
LABEL_8:

  return v9;
}

uint64_t __56__BRCPendingChangesStream_enumerateRecordsOfType_block___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT record_id, record FROM record_changes WHERE record_type = %d"), a1[6]);
  while (objc_msgSend(v4, "next"))
  {
    v5 = (void *)MEMORY[0x2348B9F14]();
    objc_msgSend(v4, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (*(uint64_t (**)(void))(a1[5] + 16))();

    objc_autoreleasePoolPop(v5);
    if ((v8 & 1) == 0)
      goto LABEL_9;
  }
  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "error");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = a1[4];
    v12 = *(void **)(v11 + 16);
    *(_QWORD *)(v11 + 16) = v10;

    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __56__BRCPendingChangesStream_enumerateRecordsOfType_block___block_invoke_cold_1();

LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v15 = 1;
LABEL_10:

  return v15;
}

- (int64_t)_recordTypeFromRecordID:(id)a3 isShare:(BOOL)a4 isDelete:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int64_t v15;

  v5 = a5;
  v7 = a3;
  if (_recordTypeFromRecordID_isShare_isDelete__onceToken == -1)
  {
    if (a4)
    {
LABEL_3:
      v8 = 3;
      goto LABEL_14;
    }
  }
  else
  {
    dispatch_once(&_recordTypeFromRecordID_isShare_isDelete__onceToken, &__block_literal_global_192_0);
    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(v7, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("/"));
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  objc_msgSend(v9, "substringToIndex:", v10 + v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("documentContent/")) & 1) != 0)
  {
    v8 = 2;
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend((id)_recordTypeFromRecordID_isShare_isDelete__structuralRecordPrefixes, "containsObject:", v14))
  {
    v8 = 1;
    goto LABEL_13;
  }

LABEL_6:
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[BRCPendingChangesStream _recordTypeFromRecordID:isShare:isDelete:].cold.1();

  v8 = 0;
LABEL_14:
  if (v5)
    v15 = -v8;
  else
    v15 = v8;

  return v15;
}

void __68__BRCPendingChangesStream__recordTypeFromRecordID_isShare_isDelete___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("alias/");
  v2[1] = CFSTR("shareAlias/");
  v2[2] = CFSTR("symlink/");
  v2[3] = CFSTR("finderBookmark/");
  v2[4] = CFSTR("directory/");
  v2[5] = CFSTR("documentStructure/");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_recordTypeFromRecordID_isShare_isDelete__structuralRecordPrefixes;
  _recordTypeFromRecordID_isShare_isDelete__structuralRecordPrefixes = v0;

}

- (BOOL)saveEditedRecords:(id)a3 deletedRecordIDs:(id)a4 deletedShareIDs:(id)a5 subResourceEditedRecords:(id)a6 serverChangeToken:(id)a7 clientChangeToken:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  BRCPendingChangesStream *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (self->_error)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v19, "db");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke;
    v24[3] = &unk_24FE47F20;
    v25 = v14;
    v26 = self;
    v27 = v15;
    v28 = v16;
    v29 = v17;
    v30 = v18;
    v31 = a8;
    v21 = objc_msgSend(v22, "performWithFlags:action:", 25, v24);

  }
  return v21;
}

uint64_t __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id obj;
  uint64_t v63;
  int v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  uint64_t v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  if (!v4)
  {
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  v5 = v4;
  v65 = *(_QWORD *)v80;
  v63 = *MEMORY[0x24BDB8F28];
  LOBYTE(v6) = 1;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v80 != v65)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
      v9 = (void *)MEMORY[0x2348B9F14]();
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v8, "recordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "_recordTypeFromRecordID:isShare:isDelete:", v11, objc_msgSend(v12, "isEqualToString:", v63), 0);

      if ((v6 & 1) != 0
        && (objc_msgSend(v8, "recordID"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v3, "execute:", CFSTR("INSERT OR REPLACE INTO record_changes (record_id, record_type, record) VALUES (%@, %d, %@)"), v14, v13, v8), v14, v15))
      {
        if (objc_msgSend(v3, "changes") == 1)
          goto LABEL_9;
        v21 = 1;
      }
      else
      {
        v21 = 0;
      }
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v22;
        _os_log_fault_impl(&dword_230455000, v23, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rc && db.changes == 1%@", buf, 0xCu);
      }

      if (!v21)
      {
LABEL_20:
        LOBYTE(v6) = 0;
        goto LABEL_21;
      }
LABEL_9:
      objc_msgSend(v8, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM records_needing_subresources WHERE record_id = %@"), v16);

      if (!v17)
        goto LABEL_20;
      if (objc_msgSend(v3, "changes"))
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "recordID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v87 = v20;
          v88 = 2112;
          v89 = (uint64_t)v18;
          _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Removed item in pending resources table because it was saved %@%@", buf, 0x16u);

        }
      }
      LOBYTE(v6) = 1;
LABEL_21:
      objc_autoreleasePoolPop(v9);
    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  }
  while (v5);
LABEL_25:

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v24 = *(id *)(a1 + 48);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (!v25)
    goto LABEL_47;
  v26 = v25;
  v27 = *(_QWORD *)v76;
  while (2)
  {
    v28 = 0;
    while (2)
    {
      if (*(_QWORD *)v76 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v28);
      v30 = (void *)MEMORY[0x2348B9F14]();
      v31 = objc_msgSend(*(id *)(a1 + 40), "_recordTypeFromRecordID:isShare:isDelete:", v29, 0, 1);
      if ((v6 & 1) != 0
        && objc_msgSend(v3, "execute:", CFSTR("INSERT OR REPLACE INTO record_changes (record_id, record_type, record) VALUES (%@, %d, %@)"), v29, v31, 0))
      {
        if (objc_msgSend(v3, "changes") == 1)
          goto LABEL_33;
        v64 = 1;
      }
      else
      {
        v64 = 0;
      }
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v33;
        _os_log_fault_impl(&dword_230455000, v34, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rc && db.changes == 1%@", buf, 0xCu);
      }

      if (v64)
      {
LABEL_33:
        if (!objc_msgSend(v3, "execute:", CFSTR("DELETE FROM records_needing_subresources WHERE record_id = %@"), v29))goto LABEL_44;
        if (objc_msgSend(v3, "changes"))
        {
          brc_bread_crumbs();
          v6 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v87 = v29;
            v88 = 2112;
            v89 = v6;
            _os_log_impl(&dword_230455000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Removed item in pending resources table because it was deleted %@%@", buf, 0x16u);
          }

          LOBYTE(v6) = 1;
        }
        else
        {
          LOBYTE(v6) = 1;
        }
      }
      else
      {
LABEL_44:
        LOBYTE(v6) = 0;
      }
      objc_autoreleasePoolPop(v30);
      if (v26 != ++v28)
        continue;
      break;
    }
    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    if (v26)
      continue;
    break;
  }
LABEL_47:

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v35 = *(id *)(a1 + 56);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
  if (!v36)
    goto LABEL_62;
  v37 = v36;
  v38 = *(_QWORD *)v72;
  while (2)
  {
    v39 = 0;
    while (2)
    {
      if (*(_QWORD *)v72 != v38)
        objc_enumerationMutation(v35);
      v40 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v39);
      v41 = (void *)MEMORY[0x2348B9F14]();
      v42 = objc_msgSend(*(id *)(a1 + 40), "_recordTypeFromRecordID:isShare:isDelete:", v40, 1, 1);
      if ((v6 & 1) != 0
        && objc_msgSend(v3, "execute:", CFSTR("INSERT OR REPLACE INTO record_changes (record_id, record_type, record) VALUES (%@, %d, %@)"), v40, v42, 0))
      {
        LOBYTE(v6) = 1;
        if (objc_msgSend(v3, "changes") == 1)
          goto LABEL_55;
      }
      else
      {
        LOBYTE(v6) = 0;
      }
      brc_bread_crumbs();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v66;
        _os_log_fault_impl(&dword_230455000, v43, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rc && db.changes == 1%@", buf, 0xCu);
      }

LABEL_55:
      objc_autoreleasePoolPop(v41);
      if (v37 != ++v39)
        continue;
      break;
    }
    v44 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    v37 = v44;
    if (v44)
      continue;
    break;
  }
LABEL_62:

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v45 = *(id *)(a1 + 64);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v46)
  {
    v47 = v46;
    v48 = 0;
    v49 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v68 != v49)
          objc_enumerationMutation(v45);
        v51 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
        v52 = (void *)MEMORY[0x2348B9F14]();
        if ((v6 & 1) != 0)
          LODWORD(v6) = objc_msgSend(*(id *)(a1 + 40), "_saveSubResourceRecord:withDB:", v51, v3);
        else
          LODWORD(v6) = 0;
        objc_autoreleasePoolPop(v52);
      }
      v48 += v47;
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v47);

    if ((_DWORD)v6)
    {
      brc_bread_crumbs();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_2();

LABEL_77:
      if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE fetch_state SET server_token = %@, client_token = %lld"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80)) & 1) != 0)
      {
        v55 = 1;
        goto LABEL_82;
      }
    }
  }
  else
  {

    if ((v6 & 1) != 0)
      goto LABEL_77;
  }
  objc_msgSend(v3, "lastError");
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = *(_QWORD *)(a1 + 40);
  v58 = *(void **)(v57 + 16);
  *(_QWORD *)(v57 + 16) = v56;

  brc_bread_crumbs();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, (os_log_type_t)0x90u))
    __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1();

  v55 = 0;
LABEL_82:

  return v55;
}

- (BOOL)saveEditedRecords:(id)a3 subResourceEditedRecords:(id)a4 queryCursor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  BRCPendingChangesStream *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_error)
  {
    v12 = 0;
  }
  else
  {
    -[BRCClientZone session](self->_clientZone, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assertNotOnZoneMutex");

    objc_msgSend(v11, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke;
    v16[3] = &unk_24FE46108;
    v17 = v8;
    v18 = self;
    v19 = v9;
    v20 = v10;
    v12 = objc_msgSend(v14, "performWithFlags:action:", 25, v16);

  }
  return v12;
}

uint64_t __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (!v4)
    goto LABEL_28;
  v5 = v4;
  v6 = 0;
  v46 = *(_QWORD *)v52;
  v45 = *MEMORY[0x24BDB8F28];
  LOBYTE(v7) = 1;
  do
  {
    v43 = v6;
    v8 = 0;
    do
    {
      if (*(_QWORD *)v52 != v46)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v8);
      v10 = (void *)MEMORY[0x2348B9F14]();
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v9, "recordID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "_recordTypeFromRecordID:isShare:isDelete:", v12, objc_msgSend(v13, "isEqualToString:", v45), 0);

      if ((v7 & 1) != 0
        && (objc_msgSend(v9, "recordID"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v3, "execute:", CFSTR("INSERT OR REPLACE INTO record_changes (record_id, record_type, record) VALUES (%@, %d, %@)"), v15, v14, v9), v15, v16))
      {
        if (objc_msgSend(v3, "changes") == 1)
          goto LABEL_9;
        v21 = 1;
      }
      else
      {
        v21 = 0;
      }
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v22;
        _os_log_fault_impl(&dword_230455000, v23, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rc && db.changes == 1%@", buf, 0xCu);
      }

      if (!v21)
      {
        v7 = 0;
        goto LABEL_15;
      }
LABEL_9:
      objc_msgSend(v9, "recordID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM records_needing_subresources WHERE record_id = %@"), v17);

      if (v7)
      {
        if (objc_msgSend(v3, "changes"))
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "recordID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v57 = v20;
            v58 = 2112;
            v59 = v18;
            _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Removed item in pending resources table because it was saved %@%@", buf, 0x16u);

          }
        }
        v7 = objc_msgSend(*(id *)(a1 + 40), "_finishedFetchingRecordMetadata:withDB:", v9, v3);
      }
LABEL_15:
      objc_autoreleasePoolPop(v10);
      ++v8;
    }
    while (v5 != v8);
    v6 = v43 + v5;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    v5 = v24;
  }
  while (v24);

  if (v7)
  {
    brc_bread_crumbs();
    obj = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke_cold_3();

LABEL_28:
    LOBYTE(v7) = 1;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v26 = *(id *)(a1 + 48);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v48 != v30)
          objc_enumerationMutation(v26);
        v32 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        v33 = (void *)MEMORY[0x2348B9F14]();
        if ((v7 & 1) != 0)
          v7 = objc_msgSend(*(id *)(a1 + 40), "_saveSubResourceRecord:withDB:", v32, v3);
        else
          v7 = 0;
        objc_autoreleasePoolPop(v33);
      }
      v29 += v28;
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v28);

    if (v7)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke_cold_2();

LABEL_44:
      if ((objc_msgSend(v3, "execute:", CFSTR("UPDATE list_state SET cont_token = %@, completed = %d"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56) == 0) & 1) != 0)
      {
        v36 = 1;
        goto LABEL_49;
      }
    }
  }
  else
  {

    if ((v7 & 1) != 0)
      goto LABEL_44;
  }
  objc_msgSend(v3, "lastError");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = *(_QWORD *)(a1 + 40);
  v39 = *(void **)(v38 + 16);
  *(_QWORD *)(v38 + 16) = v37;

  brc_bread_crumbs();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, (os_log_type_t)0x90u))
    __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1();

  v36 = 0;
LABEL_49:

  return v36;
}

- (BOOL)saveSubResourceRecords:(id)a3 afterSavingMainTableItems:(id)a4 queryCursor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  BRCPendingChangesStream *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_error)
  {
    v12 = 0;
  }
  else
  {
    -[BRCClientZone session](self->_clientZone, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assertNotOnZoneMutex");

    objc_msgSend(v11, "db");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke;
    v16[3] = &unk_24FE46108;
    v17 = v8;
    v18 = self;
    v19 = v10;
    v20 = v9;
    v12 = objc_msgSend(v14, "performWithFlags:action:", 25, v16);

  }
  return v12;
}

uint64_t __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM record_changes WHERE 1"));
  LOBYTE(v5) = v4;
  if (v4 && objc_msgSend(v3, "changes"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_3();

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x2348B9F14]();
        if ((v5 & 1) != 0)
          v5 = objc_msgSend(*(id *)(a1 + 40), "_saveSubResourceRecord:withDB:", v14, v3);
        else
          v5 = 0;
        objc_autoreleasePoolPop(v15);
      }
      v11 += v10;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v10);

    if (v5)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_2();

      goto LABEL_21;
    }
  }
  else
  {

    if ((v5 & 1) != 0)
    {
LABEL_21:
      v18 = objc_msgSend(v3, "execute:", CFSTR("UPDATE list_state SET cont_token = %@, completed = %d"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48) == 0);
      goto LABEL_23;
    }
  }
  v18 = 0;
LABEL_23:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = *(id *)(a1 + 56);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        if ((v18 & 1) != 0
          && (v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j),
              objc_msgSend(v24, "recordID"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v26 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM records_needing_subresources WHERE record_id = %@ AND record_id_needing_fetch = record_id"), v25), v25, v26))
        {
          if (objc_msgSend(v3, "changes"))
          {
            brc_bread_crumbs();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v24, "recordID");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v45 = v35;
              v46 = 2112;
              v47 = v27;
              _os_log_debug_impl(&dword_230455000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleted %@ from the pending subResources table because it was persisted directly to the server truth%@", buf, 0x16u);

            }
          }
          v18 = objc_msgSend(*(id *)(a1 + 40), "_finishedFetchingRecordMetadata:withDB:", v24, v3);
        }
        else
        {
          v18 = 0;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v21);
  }

  if ((v18 & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(void **)(v30 + 16);
    *(_QWORD *)(v30 + 16) = v29;

    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_1();

  }
  return v18;
}

- (int64_t)copyBlockingSaveRecordsToNeedingFetchIgnoringRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_error)
    {
      v7 = 0;
    }
    else
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      objc_msgSend(v5, "db");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __80__BRCPendingChangesStream_copyBlockingSaveRecordsToNeedingFetchIgnoringRecords___block_invoke;
      v10[3] = &unk_24FE47F48;
      v10[4] = &v11;
      objc_msgSend(v8, "performWithFlags:action:", 9, v10);

      v7 = v12[3];
      _Block_object_dispose(&v11, 8);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __80__BRCPendingChangesStream_copyBlockingSaveRecordsToNeedingFetchIgnoringRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "execute:", CFSTR("UPDATE records_needing_subresources AS pr   SET record_id_needing_fetch = record_id_blocking_save WHERE record_id_blocking_save IS NOT NULL AND NOT EXISTS (SELECT 1 FROM records_needing_subresources AS sr WHERE pr.record_id_blocking_save = sr.record_id LIMIT 1)"));
  if ((_DWORD)v4)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "changes");

  return v4;
}

- (BOOL)enumerateRecordsNeedingXattrFetchWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_error)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "db");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __70__BRCPendingChangesStream_enumerateRecordsNeedingXattrFetchWithBlock___block_invoke;
      v10[3] = &unk_24FE47F70;
      v10[4] = self;
      v11 = v4;
      v7 = objc_msgSend(v8, "performWithFlags:action:", 1, v10);

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

BOOL __70__BRCPendingChangesStream_enumerateRecordsNeedingXattrFetchWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;

  v3 = (void *)objc_msgSend(a2, "fetch:", CFSTR("SELECT record, xattr_sig FROM records_needing_subresources WHERE xattr_sig IS NOT NULL GROUP BY xattr_sig"));
  do
  {
    if (!objc_msgSend(v3, "next"))
      break;
    objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "etag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v5);

  }
  while ((v6 & 1) != 0);
  objc_msgSend(v3, "error");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v9;

  objc_msgSend(v3, "close");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) == 0;

  return v12;
}

- (BOOL)enumerateRecordsNeedingMetadataFetchWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_error)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "db");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __73__BRCPendingChangesStream_enumerateRecordsNeedingMetadataFetchWithBlock___block_invoke;
      v10[3] = &unk_24FE47F70;
      v10[4] = self;
      v11 = v4;
      v7 = objc_msgSend(v8, "performWithFlags:action:", 1, v10);

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

BOOL __73__BRCPendingChangesStream_enumerateRecordsNeedingMetadataFetchWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v3 = (void *)objc_msgSend(a2, "fetch:", CFSTR("SELECT record_id_needing_fetch FROM records_needing_subresources WHERE record_id_needing_fetch IS NOT NULL GROUP BY record_id_needing_fetch"));
  do
  {
    if (!objc_msgSend(v3, "next"))
      break;
    objc_msgSend(v3, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  while ((v5 & 1) != 0);
  objc_msgSend(v3, "error");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;

  objc_msgSend(v3, "close");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) == 0;

  return v9;
}

- (BOOL)hasFetchRecordByID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_error)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v5, "db");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __46__BRCPendingChangesStream_hasFetchRecordByID___block_invoke;
      v10[3] = &unk_24FE40140;
      v11 = v4;
      v7 = objc_msgSend(v8, "performWithFlags:action:", 1, v10);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __46__BRCPendingChangesStream_hasFetchRecordByID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM record_changes WHERE record_id = %@ LIMIT 1"), *(_QWORD *)(a1 + 32));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasRecordIDBlockedOnSubResources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_error)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v5, "db");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __60__BRCPendingChangesStream_hasRecordIDBlockedOnSubResources___block_invoke;
      v10[3] = &unk_24FE40140;
      v11 = v4;
      v7 = objc_msgSend(v8, "performWithFlags:action:", 1, v10);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __60__BRCPendingChangesStream_hasRecordIDBlockedOnSubResources___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM records_needing_subresources WHERE record_id = %@ LIMIT 1"), *(_QWORD *)(a1 + 32));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasRecordIDsToDeserialize
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (!self->_hasBeenCreated)
    return 0;
  -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_error)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "performWithFlags:action:", 1, &__block_literal_global_218);

  }
  return v5;
}

uint64_t __52__BRCPendingChangesStream_hasRecordIDsToDeserialize__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM records_needing_subresources WHERE record_id_needing_fetch IS NOT NULL LIMIT 1"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasXattrsToFetch
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (!self->_hasBeenCreated)
    return 0;
  -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_error)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "performWithFlags:action:", 1, &__block_literal_global_221);

  }
  return v5;
}

uint64_t __43__BRCPendingChangesStream_hasXattrsToFetch__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM records_needing_subresources WHERE xattr_sig IS NOT NULL LIMIT 1"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasSubResourceRecords
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (!self->_hasBeenCreated)
    return 0;
  -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_error)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "performWithFlags:action:", 1, &__block_literal_global_224);

  }
  return v5;
}

uint64_t __48__BRCPendingChangesStream_hasSubResourceRecords__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM records_needing_subresources LIMIT 1"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSError *error;
  BOOL v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v8 = a3;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    v11 = error == 0;
    if (error)
    {
      if (a5)
        *a5 = objc_retainAutorelease(error);
    }
    else
    {
      objc_msgSend(v9, "db");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __69__BRCPendingChangesStream_dumpTablesToContext_includeAllItems_error___block_invoke;
      v14[3] = &unk_24FE3F978;
      v16 = a4;
      v15 = v8;
      objc_msgSend(v12, "performWithFlags:action:", 1, v14);

    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __69__BRCPendingChangesStream_dumpTablesToContext_includeAllItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@"), CFSTR("records_needing_subresources"));
  objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("============"));
  v5 = 1000;
  if (v4)
    v6 = 0xFFFFFFFFLL;
  else
    v6 = 1000;
  v23 = v6;
  v24 = v3;
  if (v4)
    v5 = -1;
  v7 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT record_id, xattr_sig, record_id_needing_fetch, record_id_blocking_save FROM records_needing_subresources LIMIT %u"), v5);
  if (objc_msgSend(v7, "next"))
  {
    while ((objc_msgSend(*(id *)(a1 + 32), "shouldKeepDumpingWithItemCount:includeAllItems:", 0, *(unsigned __int8 *)(a1 + 40)) & 1) != 0)
    {
      objc_msgSend(v7, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectOfClass:atIndex:", objc_opt_class(), 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectOfClass:atIndex:", objc_opt_class(), 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recordName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("+ recordID:%@ xattrSig:%@ NF:%@ BS:%@"), v13, v9, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@"), v16);
      if ((objc_msgSend(v7, "next") & 1) == 0)
        goto LABEL_11;
    }
    objc_msgSend(v7, "close");
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@"), CFSTR("record_changes"));
  objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("============"));
  v17 = (void *)objc_msgSend(v24, "fetch:", CFSTR("SELECT record_id FROM record_changes LIMIT %u"), v23);

  if (objc_msgSend(v17, "next"))
  {
    while ((objc_msgSend(*(id *)(a1 + 32), "shouldKeepDumpingWithItemCount:includeAllItems:", 0, *(unsigned __int8 *)(a1 + 40)) & 1) != 0)
    {
      objc_msgSend(v17, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v18, "recordName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("+ recordID:%@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@"), v21);
      if ((objc_msgSend(v17, "next") & 1) == 0)
        goto LABEL_16;
    }
    objc_msgSend(v17, "close");
  }
LABEL_16:

  return 1;
}

- (BOOL)hasRecordDeletes
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (!self->_hasBeenCreated)
    return 0;
  -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_error)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "performWithFlags:action:", 1, &__block_literal_global_243);

  }
  return v5;
}

uint64_t __43__BRCPendingChangesStream_hasRecordDeletes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM record_changes WHERE record IS NULL LIMIT 1"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_saveSubResourceRecord:(id)a3 withDB:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *error;
  NSObject *v23;
  BOOL v24;
  NSError *v25;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "execute:", CFSTR("DELETE FROM record_changes WHERE record_id = %@"), v8);

  if (v9)
  {
    if (objc_msgSend(v7, "changes"))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "recordID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = (uint64_t)v12;
        v31 = 2112;
        v32 = v10;
        _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Removed recordID %@ from record changes table because it now needs sub resources%@", buf, 0x16u);

      }
    }
    objc_msgSend(v6, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "recordType");
    objc_msgSend(v6, "record");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "xattrSignature");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordIDNeedingFetch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordIDBlockingSave");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "execute:", CFSTR("INSERT OR REPLACE INTO records_needing_subresources (record_id, record_type, record, xattr_sig, record_id_needing_fetch, record_id_blocking_save) VALUES (%@, %ld, %@, %@, %@, %@)"), v13, v14, v15, v16, v17, v18);

  }
  objc_msgSend(v6, "record");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if ((v9 & 1) != 0)
      goto LABEL_15;
LABEL_16:
    objc_msgSend(v7, "lastError");
    v25 = (NSError *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    error = self->_error;
    self->_error = v25;
LABEL_17:

    goto LABEL_18;
  }
  if (!v9)
    goto LABEL_16;
  objc_msgSend(v6, "recordID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v7, "execute:", CFSTR("UPDATE records_needing_subresources SET record_id_needing_fetch = NULL WHERE record_id_needing_fetch = %@"), v20);

  if (!v21)
    goto LABEL_16;
  if (objc_msgSend(v7, "changes"))
  {
    brc_bread_crumbs();
    error = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v27 = objc_msgSend(v7, "changes");
      objc_msgSend(v6, "recordID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v30 = v27;
      v31 = 2112;
      v32 = v28;
      v33 = 2112;
      v34 = error;
      _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Unblocked %lld records waiting on save of %@ even though it's a sub-resource record%@", buf, 0x20u);

    }
    v24 = 1;
    goto LABEL_17;
  }
LABEL_15:
  v24 = 1;
LABEL_18:

  return v24;
}

- (void)finishedFetchingXattrSignatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BRCPendingChangesStream *v11;

  v4 = a3;
  if (self->_hasBeenCreated)
  {
    v8 = v4;
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!self->_error)
    {
      objc_msgSend(v5, "db");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __59__BRCPendingChangesStream_finishedFetchingXattrSignatures___block_invoke;
      v9[3] = &unk_24FE41988;
      v10 = v8;
      v11 = self;
      objc_msgSend(v7, "performWithFlags:action:", 9, v9);

    }
    v4 = v8;
  }

}

uint64_t __59__BRCPendingChangesStream_finishedFetchingXattrSignatures___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v5)
  {
    v6 = v5;
    v18 = a1;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (!objc_msgSend(v3, "execute:", CFSTR("UPDATE records_needing_subresources SET xattr_sig = NULL WHERE xattr_sig = %@"), v9))
        {
          objc_msgSend(v3, "lastError");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(v18 + 40);
          v16 = *(void **)(v15 + 16);
          *(_QWORD *)(v15 + 16) = v14;

          v13 = 0;
          goto LABEL_15;
        }
        if (objc_msgSend(v3, "changes"))
        {
          brc_bread_crumbs();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v12 = objc_msgSend(v3, "changes");
            *(_DWORD *)buf = 134218498;
            v24 = v12;
            v25 = 2112;
            v26 = v9;
            v27 = 2112;
            v28 = v10;
            _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items which no longer need to fetch xattr %@%@", buf, 0x20u);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_15:

  return v13;
}

- (void)unblockRecordSavesWaitingOnRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BRCPendingChangesStream *v11;

  v4 = a3;
  if (self->_hasBeenCreated)
  {
    v8 = v4;
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!self->_error)
    {
      objc_msgSend(v5, "db");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __63__BRCPendingChangesStream_unblockRecordSavesWaitingOnRecordID___block_invoke;
      v9[3] = &unk_24FE41988;
      v10 = v8;
      v11 = self;
      objc_msgSend(v7, "performWithFlags:action:", 9, v9);

    }
    v4 = v8;
  }

}

uint64_t __63__BRCPendingChangesStream_unblockRecordSavesWaitingOnRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM records_needing_subresources WHERE record_id = %@ AND record IS NULL"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "changes"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v21 = v15;
      v22 = 2048;
      v23 = objc_msgSend(v3, "changes");
      v24 = 2112;
      v25 = v5;
      _os_log_error_impl(&dword_230455000, v6, (os_log_type_t)0x90u, "[ERROR] We couldn't fetch recordID %@ so it's not going to save. We deleted %lld items from pending subresources table for this%@", buf, 0x20u);
    }

  }
  if ((_DWORD)v4)
    v4 = objc_msgSend(v3, "execute:", CFSTR("UPDATE records_needing_subresources SET record_id_needing_fetch = NULL WHERE record_id_needing_fetch = %@"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "changes"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = objc_msgSend(v3, "changes");
      *(_DWORD *)buf = 138412802;
      v21 = v16;
      v22 = 2048;
      v23 = v17;
      v24 = 2112;
      v25 = v7;
      _os_log_error_impl(&dword_230455000, v8, (os_log_type_t)0x90u, "[ERROR] We couldn't fetch recordID %@ so it's not going to save. We marked %lld as not needing fetch anymore%@", buf, 0x20u);
    }

  }
  if ((_DWORD)v4)
    v4 = objc_msgSend(v3, "execute:", CFSTR("UPDATE records_needing_subresources SET record_id_blocking_save = NULL WHERE record_id_blocking_save = %@"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "changes"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = objc_msgSend(v3, "changes");
      *(_DWORD *)buf = 138412802;
      v21 = v18;
      v22 = 2048;
      v23 = v19;
      v24 = 2112;
      v25 = v9;
      _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] We couldn't fetch recordID %@ so it's not going to save. We marked %lld as not blocked for save anymore%@", buf, 0x20u);
    }

  }
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v3, "lastError");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v11;

  }
  return v4;
}

- (BOOL)unblockRecord:(id)a3 waitingOnRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (self->_hasBeenCreated)
  {
    -[BRCPendingChangesStream _getChangesStreamSafeDBHolder](self, "_getChangesStreamSafeDBHolder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (self->_error)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "db");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __57__BRCPendingChangesStream_unblockRecord_waitingOnRecord___block_invoke;
      v13[3] = &unk_24FE41988;
      v14 = v6;
      v15 = v7;
      v10 = objc_msgSend(v11, "performWithFlags:action:", 9, v13);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __57__BRCPendingChangesStream_unblockRecord_waitingOnRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "execute:", CFSTR("UPDATE records_needing_subresources SET record_id_blocking_save = NULL WHERE record_id = %@ AND record_id_blocking_save = %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40))&& objc_msgSend(v3, "changes"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "recordName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "recordName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Unblocked record %@ blocked on record %@%@", buf, 0x20u);

    }
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_finishedFetchingRecordMetadata:(id)a3 withDB:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "assertOnQueue");
  if ((objc_msgSend(v6, "isInTransaction") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCPendingChangesStream _finishedFetchingRecordMetadata:withDB:].cold.1();

  }
  objc_msgSend(v5, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "execute:", CFSTR("UPDATE records_needing_subresources SET record_id_needing_fetch = NULL WHERE record_id_needing_fetch = %@"), v7))goto LABEL_13;
  if (objc_msgSend(v6, "changes"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v18 = objc_msgSend(v6, "changes");
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items to be unblocked for fetching %@%@", buf, 0x20u);
    }

  }
  if (objc_msgSend(v6, "execute:", CFSTR("UPDATE records_needing_subresources SET record_id_blocking_save = NULL WHERE record_id_blocking_save = %@"), v7))
  {
    if (objc_msgSend(v6, "changes"))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v14 = objc_msgSend(v6, "changes");
        *(_DWORD *)buf = 134218498;
        v18 = v14;
        v19 = 2112;
        v20 = v7;
        v21 = 2112;
        v22 = v10;
        _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items to be unblocked for saving %@%@", buf, 0x20u);
      }

    }
    v12 = 1;
  }
  else
  {
LABEL_13:
    v12 = 0;
  }

  return v12;
}

- (BOOL)hasBeenCreated
{
  return self->_hasBeenCreated;
}

- (void)destroyDatabase
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ - Destroying the database%@");
  OUTLINED_FUNCTION_0();
}

- (id)lastError
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_startingChangeToken, 0);
  objc_storeStrong((id *)&self->_dbSafeHolder, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_getChangesStreamSafeDBHolder
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Opening changes stream %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_dbBecameCorrupted:withDescription:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Deleting database at path: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_dbBecameCorrupted:withDescription:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] We are in an error scenario, trying to close the DB, but it's busy - let's avoid dealloc it%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_dbBecameCorrupted:withDescription:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] error closing BRCPendingChangesStream DB connection: %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_dropExistingTablesWithDB:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 8), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] Dropping pending fetch table at %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, v3, "[CRIT] UNREACHABLE: Failed to set the cache spill - %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __51__BRCPendingChangesStream__createSchemaIfNecessary__block_invoke_cold_2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, v3, "[CRIT] UNREACHABLE: Failed to set the cache size - %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __34__BRCPendingChangesStream__openDB__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] db corruption handler called on pending sync db%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __34__BRCPendingChangesStream__openDB__block_invoke_159_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] disk is full - exiting%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)fetchTokenState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Trying to fetch token state without a db%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __43__BRCPendingChangesStream_fetchTokenState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: There should always be one entry%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)fetchQueryCursor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Trying to fetch query cursor without a db%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)enumerateRecordsOfType:block:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Trying to enumerate records without a db%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __56__BRCPendingChangesStream_enumerateRecordsOfType_block___block_invoke_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, v3, "[CRIT] UNREACHABLE: Failed enumerating records - %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_recordTypeFromRecordID:isShare:isDelete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: recordType != 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Failed saving to the pending changes stream - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __139__BRCPendingChangesStream_saveEditedRecords_deletedRecordIDs_deletedShareIDs_subResourceEditedRecords_serverChangeToken_clientChangeToken___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Persisted %llu records needing subResource fetch%@");
  OUTLINED_FUNCTION_0();
}

void __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Persisted %llu sub resource records which need fetch%@");
  OUTLINED_FUNCTION_0();
}

void __82__BRCPendingChangesStream_saveEditedRecords_subResourceEditedRecords_queryCursor___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Persisted %llu records which are fully fetched%@");
  OUTLINED_FUNCTION_0();
}

void __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_15_1(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Failed to save subResource records after saving main table items - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Persisted %lld subResource records to the pending changes db%@");
  OUTLINED_FUNCTION_0();
}

void __88__BRCPendingChangesStream_saveSubResourceRecords_afterSavingMainTableItems_queryCursor___block_invoke_cold_3()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "changes");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v2, "[DEBUG] Removed %llu records from the pending fetches table because we should have just saved them%@", v3);
}

- (void)_finishedFetchingRecordMetadata:withDB:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: db.isInTransaction%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
