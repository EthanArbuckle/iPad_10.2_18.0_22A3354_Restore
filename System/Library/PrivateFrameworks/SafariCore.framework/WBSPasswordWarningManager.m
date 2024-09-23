@implementation WBSPasswordWarningManager

- (WBSPasswordWarningManager)initWithSavedAccountStore:(id)a3 autoFillQuirksManager:(id)a4 userDefaults:(id)a5 highLevelDomainsProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WBSPasswordWarningManager *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v19;
  OS_dispatch_queue *callbackQueue;
  WBSPasswordAuditor *v21;
  WBSPasswordAuditor *passwordAuditor;
  WBSPasswordWarningTopFraudTargetsManager *v23;
  WBSPasswordWarningTopFraudTargetsManager *topFraudTargetsManager;
  WBSPasswordWarningManager *v25;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WBSPasswordWarningManager;
  v15 = -[WBSPasswordWarningManager init](&v27, sel_init);
  if (v15)
  {
    dispatch_get_global_queue(17, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create_with_target_V2("com.apple.Safari.PasswordWarningManager.Work", 0, v16);
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create("com.apple.Safari.PasswordWarningManager.Callback", 0);
    callbackQueue = v15->_callbackQueue;
    v15->_callbackQueue = (OS_dispatch_queue *)v19;

    v15->_cachedDataLock._os_unfair_lock_opaque = 0;
    v15->_passwordEvaluatorLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_historyHighLevelDomainsProvider, a6);
    -[WBSHistoricalHighLevelDomainsProvider performBlockAfterHistoryHasLoaded:](v15->_historyHighLevelDomainsProvider, "performBlockAfterHistoryHasLoaded:", &__block_literal_global_45);
    objc_storeStrong((id *)&v15->_accountStore, a3);
    v21 = -[WBSPasswordAuditor initWithSavedAccountStore:autoFillQuirksManager:]([WBSPasswordAuditor alloc], "initWithSavedAccountStore:autoFillQuirksManager:", v11, v12);
    passwordAuditor = v15->_passwordAuditor;
    v15->_passwordAuditor = v21;

    objc_storeStrong((id *)&v15->_userDefaults, a5);
    v23 = objc_alloc_init(WBSPasswordWarningTopFraudTargetsManager);
    topFraudTargetsManager = v15->_topFraudTargetsManager;
    v15->_topFraudTargetsManager = v23;

    -[WBSPasswordWarningTopFraudTargetsManager getTopFraudTargetsWithCompletionHandler:](v15->_topFraudTargetsManager, "getTopFraudTargetsWithCompletionHandler:", &__block_literal_global_10_0);
    v25 = v15;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSPasswordBreachHelperProxy invalidate](self->_passwordBreachHelperProxy, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordWarningManager;
  -[WBSPasswordWarningManager dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfNonHiddenWarningsWithSpecifiedPriority
{
  os_unfair_lock_s *p_cachedDataLock;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_cachedDataLock = &self->_cachedDataLock;
  os_unfair_lock_lock(&self->_cachedDataLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_cachedWarnings;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasBeenHidden", (_QWORD)v11) ^ 1;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  os_unfair_lock_unlock(p_cachedDataLock);
  return v7;
}

- (void)preWarmWarningsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__WBSPasswordWarningManager_preWarmWarningsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E649E428;
  v7 = v4;
  v5 = v4;
  -[WBSPasswordWarningManager getAllWarningsForcingUpdate:completionHandler:](self, "getAllWarningsForcingUpdate:completionHandler:", 1, v6);

}

uint64_t __66__WBSPasswordWarningManager_preWarmWarningsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getAllWarningsForcingUpdate:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *callbackQueue;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  WBSHistoricalHighLevelDomainsProvider *historyHighLevelDomainsProvider;
  NSObject *v15;
  WBSPasswordWarningTopFraudTargetsManager *topFraudTargetsManager;
  NSObject *v17;
  NSObject *workQueue;
  NSObject *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  NSObject *v23;
  uint8_t *v24;
  _QWORD *v25;
  BOOL v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  uint8_t *v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  _QWORD block[5];
  id v44;

  v6 = a4;
  dispatch_suspend((dispatch_object_t)self->_callbackQueue);
  callbackQueue = self->_callbackQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E649B910;
  v9 = v6;
  block[4] = self;
  v44 = v9;
  dispatch_async(callbackQueue, block);
  os_unfair_lock_lock(&self->_cachedDataLock);
  if (self->_updateInProgress || !a3 && self->_cachedWarnings)
  {
    os_unfair_lock_unlock(&self->_cachedDataLock);
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
  }
  else
  {
    self->_updateInProgress = 1;
    os_unfair_lock_unlock(&self->_cachedDataLock);
    v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v10, OS_LOG_TYPE_INFO, "Beginning password warning manager update.", buf, 2u);
    }
    v11 = dispatch_group_create();
    -[WBSSavedAccountStore savedAccountsExcludingNeverSaveMarkerPasswords](self->_accountStore, "savedAccountsExcludingNeverSaveMarkerPasswords");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_filterObjectsUsingBlock:", &__block_literal_global_16_1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_historyHighLevelDomainsProvider)
    {
      dispatch_group_enter(v11);
      historyHighLevelDomainsProvider = self->_historyHighLevelDomainsProvider;
      v41[0] = v8;
      v41[1] = 3221225472;
      v41[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_2;
      v41[3] = &unk_1E649B768;
      v42 = v11;
      -[WBSHistoricalHighLevelDomainsProvider performBlockAfterHistoryHasLoaded:](historyHighLevelDomainsProvider, "performBlockAfterHistoryHasLoaded:", v41);

    }
    *(_QWORD *)buf = 0;
    v36 = buf;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__11;
    v39 = __Block_byref_object_dispose__11;
    v40 = 0;
    dispatch_group_enter(v11);
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_17;
    v32[3] = &unk_1E649E490;
    v34 = buf;
    v15 = v11;
    v33 = v15;
    -[WBSPasswordWarningManager _getBreachResultRecordsForPasswords:startSessionIfNecessary:withCompletionHandler:](self, "_getBreachResultRecordsForPasswords:startSessionIfNecessary:withCompletionHandler:", v13, 1, v32);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__11;
    v30[4] = __Block_byref_object_dispose__11;
    v31 = 0;
    dispatch_group_enter(v15);
    topFraudTargetsManager = self->_topFraudTargetsManager;
    v27[0] = v8;
    v27[1] = 3221225472;
    v27[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_2_19;
    v27[3] = &unk_1E649E4B8;
    v29 = v30;
    v17 = v15;
    v28 = v17;
    -[WBSPasswordWarningTopFraudTargetsManager getTopFraudTargetsWithCompletionHandler:](topFraudTargetsManager, "getTopFraudTargetsWithCompletionHandler:", v27);
    workQueue = self->_workQueue;
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_3;
    v21[3] = &unk_1E649E508;
    v26 = a3;
    v21[4] = self;
    v22 = v13;
    v24 = buf;
    v25 = v30;
    v23 = v17;
    v19 = v17;
    v20 = v13;
    dispatch_group_notify(v19, workQueue, v21);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  if (*(_QWORD *)(a1 + 40))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 96));
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 96));
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_INFO, "Calling back.", v4, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canUserEditSavedAccount");
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_2_19(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  __int128 v15;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 88);
    *(_QWORD *)(v2 + 88) = 0;

  }
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_4;
  v14[3] = &unk_1E649E4E0;
  v5 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(NSObject **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 8);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_5;
  v11[3] = &unk_1E649D580;
  v11[4] = v8;
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 64);
  v10 = v6;
  dispatch_group_notify(v7, v9, v11);

}

id __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_scoredWarningForSavedAccount:topFraudTargets:breachResultRecord:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __75__WBSPasswordWarningManager_getAllWarningsForcingUpdate_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  objc_msgSend(*(id *)(a1 + 32), "_scoreWarnings:topFraudTargets:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sortWarningsBySeverity:intoHighPriorityBucket:intoStandardPriorityBucket:unspecifiedSeverityBucket:savedAccountMap:highPriorityWarningHashes:", *(_QWORD *)(a1 + 40), v3, v4, v5, v2, v6);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  *(_QWORD *)(v8 + 104) = v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 100) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(*(id *)(a1 + 32), "_updateUserDefaultsWithWarningHashes:", v6);
  v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B2621000, v10, OS_LOG_TYPE_INFO, "Password warning manager update complete.", v11, 2u);
  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

}

- (void)getWarningForSavedAccount:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke;
  v11[3] = &unk_1E649E580;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[WBSPasswordWarningManager _getBreachResultRecordsForPasswords:startSessionIfNecessary:withCompletionHandler:](self, "_getBreachResultRecordsForPasswords:startSessionIfNecessary:withCompletionHandler:", v8, 0, v11);

}

void __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke_2;
  v8[3] = &unk_1E649E558;
  v8[4] = v4;
  v9 = v5;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v6, "getTopFraudTargetsWithCompletionHandler:", v8);

}

void __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke_3;
  block[3] = &unk_1E649E530;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v7 = v3;
  dispatch_async(v6, block);

}

void __73__WBSPasswordWarningManager_getWarningForSavedAccount_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scoredWarningForSavedAccount:topFraudTargets:breachResultRecord:", v3, v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)removeWarningForSavedAccount:(id)a3
{
  os_unfair_lock_s *p_cachedDataLock;
  id v5;
  void *v6;
  NSMapTable *v7;
  NSMapTable *cachedWarningsForSavedAccounts;
  void *v9;
  NSArray *v10;
  NSArray *cachedWarnings;
  id v12;

  p_cachedDataLock = &self->_cachedDataLock;
  v5 = a3;
  os_unfair_lock_lock(p_cachedDataLock);
  -[NSMapTable objectForKey:](self->_cachedWarningsForSavedAccounts, "objectForKey:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSMapTable mutableCopy](self->_cachedWarningsForSavedAccounts, "mutableCopy");
  objc_msgSend(v6, "removeObjectForKey:", v5);

  v7 = (NSMapTable *)objc_msgSend(v6, "copy");
  cachedWarningsForSavedAccounts = self->_cachedWarningsForSavedAccounts;
  self->_cachedWarningsForSavedAccounts = v7;

  v9 = (void *)-[NSArray mutableCopy](self->_cachedWarnings, "mutableCopy");
  objc_msgSend(v9, "removeObject:", v12);
  v10 = (NSArray *)objc_msgSend(v9, "copy");
  cachedWarnings = self->_cachedWarnings;
  self->_cachedWarnings = v10;

  os_unfair_lock_unlock(p_cachedDataLock);
}

- (BOOL)hasUnacknowledgedHighPriorityWarnings
{
  void *v2;
  char v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("lastPasswordWarningManagerUpdateHasNewWarnings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)acknowledgeHighPriorityWarnings
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 56);
  v3 = a2;
  objc_msgSend(v2, "arrayForKey:", CFSTR("lastPasswordWarningManagerUpdateHashes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134217984;
  v7 = objc_msgSend(v4, "count");
  OUTLINED_FUNCTION_0_9(&dword_1B2621000, v3, v5, "Acknowledging %lu existing warnings.", (uint8_t *)&v6);

}

- (WBSPasswordEvaluator)passwordEvaluator
{
  os_unfair_lock_s *p_passwordEvaluatorLock;
  WBSPasswordEvaluator *v4;
  WBSPasswordEvaluator *passwordEvaluator;

  p_passwordEvaluatorLock = &self->_passwordEvaluatorLock;
  os_unfair_lock_lock(&self->_passwordEvaluatorLock);
  if (!self->_passwordEvaluator)
  {
    +[WBSPasswordEvaluator standardPasswordEvaluator](WBSPasswordEvaluator, "standardPasswordEvaluator");
    v4 = (WBSPasswordEvaluator *)objc_claimAutoreleasedReturnValue();
    passwordEvaluator = self->_passwordEvaluator;
    self->_passwordEvaluator = v4;

  }
  os_unfair_lock_unlock(p_passwordEvaluatorLock);
  return self->_passwordEvaluator;
}

- (id)_warningForSavedAccount:(id)a3 breachResultRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  WBSSavedAccountStore *accountStore;
  void *v15;
  _BOOL8 v16;
  WBSPasswordWarning *v17;

  v6 = a4;
  v7 = a3;
  -[WBSPasswordWarningManager passwordEvaluator](self, "passwordEvaluator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "evaluatePassword:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WBSPasswordWarningManager _issuesForPassword:withWeakPasswordEvaluation:breachResultRecord:](self, "_issuesForPassword:withWeakPasswordEvaluation:breachResultRecord:", v7, v10, v6);
  -[WBSPasswordAuditor savedAccountsWithDuplicatedPassword:](self->_passwordAuditor, "savedAccountsWithDuplicatedPassword:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_mapObjectsUsingBlock:", &__block_literal_global_26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  accountStore = self->_accountStore;
  objc_msgSend(v7, "highLevelDomain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WBSSavedAccountStore numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:](accountStore, "numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:", v15) == 1;

  v17 = -[WBSPasswordWarning initWithSavedAccount:issueTypes:weakPasswordEvaluation:titlesOfSavedAccountsWithReusedPassword:savedAccountIsOnlySavedAccountForHighLevelDomain:]([WBSPasswordWarning alloc], "initWithSavedAccount:issueTypes:weakPasswordEvaluation:titlesOfSavedAccountsWithReusedPassword:savedAccountIsOnlySavedAccountForHighLevelDomain:", v7, v11, v10, v13, v16);
  return v17;
}

id __72__WBSPasswordWarningManager__warningForSavedAccount_breachResultRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "hasValidWebsite"))
  {
    objc_msgSend(v2, "effectiveTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_scoredWarningForSavedAccount:(id)a3 topFraudTargets:(id)a4 breachResultRecord:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;

  v8 = a4;
  v9 = a3;
  -[WBSPasswordWarningManager _warningForSavedAccount:breachResultRecord:](self, "_warningForSavedAccount:breachResultRecord:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBSPasswordWarningManager _scoreForSavedAccount:issueTypes:topFraudTargets:](self, "_scoreForSavedAccount:issueTypes:topFraudTargets:", v9, objc_msgSend(v10, "issueTypes"), v8);

  objc_msgSend(v10, "setSeverityScore:", v11);
  return v10;
}

- (unint64_t)_issuesForPassword:(id)a3 withWeakPasswordEvaluation:(id)a4 breachResultRecord:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "password");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length") == 1 && (objc_msgSend(&unk_1E64D16B8, "containsObject:", v11) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    if (objc_msgSend(v9, "userShouldBeShownPassiveWarning"))
      v13 = 2;
    else
      v13 = 0;
    v14 = v13 | -[WBSPasswordAuditor savedAccountIsReused:](self->_passwordAuditor, "savedAccountIsReused:", v8);
    v15 = objc_msgSend(v10, "result");
    v16 = v14 | 4;
    if (v15 != 2)
      v16 = v14;
    if (v15 == 3)
      v17 = v14 | 8;
    else
      v17 = v16;
    objc_msgSend(v8, "formerlySharedPasswordMarker");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v17 |= 0x10uLL;
    objc_msgSend(v8, "formerlySharedPasskeyMarker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v12 = v17 | 0x20;
    else
      v12 = v17;
  }

  return v12;
}

- (int64_t)_scoreForSavedAccount:(id)a3 issueTypes:(unint64_t)a4 topFraudTargets:(id)a5
{
  char v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  _BOOL4 v23;
  int64_t v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "highPriorityFraudTargets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "highLevelDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

    if ((v13 & 1) != 0
      || (objc_msgSend(v10, "financialFraudTargets"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "highLevelDomain"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v14, "containsObject:", v15),
          v15,
          v14,
          (v16 & 1) != 0))
    {
      v17 = 10;
    }
    else
    {
      objc_msgSend(v10, "fraudTargets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "highLevelDomain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "containsObject:", v20);

      if (v21)
        v17 = 6;
      else
        v17 = 0;
    }
    objc_msgSend(v8, "highLevelDomain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[WBSPasswordWarningManager _historyContainsItemForDomain:](self, "_historyContainsItemForDomain:", v22);

    v24 = v17 | v23;
    if ((v6 & 8) != 0)
      v24 += 12;
    if ((v6 & 4) != 0)
      v24 += 11;
    if ((v6 & 2) != 0)
      v24 += 3;
    if ((v6 & 1) != 0)
      v24 += 2;
    if ((v6 & 0x30) != 0)
      v18 = v24 + 10;
    else
      v18 = v24;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_historyContainsItemForDomain:(id)a3
{
  id v4;
  NSSet *historyHighLevelDomains;
  WBSHistoricalHighLevelDomainsProvider *historyHighLevelDomainsProvider;
  BOOL v7;
  _QWORD v9[5];

  v4 = a3;
  historyHighLevelDomains = self->_historyHighLevelDomains;
  if (!historyHighLevelDomains)
  {
    historyHighLevelDomainsProvider = self->_historyHighLevelDomainsProvider;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__WBSPasswordWarningManager__historyContainsItemForDomain___block_invoke;
    v9[3] = &unk_1E649E5E8;
    v9[4] = self;
    -[WBSHistoricalHighLevelDomainsProvider fetchHistoricalHighLevelDomainsWithCompletionHandler:](historyHighLevelDomainsProvider, "fetchHistoricalHighLevelDomainsWithCompletionHandler:", v9);
    historyHighLevelDomains = self->_historyHighLevelDomains;
  }
  v7 = -[NSSet containsObject:](historyHighLevelDomains, "containsObject:", v4);

  return v7;
}

void __59__WBSPasswordWarningManager__historyContainsItemForDomain___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
}

- (id)_passwordBreachHelperProxy
{
  WBSPasswordBreachHelperProxy *passwordBreachHelperProxy;
  WBSPasswordBreachHelperProxy *v4;
  WBSPasswordBreachHelperProxy *v5;

  passwordBreachHelperProxy = self->_passwordBreachHelperProxy;
  if (!passwordBreachHelperProxy)
  {
    v4 = objc_alloc_init(WBSPasswordBreachHelperProxy);
    v5 = self->_passwordBreachHelperProxy;
    self->_passwordBreachHelperProxy = v4;

    passwordBreachHelperProxy = self->_passwordBreachHelperProxy;
  }
  return passwordBreachHelperProxy;
}

- (void)_getBreachResultRecordsForPasswords:(id)a3 startSessionIfNecessary:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  WBSPasswordBreachResultQuery *v19;
  void *v20;
  WBSPasswordBreachResultQuery *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v29;
  uint64_t v30;
  id obj;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[4];
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a5;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v6;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v34)
  {
    v32 = 0;
    v33 = *(_QWORD *)v44;
    v30 = *MEMORY[0x1E0CB2FE0];
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v10, "persistentIdentifiersForWarningManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          v35 = i;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v10, "persistentIdentifiersForWarningManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v40 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v18);
                v19 = [WBSPasswordBreachResultQuery alloc];
                objc_msgSend(v10, "lastModifiedDate");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = -[WBSPasswordBreachResultQuery initWithPersistentIdentifier:dateLastModified:](v19, "initWithPersistentIdentifier:dateLastModified:", v18, v20);

                objc_msgSend(v8, "addObject:", v21);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v15);
          }

          i = v35;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", v30, 14, CFSTR("Couldn't find persistent identifier for saved password."));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[WBSPasswordWarningManager _getBreachResultRecordsForPasswords:startSessionIfNecessary:withCompletionHandler:].cold.1(v48, v23, v22, &v49);
          v32 = v22;
        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v34);
  }
  else
  {
    v32 = 0;
  }

  +[WBSPasswordBreachResultQuery dictionaryRepresentationsForResultQueries:](WBSPasswordBreachResultQuery, "dictionaryRepresentationsForResultQueries:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordWarningManager _passwordBreachHelperProxy](self, "_passwordBreachHelperProxy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke;
  v36[3] = &unk_1E649E610;
  v37 = v7;
  v38 = v29;
  v26 = v7;
  v27 = v29;
  objc_msgSend(v25, "getResultRecordDictionariesForResultQueryDictionaries:withCompletionHandler:", v24, v36);
  objc_msgSend(v25, "runLookupSessionIgnoringMinimumDelay:completionHandler:", 0, &__block_literal_global_45);

}

void __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t v20;
  _BYTE v21[15];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v19 = v3;
    +[WBSPasswordBreachResultRecord resultRecordsFromDictionaryRepresentations:](WBSPasswordBreachResultRecord, "resultRecordsFromDictionaryRepresentations:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "persistentIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v5, "setObject:forKey:", v11, v13);
          }
          else
          {
            v14 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_cold_2(&v20, v21, v14);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v19;
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_cold_1(v15, v16, v17);
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v6);
  }

}

void __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_43()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B2621000, v0, OS_LOG_TYPE_INFO, "Lookup session request completed.", v1, 2u);
  }
}

- (void)_scoreWarnings:(id)a3 topFraudTargets:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "savedAccount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSeverityScore:", -[WBSPasswordWarningManager _scoreForSavedAccount:issueTypes:topFraudTargets:](self, "_scoreForSavedAccount:issueTypes:topFraudTargets:", v13, objc_msgSend(v12, "issueTypes"), v7));

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_sortWarningsBySeverity:(id)a3 intoHighPriorityBucket:(id)a4 intoStandardPriorityBucket:(id)a5 unspecifiedSeverityBucket:(id)a6 savedAccountMap:(id)a7 highPriorityWarningHashes:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v27 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v13);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v22, "savedAccount");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v22, v23);

        v24 = objc_msgSend(v22, "severity");
        if (v24 == 2)
        {
          v25 = v14;
        }
        else
        {
          if (v24 == 1)
          {
            objc_msgSend(v27, "addObject:", v22);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "hashForUserAcknowlegement"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v26);

            continue;
          }
          if (v24)
            continue;
          v25 = v15;
        }
        objc_msgSend(v25, "addObject:", v22);
      }
      v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

}

- (void)_updateUserDefaultsWithWarningHashes:(id)a3
{
  id v4;
  void *v5;
  NSUserDefaults *userDefaults;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a3;
  -[NSUserDefaults arrayForKey:](self->_userDefaults, "arrayForKey:", CFSTR("lastPasswordWarningManagerUpdateHashes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  userDefaults = self->_userDefaults;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults safari_setDate:forKey:](userDefaults, "safari_setDate:forKey:", v7, CFSTR("lastPasswordWarningManagerUpdate"));

  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("lastPasswordWarningManagerUpdateHashes"));
  v8 = objc_msgSend(v4, "count");
  if (v8 <= objc_msgSend(v5, "count"))
  {
    v10 = objc_msgSend(v4, "count");
    if (v10 == objc_msgSend(v5, "count"))
      v9 = objc_msgSend(v4, "isEqualToArray:", v5) ^ 1;
    else
      v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  v11 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[WBSPasswordWarningManager _updateUserDefaultsWithWarningHashes:].cold.3(v11, v4, v5);
  v12 = -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("lastPasswordWarningManagerUpdateHasNewWarnings"));
  v13 = WBS_LOG_CHANNEL_PREFIXPasswords();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
      -[WBSPasswordWarningManager _updateUserDefaultsWithWarningHashes:].cold.1(v13);
  }
  else
  {
    if (v14)
      -[WBSPasswordWarningManager _updateUserDefaultsWithWarningHashes:].cold.2(v9, v13, v15);
    -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v9, CFSTR("lastPasswordWarningManagerUpdateHasNewWarnings"));
  }

}

- (BOOL)savedAccountsFromGroup:(id)a3 containsPasswordFromSavedAccount:(id)a4
{
  return -[WBSPasswordAuditor savedAccount:reusesPasswordWithAccountInSavedAccounts:](self->_passwordAuditor, "savedAccount:reusesPasswordWithAccountInSavedAccounts:", a4, a3);
}

- (WBSPasswordAuditor)passwordAuditor
{
  return self->_passwordAuditor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedWarningsForSavedAccounts, 0);
  objc_storeStrong((id *)&self->_cachedWarnings, 0);
  objc_storeStrong((id *)&self->_historyHighLevelDomains, 0);
  objc_storeStrong((id *)&self->_historyHighLevelDomainsProvider, 0);
  objc_storeStrong((id *)&self->_passwordBreachHelperProxy, 0);
  objc_storeStrong((id *)&self->_topFraudTargetsManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_passwordAuditor, 0);
  objc_storeStrong((id *)&self->_passwordEvaluator, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_getBreachResultRecordsForPasswords:(void *)a3 startSessionIfNecessary:(uint64_t *)a4 withCompletionHandler:.cold.1(uint8_t *a1, void *a2, void *a3, uint64_t *a4)
{
  NSObject *v7;
  id v8;
  uint64_t v9;

  v7 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "UTF8String");
  *(_DWORD *)a1 = 136315138;
  *a4 = v9;
  _os_log_error_impl(&dword_1B2621000, v7, OS_LOG_TYPE_ERROR, "%s", a1, 0xCu);

}

void __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_4(&dword_1B2621000, a1, a3, "Recieved no results for password breach helper query.", v3);
}

void __111__WBSPasswordWarningManager__getBreachResultRecordsForPasswords_startSessionIfNecessary_withCompletionHandler___block_invoke_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_4(&dword_1B2621000, a3, (uint64_t)a3, "Recieved result for query we didn't request.", a1);
}

- (void)_updateUserDefaultsWithWarningHashes:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B2621000, log, OS_LOG_TYPE_DEBUG, "Previous update raised new warnings that have not yet been acknowledged. Leaving flag as-is.", v1, 2u);
}

- (void)_updateUserDefaultsWithWarningHashes:(uint64_t)a3 .cold.2(char a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = "does not have";
  if ((a1 & 1) != 0)
    v3 = "has";
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_0_9(&dword_1B2621000, a2, a3, "User %s new warnings.", (uint8_t *)&v4);
}

- (void)_updateUserDefaultsWithWarningHashes:(void *)a3 .cold.3(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = 134218240;
  v7 = objc_msgSend(a2, "count");
  v8 = 2048;
  v9 = objc_msgSend(a3, "count");
  _os_log_debug_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEBUG, "Current update has %lu warnings. Previous update had %lu warnings.", (uint8_t *)&v6, 0x16u);

}

@end
