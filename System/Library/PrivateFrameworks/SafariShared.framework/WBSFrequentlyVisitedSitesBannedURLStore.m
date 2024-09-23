@implementation WBSFrequentlyVisitedSitesBannedURLStore

- (id)urlStrings
{
  NSObject *storeQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  storeQueue = self->_storeQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__WBSFrequentlyVisitedSitesBannedURLStore_urlStrings__block_invoke;
  v5[3] = &unk_1E4B2BDF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(storeQueue, v5);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (WBSFrequentlyVisitedSitesBannedURLStore)initWithStoreURL:(id)a3 history:(id)a4
{
  id v7;
  id v8;
  WBSFrequentlyVisitedSitesBannedURLStore *v9;
  WBSFrequentlyVisitedSitesBannedURLStore *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *storeQueue;
  void *v13;
  WBSFrequentlyVisitedSitesBannedURLStore *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSFrequentlyVisitedSitesBannedURLStore;
  v9 = -[WBSFrequentlyVisitedSitesBannedURLStore init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeURL, a3);
    v11 = dispatch_queue_create("com.apple.SafariShared.FrequentlyVisitedSitesBannedURLStore", 0);
    storeQueue = v10->_storeQueue;
    v10->_storeQueue = (OS_dispatch_queue *)v11;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel__historyWasCleared_, CFSTR("WBSHistoryWasClearedNotification"), v8);
      objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel__historyItemsWereRemoved_, CFSTR("WBSHistoryItemsWereRemovedNotification"), v8);

    }
    v14 = v10;
  }

  return v10;
}

void __53__WBSFrequentlyVisitedSitesBannedURLStore_urlStrings__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_bannedURLStringsToEntriesMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_bannedURLStringsToEntriesMap
{
  NSMutableDictionary *bannedURLStringsToEntriesMap;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSMutableDictionary *v19;
  void *v20;
  NSObject *v21;
  NSMutableDictionary *v22;
  NSObject *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  bannedURLStringsToEntriesMap = self->_bannedURLStringsToEntriesMap;
  if (bannedURLStringsToEntriesMap)
    return bannedURLStringsToEntriesMap;
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = self->_bannedURLStringsToEntriesMap;
  self->_bannedURLStringsToEntriesMap = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", self->_storeURL);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BannedURLStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BannedURLStrings"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v26;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_24;
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("URLString"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_23;
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DateAdded"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_23:
LABEL_24:
              v23 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
                -[WBSFrequentlyVisitedSitesBannedURLStore _bannedURLStringsToEntriesMap].cold.1(v23);
              v22 = self->_bannedURLStringsToEntriesMap;

              goto LABEL_20;
            }
            objc_msgSend(v14, "allKeys");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count") == 2;

            if (!v18)
              goto LABEL_24;
            v19 = self->_bannedURLStringsToEntriesMap;
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("URLString"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v14, v20);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
    else
    {
      v21 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[WBSFrequentlyVisitedSitesBannedURLStore _bannedURLStringsToEntriesMap].cold.2(v21);
    }
  }
  v22 = self->_bannedURLStringsToEntriesMap;
LABEL_20:

  return v22;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSFrequentlyVisitedSitesBannedURLStore;
  -[WBSFrequentlyVisitedSitesBannedURLStore dealloc](&v4, sel_dealloc);
}

- (BOOL)containsURLString:(id)a3
{
  id v4;
  void *v5;
  NSObject *storeQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  objc_msgSend(v4, "safari_canonicalURLStringForFrequentlyVisitedSites");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  storeQueue = self->_storeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSFrequentlyVisitedSitesBannedURLStore_containsURLString___block_invoke;
  block[3] = &unk_1E4B384C0;
  v10 = v5;
  v11 = &v12;
  block[4] = self;
  v7 = v5;
  dispatch_sync(storeQueue, block);
  LOBYTE(storeQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)storeQueue;
}

void __61__WBSFrequentlyVisitedSitesBannedURLStore_containsURLString___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_bannedURLStringsToEntriesMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != 0;

}

- (void)addURLString:(id)a3
{
  id v4;
  void *v5;
  NSObject *storeQueue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  WBSFrequentlyVisitedSitesBannedURLStore *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "safari_canonicalURLStringForFrequentlyVisitedSites");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  storeQueue = self->_storeQueue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __56__WBSFrequentlyVisitedSitesBannedURLStore_addURLString___block_invoke;
  v11 = &unk_1E4B2B448;
  v12 = self;
  v13 = v5;
  v7 = v5;
  dispatch_async(storeQueue, &v8);
  -[WBSFrequentlyVisitedSitesBannedURLStore _writeOutBannedURLStringsAsynchronously](self, "_writeOutBannedURLStringsAsynchronously", v8, v9, v10, v11, v12);

}

void __56__WBSFrequentlyVisitedSitesBannedURLStore_addURLString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = CFSTR("URLString");
  v6[1] = CFSTR("DateAdded");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_bannedURLStringsToEntriesMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

}

- (void)removeURLStrings:(id)a3
{
  id v4;
  NSObject *storeQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  WBSFrequentlyVisitedSitesBannedURLStore *v11;
  id v12;

  v4 = a3;
  storeQueue = self->_storeQueue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __60__WBSFrequentlyVisitedSitesBannedURLStore_removeURLStrings___block_invoke;
  v10 = &unk_1E4B2B448;
  v11 = self;
  v12 = v4;
  v6 = v4;
  dispatch_async(storeQueue, &v7);
  -[WBSFrequentlyVisitedSitesBannedURLStore _writeOutBannedURLStringsAsynchronously](self, "_writeOutBannedURLStringsAsynchronously", v7, v8, v9, v10, v11);

}

void __60__WBSFrequentlyVisitedSitesBannedURLStore_removeURLStrings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_bannedURLStringsToEntriesMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "safari_canonicalURLStringForFrequentlyVisitedSites", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "removeObjectForKey:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)removeAllURLStrings
{
  NSObject *storeQueue;
  _QWORD block[5];

  storeQueue = self->_storeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSFrequentlyVisitedSitesBannedURLStore_removeAllURLStrings__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(storeQueue, block);
  -[WBSFrequentlyVisitedSitesBannedURLStore _writeOutBannedURLStringsAsynchronously](self, "_writeOutBannedURLStringsAsynchronously");
}

void __62__WBSFrequentlyVisitedSitesBannedURLStore_removeAllURLStrings__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_bannedURLStringsToEntriesMap");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)_historyItemsWereRemoved:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WBSHistoryItemsKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_52);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFrequentlyVisitedSitesBannedURLStore removeURLStrings:](self, "removeURLStrings:", v5);

}

id __68__WBSFrequentlyVisitedSitesBannedURLStore__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "urlString");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_writeOutBannedURLStringsAsynchronously
{
  uint64_t v3;
  NSObject *storeQueue;
  _QWORD v5[6];

  v3 = operator new();
  MEMORY[0x1A8599720](v3, CFSTR("com.apple.SafariShared.WBSFrequentlyVisitedSitesBannedURLStore"));
  storeQueue = self->_storeQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__WBSFrequentlyVisitedSitesBannedURLStore__writeOutBannedURLStringsAsynchronously__block_invoke;
  v5[3] = &unk_1E4B2AA60;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(storeQueue, v5);
}

void __82__WBSFrequentlyVisitedSitesBannedURLStore__writeOutBannedURLStringsAsynchronously__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues", v2, CFSTR("BannedURLStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToURL:atomically:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1);

  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x1A85998AC]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannedURLStringsToEntriesMap, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
}

- (void)_bannedURLStringsToEntriesMap
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Frequently Visited Sites banned URL store is malformed.", v1, 2u);
}

@end
