@implementation SSAppPurchaseHistoryDatabase

- (SSAppPurchaseHistoryDatabase)init
{
  return -[SSAppPurchaseHistoryDatabase initWithDatabaseURL:readOnly:](self, "initWithDatabaseURL:readOnly:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", +[SSAppPurchaseHistoryDatabaseSchema databasePath](SSAppPurchaseHistoryDatabaseSchema, "databasePath"), 0), 1);
}

- (SSAppPurchaseHistoryDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  SSAppPurchaseHistoryDatabase *v6;
  SSSQLiteDatabase *v7;
  SSSQLiteDatabase *v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SSAppPurchaseHistoryDatabase;
  v6 = -[SSAppPurchaseHistoryDatabase init](&v10, sel_init);
  if (v6)
  {
    +[SSAppPurchaseHistoryDatabase _createDatabaseDirectory](SSAppPurchaseHistoryDatabase, "_createDatabaseDirectory");
    v7 = [SSSQLiteDatabase alloc];
    v8 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:](v7, "initWithDatabaseURL:readOnly:protectionType:", a3, v4, *MEMORY[0x1E0CB2AC0]);
    v6->_database = v8;
    if (!v4)
      -[SSSQLiteDatabase setSetupBlock:](v8, "setSetupBlock:", &__block_literal_global_34);
  }
  return v6;
}

BOOL __61__SSAppPurchaseHistoryDatabase_initWithDatabaseURL_readOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SSAppPurchaseHistoryDatabase _setupDatabase:](SSAppPurchaseHistoryDatabase, "_setupDatabase:", a2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSAppPurchaseHistoryDatabase;
  -[SSAppPurchaseHistoryDatabase dealloc](&v3, sel_dealloc);
}

+ (id)newDefaultInstance
{
  return -[SSAppPurchaseHistoryDatabase initWithDatabaseURL:readOnly:]([SSAppPurchaseHistoryDatabase alloc], "initWithDatabaseURL:readOnly:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", +[SSAppPurchaseHistoryDatabaseSchema databasePath](SSAppPurchaseHistoryDatabaseSchema, "databasePath"), 0), 0);
}

- (void)modifyUsingAppPurchaseHistoryTransactionBlock:(id)a3
{
  SSSQLiteDatabase *database;
  _QWORD v4[6];

  database = self->_database;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__SSAppPurchaseHistoryDatabase_modifyUsingAppPurchaseHistoryTransactionBlock___block_invoke;
  v4[3] = &unk_1E47BE8C8;
  v4[4] = self;
  v4[5] = a3;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v4);
}

uint64_t __78__SSAppPurchaseHistoryDatabase_modifyUsingAppPurchaseHistoryTransactionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  SSAppPurchaseHistoryTransaction *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1A8585BF8]();
  v3 = -[SSAppPurchaseHistoryTransaction initWithDatabase:]([SSAppPurchaseHistoryTransaction alloc], "initWithDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (void)readAsyncUsingTransactionBlock:(id)a3
{
  SSSQLiteDatabase *database;
  _QWORD v4[6];

  database = self->_database;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SSAppPurchaseHistoryDatabase_readAsyncUsingTransactionBlock___block_invoke;
  v4[3] = &unk_1E47BBC58;
  v4[4] = self;
  v4[5] = a3;
  -[SSSQLiteDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v4);
}

uint64_t __63__SSAppPurchaseHistoryDatabase_readAsyncUsingTransactionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "readUsingTransactionBlock:", *(_QWORD *)(a1 + 40));
}

- (void)readUsingTransactionBlock:(id)a3
{
  SSSQLiteDatabase *database;
  _QWORD v4[6];

  database = self->_database;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SSAppPurchaseHistoryDatabase_readUsingTransactionBlock___block_invoke;
  v4[3] = &unk_1E47BE8C8;
  v4[4] = self;
  v4[5] = a3;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v4);
}

uint64_t __58__SSAppPurchaseHistoryDatabase_readUsingTransactionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  SSAppPurchaseHistoryTransaction *v3;

  v2 = (void *)MEMORY[0x1A8585BF8]();
  v3 = -[SSAppPurchaseHistoryTransaction initWithDatabase:]([SSAppPurchaseHistoryTransaction alloc], "initWithDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v2);
  return 1;
}

- (id)currentAccountUniqueIdentifier
{
  id result;

  result = -[SSAppPurchaseHistoryDatabase valueForDatabaseProperty:](self, "valueForDatabaseProperty:", +[SSAppPurchaseHistoryDatabase accountUniqueIdentifierKey](SSAppPurchaseHistoryDatabase, "accountUniqueIdentifierKey"));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(result, "longLongValue"));
  return result;
}

- (BOOL)setCurrentAccountUniqueIdentifier:(id)a3
{
  if (a3)
    -[SSAppPurchaseHistoryDatabase setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", objc_msgSend(a3, "stringValue"), +[SSAppPurchaseHistoryDatabase accountUniqueIdentifierKey](SSAppPurchaseHistoryDatabase, "accountUniqueIdentifierKey"));
  else
    -[SSAppPurchaseHistoryDatabase removeValueForDatabaseProperty:](self, "removeValueForDatabaseProperty:", +[SSAppPurchaseHistoryDatabase accountUniqueIdentifierKey](SSAppPurchaseHistoryDatabase, "accountUniqueIdentifierKey"));
  return 1;
}

- (int64_t)localRevisionForAccountUniqueIdentifier:(id)a3
{
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__SSAppPurchaseHistoryDatabase_localRevisionForAccountUniqueIdentifier___block_invoke;
  v5[3] = &unk_1E47BFAE0;
  v5[4] = a3;
  v5[5] = &v6;
  -[SSAppPurchaseHistoryDatabase readUsingTransactionBlock:](self, "readUsingTransactionBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__SSAppPurchaseHistoryDatabase_localRevisionForAccountUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("local_revision");
  v3 = +[SSSQLiteEntity queryWithDatabase:predicate:](SSAppPurchaseHistoryAccount, "queryWithDatabase:predicate:", objc_msgSend(a2, "database"), +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("account_unique_identifier"), *(_QWORD *)(a1 + 32)));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__SSAppPurchaseHistoryDatabase_localRevisionForAccountUniqueIdentifier___block_invoke_2;
  v5[3] = &unk_1E47BE8F0;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumeratePersistentIDsAndProperties:count:usingBlock:", v6, 1, v5);
  return 1;
}

void *__72__SSAppPurchaseHistoryDatabase_localRevisionForAccountUniqueIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void **a3, uint64_t a4, _BYTE *a5)
{
  void *result;

  result = *a3;
  if (*a3)
  {
    result = (void *)objc_msgSend(result, "integerValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  *a5 = 1;
  return result;
}

- (BOOL)setLocalRevision:(int64_t)a3 forAccountUniqueIdentifier:(id)a4
{
  char v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__SSAppPurchaseHistoryDatabase_setLocalRevision_forAccountUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E47BFB08;
  v6[6] = &v7;
  v6[7] = a3;
  v6[4] = a4;
  v6[5] = self;
  -[SSAppPurchaseHistoryDatabase modifyUsingAppPurchaseHistoryTransactionBlock:](self, "modifyUsingAppPurchaseHistoryTransactionBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

BOOL __76__SSAppPurchaseHistoryDatabase_setLocalRevision_forAccountUniqueIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  SSAppPurchaseHistoryAccount *v4;
  SSAppPurchaseHistoryAccount *v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v20;
  int v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = [SSAppPurchaseHistoryAccount alloc];
  v24[0] = a1[4];
  v23[0] = CFSTR("ROWID");
  v23[1] = CFSTR("local_revision");
  v24[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  v5 = -[SSSQLiteEntity initWithPropertyValues:inDatabase:](v4, "initWithPropertyValues:inDatabase:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2), objc_msgSend(a2, "database"));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5 != 0;

  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return 0;
  v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v6)
    v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_INFO))
    v8 &= 2u;
  if (v8)
  {
    v21 = 138412290;
    v22 = objc_opt_class();
    LODWORD(v20) = 12;
    v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v21, v20);
      free(v10);
      SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SSAppPurchaseHistoryDatabaseLocalRevisionDidChange"), 0, 0, 1u);
  return *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
}

- (BOOL)resetCacheForNewAccountID:(id)a3
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  BOOL v18;
  uint64_t v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__SSAppPurchaseHistoryDatabase_resetCacheForNewAccountID___block_invoke;
  v21[3] = &unk_1E47BFB30;
  v21[5] = self;
  v21[6] = &v22;
  v21[4] = a3;
  -[SSAppPurchaseHistoryDatabase modifyUsingAppPurchaseHistoryTransactionBlock:](self, "modifyUsingAppPurchaseHistoryTransactionBlock:", v21);
  if (*((_BYTE *)v23 + 24))
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    v5 = objc_msgSend(v3, "shouldLogToDisk");
    v6 = objc_msgSend(v3, "OSLogObject");
    if (v5)
      v4 |= 2u;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      v4 &= 2u;
    if (v4)
    {
      v7 = objc_opt_class();
      v26 = 138412290;
      v27 = v7;
      LODWORD(v20) = 12;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v26, v20);
        free(v9);
        SSFileLog(v3, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SSAppPurchaseHistoryDatabaseLocalRevisionDidChange"), 0, 0, 1u);
    v18 = *((_BYTE *)v23 + 24) != 0;
  }
  else
  {
    v18 = 0;
  }
  _Block_object_dispose(&v22, 8);
  return v18;
}

BOOL __58__SSAppPurchaseHistoryDatabase_resetCacheForNewAccountID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@"), +[SSAppPurchaseHistoryEntry databaseTable](SSAppPurchaseHistoryEntry, "databaseTable"));
  if (objc_msgSend(*(id *)(a1 + 32), "longLongValue"))
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ != '%@'"), +[SSAppPurchaseHistoryEntry databaseTable](SSAppPurchaseHistoryEntry, "databaseTable"), CFSTR("account_unique_identifier"), *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(a2, "database"), "executeSQL:", v4);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "removeValueForDatabaseProperty:", objc_msgSend((id)objc_opt_class(), "accountUniqueIdentifierKey"));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return 0;
  if (objc_msgSend(*(id *)(a1 + 32), "longLongValue"))
    +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](SSSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", CFSTR("account_unique_identifier"), *(_QWORD *)(a1 + 32), 2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(+[SSSQLiteEntity queryWithDatabase:predicate:](SSAppPurchaseHistoryAccount, "queryWithDatabase:predicate:", objc_msgSend(a2, "database"), 0), "deleteAllEntities");
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
}

- (id)valueForDatabaseProperty:(id)a3
{
  id v3;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__68;
  v10 = __Block_byref_object_dispose__68;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SSAppPurchaseHistoryDatabase_valueForDatabaseProperty___block_invoke;
  v5[3] = &unk_1E47BFB80;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = &v6;
  v5[7] = a2;
  -[SSAppPurchaseHistoryDatabase readUsingTransactionBlock:](self, "readUsingTransactionBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SSAppPurchaseHistoryDatabase_valueForDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __int128 v4;
  _QWORD v6[4];
  __int128 v7;
  void *v8;
  __int128 v9;

  v3 = (void *)objc_msgSend(a2, "database");
  v6[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __57__SSAppPurchaseHistoryDatabase_valueForDatabaseProperty___block_invoke_2;
  v6[3] = &unk_1E47BFB58;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v3, "prepareStatementForSQL:cache:usingBlock:", CFSTR("SELECT value FROM db_properties WHERE key = ?"), 1, v6);
  return 1;
}

uint64_t __57__SSAppPurchaseHistoryDatabase_valueForDatabaseProperty___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  char isKindOfClass;
  void *v5;
  const char *v6;
  double v7;
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"), -1, 0);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      v6 = (const char *)objc_msgSend(v5, "objCType");
      if (!strcmp(v6, "d") || !strcmp(v6, "f"))
      {
        objc_msgSend(*(id *)(a1 + 32), "doubleValue");
        sqlite3_bind_double(a2, 1, v7);
      }
      else
      {
        sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
      }
    }
    else
    {
      NSLog(CFSTR("[%s:%d] Unsupported predicate value: %@"), "/Library/Caches/com.apple.xbs/Sources/StoreServices/StoreServices/SSAppPurchaseHistoryDatabase.m", 194, v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("SSAppPurchaseHistoryDatabase.m"), 194, CFSTR("Unsupported predicate value: %@"), *(_QWORD *)(a1 + 32));
    }
  }
  result = objc_msgSend(*(id *)(a1 + 48), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result)
  {
    result = SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4
{
  char v4;
  _QWORD v6[9];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SSAppPurchaseHistoryDatabase_setValue_forDatabaseProperty___block_invoke;
  v6[3] = &unk_1E47BFBA8;
  v6[7] = &v7;
  v6[8] = a2;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = a4;
  -[SSAppPurchaseHistoryDatabase modifyUsingAppPurchaseHistoryTransactionBlock:](self, "modifyUsingAppPurchaseHistoryTransactionBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __61__SSAppPurchaseHistoryDatabase_setValue_forDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __int128 v4;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v3 = (void *)objc_msgSend(a2, "database");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SSAppPurchaseHistoryDatabase_setValue_forDatabaseProperty___block_invoke_2;
  v6[3] = &unk_1E47BFB58;
  v9 = *(_QWORD *)(a1 + 64);
  v4 = *(_OWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  v8 = v4;
  objc_msgSend(v3, "prepareStatementForSQL:cache:usingBlock:", CFSTR("INSERT OR REPLACE INTO db_properties (value, key) VALUES (?, ?);"),
    1,
    v6);
  return 1;
}

uint64_t __61__SSAppPurchaseHistoryDatabase_setValue_forDatabaseProperty___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  char isKindOfClass;
  void *v5;
  const char *v6;
  double v7;
  char v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"), -1, 0);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      v6 = (const char *)objc_msgSend(v5, "objCType");
      if (!strcmp(v6, "d") || !strcmp(v6, "f"))
      {
        objc_msgSend(*(id *)(a1 + 32), "doubleValue");
        sqlite3_bind_double(a2, 1, v7);
      }
      else
      {
        sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
      }
    }
    else
    {
      NSLog(CFSTR("[%s:%d] Unsupported predicate value: %@"), "/Library/Caches/com.apple.xbs/Sources/StoreServices/StoreServices/SSAppPurchaseHistoryDatabase.m", 210, v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("SSAppPurchaseHistoryDatabase.m"), 210, CFSTR("Unsupported predicate value: %@"), *(_QWORD *)(a1 + 32));
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(*(id *)(a1 + 48), "UTF8String"), -1, 0);
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();
    v9 = *(void **)(a1 + 48);
    if ((v8 & 1) != 0)
    {
      v10 = (const char *)objc_msgSend(v9, "objCType");
      if (!strcmp(v10, "d") || !strcmp(v10, "f"))
      {
        objc_msgSend(*(id *)(a1 + 48), "doubleValue");
        sqlite3_bind_double(a2, 2, v11);
      }
      else
      {
        sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 48), "longLongValue"));
      }
    }
    else
    {
      NSLog(CFSTR("[%s:%d] Unsupported predicate value: %@"), "/Library/Caches/com.apple.xbs/Sources/StoreServices/StoreServices/SSAppPurchaseHistoryDatabase.m", 211, v9);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("SSAppPurchaseHistoryDatabase.m"), 211, CFSTR("Unsupported predicate value: %@"), *(_QWORD *)(a1 + 48));
    }
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)removeValueForDatabaseProperty:(id)a3
{
  char v3;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SSAppPurchaseHistoryDatabase_removeValueForDatabaseProperty___block_invoke;
  v5[3] = &unk_1E47BFB80;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = &v6;
  v5[7] = a2;
  -[SSAppPurchaseHistoryDatabase modifyUsingAppPurchaseHistoryTransactionBlock:](self, "modifyUsingAppPurchaseHistoryTransactionBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__SSAppPurchaseHistoryDatabase_removeValueForDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __int128 v4;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;

  v3 = (void *)objc_msgSend(a2, "database");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SSAppPurchaseHistoryDatabase_removeValueForDatabaseProperty___block_invoke_2;
  v6[3] = &unk_1E47BFBD0;
  v4 = *(_OWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  v8 = v4;
  objc_msgSend(v3, "prepareStatementForSQL:cache:usingBlock:", CFSTR("DELETE FROM db_properties WHERE key = ?;"),
    1,
    v6);
  return 1;
}

uint64_t __63__SSAppPurchaseHistoryDatabase_removeValueForDatabaseProperty___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  char isKindOfClass;
  void *v5;
  const char *v6;
  double v7;
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sqlite3_bind_text(a2, 1, (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"), -1, 0);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      v6 = (const char *)objc_msgSend(v5, "objCType");
      if (!strcmp(v6, "d") || !strcmp(v6, "f"))
      {
        objc_msgSend(*(id *)(a1 + 32), "doubleValue");
        sqlite3_bind_double(a2, 1, v7);
      }
      else
      {
        sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
      }
    }
    else
    {
      NSLog(CFSTR("[%s:%d] Unsupported predicate value: %@"), "/Library/Caches/com.apple.xbs/Sources/StoreServices/StoreServices/SSAppPurchaseHistoryDatabase.m", 225, v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("SSAppPurchaseHistoryDatabase.m"), 225, CFSTR("Unsupported predicate value: %@"), *(_QWORD *)(a1 + 32));
    }
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)allProperties:(id)a3 accountID:(id)a4 includingHidden:(BOOL)a5
{
  void *v9;
  _QWORD v11[7];
  BOOL v12;

  if (!a4 || !objc_msgSend(a3, "count"))
    return 0;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__SSAppPurchaseHistoryDatabase_allProperties_accountID_includingHidden___block_invoke;
  v11[3] = &unk_1E47BFC20;
  v12 = a5;
  v11[4] = a4;
  v11[5] = a3;
  v11[6] = v9;
  -[SSAppPurchaseHistoryDatabase readUsingTransactionBlock:](self, "readUsingTransactionBlock:", v11);
  return v9;
}

uint64_t __72__SSAppPurchaseHistoryDatabase_allProperties_accountID_includingHidden___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  SSSQLiteQueryDescriptor *v7;
  SSSQLiteQuery *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _QWORD v13[7];
  _OWORD v14[5];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "database");
  v4 = +[SSAppPurchaseHistoryEntry predicateForAccountIdentifier:](SSAppPurchaseHistoryEntry, "predicateForAccountIdentifier:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 56))
    v5 = 0;
  else
    v5 = +[SSAppPurchaseHistoryEntry predicateForNotHidden](SSAppPurchaseHistoryEntry, "predicateForNotHidden");
  v6 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v5, 0));
  v7 = objc_alloc_init(SSSQLiteQueryDescriptor);
  -[SSSQLiteQueryDescriptor setEntityClass:](v7, "setEntityClass:", objc_opt_class());
  -[SSSQLiteQueryDescriptor setPredicate:](v7, "setPredicate:", v6);
  -[SSSQLiteQueryDescriptor setOrderingProperties:](v7, "setOrderingProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("date_purchased")));
  -[SSSQLiteQueryDescriptor setOrderingDirections:](v7, "setOrderingDirections:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("DESC")));
  v8 = -[SSSQLiteQuery initWithDatabase:descriptor:]([SSSQLiteQuery alloc], "initWithDatabase:descriptor:", v3, v7);
  memset(v14, 0, sizeof(v14));
  v9 = objc_msgSend(*(id *)(a1 + 40), "count");
  v10 = v9;
  v11 = v14;
  if (v9 >= 11)
    v11 = malloc_type_malloc(8 * v9, 0x80040B8603338uLL);
  objc_msgSend(*(id *)(a1 + 40), "getObjects:range:", v11, 0, v10);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SSAppPurchaseHistoryDatabase_allProperties_accountID_includingHidden___block_invoke_2;
  v13[3] = &unk_1E47BFBF8;
  v13[5] = v10;
  v13[6] = v11;
  v13[4] = *(_QWORD *)(a1 + 48);
  -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:](v8, "enumeratePersistentIDsAndProperties:count:usingBlock:", v11, v10, v13);
  if (v11 != v14)
    free(v11);

  return 1;
}

void __72__SSAppPurchaseHistoryDatabase_allProperties_accountID_includingHidden___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;

  v5 = (void *)MEMORY[0x1A8585BF8]();
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 >= 1)
  {
    for (i = 0; i < v7; ++i)
    {
      v9 = *(_QWORD *)(a3 + 8 * i);
      if (v9)
      {
        objc_msgSend(v6, "setObject:forKey:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * i));
        v7 = *(_QWORD *)(a1 + 40);
      }
    }
  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  objc_autoreleasePoolPop(v5);
}

- (id)database
{
  return self->_database;
}

+ (id)accountUniqueIdentifierKey
{
  return (id)objc_msgSend(+[SSAppPurchaseHistoryEntry databaseTable](SSAppPurchaseHistoryEntry, "databaseTable"), "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("account_unique_identifier"));
}

+ (void)_createDatabaseDirectory
{
  id v2;
  _QWORD block[5];

  v2 = +[SSAppPurchaseHistoryDatabaseSchema databasePath](SSAppPurchaseHistoryDatabaseSchema, "databasePath");
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SSAppPurchaseHistoryDatabase__createDatabaseDirectory__block_invoke;
    block[3] = &unk_1E47B8B68;
    block[4] = v2;
    if (_createDatabaseDirectory_sOnce != -1)
      dispatch_once(&_createDatabaseDirectory_sOnce, block);
  }
}

void __56__SSAppPurchaseHistoryDatabase__createDatabaseDirectory__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1A8585BF8]();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(*(id *)(a1 + 32), "stringByDeletingLastPathComponent"), 1, 0, 0);

  objc_autoreleasePoolPop(v2);
}

+ (BOOL)_setupDatabase:(id)a3
{
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
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSAppPurchaseHistoryDatabase__setupDatabase___block_invoke;
  v5[3] = &unk_1E47BEA78;
  v5[4] = a3;
  v5[5] = &v6;
  objc_msgSend(a3, "performTransactionWithBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSAppPurchaseHistoryDatabase__setupDatabase___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[SSAppPurchaseHistoryDatabaseSchema createSchemaInDatabase:](SSAppPurchaseHistoryDatabaseSchema, "createSchemaInDatabase:", *(_QWORD *)(a1 + 32));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

@end
