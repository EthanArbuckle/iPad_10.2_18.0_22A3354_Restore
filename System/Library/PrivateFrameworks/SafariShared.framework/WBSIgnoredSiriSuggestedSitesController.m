@implementation WBSIgnoredSiriSuggestedSitesController

+ (id)_databaseURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_settingsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("IgnoredSiriSuggestedSites.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (WBSIgnoredSiriSuggestedSitesController)sharedController
{
  if (+[WBSIgnoredSiriSuggestedSitesController sharedController]::onceToken != -1)
    dispatch_once(&+[WBSIgnoredSiriSuggestedSitesController sharedController]::onceToken, &__block_literal_global_69);
  return (WBSIgnoredSiriSuggestedSitesController *)(id)+[WBSIgnoredSiriSuggestedSitesController sharedController]::controller;
}

void __58__WBSIgnoredSiriSuggestedSitesController_sharedController__block_invoke()
{
  WBSIgnoredSiriSuggestedSitesController *v0;
  void *v1;

  v0 = -[WBSIgnoredSiriSuggestedSitesController initWithDatabaseURL:]([WBSIgnoredSiriSuggestedSitesController alloc], "initWithDatabaseURL:", 0);
  v1 = (void *)+[WBSIgnoredSiriSuggestedSitesController sharedController]::controller;
  +[WBSIgnoredSiriSuggestedSitesController sharedController]::controller = (uint64_t)v0;

}

- (WBSIgnoredSiriSuggestedSitesController)initWithDatabaseURL:(id)a3
{
  id v4;
  WBSIgnoredSiriSuggestedSitesController *v5;
  WBSIgnoredSiriSuggestedSitesDatabaseController *v6;
  void *v7;
  uint64_t v8;
  WBSIgnoredSiriSuggestedSitesDatabaseController *databaseController;
  WBSIgnoredSiriSuggestedSitesDatabaseController *v10;
  WBSIgnoredSiriSuggestedSitesController *v11;
  WBSIgnoredSiriSuggestedSitesController *v12;
  _QWORD v14[4];
  id v15;
  WBSIgnoredSiriSuggestedSitesController *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSIgnoredSiriSuggestedSitesController;
  v5 = -[WBSIgnoredSiriSuggestedSitesController init](&v17, sel_init);
  if (v5)
  {
    v6 = [WBSIgnoredSiriSuggestedSitesDatabaseController alloc];
    v7 = v4;
    if (!v4)
    {
      objc_msgSend((id)objc_opt_class(), "_databaseURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = -[WBSSQLiteStore initWithURL:](v6, "initWithURL:", v7);
    databaseController = v5->_databaseController;
    v5->_databaseController = (WBSIgnoredSiriSuggestedSitesDatabaseController *)v8;

    if (!v4)
    v10 = v5->_databaseController;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__WBSIgnoredSiriSuggestedSitesController_initWithDatabaseURL___block_invoke;
    v14[3] = &unk_1E4B3C998;
    v15 = v4;
    v11 = v5;
    v16 = v11;
    -[WBSSQLiteStore openAndCheckIntegrity:createIfNeeded:fallBackToMemoryStoreIfError:lockingPolicy:completionHandler:](v10, "openAndCheckIntegrity:createIfNeeded:fallBackToMemoryStoreIfError:lockingPolicy:completionHandler:", 1, 1, 0, 0, v14);
    v12 = v11;

  }
  return v5;
}

void __62__WBSIgnoredSiriSuggestedSitesController_initWithDatabaseURL___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v5;
      if (!v5)
      {
        objc_msgSend((id)objc_opt_class(), "_databaseURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = 134218243;
      v8 = a2;
      v9 = 2117;
      v10 = v6;
      _os_log_error_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_ERROR, "Failed to open the ignored suggested sites database. Error code: %ld URL: %{sensitive}@", (uint8_t *)&v7, 0x16u);
      if (!v5)

    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[WBSIgnoredSiriSuggestedSitesController _pruneIgnoredSiriSuggestedSitesIfNeeded](self, "_pruneIgnoredSiriSuggestedSitesIfNeeded");
  -[WBSSQLiteStore savePendingChangesBeforeTermination](self->_databaseController, "savePendingChangesBeforeTermination");
  v3.receiver = self;
  v3.super_class = (Class)WBSIgnoredSiriSuggestedSitesController;
  -[WBSIgnoredSiriSuggestedSitesController dealloc](&v3, sel_dealloc);
}

- (id)databaseController
{
  -[WBSIgnoredSiriSuggestedSitesController _pruneIgnoredSiriSuggestedSitesIfNeeded](self, "_pruneIgnoredSiriSuggestedSitesIfNeeded");
  return self->_databaseController;
}

- (void)addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[WBSIgnoredSiriSuggestedSitesController databaseController](self, "databaseController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addIgnoredSiriSuggestedSiteWithURLString:inProfile:withQuery:visitedURLString:", v14, v10, v11, v12);

}

- (void)updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[WBSIgnoredSiriSuggestedSitesController databaseController](self, "databaseController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:query:visitedURLString:", v11, v8, v9);

}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSIgnoredSiriSuggestedSitesController removeIgnoredSiriSuggestedSitesInProfile:afterDate:](self, "removeIgnoredSiriSuggestedSitesInProfile:afterDate:", v5, v4);

}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[WBSIgnoredSiriSuggestedSitesController databaseController](self, "databaseController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeIgnoredSiriSuggestedSitesInProfile:afterDate:", v8, v6);

}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[WBSIgnoredSiriSuggestedSitesController databaseController](self, "databaseController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeIgnoredSiriSuggestedSitesInProfile:query:", v8, v6);

}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[WBSIgnoredSiriSuggestedSitesController databaseController](self, "databaseController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeIgnoredSiriSuggestedSitesInProfile:visitedURLHost:", v8, v6);

}

- (void)removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[WBSIgnoredSiriSuggestedSitesController databaseController](self, "databaseController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeIgnoredSiriSuggestedSitesWithURLHost:inProfile:", v8, v6);

}

- (void)getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[WBSIgnoredSiriSuggestedSitesController databaseController](self, "databaseController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getIgnoredSiriSuggestedSitesURLStringsInProfile:withQuery:completionHandler:", v11, v8, v9);

}

- (void)_pruneIgnoredSiriSuggestedSitesIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSDate *v10;
  NSDate *dateOfLastPruning;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForKey:", CFSTR("WBSDebugIgnoredSiriSuggestedSitesPruningTimeIntervalOverride"));
  v5 = v4;

  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall") & (v5 != 0.0)) != 0)
    v6 = v5;
  else
    v6 = 86400.0;
  if (!self->_dateOfLastPruning
    || (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "timeIntervalSinceDate:", self->_dateOfLastPruning),
        v9 = v8,
        v7,
        v9 >= v6))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateOfLastPruning = self->_dateOfLastPruning;
    self->_dateOfLastPruning = v10;

    -[WBSIgnoredSiriSuggestedSitesDatabaseController pruneIgnoredSiriSuggestedSites](self->_databaseController, "pruneIgnoredSiriSuggestedSites");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastPruning, 0);
  objc_storeStrong((id *)&self->_databaseController, 0);
}

@end
