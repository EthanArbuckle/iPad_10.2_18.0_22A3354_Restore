@implementation WBSDigitalHealthManager

- (WBSDigitalHealthManager)init
{
  WBSDigitalHealthManager *v2;
  void *v3;
  WBSDigitalHealthManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSDigitalHealthManager;
  v2 = -[WBSDigitalHealthManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__historyItemsWereRemoved_, CFSTR("WBSHistoryItemsWereRemovedNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__historyWasCleared_, CFSTR("WBSHistoryWasClearedNotification"), 0);
    v4 = v2;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)startObserving
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  digitalHealthManagerGlobalQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__WBSDigitalHealthManager_startObserving__block_invoke;
  v3[3] = &unk_1E4B2BC78;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__WBSDigitalHealthManager_startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_startObserving");
    WeakRetained = v2;
  }

}

- (void)_startObserving
{
  id v3;
  DMFWebsitePolicyMonitor *v4;
  DMFWebsitePolicyMonitor *monitor;
  NSMutableDictionary *v6;
  NSMutableDictionary *trackedUrlsProfileIdentifierPairToUsageState;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (!self->_monitor)
  {
    objc_initWeak(&location, self);
    v3 = objc_alloc(MEMORY[0x1E0D1D1F0]);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __42__WBSDigitalHealthManager__startObserving__block_invoke;
    v11 = &unk_1E4B2BC78;
    objc_copyWeak(&v12, &location);
    v4 = (DMFWebsitePolicyMonitor *)objc_msgSend(v3, "initWithPolicyChangeHandler:", &v8);
    monitor = self->_monitor;
    self->_monitor = v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v8, v9, v10, v11);
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    trackedUrlsProfileIdentifierPairToUsageState = self->_trackedUrlsProfileIdentifierPairToUsageState;
    self->_trackedUrlsProfileIdentifierPairToUsageState = v6;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)getOverlayStateForURLs:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_43);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__WBSDigitalHealthManager_getOverlayStateForURLs_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E4B38DD0;
    objc_copyWeak(&v11, &location);
    v10 = v7;
    -[WBSDigitalHealthManager _requestPoliciesForWebsites:completionHandler:](self, "_requestPoliciesForWebsites:completionHandler:", v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSDigitalHealthManager;
  -[WBSDigitalHealthManager dealloc](&v4, sel_dealloc);
}

void __42__WBSDigitalHealthManager__startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "policyDidChangeForDigitalHealthManager:", v3);

    WeakRetained = v3;
  }

}

- (void)stopObservingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  digitalHealthManagerGlobalQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSDigitalHealthManager_stopObservingWithCompletionHandler___block_invoke;
  block[3] = &unk_1E4B38D68;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__WBSDigitalHealthManager_stopObservingWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_stopObserving");
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

- (void)_stopObserving
{
  DMFWebsitePolicyMonitor *monitor;
  NSMutableDictionary *trackedUrlsProfileIdentifierPairToUsageState;

  monitor = self->_monitor;
  self->_monitor = 0;

  trackedUrlsProfileIdentifierPairToUsageState = self->_trackedUrlsProfileIdentifierPairToUsageState;
  self->_trackedUrlsProfileIdentifierPairToUsageState = 0;

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id WeakRetained;

  if (self->_monitor == a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "policyDidChangeForDigitalHealthManager:", self);

  }
}

- (void)_requestPoliciesForWebsites:(id)a3 completionHandler:(id)a4
{
  -[DMFWebsitePolicyMonitor requestPoliciesForWebsites:completionHandler:](self->_monitor, "requestPoliciesForWebsites:completionHandler:", a3, a4);
}

uint64_t __72__WBSDigitalHealthManager_getOverlayStateForURLs_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_isHTTPFamilyURL");
}

void __72__WBSDigitalHealthManager_getOverlayStateForURLs_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  BOOL v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v6 = a3 == 0;
  else
    v6 = 0;
  v7 = v8;
  if (!v6)
    v7 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7);

}

- (void)updateUsageTrackingForURL:(id)a3 withBundleIdentifier:(id)a4 profileIdentifier:(id)a5 toState:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  digitalHealthManagerGlobalQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__WBSDigitalHealthManager_updateUsageTrackingForURL_withBundleIdentifier_profileIdentifier_toState___block_invoke;
  block[3] = &unk_1E4B38DF8;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __100__WBSDigitalHealthManager_updateUsageTrackingForURL_withBundleIdentifier_profileIdentifier_toState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUsageTrackingForURL:withBundleIdentifier:profileIdentifier:toState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_updateUsageTrackingForURL:(id)a3 withBundleIdentifier:(id)a4 profileIdentifier:(id)a5 toState:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v16, "safari_isHTTPFamilyURL"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C18]), "initWithFirst:second:", v16, v11);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedUrlsProfileIdentifierPairToUsageState, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0DC5E80]);
      convertSafariProfileIdentifierToScreenTimeProfileIdentifier(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v14, "initWithURL:bundleIdentifier:profileIdentifier:", v16, v10, v15);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedUrlsProfileIdentifierPairToUsageState, "setObject:forKeyedSubscript:", v13, v12);
    }
    +[WBSDigitalHealthManager _updateWebpageUsage:withDigitalHealthManagerUsageState:](WBSDigitalHealthManager, "_updateWebpageUsage:withDigitalHealthManagerUsageState:", v13, a6);

  }
}

- (void)stopUsageTrackingForURL:(id)a3 profileIdentifier:(id)a4 withCompletionHandler:(id)a5
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
  digitalHealthManagerGlobalQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__WBSDigitalHealthManager_stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E4B38908;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __91__WBSDigitalHealthManager_stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopUsageTrackingForURL:profileIdentifier:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_stopUsageTrackingForURL:(id)a3 profileIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__WBSDigitalHealthManager__stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E4B2A6E0;
  v10 = v8;
  v19 = v10;
  v11 = a4;
  v12 = a3;
  v13 = (void (**)(_QWORD))MEMORY[0x1A8599ED0](v18);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C18]), "initWithFirst:second:", v12, v11);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedUrlsProfileIdentifierPairToUsageState, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_trackedUrlsProfileIdentifierPairToUsageState, "removeObjectForKey:", v14);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __92__WBSDigitalHealthManager__stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke_2;
    v16[3] = &unk_1E4B2B8A0;
    v17 = v13;
    objc_msgSend(v15, "changeState:completionHandler:", 0, v16);

  }
  else
  {
    v13[2](v13);
  }

}

uint64_t __92__WBSDigitalHealthManager__stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __92__WBSDigitalHealthManager__stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __92__WBSDigitalHealthManager__stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_historyItemsWereRemoved:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_arrayForKey:", CFSTR("WBSHistoryItemsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_18_1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_class();
    objc_msgSend(v6, "profileLocalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteUsageHistoryForURLs:profileIdentifier:", v5, v8);

  }
}

uint64_t __52__WBSDigitalHealthManager__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

- (void)_historyWasCleared:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  objc_msgSend(v5, "profileLocalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteAllUsageHistoryWithProfileIdentifier:", v4);

}

+ (void)deleteAllUsageHistoryWithProfileIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  digitalHealthManagerGlobalQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke;
  block[3] = &unk_1E4B2A078;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_cold_1(a1, v2);
  v3 = objc_alloc_init(MEMORY[0x1E0D8C070]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariApplicationPlatformBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  convertSafariProfileIdentifierToScreenTimeProfileIdentifier(*(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteAllWebHistoryForApplication:profileIdentifier:completionHandler:", v4, v5, &__block_literal_global_22_1);

}

void __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_21_cold_1(v3);
  }

}

+ (void)deleteUsageHistoryFromDate:(id)a3 toDate:(id)a4 profileIdentifier:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CB3588];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithStartDate:endDate:", v10, v9);

  digitalHealthManagerGlobalQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke;
  v15[3] = &unk_1E4B2A118;
  v16 = v7;
  v17 = v11;
  v13 = v11;
  v14 = v7;
  dispatch_async(v12, v15);

}

void __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_cold_1(a1, v2, v3);
  v4 = objc_alloc_init(MEMORY[0x1E0D8C070]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariApplicationPlatformBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  convertSafariProfileIdentifierToScreenTimeProfileIdentifier(*(void **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteWebHistoryDuringInterval:application:profileIdentifier:completionHandler:", v6, v5, v7, &__block_literal_global_25);

}

void __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_24_cold_1(v3);
  }

}

+ (void)deleteUsageHistoryForURLs:(id)a3 profileIdentifier:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "copy");
  digitalHealthManagerGlobalQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke;
  v10[3] = &unk_1E4B2A118;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke_cold_1(a1, v2);
  v3 = objc_alloc_init(MEMORY[0x1E0D8C070]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariApplicationPlatformBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    convertSafariProfileIdentifierToScreenTimeProfileIdentifier(*(void **)(a1 + 32));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteWebHistoryForURLs:application:profileIdentifier:completionHandler:", v5, v4, v6, &__block_literal_global_29_0);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "deleteWebHistoryForURL:application:completionHandler:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v4, &__block_literal_global_31, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }

}

void __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke_28_cold_1(v3);
  }

}

void __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke_28_cold_1(v3);
  }

}

+ (void)_updateWebpageUsage:(id)a3 withDigitalHealthManagerUsageState:(unint64_t)a4
{
  uint64_t v5;

  if (a4 == 2)
    v5 = 2;
  else
    v5 = a4 == 1;
  objc_msgSend(a3, "changeState:completionHandler:", v5, &__block_literal_global_32);
}

void __82__WBSDigitalHealthManager__updateWebpageUsage_withDigitalHealthManagerUsageState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXDigitalHealth();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __82__WBSDigitalHealthManager__updateWebpageUsage_withDigitalHealthManagerUsageState___block_invoke_cold_1(v3);
  }

}

- (WBSDigitalHealthManagerDelegate)delegate
{
  return (WBSDigitalHealthManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackedUrlsProfileIdentifierPairToUsageState, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

void __92__WBSDigitalHealthManager__stopUsageTrackingForURL_profileIdentifier_withCompletionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Unable to stop URL-specific Digital Health usage tracking: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_DEBUG, "Deleting all Screen Time usage history in profile (%{public}@).", (uint8_t *)&v3, 0xCu);
}

void __70__WBSDigitalHealthManager_deleteAllUsageHistoryWithProfileIdentifier___block_invoke_21_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Unable to delete all Digital Health usage history: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
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
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, a2, a3, "Deleting Screen Time usage history in profile (%{public}@) for specified time interval (%{public}@).", (uint8_t *)&v5);
}

void __79__WBSDigitalHealthManager_deleteUsageHistoryFromDate_toDate_profileIdentifier___block_invoke_24_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Unable to delete Digital Health usage history over time range: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v6 = 138543618;
  v7 = v3;
  v8 = 2048;
  v9 = objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "count");
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v2, v5, "Deleting Screen Time usage history in profile (%{public}@) for %lu URLs.", (uint8_t *)&v6);

}

void __71__WBSDigitalHealthManager_deleteUsageHistoryForURLs_profileIdentifier___block_invoke_28_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Unable to delete URL-specific Digital Health usage history: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __82__WBSDigitalHealthManager__updateWebpageUsage_withDigitalHealthManagerUsageState___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v3, v4, "Unable to update Digital Health usage state: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
