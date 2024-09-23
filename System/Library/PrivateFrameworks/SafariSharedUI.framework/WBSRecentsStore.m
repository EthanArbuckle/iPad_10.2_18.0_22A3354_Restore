@implementation WBSRecentsStore

- (WBSRecentsStore)initWithSiteMetadataManager:(id)a3
{
  id v4;
  WBSRecentsStore *v5;
  uint64_t v6;
  NSMutableArray *providers;
  uint64_t v8;
  NSMutableArray *recentItemsByProviderIndex;
  uint64_t v10;
  NSMapTable *recentItemsToMetadataTokens;
  WBSRecentsStore *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSRecentsStore;
  v5 = -[WBSRecentsStore init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    providers = v5->_providers;
    v5->_providers = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    recentItemsByProviderIndex = v5->_recentItemsByProviderIndex;
    v5->_recentItemsByProviderIndex = (NSMutableArray *)v8;

    objc_storeWeak((id *)&v5->_siteMetadataManager, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    recentItemsToMetadataTokens = v5->_recentItemsToMetadataTokens;
    v5->_recentItemsToMetadataTokens = (NSMapTable *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_siteMetadataManager);
  -[NSMapTable objectEnumerator](self->_recentItemsToMetadataTokens, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cancelRequestsWithTokens:", v5);

  v6.receiver = self;
  v6.super_class = (Class)WBSRecentsStore;
  -[WBSRecentsStore dealloc](&v6, sel_dealloc);
}

- (void)registerProvider:(id)a3
{
  NSMutableArray *providers;
  NSMutableArray *recentItemsByProviderIndex;
  void *v6;
  id v7;

  providers = self->_providers;
  v7 = a3;
  -[NSMutableArray addObject:](providers, "addObject:", v7);
  recentItemsByProviderIndex = self->_recentItemsByProviderIndex;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](recentItemsByProviderIndex, "addObject:", v6);

  objc_msgSend(v7, "setRecentsStore:", self);
  -[WBSRecentsStore ingestRecentItemsFromProvider:](self, "ingestRecentItemsFromProvider:", v7);

}

- (void)ingestRecentItemsFromProvider:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  WBSRecentsStore *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_providers, "indexOfObject:", v4);
  v24 = v4;
  objc_msgSend(v4, "recentItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  v23 = self;
  -[NSMutableArray objectAtIndexedSubscript:](self->_recentItemsByProviderIndex, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v7, "member:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (void *)v15;
        else
          v17 = v14;
        v18 = v17;
        objc_msgSend(v14, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setDevice:", v19);

        objc_msgSend(v14, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setDate:", v20);

        objc_msgSend(v8, "addObject:", v18);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v21 = (void *)objc_msgSend(v8, "copy");
  -[NSMutableArray setObject:atIndexedSubscript:](v23->_recentItemsByProviderIndex, "setObject:atIndexedSubscript:", v21, v22);

  -[WBSRecentsStore _rebuildAllRecentItemsAndDevices](v23, "_rebuildAllRecentItemsAndDevices");
  -[WBSRecentsStore fetchMetadata](v23, "fetchMetadata");

}

- (void)_notifyRecentItemsDidReceiveMetadata
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WBSRecentsStoreDidUpdateRecentItemsWithMetadata"), self);

}

- (id)providerForItem:(id)a3
{
  id v4;
  NSMutableArray *recentItemsByProviderIndex;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  WBSRecentsStore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__31;
  v17 = __Block_byref_object_dispose__31;
  v18 = 0;
  recentItemsByProviderIndex = self->_recentItemsByProviderIndex;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__WBSRecentsStore_providerForItem___block_invoke;
  v9[3] = &unk_1E5449170;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](recentItemsByProviderIndex, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __35__WBSRecentsStore_providerForItem___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(a2, "containsObject:", a1[4]))
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1[5] + 8), "objectAtIndexedSubscript:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (void)fetchMetadata
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D8A268]);

  if (v4)
    -[WBSRecentsStore _fetchPendingMetadataAndNotifyRecentItemChanges](self, "_fetchPendingMetadataAndNotifyRecentItemChanges");
}

- (void)_rebuildAllRecentItemsAndDevices
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *displayableRecentItems;
  void *v21;
  uint64_t v22;
  NSArray *availableDevices;
  void *v24;
  WBSRecentsStore *v25;
  NSMutableArray *obj;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v25 = self;
  obj = self->_recentItemsByProviderIndex;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v5, "allObjects");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObjectsFromArray:", v6);

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v31 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v12, "device");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v13);

              objc_msgSend(v12, "metadata");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v14)
              {
                v15 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
                objc_msgSend(v12, "URL");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setOriginalURL:", v16);

                objc_msgSend(v12, "URL");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setURL:", v17);

                objc_msgSend(v12, "title");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setTitle:", v18);

                objc_msgSend(v12, "setMetadata:", v15);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v9);
        }

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v29);
  }

  objc_msgSend(v28, "sortUsingComparator:", &__block_literal_global_69);
  v19 = objc_msgSend(v28, "copy");
  displayableRecentItems = v25->_displayableRecentItems;
  v25->_displayableRecentItems = (NSArray *)v19;

  objc_msgSend(v3, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global_14_2);
  v22 = objc_claimAutoreleasedReturnValue();
  availableDevices = v25->_availableDevices;
  v25->_availableDevices = (NSArray *)v22;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postNotificationName:object:", CFSTR("WBSRecentsStoreDidRebuildRecentItems"), v25);

}

uint64_t __51__WBSRecentsStore__rebuildAllRecentItemsAndDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __51__WBSRecentsStore__rebuildAllRecentItemsAndDevices__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_fetchPendingMetadataAndNotifyRecentItemChanges
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id WeakRetained;
  WBSLPLinkMetadataRequest *v10;
  void *v11;
  WBSLPLinkMetadataRequest *v12;
  void *v13;
  NSArray *obj;
  _QWORD v15[5];
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_displayableRecentItems;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v3)
  {

LABEL_16:
    -[WBSRecentsStore _notifyRecentItemsDidReceiveMetadata](self, "_notifyRecentItemsDidReceiveMetadata");
    return;
  }
  v4 = 0;
  v5 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v19 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (!objc_msgSend(v7, "metadataState"))
      {
        objc_msgSend(v7, "setMetadataState:", 1);
        objc_initWeak(&location, self);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __66__WBSRecentsStore__fetchPendingMetadataAndNotifyRecentItemChanges__block_invoke;
        v15[3] = &unk_1E5449218;
        objc_copyWeak(&v16, &location);
        v15[4] = v7;
        v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D45E4](v15);
        WeakRetained = objc_loadWeakRetained((id *)&self->_siteMetadataManager);
        if (WeakRetained)
        {
          v10 = [WBSLPLinkMetadataRequest alloc];
          objc_msgSend(v7, "URL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[WBSLPLinkMetadataRequest initWithURL:](v10, "initWithURL:", v11);

          objc_msgSend(WeakRetained, "registerOneTimeRequest:priority:responseHandler:", v12, 2, v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](self->_recentItemsToMetadataTokens, "setObject:forKey:", v13, v7);

        }
        else
        {
          v8[2](v8, 0);
        }

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
        v4 = 1;
      }
    }
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v3);

  if ((v4 & 1) == 0)
    goto LABEL_16;
}

void __66__WBSRecentsStore__fetchPendingMetadataAndNotifyRecentItemChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WBSRecentsStore__fetchPendingMetadataAndNotifyRecentItemChanges__block_invoke_2;
  block[3] = &unk_1E5441970;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
}

void __66__WBSRecentsStore__fetchPendingMetadataAndNotifyRecentItemChanges__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  id *v5;
  id *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    +[WBSLPLinkMetadataProvider unpackMetadataFromResponse:](WBSLPLinkMetadataProvider, "unpackMetadataFromResponse:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = 3;
    else
      v4 = 2;
    objc_msgSend(*(id *)(a1 + 32), "setMetadataState:", v4);
    objc_msgSend(v7, "providerForItem:", *(_QWORD *)(a1 + 32));
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = v5;
      else
        v6 = v7;
      objc_msgSend(v6, "updateRecentItem:withLinkMetadata:", *(_QWORD *)(a1 + 32), v3);
    }
    objc_msgSend(v7, "_notifyRecentItemsDidReceiveMetadata");

    WeakRetained = v7;
  }

}

- (void)updateRecentItem:(id)a3 withLinkMetadata:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v12, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v12, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
  }
  else
  {
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
  }
  objc_msgSend(v9, "setTitle:", v8);

  objc_msgSend(v12, "imageProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v5, "imageProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageProvider:", v11);

  }
  objc_msgSend(v12, "setMetadata:", v5);

}

- (NSArray)displayableRecentItems
{
  return self->_displayableRecentItems;
}

- (NSArray)availableDevices
{
  return self->_availableDevices;
}

- (WBSSiteMetadataManager)siteMetadataManager
{
  return (WBSSiteMetadataManager *)objc_loadWeakRetained((id *)&self->_siteMetadataManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_siteMetadataManager);
  objc_storeStrong((id *)&self->_availableDevices, 0);
  objc_storeStrong((id *)&self->_displayableRecentItems, 0);
  objc_storeStrong((id *)&self->_recentItemsToMetadataTokens, 0);
  objc_storeStrong((id *)&self->_recentItemsByProviderIndex, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
