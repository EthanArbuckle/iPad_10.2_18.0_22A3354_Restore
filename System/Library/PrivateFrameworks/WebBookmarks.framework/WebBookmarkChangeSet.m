@implementation WebBookmarkChangeSet

void __63__WebBookmarkChangeSet_numberOfAddedBookmarksInBookmarkFolder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");

}

- (int64_t)replayChangesOnBookmark:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WebBookmarkChangeSet_replayChangesOnBookmark___block_invoke;
  block[3] = &unk_24CB32250;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)applyModificationsToBookmarks:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  WebBookmarkChangeSet *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WebBookmarkChangeSet_applyModificationsToBookmarks___block_invoke;
  block[3] = &unk_24CB31830;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_sync(queue, block);

}

- (unint64_t)numberOfReorderedBookmarksInBookmarkFolder:(int)a3
{
  NSObject *queue;
  unint64_t v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__WebBookmarkChangeSet_numberOfReorderedBookmarksInBookmarkFolder___block_invoke;
  block[3] = &unk_24CB322F0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, block);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)folderHasReplaceChange:(int)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WebBookmarkChangeSet_folderHasReplaceChange___block_invoke;
  block[3] = &unk_24CB322F0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)addedBookmarksInBookmarkFolder:(int)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WebBookmarkChangeSet_addedBookmarksInBookmarkFolder___block_invoke;
  block[3] = &unk_24CB322A0;
  block[4] = self;
  v13 = a3;
  v7 = v5;
  v12 = v7;
  dispatch_sync(queue, block);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)modifiedBookmarksInBookmarkFolder:(int)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WebBookmarkChangeSet_modifiedBookmarksInBookmarkFolder___block_invoke;
  block[3] = &unk_24CB322A0;
  block[4] = self;
  v13 = a3;
  v7 = v5;
  v12 = v7;
  dispatch_sync(queue, block);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)deletedBookmarkIDsInBookmarkFolder:(int)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  int v13;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__WebBookmarkChangeSet_deletedBookmarkIDsInBookmarkFolder___block_invoke;
  block[3] = &unk_24CB322A0;
  block[4] = self;
  v13 = a3;
  v7 = v5;
  v12 = v7;
  dispatch_sync(queue, block);
  v8 = v12;
  v9 = v7;

  return v9;
}

void __58__WebBookmarkChangeSet_modifiedBookmarksInBookmarkFolder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "bookmark", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v11, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_msgSend(v2, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
          objc_msgSend(v2, "addObject:", v12);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (BOOL)bookmarkIsAddedInMemory:(int)a3
{
  return a3 < -99;
}

- (unint64_t)numberOfAddedBookmarksInBookmarkFolder:(int)a3
{
  NSObject *queue;
  unint64_t v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WebBookmarkChangeSet_numberOfAddedBookmarksInBookmarkFolder___block_invoke;
  block[3] = &unk_24CB322F0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(queue, block);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (NSArray)changes
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__WebBookmarkChangeSet_changes__block_invoke;
  v5[3] = &unk_24CB31610;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (WebBookmarkChangeSet)initWithFileURL:(id)a3 readPersistedChanges:(BOOL)a4
{
  id v7;
  WebBookmarkChangeSet *v8;
  WebBookmarkChangeSet *v9;
  id v10;
  const char *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  NSMutableOrderedSet *changes;
  uint64_t v16;
  NSMutableDictionary *bookmarkIDToChanges;
  uint64_t v18;
  NSMutableDictionary *associatedIDToChanges;
  uint64_t v20;
  NSMutableDictionary *folderIDToChildrenChanges;
  uint64_t v22;
  NSMutableDictionary *folderIDToDeletedChildrenChanges;
  uint64_t v24;
  NSMutableDictionary *folderIDToAddedChildrenChanges;
  uint64_t v26;
  NSMutableDictionary *folderIDToModifiedChildrenChanges;
  uint64_t v28;
  NSMutableDictionary *folderIDToReorderedChildrenChanges;
  NSObject *v30;
  WebBookmarkChangeSet *v31;
  WebBookmarkChangeSet *v32;
  _QWORD block[4];
  WebBookmarkChangeSet *v35;
  BOOL v36;
  objc_super v37;

  v7 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WebBookmarkChangeSet;
  v8 = -[WebBookmarkChangeSet init](&v37, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileURL, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.WebBookmarks.WebBookmarkChangeSet.%p"), v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    v12 = dispatch_queue_create(v11, MEMORY[0x24BDAC9C0]);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    v9->_lastBookmarkIDForAddingInMemoryBookmark = -99;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v14 = objc_claimAutoreleasedReturnValue();
    changes = v9->_changes;
    v9->_changes = (NSMutableOrderedSet *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    bookmarkIDToChanges = v9->_bookmarkIDToChanges;
    v9->_bookmarkIDToChanges = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    associatedIDToChanges = v9->_associatedIDToChanges;
    v9->_associatedIDToChanges = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    folderIDToChildrenChanges = v9->_folderIDToChildrenChanges;
    v9->_folderIDToChildrenChanges = (NSMutableDictionary *)v20;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    folderIDToDeletedChildrenChanges = v9->_folderIDToDeletedChildrenChanges;
    v9->_folderIDToDeletedChildrenChanges = (NSMutableDictionary *)v22;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    folderIDToAddedChildrenChanges = v9->_folderIDToAddedChildrenChanges;
    v9->_folderIDToAddedChildrenChanges = (NSMutableDictionary *)v24;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    folderIDToModifiedChildrenChanges = v9->_folderIDToModifiedChildrenChanges;
    v9->_folderIDToModifiedChildrenChanges = (NSMutableDictionary *)v26;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    folderIDToReorderedChildrenChanges = v9->_folderIDToReorderedChildrenChanges;
    v9->_folderIDToReorderedChildrenChanges = (NSMutableDictionary *)v28;

    v30 = v9->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__WebBookmarkChangeSet_initWithFileURL_readPersistedChanges___block_invoke;
    block[3] = &unk_24CB321C0;
    v36 = a4;
    v31 = v9;
    v35 = v31;
    dispatch_barrier_sync(v30, block);
    v32 = v31;

  }
  return v9;
}

void __48__WebBookmarkChangeSet_replayChangesOnBookmark___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "changeType", (_QWORD)v13);
        v12 = 1;
        switch(v11)
        {
          case 0:
          case 1:
          case 6:
            goto LABEL_9;
          case 3:
            objc_msgSend(v10, "applyModificationsToBookmark:", *(_QWORD *)(a1 + 40));
            v12 = 2;
            goto LABEL_9;
          case 4:
            v12 = 3;
LABEL_9:
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
            break;
          default:
            continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __54__WebBookmarkChangeSet_applyModificationsToBookmarks___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "identifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
              if (objc_msgSend(v14, "changeType") == 3)
                objc_msgSend(v14, "applyModificationsToBookmark:", v6);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v11);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v3);
  }

}

uint64_t __61__WebBookmarkChangeSet_initWithFileURL_readPersistedChanges___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_readPersistedChanges");
  return result;
}

void __31__WebBookmarkChangeSet_changes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __59__WebBookmarkChangeSet_deletedBookmarkIDsInBookmarkFolder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "bookmarkID", (_QWORD)v12));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

void __67__WebBookmarkChangeSet_numberOfReorderedBookmarksInBookmarkFolder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");

}

- (void)_readPersistedChanges
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Persisted bookmark changes plist is corrupted", a5, a6, a7, a8, 0);
}

- (WebBookmarkChangeSet)initWithFileURL:(id)a3
{
  return -[WebBookmarkChangeSet initWithFileURL:readPersistedChanges:](self, "initWithFileURL:readPersistedChanges:", a3, 1);
}

void __47__WebBookmarkChangeSet_folderHasReplaceChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_19);

}

void __55__WebBookmarkChangeSet_addedBookmarksInBookmarkFolder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "bookmark", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  WebBookmarkChangeSet *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WebBookmarkChangeSet_encodeWithCoder___block_invoke;
  block[3] = &unk_24CB31830;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_sync(queue, block);

}

uint64_t __40__WebBookmarkChangeSet_encodeWithCoder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:", v3, CFSTR("Changes"));

  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("FileURL"));
}

- (WebBookmarkChangeSet)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WebBookmarkChangeSet *v10;
  WebBookmarkChangeSet *v11;
  WebBookmarkChangeSet *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("Changes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FileURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WebBookmarkChangeSet initWithFileURL:readPersistedChanges:](self, "initWithFileURL:readPersistedChanges:", v9, 0);
  v11 = v10;
  if (v10)
  {
    -[WebBookmarkChangeSet addChanges:](v10, "addChanges:", v8);
    v12 = v11;
  }

  return v11;
}

- (BOOL)shouldSync
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__WebBookmarkChangeSet_shouldSync__block_invoke;
  v5[3] = &unk_24CB31610;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__WebBookmarkChangeSet_shouldSync__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "safari_containsObjectPassingTest:", &__block_literal_global_8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __34__WebBookmarkChangeSet_shouldSync__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldSync");
}

- (int)nextBookmarkIDForAddingBookmarkInMemory
{
  NSObject *queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__WebBookmarkChangeSet_nextBookmarkIDForAddingBookmarkInMemory__block_invoke;
  v5[3] = &unk_24CB319A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__WebBookmarkChangeSet_nextBookmarkIDForAddingBookmarkInMemory__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = --*(_DWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)addChanges:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  WebBookmarkChangeSet *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__WebBookmarkChangeSet_addChanges___block_invoke;
  v7[3] = &unk_24CB31830;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_async(queue, v7);

}

void __35__WebBookmarkChangeSet_addChanges___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_addChange:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__WebBookmarkChangeSet_addChange___block_invoke;
  v7[3] = &unk_24CB31830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queue, v7);

}

uint64_t __34__WebBookmarkChangeSet_addChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addChange:", *(_QWORD *)(a1 + 40));
}

- (void)_addChange:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *folderIDToDeletedChildrenChanges;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WebBookmarkChangeSet _coalesceChangesForChangeIfNeeded:](self, "_coalesceChangesForChangeIfNeeded:", v4);
  -[NSMutableOrderedSet addObject:](self->_changes, "addObject:", v4);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __35__WebBookmarkChangeSet__addChange___block_invoke;
  v23[3] = &unk_24CB32228;
  v5 = v4;
  v24 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x212BD4C84](v23);
  v7 = objc_msgSend(v5, "bookmarkID");
  v8 = v7;
  if ((int)v7 < self->_lastBookmarkIDForAddingInMemoryBookmark)
    self->_lastBookmarkIDForAddingInMemoryBookmark = v7;
  if ((_DWORD)v7 && (_DWORD)v7 != 0x7FFFFFFF)
    ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, v7);
  objc_msgSend(v5, "bookmark", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lastSelectedChildID");

  if ((_DWORD)v10 && (_DWORD)v10 != 0x7FFFFFFF)
    ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, v10);
  v11 = objc_msgSend(v5, "specialFolderID");
  if (!(_DWORD)v11)
    v11 = objc_msgSend(v5, "parentID");
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToChildrenChanges, v11);
  v12 = objc_msgSend(v5, "associatedBookmarkID");
  switch(objc_msgSend(v5, "changeType"))
  {
    case 0:
    case 1:
      folderIDToDeletedChildrenChanges = self->_folderIDToDeletedChildrenChanges;
      goto LABEL_15;
    case 2:
      folderIDToDeletedChildrenChanges = self->_folderIDToAddedChildrenChanges;
      goto LABEL_15;
    case 3:
      folderIDToDeletedChildrenChanges = self->_folderIDToModifiedChildrenChanges;
LABEL_15:
      ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, folderIDToDeletedChildrenChanges, v11);
      break;
    case 4:
      ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToDeletedChildrenChanges, v11);
      ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToAddedChildrenChanges, v12);
      ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToChildrenChanges, v12);
      goto LABEL_18;
    case 5:
      ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToReorderedChildrenChanges, v11);
LABEL_18:
      ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_associatedIDToChanges, v12);
      break;
    case 6:
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v5, "bookmarks", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v20 != v17)
              objc_enumerationMutation(v14);
            ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "identifier"));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v16);
      }

      break;
    default:
      break;
  }

}

void __35__WebBookmarkChangeSet__addChange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)_coalesceChangesForChangeIfNeeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "changeType") == 3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)-[NSMutableOrderedSet copy](self->_changes, "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "changeType") == 3)
          {
            v11 = objc_msgSend(v10, "bookmarkID");
            if (v11 == objc_msgSend(v4, "bookmarkID"))
              -[WebBookmarkChangeSet _removeChange:](self, "_removeChange:", v10);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)removeChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__WebBookmarkChangeSet_removeChange___block_invoke;
  v7[3] = &unk_24CB31830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queue, v7);

}

uint64_t __37__WebBookmarkChangeSet_removeChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeChange:", *(_QWORD *)(a1 + 40));
}

- (void)_removeChange:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *bookmarkIDToChanges;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *folderIDToChildrenChanges;
  unsigned int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableOrderedSet removeObject:](self->_changes, "removeObject:", v4);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __38__WebBookmarkChangeSet__removeChange___block_invoke;
  v23[3] = &unk_24CB32228;
  v5 = v4;
  v24 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x212BD4C84](v23);
  v7 = objc_msgSend(v5, "parentID");
  v8 = objc_msgSend(v5, "associatedBookmarkID");
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, objc_msgSend(v5, "bookmarkID"));
  bookmarkIDToChanges = self->_bookmarkIDToChanges;
  objc_msgSend(v5, "bookmark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, bookmarkIDToChanges, objc_msgSend(v10, "lastSelectedChildID"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "bookmarks", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_bookmarkIDToChanges, objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15++), "identifier"));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v13);
  }

  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_associatedIDToChanges, v8);
  folderIDToChildrenChanges = self->_folderIDToChildrenChanges;
  v17 = objc_msgSend(v5, "specialFolderID");
  if (v17)
    v18 = v17;
  else
    v18 = v7;
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, folderIDToChildrenChanges, v18);
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToChildrenChanges, v8);
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToDeletedChildrenChanges, v7);
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToAddedChildrenChanges, v7);
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToAddedChildrenChanges, v8);
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToModifiedChildrenChanges, v7);
  ((void (**)(_QWORD, NSMutableDictionary *, uint64_t))v6)[2](v6, self->_folderIDToReorderedChildrenChanges, v7);

}

void __38__WebBookmarkChangeSet__removeChange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v6, "count"))
    objc_msgSend(v7, "removeObjectForKey:", v5);

}

- (void)removeAllChanges
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WebBookmarkChangeSet_removeAllChanges__block_invoke;
  block[3] = &unk_24CB315A0;
  block[4] = self;
  dispatch_barrier_async(queue, block);
}

uint64_t __40__WebBookmarkChangeSet_removeAllChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllChanges");
}

- (void)_removeAllChanges
{
  id v3;

  -[NSMutableOrderedSet removeAllObjects](self->_changes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_bookmarkIDToChanges, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_associatedIDToChanges, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_folderIDToChildrenChanges, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_folderIDToDeletedChildrenChanges, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_folderIDToAddedChildrenChanges, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_folderIDToModifiedChildrenChanges, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_folderIDToReorderedChildrenChanges, "removeAllObjects");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", self->_fileURL, 0);

}

- (id)bookmarksAfterReplayingChangesToBookmarks:(id)a3 inFolderWithID:(int)a4
{
  void *v6;
  NSObject *queue;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  int v14;

  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__WebBookmarkChangeSet_bookmarksAfterReplayingChangesToBookmarks_inFolderWithID___block_invoke;
  block[3] = &unk_24CB322A0;
  block[4] = self;
  v14 = a4;
  v8 = v6;
  v13 = v8;
  dispatch_sync(queue, block);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __81__WebBookmarkChangeSet_bookmarksAfterReplayingChangesToBookmarks_inFolderWithID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL (*v11)(uint64_t, void *);
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t, void *);
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v10 = MEMORY[0x24BDAC760];
    v11 = __81__WebBookmarkChangeSet_bookmarksAfterReplayingChangesToBookmarks_inFolderWithID___block_invoke_2;
    v24 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "bookmark", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v13, "changeType"))
        {
          case 0:
          case 4:
            objc_msgSend(*(id *)(a1 + 40), "removeObject:", v14);
            break;
          case 2:
            v15 = objc_msgSend(v14, "isFolder");
            v16 = *(void **)(a1 + 40);
            if (v15)
              objc_msgSend(v16, "insertObject:atIndex:", v14, 0);
            else
              objc_msgSend(v16, "addObject:", v14);
            break;
          case 3:
            objc_msgSend(v13, "applyModificationsToBookmark:", v14);
            break;
          case 5:
            objc_msgSend(*(id *)(a1 + 40), "removeObject:", v14);
            v23 = *(void **)(a1 + 40);
            v25[0] = v10;
            v25[1] = 3221225472;
            v25[2] = v11;
            v25[3] = &unk_24CB32278;
            v25[4] = v13;
            objc_msgSend(v23, "safari_firstObjectPassingTest:", v25);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "safari_insertObject:afterObject:", v14, v21);
            goto LABEL_14;
          case 6:
            if (objc_msgSend(v13, "parentID") == *(_DWORD *)(a1 + 48))
            {
              objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
              v17 = v1;
              v18 = v11;
              v19 = v10;
              v20 = *(void **)(a1 + 40);
              objc_msgSend(v13, "bookmarks");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v20;
              v10 = v19;
              v11 = v18;
              v1 = v17;
              v6 = v24;
              objc_msgSend(v22, "addObjectsFromArray:", v21);
LABEL_14:

            }
            break;
          default:
            break;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

}

BOOL __81__WebBookmarkChangeSet_bookmarksAfterReplayingChangesToBookmarks_inFolderWithID___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "identifier");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "associatedBookmarkID");
}

- (BOOL)isBookmarkDeleted:(int)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WebBookmarkChangeSet_isBookmarkDeleted___block_invoke;
  block[3] = &unk_24CB322C8;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __42__WebBookmarkChangeSet_isBookmarkDeleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "changeType", (_QWORD)v12);
        if (v10 > 5 || ((1 << v10) & 0x2C) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

}

BOOL __47__WebBookmarkChangeSet_folderHasReplaceChange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "changeType") == 6;
}

- (void)updateAddChangesWithInMemoryBookmarkID:(int)a3 toDatabaseGeneratedID:(int)a4
{
  NSObject *v7;
  NSObject *queue;
  _QWORD v9[5];
  int v10;
  int v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 != a4)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v13 = a3;
      v14 = 2048;
      v15 = a4;
      _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Updating changes from in memory identifier %ld to database identifier %ld", buf, 0x16u);
    }
    queue = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __85__WebBookmarkChangeSet_updateAddChangesWithInMemoryBookmarkID_toDatabaseGeneratedID___block_invoke;
    v9[3] = &unk_24CB32360;
    v10 = a3;
    v11 = a4;
    v9[4] = self;
    dispatch_barrier_sync(queue, v9);
  }
}

void __85__WebBookmarkChangeSet_updateAddChangesWithInMemoryBookmarkID_toDatabaseGeneratedID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 44));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "bookmark");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "identifier") == *(_DWORD *)(a1 + 40))
        {
          objc_msgSend(v9, "setBookmarkID:", *(unsigned int *)(a1 + 44));
          objc_msgSend(v10, "_setID:", *(unsigned int *)(a1 + 44));
          objc_msgSend(v10, "_setInserted:", 1);
        }
        else if (objc_msgSend(v10, "lastSelectedChildID") == *(_DWORD *)(a1 + 40))
        {
          objc_msgSend(v10, "setLastSelectedChildID:", *(unsigned int *)(a1 + 44));
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v4, v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v2);
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__WebBookmarkChangeSet_updateAddChangesWithInMemoryBookmarkID_toDatabaseGeneratedID___block_invoke_2;
  v14[3] = &unk_24CB32338;
  v17 = *(_QWORD *)(a1 + 40);
  v15 = v2;
  v16 = v3;
  v11 = v3;
  v12 = v2;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BD4C84](v14);
  v13[2](v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v13[2](v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v13[2](v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v13[2](v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v13[2](v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

}

void __85__WebBookmarkChangeSet_updateAddChangesWithInMemoryBookmarkID_toDatabaseGeneratedID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "updateChangeAfterUpdatingInMemoryID:withDatabaseID:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (v4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  }

}

- (void)persistChangesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke;
  v12[3] = &unk_24CB318F8;
  v13 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x212BD4C84](v12);
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2;
  block[3] = &unk_24CB319F0;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_barrier_async(queue, block);

}

uint64_t __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_22_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = CFSTR("Changes");
    v16[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    v7 = v6;
    if (v5)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v13 = v6;
      v9 = objc_msgSend(v5, "writeToURL:options:error:", v8, 0, &v13);
      v10 = v13;

      if ((v9 & 1) == 0)
      {
        v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2_cold_2(v11, v10);
      }
      v7 = v10;
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2_cold_1(v12, v7);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_folderIDToReorderedChildrenChanges, 0);
  objc_storeStrong((id *)&self->_folderIDToModifiedChildrenChanges, 0);
  objc_storeStrong((id *)&self->_folderIDToAddedChildrenChanges, 0);
  objc_storeStrong((id *)&self->_folderIDToDeletedChildrenChanges, 0);
  objc_storeStrong((id *)&self->_folderIDToChildrenChanges, 0);
  objc_storeStrong((id *)&self->_associatedIDToChanges, 0);
  objc_storeStrong((id *)&self->_bookmarkIDToChanges, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "wb_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v5, v6, "Error converting in-memory changes into plist data: %@{public}", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __53__WebBookmarkChangeSet_persistChangesWithCompletion___block_invoke_2_cold_2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "wb_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v5, v6, "Failed to persist in-memory bookmarks changes plist: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3_0();
}

@end
