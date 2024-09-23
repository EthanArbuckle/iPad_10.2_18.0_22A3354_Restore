@implementation WBSHistorySQLiteSchema

- (int)migrateToCurrentSchemaVersionIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intAtIndex:", 0);

  objc_msgSend(v3, "statement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  if (v5 > 15)
    goto LABEL_68;
  if (v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v22 = v5;
      v23 = 1024;
      v24 = 16;
      _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "History database has schema version of %d. Migrating to schema version %d.", buf, 0xEu);
    }
    --v5;
    while (v5 != 15)
    {
      v8 = -[WBSHistorySQLiteSchema _migrateToSchemaVersion:](self, "_migrateToSchemaVersion:", (v5 + 2));
      ++v5;
      if (v8 != 101)
        goto LABEL_68;
    }
    v12 = WBS_LOG_CHANNEL_PREFIXHistory();
    v5 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v22 = 16;
      _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "History database now has schema version of %d.", buf, 8u);
    }
    goto LABEL_68;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_items (id INTEGER PRIMARY KEY AUTOINCREMENT,url TEXT NOT NULL UNIQUE,domain_expansion TEXT NULL,visit_count INTEGER NOT NULL,daily_visit_counts BLOB NOT NULL,weekly_visit_counts BLOB NULL,autocomplete_triggers BLOB NULL,should_recompute_derived_visit_counts INTEGER NOT NULL,visit_count_score INTEGER NOT NULL,status_code INTEGER NOT NULL DEFAULT 0)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.12();
    }
LABEL_63:

LABEL_67:
    v5 = 0;
    goto LABEL_68;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_visits (id INTEGER PRIMARY KEY AUTOINCREMENT,history_item INTEGER NOT NULL REFERENCES history_items(id) ON DELETE CASCADE,visit_time REAL NOT NULL,title TEXT NULL,load_successful BOOLEAN NOT NULL DEFAULT 1,http_non_get BOOLEAN NOT NULL DEFAULT 0,synthesized BOOLEAN NOT NULL DEFAULT 0,redirect_source INTEGER NULL UNIQUE REFERENCES history_visits(id) ON DELETE CASCADE,redirect_destination INTEGER NULL UNIQUE REFERENCES history_visits(id) ON DELETE CASCADE,origin INTEGER NOT NULL DEFAULT 0,generation INTEGER NOT NULL DEFAULT 0,attributes INTEGER NOT NULL DEFAULT 0,score INTEGER NOT NULL DEFAULT 0)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.11();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_tombstones (id INTEGER PRIMARY KEY AUTOINCREMENT,start_time REAL NOT NULL,end_time REAL NOT NULL,url TEXT,generation INTEGER NOT NULL DEFAULT 0)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.10();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE metadata (key TEXT NOT NULL UNIQUE, value)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.9();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_client_versions (client_version INTEGER PRIMARY KEY,last_seen REAL NOT NULL)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.8();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_event_listeners (listener_name TEXT PRIMARY KEY NOT NULL UNIQUE,last_seen REAL NOT NULL)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.7();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_events (id INTEGER PRIMARY KEY AUTOINCREMENT,event_type TEXT NOT NULL,event_time REAL NOT NULL,pending_listeners TEXT NOT NULL,value BLOB)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.6();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_tags (id INTEGER PRIMARY KEY,type INTEGER NOT NULL,level INTEGER NOT NULL,identifier TEXT NOT NULL,title TEXT NOT NULL,modification_timestamp REAL NOT NULL,item_count INTEGER NOT NULL DEFAULT 0)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.5();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_items_to_tags (history_item INTEGER NOT NULL,tag_id INTEGER NOT NULL,timestamp REAL NOT NULL,FOREIGN KEY(tag_id) REFERENCES history_tags(id) ON DELETE CASCADE,FOREIGN KEY(history_item) REFERENCES history_items(id) ON DELETE CASCADE,UNIQUE(history_item, tag_id) ON CONFLICT REPLACE)")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.4();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TRIGGER increment_count_on_insert AFTER INSERT ON history_items_to_tags BEGIN  UPDATE history_tags SET item_count = item_count + 1 WHERE id = NEW.tag_id;END;")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.3();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TRIGGER decrement_count_on_delete BEFORE DELETE ON history_items_to_tags BEGIN  UPDATE history_tags SET item_count = item_count - 1 WHERE id = OLD.tag_id;END;")) != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.2();
    }
    goto LABEL_63;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(&unk_1E4B876D0, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(&unk_1E4B876D0);
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, *(void **)(*((_QWORD *)&v16 + 1) + 8 * i)) != 101)
        {
          v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.1();
          }

          goto LABEL_67;
        }
      }
      v9 = objc_msgSend(&unk_1E4B876D0, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  -[WBSHistorySQLiteSchema _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", 16);
  -[WBSHistorySQLiteSchema _migrateLegacyDatabase](self, "_migrateLegacyDatabase");
  v5 = 16;
LABEL_68:

  return v5;
}

- (WBSHistorySQLiteSchema)initWithDatabase:(id)a3 crypto:(id)a4 migrateVisitsAfterDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSHistorySQLiteSchema *v12;
  WBSHistorySQLiteSchema *v13;
  WBSHistorySQLiteSchema *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WBSHistorySQLiteSchema;
  v12 = -[WBSHistorySQLiteSchema init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong((id *)&v13->_crypto, a4);
    objc_storeStrong((id *)&v13->_migrateVisitsAfterDate, a5);
    v14 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrateVisitsAfterDate, 0);
  objc_storeStrong((id *)&self->_crypto, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (WBSHistorySQLiteSchema)init
{

  return 0;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  WBSSQLiteDatabase *database;
  void *v6;
  int v7;
  NSObject *v8;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v12 = a3;
      v13 = 2114;
      v14 = v10;
      v15 = 1024;
      v16 = v7;
      _os_log_error_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %{public}@ (%d)", buf, 0x18u);

    }
  }
  return v7;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v3;
  NSString *v5;
  SEL v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_migrateToSchemaVersion_%d"), *(_QWORD *)&a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSSelectorFromString(v5);

  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION"));
  if (v7 == 101)
  {
    -[WBSHistorySQLiteSchema methodSignatureForSelector:](self, "methodSignatureForSelector:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelector:", v6);
    objc_msgSend(v9, "invokeWithTarget:", self);
    v14 = 1;
    objc_msgSend(v9, "getReturnValue:", &v14);
    if (v14 == 101
      && (v14 = -[WBSHistorySQLiteSchema _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", v3), v14 == 101))
    {
      v10 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION"));
      if (v10 != 101)
      {
        v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistorySQLiteSchema _migrateToSchemaVersion:].cold.1();
        }

        goto LABEL_15;
      }
    }
    else if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ROLLBACK TRANSACTION")) != 101)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistorySQLiteSchema _migrateToSchemaVersion:].cold.2();
      }

    }
    v10 = v14;
LABEL_15:

    goto LABEL_16;
  }
  v10 = v7;
  v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
    objc_claimAutoreleasedReturnValue();
    -[WBSHistorySQLiteSchema _migrateToSchemaVersion:].cold.3();
  }
LABEL_16:

  return v10;
}

- (int)_migrateToSchemaVersion_2
{
  int v3;
  int v4;
  NSObject *v5;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE history_visits ADD COLUMN origin INTEGER NOT NULL DEFAULT 0"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_2].cold.2();
    }
    goto LABEL_7;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX history_visits__origin ON history_visits (origin)"));
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_2].cold.1();
    }
LABEL_7:

  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  int v3;
  int v4;
  int v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP INDEX history_visits__origin"));
  if (v3 != 101)
  {
    v5 = v3;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_3].cold.3();
    }
    goto LABEL_10;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE history_visits ADD COLUMN generation INTEGER NOT NULL DEFAULT 0"));
  if (v4 != 101)
  {
    v5 = v4;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_3].cold.2();
    }
    goto LABEL_10;
  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX history_visits__origin ON history_visits (origin, generation)"));
  if (v5 != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_3].cold.1();
    }
LABEL_10:

  }
  return v5;
}

- (int)_migrateToSchemaVersion_4
{
  int v3;
  int v4;
  NSObject *v5;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_tombstones (id INTEGER PRIMARY KEY AUTOINCREMENT,start_time REAL NOT NULL,end_time REAL NOT NULL,url TEXT,generation INTEGER NOT NULL DEFAULT 0)"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_4].cold.2();
    }
    goto LABEL_7;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX history_tombstones__generation ON history_tombstones (generation)"));
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_4].cold.1();
    }
LABEL_7:

  }
  return v4;
}

- (int)_migrateToSchemaVersion_5
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE history_items ADD COLUMN should_recompute_derived_visit_counts INTEGER NOT NULL DEFAULT 0"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_5].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_6
{
  int v3;
  NSObject *v4;
  int v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP INDEX history_tombstones__end_time"));
  if (v3 != 1 && v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_6].cold.2();
    }

  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX history_tombstones__end_time ON history_tombstones (end_time)"));
  if (v5 != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_6].cold.1();
    }

  }
  return v5;
}

- (int)_migrateToSchemaVersion_7
{
  int v3;
  NSObject *v4;
  int v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP INDEX history_visits__last_visit"));
  if (v3 != 1 && v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_7].cold.2();
    }

  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX history_visits__last_visit ON history_visits (history_item, visit_time DESC, synthesized ASC)"));
  if (v5 != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_7].cold.1();
    }

  }
  return v5;
}

- (int)_migrateToSchemaVersion_8
{
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  WBSHistoryCrypto *crypto;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  WBSSQLiteDatabase *database;
  void *v22;
  id obj;
  id v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  const __CFString *v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_client_versions (client_version INTEGER PRIMARY KEY,last_seen REAL NOT NULL)"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_8].cold.1();
    }

  }
  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("SELECT id, url FROM history_tombstones WHERE url IS NOT NULL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v22;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "int64AtIndex:", 0);
        objc_msgSend(v8, "stringAtIndex:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        crypto = self->_crypto;
        v36 = CFSTR("url");
        v37 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSHistoryCrypto encryptDictionary:](crypto, "encryptDictionary:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v13, v14);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v5);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v24;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v15, "objectForKeyedSubscript:", v19);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        database = self->_database;
        v25 = objc_msgSend(v19, "integerValue");
        v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong}&,long>(database, 0, CFSTR("UPDATE history_tombstones SET url = ? WHERE id = ?"), &v26, &v25);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

  return v3;
}

- (int)_migrateToSchemaVersion_9
{
  int v3;
  int v4;
  double v5;
  WBSSQLiteDatabase *database;
  void *v7;
  int v8;
  int function_v2;
  NSObject *v10;
  int v12;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE history_items ADD COLUMN visit_count_score INTEGER NOT NULL DEFAULT 0"));
  if (v3 == 101)
  {
    v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE history_visits ADD COLUMN attributes INTEGER NOT NULL DEFAULT 0"));
    if (v4 == 101)
    {
      database = self->_database;
      LODWORD(v5) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE history_visits ADD COLUMN score INTEGER NOT NULL DEFAULT %lu"), +[WBSHistoryVisit scoreForWeightedVisitCount:](WBSHistoryVisit, "scoreForWeightedVisitCount:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v7);

      if (v8 == 101)
      {
        function_v2 = sqlite3_create_function_v2((sqlite3 *)-[WBSSQLiteDatabase handle](self->_database, "handle"), "safari_visitcountscore", 1, 2053, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sqliteVisitCountScore, 0, 0, 0);
        if (function_v2)
        {
          v8 = function_v2;
          v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9].cold.2();
          }
        }
        else
        {
          v12 = sqlite3_create_function_v2((sqlite3 *)-[WBSSQLiteDatabase handle](self->_database, "handle"), "safari_visitblobscore", 1, 2053, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sqliteVisitBlobScore, 0, 0, 0);
          if (!v12)
          {
            v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("UPDATE history_items SET visit_count_score = safari_visitcountscore(visit_count), daily_visit_counts = safari_visitblobscore(daily_visit_counts), weekly_visit_counts = safari_visitblobscore(weekly_visit_counts)"));
            sqlite3_create_function_v2((sqlite3 *)-[WBSSQLiteDatabase handle](self->_database, "handle"), "safari_visitcountscore", 0, 5, 0, 0, 0, 0, 0);
            sqlite3_create_function_v2((sqlite3 *)-[WBSSQLiteDatabase handle](self->_database, "handle"), "safari_visitblobscore", 0, 5, 0, 0, 0, 0, 0);
            return v8;
          }
          v8 = v12;
          v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9].cold.1();
          }
        }
      }
      else
      {
        v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9].cold.3();
        }
      }
    }
    else
    {
      v8 = v4;
      v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9].cold.4();
      }
    }
  }
  else
  {
    v8 = v3;
    v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9].cold.5();
    }
  }

  return v8;
}

- (int)_migrateToSchemaVersion_10
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE history_visits ADD COLUMN core_spotlight_id TEXT NULL"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_10].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_11
{
  int v3;
  int v4;
  NSObject *v5;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_event_listeners (listener_name TEXT PRIMARY KEY,last_seen REAL NOT NULL)"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_11].cold.2();
    }
    goto LABEL_7;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_events (id INTEGER PRIMARY KEY AUTOINCREMENT,event_type TEXT NOT NULL,event_time REAL NOT NULL,pending_listeners TEXT NOT NULL,value BLOB)"));
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_11].cold.1();
    }
LABEL_7:

  }
  return v4;
}

- (int)_migrateToSchemaVersion_12
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA foreign_keys = OFF"));
  if (v3 != 101)
  {
    v8 = v3;
    v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.6();
    }
    goto LABEL_23;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE history_visits RENAME TO temp_history_visits")) != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.5();
    }

  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_visits (id INTEGER PRIMARY KEY AUTOINCREMENT,history_item INTEGER NOT NULL REFERENCES history_items(id) ON DELETE CASCADE,visit_time REAL NOT NULL,title TEXT NULL,load_successful BOOLEAN NOT NULL DEFAULT 1,http_non_get BOOLEAN NOT NULL DEFAULT 0,synthesized BOOLEAN NOT NULL DEFAULT 0,redirect_source INTEGER NULL UNIQUE REFERENCES history_visits(id) ON DELETE CASCADE,redirect_destination INTEGER NULL UNIQUE REFERENCES history_visits(id) ON DELETE CASCADE,origin INTEGER NOT NULL DEFAULT 0,generation INTEGER NOT NULL DEFAULT 0,attributes INTEGER NOT NULL DEFAULT 0,score INTEGER NOT NULL DEFAULT 0)")) != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.4();
    }

  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("INSERT INTO history_visits (id, history_item, visit_time, title, load_successful, http_non_get, synthesized, redirect_source, redirect_destination, origin, generation, attributes, score) SELECT id, history_item, visit_time, title, load_successful, http_non_get, synthesized, redirect_source, redirect_destination, origin, generation, attributes, score FROM temp_history_visits")) != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.3();
    }

  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DROP TABLE temp_history_visits")) != 101)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.2();
    }

  }
  v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA foreign_keys = ON"));
  if (v8 != 101)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.1();
    }
LABEL_23:

  }
  return v8;
}

- (int)_migrateToSchemaVersion_13
{
  int v3;
  int v4;
  NSObject *v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX history_visits__last_visit ON history_visits (history_item, visit_time DESC, synthesized ASC)"));
  if (v3 == 101)
    goto LABEL_5;
  v4 = v3;
  v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
    objc_claimAutoreleasedReturnValue();
    -[WBSHistorySQLiteSchema _migrateToSchemaVersion_7].cold.1();
  }

  if (indexExists(self->_database, CFSTR("history_visits__last_visit")))
  {
LABEL_5:
    v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE INDEX history_visits__origin ON history_visits (origin, generation)"));
    if (v4 == 101)
      return 101;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_2].cold.1();
    }

    if (indexExists(self->_database, CFSTR("history_visits__origin")))
      return 101;
  }
  return v4;
}

- (int)_migrateToSchemaVersion_14
{
  int v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_tags (id INTEGER PRIMARY KEY,type INTEGER NOT NULL,level INTEGER NOT NULL,identifier TEXT NOT NULL,title TEXT NOT NULL,modification_timestamp REAL NOT NULL,item_count INTEGER NOT NULL DEFAULT 0)"));
  if (v3 == 101)
  {
    v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE history_items_to_tags (history_item INTEGER NOT NULL,tag_id INTEGER NOT NULL,timestamp REAL NOT NULL,FOREIGN KEY(tag_id) REFERENCES history_tags(id) ON DELETE CASCADE,FOREIGN KEY(history_item) REFERENCES history_items(id) ON DELETE CASCADE,UNIQUE(history_item, tag_id) ON CONFLICT REPLACE)"));
    if (v4 == 101)
    {
      v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TRIGGER increment_count_on_insert AFTER INSERT ON history_items_to_tags BEGIN  UPDATE history_tags SET item_count = item_count + 1 WHERE id = NEW.tag_id;END;"));
      if (v5 == 101)
      {
        v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TRIGGER decrement_count_on_delete BEFORE DELETE ON history_items_to_tags BEGIN  UPDATE history_tags SET item_count = item_count - 1 WHERE id = OLD.tag_id;END;"));
        if (v6 != 101)
        {
          v7 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            -[WBSHistorySQLiteSchema _migrateToSchemaVersion_14].cold.1();
        }
      }
      else
      {
        v6 = v5;
        v10 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[WBSHistorySQLiteSchema _migrateToSchemaVersion_14].cold.2();
      }
    }
    else
    {
      v6 = v4;
      v9 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WBSHistorySQLiteSchema _migrateToSchemaVersion_14].cold.3();
    }
  }
  else
  {
    v6 = v3;
    v8 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_14].cold.4();
  }
  return v6;
}

- (int)_migrateToSchemaVersion_15
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(self->_database, CFSTR("SELECT value FROM metadata WHERE key = ?"), WBSHistorySQLiteStoreSyncsWithManateeContainerKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64AtIndex:", 0);

  if (v5 < 1)
    goto LABEL_9;
  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("SELECT MAX(generation) FROM history_visits"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nextObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "int64AtIndex:", 0);

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("SELECT MAX(generation) FROM history_tombstones"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "int64AtIndex:", 0);

  SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(self->_database, CFSTR("SELECT value FROM metadata WHERE key = ?"), WBSHistorySQLiteStoreLastSyncedGenerationKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "nextObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "int64AtIndex:", 0);

  if (v8 <= v11)
    v14 = v11;
  else
    v14 = v8;
  if (v14 <= v13)
    v14 = v13;
  v18[0] = v14 + 1;
  v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * const {__strong}&>(self->_database, 0, CFSTR("UPDATE metadata SET value = ? WHERE key = ?"), v18, WBSHistorySQLiteStoreCurrentGenerationKey);
  if (v15 != 101)
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_15].cold.2();
    }
LABEL_12:

    goto LABEL_13;
  }
  if (!-[WBSSQLiteDatabase changedRowCount](self->_database, "changedRowCount"))
  {
    v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,long long &>(self->_database, 0, CFSTR("INSERT INTO metadata (key, value) VALUES (?, ?)"), WBSHistorySQLiteStoreCurrentGenerationKey, v18);
    if (v15 == 101)
      goto LABEL_13;
    v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_15].cold.1();
    }
    goto LABEL_12;
  }
LABEL_9:
  v15 = 101;
LABEL_13:

  return v15;
}

- (int)_migrateToSchemaVersion_16
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE history_items ADD COLUMN status_code INTEGER NOT NULL DEFAULT 0"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_16].cold.1();
    }

  }
  return v3;
}

+ (id)legacyHistoryPropertyListURL
{
  void *v3;
  void *v4;

  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_settingsDirectoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("History.plist"), 0);
    +[WBSHistorySQLiteSchema legacyHistoryPropertyListURL]::historyURL = objc_claimAutoreleasedReturnValue();

  }
  return (id)+[WBSHistorySQLiteSchema legacyHistoryPropertyListURL]::historyURL;
}

- (NSDictionary)legacyDatabase
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend((id)objc_opt_class(), "legacyHistoryPropertyListURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (int64_t)_migrateLegacyItem:(id)a3 dailyVisitCounts:(void *)a4 weeklyVisitCounts:(void *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  _DWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  _DWORD *v35;
  void *v36;
  void *v37;
  WTF *v38;
  WTF *v39;
  WBSSQLiteDatabase *database;
  int v41;
  id v42;
  int64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  WBSHistorySQLiteSchema *v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int v55;
  int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  WTF *v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  int v66;
  id v67;
  WTF *v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "safari_stringForKey:", &stru_1E4B40D18);
  v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("D"));
  v49 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("W"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_numberForKey:", CFSTR("visitCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  v66 = v11;
  objc_msgSend(v8, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("autocomplete"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v65 = 0;
  v13 = 0x1E0C99000;
  v63 = 0;
  if (!(v49 | v9))
  {
LABEL_47:
    objc_msgSend(*(id *)(v13 + 3408), "data");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  v68 = 0;
  v69 = 0;
  v61 = 0;
  v62 = 0;
  v14 = objc_msgSend((id)v49, "count");
  if (v14)
  {
    if (v14 >> 30)
      goto LABEL_57;
    LODWORD(v69) = v14;
    v68 = (WTF *)WTF::fastMalloc((WTF *)(4 * v14));
  }
  v15 = objc_msgSend((id)v9, "count");
  if (!v15)
    goto LABEL_8;
  if (v15 >> 30)
  {
LABEL_57:
    __break(0xC471u);
    JUMPOUT(0x1A3E7AFA0);
  }
  LODWORD(v62) = v15;
  v61 = (WTF *)WTF::fastMalloc((WTF *)(4 * v15));
LABEL_8:
  v48 = self;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v16 = (id)v49;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v56 = 0;
        v21 = objc_msgSend(v20, "intValue");
        if (v21 <= 0x12C)
          v22 = v21;
        else
          v22 = 0;
        v56 = v22;
        v23 = *((unsigned int *)a4 + 3);
        if ((_DWORD)v23 == *((_DWORD *)a4 + 2))
          *(_DWORD *)(*(_QWORD *)a4 + 4 * *((unsigned int *)a4 + 3)) = *(_DWORD *)WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a4, v23 + 1, (unint64_t)&v56);
        else
          *(_DWORD *)(*(_QWORD *)a4 + 4 * v23) = v22;
        ++*((_DWORD *)a4 + 3);
        v24 = WBSHistoryVisitScoreForWeightedVisitCount((float)v56);
        v55 = v24;
        if (HIDWORD(v69) == (_DWORD)v69)
        {
          v25 = (_DWORD *)WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v68, HIDWORD(v69) + 1, (unint64_t)&v55);
          *((_DWORD *)v68 + HIDWORD(v69)) = *v25;
        }
        else
        {
          *((_DWORD *)v68 + HIDWORD(v69)) = v24;
        }
        ++HIDWORD(v69);
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    }
    while (v17);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v26 = (id)v9;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v52 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        v56 = 0;
        v31 = objc_msgSend(v30, "intValue");
        if (v31 <= 0x834)
          v32 = v31;
        else
          v32 = 0;
        v56 = v32;
        v33 = *((unsigned int *)a5 + 3);
        if ((_DWORD)v33 == *((_DWORD *)a5 + 2))
          *(_DWORD *)(*(_QWORD *)a5 + 4 * *((unsigned int *)a5 + 3)) = *(_DWORD *)WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a5, v33 + 1, (unint64_t)&v56);
        else
          *(_DWORD *)(*(_QWORD *)a5 + 4 * v33) = v32;
        ++*((_DWORD *)a5 + 3);
        v34 = WBSHistoryVisitScoreForWeightedVisitCount((float)v56);
        v55 = v34;
        if (HIDWORD(v62) == (_DWORD)v62)
        {
          v35 = (_DWORD *)WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v61, HIDWORD(v62) + 1, (unint64_t)&v55);
          *((_DWORD *)v61 + HIDWORD(v62)) = *v35;
        }
        else
        {
          *((_DWORD *)v61 + HIDWORD(v62)) = v34;
        }
        ++HIDWORD(v62);
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
    }
    while (v27);
  }

  WBSHistoryCollapseDailyVisitsToWeekly((unsigned int *)&v68, &v61);
  self = v48;
  v13 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v68, 4 * HIDWORD(v69));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v37;
  if (*((_DWORD *)a5 + 3))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v61, 4 * HIDWORD(v62));
    v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  v38 = v61;
  if (v61)
  {
    v61 = 0;
    LODWORD(v62) = 0;
    WTF::fastFree(v38, v36);
  }
  v39 = v68;
  if (v68)
  {
    v68 = 0;
    LODWORD(v69) = 0;
    WTF::fastFree(v39, v36);
  }
  if (!v37)
    goto LABEL_47;
LABEL_48:
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 100, 0, 0);
    v63 = (id)objc_claimAutoreleasedReturnValue();
  }
  database = self->_database;
  v50 = 0;
  LODWORD(v68) = WBSHistoryVisitScoreForWeightedVisitCount((float)v11);
  v41 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,int &,int,NSData * {__strong}&,NSData * {__strong}&,NSData * {__strong}&>(database, &v50, CFSTR("INSERT INTO history_items (url, visit_count, visit_count_score, daily_visit_counts, weekly_visit_counts, autocomplete_triggers, domain_expansion, should_recompute_derived_visit_counts) VALUES (?,?,?,?,?,?,safari_domainexpansion(?1),0)"), &v67, (unsigned int *)&v66, (unsigned int *)&v68, &v65, &v64, &v63);
  v42 = v50;
  if (v41 && v41 != 101)
  {
    v44 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = (uint64_t)v67;
      objc_msgSend(v42, "safari_privacyPreservingDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateLegacyItem:dailyVisitCounts:weeklyVisitCounts:].cold.1(v45, v46, (uint64_t)&v68, v44);
    }

    v43 = 0;
  }
  else
  {
    v43 = -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID");
  }

  return v43;
}

- (int64_t)_migrateLegacyVisitWithItemID:(int64_t)a3 visitTime:(double)a4 title:(id)a5 score:(unint64_t)a6 loadSuccessful:(BOOL)a7 httpNonGet:(BOOL)a8 synthesized:(BOOL)a9
{
  WBSSQLiteDatabase *database;
  int v14;
  id v15;
  int64_t v16;
  NSObject *v17;
  id v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  unint64_t v23;
  id v24;
  double v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v26[0] = a3;
  v25 = a4;
  v23 = a6;
  v24 = a5;
  v22 = a7;
  v21 = a8;
  v20 = a9;
  database = self->_database;
  v19 = 0;
  v14 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,double &,NSString * {__strong}&,unsigned long &,BOOL &,BOOL &,BOOL &>(database, &v19, CFSTR("INSERT INTO history_visits (history_item, visit_time, title, score, load_successful, http_non_get, synthesized) VALUES (?,?,?,?,?,?,?)"), v26, &v25, &v24, &v23, (unsigned __int8 *)&v22, (unsigned __int8 *)&v21, (unsigned __int8 *)&v20);
  v15 = v19;
  if (v14 && v14 != 101)
  {
    v17 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:].cold.1();
    }

    v16 = 0;
  }
  else
  {
    v16 = -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID");
  }

  return v16;
}

- (id)_migrateLegacyDatabaseCreatingItemsAndVisits:(id)a3 outVisitsToUseForRedirectChains:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  WTF *v30;
  WTF *v31;
  unsigned int v32;
  uint64_t v33;
  WTF *v34;
  uint64_t v35;
  WTF *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  WTF *v44;
  WTF *v45;
  WTF *v46;
  id v48;
  id v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  WTF *v54;
  int v55;
  unsigned int v56;
  WTF *v57;
  unsigned int v58;
  unsigned int v59;
  WTF *v60;
  uint64_t v61;
  WTF *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v7 = WBSHistoryVisitScoreForWeightedVisitCount(1.0);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v8)
  {
    v9 = v7;
    v51 = *(_QWORD *)v65;
    do
    {
      v52 = v8;
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v65 != v51)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v62 = 0;
        v63 = 0;
        v60 = 0;
        v61 = 0;
        v13 = -[WBSHistorySQLiteSchema _migrateLegacyItem:dailyVisitCounts:weeklyVisitCounts:](self, "_migrateLegacyItem:dailyVisitCounts:weeklyVisitCounts:", v11, &v62, &v60);
        if (v13)
        {
          objc_msgSend(v11, "safari_stringForKey:", CFSTR("lastVisitedDate"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

          objc_msgSend(v11, "safari_stringForKey:", CFSTR("title"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "safari_numberForKey:", CFSTR("lastVisitWasFailure"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "intValue");
          objc_msgSend(v11, "safari_numberForKey:", CFSTR("lastVisitWasHTTPNonGet"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[WBSHistorySQLiteSchema _migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:](self, "_migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:", v13, v17, v9, v19 == 0, objc_msgSend(v20, "intValue") != 0, 0, v16);

          if (v21)
          {
            objc_msgSend(v11, "safari_stringForKey:", &stru_1E4B40D18);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("redirectURLs"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            WBSHistoryTimesOfVisitsToSynthesizeFromDailyCounts((unsigned int *)&v62, (uint64_t)&v60, (uint64_t)&v57, v16);
            v23 = v59 + 1;
            if (v23 < objc_msgSend(v22, "count"))
            {
              WBSHistoryTimesForSynthesizedVisitsPreceedingDailyAndWeeklyRange(v16, objc_msgSend(v22, "count") - v23, (uint64_t)&v54);
              v25 = v56;
              v26 = v56 + (unint64_t)v59;
              if (v26 > v58)
              {
                v27 = v58 + ((unint64_t)v58 >> 2);
                if (v27 >= 0x10)
                  v28 = v27 + 1;
                else
                  v28 = 16;
                if (v28 <= v26)
                  v29 = v56 + (unint64_t)v59;
                else
                  v29 = v28;
                WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&v57, v29);
                v25 = v56;
              }
              v30 = v54;
              if ((_DWORD)v25)
              {
                v31 = v57;
                v32 = v59;
                v33 = 8 * v25;
                v34 = v54;
                do
                {
                  v35 = *(_QWORD *)v34;
                  v34 = (WTF *)((char *)v34 + 8);
                  *((_QWORD *)v31 + v32++) = v35;
                  v33 -= 8;
                }
                while (v33);
                v59 = v32;
              }
              if (v30)
              {
                v54 = 0;
                v55 = 0;
                WTF::fastFree(v30, v24);
              }
            }
            if (v59)
            {
              v36 = v57;
              v37 = 8 * v59;
              do
              {
                -[WBSHistorySQLiteSchema _migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:](self, "_migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:", v13, 0, v9, 1, 0, 1, *(double *)v36);
                v36 = (WTF *)((char *)v36 + 8);
                v37 -= 8;
              }
              while (v37);
            }
            v38 = objc_alloc(MEMORY[0x1E0D89C18]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)objc_msgSend(v38, "initWithFirst:second:", v39, v40);
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v41, v53);

            if (!v17)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "addObject:", v43);

              v17 = 0;
            }
            v44 = v57;
            if (v57)
            {
              v57 = 0;
              v58 = 0;
              WTF::fastFree(v44, v42);
            }

          }
        }
        v45 = v60;
        if (v60)
        {
          v60 = 0;
          LODWORD(v61) = 0;
          WTF::fastFree(v45, v12);
        }
        v46 = v62;
        if (v62)
        {
          v62 = 0;
          LODWORD(v63) = 0;
          WTF::fastFree(v46, v12);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v8);
  }

  return v49;
}

- (BOOL)migrateLegacyDatabaseCreatingRedirectChains:(id)a3 urlsToItemAndLastVisitID:(id)a4 visitsToUseForRedirectChains:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  WBSSQLiteDatabase *database;
  char v31;
  NSObject *v32;
  WBSSQLiteDatabase *v33;
  int v34;
  NSObject *v35;
  WBSSQLiteDatabase *v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id obj;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t i;
  id v55;
  id v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  int64_t v61;
  id v62;
  int64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  sqlite3_int64 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  _BYTE buf[12];
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v56 = a4;
  v55 = a5;
  v74 = (int)WBSHistoryVisitScoreForWeightedVisitCount(1.0);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v8;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16, v8);
  if (v52)
  {
    v51 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v71 != v51)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v9, "safari_stringForKey:", CFSTR("lastVisitedDate"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        objc_msgSend(v9, "safari_stringForKey:", &stru_1E4B40D18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), CFSTR("redirectURLs"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        objc_msgSend(v56, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "first");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "longValue");

        v69 = v16;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v57 = v53;
        v17 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v66;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v66 != v18)
                objc_enumerationMutation(v57);
              v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
              if ((objc_msgSend(v20, "isEqualToString:", v13) & 1) == 0)
              {
                objc_msgSend(v56, "objectForKeyedSubscript:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                if (v21)
                {
                  v64 = 0;
                  objc_msgSend(v21, "first");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "longValue");

                  v63 = 0;
                  v64 = v24;
                  objc_msgSend(v22, "second");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "longValue");

                  v63 = v26;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v26) = objc_msgSend(v55, "containsObject:", v27);

                  if ((v26 & 1) != 0)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v63);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "removeObject:", v28);

                    v29 = 0;
                    goto LABEL_15;
                  }
                  v63 = -[WBSHistorySQLiteSchema _migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:](self, "_migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:", v64, 0, v74, 1, 0, 1, v12);
                  if (v63)
                  {
                    v40 = -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID");
                    v62 = 0;
                    v63 = v40;
                    v41 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<unsigned long const&,long long &>(self->_database, &v62, CFSTR("UPDATE history_items SET visit_count = visit_count + 1, visit_count_score = visit_count_score + ? WHERE id = ?"), &v74, &v64);
                    v29 = v62;
                    if (v41 && v41 != 101)
                    {
                      v42 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                      {
                        -[NSObject safari_privacyPreservingDescription](v29, "safari_privacyPreservingDescription");
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138478083;
                        *(_QWORD *)&buf[4] = v20;
                        v76 = 2114;
                        v77 = v47;
                        _os_log_error_impl(&dword_1A3D90000, v42, OS_LOG_TYPE_ERROR, "Failed to update score of %{private}@: %{public}@", buf, 0x16u);

                      }
                      goto LABEL_45;
                    }
LABEL_15:
                    v60 = v29;
                    v61 = 0;
                    database = self->_database;
                    *(_QWORD *)buf = &v61;
                    v31 = SafariShared::WBSSQLiteDatabaseEnumerate<long long &,std::tuple<long long &>>(database, (uint64_t)&v60, CFSTR("SELECT id FROM history_visits WHERE id = ? AND redirect_source IS NULL ORDER BY visit_time DESC LIMIT 1"), &v69, (sqlite3_int64 **)buf);
                    v32 = v60;

                    if ((v31 & 1) != 0)
                    {
LABEL_16:
                      v33 = self->_database;
                      v59 = v32;
                      v34 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,long long &>(v33, &v59, CFSTR("UPDATE history_visits SET redirect_source = ? WHERE id = ?"), &v63, &v61);
                      v35 = v59;

                      v32 = v35;
                      if (v34 && v34 != 101)
                      {
                        v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                        {
                          -[NSObject safari_privacyPreservingDescription](v35, "safari_privacyPreservingDescription");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138478083;
                          *(_QWORD *)&buf[4] = v13;
                          v76 = 2114;
                          v77 = v46;
                          _os_log_error_impl(&dword_1A3D90000, v43, OS_LOG_TYPE_ERROR, "Failed to set redirect source for %{private}@: %{public}@", buf, 0x16u);

                        }
                      }
                      else
                      {
                        v36 = self->_database;
                        v58 = v35;
                        v37 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,long long &>(v36, &v58, CFSTR("UPDATE history_visits SET redirect_destination = ? WHERE id = ?"), &v61, &v63);
                        v38 = v58;

                        if (!v37 || v37 == 101)
                        {
                          v32 = v38;
LABEL_44:
                          v29 = v32;
                          goto LABEL_45;
                        }
                        v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                        {
                          -[NSObject safari_privacyPreservingDescription](v38, "safari_privacyPreservingDescription");
                          v48 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138478083;
                          *(_QWORD *)&buf[4] = v13;
                          v76 = 2114;
                          v77 = v48;
                          _os_log_error_impl(&dword_1A3D90000, v43, OS_LOG_TYPE_ERROR, "Failed to set redirect source for %{private}@: %{public}@", buf, 0x16u);

                        }
                        v32 = v38;
                      }
                    }
                    else if (-[NSObject safari_isSQLiteError](v32, "safari_isSQLiteError")
                           && -[NSObject code](v32, "code") == 101)
                    {
                      v61 = -[WBSHistorySQLiteSchema _migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:](self, "_migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:", v69, 0, v74, 1, 0, 1, v12);
                      if (v61)
                        goto LABEL_16;
                      v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        -[NSObject safari_privacyPreservingDescription](v32, "safari_privacyPreservingDescription");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138478083;
                        *(_QWORD *)&buf[4] = v20;
                        v76 = 2114;
                        v77 = v44;
                        _os_log_error_impl(&dword_1A3D90000, v43, OS_LOG_TYPE_ERROR, "Failed to update visit count scores for %{private}@: %{public}@", buf, 0x16u);

                      }
                    }
                    else
                    {
                      v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        -[NSObject safari_privacyPreservingDescription](v32, "safari_privacyPreservingDescription");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138478083;
                        *(_QWORD *)&buf[4] = v13;
                        v76 = 2114;
                        v77 = v45;
                        _os_log_error_impl(&dword_1A3D90000, v43, OS_LOG_TYPE_ERROR, "Failed to set redirect source for %{private}@: %{public}@", buf, 0x16u);

                      }
                    }

                    goto LABEL_44;
                  }
                  v29 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(0, "safari_privacyPreservingDescription");
                    objc_claimAutoreleasedReturnValue();
                    -[WBSHistorySQLiteSchema migrateLegacyDatabaseCreatingRedirectChains:urlsToItemAndLastVisitID:visitsToUseForRedirectChains:].cold.1();
                  }
LABEL_45:

                }
                else
                {
                  v39 = WBS_LOG_CHANNEL_PREFIXHistory();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138477827;
                    *(_QWORD *)&buf[4] = v20;
                    _os_log_impl(&dword_1A3D90000, v39, OS_LOG_TYPE_INFO, "Could not find an item for %{private}@", buf, 0xCu);
                  }
                }

                continue;
              }
            }
            v17 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
          }
          while (v17);
        }

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    }
    while (v52);
  }

  SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(self->_database, 0, CFSTR("INSERT INTO metadata (key,value) VALUES (?,1)"), WBSHistorySQLiteStoreImportCompletedKey);
  return 1;
}

- (void)_migrateLegacyDatabase
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Legacy history file didn't contain a valid dates array, therefore not loading", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

BOOL __48__WBSHistorySQLiteSchema__migrateLegacyDatabase__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  _BOOL8 v7;

  objc_msgSend(a2, "safari_stringForKey:", CFSTR("lastVisitedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "timeIntervalSinceReferenceDate");
  v7 = v5 >= v6;

  return v7;
}

uint64_t __48__WBSHistorySQLiteSchema__migrateLegacyDatabase__block_invoke_187(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_migrateLegacyDatabaseCreatingItemsAndVisits:outVisitsToUseForRedirectChains:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(*(id *)(a1 + 32), "migrateLegacyDatabaseCreatingRedirectChains:urlsToItemAndLastVisitID:visitsToUseForRedirectChains:", *(_QWORD *)(a1 + 40), v3, v2);
  else
    v4 = 0;

  return v4;
}

- (void)_removeLegacyHistoryDatabaseIfNeeded
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a3, (uint64_t)a3, "Failed to remove history plist with error %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

- (void)migrateToCurrentSchemaVersionIfNeeded
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to create the history_items table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to commit transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to roll back transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to start a transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_2
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add origin column to history_visits table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_3
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to drop history_visits__origin index: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_4
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to create the history_visit_tombstones table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_5
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add should_recompute_derived_visit_counts column to history_items table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_6
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to drop history_tombstones__end_time index: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_7
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to drop history_visits__last_visit index: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_8
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to create the history_client_versions table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_9
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add visit_count_score column to history_items table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_10
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add core_spotlight_id column to history_visits table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_11
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to create the history_event_listeners table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_12
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to disable foreign keys: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_14
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, v0, v1, "Failed to create history_tags table: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_migrateToSchemaVersion_15
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  *v1 = 138412802;
  OUTLINED_FUNCTION_0_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_5_1(&dword_1A3D90000, "Failed to update metadata value %@: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_16
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add status_code column to history_items table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateLegacyItem:(uint64_t)a3 dailyVisitCounts:(NSObject *)a4 weeklyVisitCounts:.cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138478083;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to create item for %{private}@: %{public}@", (uint8_t *)a3, a4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  *(_DWORD *)v1 = 134218242;
  *(_QWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2114;
  *(_QWORD *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to create visit for item %lli: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)migrateLegacyDatabaseCreatingRedirectChains:urlsToItemAndLastVisitID:visitsToUseForRedirectChains:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  *v1 = 138543362;
  *v3 = v2;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v5, (uint64_t)v3, "Failed to create synthesized visit for redirect chain: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

@end
