@implementation WBSFormAutoFillCorrectionsSQLiteStore

void __54__WBSFormAutoFillCorrectionsSQLiteStore_standardStore__block_invoke()
{
  WBSFormAutoFillCorrectionsSQLiteStore *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [WBSFormAutoFillCorrectionsSQLiteStore alloc];
  +[WBSFormAutoFillCorrectionsSQLiteStore _defaultLocalDatabaseURL](WBSFormAutoFillCorrectionsSQLiteStore, "_defaultLocalDatabaseURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[WBSFormAutoFillCorrectionsSQLiteStore _defaultParsecDatabaseURL](WBSFormAutoFillCorrectionsSQLiteStore, "_defaultParsecDatabaseURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[WBSFormAutoFillCorrectionsSQLiteStore initWithLocalDatabaseURL:parsecDatabaseURL:](v0, "initWithLocalDatabaseURL:parsecDatabaseURL:", v4, v1);
  v3 = (void *)+[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::sharedStore;
  +[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::sharedStore = v2;

}

- (WBSFormAutoFillCorrectionsSQLiteStore)initWithLocalDatabaseURL:(id)a3 parsecDatabaseURL:(id)a4
{
  id v6;
  id v7;
  WBSFormAutoFillCorrectionsSQLiteStore *v8;
  NSURL *v9;
  NSURL *localDatabaseURL;
  NSURL *v11;
  NSURL *parsecDatabaseURL;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *databaseQueue;
  WBSFormAutoFillCorrectionsSQLiteStore *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSFormAutoFillCorrectionsSQLiteStore;
  v8 = -[WBSFormAutoFillCorrectionsSQLiteStore init](&v18, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (NSURL *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
      v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    localDatabaseURL = v8->_localDatabaseURL;
    v8->_localDatabaseURL = v9;

    if (v7)
    {
      v11 = (NSURL *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
      v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    parsecDatabaseURL = v8->_parsecDatabaseURL;
    v8->_parsecDatabaseURL = v11;

    dispatch_get_global_queue(17, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create_with_target_V2("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore", 0, v13);
    databaseQueue = v8->_databaseQueue;
    v8->_databaseQueue = (OS_dispatch_queue *)v14;

    v16 = v8;
  }

  return v8;
}

+ (id)_defaultParsecDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_settingsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("CloudAutoFillCorrections.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_defaultLocalDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_settingsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("AutoFillCorrections.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)standardStore
{
  if (+[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::onceToken != -1)
    dispatch_once(&+[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::onceToken, &__block_literal_global_45);
  return (id)+[WBSFormAutoFillCorrectionsSQLiteStore standardStore]::sharedStore;
}

- (WBSFormAutoFillCorrectionsSQLiteStore)init
{
  return -[WBSFormAutoFillCorrectionsSQLiteStore initWithLocalDatabaseURL:parsecDatabaseURL:](self, "initWithLocalDatabaseURL:parsecDatabaseURL:", 0, 0);
}

- (void)closeDatabase
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSFormAutoFillCorrectionsSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __54__WBSFormAutoFillCorrectionsSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabases");
}

- (void)replaceDomainAllowListWithDomains:(id)a3 retrievalURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *databaseQueue;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = (void *)objc_msgSend(v9, "copy");
  v13 = operator new();
  MEMORY[0x1A8599720](v13, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke;
  block[3] = &unk_1E4B39248;
  block[4] = self;
  v19 = v11;
  v21 = v10;
  v22 = v13;
  v20 = v12;
  v15 = v10;
  v16 = v12;
  v17 = v11;
  dispatch_async(databaseQueue, block);

}

void __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  id *v7;
  dispatch_qos_class_t qos_class;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  char v12;
  _QWORD v13[5];
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  v2 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = v4[4];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke_2;
  v13[3] = &unk_1E4B391F8;
  v13[4] = v4;
  v14 = v3;
  v15 = *(id *)(a1 + 48);
  v6 = objc_msgSend(v4, "_tryToPerformTransactionOnDatabase:inBlock:", v5, v13);
  v7 = *(id **)(a1 + 64);
  if (v7)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 56))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke_3;
    block[3] = &unk_1E4B39220;
    v11 = *(id *)(a1 + 56);
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replaceDomainAllowListWithDomains:retrievalURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __112__WBSFormAutoFillCorrectionsSQLiteStore_replaceDomainAllowListWithDomains_retrievalURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getAllowListStatusForDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "copy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke;
  v11[3] = &unk_1E4B39298;
  v11[4] = self;
  v9 = v7;
  v12 = v8;
  v13 = v9;
  v10 = v8;
  -[WBSFormAutoFillCorrectionsSQLiteStore getLastAllowListRetrievalURLStringWithCompletionHandler:](self, "getLastAllowListRetrievalURLStringWithCompletionHandler:", v11);

}

void __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  dispatch_qos_class_t qos_class;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 40);
  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_3;
    v8[3] = &unk_1E4B2B178;
    v8[4] = v3;
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    dispatch_async(v4, v8);

    v5 = v9;
  }
  else
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(v3 + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_2;
    block[3] = &unk_1E4B2B038;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v7, block);

    v5 = v12;
  }

}

uint64_t __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  dispatch_qos_class_t qos_class;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "_normalizeDomain:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v2;
  if (v2
    && (objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded"),
        objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))))
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(*(void **)(*(_QWORD *)(a1 + 32) + 32), CFSTR("SELECT COUNT(*) AS count FROM whitelist WHERE domain = ?"), &v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "int64AtIndex:", 0) >= 1)
      v5 = 1;
    else
      v5 = 2;

    v2 = v11;
  }
  else
  {
    v5 = 0;
  }

  qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
  dispatch_get_global_queue(qos_class, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_4;
  block[3] = &unk_1E4B39270;
  v9 = *(id *)(a1 + 48);
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __87__WBSFormAutoFillCorrectionsSQLiteStore_getAllowListStatusForDomain_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setDomain:(id)a3 isAllowListedForFeedback:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *databaseQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(v8, "copy");
  v11 = operator new();
  MEMORY[0x1A8599720](v11, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__WBSFormAutoFillCorrectionsSQLiteStore_setDomain_isAllowListedForFeedback_completionHandler___block_invoke;
  block[3] = &unk_1E4B392C0;
  block[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v9;
  v18 = v11;
  v13 = v9;
  v14 = v10;
  dispatch_async(databaseQueue, block);

}

void __94__WBSFormAutoFillCorrectionsSQLiteStore_setDomain_isAllowListedForFeedback_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  id *v3;
  dispatch_qos_class_t qos_class;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_setDomain:isAllowListedForFeedback:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  else
    v2 = 0;
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 48))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94__WBSFormAutoFillCorrectionsSQLiteStore_setDomain_isAllowListedForFeedback_completionHandler___block_invoke_2;
    v6[3] = &unk_1E4B39220;
    v7 = *(id *)(a1 + 48);
    v8 = v2;
    dispatch_async(v5, v6);

  }
}

uint64_t __94__WBSFormAutoFillCorrectionsSQLiteStore_setDomain_isAllowListedForFeedback_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getLastAllowListRetrievalURLStringWithCompletionHandler:(id)a3
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
  v7[2] = __97__WBSFormAutoFillCorrectionsSQLiteStore_getLastAllowListRetrievalURLStringWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __97__WBSFormAutoFillCorrectionsSQLiteStore_getLastAllowListRetrievalURLStringWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_qos_class_t qos_class;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parsecMetadataStringValueForKey:", CFSTR("lastWhitelistRetrievalURL"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
  dispatch_get_global_queue(qos_class, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__WBSFormAutoFillCorrectionsSQLiteStore_getLastAllowListRetrievalURLStringWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E4B29E18;
  v5 = *(id *)(a1 + 40);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  dispatch_async(v4, v7);

}

uint64_t __97__WBSFormAutoFillCorrectionsSQLiteStore_getLastAllowListRetrievalURLStringWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setLastAllowListRetrievalURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *databaseQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "copy");
  v9 = operator new();
  MEMORY[0x1A8599720](v9, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__WBSFormAutoFillCorrectionsSQLiteStore_setLastAllowListRetrievalURLString_completionHandler___block_invoke;
  v13[3] = &unk_1E4B392E8;
  v13[4] = self;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v11 = v7;
  v12 = v8;
  dispatch_async(databaseQueue, v13);

}

void __94__WBSFormAutoFillCorrectionsSQLiteStore_setLastAllowListRetrievalURLString_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  id *v3;
  dispatch_qos_class_t qos_class;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_setParsecMetadataStringValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("lastWhitelistRetrievalURL"));
  else
    v2 = 0;
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 48))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94__WBSFormAutoFillCorrectionsSQLiteStore_setLastAllowListRetrievalURLString_completionHandler___block_invoke_2;
    v6[3] = &unk_1E4B39220;
    v7 = *(id *)(a1 + 48);
    v8 = v2;
    dispatch_async(v5, v6);

  }
}

uint64_t __94__WBSFormAutoFillCorrectionsSQLiteStore_setLastAllowListRetrievalURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:(id)a3
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
  v7[2] = __111__WBSFormAutoFillCorrectionsSQLiteStore_getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __111__WBSFormAutoFillCorrectionsSQLiteStore_getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_qos_class_t qos_class;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_parsecMetadataStringValueForKey:", CFSTR("lastCorrectionsRetrievalURL"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
  dispatch_get_global_queue(qos_class, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__WBSFormAutoFillCorrectionsSQLiteStore_getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E4B29E18;
  v5 = *(id *)(a1 + 40);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  dispatch_async(v4, v7);

}

uint64_t __111__WBSFormAutoFillCorrectionsSQLiteStore_getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setLastCrowdsourcedCorrectionsRetrievalURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *databaseQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "copy");
  v9 = operator new();
  MEMORY[0x1A8599720](v9, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__WBSFormAutoFillCorrectionsSQLiteStore_setLastCrowdsourcedCorrectionsRetrievalURLString_completionHandler___block_invoke;
  v13[3] = &unk_1E4B392E8;
  v13[4] = self;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v11 = v7;
  v12 = v8;
  dispatch_async(databaseQueue, v13);

}

void __108__WBSFormAutoFillCorrectionsSQLiteStore_setLastCrowdsourcedCorrectionsRetrievalURLString_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  id *v3;
  dispatch_qos_class_t qos_class;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_setParsecMetadataStringValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("lastCorrectionsRetrievalURL"));
  else
    v2 = 0;
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 48))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __108__WBSFormAutoFillCorrectionsSQLiteStore_setLastCrowdsourcedCorrectionsRetrievalURLString_completionHandler___block_invoke_2;
    v6[3] = &unk_1E4B39220;
    v7 = *(id *)(a1 + 48);
    v8 = v2;
    dispatch_async(v5, v6);

  }
}

uint64_t __108__WBSFormAutoFillCorrectionsSQLiteStore_setLastCrowdsourcedCorrectionsRetrievalURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)replaceCrowdsourcedCorrectionSetsWithCorrectionSets:(id)a3 retrievalURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *databaseQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = operator new();
  MEMORY[0x1A8599720](v12, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke;
  block[3] = &unk_1E4B39248;
  block[4] = self;
  v18 = v11;
  v20 = v10;
  v21 = v12;
  v19 = v9;
  v14 = v10;
  v15 = v9;
  v16 = v11;
  dispatch_async(databaseQueue, block);

}

void __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  id *v7;
  dispatch_qos_class_t qos_class;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  char v12;
  _QWORD v13[5];
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  v2 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = v4[4];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke_2;
  v13[3] = &unk_1E4B391F8;
  v13[4] = v4;
  v14 = v3;
  v15 = *(id *)(a1 + 48);
  v6 = objc_msgSend(v4, "_tryToPerformTransactionOnDatabase:inBlock:", v5, v13);
  v7 = *(id **)(a1 + 64);
  if (v7)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 56))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke_3;
    block[3] = &unk_1E4B39220;
    v11 = *(id *)(a1 + 56);
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __130__WBSFormAutoFillCorrectionsSQLiteStore_replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 completionHandler:(id)a6
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
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:date:completionHandler:](self, "_setLocalClassification:forFieldWithFingerprint:onDomain:date:completionHandler:", v14, v10, v11, v13, v12);

}

- (void)setCrowdsourcedClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *databaseQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(v10, "copy");
  v15 = (void *)objc_msgSend(v11, "copy");
  v16 = (void *)objc_msgSend(v12, "copy");
  v17 = operator new();
  MEMORY[0x1A8599720](v17, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke;
  v23[3] = &unk_1E4B39338;
  v23[4] = self;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v27 = v13;
  v28 = v17;
  v19 = v13;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_async(databaseQueue, v23);

}

void __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  id *v7;
  dispatch_qos_class_t qos_class;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  v2 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = v4[4];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke_2;
  v13[3] = &unk_1E4B39310;
  v13[4] = v4;
  v14 = v3;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v6 = objc_msgSend(v4, "_tryToPerformTransactionOnDatabase:inBlock:", v5, v13);
  v7 = *(id **)(a1 + 72);
  if (v7)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 64))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke_3;
    v10[3] = &unk_1E4B39220;
    v11 = *(id *)(a1 + 64);
    v12 = v6;
    dispatch_async(v9, v10);

  }
}

uint64_t __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCrowdsourcedClassification:forFieldWithFingerprint:onDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __122__WBSFormAutoFillCorrectionsSQLiteStore_setCrowdsourcedClassification_forFieldWithFingerprint_onDomain_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getClassificationForFieldWithFingerprint:(id)a3 onDomain:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *databaseQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = (void *)objc_msgSend(v9, "copy");
  databaseQueue = self->_databaseQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __109__WBSFormAutoFillCorrectionsSQLiteStore_getClassificationForFieldWithFingerprint_onDomain_completionHandler___block_invoke;
  v17[3] = &unk_1E4B39360;
  v17[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  dispatch_async(databaseQueue, v17);

}

void __109__WBSFormAutoFillCorrectionsSQLiteStore_getClassificationForFieldWithFingerprint_onDomain_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_qos_class_t qos_class;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_classificationForFieldWithFingerprint:onDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
  dispatch_get_global_queue(qos_class, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __109__WBSFormAutoFillCorrectionsSQLiteStore_getClassificationForFieldWithFingerprint_onDomain_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4B29E18;
  v5 = *(id *)(a1 + 56);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  dispatch_async(v4, v7);

}

uint64_t __109__WBSFormAutoFillCorrectionsSQLiteStore_getClassificationForFieldWithFingerprint_onDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removeLocalClassificationsForDomain:(id)a3 recordedOnOrAfter:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *databaseQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = operator new();
  MEMORY[0x1A8599720](v12, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke;
  block[3] = &unk_1E4B39248;
  block[4] = self;
  v18 = v11;
  v20 = v10;
  v21 = v12;
  v19 = v9;
  v14 = v10;
  v15 = v9;
  v16 = v11;
  dispatch_async(databaseQueue, block);

}

void __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  id *v7;
  dispatch_qos_class_t qos_class;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  char v12;
  _QWORD v13[5];
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  v2 = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = v4[3];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke_2;
  v13[3] = &unk_1E4B391F8;
  v13[4] = v4;
  v14 = v3;
  v15 = *(id *)(a1 + 48);
  v6 = objc_msgSend(v4, "_tryToPerformTransactionOnDatabase:inBlock:", v5, v13);
  v7 = *(id **)(a1 + 64);
  if (v7)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 56))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke_3;
    block[3] = &unk_1E4B39220;
    v11 = *(id *)(a1 + 56);
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeLocalClassificationsForDomain:recordedOnOrAfter:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __113__WBSFormAutoFillCorrectionsSQLiteStore_removeLocalClassificationsForDomain_recordedOnOrAfter_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)removeAllLocalClassificationsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *databaseQueue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = operator new();
  MEMORY[0x1A8599720](v5, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E4B393B0;
  v9 = v4;
  v10 = v5;
  block[4] = self;
  v7 = v4;
  dispatch_async(databaseQueue, block);

}

void __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id *v6;
  dispatch_qos_class_t qos_class;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  char v11;
  _QWORD v12[5];

  objc_msgSend(*(id *)(a1 + 32), "_openDatabasesIfNeeded");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v4 = v2[3];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E4B39388;
  v12[4] = v2;
  v5 = objc_msgSend(v2, "_tryToPerformTransactionOnDatabase:inBlock:", v4, v12);
  v6 = *(id **)(a1 + 48);
  if (v6)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v6);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 40))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E4B39220;
    v10 = *(id *)(a1 + 40);
    v11 = v5;
    dispatch_async(v8, block);

  }
}

uint64_t __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllLocalClassifications");
}

uint64_t __92__WBSFormAutoFillCorrectionsSQLiteStore_removeAllLocalClassificationsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (int)_schemaVersionForDatabase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  if (-[WBSFormAutoFillCorrectionsSQLiteStore _isDatabaseOpen:](self, "_isDatabaseOpen:", v4))
  {
    SafariShared::WBSSQLiteDatabaseFetch<>(v4, CFSTR("PRAGMA user_version"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intAtIndex:", 0);

    objc_msgSend(v5, "statement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int)_migrateToCurrentSchemaVersionIfNeededForDatabase:(id)a3
{
  WBSSQLiteDatabase *v4;
  unsigned int v5;
  uint64_t v6;
  WBSSQLiteDatabase *localDatabase;
  int v8;
  int v9;

  v4 = (WBSSQLiteDatabase *)a3;
  v5 = -[WBSFormAutoFillCorrectionsSQLiteStore _schemaVersionForDatabase:](self, "_schemaVersionForDatabase:", v4);
  LODWORD(v6) = v5;
  localDatabase = self->_localDatabase;
  if (localDatabase == v4)
    v8 = 4;
  else
    v8 = 1;
  if (v5 < v8)
  {
    if (!v5)
    {
      if (localDatabase == v4
        && -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema](self, "_createFreshLocalDatabaseSchema") != 101|| self->_parsecDatabase == v4&& -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshParsecDatabaseSchema](self, "_createFreshParsecDatabaseSchema") != 101)
      {
        LODWORD(v6) = 0;
        goto LABEL_20;
      }
      LODWORD(v6) = 1;
    }
    if (v8 <= (int)v6)
      v9 = v6;
    else
      v9 = v8;
    while (v9 != (_DWORD)v6)
    {
      v6 = (v6 + 1);
      if (!-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion:forDatabase:](self, "_migrateToSchemaVersion:forDatabase:", v6, v4))
      {
        v9 = v6 - 1;
        break;
      }
    }
    if (v9 >= v8)
      LODWORD(v6) = v8;
    else
      LODWORD(v6) = v9;
  }
LABEL_20:

  return v6;
}

- (BOOL)_migrateToSchemaVersion:(int)a3 forDatabase:(id)a4
{
  uint64_t v4;
  id v6;
  NSString *v7;
  SEL v8;
  id v9;
  _QWORD v11[5];
  id v12;
  SEL v13;
  int v14;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_migrateToSchemaVersion_%d"), v4);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSSelectorFromString(v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__WBSFormAutoFillCorrectionsSQLiteStore__migrateToSchemaVersion_forDatabase___block_invoke;
  v11[3] = &unk_1E4B393D8;
  v11[4] = self;
  v13 = v8;
  v14 = v4;
  v9 = v6;
  v12 = v9;
  LOBYTE(self) = -[WBSFormAutoFillCorrectionsSQLiteStore _tryToPerformTransactionOnDatabase:inBlock:](self, "_tryToPerformTransactionOnDatabase:inBlock:", v9, v11);

  return (char)self;
}

BOOL __77__WBSFormAutoFillCorrectionsSQLiteStore__migrateToSchemaVersion_forDatabase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  int v6;

  objc_msgSend(*(id *)(a1 + 32), "methodSignatureForSelector:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelector:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "invokeWithTarget:", *(_QWORD *)(a1 + 32));
  v6 = 0;
  objc_msgSend(v3, "getReturnValue:", &v6);
  v4 = v6 == 101
    && objc_msgSend(*(id *)(a1 + 32), "_setDatabaseSchemaVersion:forDatabase:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40)) != 0;

  return v4;
}

- (int)_setDatabaseSchemaVersion:(int)a3 forDatabase:(id)a4
{
  uint64_t v4;
  id v5;
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

  v4 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v12 = v4;
      v13 = 2112;
      v14 = v10;
      v15 = 1024;
      v16 = v7;
      _os_log_error_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_ERROR, "Failed to set the AutoFill corrections database schema version to %d: %@ (%d)", buf, 0x18u);

    }
  }

  return v7;
}

- (int)_createFreshLocalDatabaseSchema
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("CREATE TABLE whitelist (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)"));
  if (v3 != 101)
  {
    v8 = v3;
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.6();
    }
    goto LABEL_25;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("CREATE TABLE hosts (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)"));
  if (v4 != 101)
  {
    v8 = v4;
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.5();
    }
    goto LABEL_25;
  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("CREATE TABLE visited_hosts (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)"));
  if (v5 != 101)
  {
    v8 = v5;
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.4();
    }
    goto LABEL_25;
  }
  v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("CREATE TABLE corrections (id INTEGER PRIMARY KEY AUTOINCREMENT,host_id INTEGER NOT NULL REFERENCES hosts(id) ON DELETE CASCADE,fingerprint TEXT NOT NULL,classification TEXT)"));
  if (v6 != 101)
  {
    v8 = v6;
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.3();
    }
    goto LABEL_25;
  }
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("CREATE TABLE user_corrections (id INTEGER PRIMARY KEY AUTOINCREMENT,host_id INTEGER NOT NULL REFERENCES visited_hosts(id) ON DELETE CASCADE,fingerprint TEXT NOT NULL,classification TEXT,first_correction_time REAL NOT NULL)"));
  if (v7 != 101)
  {
    v8 = v7;
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.2();
    }
    goto LABEL_25;
  }
  v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("CREATE TABLE metadata (key TEXT NOT NULL UNIQUE, value)"));
  if (v8 != 101)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.1();
    }
LABEL_25:

    return v8;
  }
  -[WBSFormAutoFillCorrectionsSQLiteStore _setDatabaseSchemaVersion:forDatabase:](self, "_setDatabaseSchemaVersion:forDatabase:", 1, self->_localDatabase);
  return v8;
}

- (int)_createFreshParsecDatabaseSchema
{
  int v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, CFSTR("CREATE TABLE whitelist (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)"));
  if (v3 != 101)
  {
    v6 = v3;
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.6();
    }
    goto LABEL_17;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, CFSTR("CREATE TABLE hosts (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE)"));
  if (v4 != 101)
  {
    v6 = v4;
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.5();
    }
    goto LABEL_17;
  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, CFSTR("CREATE TABLE corrections (id INTEGER PRIMARY KEY AUTOINCREMENT,host_id INTEGER REFERENCES hosts(id) ON DELETE CASCADE,fingerprint TEXT NOT NULL,classification TEXT)"));
  if (v5 != 101)
  {
    v6 = v5;
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.3();
    }
    goto LABEL_17;
  }
  v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, CFSTR("CREATE TABLE metadata (key TEXT NOT NULL UNIQUE, value)"));
  if (v6 != 101)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _createFreshLocalDatabaseSchema].cold.1();
    }
LABEL_17:

    return v6;
  }
  -[WBSFormAutoFillCorrectionsSQLiteStore _setDatabaseSchemaVersion:forDatabase:](self, "_setDatabaseSchemaVersion:forDatabase:", 1, self->_parsecDatabase);
  return v6;
}

- (int)_migrateToSchemaVersion_2
{
  int v3;
  int v4;
  NSObject *v5;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("DROP TABLE corrections"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_2].cold.2();
    }
    goto LABEL_7;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("CREATE TABLE corrections (id INTEGER PRIMARY KEY AUTOINCREMENT,host_id INTEGER REFERENCES hosts(id) ON DELETE CASCADE,fingerprint TEXT NOT NULL,classification TEXT)"));
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_2].cold.1();
    }
LABEL_7:

  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  int v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("DROP TABLE corrections"));
  if (v3 != 101)
  {
    v6 = v3;
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_3].cold.4();
    }
    goto LABEL_13;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("DROP TABLE hosts"));
  if (v4 != 101)
  {
    v6 = v4;
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_3].cold.3();
    }
    goto LABEL_13;
  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("DROP TABLE whitelist"));
  if (v5 != 101)
  {
    v6 = v5;
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_3].cold.2();
    }
    goto LABEL_13;
  }
  v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("DROP TABLE metadata"));
  if (v6 != 101)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_3].cold.1();
    }
LABEL_13:

  }
  return v6;
}

- (int)_migrateToSchemaVersion_4
{
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  WBSSQLiteDatabase *localDatabase;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("DELETE FROM user_corrections WHERE classification = ''"));
  if (v3 == 101)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    SafariShared::WBSSQLiteDatabaseFetch<>(self->_localDatabase, CFSTR("SELECT DISTINCT host_id FROM user_corrections"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v5, "nextObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
        break;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "int64AtIndex:", 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v4, "addObject:", v8);

    }
    v9 = objc_msgSend(v5, "lastResultCode");
    if (v9 != 101)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_localDatabase, "lastErrorWithMethodName:", "-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_4]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "safari_privacyPreservingDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        v26 = 1024;
        v27 = v9;
        _os_log_error_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_ERROR, "Failed to enumerate visited host IDs after pruning empty local classifications: %{public}@ (%d)", buf, 0x12u);

      }
      goto LABEL_18;
    }
    -[NSObject componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR(","));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject length](v12, "length");
    localDatabase = self->_localDatabase;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM visited_hosts WHERE id NOT IN (%@)"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(localDatabase, 0, v15);

      if (v9 != 101)
      {
        v16 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_localDatabase, "lastErrorWithMethodName:", "-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_4]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "safari_privacyPreservingDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v18;
          v26 = 1024;
          v27 = v9;
          _os_log_error_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_ERROR, "Failed to clear unneeded visited hosts after pruning empty local classifications: %{public}@ (%d)", buf, 0x12u);

        }
LABEL_17:

      }
    }
    else
    {
      v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("DELETE FROM visited_hosts"));
      if (v9 != 101)
      {
        v16 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_localDatabase, "lastErrorWithMethodName:", "-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_4]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "safari_privacyPreservingDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v23;
          v26 = 1024;
          v27 = v9;
          _os_log_error_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_ERROR, "Failed to clear all visited hosts after pruning empty local classifications: %{public}@ (%d)", buf, 0x12u);

        }
        goto LABEL_17;
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  v9 = v3;
  v4 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_localDatabase, "lastErrorWithMethodName:", "-[WBSFormAutoFillCorrectionsSQLiteStore _migrateToSchemaVersion_4]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_privacyPreservingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 1024;
    v27 = v9;
    _os_log_error_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_ERROR, "Failed to drop old empty local classifications: %{public}@ (%d)", buf, 0x12u);

  }
LABEL_19:

  return v9;
}

- (id)_normalizeDomain:(id)a3
{
  id v4;
  WBSCrowdsourcedFeedbackDomainNormalizer *domainNormalizer;
  WBSCrowdsourcedFeedbackDomainNormalizer *v6;
  WBSCrowdsourcedFeedbackDomainNormalizer *v7;
  void *v8;

  v4 = a3;
  domainNormalizer = self->_domainNormalizer;
  if (!domainNormalizer)
  {
    v6 = objc_alloc_init(WBSCrowdsourcedFeedbackDomainNormalizer);
    v7 = self->_domainNormalizer;
    self->_domainNormalizer = v6;

    domainNormalizer = self->_domainNormalizer;
  }
  -[WBSCrowdsourcedFeedbackDomainNormalizer transformedValue:](domainNormalizer, "transformedValue:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_openDatabasesIfNeeded
{
  id v3[3];

  MEMORY[0x1A8599720](v3, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  if (!-[WBSFormAutoFillCorrectionsSQLiteStore _isDatabaseOpen:](self, "_isDatabaseOpen:", self->_localDatabase))
    -[WBSFormAutoFillCorrectionsSQLiteStore _openLocalDatabase](self, "_openLocalDatabase");
  if (!-[WBSFormAutoFillCorrectionsSQLiteStore _isDatabaseOpen:](self, "_isDatabaseOpen:", self->_parsecDatabase))
    -[WBSFormAutoFillCorrectionsSQLiteStore _openParsecDatabase](self, "_openParsecDatabase");
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
}

- (void)_configureDatabase:(id)a3 currentSchemaVersion:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[40];
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBusyTimeout:", 1.0);
  v17 = 0;
  v8 = objc_msgSend(v6, "enableWAL:", &v17);
  v9 = v17;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (objc_msgSend(v9, "code") == 5)
    {
      v11 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "lastPathComponent");
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _configureDatabase:currentSchemaVersion:].cold.1();
      }

      -[WBSFormAutoFillCorrectionsSQLiteStore _closeDatabases](self, "_closeDatabases");
      goto LABEL_11;
    }
    v12 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _configureDatabase:currentSchemaVersion:].cold.2(v13, v14, buf, v12);
    }

  }
  SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, CFSTR("PRAGMA foreign_keys = ON"));
  v15 = -[WBSFormAutoFillCorrectionsSQLiteStore _migrateToCurrentSchemaVersionIfNeededForDatabase:](self, "_migrateToCurrentSchemaVersionIfNeededForDatabase:", v6);
  if ((_DWORD)v15 != (_DWORD)v4)
  {
    objc_msgSend(v7, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    WTFLogAlways();

    -[WBSFormAutoFillCorrectionsSQLiteStore _closeDatabases](self, "_closeDatabases", v15, v4, v16);
  }
LABEL_11:

}

- (void)_openParsecDatabase
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v1, v3, "Failed to mark Parsec AutoFill corrections SQLite store as excluded from backup.  Error: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_openLocalDatabase
{
  WBSSQLiteDatabase *v3;
  WBSSQLiteDatabase *localDatabase;
  WBSSQLiteDatabase *v5;
  char v6;
  id v7;
  void *v8;
  WBSSQLiteDatabase *v9;
  void *v10;
  id v11;

  v3 = (WBSSQLiteDatabase *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC0]), "initWithURL:queue:", self->_localDatabaseURL, self->_databaseQueue);
  localDatabase = self->_localDatabase;
  self->_localDatabase = v3;

  v5 = self->_localDatabase;
  v11 = 0;
  v6 = -[WBSSQLiteDatabase openWithAccessType:error:](v5, "openWithAccessType:error:", 3, &v11);
  v7 = v11;
  if ((v6 & 1) != 0)
  {
    -[WBSFormAutoFillCorrectionsSQLiteStore _configureDatabase:currentSchemaVersion:](self, "_configureDatabase:currentSchemaVersion:", self->_localDatabase, 4);
  }
  else
  {
    -[NSURL lastPathComponent](self->_localDatabaseURL, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_privacyPreservingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WTFLogAlways();

    v9 = self->_localDatabase;
    self->_localDatabase = 0;

  }
}

- (void)_closeDatabases
{
  WBSSQLiteDatabase *localDatabase;
  WBSSQLiteDatabase *parsecDatabase;

  -[WBSSQLiteDatabase close](self->_localDatabase, "close");
  localDatabase = self->_localDatabase;
  self->_localDatabase = 0;

  -[WBSSQLiteDatabase close](self->_parsecDatabase, "close");
  parsecDatabase = self->_parsecDatabase;
  self->_parsecDatabase = 0;

}

- (BOOL)_isDatabaseOpen:(id)a3
{
  return a3 != 0;
}

- (BOOL)_tryToPerformTransactionOnDatabase:(id)a3 inBlock:(id)a4
{
  id v6;
  unsigned int (**v7)(_QWORD);
  BOOL v8;
  NSObject *v9;

  v6 = a3;
  v7 = (unsigned int (**)(_QWORD))a4;
  if (!-[WBSFormAutoFillCorrectionsSQLiteStore _isDatabaseOpen:](self, "_isDatabaseOpen:", v6))
    goto LABEL_9;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, CFSTR("BEGIN TRANSACTION")) != 101)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _tryToPerformTransactionOnDatabase:inBlock:].cold.3();
    }
    goto LABEL_8;
  }
  if (!v7[2](v7))
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, CFSTR("ROLLBACK TRANSACTION")) == 101)
      goto LABEL_9;
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _tryToPerformTransactionOnDatabase:inBlock:].cold.2();
    }
LABEL_8:

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v6, 0, CFSTR("COMMIT TRANSACTION")) != 101)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _tryToPerformTransactionOnDatabase:inBlock:].cold.1();
    }
    goto LABEL_8;
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)_replaceDomainAllowListWithDomains:(id)a3 retrievalURLString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  WBSFormAutoFillCorrectionsSQLiteStore *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, CFSTR("DELETE FROM whitelist")) == 101)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke;
    v22[3] = &unk_1E4B39400;
    v22[4] = self;
    v10 = v8;
    v23 = v10;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v22);
    v11 = objc_msgSend(v10, "count");
    if (v11 == objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "count");
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_2;
      v18[3] = &unk_1E4B2C238;
      v14 = v12;
      v20 = self;
      v21 = v13;
      v19 = v14;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v18);
      v15 = -[WBSFormAutoFillCorrectionsSQLiteStore _setParsecMetadataStringValue:forKey:](self, "_setParsecMetadataStringValue:forKey:", v7, CFSTR("lastWhitelistRetrievalURL"));

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _replaceDomainAllowListWithDomains:retrievalURLString:].cold.1();
    }

    v15 = 0;
  }

  return v15;
}

void __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_normalizeDomain:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  else
    *a4 = 1;

}

void __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if (__ROR8__(0x1CAC083126E978D5 * (a3 - 499), 2) < 0x83126E978D4FDFuLL || *(_QWORD *)(a1 + 48) - 1 == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", CFSTR("INSERT INTO whitelist (domain) VALUES "));
    v6 = *(void **)(a1 + 32);
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_3;
    v18[3] = &unk_1E4B39428;
    v8 = v5;
    v19 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
    objc_msgSend(v8, "replaceCharactersInRange:withString:", objc_msgSend(v8, "length") - 1, 1, &stru_1E4B40D18);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), v8);
    v10 = *(void **)(a1 + 32);
    v13 = v7;
    v14 = 3221225472;
    v15 = __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_4;
    v16 = &unk_1E4B39428;
    v11 = v9;
    v17 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v13);
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", v13, v14, v15, v16);
    if (objc_msgSend(v11, "execute") != 101)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_2_cold_1();
      }

    }
    objc_msgSend(v11, "invalidate");

  }
}

uint64_t __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("(?%lu),"), a3 + 1);
}

uint64_t __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "bindString:atParameterIndex:", a2, a3 + 1);
}

- (BOOL)_setDomain:(id)a3 isAllowListedForFeedback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  int v8;
  BOOL v10;
  id v12;

  v4 = a4;
  v6 = a3;
  -[WBSFormAutoFillCorrectionsSQLiteStore _normalizeDomain:](self, "_normalizeDomain:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
    return 0;
  if (v4)
    v7 = CFSTR("INSERT INTO whitelist (domain) VALUES (?)");
  else
    v7 = CFSTR("DELETE FROM whitelist WHERE domain = ?");
  v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_parsecDatabase, 0, v7, &v12);
  v10 = v8 == 101 || v8 == 19;

  return v10;
}

- (id)_parsecMetadataStringValueForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v8;

  v8 = a3;
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_parsecDatabase, CFSTR("SELECT value FROM metadata WHERE key = ?"), &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_setParsecMetadataStringValue:(id)a3 forKey:(id)a4
{
  WBSSQLiteDatabase *parsecDatabase;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  parsecDatabase = self->_parsecDatabase;
  if (v17)
  {
    v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(parsecDatabase, 0, CFSTR("UPDATE metadata SET value = ? WHERE key = ?"), &v17, &v16);
    if (v7 != 101)
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      goto LABEL_6;
    }
    if (!-[WBSSQLiteDatabase changedRowCount](self->_parsecDatabase, "changedRowCount"))
    {
      v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(self->_parsecDatabase, 0, CFSTR("INSERT INTO metadata (key, value) VALUES (?, ?)"), &v16, &v17);
      if (v7 != 101)
      {
        v8 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
LABEL_13:

          v12 = 0;
          goto LABEL_14;
        }
LABEL_6:
        v9 = v16;
        -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        v22 = 1024;
        v23 = v7;
        _os_log_error_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_ERROR, "Failed to update metadata value %@: %@ (%d)", buf, 0x1Cu);

        goto LABEL_13;
      }
    }
  }
  else
  {
    v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(parsecDatabase, 0, CFSTR("DELETE FROM metadata WHERE key = ?"), &v16);
    if (v11 != 101)
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v14 = v16;
        -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = v14;
        v20 = 2112;
        v21 = v15;
        v22 = 1024;
        v23 = v11;
        _os_log_error_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_ERROR, "Failed to delete metadata value %@: %@ (%d)", buf, 0x1Cu);

      }
      goto LABEL_13;
    }
  }
  v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)_setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 dateReclassified:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  WBSSQLiteDatabase *localDatabase;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27[5];

  v27[4] = *(id *)MEMORY[0x1E0C80C00];
  v27[0] = a3;
  v26 = a4;
  v10 = a5;
  v11 = a6;
  -[WBSFormAutoFillCorrectionsSQLiteStore _normalizeDomain:](self, "_normalizeDomain:", v10);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_localDatabase, CFSTR("SELECT id FROM visited_hosts WHERE domain = ?"), &v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nextObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "int64AtIndex:", 0);
    }
    else
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_localDatabase, 0, CFSTR("INSERT INTO visited_hosts (domain) VALUES (?)"), &v25) != 101)
      {
        v21 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.4();
        }

        goto LABEL_26;
      }
      v15 = -[WBSSQLiteDatabase lastInsertRowID](self->_localDatabase, "lastInsertRowID");
    }
    v24 = v15;

    localDatabase = self->_localDatabase;
    if (v27[0])
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,long long &,NSString * {__strong}&>(localDatabase, 0, CFSTR("UPDATE user_corrections SET classification = ? WHERE host_id = ? AND fingerprint = ?"), v27, &v24, &v26) == 101)
      {
        if (!-[WBSSQLiteDatabase changedRowCount](self->_localDatabase, "changedRowCount"))
        {
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          v23 = v18;
          if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * {__strong}&,NSString * {__strong}&,double &>(self->_localDatabase, 0, CFSTR("INSERT INTO user_corrections (host_id, fingerprint, classification, first_correction_time) VALUES (?, ?, ?, ?)"), &v24, &v26, v27, (double *)&v23) != 101|| !-[WBSSQLiteDatabase lastInsertRowID](self->_localDatabase, "lastInsertRowID"))
          {
            v19 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
              objc_claimAutoreleasedReturnValue();
              -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.2();
            }

            goto LABEL_26;
          }
        }
LABEL_16:
        v16 = 1;
LABEL_27:

        goto LABEL_28;
      }
      v20 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.3();
      }
    }
    else
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * {__strong}&>(localDatabase, 0, CFSTR("DELETE FROM user_corrections WHERE host_id = ? AND fingerprint = ?"), &v24, &v26) == 101)goto LABEL_16;
      v20 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.1();
      }
    }

LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)_replaceCrowdsourcedCorrectionSetsWithCorrectionSets:(id)a3 retrievalURLString:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  id v16;
  id v17;
  id obj;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v16 = a4;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, CFSTR("DELETE FROM corrections")) != 101)
  {
    v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:].cold.2();
    }
    goto LABEL_18;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_parsecDatabase, 0, CFSTR("DELETE FROM hosts")) != 101)
  {
    v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:].cold.1();
    }
LABEL_18:

    v13 = 0;
    goto LABEL_21;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v17;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
      objc_msgSend(v9, "domain", v16);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fingerprintsToClassifications");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __113__WBSFormAutoFillCorrectionsSQLiteStore__replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString___block_invoke;
      v19[3] = &unk_1E4B39450;
      v21 = &v27;
      v19[4] = self;
      v12 = (id)v10;
      v20 = v12;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v19);

      LOBYTE(v10) = *((_BYTE *)v28 + 24) == 0;
      if ((v10 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v6)
          goto LABEL_5;
        break;
      }
    }
  }

  if (*((_BYTE *)v28 + 24))
    v13 = -[WBSFormAutoFillCorrectionsSQLiteStore _setParsecMetadataStringValue:forKey:](self, "_setParsecMetadataStringValue:forKey:", v16, CFSTR("lastCorrectionsRetrievalURL"));
  else
    v13 = 0;
  _Block_object_dispose(&v27, 8);
LABEL_21:

  return v13;
}

void __113__WBSFormAutoFillCorrectionsSQLiteStore__replaceCrowdsourcedCorrectionSetsWithCorrectionSets_retrievalURLString___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setCrowdsourcedClassification:forFieldWithFingerprint:onDomain:", v7, v8, *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

- (BOOL)_setCrowdsourcedClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  WBSSQLiteDatabase *v14;
  int v15;
  WBSSQLiteDatabase *parsecDatabase;
  NSObject *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v22;
  id v23;
  id v24;
  id v25[5];

  v25[4] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v25[0] = v8;
  v24 = a4;
  v9 = a5;
  -[WBSFormAutoFillCorrectionsSQLiteStore _normalizeDomain:](self, "_normalizeDomain:", v9);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_parsecDatabase, CFSTR("SELECT id FROM hosts WHERE domain = ?"), &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject", 0x7FFFFFFFFFFFFFFFLL, v23, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "int64AtIndex:", 0);
    }
    else
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_parsecDatabase, 0, CFSTR("INSERT INTO hosts (domain) VALUES (?)"), &v23) != 101)
      {
        v19 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.4();
        }
        goto LABEL_32;
      }
      v13 = -[WBSSQLiteDatabase lastInsertRowID](self->_parsecDatabase, "lastInsertRowID");
    }
    v22 = v13;

    parsecDatabase = self->_parsecDatabase;
    if (v25[0])
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,long long &,NSString * {__strong}&>(parsecDatabase, 0, CFSTR("UPDATE corrections SET classification = ? WHERE host_id = ? AND fingerprint = ?"), v25, &v22, &v24) == 101)
      {
        if (!-[WBSSQLiteDatabase changedRowCount](self->_parsecDatabase, "changedRowCount", v22))
        {
          v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * {__strong}&,NSString * {__strong}&>(self->_parsecDatabase, 0, CFSTR("INSERT INTO corrections (host_id, fingerprint, classification) VALUES (?, ?, ?)"), &v22, &v24, v25);

          goto LABEL_14;
        }
        goto LABEL_20;
      }
      v19 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage", v22);
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.3();
      }
    }
    else
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * {__strong}&>(parsecDatabase, 0, CFSTR("DELETE FROM corrections WHERE host_id = ? AND fingerprint = ?"), &v22, &v24) == 101)
      {
LABEL_20:
        v18 = 1;
LABEL_33:

        goto LABEL_38;
      }
      v19 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage", v22);
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.1();
      }
    }
LABEL_32:

    v18 = 0;
    goto LABEL_33;
  }
  v14 = self->_parsecDatabase;
  if (!v8)
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v14, 0, CFSTR("DELETE FROM corrections WHERE fingerprint = ? AND host_id IS NULL"), &v24) == 101)goto LABEL_24;
    v20 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.1();
    }
LABEL_36:

LABEL_37:
    v18 = 0;
    goto LABEL_38;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v14, 0, CFSTR("UPDATE corrections SET classification = ? WHERE fingerprint = ? AND host_id IS NULL"), v25, &v24) != 101)
  {
    v20 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.3();
    }
    goto LABEL_36;
  }
  if (!-[WBSSQLiteDatabase changedRowCount](self->_parsecDatabase, "changedRowCount"))
  {
    v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(self->_parsecDatabase, 0, CFSTR("INSERT INTO corrections (fingerprint, classification) VALUES (?, ?)"), &v24, v25);
LABEL_14:
    if (v15 != 101 || !-[WBSSQLiteDatabase lastInsertRowID](self->_parsecDatabase, "lastInsertRowID"))
    {
      v17 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_parsecDatabase, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:].cold.2();
      }

      goto LABEL_37;
    }
  }
LABEL_24:
  v18 = 1;
LABEL_38:

  return v18;
}

- (id)_classificationForFieldWithFingerprint:(id)a3 onDomain:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  void *v23;
  id v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  id v54;
  id v55;

  v6 = a3;
  v55 = v6;
  v54 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.10((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerForKey:", CFSTR("WBSDebugCrowdsourcedAutoFillCorrectionsMode"));

  switch(v15)
  {
    case 0:
      v16 = 0;
      v17 = 0;
      goto LABEL_15;
    case 1:
      v18 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.7();
      v16 = 0;
      goto LABEL_14;
    case 2:
      v19 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.8();
      v17 = 0;
      v16 = 1;
      goto LABEL_15;
    case 3:
      v20 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.9();
      goto LABEL_38;
    default:
      v16 = 1;
LABEL_14:
      v17 = 1;
LABEL_15:
      v21 = -[WBSFormAutoFillCorrectionsSQLiteStore _isDatabaseOpen:](self, "_isDatabaseOpen:", self->_localDatabase);
      v22 = -[WBSFormAutoFillCorrectionsSQLiteStore _isDatabaseOpen:](self, "_isDatabaseOpen:", self->_parsecDatabase);
      if (!v21 && !v22)
      {
        v41 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.6();
        goto LABEL_38;
      }
      -[WBSFormAutoFillCorrectionsSQLiteStore _normalizeDomain:](self, "_normalizeDomain:", v54);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v54;
      v54 = v23;

      v53 = 0x7FFFFFFFFFFFFFFFLL;
      if (v54)
        v25 = v21;
      else
        v25 = 0;
      if (!v25)
        goto LABEL_27;
      SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_localDatabase, CFSTR("SELECT id FROM visited_hosts WHERE domain = ?"), &v54);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "nextObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
        v53 = objc_msgSend(v27, "int64AtIndex:", 0);

      if (v53 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_27;
      v29 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.5();
      SafariShared::WBSSQLiteDatabaseFetch<long long &,NSString * {__strong}&>(self->_localDatabase, CFSTR("SELECT classification FROM user_corrections WHERE host_id = ? AND fingerprint = ?"), &v53, &v55);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "nextObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (((v31 != 0) & ~v16) == 0)
      {

LABEL_27:
        if (((v17 | !v22) & 1) == 0)
        {
          if (v54)
          {
            SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_parsecDatabase, CFSTR("SELECT id FROM hosts WHERE domain = ?"), &v54);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "nextObject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (v34)
              v53 = objc_msgSend(v34, "int64AtIndex:", 0);

          }
          if (v53 == 0x7FFFFFFFFFFFFFFFLL)
          {
            SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_parsecDatabase, CFSTR("SELECT classification FROM corrections WHERE fingerprint = ? AND host_id IS NULL"), &v55);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "nextObject");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            if (v37)
            {
              objc_msgSend(v37, "stringAtIndex:", 0);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.2();
              goto LABEL_44;
            }
          }
          else
          {
            v43 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.3();
            SafariShared::WBSSQLiteDatabaseFetch<long long &,NSString * {__strong}&>(self->_parsecDatabase, CFSTR("SELECT classification FROM corrections WHERE host_id = ? AND fingerprint = ?"), &v53, &v55);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "nextObject");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v44;
            if (v44)
            {
              objc_msgSend(v44, "stringAtIndex:", 0);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:

              goto LABEL_39;
            }
          }

          v45 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.1((uint64_t)&v55, v45, v46, v47, v48, v49, v50, v51);
        }
LABEL_38:
        v39 = 0;
        goto LABEL_39;
      }
      objc_msgSend(v31, "stringAtIndex:", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        -[WBSFormAutoFillCorrectionsSQLiteStore _classificationForFieldWithFingerprint:onDomain:].cold.4();

LABEL_39:
      return v39;
  }
}

- (BOOL)_removeLocalClassificationsForDomain:(id)a3 recordedOnOrAfter:(id)a4
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  WBSSQLiteDatabase *localDatabase;
  double v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v21;
  id v22;
  double v23[4];

  v23[3] = *(double *)MEMORY[0x1E0C80C00];
  v22 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToDate:", v7);

  if (!v8)
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_localDatabase, CFSTR("SELECT id FROM visited_hosts WHERE domain = ?"), &v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "int64AtIndex:", 0);
      v21 = v13;
    }
    else
    {
      v13 = v21;
    }
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        -[WBSFormAutoFillCorrectionsSQLiteStore _removeLocalClassificationsForDomain:recordedOnOrAfter:].cold.1();
      }
    }
    else
    {
      localDatabase = self->_localDatabase;
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      v23[0] = v16;
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,double>(localDatabase, 0, CFSTR("DELETE FROM user_corrections WHERE host_id = ? AND first_correction_time >= ?"), &v21, v23) == 101)
      {
        SafariShared::WBSSQLiteDatabaseFetch<long long &>(self->_localDatabase, CFSTR("SELECT COUNT(*) AS count FROM user_corrections WHERE host_id = ?"), &v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v17, "nextObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "int64AtIndex:", 0) == 0;

          if (!v19
            || SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &>(self->_localDatabase, 0, CFSTR("DELETE FROM visited_hosts WHERE id = ?"), &v21) == 101)
          {
            v9 = 1;
LABEL_23:

            goto LABEL_24;
          }
          v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSFormAutoFillCorrectionsSQLiteStore _removeLocalClassificationsForDomain:recordedOnOrAfter:].cold.3();
          }
          v10 = v17;
        }
        else
        {
          v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
            objc_claimAutoreleasedReturnValue();
            -[WBSFormAutoFillCorrectionsSQLiteStore _removeLocalClassificationsForDomain:recordedOnOrAfter:].cold.2();
          }
          v10 = 0;
        }
      }
      else
      {
        v14 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
          objc_claimAutoreleasedReturnValue();
          -[WBSFormAutoFillCorrectionsSQLiteStore _removeLocalClassificationsForDomain:recordedOnOrAfter:].cold.4();
        }
      }
    }

    v9 = 0;
    v17 = v10;
    goto LABEL_23;
  }
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_localDatabase, 0, CFSTR("DELETE FROM visited_hosts WHERE domain = ?"), &v22) == 101;
LABEL_24:

  return v9;
}

- (void)_setLocalClassification:(id)a3 forFieldWithFingerprint:(id)a4 onDomain:(id)a5 date:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *databaseQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD block[4];
  id v29;
  id v30;
  WBSFormAutoFillCorrectionsSQLiteStore *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27 = v12;
  v17 = (void *)objc_msgSend(v12, "copy");
  v18 = (void *)objc_msgSend(v13, "copy");
  v19 = (void *)objc_msgSend(v14, "copy");
  v20 = operator new();
  MEMORY[0x1A8599720](v20, CFSTR("com.apple.SafariShared.WBSFormAutoFillCorrectionsSQLiteStore"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke;
  block[3] = &unk_1E4B394A0;
  v29 = v17;
  v30 = v18;
  v31 = self;
  v32 = v19;
  v34 = v16;
  v35 = v20;
  v33 = v15;
  v22 = v16;
  v23 = v15;
  v24 = v19;
  v25 = v18;
  v26 = v17;
  dispatch_async(databaseQueue, block);

}

void __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id *v8;
  dispatch_qos_class_t qos_class;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  char v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v2 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_cold_1(a1, v2, v3);
  objc_msgSend(*(id *)(a1 + 48), "_openDatabasesIfNeeded");
  v4 = *(_QWORD **)(a1 + 48);
  v5 = v4[3];
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_140;
  v14[3] = &unk_1E4B39478;
  v14[4] = v4;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v7 = objc_msgSend(v4, "_tryToPerformTransactionOnDatabase:inBlock:", v5, v14);
  v8 = *(id **)(a1 + 80);
  if (v8)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v8);
    MEMORY[0x1A85998AC]();
  }
  if (*(_QWORD *)(a1 + 72))
  {
    qos_class = dispatch_queue_get_qos_class(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 48) + 40), 0);
    dispatch_get_global_queue(qos_class, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_2;
    block[3] = &unk_1E4B39220;
    v12 = *(id *)(a1 + 72);
    v13 = v7;
    dispatch_async(v10, block);

  }
}

uint64_t __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_140(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_removeAllLocalClassifications
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_localDatabase, 0, CFSTR("DELETE FROM visited_hosts"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_localDatabase, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSFormAutoFillCorrectionsSQLiteStore _removeAllLocalClassifications].cold.1();
    }

  }
  return v3 == 101;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainNormalizer, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_parsecDatabase, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
  objc_storeStrong((id *)&self->_parsecDatabaseURL, 0);
  objc_storeStrong((id *)&self->_localDatabaseURL, 0);
}

- (void)_createFreshLocalDatabaseSchema
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to create the whitelist table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
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
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to drop the v1 corrections table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_3
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to drop the corrections table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_configureDatabase:currentSchemaVersion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  *(_DWORD *)v1 = 141558275;
  *(_QWORD *)(v1 + 4) = 1752392040;
  *(_WORD *)(v1 + 12) = 2117;
  *(_QWORD *)(v1 + 14) = v2;
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Failed to acquire exclusive access to AutoFill corrections SQLite store at %{sensitive, mask.hash}@.", v4, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_configureDatabase:(uint8_t *)buf currentSchemaVersion:(os_log_t)log .cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 141558531;
  *(_QWORD *)(buf + 4) = 1752392040;
  *((_WORD *)buf + 6) = 2117;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2114;
  *((_QWORD *)buf + 3) = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on AutoFill corrections SQLite store at %{sensitive, mask.hash}@: %{public}@", buf, 0x20u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_tryToPerformTransactionOnDatabase:inBlock:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to commit transaction: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_tryToPerformTransactionOnDatabase:inBlock:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to roll back transaction: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_tryToPerformTransactionOnDatabase:inBlock:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to start a transaction: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_replaceDomainAllowListWithDomains:retrievalURLString:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to clear whitelist entries: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __95__WBSFormAutoFillCorrectionsSQLiteStore__replaceDomainAllowListWithDomains_retrievalURLString___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to insert whitelist entries: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to delete fingerprint: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to insert fingerprint: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to update fingerprint: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_setLocalClassification:forFieldWithFingerprint:onDomain:dateReclassified:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to insert host: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to clear existing correction hosts: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to clear existing corrections: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_classificationForFieldWithFingerprint:(uint64_t)a3 onDomain:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Did not find classification correction in either local or cloud database for fingerprint '%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v0, (uint64_t)v0, "Returning classification '%@' from cloud database for fingerprint '%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Found host in cloud database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v0, (uint64_t)v0, "Returning classification '%@' from local database for fingerprint '%@'", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Found host in local database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.6()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_ERROR, "Neither local nor cloud classification correction databases could be opened", v1, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Processing classification request considering only local database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Processing classification request considering only cloud database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_classificationForFieldWithFingerprint:onDomain:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Processing classification request considering *no* database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_classificationForFieldWithFingerprint:(uint64_t)a3 onDomain:(uint64_t)a4 .cold.10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Processing classification request on database queue for control with fingerprint '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_removeLocalClassificationsForDomain:recordedOnOrAfter:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  *(_DWORD *)v1 = 138412290;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v1, v3, "Failed to find visited host: %@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_removeLocalClassificationsForDomain:recordedOnOrAfter:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  *(_DWORD *)v1 = 138412290;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v1, v3, "Failed to fetch remaining user corrections: %@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_removeLocalClassificationsForDomain:recordedOnOrAfter:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to delete visited host: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_removeLocalClassificationsForDomain:recordedOnOrAfter:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to delete classifications: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __121__WBSFormAutoFillCorrectionsSQLiteStore__setLocalClassification_forFieldWithFingerprint_onDomain_date_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, a2, a3, "Setting local classification '%@' on database queue for control with fingerprint '%@'", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

- (void)_removeAllLocalClassifications
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to delete visited_hosts: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end
