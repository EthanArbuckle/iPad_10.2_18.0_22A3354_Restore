@implementation ICHTTPCookieStore

uint64_t __53__ICHTTPCookieStore_getCookiesForURL_userIdentifier___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (id)_cookieDictionaryForURL:(id)a3 userIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHTTPCookieStore _accountForUserIdentifier:](self, "_accountForUserIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (v6)
      objc_msgSend(v9, "ams_cookiesForURL:", v6);
    else
      objc_msgSend(v9, "ams_cookies");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "name", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v16, v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

  }
  return v8;
}

- (id)_accountForUserIdentifier:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  ICHTTPCookieStore *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "longLongValue") == -1)
    {
      v14 = 0;
      v6 = (id *)&v14;
      objc_msgSend(v5, "localStoreAccountWithError:", &v14);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
      v6 = (id *)&v13;
      objc_msgSend(v5, "storeAccountForDSID:error:", v4, &v13);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    v9 = *v6;
    if (v9)
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v16 = self;
        v17 = 2114;
        v18 = v4;
        v19 = 2114;
        v20 = v9;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load account for identifier %{public}@. err=%{public}@", buf, 0x20u);
      }

    }
    if (!v8)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v4;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "%{public}@: No account found for identifier %{public}@.", buf, 0x16u);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getCookieWithName:(id)a3 userIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICHTTPCookieStore getCookiesForUserIdentifier:](self, "getCookiesForUserIdentifier:", a4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "name", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if (v13)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)getCookiesForUserIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__33446;
  v16 = __Block_byref_object_dispose__33447;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICHTTPCookieStore_getCookiesForUserIdentifier___block_invoke;
  block[3] = &unk_1E43907D8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __49__ICHTTPCookieStore_getCookiesForUserIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

+ (ICHTTPCookieStore)sharedCookieStore
{
  if (sharedCookieStore_sOnceToken != -1)
    dispatch_once(&sharedCookieStore_sOnceToken, &__block_literal_global_33457);
  return (ICHTTPCookieStore *)(id)sharedCookieStore_sSharedCookieStore;
}

- (id)getCookiesHeadersForURL:(id)a3 userIdentifier:(id)a4
{
  void *v4;
  void *v5;

  -[ICHTTPCookieStore getCookiesForURL:userIdentifier:](self, "getCookiesForURL:userIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C00], "requestHeaderFieldsWithCookies:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getCookiesForURL:(id)a3 userIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__33446;
  v21 = __Block_byref_object_dispose__33447;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__ICHTTPCookieStore_getCookiesForURL_userIdentifier___block_invoke;
  v13[3] = &unk_1E43907B0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __49__ICHTTPCookieStore_getCookiesForUserIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_cookieDictionaryForURL:userIdentifier:", 0, &unk_1E43E68E0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(*(id *)(a1 + 40), "longLongValue") >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cookieDictionaryForURL:userIdentifier:", 0, *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __49__ICHTTPCookieStore_getCookiesForUserIdentifier___block_invoke_2;
    v12 = &unk_1E4390788;
    v13 = v7;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v9);

  }
  objc_msgSend(v7, "allValues", v7, v9, v10, v11, v12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __53__ICHTTPCookieStore_getCookiesForURL_userIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_cookieDictionaryForURL:userIdentifier:", *(_QWORD *)(a1 + 40), &unk_1E43E68E0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(*(id *)(a1 + 48), "longLongValue") >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cookieDictionaryForURL:userIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __53__ICHTTPCookieStore_getCookiesForURL_userIdentifier___block_invoke_6;
    v22[3] = &unk_1E4390788;
    v23 = v3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v22);

  }
  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cookiesForURL:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "name", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v3, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            objc_msgSend(v3, "setObject:forKey:", v12, v13);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "allValues");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

void __38__ICHTTPCookieStore_sharedCookieStore__block_invoke()
{
  ICHTTPCookieStore *v0;
  void *v1;

  v0 = objc_alloc_init(ICHTTPCookieStore);
  v1 = (void *)sharedCookieStore_sSharedCookieStore;
  sharedCookieStore_sSharedCookieStore = (uint64_t)v0;

}

- (ICHTTPCookieStore)init
{
  ICHTTPCookieStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICHTTPCookieStore;
  v2 = -[ICHTTPCookieStore init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.itunescloud.ICStoreHTTPCookieManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICHTTPCookieStore;
  -[ICHTTPCookieStore dealloc](&v2, sel_dealloc);
}

- (id)getCookiesForURL:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__33446;
  v16 = __Block_byref_object_dispose__33447;
  v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__ICHTTPCookieStore_getCookiesForURL___block_invoke;
  v9[3] = &unk_1E4391568;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getGlobalAccountCookiesForURL:(id)a3
{
  return -[ICHTTPCookieStore getCookiesForURL:userIdentifier:](self, "getCookiesForURL:userIdentifier:", a3, &unk_1E43E68E0);
}

- (void)saveCookies:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__ICHTTPCookieStore_saveCookies_forURL___block_invoke;
  v11[3] = &unk_1E4391110;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

}

- (void)saveCookies:(id)a3 forURL:(id)a4 userIdentifier:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICHTTPCookieStore_saveCookies_forURL_userIdentifier___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)saveGlobalAccountCookies:(id)a3 forURL:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__ICHTTPCookieStore_saveGlobalAccountCookies_forURL___block_invoke;
  v8[3] = &unk_1E4391110;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)removeCookiesWithProperties:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ICHTTPCookieStore_removeCookiesWithProperties___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeAllCookies
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ICHTTPCookieStore_removeAllCookies__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_saveCookies:(id)a3 userIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  ICHTTPCookieStore *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICHTTPCookieStore _accountForUserIdentifier:](self, "_accountForUserIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "ams_addCookies:", v6))
  {
    +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v9, "saveAccount:error:", v8, &v12);
    v10 = v12;

    if (v10)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v14 = self;
        v15 = 2114;
        v16 = v8;
        v17 = 2114;
        v18 = v10;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save cookies for account %{public}@. err=%{public}@", buf, 0x20u);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __37__ICHTTPCookieStore_removeAllCookies__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v1, "allStoreAccountsWithError:", &v23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v23;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v25 = v5;
      v26 = 2114;
      v27 = v3;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load accounts to remove all cookies. err=%{public}@", buf, 0x16u);
    }

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138543874;
    v16 = v8;
    do
    {
      v11 = 0;
      v12 = v3;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        objc_msgSend(v13, "ams_removeAllCookies", v16);
        v18 = v12;
        objc_msgSend(v1, "saveAccount:error:", v13, &v18);
        v3 = v18;

        if (v3)
        {
          v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v16;
            v25 = v15;
            v26 = 2114;
            v27 = v13;
            v28 = 2114;
            v29 = v3;
            _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove cookies from account %{public}@. err=%{public}@", buf, 0x20u);
          }

        }
        ++v11;
        v12 = v3;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v9);
  }

}

void __49__ICHTTPCookieStore_removeCookiesWithProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v2, "allStoreAccountsWithError:", &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v25 = v6;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load accounts to remove cookies. err=%{public}@", buf, 0x16u);
    }

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    *(_QWORD *)&v9 = 138543874;
    v17 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isActive", v17) & 1) != 0 || objc_msgSend(v13, "ams_isLocalAccount"))
        {
          objc_msgSend(v13, "ams_removeCookiesMatchingProperties:", *(_QWORD *)(a1 + 40));
          v18 = v4;
          objc_msgSend(v2, "saveAccount:error:", v13, &v18);
          v14 = v18;

          if (v14)
          {
            v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v16 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = v17;
              v25 = v16;
              v26 = 2114;
              v27 = v13;
              v28 = 2114;
              v29 = v14;
              _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove cookies from account %{public}@. err=%{public}@", buf, 0x20u);
            }

            v4 = v14;
          }
          else
          {
            v4 = 0;
          }
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v10);
  }

}

uint64_t __53__ICHTTPCookieStore_saveGlobalAccountCookies_forURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveCookies:userIdentifier:", *(_QWORD *)(a1 + 40), &unk_1E43E68E0);
}

uint64_t __55__ICHTTPCookieStore_saveCookies_forURL_userIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveCookies:userIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__ICHTTPCookieStore_saveCookies_forURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCookies:forURL:mainDocumentURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));

}

void __38__ICHTTPCookieStore_getCookiesForURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cookiesForURL:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
