@implementation WBSPasswordBreachManager

+ (BOOL)isPasswordBreachDetectionOn
{
  return objc_msgSend(MEMORY[0x1E0D89C70], "isPasswordBreachDetectionEnabled");
}

+ (void)setPasswordBreachDetectionOn:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D89C70], "setPasswordBreachDetectionEnabled:", a3);
}

- (WBSPasswordBreachManager)initWithContext:(id)a3 credentialSource:(id)a4
{
  id v7;
  id v8;
  WBSPasswordBreachManager *v9;
  WBSPasswordBreachManager *v10;
  uint64_t v11;
  WBSPasswordBreachResults *results;
  WBSPasswordBreachManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordBreachManager;
  v9 = -[WBSPasswordBreachManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_credentialSource, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D89C68]), "initWithContext:", v10->_context);
    results = v10->_results;
    v10->_results = (WBSPasswordBreachResults *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)_checker
{
  os_unfair_lock_s *p_lock;
  WBSPasswordBreachQueuedPasswordBagManager *v4;
  WBSPasswordBreachQueuedPasswordBagManager *bagManager;
  WBSPasswordBreachChecker *v6;
  WBSPasswordBreachChecker *checker;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_bagManager)
  {
    v4 = (WBSPasswordBreachQueuedPasswordBagManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C50]), "initWithContext:results:passwordSource:", self->_context, self->_results, self->_credentialSource);
    bagManager = self->_bagManager;
    self->_bagManager = v4;

  }
  if (!self->_checker)
  {
    v6 = (WBSPasswordBreachChecker *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C20]), "initWithContext:bagManager:", self->_context, self->_bagManager);
    checker = self->_checker;
    self->_checker = v6;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_checker;
}

- (id)resultRecordsForQueries:(id)a3
{
  return (id)-[WBSPasswordBreachResults resultRecordsForQueries:](self->_results, "resultRecordsForQueries:", a3);
}

+ (void)_getStandardContextWithCompletionHandler:(id)a3
{
  id v3;
  WBSPasswordBreachConfigurationBagLoader *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a3;
  if (!_getStandardContextWithCompletionHandler__configurationBagLoader)
  {
    v4 = objc_alloc_init(WBSPasswordBreachConfigurationBagLoader);
    v5 = (void *)_getStandardContextWithCompletionHandler__configurationBagLoader;
    _getStandardContextWithCompletionHandler__configurationBagLoader = (uint64_t)v4;

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_settingsDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("PasswordBreachStore.plist"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C78]), "initWithBackingStoreURL:", v8);
  v10 = (void *)_getStandardContextWithCompletionHandler__configurationBagLoader;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__WBSPasswordBreachManager__getStandardContextWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E4B3DB50;
  v14 = v9;
  v15 = v3;
  v11 = v3;
  v12 = v9;
  objc_msgSend(v10, "getConfigurationBagWithCompletionHandler:", v13);

}

void __69__WBSPasswordBreachManager__getStandardContextWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "firstConfigurationForSupportedProtocolVersion:rampIdentifier:allowValuesForTesting:", 1, objc_msgSend(v3, "rampIdentifier"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C38]), "initWithConfiguration:store:", v6, *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "saveAndCloseStoreSynchronously");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (void)getSharedManagerWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  void (**v9)(id, id);
  _QWORD block[5];

  v4 = (void (**)(id, id))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&getSharedManagerWithCompletionHandler__sharedLock);
  v5 = (id)getSharedManagerWithCompletionHandler__sharedBreachManager;
  os_unfair_lock_unlock((os_unfair_lock_t)&getSharedManagerWithCompletionHandler__sharedLock);
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (getSharedManagerWithCompletionHandler__onceToken != -1)
      dispatch_once(&getSharedManagerWithCompletionHandler__onceToken, block);
    v7 = getSharedManagerWithCompletionHandler__accessQueue;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_5;
    v8[3] = &unk_1E4B2A6E0;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

void __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  _QWORD block[5];

  v2 = dispatch_queue_create("com.apple.SafariShared.WBSPasswordBreachManager.sharedInstanceQueue", 0);
  v3 = (void *)getSharedManagerWithCompletionHandler__accessQueue;
  getSharedManagerWithCompletionHandler__accessQueue = (uint64_t)v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)getSharedManagerWithCompletionHandler__accessQueue, block);
}

void __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_block_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &__block_literal_global_80);
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E4B3DB98;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "_getStandardContextWithCompletionHandler:", v5);
  dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

uint64_t __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  WBSPasswordBreachKeychainCredentialSource *v4;
  WBSPasswordBreachManager *v5;
  void *v6;

  if (a2)
  {
    v3 = a2;
    v4 = objc_alloc_init(WBSPasswordBreachKeychainCredentialSource);
    v5 = -[WBSPasswordBreachManager initWithContext:credentialSource:]([WBSPasswordBreachManager alloc], "initWithContext:credentialSource:", v3, v4);

    os_unfair_lock_lock((os_unfair_lock_t)&getSharedManagerWithCompletionHandler__sharedLock);
    v6 = (void *)getSharedManagerWithCompletionHandler__sharedBreachManager;
    getSharedManagerWithCompletionHandler__sharedBreachManager = (uint64_t)v5;

    os_unfair_lock_unlock((os_unfair_lock_t)&getSharedManagerWithCompletionHandler__sharedLock);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_6;
  block[3] = &unk_1E4B2A6E0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __66__WBSPasswordBreachManager_getSharedManagerWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)testableManagerWithTestCredentialSource:(id)a3 store:(id)a4 configuration:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  WBSPasswordBreachManager *v12;

  v7 = (objc_class *)MEMORY[0x1E0D89C38];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithConfiguration:store:", v8, v9);

  v12 = -[WBSPasswordBreachManager initWithContext:credentialSource:]([WBSPasswordBreachManager alloc], "initWithContext:credentialSource:", v11, v10);
  return v12;
}

- (void)performNextSessionLookupIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  OS_os_transaction *v11;
  OS_os_transaction *sessionTransaction;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  void (**v16)(id, _QWORD);
  uint64_t v17;
  uint8_t buf[16];

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (!+[WBSPasswordBreachManager isPasswordBreachDetectionOn](WBSPasswordBreachManager, "isPasswordBreachDetectionOn"))
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Refusing to start lookup session: Breach detection is turned off.", buf, 2u);
    }
    goto LABEL_13;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sessionTransaction)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Refusing to start lookup session: Session is already running.";
LABEL_11:
      _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!-[WBSPasswordBreachManager _canPerformSessionIgnoringMinimumDelay:](self, "_canPerformSessionIgnoringMinimumDelay:", v4))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Refusing to start lookup session: The minimum delay between sessions has not elapsed.";
      goto LABEL_11;
    }
LABEL_12:
    os_unfair_lock_unlock(p_lock);
LABEL_13:
    v6[2](v6, MEMORY[0x1E0C9AA70]);
    goto LABEL_14;
  }
  v11 = (OS_os_transaction *)os_transaction_create();
  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = v11;

  os_unfair_lock_unlock(&self->_lock);
  -[WBSPasswordBreachManager _checker](self, "_checker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WBSPasswordBreachQueuedPasswordBagManager fillState](self->_bagManager, "fillState");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__WBSPasswordBreachManager_performNextSessionLookupIgnoringMinimumDelay_completionHandler___block_invoke;
  v15[3] = &unk_1E4B3DBC0;
  v15[4] = self;
  v17 = v14;
  v16 = v6;
  objc_msgSend(v13, "checkPasswordBatchesWithCompletionHandler:", v15);

LABEL_14:
}

void __91__WBSPasswordBreachManager_performNextSessionLookupIgnoringMinimumDelay_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__WBSPasswordBreachManager_performNextSessionLookupIgnoringMinimumDelay_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4B2A0F0;
  v4 = (void *)a1[5];
  v5 = a1[6];
  v8 = (id)a1[4];
  v9 = v3;
  v10 = v4;
  v6 = v3;
  objc_msgSend(v8, "_showActiveWarningsIfNecessaryWithInitialBagFillState:completionHandler:", v5, v7);

}

uint64_t __91__WBSPasswordBreachManager_performNextSessionLookupIgnoringMinimumDelay_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeSessionWithResults:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_showActiveWarningsIfNecessaryWithInitialBagFillState:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = -[WBSPasswordBreachQueuedPasswordBagManager fillState](self->_bagManager, "fillState");
  if (a3 != 2 && v7 == 2)
    -[WBSPasswordBreachResults markAllCompromisedResultRecordsAsRecentlyBreached](self->_results, "markAllCompromisedResultRecordsAsRecentlyBreached");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__WBSPasswordBreachManager__showActiveWarningsIfNecessaryWithInitialBagFillState_completionHandler___block_invoke;
  v9[3] = &unk_1E4B2A6E0;
  v10 = v6;
  v8 = v6;
  -[WBSPasswordBreachManager _addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler:](self, "_addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler:", v9);

}

uint64_t __100__WBSPasswordBreachManager__showActiveWarningsIfNecessaryWithInitialBagFillState_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_canPerformSessionIgnoringMinimumDelay:(BOOL)a3
{
  BOOL v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  if (a3)
    return 1;
  -[WBSPasswordBreachContext store](self->_context, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastSessionCompletionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v9 = v8;
    -[WBSPasswordBreachContext configuration](self->_context, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minimumDelayBetweenSessions");
    v3 = v9 > v11;

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)_completeSessionWithResults:(id)a3 completionHandler:(id)a4
{
  id v6;
  WBSPasswordBreachContext *context;
  void (**v8)(id, id);
  void *v9;
  void *v10;
  OS_os_transaction *sessionTransaction;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  context = self->_context;
  v8 = (void (**)(id, id))a4;
  -[WBSPasswordBreachContext store](context, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordBreachQueuedPasswordBagManager saveBagToStore](self->_bagManager, "saveBagToStore");
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastSessionCompletionDate:", v10);

  }
  objc_msgSend(v9, "saveStoreSynchronously");
  os_unfair_lock_lock(&self->_lock);
  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = 0;

  os_unfair_lock_unlock(&self->_lock);
  v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "Lookup session completed.", v13, 2u);
  }
  v8[2](v8, v6);

}

- (void)_addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  WBSPasswordBreachNotificationManager *v6;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[WBSPasswordBreachManager recentlyBreachedSavedAccounts](self, "recentlyBreachedSavedAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(WBSPasswordBreachNotificationManager);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __93__WBSPasswordBreachManager__addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E4B2B768;
    v7[4] = self;
    v8 = v4;
    -[WBSPasswordBreachNotificationManager addBreachNotificationForSavedAccounts:withCompletionHandler:](v6, "addBreachNotificationForSavedAccounts:withCompletionHandler:", v5, v7);

  }
  else
  {
    v4[2](v4);
  }

}

void __93__WBSPasswordBreachManager__addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__WBSPasswordBreachManager__addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler___block_invoke_cold_1(v4, v3);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "clearRecentlyBreachedResultRecords");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)recentlyBreachedResultRecords
{
  return (id)-[WBSPasswordBreachResults recentlyBreachedResultRecords](self->_results, "recentlyBreachedResultRecords");
}

- (id)recentlyBreachedSavedAccounts
{
  void *v3;
  void *v4;
  void *v5;

  -[WBSPasswordBreachManager recentlyBreachedResultRecords](self, "recentlyBreachedResultRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_20_1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSPasswordBreachCredentialSource savedAccountsForPersistentIdentifiers:](self->_credentialSource, "savedAccountsForPersistentIdentifiers:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __57__WBSPasswordBreachManager_recentlyBreachedSavedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "persistentIdentifier");
}

- (void)clearRecentlyBreachedResultRecords
{
  id v3;

  -[WBSPasswordBreachResults clearRecentlyBreachedResultRecords](self->_results, "clearRecentlyBreachedResultRecords");
  -[WBSPasswordBreachContext store](self->_context, "store");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveStoreSynchronously");

}

- (void)clearAllRecordsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__WBSPasswordBreachManager_clearAllRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __65__WBSPasswordBreachManager_clearAllRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "clearAllResultsSynchronously");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addResultRecords:(id)a3
{
  void *v4;

  -[WBSPasswordBreachResults addResultRecords:](self->_results, "addResultRecords:", a3);
  -[WBSPasswordBreachContext store](self->_context, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveStoreSynchronously");

  -[WBSPasswordBreachManager _showActiveWarningsIfNecessaryWithInitialBagFillState:completionHandler:](self, "_showActiveWarningsIfNecessaryWithInitialBagFillState:completionHandler:", 2, &__block_literal_global_21_0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagManager, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_checker, 0);
  objc_storeStrong((id *)&self->_credentialSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
}

void __93__WBSPasswordBreachManager__addRecentlyBreachedNotificationIfNecessaryWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Failed to add notification for new breaches: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
