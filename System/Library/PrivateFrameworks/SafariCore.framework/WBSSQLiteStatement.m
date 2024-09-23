@implementation WBSSQLiteStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_columnNamesToIndexes, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (id)fetch
{
  return -[WBSSQLiteRowEnumerator initWithResultsOfStatement:]([WBSSQLiteRowEnumerator alloc], "initWithResultsOfStatement:", self);
}

- (WBSSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4
{
  return -[WBSSQLiteStatement initWithDatabase:query:error:](self, "initWithDatabase:query:error:", a3, a4, 0);
}

- (void)dealloc
{
  sqlite3_stmt *handle;
  NSObject *v4;
  objc_super v5;
  _QWORD block[5];

  handle = self->_handle;
  if (handle)
  {
    -[WBSSQLiteDatabase queue](self->_database, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__WBSSQLiteStatement_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = handle;
    dispatch_async(v4, block);

  }
  v5.receiver = self;
  v5.super_class = (Class)WBSSQLiteStatement;
  -[WBSSQLiteStatement dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1B2621000, "Could not finalize statement: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (sqlite3_stmt)handle
{
  return self->_handle;
}

- (WBSSQLiteStatement)initWithDatabase:(id)a3 query:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  WBSSQLiteStatement *v11;
  sqlite3_stmt **p_isa;
  sqlite3 *v13;
  id v14;
  uint64_t v15;
  WBSSQLiteStatement *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSSQLiteStatement;
  v11 = -[WBSSQLiteStatement init](&v18, sel_init);
  p_isa = &v11->super.isa;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    v13 = (sqlite3 *)objc_msgSend(v9, "handle");
    v14 = objc_retainAutorelease(v10);
    v15 = sqlite3_prepare_v2(v13, (const char *)objc_msgSend(v14, "UTF8String"), -1, p_isa + 2, 0);
    if (!(_DWORD)v15)
    {
      v16 = p_isa;
      goto LABEL_6;
    }
    objc_msgSend(v9, "reportErrorWithCode:query:error:", v15, v14, a5);
  }
  v16 = 0;
LABEL_6:

  return v16;
}

uint64_t __29__WBSSQLiteStatement_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

- (void)reset
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1B2621000, "Could not reset statement: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (int)execute
{
  uint64_t v3;
  int v4;

  temporarilyDisableSuddenTermination();
  v3 = sqlite3_step(self->_handle);
  v4 = v3;
  if ((v3 - 100) >= 2 && (_DWORD)v3 != 0)
    -[WBSSQLiteDatabase reportErrorWithCode:statement:error:](self->_database, "reportErrorWithCode:statement:error:", v3, self->_handle, 0);
  return v4;
}

- (void)bindDouble:(double)a3 atParameterIndex:(unint64_t)a4
{
  NSObject *v5;

  if (sqlite3_bind_double(self->_handle, a4, a3))
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindDouble:atParameterIndex:].cold.1();
    }

  }
}

- (void)bindString:(id)a3 atParameterIndex:(unint64_t)a4
{
  int v4;
  id v6;
  sqlite3_stmt *handle;
  id v8;
  NSObject *v9;

  v4 = a4;
  v6 = a3;
  handle = self->_handle;
  v8 = objc_retainAutorelease(v6);
  if (sqlite3_bind_text(handle, v4, (const char *)objc_msgSend(v8, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindString:atParameterIndex:].cold.1();
    }

  }
}

- (void)bindInt64:(int64_t)a3 atParameterIndex:(unint64_t)a4
{
  NSObject *v5;

  if (sqlite3_bind_int64(self->_handle, a4, a3))
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindInt64:atParameterIndex:].cold.1();
    }

  }
}

- (WBSSQLiteStatement)init
{

  return 0;
}

- (BOOL)execute:(id *)a3
{
  uint64_t v5;

  temporarilyDisableSuddenTermination();
  v5 = sqlite3_step(self->_handle);
  if ((v5 - 100) < 2 || (_DWORD)v5 == 0)
    return 1;
  -[WBSSQLiteDatabase reportErrorWithCode:statement:error:](self->_database, "reportErrorWithCode:statement:error:", v5, self->_handle, a3);
  return 0;
}

- (BOOL)fetchWithEnumerationBlock:(id)a3 error:(id *)a4
{
  void (**v6)(id, WBSSQLiteRow *, _BYTE *);
  WBSSQLiteRow *v7;
  int v8;
  char v10;

  v6 = (void (**)(id, WBSSQLiteRow *, _BYTE *))a3;
  v7 = 0;
  v10 = 0;
  do
  {
    v8 = sqlite3_step(self->_handle);
    if (v8 != 100)
      break;
    if (!v7)
      v7 = -[WBSSQLiteRow initWithStatement:]([WBSSQLiteRow alloc], "initWithStatement:", self);
    v6[2](v6, v7, &v10);
  }
  while (!v10);
  if (a4 && v8 != 101)
  {
    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSSQLiteStatement fetchWithEnumerationBlock:error:]");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 == 101;
}

- (void)bindInt:(int)a3 atParameterIndex:(unint64_t)a4
{
  NSObject *v5;

  if (sqlite3_bind_int(self->_handle, a4, a3))
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindInt:atParameterIndex:].cold.1();
    }

  }
}

- (void)bindData:(id)a3 atParameterIndex:(unint64_t)a4
{
  int v4;
  id v6;
  sqlite3_stmt *handle;
  id v8;
  NSObject *v9;

  v4 = a4;
  v6 = a3;
  handle = self->_handle;
  v8 = objc_retainAutorelease(v6);
  if (sqlite3_bind_blob(handle, v4, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindData:atParameterIndex:].cold.1();
    }

  }
}

- (void)bindNullAtParameterIndex:(unint64_t)a3
{
  NSObject *v4;

  if (sqlite3_bind_null(self->_handle, a3))
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStatement bindNullAtParameterIndex:].cold.1();
    }

  }
}

- (NSDictionary)columnNamesToIndexes
{
  NSDictionary *columnNamesToIndexes;
  NSDictionary *v3;
  int v5;
  NSDictionary *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *v12;

  columnNamesToIndexes = self->_columnNamesToIndexes;
  if (columnNamesToIndexes)
  {
    v3 = columnNamesToIndexes;
  }
  else
  {
    v5 = sqlite3_column_count(self->_handle);
    v6 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
    if (v5 >= 1)
    {
      v7 = 0;
      do
      {
        v8 = sqlite3_column_name(self->_handle, v7);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, v10);

        v7 = (v7 + 1);
      }
      while (v5 != (_DWORD)v7);
    }
    v11 = self->_columnNamesToIndexes;
    self->_columnNamesToIndexes = v6;
    v12 = v6;

    v3 = self->_columnNamesToIndexes;
  }
  return v3;
}

- (NSArray)columnNames
{
  NSArray *columnNames;
  NSArray *v3;
  int v5;
  NSArray *v6;
  int i;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  columnNames = self->_columnNames;
  if (columnNames)
  {
    v3 = columnNames;
  }
  else
  {
    v5 = sqlite3_column_count(self->_handle);
    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_name(self->_handle, i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v6, "addObject:", v8);

      }
    }
    v9 = self->_columnNames;
    self->_columnNames = v6;
    v10 = v6;

    v3 = self->_columnNames;
  }
  return v3;
}

- (BOOL)_isValid
{
  return self->_handle != 0;
}

- (WBSSQLiteDatabase)database
{
  return self->_database;
}

- (void)bindString:atParameterIndex:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1B2621000, "Could not bind string: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (void)bindInt:atParameterIndex:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1B2621000, "Could not bind int: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (void)bindInt64:atParameterIndex:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1B2621000, "Could not bind integer: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (void)bindDouble:atParameterIndex:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1B2621000, "Could not bind double: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (void)bindData:atParameterIndex:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1B2621000, "Could not bind blob: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (void)bindNullAtParameterIndex:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_10(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1B2621000, "Could not bind null: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

@end
