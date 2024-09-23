@implementation WBSUserDefinedContentBlockerSQLiteStore

- (WBSUserDefinedContentBlockerSQLiteStore)init
{

  return 0;
}

- (WBSUserDefinedContentBlockerSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4;
  WBSUserDefinedContentBlockerSQLiteStore *v5;
  NSURL *v6;
  NSURL *databaseURL;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *databaseQueue;
  NSObject *v11;
  WBSUserDefinedContentBlockerSQLiteStore *v12;
  WBSUserDefinedContentBlockerSQLiteStore *v13;
  _QWORD block[4];
  WBSUserDefinedContentBlockerSQLiteStore *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSUserDefinedContentBlockerSQLiteStore;
  v5 = -[WBSUserDefinedContentBlockerSQLiteStore init](&v17, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (NSURL *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.SafariShared.WBSUserDefinedContentBlockerSQLiteStore", v8);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    v11 = v5->_databaseQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__WBSUserDefinedContentBlockerSQLiteStore_initWithDatabaseURL___block_invoke;
    block[3] = &unk_1E4B2A2C8;
    v12 = v5;
    v16 = v12;
    dispatch_async(v11, block);
    v13 = v12;

  }
  return v5;
}

uint64_t __63__WBSUserDefinedContentBlockerSQLiteStore_initWithDatabaseURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSUserDefinedContentBlockerSQLiteStore;
  -[WBSUserDefinedContentBlockerSQLiteStore dealloc](&v2, sel_dealloc);
}

+ (id)defaultDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_settingsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("UserDefinedContentBlockers.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSUserDefinedContentBlockerSQLiteStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::onceToken != -1)
    dispatch_once(&+[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::onceToken, block);
  return (id)+[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::sharedStore;
}

void __54__WBSUserDefinedContentBlockerSQLiteStore_sharedStore__block_invoke(uint64_t a1)
{
  WBSUserDefinedContentBlockerSQLiteStore *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [WBSUserDefinedContentBlockerSQLiteStore alloc];
  objc_msgSend(*(id *)(a1 + 32), "defaultDatabaseURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[WBSUserDefinedContentBlockerSQLiteStore initWithDatabaseURL:](v2, "initWithDatabaseURL:");
  v4 = (void *)+[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::sharedStore;
  +[WBSUserDefinedContentBlockerSQLiteStore sharedStore]::sharedStore = v3;

}

- (void)closeDatabase
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSUserDefinedContentBlockerSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __56__WBSUserDefinedContentBlockerSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase");
}

- (void)resetDatabaseWithCompletionHandler:(id)a3
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
  v7[2] = __78__WBSUserDefinedContentBlockerSQLiteStore_resetDatabaseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __78__WBSUserDefinedContentBlockerSQLiteStore_resetDatabaseWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_deleteFromAllTables");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)createPerSiteContentBlockerForHost:(id)a3
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
  v7[2] = __78__WBSUserDefinedContentBlockerSQLiteStore_createPerSiteContentBlockerForHost___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __78__WBSUserDefinedContentBlockerSQLiteStore_createPerSiteContentBlockerForHost___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertContentBlockerWithType:host:excludeGlobal:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)getPerSiteContentBlockerForHost:(id)a3 createIfNeeded:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *databaseQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__WBSUserDefinedContentBlockerSQLiteStore_getPerSiteContentBlockerForHost_createIfNeeded_completionHandler___block_invoke;
  v13[3] = &unk_1E4B3B340;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(databaseQueue, v13);

}

void __108__WBSUserDefinedContentBlockerSQLiteStore_getPerSiteContentBlockerForHost_createIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108__WBSUserDefinedContentBlockerSQLiteStore_getPerSiteContentBlockerForHost_createIfNeeded_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4B406A8;
  v4 = *(id *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v7[4] = v5;
  v8 = v6;
  objc_msgSend(v2, "_getContentBlockerWithType:host:completionHandler:", 0, v3, v7);

}

void __108__WBSUserDefinedContentBlockerSQLiteStore_getPerSiteContentBlockerForHost_createIfNeeded_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 || !*(_BYTE *)(a1 + 56))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_insertContentBlockerWithType:host:excludeGlobal:", 0, *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 32), "_getContentBlockerWithType:host:completionHandler:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3
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
  v7[2] = __88__WBSUserDefinedContentBlockerSQLiteStore_getGlobalContentBlockerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __88__WBSUserDefinedContentBlockerSQLiteStore_getGlobalContentBlockerWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getContentBlockerWithType:host:completionHandler:", 1, CFSTR("*"), *(_QWORD *)(a1 + 40));
}

- (void)getAllContentBlockerHostsWithCompletionHandler:(id)a3
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
  v7[2] = __90__WBSUserDefinedContentBlockerSQLiteStore_getAllContentBlockerHostsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __90__WBSUserDefinedContentBlockerSQLiteStore_getAllContentBlockerHostsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getAllContentBlockerHostsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3
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
  v7[2] = __109__WBSUserDefinedContentBlockerSQLiteStore_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __109__WBSUserDefinedContentBlockerSQLiteStore_getNumberOfContentBlockersThatContainActionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getNumberOfContentBlockersThatContainActionsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 completion:(id)a5
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
  v15[2] = __102__WBSUserDefinedContentBlockerSQLiteStore_getAllContentBlockerActionsWithType_excludeHost_completion___block_invoke;
  v15[3] = &unk_1E4B39360;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(databaseQueue, v15);

}

uint64_t __102__WBSUserDefinedContentBlockerSQLiteStore_getAllContentBlockerActionsWithType_excludeHost_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getAllContentBlockerActionsWithType:excludeHost:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)insertActions:(id)a3 forContentBlockerID:(int64_t)a4
{
  id v6;
  NSObject *databaseQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSUserDefinedContentBlockerSQLiteStore_insertActions_forContentBlockerID___block_invoke;
  block[3] = &unk_1E4B2B128;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __77__WBSUserDefinedContentBlockerSQLiteStore_insertActions_forContentBlockerID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertActions:forContentBlockerID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)deleteActionsForContentBlockerID:(int64_t)a3
{
  NSObject *databaseQueue;
  _QWORD v4[6];

  databaseQueue = self->_databaseQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__WBSUserDefinedContentBlockerSQLiteStore_deleteActionsForContentBlockerID___block_invoke;
  v4[3] = &unk_1E4B2AA60;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(databaseQueue, v4);
}

uint64_t __76__WBSUserDefinedContentBlockerSQLiteStore_deleteActionsForContentBlockerID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteActionsForContentBlockerID:", *(_QWORD *)(a1 + 40));
}

- (void)deleteAction:(id)a3
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
  v7[2] = __56__WBSUserDefinedContentBlockerSQLiteStore_deleteAction___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __56__WBSUserDefinedContentBlockerSQLiteStore_deleteAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteAction:", *(_QWORD *)(a1 + 40));
}

- (void)deleteGlobalContentBlockerActionsWithSelectors:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WBSUserDefinedContentBlockerSQLiteStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__WBSUserDefinedContentBlockerSQLiteStore_deleteGlobalContentBlockerActionsWithSelectors_completionHandler___block_invoke;
  v10[3] = &unk_1E4B406F8;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[WBSUserDefinedContentBlockerSQLiteStore getGlobalContentBlockerWithCompletionHandler:](self, "getGlobalContentBlockerWithCompletionHandler:", v10);

}

void __108__WBSUserDefinedContentBlockerSQLiteStore_deleteGlobalContentBlockerActionsWithSelectors_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v7 = a2;
  objc_msgSend(v7, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__WBSUserDefinedContentBlockerSQLiteStore_deleteGlobalContentBlockerActionsWithSelectors_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B406D0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setActions:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __108__WBSUserDefinedContentBlockerSQLiteStore_deleteGlobalContentBlockerActionsWithSelectors_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "selector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "_deleteAction:", v3);

  return v6 ^ 1u;
}

- (void)insertCrossSiteContent:(id)a3
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
  v7[2] = __66__WBSUserDefinedContentBlockerSQLiteStore_insertCrossSiteContent___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __66__WBSUserDefinedContentBlockerSQLiteStore_insertCrossSiteContent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertCrossSiteContent:", *(_QWORD *)(a1 + 40));
}

- (void)deleteUnassociatedCrossSiteContent
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSUserDefinedContentBlockerSQLiteStore_deleteUnassociatedCrossSiteContent__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(databaseQueue, block);
}

uint64_t __77__WBSUserDefinedContentBlockerSQLiteStore_deleteUnassociatedCrossSiteContent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteUnassociatedCrossSiteContent");
}

- (void)getCrossSiteContentsWithSource:(id)a3 completionHandler:(id)a4
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
  block[2] = __92__WBSUserDefinedContentBlockerSQLiteStore_getCrossSiteContentsWithSource_completionHandler___block_invoke;
  block[3] = &unk_1E4B2AFC0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

void __92__WBSUserDefinedContentBlockerSQLiteStore_getCrossSiteContentsWithSource_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_getCrossSiteContentsWithSource:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)associateAction:(id)a3 withCrossSiteContentID:(int64_t)a4
{
  id v6;
  NSObject *databaseQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WBSUserDefinedContentBlockerSQLiteStore_associateAction_withCrossSiteContentID___block_invoke;
  block[3] = &unk_1E4B2B128;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __82__WBSUserDefinedContentBlockerSQLiteStore_associateAction_withCrossSiteContentID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_associateActionID:withCrossSiteContentID:", objc_msgSend(*(id *)(a1 + 40), "databaseID"), *(_QWORD *)(a1 + 48));
}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

- (void)_openDatabaseIfNecessary
{
  if (!-[WBSUserDefinedContentBlockerSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
    -[WBSUserDefinedContentBlockerSQLiteStore _openDatabase](self, "_openDatabase");
}

- (void)_openDatabase
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v6, v4, "Failed to open User Defined Content Blocker store at %{private}@: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (int)_migrateToCurrentSchemaVersionIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intAtIndex:", 0);

  objc_msgSend(v3, "statement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  if (v5 <= 1)
  {
    if (v5)
    {
      v7 = (v5 + 1);
      while ((_DWORD)v7 != 3)
      {
        v8 = -[WBSUserDefinedContentBlockerSQLiteStore _migrateToSchemaVersion:](self, "_migrateToSchemaVersion:", v7);
        v7 = (v7 + 1);
        if (!v8)
        {
          v5 = v7 - 2;
          goto LABEL_11;
        }
      }
      v5 = 2;
    }
    else if (-[WBSUserDefinedContentBlockerSQLiteStore _createFreshDatabaseSchema](self, "_createFreshDatabaseSchema") == 101)
    {
      -[WBSUserDefinedContentBlockerSQLiteStore _insertContentBlockerWithType:host:excludeGlobal:](self, "_insertContentBlockerWithType:host:excludeGlobal:", 1, CFSTR("*"), 0);
      v5 = 2;
      -[WBSUserDefinedContentBlockerSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", 2);
    }
    else
    {
      v5 = 0;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)_migrateToSchemaVersion:(int)a3
{
  NSString *v5;
  SEL v6;
  _QWORD v8[6];
  int v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_migrateToSchemaVersion_%d"), *(_QWORD *)&a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSSelectorFromString(v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__WBSUserDefinedContentBlockerSQLiteStore__migrateToSchemaVersion___block_invoke;
  v8[3] = &unk_1E4B3E138;
  v8[4] = self;
  v8[5] = v6;
  v9 = a3;
  return -[WBSUserDefinedContentBlockerSQLiteStore _tryToPerformTransactionInBlock:](self, "_tryToPerformTransactionInBlock:", v8);
}

BOOL __67__WBSUserDefinedContentBlockerSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  int v6;

  objc_msgSend(*(id *)(a1 + 32), "methodSignatureForSelector:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelector:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "invokeWithTarget:", *(_QWORD *)(a1 + 32));
  v6 = 0;
  objc_msgSend(v3, "getReturnValue:", &v6);
  v4 = v6 == 101
    && objc_msgSend(*(id *)(a1 + 32), "_setDatabaseSchemaVersion:", *(unsigned int *)(a1 + 48)) != 0;

  return v4;
}

- (int)_migrateToSchemaVersion_2
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE action ADD COLUMN extra_attributes BLOB NULL"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _migrateToSchemaVersion_2].cold.1();
    }

  }
  return v3;
}

- (BOOL)_tryToPerformTransactionInBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  BOOL v5;
  NSObject *v6;
  NSObject *v7;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (!-[WBSUserDefinedContentBlockerSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
    goto LABEL_15;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION")) != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:].cold.3();
    }
    goto LABEL_14;
  }
  if (!v4[2](v4))
  {
LABEL_11:
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ROLLBACK TRANSACTION")) == 101)
    {
LABEL_15:
      v5 = 0;
      goto LABEL_16;
    }
    v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:].cold.1();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION")) != 101)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:].cold.2();
    }

    goto LABEL_11;
  }
  v5 = 1;
LABEL_16:

  return v5;
}

- (int)_createFreshDatabaseSchema
{
  int v3;
  int v4;
  int v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE content_blocker (id INTEGER PRIMARY KEY AUTOINCREMENT,host TEXT NOT NULL,type NUMERIC NOT NULL,version NUMERIC NOT NULL,exclude_global NUMERIC NULL,binary_cache BLOB NULL,UNIQUE(host, type))"));
  if (v3 != 101)
  {
    v5 = v3;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _createFreshDatabaseSchema].cold.3();
    }
    goto LABEL_10;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE cross_site_content (id INTEGER PRIMARY KEY AUTOINCREMENT,source TEXT NOT NULL,title TEXT NULL,extra_attributes BLOB NULL,version NUMERIC NOT NULL)"));
  if (v4 != 101)
  {
    v5 = v4;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _createFreshDatabaseSchema].cold.2();
    }
    goto LABEL_10;
  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE action (id INTEGER PRIMARY KEY AUTOINCREMENT,content_blocker_id INTEGER NOT NULL,selector TEXT NOT NULL,type TEXT NOT NULL,version NUMERIC NOT NULL,cross_site_content_id INTEGER NULL,extra_attributes BLOB NULL,FOREIGN KEY (content_blocker_id) REFERENCES content_blocker(id) ON DELETE CASCADE,FOREIGN KEY (cross_site_content_id) REFERENCES cross_site_content(id) ON DELETE SET NULL)"));
  if (v5 != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _createFreshDatabaseSchema].cold.1();
    }
LABEL_10:

  }
  return v5;
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
    v8 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
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
      _os_log_error_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_ERROR, "Failed to set the User Defined Content Blocker store database schema version to %d: %{public}@ (%d)", buf, 0x18u);

    }
  }
  return v7;
}

- (void)_closeDatabase
{
  WBSSQLiteDatabase *database;

  -[WBSSQLiteDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

}

- (BOOL)_deleteFromAllTables
{
  int v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DELETE FROM action"));
  v4 = v3 == 101;
  if (v3 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteFromAllTables].cold.3();
    }

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("DELETE FROM content_blocker WHERE type != ?"));
  objc_msgSend(v6, "bindInt:atParameterIndex:", 1, 1);
  v7 = objc_msgSend(v6, "execute");
  objc_msgSend(v6, "reset");
  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteFromAllTables].cold.2();
    }

    v4 = 0;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DELETE FROM cross_site_content")) != 101)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteFromAllTables].cold.1();
    }

    v4 = 0;
  }

  return v4;
}

- (int)_insertContentBlockerWithType:(int64_t)a3 host:(id)a4 excludeGlobal:(BOOL)a5
{
  void *v7;
  int v8;
  NSObject *v9;
  id v11;
  int64_t v12;
  void *v13;
  BOOL v14;
  id v15;
  int64_t v16;
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v15 = a4;
  v14 = a5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("INSERT INTO content_blocker (type, host, exclude_global, version)VALUES (?, ?, ?, ?)"));
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,WBSUserDefinedContentBlockerType &,NSString * {__strong}&,BOOL &,int const&>(v7, &v16, &v15, (unsigned __int8 *)&v14, (unsigned int *)&WBSUserDefinedContentBlockerSupportedVersion);
  v8 = objc_msgSend(v7, "execute");
  objc_msgSend(v7, "reset");
  if (v8 != 101)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = v15;
      v12 = v16;
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218755;
      v18 = v12;
      v19 = 2113;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 1024;
      v24 = v8;
      _os_log_error_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_ERROR, "Failed to create content blocker(type %lu) for %{private}@: %{public}@ (%d)", buf, 0x26u);

    }
  }

  return v8;
}

- (void)_getContentBlockerWithType:(int64_t)a3 host:(id)a4 completionHandler:(id)a5
{
  id v8;
  WBSSQLiteDatabase *database;
  void *v10;
  void *v11;
  WBSUserDefinedContentBlocker *v12;
  uint64_t v13;
  WBSUserDefinedContentBlocker *v14;
  _QWORD v15[4];
  WBSUserDefinedContentBlocker *v16;
  id v17;
  unsigned int v18;
  id v19;

  v19 = a4;
  v8 = a5;
  database = self->_database;
  v18 = a3;
  SafariShared::WBSSQLiteDatabaseFetch<int,NSString * {__strong}&>(database, CFSTR("SELECT id, exclude_global FROM content_blocker WHERE type = ? AND host = ?"), &v18, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(WBSUserDefinedContentBlocker);
    -[WBSUserDefinedContentBlocker setDatabaseID:](v12, "setDatabaseID:", (int)objc_msgSend(v11, "intAtIndex:", 0));
    -[WBSUserDefinedContentBlocker setType:](v12, "setType:", a3);
    -[WBSUserDefinedContentBlocker setHost:](v12, "setHost:", v19);
    -[WBSUserDefinedContentBlocker setExcludeGlobalContentBlockers:](v12, "setExcludeGlobalContentBlockers:", objc_msgSend(v11, "BOOLAtIndex:", 1));
    v13 = -[WBSUserDefinedContentBlocker databaseID](v12, "databaseID");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __93__WBSUserDefinedContentBlockerSQLiteStore__getContentBlockerWithType_host_completionHandler___block_invoke;
    v15[3] = &unk_1E4B40720;
    v14 = v12;
    v16 = v14;
    v17 = v8;
    -[WBSUserDefinedContentBlockerSQLiteStore _getActionsForContentBlockerID:completionHandler:](self, "_getActionsForContentBlockerID:completionHandler:", v13, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __93__WBSUserDefinedContentBlockerSQLiteStore__getContentBlockerWithType_host_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setActions:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_getAllContentBlockerHostsWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  WBSSQLiteDatabase *database;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;

  v4 = (void (**)(id, void *))a3;
  database = self->_database;
  v12 = 0;
  SafariShared::WBSSQLiteDatabaseFetch<int>(database, CFSTR("SELECT host FROM content_blocker WHERE type = ?"), &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v6, "nextObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      break;
    objc_msgSend(v8, "stringAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  v11 = (void *)objc_msgSend(v7, "copy");
  v4[2](v4, v11);

}

- (void)_getNumberOfContentBlockersThatContainActionsWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  WBSSQLiteDatabase *database;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v4 = (void (**)(id, uint64_t))a3;
  database = self->_database;
  v9 = 0;
  SafariShared::WBSSQLiteDatabaseFetch<int>(database, CFSTR("SELECT COUNT(DISTINCT content_blocker_id) FROM action"), &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "nextObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, objc_msgSend(v8, "intAtIndex:", 0));

  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)_getAllContentBlockerActionsWithType:(id)a3 excludeHost:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  WBSUserDefinedContentBlockerAction *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  WBSUserDefinedContentBlockerAction *v18;
  void *v19;
  id v20;
  id v21;

  v21 = a3;
  v20 = a4;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&,NSString * {__strong}&>(self->_database, CFSTR("SELECT action.id, action.selector, action.type, action.cross_site_content_id, action.extra_attributes FROM action, content_blocker WHERE action.type = ? AND content_blocker.id = action.content_blocker_id AND content_blocker.host != ?"), &v21, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v10, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      break;
    v12 = [WBSUserDefinedContentBlockerAction alloc];
    v13 = objc_msgSend(v11, "intAtIndex:", 0);
    objc_msgSend(v11, "stringAtIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringAtIndex:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "intAtIndex:", 3);
    objc_msgSend(v11, "dataAtIndex:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WBSUserDefinedContentBlockerAction initWithDatabaseID:selector:type:crossSiteContentID:extraAttributesData:](v12, "initWithDatabaseID:selector:type:crossSiteContentID:extraAttributesData:", v13, v14, v15, v16, v17);

    objc_msgSend(v9, "addObject:", v18);
  }
  v19 = (void *)objc_msgSend(v9, "copy");
  v8[2](v8, v19);

}

- (void)_insertActions:(id)a3 forContentBlockerID:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[WBSUserDefinedContentBlockerSQLiteStore _insertAction:forContentBlockerID:](self, "_insertAction:forContentBlockerID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), a4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)_insertAction:(id)a3 forContentBlockerID:(int64_t)a4
{
  id v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  WBSSQLiteDatabase *database;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "databaseID");
  if (!v7)
  {
    if (!a4)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[WBSUserDefinedContentBlockerSQLiteStore _insertAction:forContentBlockerID:].cold.1();
      goto LABEL_20;
    }
    database = self->_database;
    objc_msgSend(v6, "selector");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typeString");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = a4;
    objc_msgSend(v6, "extraAttributesData");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong},NSString * {__strong},int,int const&,NSData * {__strong}>(database, CFSTR("INSERT INTO action (selector, type, content_blocker_id, version, extra_attributes)VALUES (?, ?, ?, ?, ?)RETURNING id"), &v25, &v24, (unsigned int *)buf, (unsigned int *)&WBSUserDefinedContentBlockerActionSupportedVersion, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "lastResultCode");
    objc_msgSend(v11, "nextObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (v15 = objc_msgSend(v13, "int64AtIndex:", 0), v14, v15))
    {
      if (a4 == 1)
      {
        objc_msgSend(v6, "crossSiteContentCandidate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "databaseID") == 0;

        if (v21)
        {
          v7 = v15;
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v6, "crossSiteContentCandidate");
        v16 = objc_claimAutoreleasedReturnValue();
        -[WBSUserDefinedContentBlockerSQLiteStore _associateActionID:withCrossSiteContentID:](self, "_associateActionID:withCrossSiteContentID:", v15, -[NSObject databaseID](v16, "databaseID"));
      }
      else
      {
        objc_msgSend(v6, "crossSiteContentCandidate");
        v16 = objc_claimAutoreleasedReturnValue();
        -[WBSUserDefinedContentBlockerSQLiteStore _insertCrossSiteContentCandidateIfNeeded:andAssociateWithActionID:](self, "_insertCrossSiteContentCandidateIfNeeded:andAssociateWithActionID:", v16, v15);
      }
      v7 = v15;
    }
    else
    {
      v16 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "typeString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "selector");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v27 = v17;
        v28 = 2112;
        v29 = v18;
        v30 = 2048;
        v31 = a4;
        v32 = 2114;
        v33 = v19;
        v34 = 1024;
        v35 = v12;
        _os_log_error_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_ERROR, "Failed to create action(%@) with selector(%@) for contentBlockerID(%ld): %{public}@ (%d)", buf, 0x30u);

      }
    }

    goto LABEL_19;
  }
  v9 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[WBSUserDefinedContentBlockerSQLiteStore _insertAction:forContentBlockerID:].cold.2((uint64_t)buf, objc_msgSend(v6, "databaseID"), v9);

  v7 = 0;
LABEL_20:

  return v7;
}

- (void)_getActionsForContentBlockerID:(int64_t)a3 completionHandler:(id)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  WBSSQLiteDatabase *database;
  void *v9;
  void *v10;
  WBSUserDefinedContentBlockerAction *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  WBSUserDefinedContentBlockerAction *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  unsigned int v20;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void (**)(_QWORD, _QWORD))v6;
  database = self->_database;
  v20 = v4;
  SafariShared::WBSSQLiteDatabaseFetch<int>(database, CFSTR("SELECT id, selector, type, cross_site_content_id, extra_attributes FROM action WHERE content_blocker_id = ?"), &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v9, "nextObject", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      break;
    v11 = [WBSUserDefinedContentBlockerAction alloc];
    v12 = objc_msgSend(v10, "intAtIndex:", 0);
    objc_msgSend(v10, "stringAtIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringAtIndex:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "intAtIndex:", 3);
    objc_msgSend(v10, "dataAtIndex:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WBSUserDefinedContentBlockerAction initWithDatabaseID:selector:type:crossSiteContentID:extraAttributesData:](v11, "initWithDatabaseID:selector:type:crossSiteContentID:extraAttributesData:", v12, v13, v14, v15, v16);

    objc_msgSend(v7, "addObject:", v17);
  }
  v18 = (void *)objc_msgSend(v7, "copy");
  ((void (**)(_QWORD, void *))v19)[2](v19, v18);

}

- (void)_deleteActionsForContentBlockerID:(int64_t)a3
{
  NSObject *v4;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  int64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("DELETE FROM action WHERE content_blocker_id = ?"));
    objc_msgSend(v6, "bindInt:atParameterIndex:", a3, 1);
    v7 = objc_msgSend(v6, "execute");
    objc_msgSend(v6, "reset");
    if (v7 != 101)
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 134218498;
        v11 = a3;
        v12 = 2114;
        v13 = v9;
        v14 = 1024;
        v15 = v7;
        _os_log_error_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_ERROR, "Failed to delete actions for contentBlockerID(%ld): %{public}@ (%d)", (uint8_t *)&v10, 0x1Cu);

      }
    }

  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteActionsForContentBlockerID:].cold.1();
  }
}

- (void)_deleteAction:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "databaseID"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", self->_database, CFSTR("DELETE FROM action WHERE id = ?"));
    objc_msgSend(v13, "bindInt64:atParameterIndex:", objc_msgSend(v4, "databaseID"), 1);
    v14 = objc_msgSend(v13, "execute");
    objc_msgSend(v13, "reset");
    if (v14 != 101)
    {
      v15 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend(v4, "databaseID");
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 134218498;
        v19 = v16;
        v20 = 2114;
        v21 = v17;
        v22 = 1024;
        v23 = v14;
        _os_log_error_impl(&dword_1A3D90000, v15, OS_LOG_TYPE_ERROR, "Failed to delete action(%ld): %{public}@ (%d)", (uint8_t *)&v18, 0x1Cu);

      }
    }

  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSUserDefinedContentBlockerSQLiteStore _deleteAction:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (void)_deleteUnassociatedCrossSiteContent
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to delete unassociated Cross Site Content: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (int64_t)_insertCrossSiteContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  WBSSQLiteDatabase *database;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  NSObject *v16;
  id v18;
  id v19;
  id v20;
  id v21[5];

  v21[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "databaseID"))
  {
    v15 = objc_msgSend(v4, "databaseID");
  }
  else
  {
    v21[0] = 0;
    objc_msgSend(v4, "extraAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v4, "extraAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v20;
      v21[0] = v8;

      if (v9)
      {
        v10 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[WBSUserDefinedContentBlockerSQLiteStore _insertCrossSiteContent:].cold.2();
      }

    }
    database = self->_database;
    objc_msgSend(v4, "source");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong},NSString * {__strong},NSData * {__strong}&,int const&>(database, CFSTR("INSERT INTO cross_site_content (source, title, extra_attributes, version)VALUES (?, ?, ?, ?)RETURNING id"), &v19, &v18, v21, (unsigned int *)&WBSUserDefinedContentBlockerCrossSiteContentSupportedVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "lastResultCode");
    objc_msgSend(v12, "nextObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13 || (v15 = objc_msgSend(v13, "int64AtIndex:", 0), v14, !v15))
    {
      v16 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[WBSUserDefinedContentBlockerSQLiteStore _insertCrossSiteContent:].cold.1();
      }

      v15 = 0;
    }

  }
  return v15;
}

- (int64_t)_getFirstCrossSiteContentIDWithSource:(id)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  id v10;

  v10 = a3;
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, CFSTR("SELECT id FROM cross_site_content WHERE source = ?"), &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v3 = objc_msgSend(v6, "int64AtIndex:", 0);

  if (v7)
    v8 = v3;
  else
    v8 = 0;

  return v8;
}

- (id)_getCrossSiteContentsWithSource:(id)a3
{
  WBSSQLiteDatabase *database;
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  WBSUserDefinedContentBlockerCrossSiteContent *v17;
  int v18;
  void *v19;
  void *v20;
  WBSUserDefinedContentBlockerCrossSiteContent *v21;
  void *v22;
  __int128 v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  if (v27)
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(database, CFSTR("SELECT id, source, title, extra_attributes FROM cross_site_content WHERE source = ?"), &v27);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SafariShared::WBSSQLiteDatabaseFetch<>(database, CFSTR("SELECT id, source, title, extra_attributes FROM cross_site_content"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  *(_QWORD *)&v6 = 138412290;
  v24 = v6;
  while (1)
  {
    objc_msgSend(v7, "nextObject", v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      break;
    objc_msgSend(v8, "dataAtIndex:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3710];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v26 = 0;
    objc_msgSend(v11, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v12, v13, v10, &v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v26;
    if (v15)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v24;
        v29 = v15;
        _os_log_error_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_ERROR, "Failed to parse extraAttributes blob from database with error: %@", buf, 0xCu);
      }
    }
    v17 = [WBSUserDefinedContentBlockerCrossSiteContent alloc];
    v18 = objc_msgSend(v9, "intAtIndex:", 0);
    objc_msgSend(v9, "stringAtIndex:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringAtIndex:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[WBSUserDefinedContentBlockerCrossSiteContent initWithDatabaseID:source:title:extraAttributes:](v17, "initWithDatabaseID:source:title:extraAttributes:", v18, v19, v20, v14);
    objc_msgSend(v25, "addObject:", v21);

  }
  v22 = (void *)objc_msgSend(v25, "copy");

  return v22;
}

- (void)_associateActionID:(int64_t)a3 withCrossSiteContentID:(int64_t)a4
{
  BOOL v4;
  NSObject *v5;
  NSObject *v7;
  int64_t v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9[0] = a3;
  if (a3)
    v4 = a4 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSUserDefinedContentBlockerSQLiteStore _associateActionID:withCrossSiteContentID:].cold.1();
  }
  else if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long &,long &>(self->_database, 0, CFSTR("UPDATE action SET cross_site_content_id = ? WHERE id = ?"), &v8, v9) != 101)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage", v8, v9[0]);
      objc_claimAutoreleasedReturnValue();
      -[WBSUserDefinedContentBlockerSQLiteStore _associateActionID:withCrossSiteContentID:].cold.2();
    }

  }
}

- (void)_insertCrossSiteContentCandidateIfNeeded:(id)a3 andAssociateWithActionID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[WBSUserDefinedContentBlockerSQLiteStore _getFirstCrossSiteContentIDWithSource:](self, "_getFirstCrossSiteContentIDWithSource:", v8);
      if (!v9)
        v9 = -[WBSUserDefinedContentBlockerSQLiteStore _insertCrossSiteContent:](self, "_insertCrossSiteContent:", v7);
      -[WBSUserDefinedContentBlockerSQLiteStore _associateActionID:withCrossSiteContentID:](self, "_associateActionID:withCrossSiteContentID:", a4, v9);
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WBSUserDefinedContentBlockerSQLiteStore _insertCrossSiteContentCandidateIfNeeded:andAssociateWithActionID:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
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
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add extra_attributes column to action table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_createFreshDatabaseSchema
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to create the content_blocker table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_deleteFromAllTables
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to clear action table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_insertAction:forContentBlockerID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v0, v1, "Cannot add action to non-existent content blocker (%ld).", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_insertAction:(NSObject *)a3 forContentBlockerID:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a3, (uint64_t)a3, "Canceled adding action (%ld) because it's already in database).", (uint8_t *)a1);
}

- (void)_deleteActionsForContentBlockerID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v0, v1, "Cannot delete actions from non-existent content blocker (%ld).", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_deleteAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Canceled deleting action due to missing database ID.", a5, a6, a7, a8, 0);
}

- (void)_insertCrossSiteContent:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to insert cross site content: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_insertCrossSiteContent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v0, v1, "Error when archiving extra attributes: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_associateActionID:withCrossSiteContentID:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v1, (uint64_t)v1, "Invalid ID when associating action(%ld) with content(%ld)", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_associateActionID:withCrossSiteContentID:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to update CrossSiteContent association.: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_insertCrossSiteContentCandidateIfNeeded:(uint64_t)a3 andAssociateWithActionID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Rejected CrossSiteContent Candidate without source information (URL).", a5, a6, a7, a8, 0);
}

@end
