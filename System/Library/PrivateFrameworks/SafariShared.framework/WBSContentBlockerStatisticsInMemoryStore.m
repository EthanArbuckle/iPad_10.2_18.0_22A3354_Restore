@implementation WBSContentBlockerStatisticsInMemoryStore

+ (NSArray)allStores
{
  void *v2;
  void *v3;

  allStores();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (int64_t)totalBlockedTrackerCount
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  id obj;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[WBSContentBlockerStatisticsInMemoryStore allStores](WBSContentBlockerStatisticsInMemoryStore, "allStores");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v14[0] = v8;
        v14[1] = 3221225472;
        v14[2] = __68__WBSContentBlockerStatisticsInMemoryStore_totalBlockedTrackerCount__block_invoke;
        v14[3] = &unk_1E4B29D40;
        v15 = v4;
        objc_msgSend(v10, "blockedThirdPartiesAfter:before:onFirstParty:completionHandler:", v2, v3, 0, v14);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v11 = objc_msgSend(v4, "count");
  return v11;
}

void __68__WBSContentBlockerStatisticsInMemoryStore_totalBlockedTrackerCount__block_invoke(uint64_t a1, void *a2)
{
  WBSContentBlockerStatisticsStoreMergeStatistics(*(void **)(a1 + 32), a2);
}

- (WBSContentBlockerStatisticsInMemoryStore)init
{
  WBSContentBlockerStatisticsInMemoryStore *v2;
  uint64_t v3;
  NSMutableDictionary *firstPartiesByBlockedThirdParty;
  void *v5;
  WBSContentBlockerStatisticsInMemoryStore *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSContentBlockerStatisticsInMemoryStore;
  v2 = -[WBSContentBlockerStatisticsInMemoryStore init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    firstPartiesByBlockedThirdParty = v2->_firstPartiesByBlockedThirdParty;
    v2->_firstPartiesByBlockedThirdParty = (NSMutableDictionary *)v3;

    allStores();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v2);

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  allStores();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", WBSContentBlockerStatisticsInMemoryStoreDidCloseNotification, 0);

  v5.receiver = self;
  v5.super_class = (Class)WBSContentBlockerStatisticsInMemoryStore;
  -[WBSContentBlockerStatisticsInMemoryStore dealloc](&v5, sel_dealloc);
}

- (void)recordThirdPartyResourceBlocked:(id)a3 onFirstParty:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  WBSContentBlockerStatisticsFirstParty *v18;
  void (**v19)(id, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *, uint64_t, _BYTE *);
  void *v23;
  id v24;

  v19 = (void (**)(id, uint64_t))a5;
  v8 = a4;
  objc_msgSend(a3, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_highLevelDomainFromHost");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "safari_highLevelDomainFromHost");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_firstPartiesByBlockedThirdParty, "objectForKeyedSubscript:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __107__WBSContentBlockerStatisticsInMemoryStore_recordThirdPartyResourceBlocked_onFirstParty_completionHandler___block_invoke;
      v23 = &unk_1E4B37E90;
      v24 = v12;
      objc_msgSend(v14, "safari_removeObjectsPassingTest:", &v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_firstPartiesByBlockedThirdParty, "setObject:forKeyedSubscript:", v14, v10);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v19, v20, v21, v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v16;

    v18 = -[WBSContentBlockerStatisticsFirstParty initWithDomain:lastSeen:]([WBSContentBlockerStatisticsFirstParty alloc], "initWithDomain:lastSeen:", v12, v17);
    objc_msgSend(v14, "addObject:", v18);

    if (v19)
      v19[2](v19, 1);

  }
  else if (v19)
  {
    v19[2](v19, 0);
  }

}

uint64_t __107__WBSContentBlockerStatisticsInMemoryStore_recordThirdPartyResourceBlocked_onFirstParty_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 onFirstParty:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSMutableDictionary *firstPartiesByBlockedThirdParty;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;

  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  v12 = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  v14 = v13;
  objc_msgSend(v12, "timeIntervalSince1970");
  v16 = v15;

  v17 = objc_msgSend(v10, "length") != 0;
  firstPartiesByBlockedThirdParty = self->_firstPartiesByBlockedThirdParty;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __107__WBSContentBlockerStatisticsInMemoryStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke;
  v21[3] = &unk_1E4B37EE0;
  v25 = v17;
  v22 = v10;
  v23 = v14;
  v24 = v16;
  v20 = v10;
  -[NSMutableDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:](firstPartiesByBlockedThirdParty, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v19);

}

id __107__WBSContentBlockerStatisticsInMemoryStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  BOOL (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  __int128 v13;
  char v14;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __107__WBSContentBlockerStatisticsInMemoryStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke_2;
  v11 = &unk_1E4B37EB8;
  v14 = *(_BYTE *)(a1 + 56);
  v12 = *(id *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 40);
  objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count", v8, v9, v10, v11))
    v6 = (void *)objc_msgSend(v5, "copy");
  else
    v6 = 0;

  return v6;
}

BOOL __107__WBSContentBlockerStatisticsInMemoryStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  _BOOL8 v8;

  v3 = a2;
  v4 = v3;
  v8 = (!*(_BYTE *)(a1 + 56)
     || (objc_msgSend(v3, "domain"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)),
         v5,
         v6))
    && (objc_msgSend(v4, "lastSeen"), v7 >= *(double *)(a1 + 40))
    && v7 <= *(double *)(a1 + 48);

  return v8;
}

- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 completionHandler:(id)a5
{
  -[WBSContentBlockerStatisticsInMemoryStore blockedThirdPartiesAfter:before:onFirstParty:completionHandler:](self, "blockedThirdPartiesAfter:before:onFirstParty:completionHandler:", a3, a4, 0, a5);
}

- (void)clearAllStatisticsWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary removeAllObjects](self->_firstPartiesByBlockedThirdParty, "removeAllObjects");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)clearStatisticsAfter:(id)a3 before:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];

  v6 = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSince1970");
  v10 = v9;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsAfter_before___block_invoke;
  v11[3] = &__block_descriptor_48_e47_B16__0__WBSContentBlockerStatisticsFirstParty_8l;
  v11[4] = v8;
  v11[5] = v10;
  -[WBSContentBlockerStatisticsInMemoryStore _clearStatisticsPassingTest:](self, "_clearStatisticsPassingTest:", v11);
}

BOOL __72__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsAfter_before___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "lastSeen");
  return v3 >= *(double *)(a1 + 32) && v3 <= *(double *)(a1 + 40);
}

- (void)clearStatisticsForDomains:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke_14;
  v8[3] = &unk_1E4B37F68;
  v9 = v6;
  v7 = v6;
  -[WBSContentBlockerStatisticsInMemoryStore _clearStatisticsPassingTest:](self, "_clearStatisticsPassingTest:", v8);

}

uint64_t __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = a2;
  objc_msgSend(v2, "safari_highLevelDomainFromHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if ((v4 & 1) == 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke_cold_1((uint64_t)v2, v5);
  }

  return v4;
}

uint64_t __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)_clearStatisticsPassingTest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_firstPartiesByBlockedThirdParty, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __72__WBSContentBlockerStatisticsInMemoryStore__clearStatisticsPassingTest___block_invoke;
        v12[3] = &unk_1E4B37F90;
        v13 = v4;
        objc_msgSend(v11, "safari_removeObjectsPassingTest:", v12);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[WBSContentBlockerStatisticsInMemoryStore _clearUnusedDomains](self, "_clearUnusedDomains");
}

uint64_t __72__WBSContentBlockerStatisticsInMemoryStore__clearStatisticsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_clearUnusedDomains
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_firstPartiesByBlockedThirdParty;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_firstPartiesByBlockedThirdParty, "objectForKeyedSubscript:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (!v10)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_firstPartiesByBlockedThirdParty, "setObject:forKeyedSubscript:", 0, v8);
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPartiesByBlockedThirdParty, 0);
}

void __70__WBSContentBlockerStatisticsInMemoryStore_clearStatisticsForDomains___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Could not remove content blocker statistics for non high-level domain %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
