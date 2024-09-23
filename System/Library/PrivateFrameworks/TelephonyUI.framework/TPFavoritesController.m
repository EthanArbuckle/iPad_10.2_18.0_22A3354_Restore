@implementation TPFavoritesController

void __60__TPFavoritesController_initWithContactStore_prefetchCount___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "performInitialFetchIfNeeded");
    WeakRetained = v2;
  }

}

- (id)fetchFavoritesEntries
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TPFavoritesController contactCache](self, "contactCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[TPFavoritesController transportNameCache](self, "transportNameCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[TPFavoritesController favoritesManager](self, "favoritesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = v4;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    v14 = *MEMORY[0x1E0C965F8];
    v37 = *MEMORY[0x1E0C96658];
    do
    {
      v15 = 0;
      v36 = v12;
      do
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(obj);
        v16 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * v15);
        objc_msgSend(v16, "actionType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", v14))
        {

        }
        else
        {
          objc_msgSend(v16, "actionType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v37);

          v20 = v16;
          if (!v19)
            goto LABEL_15;
        }
        -[TPFavoritesController callProviderManager](self, "callProviderManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "providerForFavoritesEntry:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          -[TPFavoritesController setNeedsProvidersUpdates:](self, "setNeedsProvidersUpdates:", 1);
        v20 = v16;
        if ((objc_msgSend(v22, "supportsAudioAndVideo") & 1) == 0)
        {
          v20 = v16;
          if ((objc_msgSend(v22, "supportsAudioOnly") & 1) == 0)
          {

            v20 = 0;
          }
        }

LABEL_15:
        if (v20)
        {
          objc_msgSend(v10, "addObject:", v20);
          if (!-[TPFavoritesController prefetchCount](self, "prefetchCount")
            || (v23 = -[TPFavoritesController prefetchCount](self, "prefetchCount"), v23 >= objc_msgSend(v10, "count")))
          {
            -[TPFavoritesController contactCache](self, "contactCache");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPFavoritesController fetchContactForFavoritesEntry:](self, "fetchContactForFavoritesEntry:", v20);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPFavoritesController contactCacheKeyForFavoritesEntry:](self, "contactCacheKeyForFavoritesEntry:", v20);
            v26 = v14;
            v27 = v13;
            v28 = v10;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKey:", v25, v29);

            -[TPFavoritesController transportNameCache](self, "transportNameCache");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPFavoritesController fetchTransportNameForFavoritesEntry:](self, "fetchTransportNameForFavoritesEntry:", v16);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPFavoritesController transportNameCacheKeyForFavoritesEntry:](self, "transportNameCacheKeyForFavoritesEntry:", v16);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v31, v32);

            v10 = v28;
            v13 = v27;
            v14 = v26;
            v12 = v36;
            v33 = (id)objc_msgSend(v20, "name");
          }
        }

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v12);
  }

  v34 = (void *)objc_msgSend(v10, "copy");
  return v34;
}

- (unint64_t)prefetchCount
{
  return self->_prefetchCount;
}

- (TUCallProviderManager)callProviderManager
{
  NSObject *v3;

  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_callProviderManager;
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (NSCache)contactCache
{
  NSObject *v3;

  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_contactCache;
}

- (NSCache)transportNameCache
{
  NSObject *v3;

  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_transportNameCache;
}

- (id)fetchContactForFavoritesEntry:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TPFavoritesController fetchContactForFavoritesEntry:keyDescriptors:](self, "fetchContactForFavoritesEntry:keyDescriptors:", v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    TPDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[TPFavoritesController fetchContactForFavoritesEntry:].cold.1(v7);

    v6 = objc_alloc_init(MEMORY[0x1E0C97200]);
  }
  return v6;
}

- (id)fetchContactForFavoritesEntry:(id)a3 keyDescriptors:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactStore *contactStore;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  CNContactStore *v19;
  id v20;
  uint8_t buf[4];
  CNContactStore *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "contactProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v10 && (objc_msgSend(v10, "areKeysAvailable:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availableKeyDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v11, "addObject:", v12);
    contactStore = self->_contactStore;
    objc_msgSend(v10, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v14, v11, &v20);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v20;

    if (!v15)
    {
      TPDefaultLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_contactStore;
        *(_DWORD *)buf = 138412802;
        v22 = v19;
        v23 = 2112;
        v24 = v6;
        v25 = 2112;
        v26 = v16;
        _os_log_error_impl(&dword_1BCFA3000, v17, OS_LOG_TYPE_ERROR, "Could not retrieve a contact using contact store (%@), favorites entry (%@) error (%@)", buf, 0x20u);
      }

    }
    v10 = (void *)v15;
  }

  return v10;
}

- (id)fetchTransportNameForFavoritesEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "localizedBundleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactCacheKeyForFavoritesEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "hash");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)transportNameCacheKeyForFavoritesEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "hash");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CNFavorites)favoritesManager
{
  return self->_favoritesManager;
}

- (TPFavoritesController)initWithContactStore:(id)a3 prefetchCount:(unint64_t)a4
{
  id v7;
  TPFavoritesController *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialDispatchQueue;
  NSCache *v12;
  NSCache *contactCache;
  NSCache *v14;
  NSCache *transportNameCache;
  dispatch_block_t v16;
  dispatch_time_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;
  objc_super v27;

  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TPFavoritesController;
  v8 = -[TPFavoritesController init](&v27, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("TPFavoritesController.serialQueue", v9);
    serialDispatchQueue = v8->_serialDispatchQueue;
    v8->_serialDispatchQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v8->_contactStore, a3);
    objc_storeStrong((id *)&v8->_completionDispatchQueue, MEMORY[0x1E0C80D38]);
    v8->_prefetchCount = a4;
    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    contactCache = v8->_contactCache;
    v8->_contactCache = v12;

    v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    transportNameCache = v8->_transportNameCache;
    v8->_transportNameCache = v14;

    objc_initWeak(&location, v8);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __60__TPFavoritesController_initWithContactStore_prefetchCount___block_invoke;
    v24 = &unk_1E75FD2F0;
    objc_copyWeak(&v25, &location);
    v16 = dispatch_block_create((dispatch_block_flags_t)0, &v21);
    -[TPFavoritesController setDelayedFetchBlock:](v8, "setDelayedFetchBlock:", v16, v21, v22, v23, v24);

    v17 = dispatch_time(0, 1000000000);
    v18 = v8->_serialDispatchQueue;
    -[TPFavoritesController delayedFetchBlock](v8, "delayedFetchBlock");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_after(v17, v18, v19);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __56__TPFavoritesController_transportNameForFavoritesEntry___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "transportNameCacheKeyForFavoritesEntry:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transportNameCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v10);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchTransportNameForFavoritesEntry:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "transportNameCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);

    }
  }

}

void __50__TPFavoritesController_contactForFavoritesEntry___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "contactCacheKeyForFavoritesEntry:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v10);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchContactForFavoritesEntry:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "contactCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);

  }
}

void __45__TPFavoritesController_setFavoritesEntries___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("TPFavoritesControllerFavoritesEntriesDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __41__TPFavoritesController_favoritesEntries__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __37__TPFavoritesController_contactStore__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void __36__TPFavoritesController_canAddEntry__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isFull") ^ 1;

}

- (id)transportNameForFavoritesEntry:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__TPFavoritesController_transportNameForFavoritesEntry___block_invoke;
  block[3] = &unk_1E75FD3B8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setFavoritesEntries:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *favoritesEntries;
  NSObject *v8;
  _QWORD block[5];

  v4 = (NSArray *)a3;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_favoritesEntries != v4)
  {
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    favoritesEntries = self->_favoritesEntries;
    self->_favoritesEntries = v6;

    -[TPFavoritesController completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__TPFavoritesController_setFavoritesEntries___block_invoke;
    block[3] = &unk_1E75FD2A8;
    block[4] = self;
    dispatch_async(v8, block);

  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  NSObject *v4;
  id v5;

  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[TPFavoritesController needsProvidersUpdates](self, "needsProvidersUpdates"))
  {
    -[TPFavoritesController setNeedsProvidersUpdates:](self, "setNeedsProvidersUpdates:", 0);
    -[TPFavoritesController fetchFavoritesEntries](self, "fetchFavoritesEntries");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[TPFavoritesController setFavoritesEntries:](self, "setFavoritesEntries:", v5);

  }
}

- (NSArray)favoritesEntries
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__TPFavoritesController_favoritesEntries__block_invoke;
  v6[3] = &unk_1E75FD318;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (CNContactStore)contactStore
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__TPFavoritesController_contactStore__block_invoke;
  v6[3] = &unk_1E75FD318;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CNContactStore *)v4;
}

- (id)contactForFavoritesEntry:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__TPFavoritesController_contactForFavoritesEntry___block_invoke;
  block[3] = &unk_1E75FD3B8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (BOOL)canAddEntry
{
  TPFavoritesController *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__TPFavoritesController_canAddEntry__block_invoke;
  v5[3] = &unk_1E75FD318;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (TPFavoritesController)init
{
  -[TPFavoritesController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)performInitialFetchIfNeeded
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCFA3000, log, OS_LOG_TYPE_ERROR, "The application is not authorized to access contact data.", v1, 2u);
}

- (void)fetchIfNeeded
{
  void *v3;
  void *v4;
  NSObject *serialDispatchQueue;
  _QWORD v6[4];
  id v7;
  id location;

  -[TPFavoritesController delayedFetchBlock](self, "delayedFetchBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPFavoritesController delayedFetchBlock](self, "delayedFetchBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v4);

  }
  objc_initWeak(&location, self);
  serialDispatchQueue = self->_serialDispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__TPFavoritesController_fetchIfNeeded__block_invoke;
  v6[3] = &unk_1E75FD2F0;
  objc_copyWeak(&v7, &location);
  dispatch_async(serialDispatchQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__TPFavoritesController_fetchIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setDelayedFetchBlock:", 0);
    objc_msgSend(v2, "performInitialFetchIfNeeded");
    WeakRetained = v2;
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
  v4.super_class = (Class)TPFavoritesController;
  -[TPFavoritesController dealloc](&v4, sel_dealloc);
}

- (void)addEntry:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__TPFavoritesController_addEntry___block_invoke;
  v7[3] = &unk_1E75FD340;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __34__TPFavoritesController_addEntry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeEntryAtIndex:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFull");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntry:", *(_QWORD *)(a1 + 40));

    goto LABEL_7;
  }
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "save");

    objc_msgSend(*(id *)(a1 + 32), "fetchFavoritesEntries");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFavoritesEntries:", v10);

  }
}

- (void)moveEntryAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  NSObject *v7;
  _QWORD block[7];

  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__TPFavoritesController_moveEntryAtIndex_toIndex___block_invoke;
  block[3] = &unk_1E75FD368;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(v7, block);

}

void __50__TPFavoritesController_moveEntryAtIndex_toIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "absoluteIndexForIndex:", *(_QWORD *)(a1 + 40));
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (*(_QWORD *)(a1 + 48))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "absoluteIndexForIndex:");
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
        return;
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "moveEntryAtIndex:toIndex:", v3, v4);

    objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "save");

    objc_msgSend(*(id *)(a1 + 32), "fetchFavoritesEntries");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFavoritesEntries:", v7);

  }
}

- (void)removeEntriesAtIndexes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TPFavoritesController *v9;

  v4 = a3;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__TPFavoritesController_removeEntriesAtIndexes___block_invoke;
  v7[3] = &unk_1E75FD340;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__TPFavoritesController_removeEntriesAtIndexes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__TPFavoritesController_removeEntriesAtIndexes___block_invoke_2;
  v5[3] = &unk_1E75FD390;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateIndexesUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "favoritesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "save");

  objc_msgSend(*(id *)(a1 + 40), "fetchFavoritesEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setFavoritesEntries:", v4);

}

void __48__TPFavoritesController_removeEntriesAtIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "favoritesManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeEntryAtIndex:", a2);

}

- (id)contactForFavoritesEntry:(id)a3 keyDescriptors:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__TPFavoritesController_contactForFavoritesEntry_keyDescriptors___block_invoke;
  v13[3] = &unk_1E75FD3E0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __65__TPFavoritesController_contactForFavoritesEntry_keyDescriptors___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "fetchContactForFavoritesEntry:keyDescriptors:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)absoluteIndexForIndex:(unint64_t)a3
{
  NSObject *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = self->_favoritesEntries;
  if (-[NSArray count](v6, "count") <= a3)
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[NSArray objectAtIndex:](v6, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[TPFavoritesController favoritesManager](self, "favoritesManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "entries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", v7);

    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  return v10;
}

- (void)handleContactsFavoritesDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[TPFavoritesController serialDispatchQueue](self, "serialDispatchQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__TPFavoritesController_handleContactsFavoritesDidChangeNotification___block_invoke;
  block[3] = &unk_1E75FD2A8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __70__TPFavoritesController_handleContactsFavoritesDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fetchFavoritesEntries");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFavoritesEntries:", v2);

}

- (id)delayedFetchBlock
{
  return self->_delayedFetchBlock;
}

- (void)setDelayedFetchBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)needsProvidersUpdates
{
  return self->_needsProvidersUpdates;
}

- (void)setNeedsProvidersUpdates:(BOOL)a3
{
  self->_needsProvidersUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayedFetchBlock, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_transportNameCache, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_storeStrong((id *)&self->_favoritesEntries, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
}

- (void)fetchContactForFavoritesEntry:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_1BCFA3000, log, OS_LOG_TYPE_ERROR, "Creating an empty contact for favorites entry %@.", (uint8_t *)&v1, 0xCu);
}

@end
