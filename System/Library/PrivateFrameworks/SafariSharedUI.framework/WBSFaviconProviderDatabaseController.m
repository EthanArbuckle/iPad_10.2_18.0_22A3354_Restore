@implementation WBSFaviconProviderDatabaseController

- (int)_currentSchemaVersion
{
  return 4;
}

void __79__WBSFaviconProviderDatabaseController_fetchAllIconUUIDsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t v16;
  _BYTE v17[15];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<>(v3, CFSTR("SELECT uuid FROM page_url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "stringAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          objc_msgSend(v9, "stringAtIndex:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v11);

        }
        else
        {
          v12 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            __79__WBSFaviconProviderDatabaseController_fetchAllIconUUIDsWithCompletionHandler___block_invoke_cold_1(&v16, v17, v12);
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(v5, "statement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidate");

  v14 = *(_QWORD *)(a1 + 40);
  v15 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

}

- (void)fetchAllIconUUIDsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__WBSFaviconProviderDatabaseController_fetchAllIconUUIDsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441BC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int)_createFreshDatabaseSchema
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__WBSFaviconProviderDatabaseController__createFreshDatabaseSchema__block_invoke;
  v5[3] = &unk_1E5441A88;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "tryToPerformTransactionInBlock:", v5);

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v3;
}

BOOL __66__WBSFaviconProviderDatabaseController__createFreshDatabaseSchema__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, CFSTR("CREATE TABLE page_url (url TEXT NOT NULL ON CONFLICT FAIL UNIQUE ON CONFLICT REPLACE,uuid TEXT NOT NULL ON CONFLICT FAIL)"));

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 101)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("CREATE INDEX PageURLIndex ON page_url (url)"));

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 101)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v4, 0, CFSTR("CREATE TABLE icon_info (uuid TEXT PRIMARY KEY NOT NULL,url TEXT NOT NULL,timestamp INTEGER)"));

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 101)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, CFSTR("CREATE TABLE database_info (key TEXT PRIMARY KEY NOT NULL,value TEXT NOT NULL)"));

  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 101;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  void *v5;
  _QWORD v7[6];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[WBSSQLiteStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__WBSFaviconProviderDatabaseController__migrateToSchemaVersion___block_invoke;
  v7[3] = &unk_1E5442E60;
  v8 = a3;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v5, "tryToPerformTransactionInBlock:", v7);

  LODWORD(v5) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v5;
}

BOOL __64__WBSFaviconProviderDatabaseController__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  int v2;
  int v3;

  v2 = *(_DWORD *)(a1 + 48);
  if (v2 == 4 || v2 == 3 || v2 == 2)
    v3 = objc_msgSend(*(id *)(a1 + 32), "_migrateToSchemaVersion");
  else
    v3 = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 101;
}

- (int)_migrateToSchemaVersion_2
{
  void *v3;
  int v4;
  void *v5;

  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("ALTER TABLE icon_info ADD width INTEGER DEFAULT 0"));

  if (v4 == 101)
  {
    -[WBSSQLiteStore database](self, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, CFSTR("ALTER TABLE icon_info ADD height INTEGER DEFAULT 0"));

  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  void *v2;
  int v3;

  -[WBSSQLiteStore database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, CFSTR("ALTER TABLE icon_info ADD has_generated_representations INTEGER DEFAULT 0"));

  return v3;
}

- (int)_migrateToSchemaVersion_4
{
  void *v2;
  int v3;

  -[WBSSQLiteStore database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, CFSTR("CREATE TABLE rejected_resources (page_url TEXT NOT NULL ON CONFLICT FAIL,icon_url TEXT NOT NULL ON CONFLICT FAIL,timestamp INTEGER,UNIQUE(page_url, icon_url))"));

  return v3;
}

- (void)linkAndUpdateTimestampForIconWithPageURLString:(id)a3 iconURLString:(id)a4 iconSize:(CGSize)a5 iconHasGeneratedResolutions:(BOOL)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  BOOL v26;

  height = a5.height;
  width = a5.width;
  v13 = a3;
  v14 = a4;
  v15 = a7;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __156__WBSFaviconProviderDatabaseController_linkAndUpdateTimestampForIconWithPageURLString_iconURLString_iconSize_iconHasGeneratedResolutions_completionHandler___block_invoke;
  block[3] = &unk_1E5442EB0;
  block[4] = self;
  v21 = v13;
  v24 = width;
  v25 = height;
  v26 = a6;
  v22 = v14;
  v23 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  dispatch_async(v16, block);

}

void __156__WBSFaviconProviderDatabaseController_linkAndUpdateTimestampForIconWithPageURLString_iconURLString_iconSize_iconHasGeneratedResolutions_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  WBSFaviconProviderIconInfo *v8;
  WBSFaviconProviderIconInfo *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  objc_msgSend(*(id *)(a1 + 32), "_fetchIconUUIDForPageURLString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_fetchIconInfoForIconURLString:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  objc_msgSend(v3, "UUIDString");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v35 = objc_msgSend(v3, "hasGeneratedResolutions");
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __156__WBSFaviconProviderDatabaseController_linkAndUpdateTimestampForIconWithPageURLString_iconURLString_iconSize_iconHasGeneratedResolutions_completionHandler___block_invoke_16;
  v10[3] = &unk_1E5442E88;
  v14 = &v36;
  v15 = &v26;
  v10[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v18 = *(_OWORD *)(a1 + 64);
  v19 = *(_BYTE *)(a1 + 80);
  v11 = v5;
  v16 = &v32;
  v6 = v2;
  v12 = v6;
  v13 = *(id *)(a1 + 40);
  v17 = &v20;
  objc_msgSend(v4, "tryToPerformTransactionInBlock:", v10);

  v7 = *(_QWORD *)(a1 + 56);
  v8 = [WBSFaviconProviderIconInfo alloc];
  v9 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v8, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v37[5], v27[5], *((unsigned __int8 *)v33 + 24), 0, *(double *)(a1 + 64), *(double *)(a1 + 72));
  (*(void (**)(uint64_t, WBSFaviconProviderIconInfo *, uint64_t))(v7 + 16))(v7, v9, v21[5]);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

}

uint64_t __156__WBSFaviconProviderDatabaseController_linkAndUpdateTimestampForIconWithPageURLString_iconURLString_iconSize_iconHasGeneratedResolutions_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setTimestampToNowForIconUUID:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)) & 1) != 0)return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "_setIconUUID:forIconURLString:size:hasGeneratedResolutions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 112), *(double *)(a1 + 96), *(double *)(a1 + 104));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_BYTE *)(a1 + 112);
  }
  objc_msgSend(*(id *)(a1 + 32), "_deletePageURL:", *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 48) && (objc_msgSend(*(id *)(a1 + 32), "_hasPageURLsForIconUUID:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_deleteIconWithUUIDFromIconInfo:", *(_QWORD *)(a1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(id *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "_setPageURL:toIconUUID:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_deleteRejectedResourceForPageURLString:iconURLString:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return 1;
}

- (void)linkPageURLString:(id)a3 toExistingIconURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5441B28;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  objc_msgSend(*(id *)(a1 + 32), "_fetchIconUUIDForPageURLString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3;
  v32 = __Block_byref_object_dispose__3;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  objc_msgSend(*(id *)(a1 + 32), "_fetchIconInfoForIconURLString:", *(_QWORD *)(a1 + 48));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (!v23[5])
  {
    v9 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_cold_2(v9, v10, v11);
    v12 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_cold_1();
    goto LABEL_10;
  }
  if (!v2)
  {
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)v23[5], "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setPageURL:toIconUUID:", v14, v15);

    goto LABEL_10;
  }
  objc_msgSend((id)v23[5], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_19;
  v16[3] = &unk_1E5442ED8;
  v6 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v18 = v2;
  v20 = &v28;
  v21 = &v22;
  v19 = *(id *)(a1 + 48);
  objc_msgSend(v5, "tryToPerformTransactionInBlock:", v16);

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1, v29[5], v7, v8);
LABEL_11:
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

uint64_t __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_19(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_deletePageURL:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "_hasPageURLsForIconUUID:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_deleteIconWithUUIDFromIconInfo:", *(_QWORD *)(a1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 48));
  }
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setPageURL:toIconUUID:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "_deleteRejectedResourceForPageURLString:iconURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return 1;
}

- (void)removePageURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSFaviconProviderDatabaseController_removePageURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __78__WBSFaviconProviderDatabaseController_removePageURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__3;
  v7[4] = __Block_byref_object_dispose__3;
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__WBSFaviconProviderDatabaseController_removePageURLString_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5441B78;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = v7;
  objc_msgSend(v2, "tryToPerformTransactionInBlock:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(v7, 8);

}

uint64_t __78__WBSFaviconProviderDatabaseController_removePageURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_deleteRejectedResourceForPageURLString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_fetchIconUUIDForPageURLString:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_deletePageURL:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(a1 + 32), "_hasPageURLsForIconUUID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_deleteIconWithUUIDFromIconInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }
  }
  return 1;
}

- (void)removePageURLStrings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[32];
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5441B78;
  v4 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = &v12;
  objc_msgSend(v3, "tryToPerformTransactionInBlock:", v9);

  v5 = (id)WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_cold_2((uint64_t)v19, v5, v6, v7);
  }

  v8 = (id)WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_cold_1((uint64_t)v18, objc_msgSend((id)v13[5], "count"), objc_msgSend(*(id *)(a1 + 40), "count"), v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(&v12, 8);

}

uint64_t __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deleteRejectedResourceForPageURLStrings:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_fetchIconUUIDsForPageURLStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_deletePageURLs:", v8);

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_findOrphansFromIconUUIDs:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_deleteIconsWithUUIDsFromIconInfo:", v11);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v11);
    }

  }
  return 1;
}

- (void)removeAllDataForIconUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WBSFaviconProviderDatabaseController_removeAllDataForIconUUID_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __83__WBSFaviconProviderDatabaseController_removeAllDataForIconUUID_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_deletePageURLsWithUUIDFromPageInfo:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_deleteIconWithUUIDFromIconInfo:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeAllPageURLStringsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__WBSFaviconProviderDatabaseController_removeAllPageURLStringsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441BC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __85__WBSFaviconProviderDatabaseController_removeAllPageURLStringsWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllPageAndIconEntries");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchAllKnownPageURLStringsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__WBSFaviconProviderDatabaseController_fetchAllKnownPageURLStringsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5442F00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __89__WBSFaviconProviderDatabaseController_fetchAllKnownPageURLStringsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_fetchAllPageURLStrings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)iconInfoForPageURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WBSFaviconProviderDatabaseController_iconInfoForPageURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __83__WBSFaviconProviderDatabaseController_iconInfoForPageURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  WBSFaviconProviderIconInfo *v7;
  uint64_t v8;
  double v9;
  double v10;
  WBSFaviconProviderIconInfo *v11;
  id v12;

  v3 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_fetchIconUUIDForPageURLString:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v12 = (id)v4;
  if (v4)
  {
    objc_msgSend(*(id *)(v3 + 32), "_fetchIconInfoForIconUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(v3 + 48);
    if (v5)
    {
      v7 = [WBSFaviconProviderIconInfo alloc];
      v8 = *(_QWORD *)(v3 + 40);
      objc_msgSend(v5, "iconURLString");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateAdded");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      v11 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v7, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v8, v3, v1, v2, objc_msgSend(v5, "hasGeneratedResolutions"), objc_msgSend(v5, "isRejectedResource"), v9, v10);
    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(uint64_t, WBSFaviconProviderIconInfo *))(v6 + 16))(v6, v11);
    if (v5)
    {

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(v3 + 48) + 16))();
  }

}

- (void)iconInfoForIconURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WBSFaviconProviderDatabaseController_iconInfoForIconURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5441B50;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __83__WBSFaviconProviderDatabaseController_iconInfoForIconURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_fetchIconInfoForIconURLString:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)markRejectedIconAtPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__WBSFaviconProviderDatabaseController_markRejectedIconAtPageURLString_iconURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5441B28;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __104__WBSFaviconProviderDatabaseController_markRejectedIconAtPageURLString_iconURLString_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_deleteRejectedResourceForPageURLString:iconURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "_setRejectedResourceForPageURL:iconURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
}

- (void)markValidIconAtPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__WBSFaviconProviderDatabaseController_markValidIconAtPageURLString_iconURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5442F28;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

uint64_t __101__WBSFaviconProviderDatabaseController_markValidIconAtPageURLString_iconURLString_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "_deleteRejectedResourceForPageURLString:iconURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
}

- (void)rejectedResourceIconInfosForPageURLString:(id)a3 iconURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __114__WBSFaviconProviderDatabaseController_rejectedResourceIconInfosForPageURLString_iconURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5442F28;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __114__WBSFaviconProviderDatabaseController_rejectedResourceIconInfosForPageURLString_iconURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_fetchIconInfosForRejectedResourcesWithPageURLString:iconURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)firstIconUUIDMatchingPageURLStringIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSFaviconProviderDatabaseController_firstIconUUIDMatchingPageURLStringIn_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __95__WBSFaviconProviderDatabaseController_firstIconUUIDMatchingPageURLStringIn_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_firstIconUUIDForPageURLStrings:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)firstIconInfoMatchingPageURLStringIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingPageURLStringIn_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingPageURLStringIn_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingPageURLStringIn_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5442F50;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "_firstIconUUIDForPageURLStrings:completionHandler:", v3, v5);

}

void __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingPageURLStringIn_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  id v7;
  void *v8;
  uint64_t v9;
  WBSFaviconProviderIconInfo *v10;
  double v11;
  double v12;
  WBSFaviconProviderIconInfo *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchIconInfoForIconUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v10 = [WBSFaviconProviderIconInfo alloc];
      objc_msgSend(v8, "iconURLString");
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateAdded");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      v13 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v10, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v14, a1, v3, v4, objc_msgSend(v8, "hasGeneratedResolutions"), objc_msgSend(v8, "isRejectedResource"), v11, v12);
    }
    else
    {
      v13 = 0;
    }
    (*(void (**)(uint64_t, WBSFaviconProviderIconInfo *))(v9 + 16))(v9, v13);
    if (v8)
    {

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_firstIconUUIDForPageURLStrings:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[WBSFaviconProviderDatabaseController _fetchIconUUIDForPageURLString:](self, "_fetchIconUUIDForPageURLString:", v12, (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v7[2](v7, v12, v13);

          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  v7[2](v7, 0, 0);
LABEL_11:

}

- (void)firstIconInfoMatchingIconURLStringIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSFaviconProviderDatabaseController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingIconURLStringIn_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __95__WBSFaviconProviderDatabaseController_firstIconInfoMatchingIconURLStringIn_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_fetchIconInfoForIconURLString:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          return;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchPageURLStringsWithPrefixesIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSFaviconProviderDatabaseController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__WBSFaviconProviderDatabaseController_fetchPageURLStringsWithPrefixesIn_completionHandler___block_invoke;
  block[3] = &unk_1E5442FB8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __92__WBSFaviconProviderDatabaseController_fetchPageURLStringsWithPrefixesIn_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "safari_mapObjectsUsingBlock:", &__block_literal_global_10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v7 = v2;
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" OR "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_fetchPageURLStringsWithPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

}

id __92__WBSFaviconProviderDatabaseController_fetchPageURLStringsWithPrefixesIn_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("url LIKE \"%@%%\"), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_fetchIconUUIDForPageURLString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  v10 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, CFSTR("SELECT uuid FROM page_url WHERE url = ?"), &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "statement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  return v7;
}

- (id)_fetchIconUUIDsForPageURLStrings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__WBSFaviconProviderDatabaseController__fetchIconUUIDsForPageURLStrings___block_invoke;
  v8[3] = &unk_1E5442FE0;
  v6 = v5;
  v9 = v6;
  -[WBSFaviconProviderDatabaseController _generateStatementsForQuery:arguments:statementCallback:](self, "_generateStatementsForQuery:arguments:statementCallback:", CFSTR("SELECT uuid FROM page_url WHERE url IN"), v4, v8);

  return v6;
}

void __73__WBSFaviconProviderDatabaseController__fetchIconUUIDsForPageURLStrings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "fetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      break;
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v4, "stringAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  objc_msgSend(v8, "invalidate");

}

- (id)_fetchIconInfoForIconURLString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  WBSFaviconProviderIconInfo *v14;
  WBSFaviconProviderIconInfo *v15;
  id v17;

  v17 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, CFSTR("SELECT uuid, timestamp, width, height, has_generated_representations FROM icon_info WHERE url = ?"), &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "doubleAtIndex:", 1);
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "intAtIndex:", 2);
  v11 = objc_msgSend(v6, "intAtIndex:", 3);
  v12 = objc_msgSend(v6, "BOOLAtIndex:", 4);
  objc_msgSend(v5, "statement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidate");

  if (v7)
  {
    v14 = [WBSFaviconProviderIconInfo alloc];
    v15 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v14, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", 0, v17, v7, v9, v12, 0, (double)v10, (double)v11);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_fetchIconInfoForIconUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  WBSFaviconProviderIconInfo *v14;
  WBSFaviconProviderIconInfo *v15;
  id v17;

  v17 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, CFSTR("SELECT url, timestamp, width, height, has_generated_representations FROM icon_info WHERE uuid = ?"), &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "doubleAtIndex:", 1);
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "intAtIndex:", 2);
  v11 = objc_msgSend(v6, "intAtIndex:", 3);
  v12 = objc_msgSend(v6, "BOOLAtIndex:", 4);
  objc_msgSend(v5, "statement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidate");

  if (v7)
  {
    v14 = [WBSFaviconProviderIconInfo alloc];
    v15 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v14, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", 0, v7, v17, v9, v12, 0, (double)v10, (double)v11);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_fetchIconInfosForRejectedResourcesWithPageURLString:(id)a3 iconURLString:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  double *v9;
  void *v10;
  void *v11;
  void *v12;
  WBSFaviconProviderIconInfo *v13;
  WBSFaviconProviderIconInfo *v14;
  void *v15;
  id v17;
  id v18;

  v18 = a3;
  v17 = a4;
  -[WBSSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&,NSString * {__strong}&>(v6, CFSTR("SELECT timestamp FROM rejected_resources WHERE icon_url = ? OR page_url = ?"), &v17, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double *)MEMORY[0x1E0C9D820];
  while (1)
  {
    objc_msgSend(v7, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      break;
    objc_msgSend(v10, "doubleAtIndex:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [WBSFaviconProviderIconInfo alloc];
    v14 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:](v13, "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", v18, v17, 0, v12, 0, 1, *v9, v9[1]);
    objc_msgSend(v8, "addObject:", v14);

  }
  objc_msgSend(v7, "statement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

  return v8;
}

- (id)_fetchAllPageURLStrings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WBSSQLiteStore database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<>(v2, CFSTR("SELECT url FROM page_url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "stringAtIndex:", 0, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v5, "statement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  return v4;
}

- (id)_fetchPageURLStringsWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SELECT url FROM page_url WHERE "), "stringByAppendingString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<>(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "stringAtIndex:", 0, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v9, "statement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

  return v5;
}

- (id)_findOrphansFromIconUUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__WBSFaviconProviderDatabaseController__findOrphansFromIconUUIDs___block_invoke;
  v10[3] = &unk_1E5442FE0;
  v6 = v5;
  v11 = v6;
  -[WBSFaviconProviderDatabaseController _generateStatementsForQuery:arguments:statementCallback:](self, "_generateStatementsForQuery:arguments:statementCallback:", CFSTR("SELECT uuid FROM page_url WHERE uuid IN"), v4, v10);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v6);
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __66__WBSFaviconProviderDatabaseController__findOrphansFromIconUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "fetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      break;
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v4, "stringAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  objc_msgSend(v8, "invalidate");

}

- (void)_setPageURL:(id)a3 toIconUUID:(id)a4
{
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v10 = a4;
  -[WBSSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v6, 0, CFSTR("INSERT INTO page_url (url, uuid) VALUES (?, ?)"), &v11, &v10);

  if (v7 != 101)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _setPageURL:toIconUUID:].cold.1();
    v9 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      v13 = v11;
      v14 = 2113;
      v15 = v10;
      v16 = 1024;
      v17 = v7;
      _os_log_debug_impl(&dword_1A840B000, v9, OS_LOG_TYPE_DEBUG, "Failed to set page url: %{private}@ to icon UUID: %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }

}

- (id)_setIconUUID:(id)a3 forIconURLString:(id)a4 size:(CGSize)a5 hasGeneratedResolutions:(BOOL)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v16;
  id v17;
  id v18;
  CGSize v19;
  _BYTE buf[12];
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a5;
  v18 = a3;
  v17 = a4;
  v16 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  *(_QWORD *)buf = v11;
  v12 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&,double,double &,double &,BOOL &>(v10, 0, CFSTR("REPLACE INTO icon_info (uuid, url, timestamp, width, height, has_generated_representations) VALUES (?, ?, ?, ?, ?, ?)"), &v18, &v17, (double *)buf, &v19.width, &v19.height, (unsigned __int8 *)&v16);

  if (v12 != 101)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _setIconUUID:forIconURLString:size:hasGeneratedResolutions:].cold.1();
    v14 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      *(_QWORD *)&buf[4] = v18;
      v21 = 2113;
      v22 = v17;
      v23 = 1024;
      v24 = v12;
      _os_log_debug_impl(&dword_1A840B000, v14, OS_LOG_TYPE_DEBUG, "Failed to set icon UUID: %{private}@ for icon url: %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }

  return v9;
}

- (id)_setTimestampToNowForIconUUID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v9 = v6;
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,NSString * {__strong}&>(v5, 0, CFSTR("UPDATE icon_info SET timestamp=? WHERE uuid=?"), (double *)&v9, &v10);

  if ((_DWORD)self != 101)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _setTimestampToNowForIconUUID:].cold.1();
  }

  return v4;
}

- (BOOL)_setRejectedResourceForPageURL:(id)a3 iconURLString:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  id v14;
  _BYTE buf[12];
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v13 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  *(_QWORD *)buf = v8;
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&,double>(v7, 0, CFSTR("REPLACE INTO rejected_resources (page_url, icon_url, timestamp) VALUES (?, ?, ?)"), &v14, &v13, (double *)buf);

  if (v9 != 101)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _setRejectedResourceForPageURL:iconURLString:].cold.1();
    v11 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      *(_QWORD *)&buf[4] = v14;
      v16 = 2113;
      v17 = v13;
      v18 = 1024;
      v19 = v9;
      _os_log_debug_impl(&dword_1A840B000, v11, OS_LOG_TYPE_DEBUG, "Failed to set rejected resource for page url %{private}@ and icon url %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }

  return v9 == 101;
}

- (void)_deletePageURL:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, CFSTR("DELETE FROM page_url WHERE url = ?"), &v7);

  if ((_DWORD)self != 101)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _deletePageURL:].cold.2();
    v6 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[WBSFaviconProviderDatabaseController _deletePageURL:].cold.1();
  }

}

- (void)_deletePageURLs:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke;
  v6[3] = &unk_1E5442FE0;
  v7 = v4;
  v5 = v4;
  -[WBSFaviconProviderDatabaseController _generateStatementsForQuery:arguments:statementCallback:](self, "_generateStatementsForQuery:arguments:statementCallback:", CFSTR("DELETE FROM page_url WHERE url IN"), v5, v6);

}

void __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;

  v2 = a2;
  if (objc_msgSend(v2, "execute") != 101)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke_cold_2();
    v4 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke_cold_1();
  }
  objc_msgSend(v2, "invalidate");

}

- (BOOL)_deleteRejectedResourceForPageURLString:(id)a3 iconURLString:(id)a4
{
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v11 = a4;
  -[WBSSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v6, 0, CFSTR("DELETE FROM rejected_resources WHERE page_url = ? AND icon_url = ?"), &v12, &v11);

  if (v7 != 101)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _deleteRejectedResourceForPageURLString:iconURLString:].cold.1();
    v9 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      v14 = v12;
      v15 = 2113;
      v16 = v11;
      v17 = 1024;
      v18 = v7;
      _os_log_debug_impl(&dword_1A840B000, v9, OS_LOG_TYPE_DEBUG, "Failed to reset rejected resource for page url %{private}@, icon url %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }

  return v7 == 101;
}

- (void)_deleteRejectedResourceForPageURLString:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, CFSTR("DELETE FROM rejected_resources WHERE page_url = ?"), &v7);

  if ((_DWORD)self != 101)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _deleteRejectedResourceForPageURLString:].cold.2();
    v6 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[WBSFaviconProviderDatabaseController _deleteRejectedResourceForPageURLString:].cold.1();
  }

}

- (void)_deleteRejectedResourceForPageURLStrings:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke;
  v6[3] = &unk_1E5442FE0;
  v7 = v4;
  v5 = v4;
  -[WBSFaviconProviderDatabaseController _generateStatementsForQuery:arguments:statementCallback:](self, "_generateStatementsForQuery:arguments:statementCallback:", CFSTR("DELETE FROM rejected_resources WHERE page_url IN"), v5, v6);

}

void __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;

  v2 = a2;
  if (objc_msgSend(v2, "execute") != 101)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke_cold_2();
    v4 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke_cold_1();
  }
  objc_msgSend(v2, "invalidate");

}

- (BOOL)_hasPageURLsForIconUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v8;

  v8 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, CFSTR("SELECT EXISTS(SELECT 1 FROM page_url WHERE uuid = ?)"), &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "int64AtIndex:", 0) == 1;
  return (char)v4;
}

- (void)_deletePageURLsWithUUIDFromPageInfo:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;

  v6 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, CFSTR("DELETE FROM page_url WHERE uuid = ?"), &v6);

  if ((_DWORD)self != 101)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _deletePageURLsWithUUIDFromPageInfo:].cold.1();
  }

}

- (void)_deleteIconWithUUIDFromIconInfo:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;

  v6 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, CFSTR("DELETE FROM icon_info WHERE uuid = ?"), &v6);

  if ((_DWORD)self != 101)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProviderDatabaseController _deleteIconWithUUIDFromIconInfo:].cold.1();
  }

}

- (void)_deleteIconsWithUUIDsFromIconInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__WBSFaviconProviderDatabaseController__deleteIconsWithUUIDsFromIconInfo___block_invoke;
  v6[3] = &unk_1E5442FE0;
  v7 = v4;
  v5 = v4;
  -[WBSFaviconProviderDatabaseController _generateStatementsForQuery:arguments:statementCallback:](self, "_generateStatementsForQuery:arguments:statementCallback:", CFSTR("DELETE FROM icon_info WHERE uuid IN"), v5, v6);

}

void __74__WBSFaviconProviderDatabaseController__deleteIconsWithUUIDsFromIconInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "execute") != 101)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXFaviconDatabase();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __74__WBSFaviconProviderDatabaseController__deleteIconsWithUUIDsFromIconInfo___block_invoke_cold_1();
  }
  objc_msgSend(v2, "invalidate");

}

- (void)_deleteAllPageAndIconEntries
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to delete all from icon_info table. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_generateStatementsForQuery:(id)a3 arguments:(id)a4 statementCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  WBSFaviconProviderDatabaseController *v19;
  id v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "count");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke;
  v16[3] = &unk_1E5443030;
  v13 = v11;
  v17 = v13;
  v21 = v12;
  v15 = v8;
  v18 = v15;
  v19 = self;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);

}

void __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if (__ROR8__(0x1CAC083126E978D5 * (a3 - 499), 2) < 0x83126E978D4FDFuLL || *(_QWORD *)(a1 + 64) - 1 == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ ("), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke_2;
    v16[3] = &unk_1E5443008;
    v13 = v5;
    v17 = v13;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);
    objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length") - 1, 1, CFSTR(")"));
    v8 = objc_alloc(MEMORY[0x1E0D8A1B8]);
    objc_msgSend(*(id *)(a1 + 48), "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDatabase:query:", v9, v13);

    v11 = *(void **)(a1 + 32);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke_3;
    v14[3] = &unk_1E5443008;
    v12 = v10;
    v15 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("?%lu,"), a3 + 1);
}

uint64_t __96__WBSFaviconProviderDatabaseController__generateStatementsForQuery_arguments_statementCallback___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "bindString:atParameterIndex:", a2, a3 + 1);
}

void __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_cold_1()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  v1 = *v0;
  v4 = 138478083;
  v5 = v2;
  v6 = 2113;
  v7 = v1;
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, v3, (uint64_t)v3, "Failed to link page url: %{private}@ to icon url: %{private}@, no icon uuid could be found.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __100__WBSFaviconProviderDatabaseController_linkPageURLString_toExistingIconURLString_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_5(&dword_1A840B000, a1, a3, "Failed to link page url icon url; no icon uuid could be found.", v3);
  OUTLINED_FUNCTION_3();
}

void __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, a4, a3, "Removed %lu orphaned uuids for %lu url strings", (uint8_t *)a1);
}

void __79__WBSFaviconProviderDatabaseController_removePageURLStrings_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  *(_DWORD *)a1 = 136446466;
  *(_QWORD *)(a1 + 4) = "remove_pageurls";
  *(_WORD *)(a1 + 12) = 2048;
  *(double *)(a1 + 14) = -a4;
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, a2, a3, "#perf - %{public}s: %f", (uint8_t *)a1);
}

void __79__WBSFaviconProviderDatabaseController_fetchAllIconUUIDsWithCompletionHandler___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_5(&dword_1A840B000, a3, (uint64_t)a3, "Empty UUID found in page_url table", a1);
}

- (void)_setPageURL:toIconUUID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to set page url to icon UUID: %{private}@. Error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_setIconUUID:forIconURLString:size:hasGeneratedResolutions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to set icon UUID: %{private}@ for icon url, error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_setTimestampToNowForIconUUID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to update timestamp for icon UUID: %{private}@. Error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_setRejectedResourceForPageURL:iconURLString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to set rejected resource for page and icon url. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deletePageURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_4(&dword_1A840B000, v0, v1, "Failed to delete page url: %{private}@. Error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_deletePageURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to delete page url. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_4(&dword_1A840B000, v0, v1, "Failed to delete page urls: %{private}@. Error code: %d");
  OUTLINED_FUNCTION_1();
}

void __56__WBSFaviconProviderDatabaseController__deletePageURLs___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to delete page urls. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deleteRejectedResourceForPageURLString:iconURLString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to reset rejected resource for page and icon urls. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deleteRejectedResourceForPageURLString:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_4(&dword_1A840B000, v0, v1, "Failed to delete page url: %{private}@ from rejected resources. Error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_deleteRejectedResourceForPageURLString:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to delete page url from rejected resources. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_4(&dword_1A840B000, v0, v1, "Failed to delete page urls: %{private}@ from rejected resources. Error code: %d");
  OUTLINED_FUNCTION_1();
}

void __81__WBSFaviconProviderDatabaseController__deleteRejectedResourceForPageURLStrings___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to delete page urls from rejected resources. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deletePageURLsWithUUIDFromPageInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to delete page urls with with uuid: %@. Error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_deleteIconWithUUIDFromIconInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to delete icon with uuid: %{private}@. Error code: %d");
  OUTLINED_FUNCTION_1();
}

void __74__WBSFaviconProviderDatabaseController__deleteIconsWithUUIDsFromIconInfo___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to delete icons with uuids: %{private}@. Error code: %d");
  OUTLINED_FUNCTION_1();
}

@end
