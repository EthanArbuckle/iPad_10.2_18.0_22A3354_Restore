@implementation WBSHistoryTopicTag

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryTopicTag.Synchronization", 0);
    v3 = (void *)historyTopicSynchronizationQueue;
    historyTopicSynchronizationQueue = (uint64_t)v2;

  }
}

- (WBSHistoryTopicTag)initWithTag:(id)a3 historyItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  WBSHistoryTopicTag *v14;
  WBSHistoryTopicTag *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "databaseID");
  objc_msgSend(v7, "modificationTimestamp");
  v12 = v11;
  v13 = objc_msgSend(v7, "level");

  v14 = -[WBSHistoryTopicTag initWithTitle:identifier:databaseID:modificationTimestamp:level:](self, "initWithTitle:identifier:databaseID:modificationTimestamp:level:", v8, v9, v10, v13, v12);
  if (v14)
  {
    -[NSMutableOrderedSet addObjectsFromArray:](v14->_taggedItems, "addObjectsFromArray:", v6);
    v15 = v14;
  }

  return v14;
}

- (WBSHistoryTopicTag)initWithTitle:(id)a3 identifier:(id)a4 databaseID:(int64_t)a5 modificationTimestamp:(double)a6 level:(int64_t)a7
{
  WBSHistoryTopicTag *v7;
  uint64_t v8;
  NSMutableOrderedSet *taggedItems;
  void *v10;
  WBSHistoryTopicTag *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSHistoryTopicTag;
  v7 = -[WBSHistoryTag initWithTitle:identifier:databaseID:modificationTimestamp:level:](&v13, sel_initWithTitle_identifier_databaseID_modificationTimestamp_level_, a3, a4, a5, a7, a6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v8 = objc_claimAutoreleasedReturnValue();
    taggedItems = v7->_taggedItems;
    v7->_taggedItems = (NSMutableOrderedSet *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__historyItemsWereRemoved_, CFSTR("WBSHistoryItemsWereRemovedNotification"), 0);

    v11 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSHistoryTopicTag;
  -[WBSHistoryTopicTag dealloc](&v4, sel_dealloc);
}

- (void)tagHistoryItem:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = historyTopicSynchronizationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__WBSHistoryTopicTag_tagHistoryItem___block_invoke;
  v7[3] = &unk_1E4B2A118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __37__WBSHistoryTopicTag_tagHistoryItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "safari_insertObject:inSortedOrderUsingComparator:", *(_QWORD *)(a1 + 40), &__block_literal_global_67);
}

uint64_t __37__WBSHistoryTopicTag_tagHistoryItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "lastVisitedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastVisitedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSArray)historyItems
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__26;
  v9 = __Block_byref_object_dispose__26;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__WBSHistoryTopicTag_historyItems__block_invoke;
  v4[3] = &unk_1E4B2A8C0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)historyTopicSynchronizationQueue, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __34__WBSHistoryTopicTag_historyItems__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)groupHistoryItemsBySessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = historyTopicSynchronizationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "lastVisitedDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safari_startOfDay");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v10);
        }
        objc_msgSend(v11, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E4B3C800;
  v15 = v12;
  v13 = v12;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v14);
  objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_15_0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  WBSHistorySessionWithItems *v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_11_2);
  v7 = *(void **)(a1 + 32);
  v8 = -[WBSHistorySessionWithItems initWithSessionStartDate:items:]([WBSHistorySessionWithItems alloc], "initWithSessionStartDate:items:", v6, v5);

  objc_msgSend(v7, "addObject:", v8);
}

uint64_t __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "lastVisitedTimeInterval");
  v6 = v5;
  objc_msgSend(v4, "lastVisitedTimeInterval");
  v8 = v7;

  if (v6 < v8)
    return 1;
  else
    return -1;
}

uint64_t __70__WBSHistoryTopicTag_groupHistoryItemsBySessionWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "compare:", v6) == 1)
    v7 = -1;
  else
    v7 = 1;

  return v7;
}

- (BOOL)containsHistoryItem:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = historyTopicSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__WBSHistoryTopicTag_containsHistoryItem___block_invoke;
  block[3] = &unk_1E4B3C868;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

uint64_t __42__WBSHistoryTopicTag_containsHistoryItem___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 48), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)removeHistoryItems:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = historyTopicSynchronizationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__WBSHistoryTopicTag_removeHistoryItems___block_invoke;
    v6[3] = &unk_1E4B2A118;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __41__WBSHistoryTopicTag_removeHistoryItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
}

- (void)_historyItemsWereRemoved:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_arrayForKey:", CFSTR("WBSHistoryItemsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryTopicTag removeHistoryItems:](self, "removeHistoryItems:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taggedItems, 0);
}

@end
