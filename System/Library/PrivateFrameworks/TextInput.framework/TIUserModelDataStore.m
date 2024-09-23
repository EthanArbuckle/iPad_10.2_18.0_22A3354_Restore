@implementation TIUserModelDataStore

- (TIUserModelDataStore)initWithPath:(id)a3
{
  id v5;
  TIUserModelDataStore *v6;
  TIUserModelDataStore *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *database_queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIUserModelDataStore;
  v6 = -[TIUserModelDataStore init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v7->_user_model_db = 0;
    v7->_user_model_db_failed = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.textInput.usermodeldatastorequeue", v9);
    database_queue = v7->_database_queue;
    v7->_database_queue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TIUserModelDataStore closeDatabase](self, "closeDatabase");
  v3.receiver = self;
  v3.super_class = (Class)TIUserModelDataStore;
  -[TIUserModelDataStore dealloc](&v3, sel_dealloc);
}

- (BOOL)isValid
{
  OS_dispatch_queue *database_queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__TIUserModelDataStore_isValid__block_invoke;
  v5[3] = &unk_1E243B578;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDatabaseValid
{
  if (self->_user_model_db)
    return 1;
  if (self->_user_model_db_failed)
    return 0;
  return -[TIUserModelDataStore createOrOpenDatabase](self, "createOrOpenDatabase");
}

- (BOOL)createOrOpenDatabase
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char *errmsg;
  sqlite3 *ppDb;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  IXADefaultLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Opening database."), "-[TIUserModelDataStore createOrOpenDatabase]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v24;
    _os_log_debug_impl(&dword_18C56E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  v4 = -[NSString UTF8String](self->_path, "UTF8String");
  ppDb = 0;
  if (sqlite3_open_v2(v4, &ppDb, 3145734, 0))
  {
    v5 = sqlite3_extended_errcode(ppDb);
    IXADefaultLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Couldn't open or create database at path %s: %d %s"), "-[TIUserModelDataStore createOrOpenDatabase]", v4, v5, sqlite3_errmsg(ppDb));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v25;
      _os_log_error_impl(&dword_18C56E000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    goto LABEL_7;
  }
  if ((TI_IS_FILE_CLASS_C((uint64_t)v4) & 1) == 0 && !TI_SET_PROTECTION_CLASS_C((uint64_t)v4))
  {
LABEL_7:
    sqlite3_close(ppDb);
    v7 = 0;
    self->_user_model_db_failed = 1;
    return v7;
  }
  v8 = sqlite3_extended_result_codes(ppDb, 1);
  if ((_DWORD)v8)
  {
    v9 = v8;
    IXADefaultLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Couldn't enable the extended result codes: %d %s"), "-[TIUserModelDataStore createOrOpenDatabase]", v9, sqlite3_errmsg(ppDb));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v26;
      _os_log_error_impl(&dword_18C56E000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  errmsg = 0;
  v11 = sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL", 0, 0, &errmsg);
  if ((_DWORD)v11)
  {
    v12 = v11;
    IXADefaultLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Couldn't switch database to wal mode: %s %d %s"), "-[TIUserModelDataStore createOrOpenDatabase]", errmsg, v12, sqlite3_errmsg(ppDb));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v27;
      _os_log_error_impl(&dword_18C56E000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  sqlite3_free(errmsg);
  -[TIUserModelDataStore propertiesMigrationSchemaForDatabase:](self, "propertiesMigrationSchemaForDatabase:", ppDb);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelDataStore durableMigrationSchemaForDatabase:](self, "durableMigrationSchemaForDatabase:", ppDb);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIUserModelDataStore transientMigrationSchemaForDatabase:](self, "transientMigrationSchemaForDatabase:", ppDb);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length")
    && ((v18 = sqlite3_exec(ppDb, "BEGIN", 0, 0, 0), v19 = v18, v20 = v18, (_DWORD)v18)
     || (v20 = sqlite3_exec(ppDb, (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"), 0, 0, 0),
         (_DWORD)v20)
     || (v20 = sqlite3_exec(ppDb, "COMMIT", 0, 0, 0), (_DWORD)v20)))
  {
    IXADefaultLogFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: The schema migration failed: %d %s"), "-[TIUserModelDataStore createOrOpenDatabase]", v20, sqlite3_errmsg(ppDb));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v28;
      _os_log_error_impl(&dword_18C56E000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    if (!v19)
      sqlite3_exec(ppDb, "ROLLBACK", 0, 0, 0);
    sqlite3_close(ppDb);
    v7 = 0;
    self->_user_model_db_failed = 1;
  }
  else
  {
    IXADefaultLogFacility();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Database opened."), "-[TIUserModelDataStore createOrOpenDatabase]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v29;
      _os_log_debug_impl(&dword_18C56E000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    self->_user_model_db = ppDb;
    v7 = 1;
  }

  return v7;
}

- (BOOL)closeDatabase
{
  OS_dispatch_queue *database_queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__TIUserModelDataStore_closeDatabase__block_invoke;
  v5[3] = &unk_1E243B578;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)propertiesCreationSchema
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE properties( ROWID INTEGER PRIMARY KEY,  key,  value,  UNIQUE (key));INSERT INTO properties (key, value) VALUES ('%@', %d);INSERT INTO properties (key, value) VALUES ('%@', %f);"),
               CFSTR("properties_version"),
               2,
               CFSTR("properties_last_migration_date"),
               v4);
}

- (id)propertiesMigrationFromV1Schema
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM properties WHERE key = '%@';INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);"),
               CFSTR("version"),
               CFSTR("properties_version"),
               2,
               CFSTR("properties_last_migration_date"),
               v4);
}

- (id)durableResetSchema
{
  return CFSTR("DROP INDEX IF EXISTS durable_key_index;DROP INDEX IF EXISTS durable_input_mode_index;DROP TABLE IF EXISTS usermodeldurablerecords;");
}

- (id)durableCreationSchema
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE usermodeldurablerecords(   ROWID INTEGER PRIMARY KEY AUTOINCREMENT,   key    TEXT  NOT NULL,   value           INTEGER DEFAULT 0,   creation_date       REAL DEFAULT 0,   last_update_date       REAL DEFAULT 0,   journaled);CREATE INDEX durable_key_index ON usermodeldurablerecords(key);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);"),
               CFSTR("durable_version"),
               4,
               CFSTR("durable_last_migration_date"),
               v4);
}

- (id)durableMigrationFromV2Schema
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);"),
               CFSTR("durable_version"),
               4,
               CFSTR("durable_last_migration_date"),
               v4);
}

- (id)durableMigrationFromV3Schema
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);"),
               CFSTR("durable_version"),
               4,
               CFSTR("durable_last_migration_date"),
               v4);
}

- (id)transientResetSchema
{
  return CFSTR("DROP INDEX IF EXISTS transient_key_index;DROP INDEX IF EXISTS transient_input_mode_index;DROP INDEX IF EXISTS transient_last_update_date_index;DROP INDEX IF EXISTS feature_type_index;DROP TABLE IF EXISTS usermodelrecords;DROP TABLE IF EXISTS usermodeltransientrecords;");
}

- (id)transientCreationSchema
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE usermodeltransientrecords(   ROWID INTEGER PRIMARY KEY AUTOINCREMENT,   key    TEXT  NOT NULL,   input_mode      TEXT NOT NULL,   value           INTEGER DEFAULT 0,   secondary_value INTEGER DEFAULT 0,   real_value       REAL DEFAULT 0,   properties            BLOB,   last_update_date       REAL DEFAULT 0,   journaled);CREATE INDEX transient_key_index ON usermodeltransientrecords(key);CREATE INDEX transient_input_mode_index ON usermodeltransientrecords(input_mode);CREATE INDEX transient_last_update_date_index ON usermodeltransientrecords(last_update_date);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);"),
               CFSTR("transient_version"),
               7,
               CFSTR("transient_last_migration_date"),
               v4);
}

- (int)propertiesVersionFromDatabase:(sqlite3 *)a3
{
  int result;

  result = -[TIUserModelDataStore versionForKey:fromDatabase:](self, "versionForKey:fromDatabase:", CFSTR("properties_version"), a3);
  if (!result)
    return -[TIUserModelDataStore versionForKey:fromDatabase:](self, "versionForKey:fromDatabase:", CFSTR("version"), a3) > 0|| -[TIUserModelDataStore versionForKey:fromDatabase:](self, "versionForKey:fromDatabase:", CFSTR("durable_version"), a3) >= 1;
  return result;
}

- (int)propertiesVersion
{
  OS_dispatch_queue *database_queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__TIUserModelDataStore_propertiesVersion__block_invoke;
  v5[3] = &unk_1E243B578;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)propertiesLastMigrationDateFromDatabase:(sqlite3 *)a3
{
  return -[TIUserModelDataStore lastMigrationDateForKey:fromDatabase:](self, "lastMigrationDateForKey:fromDatabase:", CFSTR("properties_last_migration_date"), a3);
}

- (NSDate)propertiesLastMigrationDate
{
  OS_dispatch_queue *database_queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11039;
  v10 = __Block_byref_object_dispose__11040;
  v11 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__TIUserModelDataStore_propertiesLastMigrationDate__block_invoke;
  v5[3] = &unk_1E243B578;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (int)durableVersionFromDatabase:(sqlite3 *)a3
{
  int result;

  result = -[TIUserModelDataStore versionForKey:fromDatabase:](self, "versionForKey:fromDatabase:", CFSTR("durable_version"), a3);
  if (!result)
  {
    result = -[TIUserModelDataStore versionForKey:fromDatabase:](self, "versionForKey:fromDatabase:", CFSTR("version"), a3);
    if (result >= 2)
      return 2;
  }
  return result;
}

- (int)durableVersion
{
  OS_dispatch_queue *database_queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__TIUserModelDataStore_durableVersion__block_invoke;
  v5[3] = &unk_1E243B578;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)durableLastMigrationDateFromDatabase:(sqlite3 *)a3
{
  return -[TIUserModelDataStore lastMigrationDateForKey:fromDatabase:](self, "lastMigrationDateForKey:fromDatabase:", CFSTR("durable_last_migration_date"), a3);
}

- (NSDate)durableLastMigrationDate
{
  OS_dispatch_queue *database_queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11039;
  v10 = __Block_byref_object_dispose__11040;
  v11 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__TIUserModelDataStore_durableLastMigrationDate__block_invoke;
  v5[3] = &unk_1E243B578;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (int)transientVersionFromDatabase:(sqlite3 *)a3
{
  int result;

  result = -[TIUserModelDataStore versionForKey:fromDatabase:](self, "versionForKey:fromDatabase:", CFSTR("transient_version"), a3);
  if (!result)
    return -[TIUserModelDataStore versionForKey:fromDatabase:](self, "versionForKey:fromDatabase:", CFSTR("version"), a3);
  return result;
}

- (int)transientVersion
{
  OS_dispatch_queue *database_queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__TIUserModelDataStore_transientVersion__block_invoke;
  v5[3] = &unk_1E243B578;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)transientLastMigrationDateFromDatabase:(sqlite3 *)a3
{
  return -[TIUserModelDataStore lastMigrationDateForKey:fromDatabase:](self, "lastMigrationDateForKey:fromDatabase:", CFSTR("transient_last_migration_date"), a3);
}

- (NSDate)transientLastMigrationDate
{
  OS_dispatch_queue *database_queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11039;
  v10 = __Block_byref_object_dispose__11040;
  v11 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__TIUserModelDataStore_transientLastMigrationDate__block_invoke;
  v5[3] = &unk_1E243B578;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (int)versionForKey:(id)a3 fromDatabase:(sqlite3 *)a4
{
  id v5;
  int v6;
  BOOL v7;
  sqlite3_stmt *ppStmt;

  v5 = a3;
  if (a4)
  {
    ppStmt = 0;
    v6 = sqlite3_prepare_v2(a4, "SELECT value FROM properties WHERE key = ?", -1, &ppStmt, 0);
    if (ppStmt)
      v7 = v6 == 0;
    else
      v7 = 0;
    if (v7)
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), -1, 0);
      if (sqlite3_step(ppStmt) == 100)
        LODWORD(a4) = sqlite3_column_int(ppStmt, 0);
      else
        LODWORD(a4) = 0;
      sqlite3_finalize(ppStmt);
    }
    else
    {
      LODWORD(a4) = 0;
    }
  }

  return (int)a4;
}

- (id)lastMigrationDateForKey:(id)a3 fromDatabase:(sqlite3 *)a4
{
  id v5;
  int v6;
  sqlite3_stmt *ppStmt;

  v5 = a3;
  if (a4)
  {
    ppStmt = 0;
    v6 = sqlite3_prepare_v2(a4, "SELECT value FROM properties WHERE key = ?", -1, &ppStmt, 0);
    a4 = 0;
    if (ppStmt && v6 == 0)
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), -1, 0);
      a4 = 0;
      if (sqlite3_step(ppStmt) == 100)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", sqlite3_column_double(ppStmt, 0));
        a4 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
      }
      sqlite3_finalize(ppStmt);
    }
  }

  return a4;
}

- (id)propertiesMigrationSchemaForDatabase:(sqlite3 *)a3
{
  int v4;
  NSObject *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = -[TIUserModelDataStore propertiesVersionFromDatabase:](self, "propertiesVersionFromDatabase:", a3);
  if (v4 == 1)
  {
    IXADefaultLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Properties table to be migrated from version %d to %d"), "-[TIUserModelDataStore propertiesMigrationSchemaForDatabase:]", 1, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_18C56E000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    -[TIUserModelDataStore propertiesMigrationFromV1Schema](self, "propertiesMigrationFromV1Schema");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v4)
  {
    v6 = &stru_1E243B990;
  }
  else
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Properties table to be created with version %d"), "-[TIUserModelDataStore propertiesMigrationSchemaForDatabase:]", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_debug_impl(&dword_18C56E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    -[TIUserModelDataStore propertiesCreationSchema](self, "propertiesCreationSchema");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)durableMigrationSchemaForDatabase:(sqlite3 *)a3
{
  NSObject *v4;
  void *v5;
  id result;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  switch(-[TIUserModelDataStore durableVersionFromDatabase:](self, "durableVersionFromDatabase:", a3))
  {
    case 0:
      IXADefaultLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Durable table to be created with version %d"), "-[TIUserModelDataStore durableMigrationSchemaForDatabase:]", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v16;
        _os_log_debug_impl(&dword_18C56E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      -[TIUserModelDataStore durableCreationSchema](self, "durableCreationSchema");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 1:
      IXADefaultLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Durable table to be reset from version %d to %d"), "-[TIUserModelDataStore durableMigrationSchemaForDatabase:]", 1, 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        _os_log_impl(&dword_18C56E000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      -[TIUserModelDataStore durableResetSchema](self, "durableResetSchema");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIUserModelDataStore durableCreationSchema](self, "durableCreationSchema");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
    case 2:
      IXADefaultLogFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Durable table to be migrated from version %d to %d"), "-[TIUserModelDataStore durableMigrationSchemaForDatabase:]", 2, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_18C56E000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      -[TIUserModelDataStore durableMigrationFromV2Schema](self, "durableMigrationFromV2Schema");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3:
      IXADefaultLogFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Durable table to be migrated from version %d to %d"), "-[TIUserModelDataStore durableMigrationSchemaForDatabase:]", 3, 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_18C56E000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      -[TIUserModelDataStore durableMigrationFromV3Schema](self, "durableMigrationFromV3Schema");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      result = v5;
      break;
    default:
      result = &stru_1E243B990;
      break;
  }
  return result;
}

- (id)transientMigrationSchemaForDatabase:(sqlite3 *)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[TIUserModelDataStore transientVersionFromDatabase:](self, "transientVersionFromDatabase:", a3);
  if ((_DWORD)v4 == 7)
    return &stru_1E243B990;
  v5 = v4;
  if ((_DWORD)v4)
  {
    IXADefaultLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Transient table to be reset from version %d to %d"), "-[TIUserModelDataStore transientMigrationSchemaForDatabase:]", v5, 7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_18C56E000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    -[TIUserModelDataStore transientResetSchema](self, "transientResetSchema");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserModelDataStore transientCreationSchema](self, "transientCreationSchema");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    IXADefaultLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Transient table to be created with version %d"), "-[TIUserModelDataStore transientMigrationSchemaForDatabase:]", 7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_debug_impl(&dword_18C56E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    -[TIUserModelDataStore transientCreationSchema](self, "transientCreationSchema");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)addValue:(id)a3 andSecondaryValue:(id)a4 andRealValue:(id)a5 andProperties:(id)a6 forKey:(id)a7 forInputMode:(id)a8 forDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  OS_dispatch_queue *database_queue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  TIUserModelDataStore *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  database_queue = self->_database_queue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __106__TIUserModelDataStore_addValue_andSecondaryValue_andRealValue_andProperties_forKey_forInputMode_forDate___block_invoke;
  v31[3] = &unk_1E243B5A0;
  v32 = v19;
  v33 = v20;
  v34 = self;
  v35 = v15;
  v36 = v16;
  v37 = v17;
  v38 = v18;
  v39 = v21;
  v40 = &v41;
  v23 = v21;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  v28 = v20;
  v29 = v19;
  TIDispatchSync(database_queue, v31);
  LOBYTE(self) = *((_BYTE *)v42 + 24);

  _Block_object_dispose(&v41, 8);
  return (char)self;
}

- (BOOL)setDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5
{
  return -[TIUserModelDataStore _updateDurableValue:forKey:forDate:withUpdateQuery:](self, "_updateDurableValue:forKey:forDate:withUpdateQuery:", a3, a4, a5, "UPDATE usermodeldurablerecords SET value = :value, last_update_date = :last_update_date WHERE key = :key");
}

- (BOOL)updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5
{
  return -[TIUserModelDataStore _updateDurableValue:forKey:forDate:withUpdateQuery:](self, "_updateDurableValue:forKey:forDate:withUpdateQuery:", a3, a4, a5, "UPDATE usermodeldurablerecords SET value = value + :value, last_update_date = :last_update_date WHERE key = :key");
}

- (BOOL)_updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5 withUpdateQuery:(const char *)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *database_queue;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  const char *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  database_queue = self->_database_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__TIUserModelDataStore__updateDurableValue_forKey_forDate_withUpdateQuery___block_invoke;
  v18[3] = &unk_1E243B5C8;
  v18[4] = self;
  v19 = v11;
  v22 = &v24;
  v23 = a6;
  v20 = v10;
  v21 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  TIDispatchSync(database_queue, v18);
  LOBYTE(database_queue) = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)database_queue;
}

- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *database_queue;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11039;
  v28 = __Block_byref_object_dispose__11040;
  v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__11039;
  v22[4] = __Block_byref_object_dispose__11040;
  v10 = a5;
  v23 = v10;
  database_queue = self->_database_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__TIUserModelDataStore_getAllValuesForKey_forInputMode_sinceDate___block_invoke;
  v17[3] = &unk_1E243B690;
  v17[4] = self;
  v20 = v22;
  v21 = &v24;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  TIDispatchSync(database_queue, v17);
  if (objc_msgSend((id)v25[5], "count"))
    v14 = (void *)v25[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

- (id)getAllValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *database_queue;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11039;
  v28 = __Block_byref_object_dispose__11040;
  v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__11039;
  v22[4] = __Block_byref_object_dispose__11040;
  v9 = a5;
  v23 = v9;
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("%"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  database_queue = self->_database_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__TIUserModelDataStore_getAllValuesForKeyPrefix_forInputMode_sinceDate___block_invoke;
  v17[3] = &unk_1E243B690;
  v17[4] = self;
  v20 = v22;
  v21 = &v24;
  v12 = v10;
  v18 = v12;
  v13 = v8;
  v19 = v13;
  TIDispatchSync(database_queue, v17);
  if (objc_msgSend((id)v25[5], "count"))
    v14 = (void *)v25[5];
  else
    v14 = 0;
  v15 = v14;

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

- (id)getDailyAndWeeklyValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  OS_dispatch_queue *database_queue;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  TIUserModelDataStore *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__11039;
  v46 = __Block_byref_object_dispose__11040;
  v47 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__11039;
  v40[4] = __Block_byref_object_dispose__11040;
  v13 = a6;
  v41 = v13;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__11039;
  v38[4] = __Block_byref_object_dispose__11040;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v13, (double)(unint64_t)kCommonMetricQueryTimeFrame * -86400.0);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__11039;
  v36[4] = __Block_byref_object_dispose__11040;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v13, (double)(unint64_t)kFeatureUsageQueryTimeFrame * -86400.0);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("%"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  database_queue = self->_database_queue;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __99__TIUserModelDataStore_getDailyAndWeeklyValuesForKeyPrefix_forInputMode_weeklyKeySuffixes_endDate___block_invoke;
  v26 = &unk_1E243B5F0;
  v27 = self;
  v16 = v12;
  v28 = v16;
  v17 = v10;
  v29 = v17;
  v32 = &v42;
  v18 = v14;
  v30 = v18;
  v19 = v11;
  v31 = v19;
  v33 = v40;
  v34 = v38;
  v35 = v36;
  TIDispatchSync(database_queue, &v23);
  if (objc_msgSend((id)v43[5], "count", v23, v24, v25, v26, v27))
    v20 = (void *)v43[5];
  else
    v20 = 0;
  v21 = v20;

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);

  return v21;
}

- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 fromDate:(id)a5 toDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  OS_dispatch_queue *database_queue;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__11039;
  v36 = __Block_byref_object_dispose__11040;
  v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__11039;
  v30[4] = __Block_byref_object_dispose__11040;
  v14 = v12;
  v31 = v14;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__11039;
  v28[4] = __Block_byref_object_dispose__11040;
  v15 = v13;
  v29 = v15;
  database_queue = self->_database_queue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__TIUserModelDataStore_getAllValuesForKey_forInputMode_fromDate_toDate___block_invoke;
  v22[3] = &unk_1E243B618;
  v22[4] = self;
  v25 = v30;
  v26 = v28;
  v27 = &v32;
  v17 = v10;
  v23 = v17;
  v18 = v11;
  v24 = v18;
  TIDispatchSync(database_queue, v22);
  if (objc_msgSend((id)v33[5], "count"))
    v19 = (void *)v33[5];
  else
    v19 = 0;
  v20 = v19;

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(&v32, 8);
  return v20;
}

- (id)getDurableValueForKey:(id)a3
{
  id v4;
  OS_dispatch_queue *database_queue;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11039;
  v16 = __Block_byref_object_dispose__11040;
  v17 = 0;
  database_queue = self->_database_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__TIUserModelDataStore_getDurableValueForKey___block_invoke;
  v9[3] = &unk_1E243B640;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  TIDispatchSync(database_queue, v9);
  if (objc_msgSend((id)v13[5], "count"))
  {
    objc_msgSend((id)v13[5], "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getInputModesForKey:(id)a3
{
  id v4;
  OS_dispatch_queue *database_queue;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11039;
  v17 = __Block_byref_object_dispose__11040;
  v18 = 0;
  database_queue = self->_database_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__TIUserModelDataStore_getInputModesForKey___block_invoke;
  v10[3] = &unk_1E243B640;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  TIDispatchSync(database_queue, v10);
  if (objc_msgSend((id)v14[5], "count"))
    v7 = (void *)v14[5];
  else
    v7 = 0;
  v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)getAllKnownInputModes
{
  return -[TIUserModelDataStore getAllKnownInputModesSinceDate:](self, "getAllKnownInputModesSinceDate:", 0);
}

- (id)getAllKnownInputModesSinceDate:(id)a3
{
  id v4;
  OS_dispatch_queue *database_queue;
  void *v6;
  id v7;
  _QWORD v9[7];
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11039;
  v16 = __Block_byref_object_dispose__11040;
  v17 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__11039;
  v10[4] = __Block_byref_object_dispose__11040;
  v4 = a3;
  v11 = v4;
  database_queue = self->_database_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__TIUserModelDataStore_getAllKnownInputModesSinceDate___block_invoke;
  v9[3] = &unk_1E243B668;
  v9[4] = self;
  v9[5] = v10;
  v9[6] = &v12;
  TIDispatchSync(database_queue, v9);
  if (objc_msgSend((id)v13[5], "count"))
    v6 = (void *)v13[5];
  else
    v6 = 0;
  v7 = v6;
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)purgeDataForKey:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *database_queue;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__11039;
  v21[4] = __Block_byref_object_dispose__11040;
  v22 = v10;
  database_queue = self->_database_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__TIUserModelDataStore_purgeDataForKey_forInputMode_beforeDate___block_invoke;
  v16[3] = &unk_1E243B690;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v21;
  v20 = &v23;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  TIDispatchSync(database_queue, v16);
  LOBYTE(self) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);
  return (char)self;
}

- (BOOL)purgeDataForKeyPrefix:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *database_queue;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__11039;
  v20[4] = __Block_byref_object_dispose__11040;
  v21 = a5;
  v9 = v21;
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("%"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  database_queue = self->_database_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__TIUserModelDataStore_purgeDataForKeyPrefix_forInputMode_beforeDate___block_invoke;
  v15[3] = &unk_1E243B690;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v20;
  v19 = &v22;
  v12 = v10;
  v13 = v8;
  TIDispatchSync(database_queue, v15);
  LOBYTE(database_queue) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  return (char)database_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __70__TIUserModelDataStore_purgeDataForKeyPrefix_forInputMode_beforeDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  sqlite3_stmt *v11;
  double v12;
  int v13;
  BOOL v15;
  void *v16;
  _BYTE ppStmt[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
      v6 = "DELETE FROM usermodeltransientrecords WHERE key LIKE ? AND input_mode = ? AND last_update_date < ?";
    else
      v6 = "DELETE FROM usermodeltransientrecords WHERE key LIKE ?  AND last_update_date < ?";
    *(_QWORD *)ppStmt = 0;
    v7 = sqlite3_prepare_v2(*(sqlite3 **)(v5 + 16), v6, -1, (sqlite3_stmt **)ppStmt, 0);
    if (!*(_QWORD *)ppStmt || v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    else
    {
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
      v8 = *(void **)(a1 + 40);
      if (v8)
      {
        sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0);
        v9 = 3;
      }
      else
      {
        v9 = 2;
      }
      v11 = *(sqlite3_stmt **)ppStmt;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v11, v9, v12);
      v13 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
      v15 = v13 == 101 || v13 == 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v15;
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    IXADefaultLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't purge data because the database is invalid."), "-[TIUserModelDataStore purgeDataForKeyPrefix:forInputMode:beforeDate:]_block_invoke");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v16;
      _os_log_error_impl(&dword_18C56E000, v10, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __64__TIUserModelDataStore_purgeDataForKey_forInputMode_beforeDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  sqlite3_stmt *v6;
  double v7;
  int v8;
  BOOL v10;
  NSObject *v11;
  void *v12;
  _BYTE ppStmt[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
    *(_QWORD *)ppStmt = 0;
    v5 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "DELETE FROM usermodeltransientrecords WHERE key = ? AND input_mode = ? AND last_update_date < ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (!*(_QWORD *)ppStmt || v5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    else
    {
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
      v6 = *(sqlite3_stmt **)ppStmt;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v6, 3, v7);
      v8 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
      v10 = v8 == 101 || v8 == 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10;
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    IXADefaultLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't purge data because the database is invalid."), "-[TIUserModelDataStore purgeDataForKey:forInputMode:beforeDate:]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v12;
      _os_log_error_impl(&dword_18C56E000, v11, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __55__TIUserModelDataStore_getAllKnownInputModesSinceDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  sqlite3_stmt *v9;
  double v10;
  int v11;
  const unsigned __int8 *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BYTE ppStmt[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
    *(_QWORD *)ppStmt = 0;
    v5 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), " SELECT DISTINCT input_mode FROM usermodeltransientrecords WHERE last_update_date > ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(_QWORD *)ppStmt && !v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(sqlite3_stmt **)ppStmt;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v9, 1, v10);
      while (1)
      {
        v11 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v11 != 100)
          break;
        v12 = sqlite3_column_text(*(sqlite3_stmt **)ppStmt, 0);
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

      }
      if (v11 != 101)
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = 0;

      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    IXADefaultLogFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get all known input modes because the database is invalid."), "-[TIUserModelDataStore getAllKnownInputModesSinceDate:]_block_invoke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v18;
      _os_log_error_impl(&dword_18C56E000, v15, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __44__TIUserModelDataStore_getInputModesForKey___block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const unsigned __int8 *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE ppStmt[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    *(_QWORD *)ppStmt = 0;
    v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), " SELECT DISTINCT input_mode FROM usermodeltransientrecords WHERE key = ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(_QWORD *)ppStmt)
      v3 = v2 == 0;
    else
      v3 = 0;
    if (v3)
    {
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;
      while (1)
      {

        v7 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v7 != 100)
          break;
        v8 = sqlite3_column_text(*(sqlite3_stmt **)ppStmt, 0);
        v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v6);
      }
      if (v7 != 101)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = 0;

      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    IXADefaultLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get input modes because the database is invalid."), "-[TIUserModelDataStore getInputModesForKey:]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v13;
      _os_log_error_impl(&dword_18C56E000, v10, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __46__TIUserModelDataStore_getDurableValueForKey___block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  TIUserModelDataStoreDurableEntry *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BYTE ppStmt[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    *(_QWORD *)ppStmt = 0;
    v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "SELECT value, creation_date, last_update_date FROM usermodeldurablerecords WHERE key = ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(_QWORD *)ppStmt)
      v3 = v2 == 0;
    else
      v3 = 0;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      while (1)
      {
        v7 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v7 != 100)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 0));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 2));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[TIUserModelDataStoreDurableEntry initWithCreationDate:withLastUpdateDate:withKey:withValue:]([TIUserModelDataStoreDurableEntry alloc], "initWithCreationDate:withLastUpdateDate:withKey:withValue:", v9, v10, *(_QWORD *)(a1 + 40), v8);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v11);

      }
      if (v7 != 101)
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    IXADefaultLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get durable value because the database is invalid."), "-[TIUserModelDataStore getDurableValueForKey:]_block_invoke");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v15;
      _os_log_error_impl(&dword_18C56E000, v12, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __72__TIUserModelDataStore_getAllValuesForKey_forInputMode_fromDate_toDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  sqlite3_stmt *v12;
  double v13;
  sqlite3_stmt *v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const void *v22;
  void *v23;
  void *v24;
  TIUserModelDataStoreEntry *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BYTE ppStmt[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    *(_QWORD *)ppStmt = 0;
    v8 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "SELECT key, value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key = ? AND input_mode = ? AND last_update_date > ? AND last_update_date <= ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(_QWORD *)ppStmt && !v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
      v12 = *(sqlite3_stmt **)ppStmt;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v12, 3, v13);
      v14 = *(sqlite3_stmt **)ppStmt;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v14, 4, v15);
      while (1)
      {
        v16 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v16 != 100)
          break;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)ppStmt, 0));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 1));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 2));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 3));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = sqlite3_column_bytes(*(sqlite3_stmt **)ppStmt, 4);
        v22 = sqlite3_column_blob(*(sqlite3_stmt **)ppStmt, 4);
        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 5));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[TIUserModelDataStoreEntry initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:]([TIUserModelDataStoreEntry alloc], "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v24, v17, *(_QWORD *)(a1 + 48), v18, v19, v20, v23);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v25);

      }
      if (v16 != 101)
      {
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = 0;

      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    IXADefaultLogFacility();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get values because the database is invalid."), "-[TIUserModelDataStore getAllValuesForKey:forInputMode:fromDate:toDate:]_block_invoke");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v29;
      _os_log_error_impl(&dword_18C56E000, v26, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __99__TIUserModelDataStore_getDailyAndWeeklyValuesForKeyPrefix_forInputMode_weeklyKeySuffixes_endDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  sqlite3 *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  sqlite3_stmt *v20;
  double v21;
  sqlite3_stmt *v22;
  double v23;
  sqlite3_stmt *v24;
  double v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  const void *v37;
  void *v38;
  void *v39;
  TIUserModelDataStoreEntry *v40;
  uint64_t v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE buf[12];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v49;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v49 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 48), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v2, "addObject:", v9);

          objc_msgSend(v3, "addObject:", CFSTR("?"));
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v6);
    }

    if (-[NSObject count](v2, "count"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("(last_update_date > ? OR (last_update_date > ? AND key IN (%@)))"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("SELECT key, value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key LIKE ? AND input_mode = ? AND last_update_date <= ? AND "), "stringByAppendingString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(CFSTR("SELECT key, value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key LIKE ? AND input_mode = ? AND last_update_date <= ? AND "), "stringByAppendingString:", CFSTR("last_update_date > ?"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_QWORD *)buf = 0;
    v15 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16);
    v43 = objc_retainAutorelease(v13);
    v16 = sqlite3_prepare_v2(v15, (const char *)objc_msgSend(v43, "UTF8String"), -1, (sqlite3_stmt **)buf, 0);
    if (*(_QWORD *)buf && !v16)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      sqlite3_bind_text(*(sqlite3_stmt **)buf, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String"), -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)buf, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "UTF8String"), -1, 0);
      v20 = *(sqlite3_stmt **)buf;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v20, 3, v21);
      v22 = *(sqlite3_stmt **)buf;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v22, 4, v23);
      if (!-[NSObject count](v2, "count"))
        goto LABEL_25;
      v24 = *(sqlite3_stmt **)buf;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v24, 5, v25);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v26 = v2;
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v45;
        v30 = 6;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v45 != v29)
              objc_enumerationMutation(v26);
            sqlite3_bind_text(*(sqlite3_stmt **)buf, v30 + v31, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v31)), "UTF8String"), -1, 0);
            ++v31;
          }
          while (v28 != v31);
          v30 += v31;
          v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        }
        while (v28);
      }
      while (1)
      {

LABEL_25:
        v32 = sqlite3_step(*(sqlite3_stmt **)buf);
        if (v32 != 100)
          break;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)buf, 0));
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)buf, 1));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)buf, 2));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)buf, 3));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = sqlite3_column_bytes(*(sqlite3_stmt **)buf, 4);
        v37 = sqlite3_column_blob(*(sqlite3_stmt **)buf, 4);
        v38 = 0;
        if (v36)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v37, v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)buf, 5));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[TIUserModelDataStoreEntry initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:]([TIUserModelDataStoreEntry alloc], "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v39, v26, *(_QWORD *)(a1 + 64), v33, v34, v35, v38);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v40);

      }
      if (v32 != 101)
      {
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v42 = *(void **)(v41 + 40);
        *(_QWORD *)(v41 + 40) = 0;

      }
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }

  }
  else
  {
    IXADefaultLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get values because the database is invalid."), "-[TIUserModelDataStore getDailyAndWeeklyValuesForKeyPrefix:forInputMode:weeklyKeySuffixes:endDate:]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_error_impl(&dword_18C56E000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }

}

void __72__TIUserModelDataStore_getAllValuesForKeyPrefix_forInputMode_sinceDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  sqlite3_stmt *v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const void *v17;
  void *v18;
  void *v19;
  TIUserModelDataStoreEntry *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BYTE ppStmt[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
    *(_QWORD *)ppStmt = 0;
    v5 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "SELECT key, value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key LIKE ? AND input_mode = ? AND last_update_date > ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(_QWORD *)ppStmt && !v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
      v9 = *(sqlite3_stmt **)ppStmt;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v9, 3, v10);
      while (1)
      {
        v11 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v11 != 100)
          break;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)ppStmt, 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 2));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 3));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = sqlite3_column_bytes(*(sqlite3_stmt **)ppStmt, 4);
        v17 = sqlite3_column_blob(*(sqlite3_stmt **)ppStmt, 4);
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 5));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[TIUserModelDataStoreEntry initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:]([TIUserModelDataStoreEntry alloc], "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v19, v12, *(_QWORD *)(a1 + 48), v13, v14, v15, v18);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v20);

      }
      if (v11 != 101)
      {
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = 0;

      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    IXADefaultLogFacility();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get values because the database is invalid."), "-[TIUserModelDataStore getAllValuesForKeyPrefix:forInputMode:sinceDate:]_block_invoke");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v24;
      _os_log_error_impl(&dword_18C56E000, v21, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __66__TIUserModelDataStore_getAllValuesForKey_forInputMode_sinceDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  sqlite3_stmt *v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const void *v16;
  void *v17;
  void *v18;
  TIUserModelDataStoreEntry *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BYTE ppStmt[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
    *(_QWORD *)ppStmt = 0;
    v5 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "SELECT value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key = ? AND input_mode = ? AND last_update_date > ? ORDER BY last_update_date ASC", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(_QWORD *)ppStmt && !v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
      v9 = *(sqlite3_stmt **)ppStmt;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSince1970");
      sqlite3_bind_double(v9, 3, v10);
      while (1)
      {
        v11 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v11 != 100)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 2));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = sqlite3_column_bytes(*(sqlite3_stmt **)ppStmt, 3);
        v16 = sqlite3_column_blob(*(sqlite3_stmt **)ppStmt, 3);
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 4));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[TIUserModelDataStoreEntry initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:]([TIUserModelDataStoreEntry alloc], "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v18, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v12, v13, v14, v17);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v19);

      }
      if (v11 != 101)
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = 0;

      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    IXADefaultLogFacility();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get values because the database is invalid."), "-[TIUserModelDataStore getAllValuesForKey:forInputMode:sinceDate:]_block_invoke");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v23;
      _os_log_error_impl(&dword_18C56E000, v20, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __75__TIUserModelDataStore__updateDurableValue_forKey_forDate_withUpdateQuery___block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  char v4;
  char v5;
  int v6;
  const char *v7;
  NSObject *v8;
  int v9;
  sqlite3_stmt *v10;
  int v11;
  sqlite3_stmt *v12;
  int v13;
  sqlite3_stmt *v14;
  int v15;
  double v16;
  sqlite3_stmt *v17;
  int v18;
  double v19;
  int v20;
  BOOL v22;
  void *v23;
  sqlite3_stmt *pStmt;
  _BYTE ppStmt[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    *(_QWORD *)ppStmt = 0;
    v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "SELECT value FROM usermodeldurablerecords WHERE key = ? ", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(_QWORD *)ppStmt)
      v3 = v2 == 0;
    else
      v3 = 0;
    if (v3)
    {
      v4 = 1;
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      do
      {
        v5 = v4;
        v6 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        v4 = 0;
      }
      while (v6 == 100);
      if (v6 == 101)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        v7 = (v5 & 1) != 0
           ? "INSERT INTO usermodeldurablerecords (key,  value,  creation_date, last_update_date) VALUES (:key, :value, :"
             "creation_date, :last_update_date)"
           : *(const char **)(a1 + 72);
        pStmt = 0;
        v9 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), v7, -1, &pStmt, 0);
        v10 = pStmt;
        if (pStmt)
        {
          if (!v9)
          {
            v11 = sqlite3_bind_parameter_index(pStmt, ":key");
            sqlite3_bind_text(v10, v11, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
            v12 = pStmt;
            v13 = sqlite3_bind_parameter_index(pStmt, ":value");
            sqlite3_bind_int(v12, v13, objc_msgSend(*(id *)(a1 + 48), "intValue"));
            if ((v5 & 1) != 0)
            {
              v14 = pStmt;
              v15 = sqlite3_bind_parameter_index(pStmt, ":creation_date");
              objc_msgSend(*(id *)(a1 + 56), "timeIntervalSince1970");
              sqlite3_bind_double(v14, v15, v16);
            }
            v17 = pStmt;
            v18 = sqlite3_bind_parameter_index(pStmt, ":last_update_date");
            objc_msgSend(*(id *)(a1 + 56), "timeIntervalSince1970");
            sqlite3_bind_double(v17, v18, v19);
            v20 = sqlite3_step(pStmt);
            v22 = v20 == 101 || v20 == 0;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v22;
            sqlite3_finalize(pStmt);
          }
        }
      }
    }
  }
  else
  {
    IXADefaultLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't update durable value because the database is invalid."), "-[TIUserModelDataStore _updateDurableValue:forKey:forDate:withUpdateQuery:]_block_invoke");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v23;
      _os_log_error_impl(&dword_18C56E000, v8, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

void __106__TIUserModelDataStore_addValue_andSecondaryValue_andRealValue_andProperties_forKey_forInputMode_forDate___block_invoke(uint64_t a1)
{
  int v2;
  sqlite3_stmt *v3;
  int v4;
  sqlite3_stmt *v5;
  int v6;
  sqlite3_stmt *v7;
  int v8;
  sqlite3_stmt *v9;
  int v10;
  sqlite3_stmt *v11;
  int v12;
  double v13;
  uint64_t v14;
  sqlite3_stmt *v15;
  int v16;
  NSObject *v17;
  void *v18;
  sqlite3_stmt *v19;
  int v20;
  double v21;
  int v22;
  BOOL v24;
  _BYTE ppStmt[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    IXADefaultLogFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Required field 'key' is nil. Ignoring value for key."), "-[TIUserModelDataStore addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:]_block_invoke");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)ppStmt = 138412290;
    *(_QWORD *)&ppStmt[4] = v18;
LABEL_14:
    _os_log_error_impl(&dword_18C56E000, v17, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    goto LABEL_15;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    IXADefaultLogFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Required field 'inputMode' is nil. Ignoring value for inputMode."), "-[TIUserModelDataStore addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:]_block_invoke");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)ppStmt = 138412290;
    *(_QWORD *)&ppStmt[4] = v18;
    goto LABEL_14;
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "isDatabaseValid"))
  {
    IXADefaultLogFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't add value because the database is invalid."), "-[TIUserModelDataStore addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:]_block_invoke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v18;
      goto LABEL_14;
    }
LABEL_15:

    return;
  }
  *(_QWORD *)ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 16), "INSERT INTO usermodeltransientrecords (key, input_mode, value,  secondary_value, real_value, properties, last_update_date) VALUES (:key, :input_mode, :value, :secondary_value, :real_value, :properties, :last_update_date)", -1, (sqlite3_stmt **)ppStmt, 0);
  v3 = *(sqlite3_stmt **)ppStmt;
  if (!*(_QWORD *)ppStmt || v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
  }
  else
  {
    v4 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":key");
    sqlite3_bind_text(v3, v4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
    v5 = *(sqlite3_stmt **)ppStmt;
    v6 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":input_mode");
    sqlite3_bind_text(v5, v6, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    v7 = *(sqlite3_stmt **)ppStmt;
    v8 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":value");
    sqlite3_bind_int(v7, v8, objc_msgSend(*(id *)(a1 + 56), "intValue"));
    v9 = *(sqlite3_stmt **)ppStmt;
    v10 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":secondary_value");
    sqlite3_bind_int(v9, v10, objc_msgSend(*(id *)(a1 + 64), "intValue"));
    v11 = *(sqlite3_stmt **)ppStmt;
    v12 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":real_value");
    objc_msgSend(*(id *)(a1 + 72), "doubleValue");
    sqlite3_bind_double(v11, v12, v13);
    v14 = *(_QWORD *)(a1 + 80);
    v15 = *(sqlite3_stmt **)ppStmt;
    v16 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":properties");
    if (v14)
      sqlite3_bind_blob(v15, v16, (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 80)), "bytes"), objc_msgSend(*(id *)(a1 + 80), "length"), 0);
    else
      sqlite3_bind_null(v15, v16);
    v19 = *(sqlite3_stmt **)ppStmt;
    v20 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":last_update_date");
    objc_msgSend(*(id *)(a1 + 88), "timeIntervalSince1970");
    sqlite3_bind_double(v19, v20, v21);
    v22 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
    v24 = v22 == 101 || v22 == 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v24;
    sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
  }
}

void __50__TIUserModelDataStore_transientLastMigrationDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "transientLastMigrationDateFromDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  else
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get transient last migration date because the database is invalid."), "-[TIUserModelDataStore transientLastMigrationDate]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_18C56E000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
}

void __40__TIUserModelDataStore_transientVersion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "transientVersionFromDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    IXADefaultLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get transient version because the database is invalid."), "-[TIUserModelDataStore transientVersion]_block_invoke");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v5 = v3;
      _os_log_error_impl(&dword_18C56E000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
}

void __48__TIUserModelDataStore_durableLastMigrationDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "durableLastMigrationDateFromDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  else
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get durable last migration date because the database is invalid."), "-[TIUserModelDataStore durableLastMigrationDate]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_18C56E000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
}

void __38__TIUserModelDataStore_durableVersion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "durableVersionFromDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    IXADefaultLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get durable version because the database is invalid."), "-[TIUserModelDataStore durableVersion]_block_invoke");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v5 = v3;
      _os_log_error_impl(&dword_18C56E000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
}

void __51__TIUserModelDataStore_propertiesLastMigrationDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "propertiesLastMigrationDateFromDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  else
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get properties last migration date because the database is invalid."), "-[TIUserModelDataStore propertiesLastMigrationDate]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_18C56E000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
}

void __41__TIUserModelDataStore_propertiesVersion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "propertiesVersionFromDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    IXADefaultLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't get properties version because the database is invalid."), "-[TIUserModelDataStore propertiesVersion]_block_invoke");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v5 = v3;
      _os_log_error_impl(&dword_18C56E000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
}

void __37__TIUserModelDataStore_closeDatabase__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    IXADefaultLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Closing database."), "-[TIUserModelDataStore closeDatabase]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_debug_impl(&dword_18C56E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v3 = sqlite3_close(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16));
    IXADefaultLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((_DWORD)v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Error closing database: %d %s"), "-[TIUserModelDataStore closeDatabase]_block_invoke", v3, sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16)));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v7;
        _os_log_error_impl(&dword_18C56E000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Database closed."), "-[TIUserModelDataStore closeDatabase]_block_invoke");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_debug_impl(&dword_18C56E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
}

uint64_t __31__TIUserModelDataStore_isValid__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)initializeDataStoreAtPath:(id)a3
{
  id v3;
  TIUserModelDataStore *v4;

  v3 = a3;
  if (TI_DEVICE_UNLOCKED_SINCE_BOOT())
    v4 = -[TIUserModelDataStore initWithPath:]([TIUserModelDataStore alloc], "initWithPath:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)purgeDurableDataForKeyPrefix:(id)a3
{
  void *v4;
  OS_dispatch_queue *database_queue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("%"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  database_queue = self->_database_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__TIUserModelDataStore_TestingSupport__purgeDurableDataForKeyPrefix___block_invoke;
  v8[3] = &unk_1E243B640;
  v8[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  TIDispatchSync(database_queue, v8);
  LOBYTE(database_queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)database_queue;
}

void __69__TIUserModelDataStore_TestingSupport__purgeDurableDataForKeyPrefix___block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  NSObject *v4;
  int v5;
  BOOL v7;
  void *v8;
  _BYTE ppStmt[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDatabaseValid"))
  {
    *(_QWORD *)ppStmt = 0;
    v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 16), "DELETE FROM usermodeldurablerecords WHERE key LIKE ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(_QWORD *)ppStmt)
      v3 = v2 == 0;
    else
      v3 = 0;
    if (v3)
    {
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
      v5 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
      v7 = v5 == 101 || v5 == 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    IXADefaultLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TIUserModelDataStore: Can't purge durable data because the database is invalid."), "-[TIUserModelDataStore(TestingSupport) purgeDurableDataForKeyPrefix:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)ppStmt = 138412290;
      *(_QWORD *)&ppStmt[4] = v8;
      _os_log_error_impl(&dword_18C56E000, v4, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    }
  }
}

@end
