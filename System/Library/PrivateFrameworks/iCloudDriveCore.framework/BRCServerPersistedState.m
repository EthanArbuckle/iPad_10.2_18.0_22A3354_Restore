@implementation BRCServerPersistedState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setNextRank:(int64_t)a3
{
  if (self->_nextRank != a3)
  {
    self->_needsSave = 1;
    self->_nextRank = a3;
  }
}

- (void)setLastSyncDownDate:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastSyncDownDate, "isEqualToDate:"))
  {
    self->_needsSave = 1;
    objc_storeStrong((id *)&self->_lastSyncDownDate, a3);
  }

}

- (void)setMinLastUsedTime:(unint64_t)a3
{
  if (self->_minLastUsedTime != a3)
  {
    self->_needsSave = 1;
    self->_minLastUsedTime = a3;
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dumpDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "stringFromDate:", self->_lastSyncDownDate);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("never");
  if (v6)
    v8 = (const __CFString *)v6;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("last-sync:%@ nextRank:%lld minUsedTime:%lld shared-db{%@}"), v8, self->_nextRank, self->_minLastUsedTime, self->_sharedDatabaseChangeState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BRCServerPersistedState)init
{
  BRCServerPersistedState *v2;
  BRCServerPersistedState *v3;
  BRCServerChangeState *v4;
  BRCServerChangeState *sharedDatabaseChangeState;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCServerPersistedState;
  v2 = -[BRCServerPersistedState init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nextRank = 1;
    v4 = objc_alloc_init(BRCServerChangeState);
    sharedDatabaseChangeState = v3->_sharedDatabaseChangeState;
    v3->_sharedDatabaseChangeState = v4;

    v3->_needsSave = 1;
  }
  return v3;
}

- (BRCServerPersistedState)initWithState:(id)a3
{
  _QWORD *v4;
  BRCServerPersistedState *v5;
  BRCServerPersistedState *v6;
  void *v7;
  BRCServerChangeState *v8;
  BRCServerChangeState *sharedDatabaseChangeState;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCServerPersistedState;
  v5 = -[BRCServerPersistedState init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_nextRank = v4[4];
    v7 = (void *)v4[6];
    if (v7)
      v8 = v7;
    else
      v8 = objc_alloc_init(BRCServerChangeState);
    sharedDatabaseChangeState = v6->_sharedDatabaseChangeState;
    v6->_sharedDatabaseChangeState = v8;

    v6->_minLastUsedTime = v4[7];
    v6->_needsSave = 1;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithState:", self);
}

- (BRCServerPersistedState)initWithCoder:(id)a3
{
  id v4;
  BRCServerPersistedState *v5;
  void *v6;
  void *v7;
  BRCServerChangeState *v8;
  BRCServerChangeState *sharedDatabaseChangeState;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *pendingMigrations;
  uint64_t v18;
  NSDate *lastSyncDownDate;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCServerPersistedState;
  v5 = -[BRCServerPersistedState init](&v21, sel_init);
  if (v5)
  {
    v5->_nextRank = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("nextRank"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareDatabase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = objc_alloc_init(BRCServerChangeState);
    sharedDatabaseChangeState = v5->_sharedDatabaseChangeState;
    v5->_sharedDatabaseChangeState = v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("migrationQuery"));
    v16 = objc_claimAutoreleasedReturnValue();
    pendingMigrations = v5->_pendingMigrations;
    v5->_pendingMigrations = (NSMutableDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lsdDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastSyncDownDate = v5->_lastSyncDownDate;
    v5->_lastSyncDownDate = (NSDate *)v18;

    v5->_minLastUsedTime = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("minUsedTime"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t nextRank;
  id v5;

  nextRank = self->_nextRank;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", nextRank, CFSTR("nextRank"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedDatabaseChangeState, CFSTR("shareDatabase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingMigrations, CFSTR("migrationQuery"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSyncDownDate, CFSTR("lsdDate"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_minLastUsedTime, CFSTR("minUsedTime"));

}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(a3, a4, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

- (id)_stateToData
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (BOOL)_hasStateChangesWithResultingState:(id *)a3
{
  id v5;
  BOOL result;
  void *v7;
  NSObject *v8;

  if (!a3)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCServerPersistedState _hasStateChangesWithResultingState:].cold.1((uint64_t)v7, v8);

  }
  -[BRCServerPersistedState _stateToData](self, "_stateToData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v5;
  if (!self->_needsSave)
  {
    if (-[NSData isEqualToData:](self->_originalServerPersistedState, "isEqualToData:", v5))
    {
      result = 0;
      *a3 = 0;
      return result;
    }
    v5 = *a3;
  }
  objc_storeStrong((id *)&self->_originalServerPersistedState, v5);
  self->_needsSave = 1;
  return *a3 != 0;
}

- (void)saveToDB:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  id v13;

  v4 = a3;
  v13 = 0;
  v5 = -[BRCServerPersistedState _hasStateChangesWithResultingState:](self, "_hasStateChangesWithResultingState:", &v13);
  v6 = v13;
  v7 = v13;
  v8 = v7;
  if (v5)
  {
    if ((objc_msgSend(v4, "execute:", CFSTR("UPDATE server_state SET state = %@"), v7) & 1) == 0)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unable to update the server_state"));
      v9 = objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BRCServerPersistedState saveToDB:].cold.1(v9, (uint64_t)v10, v11);

      brc_append_system_info_to_message();
      v12 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCServerPersistedState saveToDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCServerPersistedState.m", 304, v12);
    }
    objc_storeStrong((id *)&self->_originalServerPersistedState, v6);
    self->_needsSave = 0;
  }

}

- (BOOL)mangledIDIsPendingMigration:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMigrations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)initiateMigrationQueryForMangledIDs:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *pendingMigrations;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
        pendingMigrations = self->_pendingMigrations;
        if (!pendingMigrations)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          v16 = self->_pendingMigrations;
          self->_pendingMigrations = v15;

          pendingMigrations = self->_pendingMigrations;
        }
        -[NSMutableDictionary objectForKeyedSubscript:](pendingMigrations, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v18 = self->_pendingMigrations;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v13);
        }
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  self->_needsSave = 1;
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[BRCServerPersistedState initiateMigrationQueryForMangledIDs:key:].cold.1((uint64_t)self);

}

- (void)abortMigrationsOfMigrationKey:(id)a3
{
  id v4;
  NSMutableDictionary *pendingMigrations;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pendingMigrations = self->_pendingMigrations;
  if (pendingMigrations)
  {
    -[NSMutableDictionary allKeys](pendingMigrations, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMigrations, "objectForKeyedSubscript:", v13, (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "removeObjectForKey:", v4);
            if (!objc_msgSend(v15, "count"))
              -[NSMutableDictionary removeObjectForKey:](self->_pendingMigrations, "removeObjectForKey:", v13);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    if (!-[NSMutableDictionary count](self->_pendingMigrations, "count"))
    {
      v16 = self->_pendingMigrations;
      self->_pendingMigrations = 0;

    }
    self->_needsSave = 1;

  }
}

- (id)migrationQueryKeyForMangledID:(id)a3 continuationCursor:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  __int128 v27;
  id *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMigrations, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v28 = a4;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    +[BRCMigrationQueryOperation allMigrationKeysOrdered](BRCMigrationQueryOperation, "allMigrationKeysOrdered");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v31;
      *(_QWORD *)&v9 = 138412546;
      v27 = v9;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        +[BRCMigrationQueryOperation folderShareAliasesMigrationKey](BRCMigrationQueryOperation, "folderShareAliasesMigrationKey", v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) == 0)
          break;
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "shouldMigrateFetchShareAliases");

        if ((v16 & 1) != 0)
          goto LABEL_13;
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v27;
          v35 = v29;
          v36 = 2112;
          v37 = v17;
          _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring share alias migration key for %@ because the user default is no%@", buf, 0x16u);
        }

LABEL_14:
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_16;
        }
      }

LABEL_13:
      objc_msgSend(v6, "objectForKeyedSubscript:", v13);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v22 = (void *)v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v22 = 0;
        }
        v20 = objc_retainAutorelease(v22);
        *v28 = v20;
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          prettyPrintQueryCursor(v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v35 = v29;
          v36 = 2112;
          v37 = v13;
          v38 = 2112;
          v39 = v26;
          v40 = 2112;
          v41 = v23;
          _os_log_debug_impl(&dword_230455000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] pending migration for %@: %@ from cursor:%@%@", buf, 0x2Au);

        }
        v21 = v13;
        goto LABEL_24;
      }
      goto LABEL_14;
    }
LABEL_16:

    *v28 = 0;
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BRCServerPersistedState migrationQueryKeyForMangledID:continuationCursor:].cold.1((uint64_t)v29);
    v21 = 0;
LABEL_24:

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)migrationQueryForMangledID:(id)a3 key:(id)a4 didUpdateWithCursor:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary **p_pendingMigrations;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableDictionary *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_pendingMigrations = &self->_pendingMigrations;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMigrations, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (v10)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v9);
    }
    else
    {
      objc_msgSend(v12, "removeObjectForKey:", v9);
      if (!objc_msgSend(v13, "count"))
      {
        -[NSMutableDictionary removeObjectForKey:](*p_pendingMigrations, "removeObjectForKey:", v8);
        if (!-[NSMutableDictionary count](*p_pendingMigrations, "count"))
        {
          v16 = *p_pendingMigrations;
          *p_pendingMigrations = 0;

        }
      }
    }
    self->_needsSave = 1;
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCServerPersistedState migrationQueryForMangledID:key:didUpdateWithCursor:].cold.2(p_pendingMigrations);
  }
  else
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCServerPersistedState migrationQueryForMangledID:key:didUpdateWithCursor:].cold.1((uint64_t)v8);
  }

}

- (id)dumpMigrationQueriesForMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, _BYTE *);
  void *v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[4];

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingMigrations, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("{"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = "";
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __60__BRCServerPersistedState_dumpMigrationQueriesForMangledID___block_invoke;
    v12 = &unk_24FE49FE8;
    v7 = v6;
    v13 = v7;
    v14 = v15;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v9);
    objc_msgSend(v7, "appendString:", CFSTR("}"), v9, v10, v11, v12);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __60__BRCServerPersistedState_dumpMigrationQueriesForMangledID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = a3;
  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  prettyPrintQueryCursor(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendFormat:", CFSTR("%s%@:%@"), v8, v10, v12);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = " ";
  *a4 = 0;
}

- (int64_t)nextRank
{
  return self->_nextRank;
}

- (NSDate)lastSyncDownDate
{
  return self->_lastSyncDownDate;
}

- (BRCServerChangeState)sharedDatabaseChangeState
{
  return (BRCServerChangeState *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSharedDatabaseChangeState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)minLastUsedTime
{
  return self->_minLastUsedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDatabaseChangeState, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
  objc_storeStrong((id *)&self->_originalServerPersistedState, 0);
  objc_storeStrong((id *)&self->_pendingMigrations, 0);
}

- (void)_hasStateChangesWithResultingState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: data%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)saveToDB:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  brc_append_system_info_to_message();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_4_0(&dword_230455000, a3, v6, "[CRIT] %@%@", (uint8_t *)&v7);

}

- (void)initiateMigrationQueryForMangledIDs:(uint64_t)a1 key:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 8);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] pending migrations: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)migrationQueryKeyForMangledID:(uint64_t)a1 continuationCursor:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] no pending migration for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)migrationQueryForMangledID:(uint64_t)a1 key:didUpdateWithCursor:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: unknown migration completed for container %@%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)migrationQueryForMangledID:(_QWORD *)a1 key:didUpdateWithCursor:.cold.2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] pending migrations: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

@end
