@implementation PPSSQLiteDatabase

- (PPSSQLiteDatabase)initWithDatabaseURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "isFileURL") & 1) == 0)
  {

    self = 0;
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid database URL"));
  }
  v13.receiver = self;
  v13.super_class = (Class)PPSSQLiteDatabase;
  v6 = -[PPSSQLiteDatabase init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    v8 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.PerfPowerServicesReader.SQLite", v9);
    v11 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v10;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 2), "PPSSQLiteDispatchQueue", v6, 0);
  }

  return (PPSSQLiteDatabase *)v6;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  OS_dispatch_queue *v4;
  objc_super v5;

  if (self->_db)
    -[PPSSQLiteDatabase close](self, "close");
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_queue_set_specific(dispatchQueue, "PPSSQLiteDispatchQueue", 0, 0);
    v4 = self->_dispatchQueue;
    self->_dispatchQueue = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PPSSQLiteDatabase;
  -[PPSSQLiteDatabase dealloc](&v5, sel_dealloc);
}

- (int)openForReadingWithError:(id *)a3
{
  sqlite3 **p_db;
  void *v4;
  void *v5;
  id v6;
  sqlite3 *v7;
  int v8;

  p_db = &self->_db;
  if (!self->_db)
  {
    -[PPSSQLiteDatabase databaseURL](self, "databaseURL", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v5);
    if (!sqlite3_open_v2((const char *)objc_msgSend(v6, "fileSystemRepresentation"), p_db, 3145729, 0))
    {
      v7 = *p_db;
      do
      {
        usleep(0x14u);
        v8 = sqlite3_exec(v7, "PRAGMA cache_size=512", 0, 0, 0);
      }
      while (v8 == 5);
      if (!v8)
        sqlite3_busy_timeout(*p_db, 60000);
    }

  }
  return 0;
}

- (void)close
{
  sqlite3 *db;
  NSObject *v4;
  uint8_t v5[16];

  -[PPSSQLiteDatabase clearStatementCache](self, "clearStatementCache");
  db = self->_db;
  if (db)
  {
    if (sqlite3_close_v2(db))
    {
      logHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2439D9000, v4, OS_LOG_TYPE_INFO, "failed to close database.", v5, 2u);
      }

    }
    self->_db = 0;
  }
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  return -[PPSSQLiteDatabase executeSQL:shouldCache:error:bindingHandler:enumerationHandler:](self, "executeSQL:shouldCache:error:bindingHandler:enumerationHandler:", a3, 0, a4, 0, 0);
}

- (BOOL)executeSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v9 = a4;
  v12 = a6;
  v13 = a7;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__PPSSQLiteDatabase_executeSQL_shouldCache_error_bindingHandler_enumerationHandler___block_invoke;
  v17[3] = &unk_25142C8E8;
  v18 = v12;
  v19 = v13;
  v14 = v13;
  v15 = v12;
  LOBYTE(a5) = -[PPSSQLiteDatabase _prepareStatementForSQL:shouldCache:error:usingBlock:](self, "_prepareStatementForSQL:shouldCache:error:usingBlock:", a3, v9, a5, v17);

  return (char)a5;
}

uint64_t __84__PPSSQLiteDatabase_executeSQL_shouldCache_error_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, sqlite3_stmt *a2, _QWORD *a3)
{
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  id v14;
  char v15;
  _BOOL8 v16;
  unsigned __int8 v18;
  _BYTE v19[24];
  id v20;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, sqlite3_stmt *))(v6 + 16))(v6, a2);
  if (!*(_QWORD *)(a1 + 40))
  {
    v16 = +[PPSSQLiteDatabase _stepStatement:hasRow:error:](PPSSQLiteDatabase, "_stepStatement:hasRow:error:", a2, 0, a3);
    sqlite3_reset(a2);
    return v16;
  }
  PPSSQLiteRow::PPSSQLiteRow((uint64_t)v19, a2, 0);
  v7 = 0;
  v18 = 0;
  while (1)
  {
    v8 = +[PPSSQLiteDatabase _stepStatement:hasRow:error:](PPSSQLiteDatabase, "_stepStatement:hasRow:error:", a2, &v18, a3);
    v9 = v8;
    v10 = v18;
    if (v18)
      v11 = v8;
    else
      v11 = 0;
    if (!v11)
      goto LABEL_11;
    v12 = (void *)MEMORY[0x2494FEED8]();
    v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v14 = v7;

    objc_autoreleasePoolPop(v12);
    if (!v13)
      break;
    v10 = v18;
    v7 = v14;
LABEL_11:
    if (v10)
      v15 = v9;
    else
      v15 = 0;
    if ((v15 & 1) == 0)
    {
      v14 = v7;
      if (!v7)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  v9 = 1;
  if (!v14)
    goto LABEL_21;
LABEL_19:
  v9 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v14);
LABEL_21:

  return v9;
}

- (void)clearStatementCache
{
  __CFDictionary *statementCache;

  statementCache = self->_statementCache;
  if (statementCache)
  {
    CFRelease(statementCache);
    self->_statementCache = 0;
  }
}

- (id)columnNamesForTable:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA TABLE_INFO('%@');"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9[4] = &v11;
  v10 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__PPSSQLiteDatabase_columnNamesForTable___block_invoke;
  v9[3] = &unk_25142C910;
  -[PPSSQLiteDatabase executeSQL:shouldCache:error:bindingHandler:enumerationHandler:](self, "executeSQL:shouldCache:error:bindingHandler:enumerationHandler:", v4, 0, &v10, 0, v9);
  v5 = v10;
  if (v5)
    v6 = 0;
  else
    v6 = (void *)v12[5];
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __41__PPSSQLiteDatabase_columnNamesForTable___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x2494FEED8]();
  PPSSQLiteColumnValueAsString(a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
  }

  objc_autoreleasePoolPop(v4);
  return 1;
}

- (id)tableNames
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type='table'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v8[4] = &v10;
  v9 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__PPSSQLiteDatabase_tableNames__block_invoke;
  v8[3] = &unk_25142C910;
  -[PPSSQLiteDatabase executeSQL:shouldCache:error:bindingHandler:enumerationHandler:](self, "executeSQL:shouldCache:error:bindingHandler:enumerationHandler:", v3, 1, &v9, 0, v8);
  v4 = v9;
  if (v4)
    v5 = 0;
  else
    v5 = (void *)v11[5];
  v6 = v5;
  _Block_object_dispose(&v10, 8);

  return v6;
}

uint64_t __31__PPSSQLiteDatabase_tableNames__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x2494FEED8]();
  PPSSQLiteColumnValueAsString(a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
  }

  objc_autoreleasePoolPop(v4);
  return 1;
}

- (BOOL)tableWithName:(id)a3 containsColumnWithName:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = self->_db
    && objc_msgSend(v6, "length")
    && objc_msgSend(v7, "length")
    && sqlite3_table_column_metadata(self->_db, 0, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 0, 0, 0, 0, 0) == 0;

  return v8;
}

- (id)typeForColumn:(id)a3 inTable:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRAGMA TABLE_INFO('%@');"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__PPSSQLiteDatabase_typeForColumn_inTable_error___block_invoke;
  v13[3] = &unk_25142C938;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  -[PPSSQLiteDatabase executeSQL:shouldCache:error:bindingHandler:enumerationHandler:](self, "executeSQL:shouldCache:error:bindingHandler:enumerationHandler:", v9, 1, a5, 0, v13);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

uint64_t __49__PPSSQLiteDatabase_typeForColumn_inTable_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x2494FEED8]();
  PPSSQLiteColumnValueAsString(a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v5))
      {
        PPSSQLiteColumnValueAsString(a2, 2);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

      }
    }
  }

  objc_autoreleasePoolPop(v4);
  return 0;
}

- (void)_accessDatabaseUsingBlock:(id)a3
{
  void (**block)(void);

  block = (void (**)(void))a3;
  if (dispatch_get_specific("PPSSQLiteDispatchQueue") == self)
    block[2]();
  else
    dispatch_sync((dispatch_queue_t)self->_dispatchQueue, block);

}

- (BOOL)_prepareStatementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  id *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v10 = a3;
  v11 = a6;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __74__PPSSQLiteDatabase__prepareStatementForSQL_shouldCache_error_usingBlock___block_invoke;
  v16[3] = &unk_25142C960;
  v16[4] = self;
  v17 = v10;
  v21 = a4;
  v19 = &v22;
  v20 = a5;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  -[PPSSQLiteDatabase _accessDatabaseUsingBlock:](self, "_accessDatabaseUsingBlock:", v16);
  v14 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __74__PPSSQLiteDatabase__prepareStatementForSQL_shouldCache_error_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  sqlite3_stmt *v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "_statementForSQL:shouldCache:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));
  if (result)
  {
    v3 = (sqlite3_stmt *)result;
    v4 = *(_QWORD *)(a1 + 48);
    v8 = 0;
    v5 = (*(uint64_t (**)(void))(v4 + 16))();
    v6 = v8;
    v7 = v6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && *(_QWORD *)(a1 + 64))
      **(_QWORD **)(a1 + 64) = objc_retainAutorelease(v6);

    sqlite3_reset(v3);
    result = sqlite3_clear_bindings(v3);
    if (!*(_BYTE *)(a1 + 72))
      return sqlite3_finalize(v3);
  }
  return result;
}

+ (BOOL)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 error:(id *)a5
{
  unsigned __int8 v8;
  int v9;
  NSObject *v10;
  BOOL result;
  const char *v12;
  sqlite3 *v13;
  const char *v14;
  const char *v15;
  sqlite3 *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a4)
    *a4 = 0;
  if (!a3)
    return 1;
  while (1)
  {
    v8 = sqlite3_step(a3);
    if (v8 == 9)
      goto LABEL_20;
    if (v8 == 101)
      return 1;
    if (v8 == 100)
      break;
    v9 = v8;
    if (v8 - 5 >= 2)
    {
      if (v8 == 19)
      {
        logHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v12 = sqlite3_sql(a3);
          v13 = sqlite3_db_handle(a3);
          v14 = sqlite3_errmsg(v13);
          +[PPSSQLiteDatabase _stepStatement:hasRow:error:].cold.2((uint64_t)v14, (uint8_t *)&v17, (uint64_t)v12, v10);
        }
      }
      else if (v8 == 11)
      {
        logHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          +[PPSSQLiteDatabase _stepStatement:hasRow:error:].cold.1(v10);
      }
      else
      {
        logHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v15 = sqlite3_sql(a3);
          v16 = sqlite3_db_handle(a3);
          v17 = 136315650;
          v18 = v15;
          v19 = 1024;
          v20 = v9;
          v21 = 2080;
          v22 = sqlite3_errmsg(v16);
          _os_log_debug_impl(&dword_2439D9000, v10, OS_LOG_TYPE_DEBUG, "Step failed: %s: [%d, %s]", (uint8_t *)&v17, 0x1Cu);
        }
      }

LABEL_20:
      if (!a5)
        return 0;
      sqlite3_db_handle(a3);
      result = 0;
      *a5 = 0;
      return result;
    }
  }
  result = 1;
  if (a4)
    *a4 = 1;
  return result;
}

- (sqlite3_stmt)_statementForSQL:(id)a3 shouldCache:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  __CFDictionary *v9;
  sqlite3_stmt *Value;
  void *v11;
  uint64_t v12;
  sqlite3 *db;
  id v14;
  int v15;
  int v16;
  void *v17;
  NSObject *v18;
  __CFDictionary *statementCache;
  sqlite3_stmt *ppStmt;
  _BYTE pzTail[12];
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  ppStmt = 0;
  if (!v6
    || (v9 = self->_statementCache) == 0
    || (Value = (sqlite3_stmt *)CFDictionaryGetValue(v9, v8), (ppStmt = Value) == 0))
  {
    v11 = (void *)MEMORY[0x2494FEED8]();
    v12 = *MEMORY[0x24BDBCAB0];
    do
    {
      *(_QWORD *)pzTail = 0;
      db = self->_db;
      v14 = objc_retainAutorelease(v8);
      v15 = sqlite3_prepare_v2(db, (const char *)objc_msgSend(v14, "UTF8String"), objc_msgSend(v14, "length"), &ppStmt, (const char **)pzTail);
      v16 = v15;
      if (!v15 && *(_QWORD *)pzTail)
      {
        if (**(_BYTE **)pzTail)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v12, CFSTR("SQL strings must contain only a single statement; remaining statements will not be executed: %s"),
            *(_QWORD *)pzTail);
        goto LABEL_14;
      }
    }
    while ((v15 - 5) < 2);
    if (v15)
    {
      lastErrorForDatabase(self->_db, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      logHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)pzTail = 138412802;
        *(_QWORD *)&pzTail[4] = v14;
        v23 = 1024;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        _os_log_debug_impl(&dword_2439D9000, v18, OS_LOG_TYPE_DEBUG, "Could not prepare statement: %@: [%d, %@]", pzTail, 0x1Cu);
      }

      goto LABEL_20;
    }
LABEL_14:
    if (v6)
    {
      statementCache = self->_statementCache;
      if (!statementCache)
      {
        statementCache = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], &kSqlite3StatementDictionaryValueCallbacks);
        self->_statementCache = statementCache;
      }
      if (ppStmt)
        CFDictionarySetValue(statementCache, v14, ppStmt);
    }
    v17 = 0;
LABEL_20:
    objc_autoreleasePoolPop(v11);
    if (a5)
      *a5 = objc_retainAutorelease(v17);

    Value = ppStmt;
  }

  return Value;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

+ (void)_stepStatement:(os_log_t)log hasRow:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2439D9000, log, OS_LOG_TYPE_ERROR, "Corrupted database.", v1, 2u);
}

+ (void)_stepStatement:(uint64_t)a3 hasRow:(os_log_t)log error:.cold.2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 19;
  *((_WORD *)buf + 9) = 2082;
  *(_QWORD *)(buf + 20) = a1;
  _os_log_debug_impl(&dword_2439D9000, log, OS_LOG_TYPE_DEBUG, "Constraint violation during statement step: %s [%d, %{public}s]", buf, 0x1Cu);
}

@end
