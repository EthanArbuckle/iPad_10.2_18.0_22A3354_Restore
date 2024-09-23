@implementation WBSRecentlyBreachedPasswordProvider

- (WBSRecentlyBreachedPasswordProvider)init
{
  WBSRecentlyBreachedPasswordProvider *v2;
  WBSRecentlyBreachedPasswordProvider *v3;
  WBSPasswordBreachHelperProxy *v4;
  WBSPasswordBreachHelperProxy *helperProxy;
  void *v6;
  WBSRecentlyBreachedPasswordProvider *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSRecentlyBreachedPasswordProvider;
  v2 = -[WBSRecentlyBreachedPasswordProvider init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (WBSPasswordBreachHelperProxy *)objc_alloc_init(MEMORY[0x1E0D89C48]);
    helperProxy = v3->_helperProxy;
    v3->_helperProxy = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__accountStoreDidChange_, *MEMORY[0x1E0D89F88], 0);

    v7 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSPasswordBreachHelperProxy invalidate](self->_helperProxy, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSRecentlyBreachedPasswordProvider;
  -[WBSRecentlyBreachedPasswordProvider dealloc](&v3, sel_dealloc);
}

+ (WBSRecentlyBreachedPasswordProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_88);
  return (WBSRecentlyBreachedPasswordProvider *)(id)sharedProvider_sharedProvider;
}

void __53__WBSRecentlyBreachedPasswordProvider_sharedProvider__block_invoke()
{
  WBSRecentlyBreachedPasswordProvider *v0;
  void *v1;

  v0 = objc_alloc_init(WBSRecentlyBreachedPasswordProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

}

- (void)clearRecentlyBreachedSavedAccounts
{
  os_unfair_lock_s *p_lock;
  NSArray *recentlyBreachedSavedAccounts;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WBSPasswordBreachHelperProxy clearRecentlyBreachedResultRecordsWithCompletionHandler:](self->_helperProxy, "clearRecentlyBreachedResultRecordsWithCompletionHandler:", &__block_literal_global_8_1);
  recentlyBreachedSavedAccounts = self->_recentlyBreachedSavedAccounts;
  self->_recentlyBreachedSavedAccounts = 0;

  os_unfair_lock_unlock(p_lock);
}

void __73__WBSRecentlyBreachedPasswordProvider_clearRecentlyBreachedSavedAccounts__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __73__WBSRecentlyBreachedPasswordProvider_clearRecentlyBreachedSavedAccounts__block_invoke_cold_1(v2);
  }
}

- (NSArray)recentlyBreachedSavedAccountsIfAvailable
{
  id v3;
  uint64_t v4;
  NSArray *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  os_unfair_lock_lock(&self->_lock);
  v3 = objc_alloc_init(MEMORY[0x1E0D89D00]);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke;
  v8[3] = &unk_1E4B2A078;
  v8[4] = self;
  objc_msgSend(v3, "setHandler:", v8);
  if (self->_recentlyBreachedSavedAccountsLookupStarted)
  {
    v5 = self->_recentlyBreachedSavedAccounts;
  }
  else
  {
    self->_recentlyBreachedSavedAccountsLookupStarted = 1;
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke_2;
    v7[3] = &unk_1E4B3EC50;
    v7[4] = self;
    -[WBSRecentlyBreachedPasswordProvider _getRecentlyBreachedSavedAccountsWithCompletionHandler:](self, "_getRecentlyBreachedSavedAccountsWithCompletionHandler:", v7);
    v5 = 0;
  }

  return v5;
}

void __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke_3;
  v6[3] = &unk_1E4B2A118;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)_getRecentlyBreachedSavedAccountsWithCompletionHandler:(id)a3
{
  id v4;
  WBSPasswordBreachHelperProxy *helperProxy;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  helperProxy = self->_helperProxy;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__WBSRecentlyBreachedPasswordProvider__getRecentlyBreachedSavedAccountsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A578;
  v8 = v4;
  v6 = v4;
  -[WBSPasswordBreachHelperProxy recentlyBreachedResultRecordDictionariesWithCompletionHandler:](helperProxy, "recentlyBreachedResultRecordDictionariesWithCompletionHandler:", v7);

}

void __94__WBSRecentlyBreachedPasswordProvider__getRecentlyBreachedSavedAccountsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D89C60], "resultRecordsFromDictionaryRepresentations:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_13_2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D89CF8], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "savedAccountsForPersistentIdentifiers:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __94__WBSRecentlyBreachedPasswordProvider__getRecentlyBreachedSavedAccountsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "persistentIdentifier");
}

- (void)_accountStoreDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSArray *recentlyBreachedSavedAccounts;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_recentlyBreachedSavedAccountsLookupStarted = 0;
  recentlyBreachedSavedAccounts = self->_recentlyBreachedSavedAccounts;
  self->_recentlyBreachedSavedAccounts = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyBreachedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_helperProxy, 0);
}

void __73__WBSRecentlyBreachedPasswordProvider_clearRecentlyBreachedSavedAccounts__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to clear recently breached result records.", v1, 2u);
}

@end
