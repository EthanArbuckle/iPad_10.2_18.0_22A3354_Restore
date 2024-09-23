@implementation PKDiscoveryDataSource

- (NSArray)articleLayouts
{
  os_unfair_lock_s *p_articleLayoutsLock;
  NSArray *articleLayouts;
  void *v5;

  p_articleLayoutsLock = &self->_articleLayoutsLock;
  os_unfair_lock_lock(&self->_articleLayoutsLock);
  articleLayouts = self->_articleLayouts;
  if (articleLayouts)
    v5 = (void *)-[NSArray copy](articleLayouts, "copy");
  else
    v5 = 0;
  os_unfair_lock_unlock(p_articleLayoutsLock);
  return (NSArray *)v5;
}

void __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke_2;
  block[3] = &unk_1E2AC3698;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v12 = v6;
  v13 = v5;
  v8 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v16);
}

- (PKDiscoveryDataSource)initWithDelegate:(id)a3
{
  id v4;
  PKDiscoveryDataSource *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  NSArray *v8;
  NSArray *articleLayouts;
  uint64_t v10;
  PKDiscoveryService *discoveryService;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AMSMetrics *AMPMetrics;
  PKDiscoveryDataSource *v18;
  _QWORD v20[4];
  PKDiscoveryDataSource *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDiscoveryDataSource;
  v5 = -[PKDiscoveryDataSource init](&v22, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.passd.discoverymanager.work", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_articleLayoutsLock._os_unfair_lock_opaque = 0;
    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    articleLayouts = v5->_articleLayouts;
    v5->_articleLayouts = v8;

    +[PKDiscoveryService sharedInstance](PKDiscoveryService, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    discoveryService = v5->_discoveryService;
    v5->_discoveryService = (PKDiscoveryService *)v10;

    -[PKDiscoveryService addObserver:](v5->_discoveryService, "addObserver:", v5);
    v12 = (void *)MEMORY[0x1E0CFD9E8];
    objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfileVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bagForProfile:profileVersion:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB60]), "initWithContainerID:bag:", CFSTR("com.apple.passbook"), v15);
    AMPMetrics = v5->_AMPMetrics;
    v5->_AMPMetrics = (AMSMetrics *)v16;

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__PKDiscoveryDataSource_initWithDelegate___block_invoke;
    v20[3] = &unk_1E2AC35F8;
    v18 = v5;
    v21 = v18;
    -[PKDiscoveryDataSource _manifestAllowsMiniCardsWithCompletion:](v18, "_manifestAllowsMiniCardsWithCompletion:", v20);
    -[PKDiscoveryDataSource updateArticleLayouts](v18, "updateArticleLayouts");

  }
  return v5;
}

- (void)updateArticleLayouts
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke;
  v4[3] = &unk_1E2AC3648;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_manifestAllowsMiniCardsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  PKDiscoveryService *discoveryService;
  _QWORD v7[5];
  void (**v8)(id, uint64_t);
  uint8_t buf[16];

  v4 = (void (**)(id, uint64_t))a3;
  if (PKDiscoveryForceAllowMiniCards())
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Skipping lookup for global value miniCardsAllowed due to internal setting to force mini cards", buf, 2u);
    }

    v4[2](v4, 1);
  }
  else
  {
    discoveryService = self->_discoveryService;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__PKDiscoveryDataSource__manifestAllowsMiniCardsWithCompletion___block_invoke;
    v7[3] = &unk_1E2AC3670;
    v7[4] = self;
    v8 = v4;
    -[PKDiscoveryService manifestAllowsMiniCardsWithCompletion:](discoveryService, "manifestAllowsMiniCardsWithCompletion:", v7);

  }
}

void __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  _BYTE *v10;
  os_signpost_id_t v11;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[40])
  {
    PKLogFacilityTypeGetObject(0x2CuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);
    v5 = v3;
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18FC92000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "com.apple.passkit.discovery.card-fetch", ", buf, 2u);
    }

    v2[40] = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_17;
    v8[3] = &unk_1E2AC3620;
    v10 = v2;
    v11 = v4;
    v9 = v6;
    v7 = v6;
    objc_msgSend(v2, "_updateArticlesWithCompletion:", v8);

  }
}

- (void)_updateArticlesWithCompletion:(id)a3
{
  id v4;
  PKDiscoveryService *discoveryService;
  uint64_t v6;
  id v7;
  PKDiscoveryService *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  discoveryService = self->_discoveryService;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke;
  v11[3] = &unk_1E2AC36C0;
  v11[4] = self;
  objc_copyWeak(&v13, &location);
  v7 = v4;
  v12 = v7;
  -[PKDiscoveryService discoveryArticleLayoutsWithCompletion:](discoveryService, "discoveryArticleLayoutsWithCompletion:", v11);
  v8 = self->_discoveryService;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke_22;
  v9[3] = &unk_1E2AC2E90;
  objc_copyWeak(&v10, &location);
  -[PKDiscoveryService dismissedDiscoveryItems:](v8, "dismissedDiscoveryItems:", v9);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

uint64_t __64__PKDiscoveryDataSource__manifestAllowsMiniCardsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PKLogFacilityTypeGetObject(0x10uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v7 = 138412290;
      v8 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Lookup for global value miniCardsAllowed failed with error:%@ returning NO", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v4)
  {
    v5 = *(unsigned __int8 *)(a1 + 48);
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Lookup for global value miniCardsAllowed succeeded with value:%ld", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __42__PKDiscoveryDataSource_initWithDelegate___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = a2;
  return result;
}

void __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      v10 = objc_msgSend(WeakRetained, "_queue_updateArticleLayouts:", *(_QWORD *)(a1 + 40));
      goto LABEL_8;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v9 = v7;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%@ could not fetch discovery article layouts: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  v10 = 0;
LABEL_8:
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v10, v3, v4);

}

- (BOOL)_queue_updateArticleLayouts:(id)a3
{
  NSArray *v4;
  NSArray *articleLayouts;
  BOOL v6;

  v4 = (NSArray *)a3;
  articleLayouts = self->_articleLayouts;
  if (!v4 || !articleLayouts)
  {
    if (articleLayouts == v4)
      goto LABEL_4;
LABEL_6:
    -[PKDiscoveryDataSource _addDismissActionToArticleLayouts:](self, "_addDismissActionToArticleLayouts:", v4);
    -[PKDiscoveryDataSource setArticleLayouts:](self, "setArticleLayouts:", v4);
    v6 = 1;
    goto LABEL_7;
  }
  if ((-[NSArray isEqual:](articleLayouts, "isEqual:", v4) & 1) == 0)
    goto LABEL_6;
LABEL_4:
  v6 = 0;
LABEL_7:

  return v6;
}

void __64__PKDiscoveryDataSource__manifestAllowsMiniCardsWithCompletion___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a2;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKDiscoveryDataSource__manifestAllowsMiniCardsWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABE0A8;
  v10 = v5;
  v11 = v6;
  v12 = a3;
  v8 = v5;
  dispatch_async(v7, block);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PKDiscoveryService sharedInstance](PKDiscoveryService, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryDataSource;
  -[PKDiscoveryDataSource dealloc](&v4, sel_dealloc);
}

- (BOOL)isMiniCardsAllowed
{
  return self->_miniCardsAllowed;
}

void __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_17(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  char v10;
  uint8_t buf[16];

  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18FC92000, v5, OS_SIGNPOST_INTERVAL_END, v6, "com.apple.passkit.discovery.card-fetch", ", buf, 2u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(NSObject **)(v7 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_18;
  v9[3] = &unk_1E2ABE1C0;
  v9[4] = v7;
  v10 = a2;
  dispatch_async(v8, v9);
}

void __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));

    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_2;
      block[3] = &unk_1E2ABE120;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __45__PKDiscoveryDataSource_updateArticleLayouts__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "discoveryDataSource:didUpdateArticleLayouts:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

}

- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  -[PKDiscoveryDataSource _articleLayoutForItemIdentifier:](self, "_articleLayoutForItemIdentifier:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v6[2](v6, v7, 0);
  else
    -[PKDiscoveryService discoveryArticleLayoutForItemWithIdentifier:completion:](self->_discoveryService, "discoveryArticleLayoutForItemWithIdentifier:completion:", v8, v6);

}

- (void)setArticleLayouts:(id)a3
{
  NSArray *v4;
  NSArray *articleLayouts;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_articleLayoutsLock);
  articleLayouts = self->_articleLayouts;
  self->_articleLayouts = v4;

  os_unfair_lock_unlock(&self->_articleLayoutsLock);
}

- (void)discoveryService:(id)a3 receivedUpdatedDiscoveryArticleLayouts:(id)a4
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PKDiscoveryDataSource_discoveryService_receivedUpdatedDiscoveryArticleLayouts___block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(workQueue, v8);

}

void __81__PKDiscoveryDataSource_discoveryService_receivedUpdatedDiscoveryArticleLayouts___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[5];
  char v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_updateArticleLayouts:", *(_QWORD *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__PKDiscoveryDataSource_discoveryService_receivedUpdatedDiscoveryArticleLayouts___block_invoke_2;
  v3[3] = &unk_1E2ABE1C0;
  v4 = v2;
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __81__PKDiscoveryDataSource_discoveryService_receivedUpdatedDiscoveryArticleLayouts___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
      v3 = *(void **)(a1 + 32);
      objc_msgSend(v3, "articleLayouts");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "discoveryDataSource:didUpdateArticleLayouts:", v3, v4);

    }
  }
}

- (void)discoveryService:(id)a3 completedCTAForItem:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "eventForKey:", CFSTR("actionComplete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[AMSMetrics enqueueEvent:](self->_AMPMetrics, "enqueueEvent:", v5);
    v5 = v6;
  }

}

- (id)_articleLayoutForItemIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_articleLayouts;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "itemIdentifier", (_QWORD)v15);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          v13 = objc_msgSend(v10, "isEqualToString:", v11);

          if (v13)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_17:

  return v6;
}

void __55__PKDiscoveryDataSource__updateArticlesWithCompletion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "eventForKey:", CFSTR("dismiss"), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(WeakRetained[2], "enqueueEvent:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_addDismissActionToArticleLayouts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id obj;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id from;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id location;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_initWeak(&from, v9);
        aBlock[0] = v7;
        aBlock[1] = 3221225472;
        aBlock[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke;
        aBlock[3] = &unk_1E2AC3760;
        objc_copyWeak(&v13, &location);
        objc_copyWeak(&v14, &from);
        v10 = _Block_copy(aBlock);
        objc_msgSend(v9, "setActionOnDismiss:", v10);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&from);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

void __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (id *)(a1 + 40);
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (WeakRetained && v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
    v9 = MEMORY[0x1E0C809B0];
    v10 = (void *)*((_QWORD *)WeakRetained + 4);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_2;
    v22[3] = &unk_1E2AC36E8;
    v22[4] = v8;
    v11 = objc_msgSend(v10, "indexOfObjectPassingTest:", v22);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      v13 = (void *)objc_msgSend(*((id *)WeakRetained + 4), "mutableCopy");
      objc_msgSend(v13, "removeObjectAtIndex:", v12);
      v14 = objc_msgSend(v13, "copy");
      v15 = (void *)*((_QWORD *)WeakRetained + 4);
      *((_QWORD *)WeakRetained + 4) = v14;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
    v16 = (void *)*((_QWORD *)WeakRetained + 1);
    objc_msgSend(v8, "itemIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_3;
    v18[3] = &unk_1E2AC3738;
    objc_copyWeak(&v20, v4);
    objc_copyWeak(&v21, v6);
    v19 = v3;
    objc_msgSend(v16, "updateDiscoveryItemWithIdentifier:forAction:completion:", v17, 1, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
  }

}

uint64_t __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

void __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 5);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[6];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_4;
    v7[3] = &unk_1E2AC3710;
    objc_copyWeak(&v10, a1 + 5);
    objc_copyWeak(&v11, a1 + 6);
    v9 = a1[4];
    v8 = v3;
    dispatch_async(v6, v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
  }

}

void __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_4(id *a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = objc_loadWeakRetained(a1 + 7);
  v4 = v3;
  if (WeakRetained)
  {
    objc_msgSend(v3, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventForKey:", CFSTR("dismiss"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(WeakRetained[2], "enqueueEvent:", v6);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_5;
    v7[3] = &unk_1E2ABDDB0;
    v9 = a1[5];
    v8 = a1[4];
    objc_msgSend(WeakRetained, "_updateArticlesWithCompletion:", v7);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

uint64_t __59__PKDiscoveryDataSource__addDismissActionToArticleLayouts___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0, a2);
}

- (void)displayedDiscoveryItem:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  void *v15;
  PKDiscoveryService *discoveryService;
  void *v17;
  void *v18;
  PKDiscoveryService *v19;
  _QWORD v20[5];
  id v21;
  id location;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v14 = a3;
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  discoveryService = self->_discoveryService;
  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryService displayedDiscoveryItemWithIdentifier:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:](discoveryService, "displayedDiscoveryItemWithIdentifier:isWelcomeCard:afterSwipingToCard:multipleStoryCardsAvailable:callToAction:cardSize:", v17, v12, v11, v10, a7, a8);

  if (!v12)
  {
    objc_msgSend(v14, "eventForKey:", CFSTR("display"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[AMSMetrics enqueueEvent:](self->_AMPMetrics, "enqueueEvent:", v18);
    objc_initWeak(&location, self);
    v19 = self->_discoveryService;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __131__PKDiscoveryDataSource_displayedDiscoveryItem_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke;
    v20[3] = &unk_1E2AC3788;
    objc_copyWeak(&v21, &location);
    v20[4] = self;
    -[PKDiscoveryService discoveryArticleLayoutForItemWithIdentifier:completion:](v19, "discoveryArticleLayoutForItemWithIdentifier:completion:", v15, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __131__PKDiscoveryDataSource_displayedDiscoveryItem_isWelcomeCard_afterSwipingToCard_multipleStoryCardsAvailable_callToAction_cardSize___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7 && WeakRetained)
  {
    objc_msgSend(v7, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasHitMaxViewCount") & 1) != 0 || objc_msgSend(v4, "hasHitMaxLargeViewCount"))
    {
      objc_msgSend(v7, "item");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventForKey:", CFSTR("displayLimitReached"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enqueueEvent:", v6);

    }
  }

}

- (void)tappedDiscoveryItem:(id)a3 callToAction:(id)a4 cardSize:(int64_t)a5
{
  PKDiscoveryService *discoveryService;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  discoveryService = self->_discoveryService;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "action");

  -[PKDiscoveryService tappedDiscoveryItemWithIdentifier:callToAction:cardSize:](discoveryService, "tappedDiscoveryItemWithIdentifier:callToAction:cardSize:", v11, v12, a5);
  objc_msgSend(v10, "eventForKey:", CFSTR("action"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v13 = v14;
  if (v14)
  {
    -[AMSMetrics enqueueEvent:](self->_AMPMetrics, "enqueueEvent:", v14);
    v13 = v14;
  }

}

- (PKDiscoveryDataSourceDelegate)delegate
{
  return (PKDiscoveryDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setMiniCardsAllowed:(BOOL)a3
{
  self->_miniCardsAllowed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_articleLayouts, 0);
  objc_storeStrong((id *)&self->_AMPMetrics, 0);
  objc_storeStrong((id *)&self->_discoveryService, 0);
}

@end
