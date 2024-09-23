@implementation WBSIgnoredSiriSuggestedSitesDatabaseController

+ (unint64_t)thresholdForHidingIgnoredSiriSuggestedSites
{
  if (+[WBSIgnoredSiriSuggestedSitesDatabaseController thresholdForHidingIgnoredSiriSuggestedSites]::onceToken != -1)
    dispatch_once(&+[WBSIgnoredSiriSuggestedSitesDatabaseController thresholdForHidingIgnoredSiriSuggestedSites]::onceToken, &__block_literal_global_70);
  return +[WBSIgnoredSiriSuggestedSitesDatabaseController thresholdForHidingIgnoredSiriSuggestedSites]::thresholdForHidingIgnoredSiriSuggestedSites;
}

void __93__WBSIgnoredSiriSuggestedSitesDatabaseController_thresholdForHidingIgnoredSiriSuggestedSites__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  +[WBSResultRanker searchParameters](WBSResultRanker, "searchParameters");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "thresholdForHidingIgnoredSiriSuggestedSites");

  v2 = 3;
  if ((unint64_t)(v1 + 1) >= 2)
    v2 = v1;
  +[WBSIgnoredSiriSuggestedSitesDatabaseController thresholdForHidingIgnoredSiriSuggestedSites]::thresholdForHidingIgnoredSiriSuggestedSites = v2;
}

- (int)_currentSchemaVersion
{
  return 3;
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
  v5[2] = __76__WBSIgnoredSiriSuggestedSitesDatabaseController__createFreshDatabaseSchema__block_invoke;
  v5[3] = &unk_1E4B3C9E0;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "tryToPerformTransactionInBlock:", v5);

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v3;
}

BOOL __76__WBSIgnoredSiriSuggestedSitesDatabaseController__createFreshDatabaseSchema__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, CFSTR("CREATE TABLE ignored_siri_suggested_sites (id TEXT PRIMARY KEY NOT NULL,url TEXT NOT NULL,query TEXT NOT NULL,profile TEXT NOT NULL,timestamp REAL NOT NULL)"));

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
  v7[2] = __74__WBSIgnoredSiriSuggestedSitesDatabaseController__migrateToSchemaVersion___block_invoke;
  v7[3] = &unk_1E4B3CA08;
  v8 = a3;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v5, "tryToPerformTransactionInBlock:", v7);

  LODWORD(v5) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v5;
}

BOOL __74__WBSIgnoredSiriSuggestedSitesDatabaseController__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  int v2;
  int v3;

  v2 = *(_DWORD *)(a1 + 48);
  if (v2 == 3 || v2 == 2)
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
  void *v6;

  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("DELETE FROM ignored_siri_suggested_sites"));

  if (v4 == 101)
  {
    -[WBSSQLiteStore database](self, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, CFSTR("ALTER TABLE ignored_siri_suggested_sites RENAME COLUMN url TO siriSuggestedSiteURL"));

    if (v4 == 101)
    {
      -[WBSSQLiteStore database](self, "database");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, CFSTR("ALTER TABLE ignored_siri_suggested_sites ADD visitedURL TEXT"));

    }
  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  void *v3;
  int v4;
  void *v5;

  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("DROP TABLE ignored_siri_suggested_sites"));

  if (v4 == 101)
  {
    -[WBSSQLiteStore database](self, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, CFSTR("CREATE TABLE ignored_siri_suggested_sites (id TEXT PRIMARY KEY NOT NULL,siriSuggestedSiteURL TEXT NOT NULL,query TEXT NOT NULL,profile TEXT NOT NULL,timestamp REAL NOT NULL,visitedURL TEXT,ignoreCount INTEGER NOT NULL,UNIQUE (siriSuggestedSiteURL, query, profile))"));

  }
  return v4;
}

- (void)addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__WBSIgnoredSiriSuggestedSitesDatabaseController_addIgnoredSiriSuggestedSiteWithURLString_inProfile_withQuery_visitedURLString___block_invoke;
  block[3] = &unk_1E4B3C168;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __128__WBSIgnoredSiriSuggestedSitesDatabaseController_addIgnoredSiriSuggestedSiteWithURLString_inProfile_withQuery_visitedURLString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addIgnoredSiriSuggestedSiteWithURLString:inProfile:withQuery:visitedURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5
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
  v15[2] = __126__WBSIgnoredSiriSuggestedSitesDatabaseController_updateTimestampsOfIgnoredSiriSuggestedSitesInProfile_query_visitedURLString___block_invoke;
  v15[3] = &unk_1E4B399F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __126__WBSIgnoredSiriSuggestedSitesDatabaseController_updateTimestampsOfIgnoredSiriSuggestedSitesInProfile_query_visitedURLString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:query:visitedURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4
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
  block[2] = __101__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_afterDate___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __101__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_afterDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeIgnoredSiriSuggestedSitesInProfile:afterDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4
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
  block[2] = __97__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_query___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __97__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_query___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeIgnoredSiriSuggestedSitesInProfile:query:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4
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
  block[2] = __106__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_visitedURLHost___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __106__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesInProfile_visitedURLHost___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeIgnoredSiriSuggestedSitesInProfile:visitedURLHost:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4
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
  block[2] = __103__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesWithURLHost_inProfile___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __103__WBSIgnoredSiriSuggestedSitesDatabaseController_removeIgnoredSiriSuggestedSitesWithURLHost_inProfile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeIgnoredSiriSuggestedSitesWithURLHost:inProfile:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  WBSIgnoredSiriSuggestedSitesDatabaseController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __126__WBSIgnoredSiriSuggestedSitesDatabaseController_getIgnoredSiriSuggestedSitesURLStringsInProfile_withQuery_completionHandler___block_invoke;
  v15[3] = &unk_1E4B3B458;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __126__WBSIgnoredSiriSuggestedSitesDatabaseController_getIgnoredSiriSuggestedSitesURLStringsInProfile_withQuery_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_getIgnoredSiriSuggestedSitesURLStringsInProfile:withQuery:", *(_QWORD *)(a1 + 48), v1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);

}

- (void)pruneIgnoredSiriSuggestedSites
{
  NSObject *v3;
  _QWORD block[5];

  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__WBSIgnoredSiriSuggestedSitesDatabaseController_pruneIgnoredSiriSuggestedSites__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __80__WBSIgnoredSiriSuggestedSitesDatabaseController_pruneIgnoredSiriSuggestedSites__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_dateAtWhichIgnoredSiriSuggestedSitesArePruned");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_removeIgnoredSiriSuggestedSitesBeforeDate:");

}

- (id)_dateAtWhichIgnoredSiriSuggestedSitesArePruned
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -2592000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v26 = a4;
  v25 = a5;
  v10 = a6;
  v24 = v10;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v14 = v13;

    v23 = v14;
    -[WBSSQLiteStore database](self, "database");
    if (v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 1;
      v17 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong}&,NSString * {__strong}&,NSString * {__strong}&,double &,NSString * {__strong}&,int,double &,NSString * {__strong}&>(v15, 0, CFSTR("INSERT INTO ignored_siri_suggested_sites (id, siriSuggestedSiteURL, query, profile, timestamp, visitedURL, ignoreCount) VALUES (?, ?, ?, ?, ?, ?, ?) ON CONFLICT(siriSuggestedSiteURL, query, profile) DO UPDATE SET timestamp=?, visitedURL = ?, ignoreCount=ignoreCount + 1"), &v22, &v27, &v25, &v26, (double *)&v23, &v24, (unsigned int *)buf, (double *)&v23, &v24);
      v18 = &v22;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v21 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 1;
      v17 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong}&,NSString * {__strong}&,NSString * {__strong}&,double &,int,double &>(v15, 0, CFSTR("INSERT INTO ignored_siri_suggested_sites (id, siriSuggestedSiteURL, query, profile, timestamp, ignoreCount) VALUES (?, ?, ?, ?, ?, ?) ON CONFLICT(siriSuggestedSiteURL, query, profile) DO UPDATE SET timestamp=?, visitedURL = NULL, ignoreCount=ignoreCount + 1"), &v21, &v27, &v25, &v26, (double *)&v23, (unsigned int *)buf, (double *)&v23);
      v18 = &v21;
    }

    if (v17 != 101)
    {
      v20 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138740739;
        v29 = v27;
        v30 = 2117;
        v31 = v25;
        v32 = 2117;
        v33 = v26;
        v34 = 1024;
        v35 = v17;
        _os_log_error_impl(&dword_1A3D90000, v20, OS_LOG_TYPE_ERROR, "Failed to insert an ignored suggested site with siriSuggestedSiteURL: %{sensitive}@ query: %{sensitive}@ profile: %{sensitive}@. Error code: %d", buf, 0x26u);
      }
    }
    v10 = v24;
  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      v29 = v27;
      v30 = 2117;
      v31 = v25;
      v32 = 2117;
      v33 = v26;
      _os_log_error_impl(&dword_1A3D90000, v19, OS_LOG_TYPE_ERROR, "Unable to insert an ignored suggested site, due to an invalid URL: %{sensitive}@ query: %{sensitive}@ profile: %{sensitive}@.", buf, 0x20u);
    }
  }

}

- (void)_updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _BYTE buf[12];
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v14 = a4;
  v13 = a5;
  -[WBSSQLiteStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  *(_QWORD *)buf = v10;
  v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,NSString * {__strong}&,NSString * {__strong}&,NSString * {__strong}&>(v8, 0, CFSTR("UPDATE ignored_siri_suggested_sites SET timestamp = ?, visitedURL = ? WHERE profile = ? AND query = ?"), (double *)buf, &v13, &v15, &v14);

  if (v11 != 101)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478339;
      *(_QWORD *)&buf[4] = v15;
      v17 = 2113;
      v18 = v14;
      v19 = 1024;
      v20 = v11;
      _os_log_error_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_ERROR, "Failed to update the timestamps of ignored suggested sites with profile: %{private}@ and query = %{private}@. Error code: %d", buf, 0x1Cu);
    }
  }

}

- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  _BYTE buf[12];
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = a4;
  -[WBSSQLiteStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  *(_QWORD *)buf = v8;
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,double>(v7, 0, CFSTR("DELETE FROM ignored_siri_suggested_sites WHERE profile = ? AND timestamp > ?"), &v13, (double *)buf);

  if (v9 != 101)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v13;
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 138740483;
      *(_QWORD *)&buf[4] = v11;
      v15 = 2053;
      v16 = v12;
      v17 = 1024;
      v18 = v9;
      _os_log_error_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites with profile: %{sensitive}@ and timestamp > %{sensitive}f. Error code: %d", buf, 0x1Cu);
    }

  }
}

- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4
{
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v9 = a4;
  -[WBSSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v6, 0, CFSTR("DELETE FROM ignored_siri_suggested_sites WHERE profile = ? AND query = ?"), &v10, &v9);

  if (v7 != 101)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      v12 = v10;
      v13 = 2117;
      v14 = v9;
      v15 = 1024;
      v16 = v7;
      _os_log_error_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites with profile: %{sensitive}@ and query = %{sensitive}@. Error code: %d", buf, 0x1Cu);
    }
  }

}

- (void)_removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
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
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM ignored_siri_suggested_sites WHERE profile = ? AND visitedURL LIKE '%%%@%%'"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v8, 0, v7, &v11);

  if (v9 != 101)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      v13 = v11;
      v14 = 2117;
      v15 = v6;
      v16 = 1024;
      v17 = v9;
      _os_log_error_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites with profile: %{sensitive}@ and visited URL host = %{sensitive}@. Error code: %d", buf, 0x1Cu);
    }
  }

}

- (void)_removeIgnoredSiriSuggestedSitesBeforeDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  int v7;
  NSObject *v8;
  double v9;
  double v10[4];

  v10[3] = *(double *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSSQLiteStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v10[0] = v6;
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double>(v5, 0, CFSTR("DELETE FROM ignored_siri_suggested_sites WHERE timestamp < ?"), v10);

  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      -[WBSIgnoredSiriSuggestedSitesDatabaseController _removeIgnoredSiriSuggestedSitesBeforeDate:].cold.1((uint8_t *)v10, v7, v8, v9);
    }

  }
}

- (void)_removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM ignored_siri_suggested_sites WHERE profile = ? AND siriSuggestedSiteURL LIKE '%%://%@/%%'"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v8, 0, v7, &v11);

  if (v9 != 101)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      v13 = v11;
      v14 = 2117;
      v15 = v6;
      v16 = 1024;
      v17 = v9;
      _os_log_error_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites with profile: %{sensitive}@ and host: %{sensitive}@. Error code: %d", buf, 0x1Cu);
    }
  }

}

- (id)_getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v20 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT siriSuggestedSiteURL, ignoreCount FROM ignored_siri_suggested_sites WHERE profile = ? AND query LIKE '%@%%'"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v7, v21, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "stringAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v12, "intAtIndex:", 1);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15 + (int)v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v13);

        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = objc_msgSend(v17, "unsignedIntValue");
        LOBYTE(v15) = objc_msgSend((id)objc_opt_class(), "thresholdForHidingIgnoredSiriSuggestedSites") > (unint64_t)v14;

        if ((v15 & 1) == 0)
          objc_msgSend(v22, "addObject:", v13);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  objc_msgSend(obj, "statement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "invalidate");

  return v22;
}

- (void)_removeIgnoredSiriSuggestedSitesBeforeDate:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log, double a4)
{
  *(_DWORD *)buf = 134545921;
  *(double *)(buf + 4) = a4;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to delete the ignored suggested sites where timestamp < %{sensitive}f. Error code: %d", buf, 0x12u);
}

@end
