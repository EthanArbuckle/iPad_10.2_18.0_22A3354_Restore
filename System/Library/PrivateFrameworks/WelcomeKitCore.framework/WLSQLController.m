@implementation WLSQLController

- (WLSQLController)init
{
  WLSQLController *v2;
  void *v3;
  void *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *databaseQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WLSQLController;
  v2 = -[WLSQLController init](&v8, sel_init);
  if (v2)
  {
    NSHomeDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("/Library/WelcomeKit/migration.db"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLSQLController setDatabasePath:](v2, "setDatabasePath:", v4);

    v5 = dispatch_queue_create("com.apple.welcomekit.WLSQLController.databaseQueue", 0);
    databaseQueue = v2->_databaseQueue;
    v2->_databaseQueue = (OS_dispatch_queue *)v5;

    -[WLSQLController _openDatabase](v2, "_openDatabase");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[WLSQLController closeDatabase](self, "closeDatabase");
  v3.receiver = self;
  v3.super_class = (Class)WLSQLController;
  -[WLSQLController dealloc](&v3, sel_dealloc);
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)deleteMetadataForAllDevices
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WLSQLController_deleteMetadataForAllDevices__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __46__WLSQLController_deleteMetadataForAllDevices__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM metadata", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)deleteAccountsAndSummariesForAllDevices
{
  -[WLSQLController _deleteSummaries](self, "_deleteSummaries");
  -[WLSQLController _deleteAccounts](self, "_deleteAccounts");
}

- (void)deleteMigratableAppsForAllDevices
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WLSQLController_deleteMigratableAppsForAllDevices__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __52__WLSQLController_deleteMigratableAppsForAllDevices__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM migratableApps", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)deleteSuggestedAppBundleIDsForAllDevices
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__WLSQLController_deleteSuggestedAppBundleIDsForAllDevices__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __59__WLSQLController_deleteSuggestedAppBundleIDsForAllDevices__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM bundleIDs", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)_deleteSummaries
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WLSQLController__deleteSummaries__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __35__WLSQLController__deleteSummaries__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM summaries", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)_deleteAccounts
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WLSQLController__deleteAccounts__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __34__WLSQLController__deleteAccounts__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM accounts", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)deleteSummaryDataForAllDevices
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WLSQLController_deleteSummaryDataForAllDevices__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __49__WLSQLController_deleteSummaryDataForAllDevices__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "UPDATE summaries SET data=NULL", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (unint64_t)insertAccount:(id)a3 migrator:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -1;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WLSQLController_insertAccount_migrator_device___block_invoke;
  block[3] = &unk_24E375E10;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = &v22;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(databaseQueue, block);
  v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

uint64_t __49__WLSQLController_insertAccount_migrator_device___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v3;
  id v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "INSERT INTO accounts (identifier, migrator, device) VALUES (?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    v3 = ppStmt;
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v3, 1, (const char *)objc_msgSend(v4, "UTF8String"), -1, 0);

    v5 = ppStmt;
    objc_msgSend(*(id *)(a1 + 48), "contentType");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v5, 2, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0);

    objc_msgSend(*(id *)(a1 + 56), "persistentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length"))
      __49__WLSQLController_insertAccount_migrator_device___block_invoke_cold_1();

    v8 = ppStmt;
    objc_msgSend(*(id *)(a1 + 56), "persistentIdentifier");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v8, 3, (const char *)objc_msgSend(v9, "UTF8String"), -1, 0);

    if (sqlite3_step(ppStmt) == 101)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    }
    else
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)accountsForMigrator:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  WLSQLController *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  databaseQueue = self->_databaseQueue;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __46__WLSQLController_accountsForMigrator_device___block_invoke;
  v16 = &unk_24E375E38;
  v17 = self;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  v20 = &v21;
  dispatch_sync(databaseQueue, &v13);
  v11 = (void *)objc_msgSend((id)v22[5], "copy", v13, v14, v15, v16, v17);

  _Block_object_dispose(&v21, 8);
  return v11;
}

uint64_t __46__WLSQLController_accountsForMigrator_device___block_invoke(uint64_t a1)
{
  void *v3;
  sqlite3_stmt *v4;
  id v5;
  sqlite3_stmt *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WLSourceDeviceAccount *v11;
  const unsigned __int8 *v12;
  void *v13;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "SELECT id, identifier FROM accounts WHERE device=? AND migrator=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length"))
      __46__WLSQLController_accountsForMigrator_device___block_invoke_cold_1();

    v4 = ppStmt;
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v4, 1, (const char *)objc_msgSend(v5, "UTF8String"), -1, 0);

    v6 = ppStmt;
    objc_msgSend(*(id *)(a1 + 48), "contentType");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v6, 2, (const char *)objc_msgSend(v7, "UTF8String"), -1, 0);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    while (sqlite3_step(ppStmt) == 100)
    {
      v11 = objc_alloc_init(WLSourceDeviceAccount);
      -[WLSourceDeviceAccount setSqlID:](v11, "setSqlID:", sqlite3_column_int64(ppStmt, 0));
      v12 = sqlite3_column_text(ppStmt, 1);
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLSourceDeviceAccount setIdentifier:](v11, "setIdentifier:", v13);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v11);

    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (BOOL)deleteAccountsAndSummariesForMigrator:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  databaseQueue = self->_databaseQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke;
  v12[3] = &unk_24E375E38;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = &v16;
  v9 = v6;
  v10 = v7;
  dispatch_sync(databaseQueue, v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

uint64_t __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke(uint64_t a1)
{
  void *v2;
  sqlite3_stmt *v3;
  id v4;
  sqlite3_stmt *v5;
  id v6;
  uint64_t result;
  void *v8;
  sqlite3_stmt *v9;
  id v10;
  sqlite3_stmt *v11;
  id v12;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM summaries WHERE accountID IN (SELECT id FROM accounts WHERE device=? AND migrator=?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    _WLLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "length"))
      __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke_cold_1();

    v3 = ppStmt;
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v3, 1, (const char *)objc_msgSend(v4, "UTF8String"), -1, 0);

    v5 = ppStmt;
    objc_msgSend(*(id *)(a1 + 48), "contentType");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v5, 2, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0);

    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    sqlite3_finalize(ppStmt);
  }
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM accounts WHERE device=? AND migrator=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    result = _WLLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
      __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke_cold_2();

    v9 = ppStmt;
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v9, 1, (const char *)objc_msgSend(v10, "UTF8String"), -1, 0);

    v11 = ppStmt;
    objc_msgSend(*(id *)(a1 + 48), "contentType");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v11, 2, (const char *)objc_msgSend(v12, "UTF8String"), -1, 0);

    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
    return sqlite3_finalize(ppStmt);
  }
  return result;
}

- (unint64_t)insertRecordSummary:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__WLSQLController_insertRecordSummary_account___block_invoke;
  v13[3] = &unk_24E375E38;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(databaseQueue, v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __47__WLSQLController_insertRecordSummary_account___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v3;
  id v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  sqlite3_stmt *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  sqlite3_stmt *v17;
  id v18;
  void *v19;
  sqlite3_stmt *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "INSERT INTO summaries (accountID, identifier, itemSize, relativePath, modifiedDate, storeDataAsFile, dataFilePath, downloadSegmentCount, metadata, bucket) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, objc_msgSend(*(id *)(a1 + 40), "sqlID"));
    v3 = ppStmt;
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v3, 2, (const char *)objc_msgSend(v4, "UTF8String"), -1, 0);

    sqlite3_bind_int64(ppStmt, 3, objc_msgSend(*(id *)(a1 + 48), "itemSize"));
    v5 = ppStmt;
    objc_msgSend(*(id *)(a1 + 48), "relativePath");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v5, 4, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "modifiedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sqlite3_bind_NSDate:forStatement:position:", v8, ppStmt, 5);

    sqlite3_bind_int(ppStmt, 6, objc_msgSend(*(id *)(a1 + 48), "storeDataAsFile"));
    objc_msgSend(*(id *)(a1 + 48), "dataFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = ppStmt;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 48), "dataFilePath");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v10, 7, (const char *)objc_msgSend(v11, "UTF8String"), -1, 0);

    }
    else
    {
      sqlite3_bind_null(ppStmt, 7);
    }
    sqlite3_bind_int64(ppStmt, 8, objc_msgSend(*(id *)(a1 + 48), "downloadSegmentCount"));
    objc_msgSend(*(id *)(a1 + 48), "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD1608];
      objc_msgSend(*(id *)(a1 + 48), "metadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v13, "dataWithJSONObject:options:error:", v14, 0, &v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v25;

      if (v15)
      {
        v17 = ppStmt;
        v18 = objc_retainAutorelease(v15);
        sqlite3_bind_blob(v17, 9, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        v23 = *(_QWORD *)(a1 + 48);
        v24 = v16;
        v22 = *(_QWORD *)(a1 + 32);
        _WLLog();
        sqlite3_bind_null(ppStmt, 9);
      }

    }
    else
    {
      sqlite3_bind_null(ppStmt, 9);
    }
    objc_msgSend(*(id *)(a1 + 48), "bucket", v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = ppStmt;
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 48), "bucket");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v20, 10, (const char *)objc_msgSend(v21, "UTF8String"), -1, 0);

    }
    else
    {
      sqlite3_bind_null(ppStmt, 10);
    }
    if (sqlite3_step(ppStmt) == 101)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    }
    else
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (unint64_t)totalSummaryDownloadedSegmentCountForAccounts:(id)a3
{
  return -[WLSQLController _totalSummarySegmentCountForAccounts:migrationStateComparisonOperator:migrationState:](self, "_totalSummarySegmentCountForAccounts:migrationStateComparisonOperator:migrationState:", a3, CFSTR(">="), 1);
}

- (unint64_t)_totalSummarySegmentCountForAccounts:(id)a3 migrationStateComparisonOperator:(id)a4 migrationState:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *databaseQueue;
  id v11;
  id v12;
  unint64_t v13;
  _QWORD block[4];
  id v16;
  id v17;
  WLSQLController *v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__WLSQLController__totalSummarySegmentCountForAccounts_migrationStateComparisonOperator_migrationState___block_invoke;
  block[3] = &unk_24E375E60;
  v16 = v8;
  v17 = v9;
  v19 = &v21;
  v20 = a5;
  v18 = self;
  v11 = v9;
  v12 = v8;
  dispatch_sync(databaseQueue, block);
  v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __104__WLSQLController__totalSummarySegmentCountForAccounts_migrationStateComparisonOperator_migrationState___block_invoke(uint64_t a1)
{
  unint64_t v2;
  __CFString *v3;
  const __CFString *v4;
  __CFString *v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  sqlite3_stmt *ppStmt;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = 0;
    v3 = &stru_24E376E00;
    do
    {
      if (-[__CFString length](v3, "length"))
        v4 = CFSTR(", ?");
      else
        v4 = CFSTR("?");
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v2;
      v3 = v5;
    }
    while (v2 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  else
  {
    v5 = &stru_24E376E00;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT sum(downloadSegmentCount) FROM summaries WHERE accountID IN(%@) AND migrationState %@ ?"), v5, *(_QWORD *)(a1 + 40));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 8), v7, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 8));
    _WLLog();
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      v12 = 1;
      do
      {
        v13 = 0;
        v14 = v12;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          sqlite3_bind_int64(ppStmt, v14 + v13, objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "sqlID"));
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        v12 = v14 + v13;
      }
      while (v10);
      v15 = v14 + v13;
    }
    else
    {
      v15 = 1;
    }

    sqlite3_bind_int64(ppStmt, v15, *(_QWORD *)(a1 + 64));
    while (sqlite3_step(ppStmt) == 100)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_column_int64(ppStmt, 0);
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 48) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }

}

- (void)totalSummaryItemSizeForAccounts:(id)a3 addOverhead:(BOOL)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSObject *databaseQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  WLSQLController *v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  databaseQueue = self->_databaseQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__WLSQLController_totalSummaryItemSizeForAccounts_addOverhead_completion___block_invoke;
  v12[3] = &unk_24E375E88;
  v11 = v8;
  v16 = a4;
  v13 = v11;
  v14 = self;
  v15 = &v17;
  dispatch_sync(databaseQueue, v12);
  if (v9)
    v9[2](v9, v18[3], 0);

  _Block_object_dispose(&v17, 8);
}

void __74__WLSQLController_totalSummaryItemSizeForAccounts_addOverhead_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  __CFString *v3;
  const __CFString *v4;
  __CFString *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  const char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  sqlite3_stmt *ppStmt;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = 0;
    v3 = &stru_24E376E00;
    do
    {
      if (-[__CFString length](v3, "length"))
        v4 = CFSTR(", ?");
      else
        v4 = CFSTR("?");
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v2;
      v3 = v5;
    }
    while (v2 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  else
  {
    v5 = &stru_24E376E00;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT sum(itemSize) + max(itemSize) FROM summaries WHERE accountID IN(%@) AND migrationState < ?"), v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "UTF8String");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT sum(itemSize) FROM summaries WHERE accountID IN(%@) AND migrationState < ?"), v5);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "UTF8String");

  if (*(_BYTE *)(a1 + 56))
    v10 = (const char *)v7;
  else
    v10 = (const char *)v9;
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8), v10, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
    _WLLog();
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      v15 = 1;
      do
      {
        v16 = 0;
        v17 = v15;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          sqlite3_bind_int64(ppStmt, v17 + v16, objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "sqlID"));
          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        v15 = v17 + v16;
      }
      while (v13);
      v18 = v17 + v16;
    }
    else
    {
      v18 = 1;
    }

    sqlite3_bind_int64(ppStmt, v18, 1);
    while (sqlite3_step(ppStmt) == 100)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(ppStmt, 0);
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }

}

- (unint64_t)totalSummaryDownloadSegmentCountForAccounts:(id)a3
{
  return -[WLSQLController _totalSummarySegmentCountForAccounts:migrationStateComparisonOperator:migrationState:](self, "_totalSummarySegmentCountForAccounts:migrationStateComparisonOperator:migrationState:", a3, CFSTR("<"), 1);
}

- (void)setData:(id)a3 forSummary:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WLSQLController_setData_forSummary___block_invoke;
  block[3] = &unk_24E375EB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(databaseQueue, block);

}

uint64_t __38__WLSQLController_setData_forSummary___block_invoke(uint64_t a1)
{
  void *v3;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "UPDATE summaries SET data=? WHERE rowID=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
      sqlite3_bind_blob(ppStmt, 1, (const void *)objc_msgSend(objc_retainAutorelease(v3), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    else
      sqlite3_bind_null(ppStmt, 1);
    sqlite3_bind_int64(ppStmt, 2, objc_msgSend(*(id *)(a1 + 48), "sqlID"));
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)dataForSummary:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WLSQLController_dataForSummary___block_invoke;
  block[3] = &unk_24E375ED8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __34__WLSQLController_dataForSummary___block_invoke(uint64_t a1)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "SELECT data FROM summaries WHERE rowID=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, objc_msgSend(*(id *)(a1 + 40), "sqlID"));
    while (sqlite3_step(ppStmt) == 100)
    {
      v3 = sqlite3_column_bytes(ppStmt, 0);
      if (v3 >= 1)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", sqlite3_column_blob(ppStmt, 0), v3);
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v4;

      }
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)setDidDownloadForSummary:(id)a3 forSourceDevice:(id)a4
{
  id v5;
  NSObject *databaseQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WLSQLController_setDidDownloadForSummary_forSourceDevice___block_invoke;
  block[3] = &unk_24E375F00;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(databaseQueue, block);

}

uint64_t __60__WLSQLController_setDidDownloadForSummary_forSourceDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDatabaseQueue_updateMigrationState:forSummary:removeData:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)setWillImportForSummary:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__WLSQLController_setWillImportForSummary___block_invoke;
  block[3] = &unk_24E375F00;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(databaseQueue, block);

}

uint64_t __43__WLSQLController_setWillImportForSummary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDatabaseQueue_updateMigrationState:forSummary:removeData:", 2, *(_QWORD *)(a1 + 40), 0);
}

- (void)removeDataAndSetDidImportForSummary:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WLSQLController_removeDataAndSetDidImportForSummary___block_invoke;
  block[3] = &unk_24E375F00;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(databaseQueue, block);

}

uint64_t __55__WLSQLController_removeDataAndSetDidImportForSummary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDatabaseQueue_updateMigrationState:forSummary:removeData:", 3, *(_QWORD *)(a1 + 40), 1);
}

- (void)_onDatabaseQueue_updateMigrationState:(int)a3 forSummary:(id)a4 removeData:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  sqlite3_stmt *ppStmt;

  v5 = a5;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if (v5)
    v9 = "UPDATE summaries SET data=NULL, migrationState=? WHERE rowID=?";
  else
    v9 = "UPDATE summaries SET migrationState=? WHERE rowID=?";
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, v9, -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, a3);
    sqlite3_bind_int64(ppStmt, 2, objc_msgSend(v8, "sqlID"));
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }

}

- (void)setMigrationError:(id)a3 forSummary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *databaseQueue;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;

  v6 = a4;
  objc_msgSend(a3, "wl_encodableError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v8)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__WLSQLController_setMigrationError_forSummary___block_invoke;
    block[3] = &unk_24E375EB0;
    block[4] = self;
    v12 = v8;
    v13 = v6;
    dispatch_sync(databaseQueue, block);

  }
  else
  {
    _WLLog();
  }

}

uint64_t __48__WLSQLController_setMigrationError_forSummary___block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "UPDATE summaries SET migrationError=? WHERE rowID=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_blob(ppStmt, 1, (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int64(ppStmt, 2, objc_msgSend(*(id *)(a1 + 48), "sqlID"));
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)migrationErrors
{
  id v3;
  NSObject *databaseQueue;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  WLSQLController *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  databaseQueue = self->_databaseQueue;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __34__WLSQLController_migrationErrors__block_invoke;
  v12 = &unk_24E375F00;
  v13 = self;
  v14 = v3;
  v5 = v3;
  dispatch_sync(databaseQueue, &v9);
  if (objc_msgSend(v5, "count", v9, v10, v11, v12, v13))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

uint64_t __34__WLSQLController_migrationErrors__block_invoke(uint64_t a1)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "SELECT migrationError FROM summaries WHERE migrationError IS NOT NULL", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      v3 = sqlite3_column_bytes(ppStmt, 0);
      if (v3 >= 1)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", sqlite3_column_blob(ppStmt, 0), v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = (void *)MEMORY[0x24BDD1620];
          objc_msgSend(MEMORY[0x24BDD1540], "wl_encodableErrorSupportedClasses");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 0;
          objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v10;

          if (v7)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            _WLLog();

          }
        }

      }
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)updateModifiedDateForSummary:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WLSQLController_updateModifiedDateForSummary___block_invoke;
  block[3] = &unk_24E375F00;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(databaseQueue, block);

}

uint64_t __48__WLSQLController_updateModifiedDateForSummary___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "UPDATE summaries SET modifiedDate=? WHERE rowID=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "modifiedDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sqlite3_bind_NSDate:forStatement:position:", v4, ppStmt, 1);

    sqlite3_bind_int64(ppStmt, 2, objc_msgSend(*(id *)(a1 + 40), "sqlID"));
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)summariesForAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLSQLController summariesForAccounts:sortedByModifiedDate:](self, "summariesForAccounts:sortedByModifiedDate:", v6, 0, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)summariesForAccounts:(id)a3 sortedByModifiedDate:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *databaseQueue;
  id v15;
  id v16;
  void *v17;
  _QWORD block[4];
  id v20;
  WLSQLController *v21;
  id v22;
  uint64_t *v23;
  BOOL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "sqlID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v12, v13);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v9);
  }

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__WLSQLController_summariesForAccounts_sortedByModifiedDate___block_invoke;
  block[3] = &unk_24E375F28;
  v15 = v8;
  v24 = a4;
  v20 = v15;
  v21 = self;
  v23 = &v29;
  v16 = v7;
  v22 = v16;
  dispatch_sync(databaseQueue, block);
  v17 = (void *)objc_msgSend((id)v30[5], "copy");

  _Block_object_dispose(&v29, 8);
  return v17;
}

void __61__WLSQLController_summariesForAccounts_sortedByModifiedDate___block_invoke(uint64_t a1)
{
  unint64_t v2;
  __CFString *v3;
  const __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  WLSourceDeviceRecordSummary *v21;
  const unsigned __int8 *v22;
  void *v23;
  const unsigned __int8 *v24;
  void *v25;
  void *v26;
  const unsigned __int8 *v27;
  void *v28;
  int v29;
  const void *v30;
  void *v31;
  void *v32;
  id v33;
  sqlite3_int64 v34;
  void *v35;
  void *v36;
  void *v37;
  const unsigned __int8 *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  sqlite3_stmt *ppStmt;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = 0;
    v3 = &stru_24E376E00;
    do
    {
      if (-[__CFString length](v3, "length"))
        v4 = CFSTR(", ?");
      else
        v4 = CFSTR("?");
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v2;
      v3 = v5;
    }
    while (v2 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  else
  {
    v5 = &stru_24E376E00;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT id, identifier, itemSize, relativePath, modifiedDate, storeDataAsFile, dataFilePath, downloadSegmentCount, metadata, accountID, migrationState, bucket FROM summaries WHERE accountID IN(%@) AND migrationState < ?"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v6, CFSTR("ORDER BY modifiedDate ASC"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");

  }
  else
  {
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  }
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8), v9, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
    _WLLog();
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v10 = *(id *)(a1 + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v11)
    {
      v12 = v11;
      v42 = v7;
      v13 = *(_QWORD *)v45;
      v14 = 1;
      do
      {
        v15 = 0;
        v16 = v14;
        do
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v10);
          sqlite3_bind_int64(ppStmt, v16 + v15, objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v15), "sqlID"));
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        v14 = v16 + v15;
      }
      while (v12);
      v17 = v16 + v15;
      v7 = v42;
    }
    else
    {
      v17 = 1;
    }

    sqlite3_bind_int64(ppStmt, v17, 2);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    while (sqlite3_step(ppStmt) == 100)
    {
      v21 = objc_alloc_init(WLSourceDeviceRecordSummary);
      -[WLSourceDeviceRecordSummary setSqlID:](v21, "setSqlID:", sqlite3_column_int64(ppStmt, 0));
      v22 = sqlite3_column_text(ppStmt, 1);
      if (v22)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLSourceDeviceRecordSummary setIdentifier:](v21, "setIdentifier:", v23);

      }
      -[WLSourceDeviceRecordSummary setItemSize:](v21, "setItemSize:", sqlite3_column_int64(ppStmt, 2));
      v24 = sqlite3_column_text(ppStmt, 3);
      if (v24)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLSourceDeviceRecordSummary setRelativePath:](v21, "setRelativePath:", v25);

      }
      objc_msgSend(*(id *)(a1 + 40), "_sqlite3_column_NSDateForStatement:column:", ppStmt, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLSourceDeviceRecordSummary setModifiedDate:](v21, "setModifiedDate:", v26);

      -[WLSourceDeviceRecordSummary setStoreDataAsFile:](v21, "setStoreDataAsFile:", sqlite3_column_int(ppStmt, 5) != 0);
      v27 = sqlite3_column_text(ppStmt, 6);
      if (v27)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLSourceDeviceRecordSummary setDataFilePath:](v21, "setDataFilePath:", v28);

      }
      -[WLSourceDeviceRecordSummary setDownloadSegmentCount:](v21, "setDownloadSegmentCount:", sqlite3_column_int64(ppStmt, 7));
      v29 = sqlite3_column_bytes(ppStmt, 8);
      v30 = sqlite3_column_blob(ppStmt, 8);
      if (v30 && v29 >= 1)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v30, v29, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v43 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v31, 0, &v43);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v43;
          if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            -[WLSourceDeviceRecordSummary setMetadata:](v21, "setMetadata:", v32);
          }
          else if (v33)
          {
            v40 = *(_QWORD *)(a1 + 40);
            v41 = v33;
            _WLLog();
          }

        }
      }
      v34 = sqlite3_column_int64(ppStmt, 9);
      v35 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLSourceDeviceRecordSummary setAccount:](v21, "setAccount:", v37);

      -[WLSourceDeviceRecordSummary setDidDownload:](v21, "setDidDownload:", sqlite3_column_int(ppStmt, 10) > 0, v40, v41);
      v38 = sqlite3_column_text(ppStmt, 11);
      if (v38)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[WLSourceDeviceRecordSummary setBucket:](v21, "setBucket:", v39);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v21);

    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }

}

- (id)migrationMetadataForSourceDevice:(id)a3 strictMatch:(BOOL)a4
{
  id v5;
  WLSourceDeviceMigrationMetadata *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
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
  NSObject *databaseQueue;
  WLSourceDeviceMigrationMetadata *v22;
  id v23;
  WLSourceDeviceMigrationMetadata *v24;
  WLSourceDeviceMigrationMetadata *v25;
  _QWORD block[5];
  id v29;
  WLSourceDeviceMigrationMetadata *v30;
  BOOL v31;

  v5 = a3;
  v6 = objc_alloc_init(WLSourceDeviceMigrationMetadata);
  objc_msgSend(v5, "osAPIVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24E376E00;
  -[WLSourceDeviceMigrationMetadata setDeviceOSVersion:](v6, "setDeviceOSVersion:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "hardwareBrand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareDesign");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareMaker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareProduct");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@/%@/%@/%@"), v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLSourceDeviceMigrationMetadata setDeviceType:](v6, "setDeviceType:", v16);

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "hardwareModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLSourceDeviceMigrationMetadata setDeviceModel:](v6, "setDeviceModel:", v19);

  objc_msgSend(v5, "clientVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLSourceDeviceMigrationMetadata setClientVersion:](v6, "setClientVersion:", v20);

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__WLSQLController_migrationMetadataForSourceDevice_strictMatch___block_invoke;
  block[3] = &unk_24E375F50;
  v31 = a4;
  block[4] = self;
  v29 = v5;
  v22 = v6;
  v30 = v22;
  v23 = v5;
  dispatch_sync(databaseQueue, block);
  v24 = v30;
  v25 = v22;

  return v25;
}

uint64_t __64__WLSQLController_migrationMetadataForSourceDevice_strictMatch___block_invoke(uint64_t a1)
{
  const char *v2;
  void *v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  if (*(_BYTE *)(a1 + 56))
    v2 = "SELECT state, communicationDate, attemptCount, crashCount FROM metadata WHERE device=? LIMIT 1";
  else
    v2 = "SELECT state, communicationDate, attemptCount, crashCount FROM metadata LIMIT 1";
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), v2, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "length"))
        __64__WLSQLController_migrationMetadataForSourceDevice_strictMatch___block_invoke_cold_1();

      v5 = ppStmt;
      objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0);

    }
    while (sqlite3_step(ppStmt) == 100)
    {
      objc_msgSend(*(id *)(a1 + 48), "setState:", sqlite3_column_int64(ppStmt, 0));
      objc_msgSend(*(id *)(a1 + 32), "_sqlite3_column_NSDateForStatement:column:", ppStmt, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setCommunicationDate:", v7);

      objc_msgSend(*(id *)(a1 + 48), "setAttemptCount:", sqlite3_column_int64(ppStmt, 2));
      objc_msgSend(*(id *)(a1 + 48), "setCrashCount:", sqlite3_column_int64(ppStmt, 3));
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)insertMetadata:(id)a3 forSourceDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WLSQLController_insertMetadata_forSourceDevice___block_invoke;
  block[3] = &unk_24E375EB0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(databaseQueue, block);

}

uint64_t __50__WLSQLController_insertMetadata_forSourceDevice___block_invoke(uint64_t a1)
{
  void *v3;
  sqlite3_stmt *v4;
  id v5;
  void *v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "INSERT INTO metadata (device, state, communicationDate, attemptCount, crashCount) VALUES (?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length"))
      __50__WLSQLController_insertMetadata_forSourceDevice___block_invoke_cold_1();

    v4 = ppStmt;
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v4, 1, (const char *)objc_msgSend(v5, "UTF8String"), -1, 0);

    sqlite3_bind_int64(ppStmt, 2, objc_msgSend(*(id *)(a1 + 48), "state"));
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "communicationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_sqlite3_bind_NSDate:forStatement:position:", v7, ppStmt, 3);

    sqlite3_bind_int64(ppStmt, 4, objc_msgSend(*(id *)(a1 + 48), "attemptCount"));
    sqlite3_bind_int64(ppStmt, 5, objc_msgSend(*(id *)(a1 + 48), "crashCount"));
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)setMetadata:(id)a3 forSourceDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WLSQLController_setMetadata_forSourceDevice___block_invoke;
  block[3] = &unk_24E375EB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(databaseQueue, block);

}

uint64_t __47__WLSQLController_setMetadata_forSourceDevice___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  sqlite3_stmt *v6;
  id v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "UPDATE metadata SET state=?, communicationDate=?, attemptCount=?, crashCount=? WHERE device=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, objc_msgSend(*(id *)(a1 + 40), "state"));
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "communicationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sqlite3_bind_NSDate:forStatement:position:", v4, ppStmt, 2);

    sqlite3_bind_int64(ppStmt, 3, objc_msgSend(*(id *)(a1 + 40), "attemptCount"));
    sqlite3_bind_int64(ppStmt, 4, objc_msgSend(*(id *)(a1 + 40), "crashCount"));
    objc_msgSend(*(id *)(a1 + 48), "persistentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
      __47__WLSQLController_setMetadata_forSourceDevice___block_invoke_cold_1();

    v6 = ppStmt;
    objc_msgSend(*(id *)(a1 + 48), "persistentIdentifier");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v6, 5, (const char *)objc_msgSend(v7, "UTF8String"), -1, 0);

    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)insertMigratableApp:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *databaseQueue;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v8)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__WLSQLController_insertMigratableApp_forDevice___block_invoke;
    block[3] = &unk_24E375EB0;
    block[4] = self;
    v12 = v7;
    v13 = v8;
    dispatch_sync(databaseQueue, block);

  }
  else
  {
    _WLLog();
  }

}

uint64_t __49__WLSQLController_insertMigratableApp_forDevice___block_invoke(uint64_t a1)
{
  void *v3;
  sqlite3_stmt *v4;
  id v5;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "INSERT INTO migratableApps (device, data) VALUES (?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length"))
      __49__WLSQLController_insertMigratableApp_forDevice___block_invoke_cold_1();

    v4 = ppStmt;
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v4, 1, (const char *)objc_msgSend(v5, "UTF8String"), -1, 0);

    sqlite3_bind_blob(ppStmt, 2, (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes"), objc_msgSend(*(id *)(a1 + 48), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)_migratableAppsForDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *databaseQueue;
  id v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v12;
  WLSQLController *v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WLSQLController__migratableAppsForDevice___block_invoke;
  block[3] = &unk_24E375EB0;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_sync(databaseQueue, block);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

uint64_t __44__WLSQLController__migratableAppsForDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  void *v5;
  void *v6;
  sqlite3_stmt *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  sqlite3_stmt *ppStmt;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v3 = "SELECT data FROM migratableApps WHERE device=?";
  else
    v3 = "SELECT data FROM migratableApps";
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(v2 + 8), v3, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
    return _WLLog();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "persistentIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "length"))
        __44__WLSQLController__migratableAppsForDevice___block_invoke_cold_1();

      v7 = ppStmt;
      objc_msgSend(*(id *)(a1 + 32), "persistentIdentifier");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(v7, 1, (const char *)objc_msgSend(v8, "UTF8String"), -1, 0);

    }
    while (sqlite3_step(ppStmt) == 100)
    {
      v9 = sqlite3_column_bytes(ppStmt, 0);
      if (v9 >= 1)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", sqlite3_column_blob(ppStmt, 0), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)MEMORY[0x24BDD1620];
          v12 = (void *)MEMORY[0x24BDBCF20];
          v13 = objc_opt_class();
          v14 = objc_opt_class();
          objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v15, v10, &v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v19;

          if (v16)
          {
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            _WLLog();

          }
        }

      }
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)migratableAppsForAllDevices
{
  return -[WLSQLController _migratableAppsForDevice:](self, "_migratableAppsForDevice:", 0);
}

- (void)insertMessagePhoneNumberWithIcc:(id)a3 ccAcNumber:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__WLSQLController_insertMessagePhoneNumberWithIcc_ccAcNumber___block_invoke;
  block[3] = &unk_24E375EB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(databaseQueue, block);

}

uint64_t __62__WLSQLController_insertMessagePhoneNumberWithIcc_ccAcNumber___block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "INSERT OR IGNORE INTO messagePhoneNumbers (icc, ccAcNumber) VALUES (?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    sqlite3_bind_text(ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)messagePhoneNumberIccForCcAcNumber:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WLSQLController_messagePhoneNumberIccForCcAcNumber___block_invoke;
  block[3] = &unk_24E375ED8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __54__WLSQLController_messagePhoneNumberIccForCcAcNumber___block_invoke(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "SELECT icc FROM messagePhoneNumbers WHERE ccAcNumber=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    while (sqlite3_step(ppStmt) == 100)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)deleteMessagePhoneNumbersForAllDevices
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__WLSQLController_deleteMessagePhoneNumbersForAllDevices__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __57__WLSQLController_deleteMessagePhoneNumbersForAllDevices__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM messagePhoneNumbers", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)groupMessageInfoMatchingSourceThreadID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WLSQLController_groupMessageInfoMatchingSourceThreadID___block_invoke;
  block[3] = &unk_24E375ED8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __58__WLSQLController_groupMessageInfoMatchingSourceThreadID___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "SELECT roomName, groupID FROM groupMessageInfo WHERE sourceThreadID=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    while (sqlite3_step(ppStmt) == 100)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 1));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[WLGroupMessageInfo groupMessageInfoWithSourceThreadID:sortedHandleIDs:handleIDsAreComplete:roomName:groupID:](WLGroupMessageInfo, "groupMessageInfoWithSourceThreadID:sortedHandleIDs:handleIDsAreComplete:roomName:groupID:", *(_QWORD *)(a1 + 40), 0, 0, v3, v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)groupMessageInfoMatchingSortedHandleIDs:(id)a3 handleIDsAreComplete:(BOOL)a4 didMatchExactly:(BOOL *)a5
{
  id v8;
  uint64_t v9;
  NSObject *databaseQueue;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  BOOL *v19;
  BOOL v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  BOOL *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v9 = MEMORY[0x24BDAC760];
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__WLSQLController_groupMessageInfoMatchingSortedHandleIDs_handleIDsAreComplete_didMatchExactly___block_invoke;
  block[3] = &unk_24E375F78;
  block[4] = self;
  v11 = v8;
  v25 = a4;
  v22 = v11;
  v23 = &v26;
  v24 = a5;
  dispatch_sync(databaseQueue, block);
  v12 = (void *)v27[5];
  if (!v12)
  {
    v13 = self->_databaseQueue;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __96__WLSQLController_groupMessageInfoMatchingSortedHandleIDs_handleIDsAreComplete_didMatchExactly___block_invoke_2;
    v16[3] = &unk_24E375F78;
    v16[4] = self;
    v20 = a4;
    v17 = v11;
    v18 = &v26;
    v19 = a5;
    dispatch_sync(v13, v16);

    v12 = (void *)v27[5];
  }
  v14 = v12;

  _Block_object_dispose(&v26, 8);
  return v14;
}

void __96__WLSQLController_groupMessageInfoMatchingSortedHandleIDs_handleIDsAreComplete_didMatchExactly___block_invoke(uint64_t a1)
{
  void *v2;
  sqlite3_stmt *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "SELECT roomName, groupID FROM groupMessageInfo WHERE sortedHandleIDs=? AND handleIDsAreComplete=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    _WLLog();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(","));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = ppStmt;
    v4 = objc_retainAutorelease(v2);
    sqlite3_bind_text(v3, 1, (const char *)objc_msgSend(v4, "UTF8String"), -1, 0);
    sqlite3_bind_int(ppStmt, 2, *(unsigned __int8 *)(a1 + 64));
    while (sqlite3_step(ppStmt) == 100)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[WLGroupMessageInfo groupMessageInfoWithSourceThreadID:sortedHandleIDs:handleIDsAreComplete:roomName:groupID:](WLGroupMessageInfo, "groupMessageInfoWithSourceThreadID:sortedHandleIDs:handleIDsAreComplete:roomName:groupID:", 0, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v10 = *(_BYTE **)(a1 + 56);
      if (v10)
        *v10 = 1;

    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);

  }
}

void __96__WLSQLController_groupMessageInfoMatchingSortedHandleIDs_handleIDsAreComplete_didMatchExactly___block_invoke_2(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "SELECT sortedHandleIDs, roomName, groupID FROM groupMessageInfo WHERE handleIDsCount=? AND handleIDsAreComplete=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    _WLLog();
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "count");
    sqlite3_bind_int(ppStmt, 1, v2 - 1);
    v3 = *(unsigned __int8 *)(a1 + 64);
    sqlite3_bind_int(ppStmt, 2, *(_BYTE *)(a1 + 64) == 0);
    if (sqlite3_step(ppStmt) == 100)
    {
      v4 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "wl_sqlIDComponentsSeparatedByString:", CFSTR(","));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 1));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_text(ppStmt, 2));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(*(id *)(a1 + 32), "_foundHandleIDs:representSameGroupMessageAsHandleIDs:handleIDsAreComplete:", v6, v4, *(unsigned __int8 *)(a1 + 64)))break;

        if (sqlite3_step(ppStmt) != 100)
          goto LABEL_14;
      }
      +[WLGroupMessageInfo groupMessageInfoWithSourceThreadID:sortedHandleIDs:handleIDsAreComplete:roomName:groupID:](WLGroupMessageInfo, "groupMessageInfoWithSourceThreadID:sortedHandleIDs:handleIDsAreComplete:roomName:groupID:", 0, v6, v3 == 0, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v12 = *(_BYTE **)(a1 + 56);
      if (v12)
        *v12 = 0;

    }
    else
    {
      v4 = 0;
    }
LABEL_14:
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) != 100
      && sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);

  }
}

- (BOOL)_foundHandleIDs:(id)a3 representSameGroupMessageAsHandleIDs:(id)a4 handleIDsAreComplete:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12;

  v5 = a5;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = a4;
  objc_msgSend(v7, "setWithArray:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    v11 = v8;
  }
  else
  {
    v9 = v8;
    v11 = v10;
  }
  v12 = objc_msgSend(v9, "isSubsetOfSet:", v11);

  return v12;
}

- (void)insertGroupMessageInfoWithSourceThreadID:(id)a3 roomName:(id)a4 groupID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__WLSQLController_insertGroupMessageInfoWithSourceThreadID_roomName_groupID___block_invoke;
  block[3] = &unk_24E375FA0;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(databaseQueue, block);

}

uint64_t __77__WLSQLController_insertGroupMessageInfoWithSourceThreadID_roomName_groupID___block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "INSERT INTO groupMessageInfo (sourceThreadID, roomName, groupID) VALUES (?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    sqlite3_bind_text(ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
    sqlite3_bind_text(ppStmt, 3, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String"), -1, 0);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)insertGroupMessageInfoWithSortedHandleIDs:(id)a3 handleIDsAreComplete:(BOOL)a4 roomName:(id)a5 groupID:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *databaseQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__WLSQLController_insertGroupMessageInfoWithSortedHandleIDs_handleIDsAreComplete_roomName_groupID___block_invoke;
  block[3] = &unk_24E375FC8;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(databaseQueue, block);

}

void __99__WLSQLController_insertGroupMessageInfoWithSortedHandleIDs_handleIDsAreComplete_roomName_groupID___block_invoke(uint64_t a1)
{
  void *v2;
  sqlite3_stmt *v3;
  id v4;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "INSERT INTO groupMessageInfo (sortedHandleIDs, handleIDsAreComplete, handleIDsCount, roomName, groupID) VALUES (?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    _WLLog();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR(","));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = ppStmt;
    v4 = objc_retainAutorelease(v2);
    sqlite3_bind_text(v3, 1, (const char *)objc_msgSend(v4, "UTF8String"), -1, 0);
    sqlite3_bind_int(ppStmt, 2, *(unsigned __int8 *)(a1 + 64));
    sqlite3_bind_int(ppStmt, 3, objc_msgSend(*(id *)(a1 + 40), "count"));
    sqlite3_bind_text(ppStmt, 4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0);
    sqlite3_bind_text(ppStmt, 5, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String"), -1, 0);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);

  }
}

- (void)deleteGroupMessageInfoForAllDevices
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WLSQLController_deleteGroupMessageInfoForAllDevices__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __54__WLSQLController_deleteGroupMessageInfoForAllDevices__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM groupMessageInfo", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)statisticsForContentType:(id)a3
{
  id v4;
  void *v5;
  NSObject *databaseQueue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  +[WLStatistics _statisticsWithContentType:](WLStatistics, "_statisticsWithContentType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WLSQLController_statisticsForContentType___block_invoke;
  block[3] = &unk_24E375EB0;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_sync(databaseQueue, block);
  v9 = v14;
  v10 = v7;

  return v10;
}

uint64_t __44__WLSQLController_statisticsForContentType___block_invoke(id *a1)
{
  uint64_t result;
  int v3;
  int v4;
  void *v5;
  void *v6;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*((sqlite3 **)a1[4] + 1), "SELECT selectedForMigration, downloadDuration, downloadByteCount, importStartDate, importEndDate, importStartBytesFree, importEndBytesFree, importRecordCount, importFailedRecordCount FROM statistics WHERE contentType=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*((sqlite3 **)a1[4] + 1));
    sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"), -1, 0);
    v3 = sqlite3_step(ppStmt);
    v4 = v3;
    while (v3 == 100)
    {
      objc_msgSend(a1[6], "setSelectedForMigration:", sqlite3_column_int(ppStmt, 0) != 0);
      objc_msgSend(a1[6], "setDownloadDuration:", sqlite3_column_int64(ppStmt, 1));
      objc_msgSend(a1[6], "setDownloadByteCount:", sqlite3_column_int64(ppStmt, 2));
      objc_msgSend(a1[4], "_sqlite3_column_NSDateForStatement:column:", ppStmt, 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setImportStartDate:", v5);

      objc_msgSend(a1[4], "_sqlite3_column_NSDateForStatement:column:", ppStmt, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setImportEndDate:", v6);

      objc_msgSend(a1[6], "setImportStartBytesFree:", sqlite3_column_int64(ppStmt, 5));
      objc_msgSend(a1[6], "setImportEndBytesFree:", sqlite3_column_int64(ppStmt, 6));
      objc_msgSend(a1[6], "setImportRecordCount:", sqlite3_column_int64(ppStmt, 7));
      objc_msgSend(a1[6], "setImportFailedRecordCount:", sqlite3_column_int64(ppStmt, 8));
      v3 = sqlite3_step(ppStmt);
    }
    if (sqlite3_errcode(*((sqlite3 **)a1[4] + 1)) != 101 && sqlite3_errcode(*((sqlite3 **)a1[4] + 1)) >= 1)
    {
      sqlite3_errcode(*((sqlite3 **)a1[4] + 1));
      sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
      _WLLog();
    }
    result = sqlite3_finalize(ppStmt);
    if (v4 != 100)
      return objc_msgSend(a1[4], "_insertStatistics_onDatabaseQueue:", a1[6]);
  }
  return result;
}

- (void)updateStatistics:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__WLSQLController_updateStatistics___block_invoke;
  block[3] = &unk_24E375F00;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(databaseQueue, block);

}

uint64_t __36__WLSQLController_updateStatistics___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  sqlite3_stmt *v7;
  id v8;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "UPDATE statistics SET selectedForMigration=?, downloadDuration=?, downloadByteCount=?, importStartDate=?, importEndDate=?, importStartBytesFree=?, importEndBytesFree=?, importRecordCount=?, importFailedRecordCount=? WHERE contentType=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, objc_msgSend(*(id *)(a1 + 40), "selectedForMigration"));
    sqlite3_bind_int64(ppStmt, 2, objc_msgSend(*(id *)(a1 + 40), "downloadDuration"));
    sqlite3_bind_int64(ppStmt, 3, objc_msgSend(*(id *)(a1 + 40), "downloadByteCount"));
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "importStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sqlite3_bind_NSDate:forStatement:position:", v4, ppStmt, 4);

    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "importEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sqlite3_bind_NSDate:forStatement:position:", v6, ppStmt, 5);

    sqlite3_bind_int64(ppStmt, 6, objc_msgSend(*(id *)(a1 + 40), "importStartBytesFree"));
    sqlite3_bind_int64(ppStmt, 7, objc_msgSend(*(id *)(a1 + 40), "importEndBytesFree"));
    sqlite3_bind_int64(ppStmt, 8, objc_msgSend(*(id *)(a1 + 40), "importRecordCount"));
    sqlite3_bind_int64(ppStmt, 9, objc_msgSend(*(id *)(a1 + 40), "importFailedRecordCount"));
    v7 = ppStmt;
    objc_msgSend(*(id *)(a1 + 40), "contentType");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v7, 10, (const char *)objc_msgSend(v8, "UTF8String"), -1, 0);

    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)_insertStatistics_onDatabaseQueue:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  void *v8;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO statistics (contentType, selectedForMigration, downloadDuration, downloadByteCount, importStartDate, importEndDate, importStartBytesFree, importEndBytesFree, importRecordCount, importFailedRecordCount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
  }
  else
  {
    v5 = ppStmt;
    objc_msgSend(v4, "contentType");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0);

    sqlite3_bind_int(ppStmt, 2, objc_msgSend(v4, "selectedForMigration"));
    sqlite3_bind_int64(ppStmt, 3, objc_msgSend(v4, "downloadDuration"));
    sqlite3_bind_int64(ppStmt, 4, objc_msgSend(v4, "downloadByteCount"));
    objc_msgSend(v4, "importStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLSQLController _sqlite3_bind_NSDate:forStatement:position:](self, "_sqlite3_bind_NSDate:forStatement:position:", v7, ppStmt, 5);

    objc_msgSend(v4, "importEndDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLSQLController _sqlite3_bind_NSDate:forStatement:position:](self, "_sqlite3_bind_NSDate:forStatement:position:", v8, ppStmt, 6);

    sqlite3_bind_int64(ppStmt, 7, objc_msgSend(v4, "importStartBytesFree"));
    sqlite3_bind_int64(ppStmt, 8, objc_msgSend(v4, "importEndBytesFree"));
    sqlite3_bind_int64(ppStmt, 9, objc_msgSend(v4, "importRecordCount"));
    sqlite3_bind_int64(ppStmt, 10, objc_msgSend(v4, "importFailedRecordCount"));
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }

}

- (void)deleteStatisticsForAllDevices
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WLSQLController_deleteStatisticsForAllDevices__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __48__WLSQLController_deleteStatisticsForAllDevices__block_invoke(uint64_t a1)
{
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), "DELETE FROM statistics", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)_openDatabase
{
  void *v3;
  char v4;
  void *v5;
  WLSQLController *v6;
  NSString *databasePath;
  id v8;

  -[NSString stringByDeletingLastPathComponent](self->_databasePath, "stringByDeletingLastPathComponent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileExistsAtPath:", v8);

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

    }
  }
  if (sqlite3_open(-[NSString UTF8String](self->_databasePath, "UTF8String"), &self->_database))
  {
    v6 = self;
    databasePath = self->_databasePath;
    _WLLog();
  }
  -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("pragma foreign_keys=on"), 0, v6, databasePath);
  -[WLSQLController _ensureCorrectSchema](self, "_ensureCorrectSchema");

}

- (void)closeDatabase
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__WLSQLController_closeDatabase__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

sqlite3 *__32__WLSQLController_closeDatabase__block_invoke(uint64_t a1)
{
  sqlite3 *result;

  result = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    result = (sqlite3 *)sqlite3_close(result);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
  return result;
}

- (void)_ensureCorrectSchema
{
  id v3;

  if (-[WLSQLController _schemaVersion](self, "_schemaVersion") != 12)
  {
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS metadata"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE metadata (id INTEGER PRIMARY KEY, device TEXT NOT NULL, communicationDate INTEGER, state INTEGER, attemptCount INTEGER, crashCount INTEGER)"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS accounts"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE accounts (id INTEGER PRIMARY KEY, identifier TEXT, device TEXT, migrator TEXT)"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS summaries"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE summaries (id INTEGER PRIMARY KEY, accountID INTEGER REFERENCES accounts(id), identifier TEXT, migrationState INTEGER DEFAULT 0, itemSize INTEGER, relativePath TEXT, modifiedDate INTEGER, storeDataAsFile INTEGER, dataFilePath TEXT, downloadSegmentCount INTEGER CHECK (downloadSegmentCount > 0), metadata BLOB, data BLOB, migrationError BLOB DEFAULT NULL, bucket TEXT)"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS migratableApps"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE migratableApps (id INTEGER PRIMARY KEY, device TEXT, data BLOB)"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS bundleIDs"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE bundleIDs (id INTEGER PRIMARY KEY, device TEXT NOT NULL, bundleID TEXT NOT NULL)"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP INDEX IF EXISTS messagePhoneNumbers_index"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS messagePhoneNumbers"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE messagePhoneNumbers (icc TEXT NOT NULL, ccAcNumber TEXT NOT NULL, PRIMARY KEY (icc, ccAcNumber))"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE INDEX messagePhoneNumbers_index ON messagePhoneNumbers(ccAcNumber)"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS groupMessageInfo"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE groupMessageInfo (id INTEGER PRIMARY KEY, sourceThreadID TEXT UNIQUE, sortedHandleIDs TEXT UNIQUE, handleIDsAreComplete INTEGER, handleIDsCount INTEGER, roomName TEXT NOT NULL, groupID TEXT NOT NULL)"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS statistics"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE statistics (contentType TEXT PRIMARY KEY, selectedForMigration INTEGER, downloadDuration INTEGER, downloadByteCount INTEGER, importStartDate INTEGER, importEndDate INTEGER, importStartBytesFree INTEGER, importEndBytesFree INTEGER, importRecordCount INTEGER, importFailedRecordCount INTEGER)"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("DROP TABLE IF EXISTS databaseProperties"), 0);
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("CREATE TABLE databaseProperties (key TEXT PRIMARY KEY, value TEXT)"), 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INSERT INTO databaseProperties (key, value) VALUES ('schemaVersion', '%@')"), &unk_24E385880);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", v3, 0);

  }
}

- (int64_t)_schemaVersion
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__WLSQLController__schemaVersion__block_invoke;
  v4[3] = &unk_24E375FF0;
  v4[4] = &v5;
  -[WLSQLController _performQuery:rowHandler:](self, "_performQuery:rowHandler:", CFSTR("SELECT value FROM databaseProperties WHERE key='schemaVersion'"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__WLSQLController__schemaVersion__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const unsigned __int8 *v3;
  id v4;

  v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "integerValue");

  }
}

- (int64_t)_performQuery:(id)a3 rowHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__WLSQLController__performQuery_rowHandler___block_invoke;
  v13[3] = &unk_24E376018;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(databaseQueue, v13);
  v11 = *((int *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __44__WLSQLController__performQuery_rowHandler___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  int v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8), (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, &ppStmt, 0))
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    _WLLog();

  }
  else
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      v4 = 0;
      do
      {
        v5 = *(_QWORD *)(a1 + 48);
        if (v5)
          (*(void (**)(uint64_t, sqlite3_stmt *))(v5 + 16))(v5, ppStmt);
        ++v4;
      }
      while (sqlite3_step(ppStmt) == 100);
    }
    else
    {
      v4 = 0;
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) == 101
      || sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8)) < 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "uppercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("INSERT"));

      if (v9)
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "uppercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("SELECT"));

        if (v11)
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
        else
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_changes(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      }
    }
    else
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      sqlite3_errcode(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      _WLLog();

    }
    sqlite3_finalize(ppStmt);
  }
}

+ (int64_t)persistentValueForDate:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSince1970");
  return (uint64_t)v3;
}

- (id)_sqlite3_column_NSDateForStatement:(sqlite3_stmt *)a3 column:(int)a4
{
  void *v4;

  v4 = (void *)sqlite3_column_int64(a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(uint64_t)v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)_sqlite3_bind_NSDate:(id)a3 forStatement:(sqlite3_stmt *)a4 position:(int)a5
{
  return sqlite3_bind_int64(a4, a5, +[WLSQLController persistentValueForDate:](WLSQLController, "persistentValueForDate:", a3));
}

- (void)setDatabasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
}

void __49__WLSQLController_insertAccount_migrator_device___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController insertAccount:migrator:device:]_block_invoke", "WLSQLController.m", 214, "device.persistentIdentifier.length != 0");
}

void __46__WLSQLController_accountsForMigrator_device___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController accountsForMigrator:device:]_block_invoke", "WLSQLController.m", 248, "device.persistentIdentifier.length != 0");
}

void __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController deleteAccountsAndSummariesForMigrator:device:]_block_invoke", "WLSQLController.m", 285, "device.persistentIdentifier.length != 0");
}

void __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke_cold_2()
{
  __assert_rtn("-[WLSQLController deleteAccountsAndSummariesForMigrator:device:]_block_invoke", "WLSQLController.m", 302, "device.persistentIdentifier.length != 0");
}

void __64__WLSQLController_migrationMetadataForSourceDevice_strictMatch___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController migrationMetadataForSourceDevice:strictMatch:]_block_invoke", "WLSQLController.m", 798, "device.persistentIdentifier.length != 0");
}

void __50__WLSQLController_insertMetadata_forSourceDevice___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController insertMetadata:forSourceDevice:]_block_invoke", "WLSQLController.m", 831, "device.persistentIdentifier.length != 0");
}

void __47__WLSQLController_setMetadata_forSourceDevice___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController setMetadata:forSourceDevice:]_block_invoke", "WLSQLController.m", 867, "device.persistentIdentifier.length != 0");
}

void __49__WLSQLController_insertMigratableApp_forDevice___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController insertMigratableApp:forDevice:]_block_invoke", "WLSQLController.m", 899, "device.persistentIdentifier.length != 0");
}

void __44__WLSQLController__migratableAppsForDevice___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController _migratableAppsForDevice:]_block_invoke", "WLSQLController.m", 940, "device.persistentIdentifier.length != 0");
}

@end
