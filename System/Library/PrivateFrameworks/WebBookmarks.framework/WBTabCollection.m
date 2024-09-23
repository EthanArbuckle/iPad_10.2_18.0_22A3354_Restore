@implementation WBTabCollection

uint64_t __48__WBTabCollection__deleteItems_leaveTombstones___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "needsSecureDelete");
}

- (NSString)currentDeviceIdentifier
{
  return (NSString *)-[WebBookmarkCollection currentDeviceIdentifier](self->_collection, "currentDeviceIdentifier");
}

void __37__WBTabCollection_devicesForProfile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devicesForProfile:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)mutableProfiles
{
  NSObject *databaseQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13[3];

  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WBTabCollection_mutableProfiles__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSArray *)v4;
}

- (id)devicesForProfile:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__WBTabCollection_devicesForProfile___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

- (WBCollectionConfiguration)configuration
{
  return self->_configuration;
}

- (WBTabCollection)initWithConfiguration:(id)a3 openDatabase:(BOOL)a4
{
  return -[WBTabCollection initWithConfiguration:openDatabase:checkIntegrity:](self, "initWithConfiguration:openDatabase:checkIntegrity:", a3, a4, 0);
}

void __40__WBTabCollection_hasCompletedMigration__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncStringForKey:", CFSTR("hasMigrated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

id __39__WBTabCollection__bookmarksFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __39__WBTabCollection__bookmarksFromItems___block_invoke_cold_1((uint64_t)v2, v4);
  }

  return v3;
}

uint64_t __47__WBTabCollection_saveItems_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_saveItems:", *(_QWORD *)(a1 + 40));
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_saveItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  WBTabCollection *v10;

  v4 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__WBTabCollection__saveItems___block_invoke;
  v8[3] = &unk_24CB32008;
  v6 = v4;
  v9 = v6;
  v10 = self;
  LOBYTE(self) = objc_msgSend(v5, "performDatabaseUpdatesWithTransaction:secureDelete:", v8, 0);

  return (char)self;
}

- (WBTabCollection)initWithConfiguration:(id)a3 openDatabase:(BOOL)a4 checkIntegrity:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "collectionType") != 1)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WBTabCollection initWithConfiguration:openDatabase:checkIntegrity:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    v9 = 0;
    goto LABEL_8;
  }
  v22.receiver = self;
  v22.super_class = (Class)WBTabCollection;
  v9 = -[WBTabCollection init](&v22, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)*((_QWORD *)v9 + 3);
    *((_QWORD *)v9 + 3) = v10;

    *((_QWORD *)v9 + 4) = objc_msgSend(v8, "maximumTabsPerTabGroup");
    objc_msgSend(v9, "_createDatabaseQueue");
    if (v6)
    {
      objc_msgSend(v9, "_collectionWithConfiguration:checkIntegrity:", v8, v5);
      v12 = objc_claimAutoreleasedReturnValue();
      self = (WBTabCollection *)*((_QWORD *)v9 + 2);
      *((_QWORD *)v9 + 2) = v12;
LABEL_8:

    }
  }

  return (WBTabCollection *)v9;
}

- (void)_createDatabaseQueue
{
  const char *v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *databaseQueue;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.WebBookmarks.WBTabCollection.databaseQueue.%p"), self);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v7, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_queue *)dispatch_queue_create(v3, v4);
  databaseQueue = self->_databaseQueue;
  self->_databaseQueue = v5;

}

uint64_t __65__WBTabCollection_deleteItems_leaveTombstones_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_deleteItems:leaveTombstones:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

void __74__WBTabCollection_frequentlyVisitedSitesFolderIDForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "frequentlyVisitedSitesFolderIDForProfileWithIdentifier:", *(_QWORD *)(a1 + 40));

}

void __84__WBTabCollection_frequentlyVisitedSitesForProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "frequentlyVisitedSitesFolderIDForProfileWithIdentifier:", *(_QWORD *)(a1 + 40));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__WBTabCollection_frequentlyVisitedSitesForProfileWithIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_24CB32A50;
  v6 = v2;
  v8 = v6;
  objc_msgSend(v3, "enumerateDescendantsOfBookmarkID:usingBlock:", v5, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __68__WBTabCollection_insertItems_inParent_afterItem_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "bookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "_insertItems:inParentWithID:afterItem:", v3, objc_msgSend(v4, "identifier"), *(_QWORD *)(a1 + 56));

  v6 = *(id **)(a1 + 72);
  if (v6)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v6);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  return result;
}

- (BOOL)_insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  unsigned int v17;

  v8 = a3;
  v9 = a5;
  -[WBTabCollection _collection](self, "_collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__WBTabCollection__insertItems_inParentWithID_afterItem___block_invoke;
  v14[3] = &unk_24CB33138;
  v14[4] = self;
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  v17 = a4;
  LOBYTE(a4) = objc_msgSend(v10, "performDatabaseUpdatesWithTransaction:secureDelete:", v14, 0);

  return a4;
}

- (BOOL)_deleteItems:(id)a3 leaveTombstones:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = a3;
  v7 = objc_msgSend(v6, "safari_containsObjectPassingTest:", &__block_literal_global_35);
  -[WBTabCollection _collection](self, "_collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__WBTabCollection__deleteItems_leaveTombstones___block_invoke_2;
  v12[3] = &unk_24CB332B8;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v14 = a4;
  v10 = objc_msgSend(v8, "performDatabaseUpdatesWithTransaction:secureDelete:", v12, v7);

  return v10;
}

uint64_t __57__WBTabCollection__insertItems_inParentWithID_afterItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(v9, "bookmark", (_QWORD)v12);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v2, "_saveAndMoveBookmark:toFolderID:", v3, *(unsigned int *)(a1 + 56)) & 1) == 0
          || !objc_msgSend(v2, "_reorderBookmark:afterBookmark:", v3, v8))
        {

          v10 = 0;
          v3 = v8;
          goto LABEL_13;
        }
        objc_msgSend(*(id *)(a1 + 32), "_saveSettingsIfNeededForItem:", v9);

        ++v7;
        v8 = v3;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v10 = 1;
  }
LABEL_13:

  return v10;
}

- (id)_collection
{
  WebBookmarkTabCollection *collection;
  WebBookmarkTabCollection *v4;
  WebBookmarkTabCollection *v5;

  collection = self->_collection;
  if (!collection)
  {
    -[WBTabCollection _collectionWithConfiguration:checkIntegrity:](self, "_collectionWithConfiguration:checkIntegrity:", self->_configuration, 0);
    v4 = (WebBookmarkTabCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_collection;
    self->_collection = v4;

    collection = self->_collection;
  }
  return collection;
}

uint64_t __48__WBTabCollection__deleteItems_leaveTombstones___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_bookmarksFromItems:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_deleteBookmarks:leaveTombstone:", v3, *(unsigned __int8 *)(a1 + 48));

  return v4;
}

- (BOOL)_saveSettingsIfNeededForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "bookmark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __48__WBTabCollection__saveSettingsIfNeededForItem___block_invoke;
    v15[3] = &unk_24CB31DC8;
    v6 = v4;
    v16 = v6;
    objc_msgSend(v5, "performWithFieldsWriteLock:", v15);

    -[WBTabCollection _collection](self, "_collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modifiedSettingsFieldsByName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bookmark");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "identifier");
    objc_msgSend(v6, "bookmark");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "saveSettings:inParentWithID:parentServerID:", v8, v10, v12);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)_bookmarksFromItems:(id)a3
{
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_38);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __30__WBTabCollection__saveItems___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_collection", (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bookmark");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v8, 0, 1);

        if ((v9 & 1) == 0 || !objc_msgSend(*(id *)(a1 + 40), "_saveSettingsIfNeededForItem:", v6))
        {
          v10 = 0;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 1;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v10 = 1;
  }
LABEL_13:

  return v10;
}

- (id)_collectionWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_class *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27[3];

  v4 = a4;
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "storeOwner") >= 3)
    v6 = 0;
  else
    v6 = (objc_class *)objc_opt_class();
  MEMORY[0x212BD4870](v27, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = objc_msgSend(v5, "isReadonly");
  if ((v7 & 1) != 0 || (-[objc_class lockSync](v6, "lockSync") & 1) != 0)
  {
    v8 = (void *)objc_msgSend([v6 alloc], "initWithConfiguration:checkIntegrity:", v5, v4);
    if ((v7 & 1) == 0)
      -[objc_class unlockSync](v6, "unlockSync");
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WBTabCollection _collectionWithConfiguration:checkIntegrity:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }

  }
  else
  {
    v18 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WBTabCollection _collectionWithConfiguration:checkIntegrity:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
    v8 = 0;
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v27);

  return v8;
}

void __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke(uint64_t a1, void *a2, NSObject *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (*(unsigned __int8 *)(a1 + 56) == objc_msgSend(v5, "isSyncable"))
  {
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", (char *)&a3[-1].isa + 7);
      a3 = objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v5, "wasAdded"))
    {
      v6 = *(void **)(a1 + 48);
      if (*(_BYTE *)(a1 + 56))
      {
        v12 = v5;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "insertItemsIntoPlace:inParent:completionHandler:", v7, *(_QWORD *)(a1 + 32), 0);
      }
      else
      {
        v11 = v5;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "insertItems:inParent:afterItem:completionHandler:", v7, *(_QWORD *)(a1 + 32), a3, 0);
      }

    }
    else
    {
      if (objc_msgSend(v5, "wasMoved"))
      {
        v10 = *(void **)(a1 + 48);
        if (*(_BYTE *)(a1 + 56))
          objc_msgSend(v10, "reorderItemIntoPlace:completionHandler:", v5, 0);
        else
          objc_msgSend(v10, "reorderItem:afterItem:completionHandler:", v5, a3, 0);
      }
      if (objc_msgSend(v5, "wasModified"))
        objc_msgSend(*(id *)(a1 + 48), "saveItem:completionHandler:", v5, 0);
    }
    objc_msgSend(v5, "markClean");
  }
  else
  {
    a3 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v5, "privacyPreservingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke_cold_1(v8, v9, buf, a3);
    }
  }

}

- (void)insertItems:(id)a3 inParent:(id)a4 afterItem:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *databaseQueue;
  id v16;
  id v17;
  id v18;
  id v19;
  dispatch_block_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = operator new();
  MEMORY[0x212BD4870](v14, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __68__WBTabCollection_insertItems_inParent_afterItem_completionHandler___block_invoke;
  v21[3] = &unk_24CB331B0;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v21);
  dispatch_async(databaseQueue, v20);

}

- (void)updateTabsInTabGroup:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *databaseQueue;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  WBTabCollection *v20;
  char v21;

  v6 = a3;
  v7 = a4;
  -[WBTabCollection flushDeletedTabsInTabGroup:completionHandler:](self, "flushDeletedTabsInTabGroup:completionHandler:", v6, 0);
  v8 = objc_msgSend(v6, "isSyncable");
  objc_msgSend(v6, "allTabs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke;
  v17[3] = &unk_24CB336B8;
  v21 = v8;
  v11 = v6;
  v18 = v11;
  v19 = v9;
  v20 = self;
  v12 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
  databaseQueue = self->_databaseQueue;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke_72;
  block[3] = &unk_24CB336E0;
  v16 = v7;
  v14 = v7;
  dispatch_async(databaseQueue, block);

}

- (void)flushDeletedTabsInTabGroup:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WBTabCollection *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deletedTabs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v6, "clearDeletedTabs");
  v10 = objc_msgSend(v6, "isSyncable");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__WBTabCollection_flushDeletedTabsInTabGroup_completionHandler___block_invoke;
  v14[3] = &unk_24CB33708;
  v11 = v6;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v13 = v7;
  v17 = self;
  v18 = v13;
  -[WBTabCollection deleteItems:leaveTombstones:completionHandler:](self, "deleteItems:leaveTombstones:completionHandler:", v12, v10, v14);

}

- (void)deleteItems:(id)a3 leaveTombstones:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  v10 = operator new();
  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WBTabCollection_deleteItems_leaveTombstones_completionHandler___block_invoke;
  block[3] = &unk_24CB33308;
  block[4] = self;
  v16 = v8;
  v19 = a4;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(databaseQueue, v14);

}

void __64__WBTabCollection_flushDeletedTabsInTabGroup_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setDeletedTabs:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 56);
  if (v3)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__WBTabCollection_flushDeletedTabsInTabGroup_completionHandler___block_invoke_2;
    block[3] = &unk_24CB336E0;
    v6 = v3;
    dispatch_async(v4, block);

  }
}

void __31__WBTabCollection_browserState__block_invoke(uint64_t a1)
{
  WBBrowserState *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = [WBBrowserState alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "pinnedTabs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "privatePinnedTabs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "windowStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBBrowserState initWithPinnedTabs:privatePinnedTabs:windowStates:](v2, "initWithPinnedTabs:privatePinnedTabs:windowStates:", v8, v3, v4);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __53__WBTabCollection_saveWindowState_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "saveWindowState:", *(_QWORD *)(a1 + 40));

  v4 = *(id **)(a1 + 56);
  if (v4)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v4);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

id __28__WBTabCollection__profiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileForBookmark:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)saveItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = operator new();
  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__WBTabCollection_saveItems_completionHandler___block_invoke;
  v13[3] = &unk_24CB33110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_async(databaseQueue, v12);

}

- (BOOL)hasCompletedMigration
{
  NSObject *databaseQueue;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  id v10[3];

  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WBTabCollection_hasCompletedMigration__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (char)self;
}

- (void)frequentlyVisitedSitesForProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__WBTabCollection_frequentlyVisitedSitesForProfileWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24CB33528;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

void __34__WBTabCollection_mutableProfiles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_profiles");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_profiles
{
  WebBookmarkListQuery *v3;
  WebBookmarkList *v4;
  void *v5;
  WebBookmarkList *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];

  v3 = -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:folderID:orderBy:usingFilter:", CFSTR("parent = 0 AND syncable = 1 AND type = 1 AND subtype = 2 AND special_id = 0"), 0, CFSTR("order_index ASC"), 0);
  v4 = [WebBookmarkList alloc];
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WebBookmarkList initWithQuery:skipOffset:collection:](v4, "initWithQuery:skipOffset:collection:", v3, 0, v5);

  -[WebBookmarkList bookmarkArray](v6, "bookmarkArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __28__WBTabCollection__profiles__block_invoke;
  v13[3] = &unk_24CB33898;
  v13[4] = self;
  objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v13);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x24BDBD1A8];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  return v11;
}

- (int)frequentlyVisitedSitesFolderIDForProfileWithIdentifier:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__WBTabCollection_frequentlyVisitedSitesFolderIDForProfileWithIdentifier___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (int)self;
}

- (WBBrowserState)browserState
{
  NSObject *databaseQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13[3];

  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WBTabCollection_browserState__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (WBBrowserState *)v4;
}

- (void)saveWindowState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = operator new();
  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__WBTabCollection_saveWindowState_completionHandler___block_invoke;
  v13[3] = &unk_24CB33110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_async(databaseQueue, v12);

}

+ (id)inMemoryChangeSet
{
  return +[WebBookmarkTabCollection inMemoryChangeSet](WebBookmarkTabCollection, "inMemoryChangeSet");
}

+ (NSString)deviceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  +[WebBookmarkCollection deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:](WebBookmarkTabCollection, "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", 1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)databasePathForConfiguration:(id)a3
{
  +[WebBookmarkCollection databasePathForConfiguration:](WebBookmarkTabCollection, "databasePathForConfiguration:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WBTabCollection)initWithTabCollection:(id)a3
{
  id v5;
  WBTabCollection *v6;
  WBTabCollection *v7;
  WBTabCollection *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBTabCollection;
  v6 = -[WBTabCollection init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[WBTabCollection _createDatabaseQueue](v6, "_createDatabaseQueue");
    objc_storeStrong((id *)&v7->_collection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setCompletedMigration:(BOOL)a3
{
  NSObject *databaseQueue;
  _QWORD block[5];
  BOOL v7;
  id v8[3];

  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WBTabCollection_setCompletedMigration___block_invoke;
  block[3] = &unk_24CB326C0;
  block[4] = self;
  v7 = a3;
  dispatch_sync(databaseQueue, block);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v8);
}

void __41__WBTabCollection_setCompletedMigration___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40))
    v3 = CFSTR("1");
  else
    v3 = 0;
  v4 = v2;
  objc_msgSend(v2, "syncSetString:forKey:", v3, CFSTR("hasMigrated"));

}

- (NSError)error
{
  NSObject *databaseQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13[3];

  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__WBTabCollection_error__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSError *)v4;
}

void __24__WBTabCollection_error__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_errorForMostRecentSQLiteError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isPersistent
{
  return !-[WBCollectionConfiguration isInMemoryDatabase](self->_configuration, "isInMemoryDatabase");
}

- (void)disableSuddenTerminationForPendingChanges
{
  uint64_t v3;
  dispatch_block_t v4;
  _QWORD block[5];

  v3 = operator new();
  MEMORY[0x212BD4870](v3, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WBTabCollection_disableSuddenTerminationForPendingChanges__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async((dispatch_queue_t)self->_databaseQueue, v4);

}

id *__60__WBTabCollection_disableSuddenTerminationForPendingChanges__block_invoke(uint64_t a1)
{
  id *result;

  result = *(id **)(a1 + 32);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x212BD4888);
  }
  return result;
}

- (void)waitForPendingChanges
{
  dispatch_sync((dispatch_queue_t)self->_databaseQueue, &__block_literal_global_14);
}

- (WBBrowserState)lastSessionBrowserState
{
  NSObject *databaseQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13[3];

  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WBTabCollection_lastSessionBrowserState__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (WBBrowserState *)v4;
}

void __42__WBTabCollection_lastSessionBrowserState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_lastSessionBrowserState");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_lastSessionBrowserState
{
  WBBrowserState *v3;
  void *v4;
  void *v5;
  void *v6;
  WBBrowserState *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  WebBookmarkTabCollection *collection;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = [WBBrowserState alloc];
  -[WebBookmarkTabCollection pinnedTabs](self->_collection, "pinnedTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkTabCollection privatePinnedTabs](self->_collection, "privatePinnedTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkTabCollection lastSessionWindowStates](self->_collection, "lastSessionWindowStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBBrowserState initWithPinnedTabs:privatePinnedTabs:windowStates:](v3, "initWithPinnedTabs:privatePinnedTabs:windowStates:", v4, v5, v6);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[WBTabCollection _profiles](self, "_profiles", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "kind"))
        {
          collection = self->_collection;
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WebBookmarkTabCollection pinnedTabsForProfileWithIdentifier:](collection, "pinnedTabsForProfileWithIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v17);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  -[WBBrowserState setPinnedTabsByProfileIdentifier:](v7, "setPinnedTabsByProfileIdentifier:", v8);
  return v7;
}

- (BOOL)saveBrowserState:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__WBTabCollection_saveBrowserState___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

uint64_t __36__WBTabCollection_saveBrowserState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_saveBrowserState:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveBrowserState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  WBTabCollection *v10;

  v4 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__WBTabCollection__saveBrowserState___block_invoke;
  v8[3] = &unk_24CB32008;
  v6 = v4;
  v9 = v6;
  v10 = self;
  LOBYTE(self) = objc_msgSend(v5, "performDatabaseUpdatesWithTransaction:secureDelete:", v8, 1);

  return (char)self;
}

uint64_t __37__WBTabCollection__saveBrowserState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pinnedTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "privatePinnedTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 40), "_updatePinnedTabs:privatePinnedTabs:", v3, v5) & 1) != 0
    && (v6 = *(void **)(a1 + 40),
        objc_msgSend(*(id *)(a1 + 32), "pinnedTabsByProfileIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v6) = objc_msgSend(v6, "_updatePinnedTabsByProfileIdentifier:", v7),
        v7,
        (v6 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "_collection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "windowStates");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(v8, "_saveWindowState:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15) & 1) == 0)
          {

            goto LABEL_15;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }

    if ((objc_msgSend(v8, "_markWindowStatesAsLastSession:", v9) & 1) != 0)
      v13 = objc_msgSend(v8, "_deleteWindowsNotInLastSession");
    else
LABEL_15:
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __37__WBTabCollection__saveBrowserState___block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

id __37__WBTabCollection__saveBrowserState___block_invoke_3(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

- (void)saveBrowserState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = operator new();
  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__WBTabCollection_saveBrowserState_completionHandler___block_invoke;
  v13[3] = &unk_24CB33110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_async(databaseQueue, v12);

}

uint64_t __54__WBTabCollection_saveBrowserState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_saveBrowserState:", *(_QWORD *)(a1 + 40));
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)deleteAllLocalSavedState
{
  NSObject *databaseQueue;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  id v10[3];

  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__WBTabCollection_deleteAllLocalSavedState__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (char)self;
}

void __43__WBTabCollection_deleteAllLocalSavedState__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__WBTabCollection_deleteAllLocalSavedState__block_invoke_2;
  v3[3] = &unk_24CB31E10;
  v3[4] = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "performDatabaseUpdatesWithTransaction:secureDelete:", v3, 1);

}

uint64_t __43__WBTabCollection_deleteAllLocalSavedState__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_deleteAllWindowStates");

  if ((v3 & 1) == 0)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_deleteAllLocalTabsAndGroups");

  return v5;
}

- (unint64_t)numberOfLocalTabsToBeClosed
{
  NSObject *databaseQueue;
  unint64_t v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  id v11[3];

  MEMORY[0x212BD4870](v11, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WBTabCollection_numberOfLocalTabsToBeClosed__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v11);
  return v4;
}

void __46__WBTabCollection_numberOfLocalTabsToBeClosed__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_countOfAllLocalTabsToBeDeleted");

}

- (BOOL)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5
{
  id v8;
  id v9;
  NSObject *databaseQueue;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  id v23[3];

  v8 = a3;
  v9 = a5;
  MEMORY[0x212BD4870](v23, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  databaseQueue = self->_databaseQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__WBTabCollection_insertItems_inParentWithID_afterItem___block_invoke;
  v14[3] = &unk_24CB33160;
  v14[4] = self;
  v15 = v8;
  v18 = a4;
  v16 = v9;
  v17 = &v19;
  v11 = v9;
  v12 = v8;
  dispatch_sync(databaseQueue, v14);
  LOBYTE(v9) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v23);
  return (char)v9;
}

uint64_t __56__WBTabCollection_insertItems_inParentWithID_afterItem___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_insertItems:inParentWithID:afterItem:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *databaseQueue;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  unsigned int v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = operator new();
  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__WBTabCollection_insertItems_inParentWithID_afterItem_completionHandler___block_invoke;
  v19[3] = &unk_24CB33188;
  v19[4] = self;
  v20 = v10;
  v24 = a4;
  v22 = v12;
  v23 = v13;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
  dispatch_async(databaseQueue, v18);

}

uint64_t __74__WBTabCollection_insertItems_inParentWithID_afterItem_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_insertItems:inParentWithID:afterItem:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48));
  v3 = *(id **)(a1 + 64);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_insertItemsIntoPlace:(id)a3 inParentWithID:(unsigned int)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  unsigned int v12;

  v6 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__WBTabCollection__insertItemsIntoPlace_inParentWithID___block_invoke;
  v10[3] = &unk_24CB32770;
  v10[4] = self;
  v8 = v6;
  v11 = v8;
  v12 = a4;
  LOBYTE(a4) = objc_msgSend(v7, "performDatabaseUpdatesWithTransaction:secureDelete:", v10, 0);

  return a4;
}

uint64_t __56__WBTabCollection__insertItemsIntoPlace_inParentWithID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "bookmark", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isSyncable"))
        {
          objc_msgSend(v8, "syncPosition");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v2, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v8, v9, objc_msgSend(v8, "parentID"));

        }
        else
        {
          v10 = objc_msgSend(v8, "orderIndex");
        }
        if ((objc_msgSend(v2, "_saveAndMoveBookmark:toFolderID:orderIndex:", v8, *(unsigned int *)(a1 + 48), v10) & 1) == 0)
        {

          v11 = 0;
          goto LABEL_14;
        }
        objc_msgSend(*(id *)(a1 + 32), "_saveSettingsIfNeededForItem:", v7);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (void)insertItemsIntoPlace:(id)a3 inParentWithID:(unsigned int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  unsigned int v19;

  v8 = a3;
  v9 = a5;
  v10 = operator new();
  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__WBTabCollection_insertItemsIntoPlace_inParentWithID_completionHandler___block_invoke;
  block[3] = &unk_24CB331D8;
  block[4] = self;
  v16 = v8;
  v19 = a4;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(databaseQueue, v14);

}

uint64_t __73__WBTabCollection_insertItemsIntoPlace_inParentWithID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_insertItemsIntoPlace:inParentWithID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64));
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (void)insertItemsIntoPlace:(id)a3 inParent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *databaseQueue;
  id v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = operator new();
  MEMORY[0x212BD4870](v11, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__WBTabCollection_insertItemsIntoPlace_inParent_completionHandler___block_invoke;
  block[3] = &unk_24CB33200;
  block[4] = self;
  v18 = v8;
  v20 = v10;
  v21 = v11;
  v19 = v9;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(databaseQueue, v16);

}

uint64_t __67__WBTabCollection_insertItemsIntoPlace_inParent_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "bookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "_insertItemsIntoPlace:inParentWithID:", v3, objc_msgSend(v4, "identifier"));

  v6 = *(id **)(a1 + 64);
  if (v6)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v6);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  return result;
}

- (BOOL)_saveItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __29__WBTabCollection__saveItem___block_invoke;
  v9[3] = &unk_24CB32008;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v7 = objc_msgSend(v5, "performDatabaseUpdatesWithTransaction:secureDelete:", v9, 0);

  return v7;
}

uint64_t __29__WBTabCollection__saveItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v3, 0, 1);

  if ((v4 & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_saveSettingsIfNeededForItem:", *(_QWORD *)(a1 + 40));
  else
    return 0;
}

void __48__WBTabCollection__saveSettingsIfNeededForItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "modifiedSettingsFieldsByName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v2, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resumeIncrementingFields:", v4);

    v2 = v5;
  }

}

- (BOOL)saveItem:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__WBTabCollection_saveItem___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

uint64_t __28__WBTabCollection_saveItem___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_saveItem:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)saveItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = operator new();
  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__WBTabCollection_saveItem_completionHandler___block_invoke;
  v13[3] = &unk_24CB33110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_async(databaseQueue, v12);

}

uint64_t __46__WBTabCollection_saveItem_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_saveItem:", *(_QWORD *)(a1 + 40));
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_reorderItem:(id)a3 afterItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[WBTabCollection _collection](self, "_collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__WBTabCollection__reorderItem_afterItem___block_invoke;
  v13[3] = &unk_24CB33228;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = objc_msgSend(v8, "performDatabaseUpdatesWithTransaction:secureDelete:", v13, 0);

  return v11;
}

uint64_t __42__WBTabCollection__reorderItem_afterItem___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1[4], "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "bookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "_reorderBookmark:afterBookmark:", v3, v4);

  return v5;
}

- (BOOL)reorderItem:(id)a3 afterItem:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  id v20[3];

  v6 = a3;
  v7 = a4;
  MEMORY[0x212BD4870](v20, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WBTabCollection_reorderItem_afterItem___block_invoke;
  block[3] = &unk_24CB33250;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(v7) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v20);
  return (char)v7;
}

uint64_t __41__WBTabCollection_reorderItem_afterItem___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_reorderItem:afterItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)reorderItem:(id)a3 afterItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *databaseQueue;
  id v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = operator new();
  MEMORY[0x212BD4870](v11, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__WBTabCollection_reorderItem_afterItem_completionHandler___block_invoke;
  block[3] = &unk_24CB33200;
  block[4] = self;
  v18 = v8;
  v20 = v10;
  v21 = v11;
  v19 = v9;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(databaseQueue, v16);

}

uint64_t __59__WBTabCollection_reorderItem_afterItem_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_reorderItem:afterItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(id **)(a1 + 64);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_reorderItemIntoPlace:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__WBTabCollection__reorderItemIntoPlace___block_invoke;
  v9[3] = &unk_24CB32008;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v7 = objc_msgSend(v5, "performDatabaseUpdatesWithTransaction:secureDelete:", v9, 0);

  return v7;
}

uint64_t __41__WBTabCollection__reorderItemIntoPlace___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "_reorderBookmarkIntoPlace:", v2);

  return v3;
}

- (void)reorderItemIntoPlace:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = operator new();
  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__WBTabCollection_reorderItemIntoPlace_completionHandler___block_invoke;
  v13[3] = &unk_24CB33110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_async(databaseQueue, v12);

}

uint64_t __58__WBTabCollection_reorderItemIntoPlace_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_reorderItemIntoPlace:", *(_QWORD *)(a1 + 40));
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)deleteItems:(id)a3 leaveTombstones:(BOOL)a4
{
  id v6;
  NSObject *databaseQueue;
  id v8;
  char v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  id v19[3];

  v6 = a3;
  MEMORY[0x212BD4870](v19, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WBTabCollection_deleteItems_leaveTombstones___block_invoke;
  block[3] = &unk_24CB332E0;
  v12 = v6;
  v13 = &v15;
  block[4] = self;
  v14 = a4;
  v8 = v6;
  dispatch_sync(databaseQueue, block);
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v19);
  return v9;
}

uint64_t __47__WBTabCollection_deleteItems_leaveTombstones___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_deleteItems:leaveTombstones:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_updateItems:(id)a3 inParentWithID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "safari_containsObjectPassingTest:", &__block_literal_global_36);
  -[WBTabCollection _collection](self, "_collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabCollection _bookmarksFromItems:](self, "_bookmarksFromItems:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v8, "updateBookmarks:inFolderWithID:secureDelete:", v9, v4, v7);

  return v4;
}

uint64_t __47__WBTabCollection__updateItems_inParentWithID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "needsSecureDelete");
}

- (BOOL)updateItems:(id)a3 inParentWithID:(unsigned int)a4
{
  id v6;
  NSObject *databaseQueue;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  id v18[3];

  v6 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WBTabCollection_updateItems_inParentWithID___block_invoke;
  block[3] = &unk_24CB33390;
  v11 = v6;
  v12 = &v14;
  block[4] = self;
  v13 = a4;
  v8 = v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(a4) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return a4;
}

uint64_t __46__WBTabCollection_updateItems_inParentWithID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateItems:inParentWithID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)updateItems:(id)a3 inParentWithID:(unsigned int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  unsigned int v19;

  v8 = a3;
  v9 = a5;
  v10 = operator new();
  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__WBTabCollection_updateItems_inParentWithID_completionHandler___block_invoke;
  block[3] = &unk_24CB331D8;
  block[4] = self;
  v16 = v8;
  v19 = a4;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(databaseQueue, v14);

}

uint64_t __64__WBTabCollection_updateItems_inParentWithID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_updateItems:inParentWithID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64));
  v3 = *(id **)(a1 + 56);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (id)itemsInParentWithID:(unsigned int)a3 ofType:(Class)a4
{
  NSObject *databaseQueue;
  id v8;
  _QWORD block[7];
  unsigned int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke;
  block[3] = &unk_24CB33400;
  block[4] = self;
  block[5] = &v12;
  v11 = a3;
  block[6] = a4;
  dispatch_sync(databaseQueue, block);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v8;
}

void __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  int v8;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_2;
  v7[3] = &unk_24CB333D8;
  v2 = *(_QWORD *)(a1 + 32);
  v8 = *(_DWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 48);
  v7[4] = v2;
  v7[5] = v3;
  __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_2((uint64_t)v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listWithID:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bookmarkArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_3;
  v7[3] = &__block_descriptor_40_e48____WBBookmarkRepresentable__16__0__WebBookmark_8lu32l8;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__WBTabCollection_itemsInParentWithID_ofType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithBookmark:", v3);

  return v4;
}

- (void)reloadItems:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *databaseQueue;
  id v7;
  _QWORD block[4];
  id v9;
  WBTabCollection *v10;
  uint64_t v11;

  v4 = a3;
  v5 = operator new();
  MEMORY[0x212BD4870](v5, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WBTabCollection_reloadItems___block_invoke;
  block[3] = &unk_24CB33428;
  v9 = v4;
  v10 = self;
  v11 = v5;
  v7 = v4;
  dispatch_async(databaseQueue, block);

}

id *__31__WBTabCollection_reloadItems___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 40), "_collection", (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bookmark");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bookmarkWithID:", objc_msgSend(v8, "identifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBookmark:", v9);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  result = *(id **)(a1 + 48);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    return (id *)MEMORY[0x212BD4888]();
  }
  return result;
}

- (void)saveMinimumAPISyncVersionOfDescendantItemsForMovedItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmarkWithID:", objc_msgSend(v6, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveMinimumAPISyncVersionOfDescendantItemsForItem:includingAncestorItem:", v7, 0);

}

- (void)enumerateDescendantsOfItemWithID:(int)a3 usingBlock:(id)a4
{
  id v6;
  NSObject *databaseQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  int v11;
  id v12[3];

  v6 = a4;
  MEMORY[0x212BD4870](v12, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__WBTabCollection_enumerateDescendantsOfItemWithID_usingBlock___block_invoke;
  v9[3] = &unk_24CB33450;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(databaseQueue, v9);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v12);
}

void __63__WBTabCollection_enumerateDescendantsOfItemWithID_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned int *)(a1 + 48);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__WBTabCollection_enumerateDescendantsOfItemWithID_usingBlock___block_invoke_2;
  v4[3] = &unk_24CB32BA8;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateDescendantsOfBookmarkID:usingBlock:", v3, v4);

}

uint64_t __63__WBTabCollection_enumerateDescendantsOfItemWithID_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_updatePinnedTabs:(id)a3 privatePinnedTabs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v27 = objc_msgSend(v6, "count");
    v28 = 2048;
    v29 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "Update %zu pinned tabs and %zu private pinned tabs", buf, 0x16u);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "setSyncable:", 0);
        objc_msgSend(v13, "bookmark");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabCollection _readPropertiesOfBookmark:](self, "_readPropertiesOfBookmark:", v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  -[WBTabCollection _collection](self, "_collection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("bookmark"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "_updateBookmarks:inFolderWithID:", v16, objc_msgSend(v15, "pinnedTabsFolderID"));

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("bookmark"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "_updateBookmarks:inFolderWithID:", v18, objc_msgSend(v15, "privatePinnedTabsFolderID"));

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_updatePinnedTabsByProfileIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke;
    v38[3] = &unk_24CB33498;
    v5 = v4;
    v39 = v5;
    v21 = v5;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v38);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v5, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v31 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                objc_msgSend(v15, "setSyncable:", 0);
                objc_msgSend(v15, "bookmark");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBTabCollection _readPropertiesOfBookmark:](self, "_readPropertiesOfBookmark:", v16);

              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
            }
            while (v12);
          }

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v7);
    }

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    -[WBTabCollection _collection](self, "_collection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke_3;
    v23[3] = &unk_24CB33500;
    v24 = v17;
    v25 = &v26;
    v18 = v17;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v23);
    v19 = *((_BYTE *)v27 + 24) == 0;

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

void __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

id __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

void __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = objc_msgSend(*(id *)(a1 + 32), "pinnedTabsFolderIDForProfileWithIdentifier:", v11);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_50);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "_updateBookmarks:inFolderWithID:", v10, v8) ^ 1;

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

id __56__WBTabCollection__updatePinnedTabsByProfileIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "bookmark");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)pinnedTabsFolderID
{
  NSObject *databaseQueue;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  id v10[3];

  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WBTabCollection_pinnedTabsFolderID__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (int)self;
}

void __37__WBTabCollection_pinnedTabsFolderID__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "pinnedTabsFolderID");

}

- (int)privatePinnedTabsFolderID
{
  NSObject *databaseQueue;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  id v10[3];

  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WBTabCollection_privatePinnedTabsFolderID__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (int)self;
}

void __44__WBTabCollection_privatePinnedTabsFolderID__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "privatePinnedTabsFolderID");

}

- (int)pinnedTabsFolderIDForProfileWithIdentifier:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__WBTabCollection_pinnedTabsFolderIDForProfileWithIdentifier___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (int)self;
}

void __62__WBTabCollection_pinnedTabsFolderIDForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "pinnedTabsFolderIDForProfileWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (id)pinnedTabsForProfileWithIdentifier:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__WBTabCollection_pinnedTabsForProfileWithIdentifier___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __54__WBTabCollection_pinnedTabsForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pinnedTabsForProfileWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __84__WBTabCollection_frequentlyVisitedSitesForProfileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)setFrequentlyVisitedSites:(id)a3 forProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *databaseQueue;
  id v14;
  id v15;
  id v16;
  dispatch_block_t v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v8, "copy");

  v12 = operator new();
  MEMORY[0x212BD4870](v12, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__WBTabCollection_setFrequentlyVisitedSites_forProfileWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24CB33200;
  block[4] = self;
  v19 = v11;
  v21 = v10;
  v22 = v12;
  v20 = v9;
  v14 = v10;
  v15 = v9;
  v16 = v11;
  v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(databaseQueue, v17);

}

uint64_t __88__WBTabCollection_setFrequentlyVisitedSites_forProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "updateBookmarks:inFolderWithID:secureDelete:", v3, objc_msgSend(v4, "frequentlyVisitedSitesFolderIDForProfileWithIdentifier:", *(_QWORD *)(a1 + 48)), 0);

  v6 = *(id **)(a1 + 64);
  if (v6)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v6);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  return result;
}

- (id)_tabGroupsInDefaultProfile
{
  WebBookmarkListQuery *v3;
  WebBookmarkList *v4;
  void *v5;
  WebBookmarkList *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];

  v3 = -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:folderID:orderBy:usingFilter:", CFSTR("parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0"), 0, CFSTR("order_index ASC"), 0);
  v4 = [WebBookmarkList alloc];
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WebBookmarkList initWithQuery:skipOffset:collection:](v4, "initWithQuery:skipOffset:collection:", v3, 0, v5);

  -[WebBookmarkList bookmarkArray](v6, "bookmarkArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__WBTabCollection__tabGroupsInDefaultProfile__block_invoke;
  v12[3] = &unk_24CB31FB8;
  v12[4] = self;
  objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x24BDBD1A8];
  v10 = v8;

  return v10;
}

id __45__WBTabCollection__tabGroupsInDefaultProfile__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabGroupForBookmark:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    objc_msgSend(v5, "truncateToNumberOfTabs:");

  return v5;
}

- (NSArray)mutableNamedTabGroupsInDefaultProfile
{
  NSObject *databaseQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13[3];

  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WBTabCollection_mutableNamedTabGroupsInDefaultProfile__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSArray *)v4;
}

void __56__WBTabCollection_mutableNamedTabGroupsInDefaultProfile__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_tabGroupsInDefaultProfile");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)allMutableNamedTabGroupsUnsorted
{
  NSObject *databaseQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13[3];

  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WBTabCollection_allMutableNamedTabGroupsUnsorted__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSArray *)v4;
}

void __51__WBTabCollection_allMutableNamedTabGroupsUnsorted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_allMutableTabGroupsUnsorted");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_allMutableTabGroupsUnsorted
{
  void *v2;
  void *v3;
  void *v4;

  -[WBTabCollection _profiles](self, "_profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_reduceObjectsWithInitialValue:usingBlock:", v3, &__block_literal_global_60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __47__WBTabCollection__allMutableTabGroupsUnsorted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a2, "tabGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  return v4;
}

- (id)namedTabGroupsForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82E70]))
  {
    -[WBTabCollection profiles](self, "profiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __58__WBTabCollection_namedTabGroupsForProfileWithIdentifier___block_invoke;
    v13[3] = &unk_24CB33590;
    v14 = v5;
    objc_msgSend(v7, "safari_firstObjectPassingTest:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "tabGroups");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x24BDBD1A8];
    if (v9)
      v11 = (void *)v9;
    v6 = v11;

  }
  else
  {
    -[WBTabCollection namedTabGroupsInDefaultProfile](self, "namedTabGroupsInDefaultProfile");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __58__WBTabCollection_namedTabGroupsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)mutableTabGroupWithUUID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__WBTabCollection_mutableTabGroupWithUUID___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __43__WBTabCollection_mutableTabGroupWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabGroupForBookmark:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)tabGroupWithUUID:(id)a3
{
  -[WBTabCollection mutableTabGroupWithUUID:](self, "mutableTabGroupWithUUID:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tabGroupUUIDForServerID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke_2;
  v6[3] = &unk_24CB335B8;
  v2 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v2;
  __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke_2((uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __43__WBTabCollection_tabGroupUUIDForServerID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithServerID:excludeDeletedBookmarks:", *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "isFolder") & 1) != 0 && !objc_msgSend(v3, "subtype"))
  {
    objc_msgSend(v3, "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)deleteTabGroup:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__WBTabCollection_deleteTabGroup___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

uint64_t __34__WBTabCollection_deleteTabGroup___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_deleteTabGroup:leaveTombstone:", *(_QWORD *)(a1 + 40), 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_deleteTabGroup:(id)a3 leaveTombstone:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__WBTabCollection__deleteTabGroup_leaveTombstone___block_invoke;
  v11[3] = &unk_24CB332B8;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = a4;
  v9 = objc_msgSend(v7, "performDatabaseUpdatesWithTransaction:secureDelete:", v11, objc_msgSend(v8, "isPrivateBrowsing"));

  return v9;
}

uint64_t __50__WBTabCollection__deleteTabGroup_leaveTombstone___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "deleteBookmark:leaveTombstone:", v3, *(unsigned __int8 *)(a1 + 48));

  return v4;
}

- (BOOL)insertTabGroup:(id)a3 afterTabGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  id v20[3];

  v6 = a3;
  v7 = a4;
  MEMORY[0x212BD4870](v20, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WBTabCollection_insertTabGroup_afterTabGroup___block_invoke;
  block[3] = &unk_24CB33250;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(v7) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v20);
  return (char)v7;
}

void __48__WBTabCollection_insertTabGroup_afterTabGroup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__WBTabCollection_insertTabGroup_afterTabGroup___block_invoke_2;
  v5[3] = &unk_24CB33228;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "performDatabaseUpdatesWithTransaction:secureDelete:", v5, 0);

}

uint64_t __48__WBTabCollection_insertTabGroup_afterTabGroup___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(a1[4], "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "lastSelectedTabUUID");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLastSelectedChildID:", objc_msgSend(v5, "identifier"));

  objc_msgSend(a1[5], "_collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v2, 0, 1);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(a1[5], "createTopScopedBookmarkListIfNeededForTabGroup:", a1[4]);
    objc_msgSend(a1[5], "_collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bookmarkWithUUID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "_collection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bookmarkWithUUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "_collection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_reorderBookmark:afterBookmark:", v9, v12);

    v2 = (void *)v9;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)saveTabGroup:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__WBTabCollection_saveTabGroup___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __32__WBTabCollection_saveTabGroup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__WBTabCollection_saveTabGroup___block_invoke_2;
  v5[3] = &unk_24CB32008;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "performDatabaseUpdatesWithTransaction:secureDelete:", v5, 0);

}

uint64_t __32__WBTabCollection_saveTabGroup___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastSelectedTabUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLastSelectedChildID:", objc_msgSend(v5, "identifier"));

  objc_msgSend(*(id *)(a1 + 40), "_collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v2, 0, 1);

  return v7;
}

- (id)mutableTabsForTabGroup:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__WBTabCollection_mutableTabsForTabGroup___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __42__WBTabCollection_mutableTabsForTabGroup___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabsForTabGroupBookmark:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)tabsForTabGroup:(id)a3
{
  -[WBTabCollection mutableTabsForTabGroup:](self, "mutableTabsForTabGroup:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mutableTabWithUUID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__WBTabCollection_mutableTabWithUUID___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __38__WBTabCollection_mutableTabWithUUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__WBTabCollection_mutableTabWithUUID___block_invoke_2;
  v6[3] = &unk_24CB335E0;
  v2 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v2;
  __38__WBTabCollection_mutableTabWithUUID___block_invoke_2((uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

WBMutableTab *__38__WBTabCollection_mutableTabWithUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  WBMutableTab *v4;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[WBTab initWithBookmark:]([WBMutableTab alloc], "initWithBookmark:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)tabWithUUID:(id)a3
{
  -[WBTabCollection mutableTabWithUUID:](self, "mutableTabWithUUID:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)deleteTabs:(id)a3
{
  id v4;
  char v5;
  NSObject *databaseQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  id v17[3];

  v4 = a3;
  v5 = objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_66);
  MEMORY[0x212BD4870](v17, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__WBTabCollection_deleteTabs___block_invoke_2;
  block[3] = &unk_24CB332E0;
  v10 = v4;
  v11 = &v13;
  block[4] = self;
  v12 = v5;
  v7 = v4;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v17);
  return (char)self;
}

uint64_t __30__WBTabCollection_deleteTabs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPrivateBrowsing");
}

void __30__WBTabCollection_deleteTabs___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__WBTabCollection_deleteTabs___block_invoke_3;
  v4[3] = &unk_24CB32008;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "performDatabaseUpdatesWithTransaction:secureDelete:", v4, *(unsigned __int8 *)(a1 + 56));

}

uint64_t __30__WBTabCollection_deleteTabs___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_bookmarksForTabs:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_deleteBookmarks:leaveTombstone:", v2, 1);

  return v4;
}

- (BOOL)insertTab:(id)a3 inTabGroup:(id)a4 afterTab:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  id v25[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  MEMORY[0x212BD4870](v25, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  databaseQueue = self->_databaseQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __49__WBTabCollection_insertTab_inTabGroup_afterTab___block_invoke;
  v16[3] = &unk_24CB33670;
  v19 = v9;
  v20 = &v21;
  v16[4] = self;
  v17 = v8;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(databaseQueue, v16);
  LOBYTE(v10) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v25);
  return (char)v10;
}

void __49__WBTabCollection_insertTab_inTabGroup_afterTab___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__WBTabCollection_insertTab_inTabGroup_afterTab___block_invoke_2;
  v5[3] = &unk_24CB33648;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v2, "performDatabaseUpdatesWithTransaction:secureDelete:", v5, 0);

}

uint64_t __49__WBTabCollection_insertTab_inTabGroup_afterTab___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1[4], "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "_setSyncable:", objc_msgSend(a1[7], "isSyncable"));
  v6 = objc_msgSend(a1[5], "_insertBookmark:afterBookmark:inFolderWithID:", v2, v5, objc_msgSend(a1[7], "identifier"));

  return v6;
}

- (id)tabUUIDForServerID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__WBTabCollection_tabUUIDForServerID___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __38__WBTabCollection_tabUUIDForServerID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__WBTabCollection_tabUUIDForServerID___block_invoke_2;
  v6[3] = &unk_24CB335B8;
  v2 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v2;
  __38__WBTabCollection_tabUUIDForServerID___block_invoke_2((uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __38__WBTabCollection_tabUUIDForServerID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithServerID:excludeDeletedBookmarks:", *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_msgSend(v3, "isFolder") & 1) != 0 || objc_msgSend(v3, "subtype"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)insertTabs:(id)a3 inTabGroup:(id)a4 afterTab:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  id v25[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  MEMORY[0x212BD4870](v25, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  databaseQueue = self->_databaseQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke;
  v16[3] = &unk_24CB33670;
  v19 = v8;
  v20 = &v21;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_sync(databaseQueue, v16);
  LOBYTE(self) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v25);
  return (char)self;
}

void __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke_2;
  v4[3] = &unk_24CB33648;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v2, "performDatabaseUpdatesWithTransaction:secureDelete:", v4, 0);

}

uint64_t __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(a1[6], "identifier");
  objc_msgSend(a1[7], "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_67);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(v11, "setSyncable:", objc_msgSend(a1[6], "isSyncable", (_QWORD)v14));
        objc_msgSend(v11, "bookmark");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(a1[4], "_insertBookmark:afterBookmark:inFolderWithID:", v4, v10, v5) & 1) == 0)
        {

          v12 = 0;
          goto LABEL_11;
        }

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_markClean);
  v12 = 1;
  v10 = v4;
LABEL_11:

  return v12;
}

id __50__WBTabCollection_insertTabs_inTabGroup_afterTab___block_invoke_3(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

- (BOOL)updateTabs:(id)a3 inTabGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  id v21[3];

  v6 = a3;
  v7 = a4;
  -[WBTabCollection _bookmarksForTabs:syncable:](self, "_bookmarksForTabs:syncable:", v6, objc_msgSend(v7, "isSyncable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x212BD4870](v21, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WBTabCollection_updateTabs_inTabGroup___block_invoke;
  block[3] = &unk_24CB33250;
  block[4] = self;
  v14 = v8;
  v15 = v7;
  v16 = &v17;
  v10 = v7;
  v11 = v8;
  dispatch_sync(databaseQueue, block);
  LOBYTE(v8) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v21);

  return (char)v8;
}

void __41__WBTabCollection_updateTabs_inTabGroup___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "updateBookmarks:inFolderWithID:secureDelete:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "identifier"), objc_msgSend(*(id *)(a1 + 48), "isPrivateBrowsing"));

}

uint64_t __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke_72(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__WBTabCollection_flushDeletedTabsInTabGroup_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)topScopedBookmarkListForTabGroup:(id)a3
{
  id v4;
  NSObject *databaseQueue;
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
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WBTabCollection_topScopedBookmarkListForTabGroup___block_invoke;
  block[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __52__WBTabCollection_topScopedBookmarkListForTabGroup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topScopedBookmarkListForTabGroup:onQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)createTopScopedBookmarkListIfNeededForTabGroup:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "allowsScopedBookmarksInTabGroup:", v5) & 1) != 0)
    objc_msgSend(v4, "createTopScopedBookmarkListForTabGroup:", v5);

}

- (id)scopedBookmarkListWithID:(int)a3
{
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  id v16[3];

  MEMORY[0x212BD4870](v16, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__WBTabCollection_scopedBookmarkListWithID___block_invoke;
  v8[3] = &unk_24CB33758;
  v8[4] = self;
  v8[5] = &v10;
  v9 = a3;
  dispatch_sync(databaseQueue, v8);
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v16);
  return v6;
}

void __44__WBTabCollection_scopedBookmarkListWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  int v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2;
  v5[3] = &unk_24CB33730;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_DWORD *)(a1 + 48);
  __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithID:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "subtype") == 1 && (objc_msgSend(v3, "isFolder") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_bookmarkListWithFolderID:usingFilter:options:", *(unsigned int *)(a1 + 40), 0, 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_DWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForScopedBookmark:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2_cold_1(v7, (uint64_t)v9, v6);
    }

    v4 = 0;
  }

  return v4;
}

- (id)scopedBookmarkListWithID:(int)a3 filteredUsingString:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *databaseQueue;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id v21[3];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if ((_DWORD)v4 && !objc_msgSend(v6, "length"))
  {
    -[WBTabCollection scopedBookmarkListWithID:](self, "scopedBookmarkListWithID:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MEMORY[0x212BD4870](v21, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__4;
    v19 = __Block_byref_object_dispose__4;
    v20 = 0;
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke;
    block[3] = &unk_24CB33390;
    v13 = &v15;
    block[4] = self;
    v14 = v4;
    v12 = v7;
    dispatch_sync(databaseQueue, block);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v21);
  }

  return v9;
}

void __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  int v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2;
  v6[3] = &unk_24CB33780;
  v2 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_DWORD *)(a1 + 56);
  v6[1] = 3221225472;
  v7 = v2;
  __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2((uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithID:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_DWORD *)(a1 + 48) || objc_msgSend(v3, "subtype") == 1 && objc_msgSend(v3, "isFolder"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
      v4 = 24;
    else
      v4 = 8;
    objc_msgSend(*(id *)(a1 + 32), "_bookmarkListWithFolderID:usingFilter:options:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_DWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForScopedBookmark:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2_cold_1(v8, (uint64_t)v10, v7);
    }

    v5 = 0;
  }

  return v5;
}

- (id)scopedBookmarkWithUUID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  id v17[3];

  v4 = a3;
  if (v4)
  {
    MEMORY[0x212BD4870](v17, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__4;
    v15 = __Block_byref_object_dispose__4;
    v16 = 0;
    databaseQueue = self->_databaseQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke;
    v8[3] = &unk_24CB33088;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    dispatch_sync(databaseQueue, v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v17);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2;
  v6[3] = &unk_24CB337A8;
  v2 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v2;
  __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2((uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "subtype") == 1 && !objc_msgSend(v3, "isFolder"))
  {
    v7 = v3;
  }
  else
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForScopedBookmark:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2_cold_1(v5, v6, v9, v4);
    }

    v7 = 0;
  }

  return v7;
}

- (id)_descriptionForScopedBookmark:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend(v3, "subtype");
  v6 = objc_msgSend(v3, "isFolder");
  v7 = CFSTR("non-scoped");
  if (v5 == 1)
    v7 = CFSTR("scoped");
  v8 = CFSTR("bookmark");
  if (v6)
    v8 = CFSTR("folder");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)syncDataForItem:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__WBTabCollection_syncDataForItem___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __35__WBTabCollection_syncDataForItem___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncDataForBookmark:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)syncDataForItemWithID:(int)a3
{
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  id v16[3];

  MEMORY[0x212BD4870](v16, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WBTabCollection_syncDataForItemWithID___block_invoke;
  v8[3] = &unk_24CB33758;
  v8[4] = self;
  v8[5] = &v10;
  v9 = a3;
  dispatch_sync(databaseQueue, v8);
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v16);
  return v6;
}

void __41__WBTabCollection_syncDataForItemWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncDataForBookmarkID:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (WBBookmarkDatabaseSyncData)databaseSyncData
{
  NSObject *databaseQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13[3];

  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WBTabCollection_databaseSyncData__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (WBBookmarkDatabaseSyncData *)v4;
}

void __35__WBTabCollection_databaseSyncData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseSyncData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)serverIDForItemWithID:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIDForBookmarkID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)recordIDForTab:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__WBTabCollection_recordIDForTab___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __34__WBTabCollection_recordIDForTab___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__WBTabCollection_recordIDForTab___block_invoke_2;
  v6[3] = &unk_24CB337D0;
  v2 = (void *)a1[5];
  v6[4] = a1[4];
  v7 = v2;
  __34__WBTabCollection_recordIDForTab___block_invoke_2((uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __34__WBTabCollection_recordIDForTab___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDataForBookmark:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "bookmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "bookmark");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "syncDataForBookmarkID:", objc_msgSend(v10, "parentID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "record");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "zoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v9, v14);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_shareRecordForTabGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncDataForBookmark:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shareRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)shareRecordForTabGroup:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__WBTabCollection_shareRecordForTabGroup___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __42__WBTabCollection_shareRecordForTabGroup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_shareRecordForTabGroup:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)shareRecordForTabGroup:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = operator new();
  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__WBTabCollection_shareRecordForTabGroup_completionHandler___block_invoke;
  v13[3] = &unk_24CB33110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_async(databaseQueue, v12);

}

void __60__WBTabCollection_shareRecordForTabGroup_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_shareRecordForTabGroup:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x212BD4888]();
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)setHasSharedTabGroupsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *databaseQueue;
  id v7;
  dispatch_block_t v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = operator new();
  MEMORY[0x212BD4870](v5, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__WBTabCollection_setHasSharedTabGroupsWithCompletionHandler___block_invoke;
  block[3] = &unk_24CB337F8;
  v10 = v4;
  v11 = v5;
  block[4] = self;
  v7 = v4;
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(databaseQueue, v8);

}

uint64_t __62__WBTabCollection_setHasSharedTabGroupsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_setHasSharedTabGroups");
  v3 = *(id **)(a1 + 48);
  if (v3)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v3);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (BOOL)_setHasSharedTabGroups
{
  return -[WebBookmarkCollection setHasSharedTabGroups](self->_collection, "setHasSharedTabGroups");
}

- (id)activeParticipantsInTabGroup:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  id v25[3];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__4;
  v36 = __Block_byref_object_dispose__4;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = 0;
  MEMORY[0x212BD4870](v25, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WBTabCollection_activeParticipantsInTabGroup___block_invoke;
  block[3] = &unk_24CB33820;
  block[4] = self;
  v6 = v4;
  v22 = v6;
  v23 = &v32;
  v24 = &v26;
  dispatch_sync(databaseQueue, block);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v25);
  if (v33[5])
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = (id)v33[5];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v38, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isCurrentUser", (_QWORD)v17) & 1) == 0 && objc_msgSend(v12, "acceptanceStatus") == 2)
          {
            v13 = (void *)v27[5];
            objc_msgSend(v12, "safari_shareParticipantIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v13) = objc_msgSend(v13, "containsObject:", v14);

            if ((_DWORD)v13)
              objc_msgSend(v7, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v38, 16);
      }
      while (v9);
    }

    v15 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v15;
}

void __48__WBTabCollection_activeParticipantsInTabGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syncDataForBookmark:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shareRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "participants");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 40), "bookmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeParticipantsInTabGroupWithServerID:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)activeParticipantsInTab:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  WBTabCollection *v13;
  id v14;
  uint64_t *v15;
  id v16[3];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  MEMORY[0x212BD4870](v16, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __43__WBTabCollection_activeParticipantsInTab___block_invoke;
  v12 = &unk_24CB33088;
  v15 = &v17;
  v13 = self;
  v6 = v4;
  v14 = v6;
  dispatch_sync(databaseQueue, &v9);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v16);
  -[WBTabCollection _activeParticipantsFromParticipantData:](self, "_activeParticipantsFromParticipantData:", v18[5], v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __43__WBTabCollection_activeParticipantsInTab___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_participantDataForTab:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)getActiveParticipantsInTab:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = operator new();
  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke;
  v13[3] = &unk_24CB33110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_async(databaseQueue, v12);

}

void __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "_participantDataForTab:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(id **)(a1 + 56);
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    MEMORY[0x212BD4888]();
  }
  v3 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke_3;
  v8[3] = &unk_24CB33848;
  v8[4] = v4;
  v8[5] = v3;
  v5 = v3;
  v6 = v3;
  __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke_3((uint64_t)v8, (uint64_t)v7);

}

void __64__WBTabCollection_getActiveParticipantsInTab_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_activeParticipantsFromParticipantData:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (id)_participantDataForTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncDataForBookmarkID:", objc_msgSend(v6, "parentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shareRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v8, "participants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setParticipants:", v10);

    objc_msgSend(v4, "bookmark");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeParticipantsInTabWithServerID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActiveParticipantIDs:", v13);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_activeParticipantsFromParticipantData:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  objc_msgSend(v17, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v17, "participants");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v8, "isCurrentUser") & 1) == 0 && objc_msgSend(v8, "acceptanceStatus") == 2)
          {
            objc_msgSend(v8, "userIdentity");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "activeParticipantIDs");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "userRecordID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "recordName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v10, "containsObject:", v12);

            if (v13)
              objc_msgSend(v16, "addObject:", v8);

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v5);
    }

    v14 = (void *)objc_msgSend(v16, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)presenceTabUUIDForParticipantIdentifier:(id)a3 inTabGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  id v23[3];

  v6 = a3;
  v7 = a4;
  MEMORY[0x212BD4870](v23, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__WBTabCollection_presenceTabUUIDForParticipantIdentifier_inTabGroup___block_invoke;
  block[3] = &unk_24CB33250;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(databaseQueue, block);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v23);
  return v11;
}

void __70__WBTabCollection_presenceTabUUIDForParticipantIdentifier_inTabGroup___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presenceTabUUIDForParticipant:inTabGroupWithServerID:", v2, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)tabGroupMatchingShare:(id)a3 inTabGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  WBTabCollection *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__WBTabCollection_tabGroupMatchingShare_inTabGroups___block_invoke;
  v12[3] = &unk_24CB33870;
  v13 = v8;
  v14 = self;
  v9 = v8;
  objc_msgSend(v7, "safari_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __53__WBTabCollection_tabGroupMatchingShare_inTabGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "shareRecordForTabGroup:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqual:", v4);

  return v5;
}

- (BOOL)shouldUpdatePresence
{
  return -[WebBookmarkTabCollection containsCKShareRecord](self->_collection, "containsCKShareRecord");
}

- (id)_profilesQuery
{
  return -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:folderID:orderBy:usingFilter:", CFSTR("parent = 0 AND syncable = 1 AND type = 1 AND subtype = 2 AND special_id = 0"), 0, CFSTR("order_index ASC"), 0);
}

- (id)mutableProfileWithIdentifier:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__WBTabCollection_mutableProfileWithIdentifier___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __48__WBTabCollection_mutableProfileWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileForBookmark:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSString)defaultProfileIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE82E70];
}

- (id)profileWithServerID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__WBTabCollection_profileWithServerID___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __39__WBTabCollection_profileWithServerID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkWithServerID:excludeDeletedBookmarks:", *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileForBookmark:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)hasMultipleProfiles
{
  NSObject *databaseQueue;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  id v10[3];

  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WBTabCollection_hasMultipleProfiles__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (char)self;
}

void __38__WBTabCollection_hasMultipleProfiles__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_profilesQuery");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)objc_msgSend(v3, "countInCollection:", v2) > 1;

}

- (id)windowStateWithUUID:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  id v18[3];

  v4 = a3;
  MEMORY[0x212BD4870](v18, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__WBTabCollection_windowStateWithUUID___block_invoke;
  v9[3] = &unk_24CB33088;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v7;
}

void __39__WBTabCollection_windowStateWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowStateWithUUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)windowStates
{
  NSObject *databaseQueue;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13[3];

  MEMORY[0x212BD4870](v13, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WBTabCollection_windowStates__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(databaseQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
  return (NSArray *)v4;
}

void __31__WBTabCollection_windowStates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "windowStates");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)closeWindowState:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__WBTabCollection_closeWindowState___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __36__WBTabCollection_closeWindowState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "closeWindowState:", *(_QWORD *)(a1 + 40));

}

- (BOOL)deleteWindowState:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__WBTabCollection_deleteWindowState___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __37__WBTabCollection_deleteWindowState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "deleteWindowState:", *(_QWORD *)(a1 + 40));

}

- (BOOL)deleteWindowStates:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__WBTabCollection_deleteWindowStates___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __38__WBTabCollection_deleteWindowStates___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "deleteWindowStates:", *(_QWORD *)(a1 + 40));

}

- (void)deleteWindowStates:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = operator new();
  MEMORY[0x212BD4870](v8, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__WBTabCollection_deleteWindowStates_completionHandler___block_invoke;
  v13[3] = &unk_24CB33110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_async(databaseQueue, v12);

}

uint64_t __56__WBTabCollection_deleteWindowStates_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deleteWindowStates:", *(_QWORD *)(a1 + 40));

  v4 = *(id **)(a1 + 56);
  if (v4)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v4);
    MEMORY[0x212BD4888]();
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (BOOL)deleteAllWindowStates
{
  NSObject *databaseQueue;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  id v10[3];

  MEMORY[0x212BD4870](v10, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WBTabCollection_deleteAllWindowStates__block_invoke;
  block[3] = &unk_24CB32810;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(databaseQueue, block);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
  return (char)self;
}

void __40__WBTabCollection_deleteAllWindowStates__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "deleteAllWindowStates");

}

- (BOOL)saveWindowState:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  id v15[3];

  v4 = a3;
  MEMORY[0x212BD4870](v15, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__WBTabCollection_saveWindowState___block_invoke;
  v8[3] = &unk_24CB33088;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v15);
  return (char)self;
}

void __35__WBTabCollection_saveWindowState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "saveWindowState:", *(_QWORD *)(a1 + 40));

}

- (id)_bookmarksForTabs:(id)a3
{
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_98);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __37__WBTabCollection__bookmarksForTabs___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "bookmark");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_bookmarksForTabs:(id)a3 syncable:(BOOL)a4
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__WBTabCollection__bookmarksForTabs_syncable___block_invoke;
  v5[3] = &__block_descriptor_33_e28___WebBookmark_16__0__WBTab_8l;
  v6 = a4;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __46__WBTabCollection__bookmarksForTabs_syncable___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isInserted") & 1) == 0)
    objc_msgSend(v3, "_setSyncable:", *(unsigned __int8 *)(a1 + 32));
  return v3;
}

- (id)_bookmarkListWithFolderID:(int)a3 usingFilter:(id)a4 options:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  WebBookmarkListQuery *v9;
  WebBookmarkList *v10;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", v6, self->_collection, v8, a5);
  v10 = -[WebBookmarkList initWithQuery:skipOffset:collection:queue:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:queue:", v9, 0, self->_collection, self->_databaseQueue);

  return v10;
}

- (BOOL)_insertBookmark:(id)a3 afterBookmark:(id)a4 inFolderWithID:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[WBTabCollection _collection](self, "_collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "_saveAndMoveBookmark:toFolderID:", v8, v5) & 1) != 0)
  {
    objc_msgSend(v10, "bookmarkWithID:", objc_msgSend(v9, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_reorderBookmark:afterBookmark:", v8, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_readPropertiesOfBookmark:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "identifierOfBookmarkWithUUID:", v5);

  objc_msgSend(v7, "_setID:", v6);
  objc_msgSend(v7, "_setInserted:", (_DWORD)v6 != 0x7FFFFFFF);
  objc_msgSend(v7, "_setOrderIndex:", objc_msgSend(v4, "orderIndexOfBookmark:", v7));
  objc_msgSend(v7, "_setParentID:", objc_msgSend(v4, "parentIdentifierOfBookmarkWithID:", objc_msgSend(v7, "identifier")));
  objc_msgSend(v7, "setModifiedAttributes:", objc_msgSend(v7, "modifiedAttributes") | objc_msgSend(v4, "modifiedAttributesOfBookmark:", v7));

}

- (BOOL)_reorderBookmarkIntoPlace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;

  v4 = a3;
  -[WBTabCollection _collection](self, "_collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSyncable"))
  {
    objc_msgSend(v4, "syncPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v4, v6, objc_msgSend(v4, "parentID"));

  }
  else
  {
    v7 = objc_msgSend(v4, "orderIndex");
  }
  v8 = objc_msgSend(v5, "_reorderBookmark:toIndex:generateSyncPositionIfNeeded:", v4, v7, 0);

  return v8;
}

- (BOOL)lockSync
{
  void *v2;
  char v3;

  -[WBTabCollection _collection](self, "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "lockSync");

  return v3;
}

- (void)unlockSync
{
  id v2;

  -[WBTabCollection _collection](self, "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "unlockSync");

}

- (BOOL)isLockedSync
{
  void *v2;
  char v3;

  -[WBTabCollection _collection](self, "_collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "isLockedSync");

  return v3;
}

- (void)performMaintenance
{
  NSObject *databaseQueue;
  _QWORD v4[5];
  id v5[3];

  MEMORY[0x212BD4870](v5, CFSTR("com.apple.WebBookmarks.WBTabCollection"));
  databaseQueue = self->_databaseQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__WBTabCollection_performMaintenance__block_invoke;
  v4[3] = &unk_24CB31DC8;
  v4[4] = self;
  dispatch_sync(databaseQueue, v4);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v5);
}

void __37__WBTabCollection_performMaintenance__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performMaintenance");

}

- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[WBTabCollection profiles](self, "profiles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Number of Profiles: %lu\n"), objc_msgSend(v17, "count"));
  -[WBTabCollection allNamedTabGroupsUnsorted](self, "allNamedTabGroupsUnsorted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Number of Tab Groups: %lu\n"), objc_msgSend(v6, "count"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v17;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[WBTabCollection _addProfile:toLog:hidingSensitiveData:](self, "_addProfile:toLog:hidingSensitiveData:", v10, v5, v3);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabCollection namedTabGroupsForProfileWithIdentifier:](self, "namedTabGroupsForProfileWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v12);
              -[WBTabCollection _addTabGroup:toLog:hidingSensitiveData:](self, "_addTabGroup:toLog:hidingSensitiveData:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), v5, v3);
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  return v5;
}

- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *databaseQueue;
  id v29;
  void *v30;
  BOOL v31;
  void *v33;
  void *v34;
  BOOL v35;
  WBTabCollection *v36;
  _QWORD block[4];
  id v38;
  WBTabCollection *v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  BOOL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v8 = a3;
  +[WBCollectionConfiguration safariTabCollectionConfiguration](WBCollectionConfiguration, "safariTabCollectionConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  +[WBTabCollection databasePathForConfiguration:](WBTabCollection, "databasePathForConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("-shm"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = a4;
  objc_msgSend(v12, "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("-wal"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fileURLWithPath:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "safari_removeFileAtURL:error:", v8, a5) & 1) != 0
    && objc_msgSend(v18, "copyItemAtURL:toURL:error:", v11, v8, a5))
  {
    v34 = v11;
    v19 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", CFSTR("-shm"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v22;
    if ((objc_msgSend(v18, "copyItemAtURL:toURL:error:", v14, v22, a5) & 1) != 0)
    {
      v23 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v8, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("-wal"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fileURLWithPath:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v34;
      if ((objc_msgSend(v18, "copyItemAtURL:toURL:error:", v17, v26, a5) & 1) != 0)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D90]), "initWithURL:queue:", v8, v36->_databaseQueue);
        v48 = 0;
        v49 = &v48;
        v50 = 0x3032000000;
        v51 = __Block_byref_object_copy__4;
        v52 = __Block_byref_object_dispose__4;
        v53 = 0;
        v44 = 0;
        v45 = &v44;
        v46 = 0x2020000000;
        v47 = 1;
        databaseQueue = v36->_databaseQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __62__WBTabCollection_copyTabsDatabase_hidingSensitiveData_error___block_invoke;
        block[3] = &unk_24CB33948;
        v41 = &v44;
        v42 = &v48;
        v29 = v27;
        v38 = v29;
        v39 = v36;
        v43 = v35;
        v40 = &unk_24CB4B6F8;
        dispatch_sync(databaseQueue, block);
        v30 = (void *)v49[5];
        if (v30 || !*((_BYTE *)v45 + 24))
        {
          v11 = v34;
          if (a5)
            *a5 = objc_retainAutorelease(v30);
          objc_msgSend(v18, "safari_removeFileAtURL:error:", v8, 0);
          v31 = 0;
        }
        else
        {
          v31 = 1;
          v11 = v34;
        }

        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);

      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
      v11 = v34;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

void __62__WBTabCollection_copyTabsDatabase_hidingSensitiveData_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  char v38;
  int v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  char v61;
  void *v62;
  uint64_t v63;
  char v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t i;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t (**v76)(void);
  char *v77;
  id v78;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  id obj;
  _QWORD v111[4];
  id v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v111[0] = MEMORY[0x24BDAC760];
  v111[1] = 3221225472;
  v111[2] = __62__WBTabCollection_copyTabsDatabase_hidingSensitiveData_error___block_invoke_2;
  v111[3] = &unk_24CB33920;
  v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  v113 = *(_OWORD *)(a1 + 56);
  v112 = v1;
  v76 = (uint64_t (**)(void))MEMORY[0x212BD4C84](v111);
  v3 = *(void **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8);
  obj = *(id *)(v4 + 40);
  LOBYTE(v2) = objc_msgSend(v3, "openWithAccessType:error:", 2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if ((v2 & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v109 = *(id *)(v6 + 40);
    v7 = objc_msgSend(v5, "executeQuery:error:", CFSTR("BEGIN IMMEDIATE"), &v109);
    objc_storeStrong((id *)(v6 + 40), v109);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
    if ((v76[2]() & 1) != 0)
    {
      v8 = CFSTR("BEGIN IMMEDIATE");
    }
    else
    {
      v9 = (id)objc_msgSend(*(id *)(a1 + 32), "fetchQuery:", CFSTR("PRAGMA secure_delete = ON"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "windowStates");
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v71 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v106;
        v8 = CFSTR("BEGIN IMMEDIATE");
        while (2)
        {
          v12 = 0;
          v13 = v8;
          do
          {
            if (*(_QWORD *)v106 != v11)
              objc_enumerationMutation(v71);
            objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * v12), "privateTabGroup");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "identifier");

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM bookmarks WHERE parent IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = %d) OR parent = %d OR id = %d"), v15, v15, v15);
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v16 = *(void **)(a1 + 32);
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v104 = *(id *)(v17 + 40);
            v18 = objc_msgSend(v16, "executeQuery:error:", v8, &v104);
            objc_storeStrong((id *)(v17 + 40), v104);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v18;
            if ((v76[2]() & 1) != 0)
            {

              goto LABEL_14;
            }
            ++v12;
            v13 = v8;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
          if (v10)
            continue;
          break;
        }
      }
      else
      {
        v8 = CFSTR("BEGIN IMMEDIATE");
      }

      if (*(_BYTE *)(a1 + 72))
      {
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        objc_msgSend(*(id *)(a1 + 48), "keyEnumerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v19;
        v68 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
        if (v68)
        {
          v77 = 0;
          v67 = *(_QWORD *)v101;
          while (2)
          {
            for (i = 0; i != v68; ++i)
            {
              if (*(_QWORD *)v101 != v67)
                objc_enumerationMutation(v19);
              v20 = (void *)MEMORY[0x24BDBCF20];
              v73 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setWithArray:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v23 = *(void **)(a1 + 32);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select name from PRAGMA_TABLE_INFO('%@')"), v73);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "fetchQuery:", v24);
              v70 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v98 = 0u;
              v99 = 0u;
              v96 = 0u;
              v97 = 0u;
              v25 = v70;
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v96, v117, 16);
              if (v26)
              {
                v27 = *(_QWORD *)v97;
                while (2)
                {
                  for (j = 0; j != v26; ++j)
                  {
                    if (*(_QWORD *)v97 != v27)
                      objc_enumerationMutation(v25);
                    objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * j), "stringAtIndex:", 0);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v29)
                    {
                      v39 = 0;
                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
                      v31 = v25;
                      goto LABEL_46;
                    }
                    if ((objc_msgSend(v22, "containsObject:", v29) & 1) == 0)
                    {
                      objc_msgSend(v74, "addObject:", v29);
                      ++v77;
                    }

                  }
                  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v96, v117, 16);
                  if (v26)
                    continue;
                  break;
                }
              }

              objc_msgSend(v25, "statement");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "invalidate");

              v94 = 0u;
              v95 = 0u;
              v92 = 0u;
              v93 = 0u;
              v31 = v74;
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v92, v116, 16);
              if (v32)
              {
                v33 = *(_QWORD *)v93;
                while (2)
                {
                  v34 = 0;
                  v35 = v8;
                  do
                  {
                    if (*(_QWORD *)v93 != v33)
                      objc_enumerationMutation(v31);
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = 'redacted'"), v73, *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v34));
                    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    v36 = *(void **)(a1 + 32);
                    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                    v91 = *(id *)(v37 + 40);
                    v38 = objc_msgSend(v36, "executeQuery:error:", v8, &v91);
                    objc_storeStrong((id *)(v37 + 40), v91);
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v38;
                    if ((v76[2]() & 1) != 0)
                    {
                      v39 = 0;
                      goto LABEL_46;
                    }
                    ++v34;
                    v35 = v8;
                  }
                  while (v32 != v34);
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v92, v116, 16);
                  v39 = 1;
                  if (v32)
                    continue;
                  break;
                }
              }
              else
              {
                v39 = 1;
              }
LABEL_46:

              if (!v39)
              {

                goto LABEL_14;
              }
              v19 = v69;
            }
            v68 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
            if (v68)
              continue;
            break;
          }
        }
        else
        {
          v77 = 0;
        }

        objc_msgSend(*(id *)(a1 + 48), "allValues");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (unint64_t)v77 < objc_msgSend(v40, "count");

        if (v41)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "fetchQuery:", CFSTR("SELECT name FROM sqlite_master where type='table'"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 0u;
          v88 = 0u;
          v89 = 0u;
          v87 = 0u;
          v78 = v75;
          v43 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
          if (v43)
          {
            v44 = *(_QWORD *)v88;
            while (2)
            {
              for (k = 0; k != v43; ++k)
              {
                if (*(_QWORD *)v88 != v44)
                  objc_enumerationMutation(v78);
                objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * k), "stringAtIndex:", 0);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v46)
                {
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

                  goto LABEL_79;
                }
                objc_msgSend(v42, "addObject:", v46);

              }
              v43 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
              if (v43)
                continue;
              break;
            }
          }

          objc_msgSend(v78, "statement");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "invalidate");

          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v48 = v42;
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v83, v114, 16);
          if (v49)
          {
            v50 = *(_QWORD *)v84;
            while (2)
            {
              for (m = 0; m != v49; ++m)
              {
                if (*(_QWORD *)v84 != v50)
                  objc_enumerationMutation(v48);
                v52 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * m);
                objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v52);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                if (v53)
                {

                }
                else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("sqlite_sequence")) & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), v52);
                  v54 = (const __CFString *)objc_claimAutoreleasedReturnValue();

                  v55 = *(void **)(a1 + 32);
                  v56 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                  v82 = *(id *)(v56 + 40);
                  v57 = objc_msgSend(v55, "executeQuery:error:", v54, &v82);
                  objc_storeStrong((id *)(v56 + 40), v82);
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v57;
                  if ((v76[2]() & 1) != 0)
                  {

                    goto LABEL_81;
                  }
                  v8 = (__CFString *)v54;
                }
              }
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v83, v114, 16);
              if (v49)
                continue;
              break;
            }
          }

          v58 = objc_msgSend(v48, "count");
          if (v58 <= objc_msgSend(*(id *)(a1 + 48), "count"))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_79:
            v54 = v8;
          }
          else
          {

            v59 = *(void **)(a1 + 32);
            v60 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v81 = *(id *)(v60 + 40);
            v61 = objc_msgSend(v59, "executeQuery:error:", CFSTR("COMMIT"), &v81);
            objc_storeStrong((id *)(v60 + 40), v81);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v61;
            if ((v76[2]() & 1) != 0)
            {
              v54 = CFSTR("COMMIT");
            }
            else
            {
              v62 = *(void **)(a1 + 32);
              v63 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
              v80 = *(id *)(v63 + 40);
              v64 = objc_msgSend(v62, "executeQuery:error:", CFSTR("VACUUM"), &v80);
              objc_storeStrong((id *)(v63 + 40), v80);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v64;
              if ((v76[2]() & 1) != 0)
              {
                v54 = CFSTR("VACUUM");
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 32), "fetchQuery:", CFSTR("PRAGMA wal_checkpoint(TRUNCATE)"));
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "nextObject");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v66, "intAtIndex:", 0) == 0;
                objc_msgSend(*(id *)(a1 + 32), "close");

                v54 = CFSTR("PRAGMA wal_checkpoint(TRUNCATE)");
              }
            }
          }
LABEL_81:

          v8 = (__CFString *)v54;
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "close");
      }
LABEL_14:

    }
  }

}

uint64_t __62__WBTabCollection_copyTabsDatabase_hidingSensitiveData_error___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    return 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "close");
  return 1;
}

- (void)_addProfile:(id)a3 toLog:(id)a4 hidingSensitiveData:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a3;
  v7 = a4;
  if (v5)
    objc_msgSend(v9, "privacyPreservingDescription");
  else
    objc_msgSend(v9, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@\n\n"), v8);

}

- (void)_addTabGroup:(id)a3 toLog:(id)a4 hidingSensitiveData:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v23 = a4;
  v21 = v7;
  if (v5)
    objc_msgSend(v7, "privacyPreservingDescription");
  else
    objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("%@\n"), v8);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v7, "tabs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x24BDD17C8];
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "url");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "absoluteString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "safari_urlHashesOfComponents");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("hashed url: %@, "), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "url");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("title: %@, url: %@, "), v14, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v12, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bookmark");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "serverID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "appendFormat:", CFSTR("Tab, %@identifier: %@, server_id: %@\n"), v17, v18, v20);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  objc_msgSend(v23, "appendString:", CFSTR("\n\n"));
}

- (WebBookmarkTabCollection)tabCollection
{
  return self->_collection;
}

- (unint64_t)maximumTabsPerGroup
{
  return self->_maximumTabsPerGroup;
}

- (void)setMaximumTabsPerGroup:(unint64_t)a3
{
  self->_maximumTabsPerGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
}

- (void)initWithConfiguration:(uint64_t)a3 openDatabase:(uint64_t)a4 checkIntegrity:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Unable to instantiate tab collection because the specified collection type is not of tabs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_collectionWithConfiguration:(uint64_t)a3 checkIntegrity:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Failed to instantiate tab collection because the underlying collection failed to set up", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_collectionWithConfiguration:(uint64_t)a3 checkIntegrity:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Failed to instantiate tab collection because we failed to lock sync", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __39__WBTabCollection__bookmarksFromItems___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_fault_impl(&dword_211022000, a2, OS_LOG_TYPE_FAULT, "Skipping item %{private}@ because underlying bookmark is nil", (uint8_t *)&v2, 0xCu);
}

void __58__WBTabCollection_updateTabsInTabGroup_completionHandler___block_invoke_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_211022000, log, OS_LOG_TYPE_FAULT, "Not updating tab %{public}@ in tab group %{public}@ because they are different types", buf, 0x16u);

  OUTLINED_FUNCTION_4();
}

void __44__WBTabCollection_scopedBookmarkListWithID___block_invoke_2_cold_1(void *a1, uint64_t a2, int a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_3((uint64_t)a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_3_1(&dword_211022000, "Could not load a scoped bookmark folder with the id(%d) of a %@.", v4, v5);

  OUTLINED_FUNCTION_4();
}

void __64__WBTabCollection_scopedBookmarkListWithID_filteredUsingString___block_invoke_2_cold_1(void *a1, uint64_t a2, int a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_3((uint64_t)a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_3_1(&dword_211022000, "Could not filter scoped bookmark folder with the id(%d) of a %@.", v4, v5);

  OUTLINED_FUNCTION_4();
}

void __42__WBTabCollection_scopedBookmarkWithUUID___block_invoke_2_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_211022000, log, OS_LOG_TYPE_ERROR, "Could not load a scoped bookmark with uuid(%{public}@) of a %@.", buf, 0x16u);

  OUTLINED_FUNCTION_4();
}

@end
