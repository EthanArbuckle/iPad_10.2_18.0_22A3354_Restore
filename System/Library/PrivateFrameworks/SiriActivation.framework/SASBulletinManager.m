@implementation SASBulletinManager

- (SASBulletinManager)init
{
  SASBulletinManager *v2;
  SASBulletinCache *v3;
  SASBulletinCache *bulletinCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *bulletinsOnLockScreen;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SASBulletinManager;
  v2 = -[SASBulletinManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SASBulletinCache);
    bulletinCache = v2->_bulletinCache;
    v2->_bulletinCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bulletinsOnLockScreen = v2->_bulletinsOnLockScreen;
    v2->_bulletinsOnLockScreen = v5;

    -[SASBulletinManager _setupObserver](v2, "_setupObserver");
  }
  return v2;
}

- (void)_setupObserver
{
  BBObserver *observer;
  BBObserver *v4;
  BBObserver *v5;

  observer = self->_observer;
  if (!observer)
  {
    v4 = (BBObserver *)objc_alloc_init(MEMORY[0x1E0D036C0]);
    v5 = self->_observer;
    self->_observer = v4;

    observer = self->_observer;
  }
  -[BBObserver setDelegate:](observer, "setDelegate:", self);
  -[BBObserver setObserverFeed:](self->_observer, "setObserverFeed:", 65023);
}

- (void)dealloc
{
  BBObserver *observer;
  objc_super v4;

  -[BBObserver invalidate](self->_observer, "invalidate");
  -[BBObserver setDelegate:](self->_observer, "setDelegate:", 0);
  observer = self->_observer;
  self->_observer = 0;

  v4.receiver = self;
  v4.super_class = (Class)SASBulletinManager;
  -[SASBulletinManager dealloc](&v4, sel_dealloc);
}

- (void)_bulletinsDidChange
{
  id v3;

  -[SASBulletinManager delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bulletinManagerDidChangeBulletins:", self);

}

- (id)_displayNameForBulletin:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CA5858];
  objc_msgSend(v3, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationProxyForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedNameForContext:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v3, "sectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.cmas"));

    if (!v10)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "title");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;
LABEL_7:

  return v11;
}

- (id)allBulletins
{
  void *v2;
  void *v3;

  -[SASBulletinCache allBulletins](self->_bulletinCache, "allBulletins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bulletinsOnLockScreen
{
  return (id)-[NSMutableDictionary allValues](self->_bulletinsOnLockScreen, "allValues");
}

- (id)bulletinForIdentifier:(id)a3
{
  id v4;
  void **p_bulletinCache;
  SASBulletinCache *bulletinCache;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    bulletinCache = self->_bulletinCache;
    p_bulletinCache = (void **)&self->_bulletinCache;
    -[SASBulletinCache cachedBulletinForID:](bulletinCache, "cachedBulletinForID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
        -[SASBulletinManager bulletinForIdentifier:].cold.1((uint64_t)v4, p_bulletinCache, v8);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CFE838]);
  objc_msgSend(v8, "setRead:", 0);
  objc_msgSend(v8, "setBulletin:", v7);
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SASBulletinManager_observer_addBulletin_forFeed___block_invoke;
  block[3] = &unk_1E91FC8E8;
  objc_copyWeak(v15, &location);
  v13 = v8;
  v14 = v7;
  v15[1] = (id)a5;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __51__SASBulletinManager_observer_addBulletin_forFeed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "_displayNameForBulletin:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayName:", v5);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SASBulletinManager_observer_addBulletin_forFeed___block_invoke_2;
    block[3] = &unk_1E91FC8C0;
    block[4] = v3;
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 56);
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __51__SASBulletinManager_observer_addBulletin_forFeed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBulletinCompletionWithBulletin:forFeed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)addBulletinCompletionWithBulletin:(id)a3 forFeed:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *bulletinsOnLockScreen;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  v6 = a3;
  bulletinsOnLockScreen = self->_bulletinsOnLockScreen;
  objc_msgSend(v6, "bulletinID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](bulletinsOnLockScreen, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAvailableOnLockScreen:", objc_msgSend(v9, "availableOnLockScreen"));
  if ((a4 & 8) != 0)
  {
    v10 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
      -[SASBulletinManager addBulletinCompletionWithBulletin:forFeed:].cold.1(v10, v6);
    objc_msgSend(v6, "setAvailableOnLockScreen:", 1);
    v11 = self->_bulletinsOnLockScreen;
    objc_msgSend(v6, "bulletinID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v6, v12);

  }
  -[SASBulletinCache insertBulletin:fromFeed:](self->_bulletinCache, "insertBulletin:fromFeed:", v6, a4);
  -[SASBulletinManager _bulletinsDidChange](self, "_bulletinsDidChange");

}

- (void)observer:(id)a3 modifyBulletin:(id)a4
{
  id v5;
  SASBulletinCache *bulletinCache;
  void *v7;
  void *v8;
  SASBulletinCache *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  _BYTE location[12];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  bulletinCache = self->_bulletinCache;
  objc_msgSend(v5, "bulletinID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASBulletinCache cachedBulletinForID:](bulletinCache, "cachedBulletinForID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_bulletinCache;
    objc_msgSend(v5, "bulletinID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASBulletinCache removeBulletinForID:](v9, "removeBulletinForID:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0CFE838]);
    objc_msgSend(v11, "setRead:", 0);
    objc_msgSend(v11, "setBulletin:", v5);
    objc_initWeak((id *)location, self);
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SASBulletinManager_observer_modifyBulletin___block_invoke;
    block[3] = &unk_1E91FBFE0;
    objc_copyWeak(&v20, (id *)location);
    v18 = v11;
    v19 = v5;
    v13 = v11;
    dispatch_async(v12, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v14 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      objc_msgSend(v5, "bulletinID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[SASBulletinManager observer:modifyBulletin:]";
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1D132F000, v15, OS_LOG_TYPE_DEFAULT, "%s ACAssistantBBObserver: Trying to modify a bulletin %@ that I don't already have.", location, 0x16u);

    }
  }

}

void __46__SASBulletinManager_observer_modifyBulletin___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "_displayNameForBulletin:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayName:", v5);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__SASBulletinManager_observer_modifyBulletin___block_invoke_2;
    v6[3] = &unk_1E91FC910;
    v6[4] = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __46__SASBulletinManager_observer_modifyBulletin___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modifyBulletinCompletionWithBulletin:", *(_QWORD *)(a1 + 40));
}

- (void)modifyBulletinCompletionWithBulletin:(id)a3
{
  NSMutableDictionary *bulletinsOnLockScreen;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SASBulletinCache insertBulletin:fromFeed:](self->_bulletinCache, "insertBulletin:fromFeed:", v9, 65023);
  bulletinsOnLockScreen = self->_bulletinsOnLockScreen;
  objc_msgSend(v9, "bulletinID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](bulletinsOnLockScreen, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = self->_bulletinsOnLockScreen;
    objc_msgSend(v9, "bulletinID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, v8);

  }
  -[SASBulletinManager _bulletinsDidChange](self, "_bulletinsDidChange");

}

- (void)observer:(id)a3 removeBulletin:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "bulletinID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SASBulletinManager observer:purgeReferencesToBulletinID:](self, "observer:purgeReferencesToBulletinID:", v6, v7);

}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  char v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if ((v5 & 8) != 0)
  {
    objc_msgSend(v7, "bulletinID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_bulletinsOnLockScreen, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x1E0CFE6A0];
    v12 = *MEMORY[0x1E0CFE6A0];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SASBulletinManager observer:removeBulletin:forFeed:].cold.1();
      -[NSMutableDictionary removeObjectForKey:](self->_bulletinsOnLockScreen, "removeObjectForKey:", v9);
      -[SASBulletinManager _bulletinsDidChange](self, "_bulletinsDidChange");
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "-[SASBulletinManager observer:removeBulletin:forFeed:]";
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s ACAssistantBBObserver: Asked to remove a bulletin from lock screen %@ that I don't already have.", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (void)observer:(id)a3 purgeReferencesToBulletinID:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SASBulletinCache cachedBulletinForID:](self->_bulletinCache, "cachedBulletinForID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SASBulletinCache removeBulletinForID:](self->_bulletinCache, "removeBulletinForID:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_bulletinsOnLockScreen, "removeObjectForKey:", v5);
    -[SASBulletinManager _bulletinsDidChange](self, "_bulletinsDidChange");
  }
  else
  {
    v7 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[SASBulletinManager observer:purgeReferencesToBulletinID:]";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s ACAssistantBBObserver: Asked to remove a bulletin %@ that I don't already have.", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[SASBulletinManager observer:purgeReferencesToBulletinID:](self, "observer:purgeReferencesToBulletinID:", v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (SASBulletinManagerDelegate)delegate
{
  return (SASBulletinManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bulletinsOnLockScreen, 0);
  objc_storeStrong((id *)&self->_bulletinCache, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

- (void)bulletinForIdentifier:(void *)a3 .cold.1(uint64_t a1, void **a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *a2;
  v5 = a3;
  objc_msgSend(v4, "allBulletins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315650;
  v9 = "-[SASBulletinManager bulletinForIdentifier:]";
  v10 = 2112;
  v11 = a1;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEBUG, "%s Bulletin with identifier: %@ not found in cache with bulletinIDs: %@", (uint8_t *)&v8, 0x20u);

}

- (void)addBulletinCompletionWithBulletin:(void *)a1 forFeed:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "bbBulletin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D132F000, v3, v5, "%s %@ added to lock screen feed", (uint8_t *)v6);

}

- (void)observer:removeBulletin:forFeed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D132F000, v0, v1, "%s %@ removed from lock screen feed", (uint8_t *)v2);
}

@end
