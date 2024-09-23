@implementation WBSBlockedHighlightsBannerSQLiteStore

+ (NSURL)defaultDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_settingsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("BlockedBannerHighlights.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (WBSBlockedHighlightsBannerSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4;
  WBSBlockedHighlightsBannerSQLiteStore *v5;
  NSURL *v6;
  NSURL *databaseURL;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *databaseQueue;
  WBSBlockedHighlightsBannerSQLiteStore *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSBlockedHighlightsBannerSQLiteStore;
  v5 = -[WBSBlockedHighlightsBannerSQLiteStore init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (NSURL *)v4;
    }
    else
    {
      +[WBSBlockedHighlightsBannerSQLiteStore defaultDatabaseURL](WBSBlockedHighlightsBannerSQLiteStore, "defaultDatabaseURL");
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    dispatch_get_global_queue(17, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("com.apple.SafariShared.WBSBlockedBannerHighlightsSQLiteStore", 0, v8);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)fetchAllBlockedHighlightsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__WBSBlockedHighlightsBannerSQLiteStore_fetchAllBlockedHighlightsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __88__WBSBlockedHighlightsBannerSQLiteStore_fetchAllBlockedHighlightsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    SafariShared::WBSSQLiteDatabaseFetch<>(v2, CFSTR("SELECT highlightIdentifier FROM BlockedBannerHighlights"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v9, "nextObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (!v4)
        break;
      objc_msgSend(v4, "stringAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v3);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, MEMORY[0x1E0C9AA60]);
  }
}

- (void)storeBlockedHighlightWithIdentifier:(id)a3 completionHandler:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSBlockedHighlightsBannerSQLiteStore_storeBlockedHighlightWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

uint64_t __95__WBSBlockedHighlightsBannerSQLiteStore_storeBlockedHighlightWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t result;
  void *v7;
  void *v8;
  _BYTE v9[12];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)v9 = v3;
    v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,double>(v2, 0, CFSTR("INSERT OR REPLACE INTO BlockedBannerHighlights (highlightIdentifier, blockedTime) VALUES (?, ?)"), (_QWORD *)(a1 + 40), (double *)v9);
    if (v4 != 101)
    {
      v5 = (id)WBS_LOG_CHANNEL_PREFIXInterstellar();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorWithMethodName:", "-[WBSBlockedHighlightsBannerSQLiteStore storeBlockedHighlightWithIdentifier:completionHandler:]_block_invoke");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v9 = 138543618;
        *(_QWORD *)&v9[4] = v8;
        v10 = 1024;
        v11 = v4;
        _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Failed to insert into BlockedBannerHighlights table: %{public}@ (%d)", v9, 0x12u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)verifyIfHighlightIsBlockedWithIdentifier:(id)a3 completionHandler:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__WBSBlockedHighlightsBannerSQLiteStore_verifyIfHighlightIsBlockedWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

void __100__WBSBlockedHighlightsBannerSQLiteStore_verifyIfHighlightIsBlockedWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(v2, CFSTR("SELECT highlightIdentifier FROM BlockedBannerHighlights WHERE highlightIdentifier = ?"), (_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
}

- (void)clearAllBannedHighlightsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__WBSBlockedHighlightsBannerSQLiteStore_clearAllBannedHighlightsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __87__WBSBlockedHighlightsBannerSQLiteStore_clearAllBannedHighlightsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  uint64_t result;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, CFSTR("DELETE FROM BlockedBannerHighlights"));
    if (v3 != 101)
    {
      v4 = v3;
      v5 = (id)WBS_LOG_CHANNEL_PREFIXInterstellar();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorWithMethodName:", "-[WBSBlockedHighlightsBannerSQLiteStore clearAllBannedHighlightsWithCompletionHandler:]_block_invoke");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v8;
        v11 = 1024;
        v12 = v4;
        _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Unable to clear rows from Blocked Banner Highlights: %{public}@ (%d)", (uint8_t *)&v9, 0x12u);

      }
    }
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearBlockedBannerHighlightsAfterDate:(id)a3 beforeDate:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__WBSBlockedHighlightsBannerSQLiteStore_clearBlockedBannerHighlightsAfterDate_beforeDate_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E4B2A2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(databaseQueue, v15);

}

uint64_t __112__WBSBlockedHighlightsBannerSQLiteStore_clearBlockedBannerHighlightsAfterDate_beforeDate_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t result;
  void *v8;
  void *v9;
  uint64_t v10;
  _BYTE buf[12];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    *(_QWORD *)buf = v3;
    objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceReferenceDate");
    v10 = v4;
    v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,double>(v2, 0, CFSTR("DELETE FROM BlockedBannerHighlights WHERE blockedTime >= ? AND blockedTime <= ?"), (double *)buf, (double *)&v10);
    if (v5 != 101)
    {
      v6 = (id)WBS_LOG_CHANNEL_PREFIXInterstellar();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorWithMethodName:", "-[WBSBlockedHighlightsBannerSQLiteStore clearBlockedBannerHighlightsAfterDate:beforeDate:withCompletionHandler:]_block_invoke");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_privacyPreservingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v9;
        v12 = 1024;
        v13 = v5;
        _os_log_error_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_ERROR, "Unable to clear rows from Blocked Banner Highlights: %{public}@ (%d)", buf, 0x12u);

      }
    }
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  else
  {
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeBlockedBannerhighlightWithIdentifier:(id)a3 completionHandler:(id)a4
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__WBSBlockedHighlightsBannerSQLiteStore_removeBlockedBannerhighlightWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

uint64_t __102__WBSBlockedHighlightsBannerSQLiteStore_removeBlockedBannerhighlightWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  uint64_t result;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(v2, 0, CFSTR("DELETE FROM BlockedBannerHighlights WHERE highlightIdentifier = ?"), (_QWORD *)(a1 + 40));
    if (v3 != 101)
    {
      v4 = v3;
      v5 = (id)WBS_LOG_CHANNEL_PREFIXInterstellar();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorWithMethodName:", "-[WBSBlockedHighlightsBannerSQLiteStore removeBlockedBannerhighlightWithIdentifier:completionHandler:]_block_invoke");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v8;
        v11 = 1024;
        v12 = v4;
        _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Unable to clear row from Blocked Banner Highlights: %{public}@ (%d)", (uint8_t *)&v9, 0x12u);

      }
    }
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_openDatabaseIfNeeded
{
  if (!self->_database)
    -[WBSBlockedHighlightsBannerSQLiteStore _openDatabase](self, "_openDatabase");
}

- (void)_openDatabase
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8081e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to open Blocked Banner Highlights SQLite store at %{private}@: %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_configureDatabase
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to enable write-ahead logging on Blocked Banner Highlights SQLite store at %{public}@: %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_createDatabaseSchemaIfNeeded
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to execute query when resetting database schema", v1, 2u);
}

- (int64_t)_schemaVersion
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intAtIndex:", 0);

  objc_msgSend(v2, "statement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  return v4;
}

- (void)closeDatabase
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSBlockedHighlightsBannerSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __54__WBSBlockedHighlightsBannerSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabaseOnDatabaseQueue");
}

- (void)_closeDatabaseOnDatabaseQueue
{
  WBSSQLiteDatabase *database;

  -[WBSSQLiteDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end
