@implementation WBSGeneratedPasswordStore

+ (WBSGeneratedPasswordStore)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_11);
  return (WBSGeneratedPasswordStore *)(id)sharedStore_sharedStore;
}

void __40__WBSGeneratedPasswordStore_sharedStore__block_invoke()
{
  WBSGeneratedPasswordStore *v0;
  void *v1;

  v0 = objc_alloc_init(WBSGeneratedPasswordStore);
  v1 = (void *)sharedStore_sharedStore;
  sharedStore_sharedStore = (uint64_t)v0;

}

- (WBSGeneratedPasswordStore)init
{
  WBSGeneratedPasswordStore *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  WBSKeychainCredentialNotificationMonitor *v9;
  WBSKeychainCredentialNotificationMonitor *keychainMonitor;
  OS_dispatch_queue *v11;
  WBSKeychainCredentialNotificationMonitor *v12;
  OS_dispatch_queue *v13;
  id v14;
  WBSGeneratedPasswordStore *v15;
  _QWORD v17[4];
  OS_dispatch_queue *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)WBSGeneratedPasswordStore;
  v2 = -[WBSGeneratedPasswordStore init](&v21, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.SafariCore.%@.%p"), v5, v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = -[WBSKeychainCredentialNotificationMonitor initWithCoalescingInterval:]([WBSKeychainCredentialNotificationMonitor alloc], "initWithCoalescingInterval:", 0.0);
    keychainMonitor = v2->_keychainMonitor;
    v2->_keychainMonitor = v9;

    objc_initWeak(&location, v2);
    v11 = v2->_queue;
    v12 = v2->_keychainMonitor;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __33__WBSGeneratedPasswordStore_init__block_invoke;
    v17[3] = &unk_1E649C448;
    v13 = v11;
    v18 = v13;
    objc_copyWeak(&v19, &location);
    v14 = -[WBSKeychainCredentialNotificationMonitor addObserverWithBlock:](v12, "addObserverWithBlock:", v17);
    -[WBSGeneratedPasswordStore preWarm](v2, "preWarm");
    v15 = v2;
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

  return v2;
}

void __33__WBSGeneratedPasswordStore_init__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__WBSGeneratedPasswordStore_init__block_invoke_2;
  block[3] = &unk_1E649B5B0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __33__WBSGeneratedPasswordStore_init__block_invoke_2(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_DEFAULT, "Generated passwords store received Keychain update notification", buf, 2u);
    }
    if (WeakRetained[32])
    {
      v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEFAULT, "Generated passwords store is ignoring Keychain update notifications", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "_reset");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__WBSGeneratedPasswordStore_init__block_invoke_8;
      block[3] = &unk_1E649B5B0;
      objc_copyWeak(&v6, v1);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v6);
    }
  }

}

void __33__WBSGeneratedPasswordStore_init__block_invoke_8(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("WBSGeneratedPasswordStoreDidChangeNotification"), WeakRetained);

  }
}

- (NSArray)allUnexpiredGeneratedPasswords
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__WBSGeneratedPasswordStore_allUnexpiredGeneratedPasswords__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __59__WBSGeneratedPasswordStore_allUnexpiredGeneratedPasswords__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNeeded");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDate)currentExpirationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -30, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("DebugGeneratedPasswordsExpirationTimeInMinutes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerForKey:", CFSTR("DebugGeneratedPasswordsExpirationTimeInMinutes"));

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 64, -v8, v2, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }

  return (NSDate *)v4;
}

- (void)preWarm
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__WBSGeneratedPasswordStore_preWarm__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__WBSGeneratedPasswordStore_preWarm__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadIfNeeded");
}

- (void)_loadIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *cachedGeneratedPasswords;
  void *v12;
  uint64_t v13;
  NSObject *queue;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  if (!self->_cachedGeneratedPasswords)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_DEFAULT, "Reloading generated passwords store", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_allGeneratedPasswordItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_15_1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSGeneratedPasswordStore currentExpirationDate](self, "currentExpirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSGeneratedPasswordStore _generatedPasswordsFilteringExpiredPasswords:olderThanDate:](self, "_generatedPasswordsFilteringExpiredPasswords:olderThanDate:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "first");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
    cachedGeneratedPasswords = self->_cachedGeneratedPasswords;
    self->_cachedGeneratedPasswords = v10;

    objc_msgSend(v8, "second");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      queue = self->_queue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __42__WBSGeneratedPasswordStore__loadIfNeeded__block_invoke_2;
      v16[3] = &unk_1E649B6D8;
      v16[4] = self;
      v17 = v8;
      dispatch_async(queue, v16);

    }
    v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v15, OS_LOG_TYPE_DEFAULT, "Finished reloading generated passwords store", buf, 2u);
    }

  }
}

WBSGeneratedPassword *__42__WBSGeneratedPasswordStore__loadIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSGeneratedPassword *v3;

  v2 = a2;
  v3 = -[WBSGeneratedPassword initWithKeychainItemDictionary:]([WBSGeneratedPassword alloc], "initWithKeychainItemDictionary:", v2);

  return v3;
}

void __42__WBSGeneratedPasswordStore__loadIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "second");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_purgeExpiredPasswordsOnInternalQueue:", v2);

}

- (void)_reset
{
  NSMutableArray *cachedGeneratedPasswords;

  cachedGeneratedPasswords = self->_cachedGeneratedPasswords;
  self->_cachedGeneratedPasswords = 0;

}

- (void)_purgeExpiredPasswordsOnInternalQueue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  WBSGeneratedPasswordStore *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, "Purging expired generated passwords", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("DebugGeneratedPasswordsExpirationTimeInMinutes"));
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v7;
        _os_log_impl(&dword_1B2621000, v8, OS_LOG_TYPE_DEFAULT, "Removing debug generated passwords limit of %@ minutes", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("DebugGeneratedPasswordsExpirationTimeInMinutes"));

    }
    v23 = (void *)v7;
    v24 = self;
    self->_shouldIgnoreKeychainUpdates = 1;
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v4;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = v17;
            objc_msgSend(v16, "generationDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "protectionSpace");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "host");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = (uint64_t)v19;
            v32 = 2112;
            v33 = v21;
            _os_log_impl(&dword_1B2621000, v18, OS_LOG_TYPE_DEFAULT, "Removing password generated on %@ for host %@", buf, 0x16u);

          }
          objc_msgSend(v10, "safari_deleteGeneratedPassword:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v13);
    }

    v24->_shouldIgnoreKeychainUpdates = 0;
    v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v22, OS_LOG_TYPE_DEFAULT, "Finished purging expired generated passwords", buf, 2u);
    }

    v4 = v25;
  }

}

- (id)_generatedPasswordsFilteringExpiredPasswords:(id)a3 olderThanDate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  WBSPair *v12;
  WBSPair *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __88__WBSGeneratedPasswordStore__generatedPasswordsFilteringExpiredPasswords_olderThanDate___block_invoke;
  v18 = &unk_1E649C4D8;
  v19 = v5;
  v20 = v8;
  v9 = v8;
  v10 = v5;
  objc_msgSend(v7, "safari_filterObjectsUsingBlock:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [WBSPair alloc];
  v13 = -[WBSPair initWithFirst:second:](v12, "initWithFirst:second:", v11, v9, v15, v16, v17, v18);

  return v13;
}

uint64_t __88__WBSGeneratedPasswordStore__generatedPasswordsFilteringExpiredPasswords_olderThanDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "generationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "earlierDate:", *(_QWORD *)(a1 + 32)),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)addGeneratedPassword:(id)a3 forProtectionSpace:(id)a4 inPrivateBrowsingSession:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *queue;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  id v19;
  BOOL v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  if (!v10 || !v11)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[WBSGeneratedPasswordStore addGeneratedPassword:forProtectionSpace:inPrivateBrowsingSession:completionHandler:].cold.1();
      if (!v12)
        goto LABEL_7;
    }
    else if (!v12)
    {
      goto LABEL_7;
    }
    v12[2](v12, 0);
    goto LABEL_7;
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__WBSGeneratedPasswordStore_addGeneratedPassword_forProtectionSpace_inPrivateBrowsingSession_completionHandler___block_invoke;
  v15[3] = &unk_1E649C500;
  objc_copyWeak(&v19, &location);
  v18 = v12;
  v16 = v10;
  v17 = v11;
  v20 = a5;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_7:

}

void __112__WBSGeneratedPasswordStore_addGeneratedPassword_forProtectionSpace_inPrivateBrowsingSession_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_addGeneratedPassword:forProtectionSpace:wasGeneratedInPrivateBrowsingSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    objc_msgSend(WeakRetained, "_reset");

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }

}

- (void)updateGeneratedPassword:(id)a3 withPassword:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *queue;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (!v8 || !v9)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[WBSGeneratedPasswordStore updateGeneratedPassword:withPassword:completionHandler:].cold.1();
      if (!v10)
        goto LABEL_7;
    }
    else if (!v10)
    {
      goto LABEL_7;
    }
    v10[2](v10, 0);
    goto LABEL_7;
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSGeneratedPasswordStore_updateGeneratedPassword_withPassword_completionHandler___block_invoke;
  block[3] = &unk_1E649C528;
  objc_copyWeak(&v17, &location);
  v16 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
LABEL_7:

}

void __84__WBSGeneratedPasswordStore_updateGeneratedPassword_withPassword_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_updateGeneratedPassword:withPassword:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    objc_msgSend(WeakRetained, "_reset");

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }

}

- (void)removeGeneratedPassword:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *queue;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(_QWORD);
  id v13;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v6)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSGeneratedPasswordStore removeGeneratedPassword:completionHandler:].cold.1(v9);
      if (!v7)
        goto LABEL_6;
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    v7[2](v7);
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__WBSGeneratedPasswordStore_removeGeneratedPassword_completionHandler___block_invoke;
  v10[3] = &unk_1E649C550;
  objc_copyWeak(&v13, &location);
  v12 = v7;
  v11 = v6;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_6:

}

void __71__WBSGeneratedPasswordStore_removeGeneratedPassword_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_deleteGeneratedPassword:", *(_QWORD *)(a1 + 32));

    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    objc_msgSend(WeakRetained, "_reset");
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }

}

- (void)synchronouslyRemoveGeneratedPasswordsNewerThanDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  WBSGeneratedPasswordStore *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__WBSGeneratedPasswordStore_synchronouslyRemoveGeneratedPasswordsNewerThanDate___block_invoke;
  block[3] = &unk_1E649B6D8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __80__WBSGeneratedPasswordStore_synchronouslyRemoveGeneratedPasswordsNewerThanDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToDate:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_removeAllGeneratedPasswordsOnInternalQueue");
  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEFAULT, "Removing generated passwords newer than %@", buf, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = 1;
    objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_allGeneratedPasswordItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_21_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "generationDate", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "laterDate:", *(_QWORD *)(a1 + 32));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(a1 + 32);

          if (v16 != v17)
            objc_msgSend(v6, "safari_deleteGeneratedPassword:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = 0;
    v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2621000, v18, OS_LOG_TYPE_DEFAULT, "Finished removing generated passwords", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_reset", (_QWORD)v19);

  }
}

WBSGeneratedPassword *__80__WBSGeneratedPasswordStore_synchronouslyRemoveGeneratedPasswordsNewerThanDate___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  WBSGeneratedPassword *v3;

  v2 = a2;
  v3 = -[WBSGeneratedPassword initWithKeychainItemDictionary:]([WBSGeneratedPassword alloc], "initWithKeychainItemDictionary:", v2);

  return v3;
}

- (void)_removeAllGeneratedPasswordsOnInternalQueue
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_deleteAllGeneratedPasswords");

  -[WBSGeneratedPasswordStore _reset](self, "_reset");
}

- (id)generatedPasswordsForProtectionSpace:(id)a3 options:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = (id)MEMORY[0x1E0C9AA60];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__WBSGeneratedPasswordStore_generatedPasswordsForProtectionSpace_options___block_invoke;
  v11[3] = &unk_1E649C5C0;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __74__WBSGeneratedPasswordStore_generatedPasswordsForProtectionSpace_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "_loadIfNeeded");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__WBSGeneratedPasswordStore_generatedPasswordsForProtectionSpace_options___block_invoke_2;
  v9[3] = &unk_1E649C598;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 56);
  v10 = v4;
  v11 = v5;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

BOOL __74__WBSGeneratedPasswordStore_generatedPasswordsForProtectionSpace_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL8 v7;

  objc_msgSend(a2, "protectionSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  if ((objc_msgSend(v3, "isEqualToProtectionSpaceForPasswordManager:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 40) & 1) == 0
      || (objc_msgSend(*(id *)(a1 + 32), "safari_protectionSpaceByReplacingHostWithHighlevelDomain"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "safari_protectionSpaceByReplacingHostWithHighlevelDomain"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v4, "isEqualToProtectionSpaceForPasswordManager:", v5),
          v5,
          v4,
          (v6 & 1) == 0))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)debug_removeAll
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSGeneratedPasswordStore synchronouslyRemoveGeneratedPasswordsNewerThanDate:](self, "synchronouslyRemoveGeneratedPasswordsNewerThanDate:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedGeneratedPasswords, 0);
}

- (void)addGeneratedPassword:forProtectionSpace:inPrivateBrowsingSession:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "Attempted to add a generated password record with a nil password or protectionSpace: password=%p protectionSpace=%p", v2, v3);
}

- (void)updateGeneratedPassword:withPassword:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "Attempted to update a generated password record with a nil generated password or new password: generatedPassword=%p password=%p", v2, v3);
}

- (void)removeGeneratedPassword:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Refusing to delete a nil generated password record", v1, 2u);
}

@end
