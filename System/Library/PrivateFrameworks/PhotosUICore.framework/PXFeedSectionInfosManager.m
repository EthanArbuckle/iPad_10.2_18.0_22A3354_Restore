@implementation PXFeedSectionInfosManager

- (PXFeedSectionInfosManager)initWithPhotoLibrary:(id)a3 configurationBlock:(id)a4
{
  id v8;
  void (**v9)(id, PXFeedSectionInfosManager *);
  PXFeedSectionInfosManager *v10;
  PXFeedSectionInfosManager *v11;
  NSDate *earliestDate;
  NSObject *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *pendingFeedEntriesChangeNotifications;
  NSMutableArray *v17;
  NSMutableArray *pendingCommentsChangeNotifications;
  NSMutableArray *v19;
  NSMutableArray *pendingAssetsChangeNotifications;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, PXFeedSectionInfosManager *))a4;
  v24.receiver = self;
  v24.super_class = (Class)PXFeedSectionInfosManager;
  v10 = -[PXFeedSectionInfosManager init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibrary, a3);
    earliestDate = v11->_earliestDate;
    v11->_entryFilter = 0;
    v11->_earliestDate = 0;

    v11->_fetchLimit = 0;
    if (v9)
      v9[2](v9, v11);
    PLCloudFeedGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    -[PXFeedSectionInfosManager _rebuildSectionInfos](v11, "_rebuildSectionInfos");
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingFeedEntriesChangeNotifications = v11->_pendingFeedEntriesChangeNotifications;
    v11->_pendingFeedEntriesChangeNotifications = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingCommentsChangeNotifications = v11->_pendingCommentsChangeNotifications;
    v11->_pendingCommentsChangeNotifications = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingAssetsChangeNotifications = v11->_pendingAssetsChangeNotifications;
    v11->_pendingAssetsChangeNotifications = v19;

    objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addCloudFeedEntriesObserver:", v11);
    objc_msgSend(v21, "addCloudCommentsChangeObserver:asset:", v11, 0);
    objc_msgSend(v21, "addAssetChangeObserver:", v11);
    objc_msgSend(v21, "addShouldReloadObserver:", v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v11, sel__didFinishPostingNotifications_, *MEMORY[0x1E0D71CF8], 0);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCloudFeedEntriesObserver:", self);
  objc_msgSend(v3, "removeCloudCommentsChangeObserver:asset:", self, 0);
  objc_msgSend(v3, "removeAssetChangeObserver:", self);
  objc_msgSend(v3, "removeShouldReloadObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D71CF8], 0);

  v5.receiver = self;
  v5.super_class = (Class)PXFeedSectionInfosManager;
  -[PXFeedSectionInfosManager dealloc](&v5, sel_dealloc);
}

- (int64_t)numberOfSectionInfos
{
  return -[NSMutableArray count](self->_sectionInfos, "count");
}

- (BOOL)hasEnoughCloudFeedAssetEntriesToDisplay
{
  NSMutableArray *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_sectionInfos;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "cloudFeedEntry", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "entryAssets");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 += objc_msgSend(v8, "count");

          if (v4 >= 4)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }

      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (id)sectionInfoAtIndex:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSMutableArray count](self->_sectionInfos, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sectionInfos, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)sectionInfosAtIndexes:(id)a3
{
  return (id)-[NSMutableArray objectsAtIndexes:](self->_sectionInfos, "objectsAtIndexes:", a3);
}

- (int64_t)indexOfSectionInfo:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_sectionInfos, "indexOfObject:", a3);
}

- (id)sectionInfoWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_sectionInfos;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "transientIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)indexOfSectionInfoForCloudFeedEntry:(id)a3
{
  NSMutableDictionary *sectionInfosByCloudFeedEntry;
  void *v5;
  void *v6;
  int64_t v7;

  sectionInfosByCloudFeedEntry = self->_sectionInfosByCloudFeedEntry;
  objc_msgSend(a3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sectionInfosByCloudFeedEntry, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NSMutableArray indexOfObject:](self->_sectionInfos, "indexOfObject:", v6);
  return v7;
}

- (id)indexesOfUnloadedSectionInfosAtIndexes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSMutableArray *sectionInfos;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0CB3788];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  sectionInfos = self->_sectionInfos;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PXFeedSectionInfosManager_indexesOfUnloadedSectionInfosAtIndexes___block_invoke;
  v10[3] = &unk_1E5148290;
  v8 = v6;
  v11 = v8;
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](sectionInfos, "enumerateObjectsAtIndexes:options:usingBlock:", v5, 0, v10);

  return v8;
}

- (void)loadSectionInfosAtIndexes:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSMutableArray *sectionInfos;
  id v8;
  int64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSMutableDictionary *sectionInfosByCloudFeedEntry;
  void *v23;
  NSObject *v24;
  PXFeedSectionInfosChange *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  sectionInfos = self->_sectionInfos;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __55__PXFeedSectionInfosManager_loadSectionInfosAtIndexes___block_invoke;
  v35[3] = &unk_1E5148290;
  v8 = v6;
  v36 = v8;
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](sectionInfos, "enumerateObjectsAtIndexes:options:usingBlock:", v4, 0, v35);
  v9 = -[PXFeedSectionInfosManager entryFilter](self, "entryFilter");
  if (objc_msgSend(v4, "containsIndex:", 0))
  {
    if (-[PXFeedSectionInfosManager fetchLimit](self, "fetchLimit"))
    {
      v10 = -[NSMutableArray count](self->_sectionInfos, "count");
      if (v10 < -[PXFeedSectionInfosManager fetchLimit](self, "fetchLimit") && (v9 | 2) != 6)
      {
        v27 = v5;
        v28 = v4;
        PLCloudFeedGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v12;
          _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "will load next batch of sections %@", buf, 0xCu);

        }
        v33 = 0;
        v34 = 0;
        -[PXFeedSectionInfosManager _getEarliestDate:mostRecentEntries:forBatchWithLatestDate:](self, "_getEarliestDate:mostRecentEntries:forBatchWithLatestDate:", &v34, &v33, self->_earliestDate);
        v13 = v34;
        v14 = v33;
        -[PXFeedSectionInfosManager setEarliestDate:](self, "setEarliestDate:", v13);
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v30 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              +[PXFeedSectionInfo sectionInfoWithCloudFeedEntry:](PXFeedSectionInfo, "sectionInfoWithCloudFeedEntry:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              sectionInfosByCloudFeedEntry = self->_sectionInfosByCloudFeedEntry;
              objc_msgSend(v20, "objectID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](sectionInfosByCloudFeedEntry, "setObject:forKey:", v21, v23);

              -[NSMutableArray insertObject:atIndex:](self->_sectionInfos, "insertObject:atIndex:", v21, 0);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v17);
        }

        v5 = v27;
        objc_msgSend(v27, "addIndexesInRange:", 0, objc_msgSend(v15, "count"));
        objc_msgSend(v8, "pl_adjustIndexesForInsertions:", v27);
        PLCloudFeedGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEBUG, "did load next batch of sections", buf, 2u);
        }

        v4 = v28;
      }
    }
  }
  if (objc_msgSend(v5, "count") || objc_msgSend(v8, "count"))
  {
    v25 = objc_alloc_init(PXFeedSectionInfosChange);
    -[PXFeedSectionInfosChange setInsertedIndexes:](v25, "setInsertedIndexes:", v5);
    -[PXFeedSectionInfosChange setUpdatedIndexes:](v25, "setUpdatedIndexes:", v8);
    -[PXFeedSectionInfosManager delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "feedSectionInfosManager:sectionInfosDidChange:", self, v25);

  }
}

- (void)reconfigure:(id)a3
{
  (*((void (**)(id, PXFeedSectionInfosManager *))a3 + 2))(a3, self);
  -[PXFeedSectionInfosManager _rebuildSectionInfos](self, "_rebuildSectionInfos");
}

- (BOOL)reconfigureToIncludeCloudFeedEntry:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a3, "entryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray lastObject](self->_sectionInfos, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudFeedEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5 && v8)
  {
    if (objc_msgSend(v5, "compare:", v8) == -1)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __64__PXFeedSectionInfosManager_reconfigureToIncludeCloudFeedEntry___block_invoke;
      v11[3] = &unk_1E5142C38;
      v12 = v5;
      -[PXFeedSectionInfosManager reconfigure:](self, "reconfigure:", v11);

      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (int64_t)numberOfInvitationsReceived
{
  void *v2;
  int64_t v3;

  -[PXFeedSectionInfosManager indexesOfInvitationsReceivedSectionInfos](self, "indexesOfInvitationsReceivedSectionInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)indexesOfInvitationsReceivedSectionInfos
{
  id v3;
  NSMutableArray *sectionInfos;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  sectionInfos = self->_sectionInfos;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PXFeedSectionInfosManager_indexesOfInvitationsReceivedSectionInfos__block_invoke;
  v7[3] = &unk_1E5148290;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](sectionInfos, "enumerateObjectsWithOptions:usingBlock:", 2, v7);

  return v5;
}

- (void)_rebuildSectionInfos
{
  NSObject *v3;
  void *v4;
  PLPhotoLibrary *photoLibrary;
  id v6;
  uint64_t v7;
  NSMutableArray *v8;
  NSMutableArray *sectionInfos;
  NSMutableDictionary *v10;
  NSMutableDictionary *sectionInfosByCloudFeedEntry;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  PXFeedSectionInfosChange *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  uint8_t *v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  id v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  PLCloudFeedGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "will rebuild section infos", buf, 2u);
  }

  -[PXFeedSectionInfosManager earliestDate](self, "earliestDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  if (v4)
  {
    *(_QWORD *)buf = 0;
    v32 = buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__86417;
    v35 = __Block_byref_object_dispose__86418;
    v36 = 0;
    photoLibrary = self->_photoLibrary;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __49__PXFeedSectionInfosManager__rebuildSectionInfos__block_invoke;
    v28[3] = &unk_1E513FD98;
    v30 = buf;
    v28[4] = self;
    v29 = v4;
    -[PLPhotoLibrary performBlockAndWait:](photoLibrary, "performBlockAndWait:", v28);
    v6 = *((id *)v32 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v37 = 0;
    v38 = 0;
    -[PXFeedSectionInfosManager _getEarliestDate:mostRecentEntries:forBatchWithLatestDate:](self, "_getEarliestDate:mostRecentEntries:forBatchWithLatestDate:", &v38, &v37, 0);
    v7 = v38;
    v6 = v37;
    -[PXFeedSectionInfosManager setEarliestDate:](self, "setEarliestDate:", v7);
  }
  v8 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  sectionInfos = self->_sectionInfos;
  self->_sectionInfos = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sectionInfosByCloudFeedEntry = self->_sectionInfosByCloudFeedEntry;
  self->_sectionInfosByCloudFeedEntry = v10;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v6, "reverseObjectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        +[PXFeedSectionInfo sectionInfoWithCloudFeedEntry:](PXFeedSectionInfo, "sectionInfoWithCloudFeedEntry:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = self->_sectionInfosByCloudFeedEntry;
        objc_msgSend(v16, "objectID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v17, v19);

        -[NSMutableArray addObject:](self->_sectionInfos, "addObject:", v17);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
    }
    while (v13);
  }

  v20 = objc_alloc_init(PXFeedSectionInfosChange);
  -[PXFeedSectionInfosChange setShouldReload:](v20, "setShouldReload:", 1);
  -[PXFeedSectionInfosManager delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "feedSectionInfosManager:sectionInfosDidChange:", self, v20);

  PLCloudFeedGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEBUG, "did rebuild section infos", buf, 2u);
  }

}

- (void)_getEarliestDate:(id *)a3 mostRecentEntries:(id *)a4 forBatchWithLatestDate:(id)a5
{
  id v8;
  int64_t v9;
  uint64_t v10;
  PLPhotoLibrary *photoLibrary;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a5;
  v9 = -[PXFeedSectionInfosManager entryFilter](self, "entryFilter");
  v25 = 0;
  v26 = &v25;
  if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    v10 = 0;
  else
    v10 = 75;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__86417;
  v29 = __Block_byref_object_dispose__86418;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__86417;
  v23 = __Block_byref_object_dispose__86418;
  v24 = 0;
  photoLibrary = self->_photoLibrary;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PXFeedSectionInfosManager__getEarliestDate_mostRecentEntries_forBatchWithLatestDate___block_invoke;
  v13[3] = &unk_1E5123E58;
  v13[4] = self;
  v12 = v8;
  v17 = v10;
  v18 = v9;
  v14 = v12;
  v15 = &v25;
  v16 = &v19;
  -[PLPhotoLibrary performBlockAndWait:](photoLibrary, "performBlockAndWait:", v13);
  if (a3)
    *a3 = objc_retainAutorelease((id)v26[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

}

- (void)cloudFeedEntriesDidChange:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = -[PXFeedSectionInfosManager entryFilter](self, "entryFilter");
  if ((objc_msgSend(v13, "shouldReload") & 1) != 0 || !v4)
  {
    -[NSMutableArray addObject:](self->_pendingFeedEntriesChangeNotifications, "addObject:", v13);
  }
  else
  {
    objc_msgSend(v13, "insertedEntries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v13, "updatedEntries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v13, "deletedEntries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0D71618], "notificationPredicateForFilter:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filterUsingPredicate:", v11);
    objc_msgSend(v8, "filterUsingPredicate:", v11);
    objc_msgSend(v10, "filterUsingPredicate:", v11);
    objc_msgSend(MEMORY[0x1E0D71610], "notificationWithInsertedEntries:updatedEntries:deletedEntries:", v6, v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_pendingFeedEntriesChangeNotifications, "addObject:", v12);

  }
}

- (void)cloudCommentsDidChange:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[PXFeedSectionInfosManager entryFilter](self, "entryFilter") & 0xFFFFFFFFFFFFFFFDLL) != 1)
    -[NSMutableArray addObject:](self->_pendingCommentsChangeNotifications, "addObject:", v4);

}

- (void)assetsDidChange:(id)a3
{
  -[NSMutableArray addObject:](self->_pendingAssetsChangeNotifications, "addObject:", a3);
}

- (void)shouldReload:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLCloudFeedGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[NSMutableArray removeAllObjects](self->_pendingFeedEntriesChangeNotifications, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pendingCommentsChangeNotifications, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pendingAssetsChangeNotifications, "removeAllObjects");
  -[PXFeedSectionInfosManager _rebuildSectionInfos](self, "_rebuildSectionInfos");
}

- (void)_didFinishPostingNotifications:(id)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PLCloudFeedGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableArray count](self->_pendingFeedEntriesChangeNotifications, "count");
    v8 = -[NSMutableArray count](self->_pendingCommentsChangeNotifications, "count");
    v9 = -[NSMutableArray count](self->_pendingAssetsChangeNotifications, "count");
    v15 = 138544130;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ (pendingFeedEntries: %lu, pendingCommentsChange: %lu, pendingAssetsChange: %lu)", (uint8_t *)&v15, 0x2Au);

  }
  if (-[NSMutableArray count](self->_pendingFeedEntriesChangeNotifications, "count")
    || -[NSMutableArray count](self->_pendingCommentsChangeNotifications, "count")
    || -[NSMutableArray count](self->_pendingAssetsChangeNotifications, "count"))
  {
    v10 = (void *)-[NSMutableArray copy](self->_pendingFeedEntriesChangeNotifications, "copy");
    v11 = (void *)-[NSMutableArray copy](self->_pendingCommentsChangeNotifications, "copy");
    v12 = (void *)-[NSMutableArray copy](self->_pendingAssetsChangeNotifications, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingFeedEntriesChangeNotifications, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_pendingCommentsChangeNotifications, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_pendingAssetsChangeNotifications, "removeAllObjects");
    v13 = -[PXFeedSectionInfosManager _shouldPerformFullReloadForFeedEntriesChangeNotifications:commentsChangeNotifications:](self, "_shouldPerformFullReloadForFeedEntriesChangeNotifications:commentsChangeNotifications:", v10, v11);
    PLCloudFeedGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = 67109120;
      LODWORD(v16) = v13;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "needsFullReload=%i", (uint8_t *)&v15, 8u);
    }

    if (v13)
      -[PXFeedSectionInfosManager _rebuildSectionInfos](self, "_rebuildSectionInfos");
    else
      -[PXFeedSectionInfosManager _updateSectionInfosForFeedEntriesChangeNotifications:commentsChangeNotifications:assetsChangeNotifications:](self, "_updateSectionInfosForFeedEntriesChangeNotifications:commentsChangeNotifications:assetsChangeNotifications:", v10, v11, v12);

  }
}

- (BOOL)_shouldPerformFullReloadForFeedEntriesChangeNotifications:(id)a3 commentsChangeNotifications:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[PXFeedSectionInfosManager entryFilter](self, "entryFilter") == 4)
  {
    PLCloudFeedGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "filter is \"Inbox\", always performing full reload", buf, 2u);
    }
LABEL_16:
    LOBYTE(v7) = 1;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "shouldReload", (_QWORD)v12))
          {
            PLCloudFeedGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
            }

            goto LABEL_16;
          }
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
  }

  return v7;
}

- (void)_updateSectionInfosForFeedEntriesChangeNotifications:(id)a3 commentsChangeNotifications:(id)a4 assetsChangeNotifications:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  PLPhotoLibrary *photoLibrary;
  id v23;
  id v24;
  id v25;
  id v26;
  PXFeedSectionInfosChange *v27;
  PXFeedSectionInfosChange *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  const char *v38;
  id v39;
  void *v40;
  id v41;
  NSMutableDictionary *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  NSMutableDictionary *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  NSMutableDictionary *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t *v65;
  __int128 *p_buf;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint8_t v78[4];
  void *v79;
  __int128 buf;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PLCloudFeedGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "will %@", (uint8_t *)&buf, 0xCu);

  }
  -[PXFeedSectionInfosManager earliestDate](self, "earliestDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v49 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXFeedSectionInfosManager _sectionInfoSortingComparator](self, "_sectionInfoSortingComparator");
  v18 = objc_claimAutoreleasedReturnValue();
  v42 = self->_sectionInfosByCloudFeedEntry;
  v44 = (void *)-[NSMutableArray mutableCopy](self->_sectionInfos, "mutableCopy");
  v40 = (void *)v18;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v19 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v38 = a2;
  v21 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__86417;
  v83 = __Block_byref_object_dispose__86418;
  v84 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__86417;
  v72 = __Block_byref_object_dispose__86418;
  v73 = 0;
  photoLibrary = self->_photoLibrary;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __136__PXFeedSectionInfosManager__updateSectionInfosForFeedEntriesChangeNotifications_commentsChangeNotifications_assetsChangeNotifications___block_invoke;
  v51[3] = &unk_1E5123E80;
  v32 = v9;
  v52 = v32;
  v34 = v17;
  v53 = v34;
  v36 = v49;
  v54 = v36;
  v50 = v42;
  v55 = v50;
  v43 = v47;
  v56 = v43;
  v46 = v45;
  v57 = v46;
  v23 = v44;
  v58 = v23;
  v24 = v19;
  v59 = v24;
  v48 = v40;
  v64 = v48;
  v25 = v20;
  v60 = v25;
  v26 = v21;
  v61 = v26;
  v65 = &v74;
  v39 = v10;
  v62 = v39;
  p_buf = &buf;
  v41 = v11;
  v63 = v41;
  v67 = &v68;
  -[PLPhotoLibrary performBlockAndWait:](photoLibrary, "performBlockAndWait:", v51);
  objc_storeStrong((id *)&self->_sectionInfos, v44);
  v27 = objc_alloc_init(PXFeedSectionInfosChange);
  v28 = v27;
  if (*((_BYTE *)v75 + 24))
  {
    -[PXFeedSectionInfosChange setShouldReload:](v27, "setShouldReload:", 1, v32, v34, v36);
  }
  else
  {
    -[PXFeedSectionInfosChange setDeletedIndexes:](v27, "setDeletedIndexes:", v24, v32, v34, v36);
    -[PXFeedSectionInfosChange setInsertedIndexes:](v28, "setInsertedIndexes:", v25);
    -[PXFeedSectionInfosChange setUpdatedIndexes:](v28, "setUpdatedIndexes:", v26);
    -[PXFeedSectionInfosChange setSectionInfosWithCommentChanges:](v28, "setSectionInfosWithCommentChanges:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    -[PXFeedSectionInfosChange setUpdatedAssets:](v28, "setUpdatedAssets:", v69[5]);
  }
  -[PXFeedSectionInfosManager delegate](self, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "feedSectionInfosManager:sectionInfosDidChange:", self, v28);

  PLCloudFeedGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v78 = 138412290;
    v79 = v31;
    _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEBUG, "did %@", v78, 0xCu);

  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v74, 8);

}

- (id)_sectionInfoSortingComparator
{
  return (id)objc_msgSend(&__block_literal_global_86411, "copy");
}

- (PXFeedSectionInfosManager)initWithPhotoLibraryForTesting:(id)a3 filter:(int64_t)a4
{
  id v7;
  PXFeedSectionInfosManager *v8;
  PXFeedSectionInfosManager *v9;
  PXFeedTestInvitationSectionInfo *v10;
  PXFeedTestInvitationSectionInfo *v11;
  PXFeedTestCommentsSectionInfo *v12;
  PXFeedTestCommentsSectionInfo *v13;
  PXFeedTestAssetsSectionInfo *v14;
  PXFeedTestAssetsSectionInfo *v15;
  PXFeedTestAssetsSectionInfo *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *sectionInfos;
  objc_super v25;
  _QWORD v26[6];
  _QWORD v27[2];
  _QWORD v28[4];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXFeedSectionInfosManager;
  v8 = -[PXFeedSectionInfosManager init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a3);
    v9->_entryFilter = a4;
    v10 = -[PXFeedTestSectionInfo initWithPhotoLibrary:]([PXFeedTestInvitationSectionInfo alloc], "initWithPhotoLibrary:", v9->_photoLibrary);
    v11 = -[PXFeedTestSectionInfo initWithPhotoLibrary:]([PXFeedTestInvitationSectionInfo alloc], "initWithPhotoLibrary:", v9->_photoLibrary);
    v12 = -[PXFeedTestSectionInfo initWithPhotoLibrary:]([PXFeedTestCommentsSectionInfo alloc], "initWithPhotoLibrary:", v9->_photoLibrary);
    v13 = -[PXFeedTestSectionInfo initWithPhotoLibrary:]([PXFeedTestCommentsSectionInfo alloc], "initWithPhotoLibrary:", v9->_photoLibrary);
    v14 = -[PXFeedTestAssetsSectionInfo initWithPhotoLibrary:]([PXFeedTestAssetsSectionInfo alloc], "initWithPhotoLibrary:", v9->_photoLibrary);
    v15 = -[PXFeedTestAssetsSectionInfo initWithPhotoLibrary:]([PXFeedTestAssetsSectionInfo alloc], "initWithPhotoLibrary:", v9->_photoLibrary);
    v16 = v15;
    switch(v9->_entryFilter)
    {
      case 0:
      case 2:
      case 5:
      case 6:
        v17 = (void *)MEMORY[0x1E0C99DE8];
        v26[0] = v13;
        v26[1] = v15;
        v26[2] = v12;
        v26[3] = v14;
        v26[4] = v11;
        v26[5] = v10;
        v18 = (void *)MEMORY[0x1E0C99D20];
        v19 = v26;
        v20 = 6;
        goto LABEL_9;
      case 1:
        v17 = (void *)MEMORY[0x1E0C99DE8];
        v29[0] = v11;
        v29[1] = v10;
        v18 = (void *)MEMORY[0x1E0C99D20];
        v19 = v29;
        goto LABEL_8;
      case 3:
        v17 = (void *)MEMORY[0x1E0C99DE8];
        v28[0] = v15;
        v28[1] = v14;
        v28[2] = v11;
        v28[3] = v10;
        v18 = (void *)MEMORY[0x1E0C99D20];
        v19 = v28;
        v20 = 4;
        goto LABEL_9;
      case 4:
        v17 = (void *)MEMORY[0x1E0C99DE8];
        v27[0] = v12;
        v27[1] = v13;
        v18 = (void *)MEMORY[0x1E0C99D20];
        v19 = v27;
LABEL_8:
        v20 = 2;
LABEL_9:
        objc_msgSend(v18, "arrayWithObjects:count:", v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "arrayWithArray:", v22);
        v21 = objc_claimAutoreleasedReturnValue();

        break;
      default:
        v21 = 0;
        break;
    }
    sectionInfos = v9->_sectionInfos;
    v9->_sectionInfos = (NSMutableArray *)v21;

  }
  return v9;
}

- (int64_t)entryFilter
{
  return self->_entryFilter;
}

- (void)setEntryFilter:(int64_t)a3
{
  self->_entryFilter = a3;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestDate, a3);
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (PXFeedSectionInfosManagerDelegate)delegate
{
  return (PXFeedSectionInfosManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_earliestDate, 0);
  objc_storeStrong((id *)&self->_pendingAssetsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingCommentsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingFeedEntriesChangeNotifications, 0);
  objc_storeStrong((id *)&self->_sectionInfosByCloudFeedEntry, 0);
  objc_storeStrong((id *)&self->_sectionInfos, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __58__PXFeedSectionInfosManager__sectionInfoSortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a2, "cloudFeedEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudFeedEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "entryPriority");
  v8 = objc_msgSend(v6, "entryPriority");
  if (v7 >= v8)
  {
    if (v7 <= v8)
    {
      objc_msgSend(v5, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entryDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "compare:", v11);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void __136__PXFeedSectionInfosManager__updateSectionInfosForFeedEntriesChangeNotifications_commentsChangeNotifications_assetsChangeNotifications___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t jj;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t kk;
  void *v96;
  void *v97;
  id obj;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id *v103;
  id *v104;
  id v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  uint8_t v144[128];
  uint8_t buf[4];
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v1 = a1;
  v156 = *MEMORY[0x1E0C80C00];
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  obj = *(id *)(a1 + 32);
  v106 = v1;
  v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v155, 16);
  if (v100)
  {
    v99 = *(_QWORD *)v140;
    v104 = (id *)(v1 + 48);
    v2 = (id *)(v1 + 72);
    v103 = (id *)(v1 + 64);
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v140 != v99)
          objc_enumerationMutation(obj);
        v102 = v3;
        v4 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v3);
        v135 = 0u;
        v136 = 0u;
        v137 = 0u;
        v138 = 0u;
        objc_msgSend(v4, "insertedEntries");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v135, v154, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v136;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v136 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
              objc_msgSend(v10, "entryDate");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(*(id *)(v1 + 40), "compare:", v11) == -1)
                objc_msgSend(*v104, "addObject:", v10);

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v135, v154, 16);
          }
          while (v7);
        }

        v133 = 0u;
        v134 = 0u;
        v131 = 0u;
        v132 = 0u;
        v101 = v4;
        objc_msgSend(v4, "updatedEntries");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v132;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v132 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
              objc_msgSend(v17, "entryDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(*(id *)(v1 + 40), "compare:", v18);
              v20 = *(void **)(v1 + 56);
              objc_msgSend(v17, "objectID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKey:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19 == -1)
              {
                v23 = v104;
                if (v22)
                  v23 = v103;
LABEL_25:
                objc_msgSend(*v23, "addObject:", v17);
                goto LABEL_26;
              }
              v23 = v2;
              if (v22)
                goto LABEL_25;
LABEL_26:

              v1 = v106;
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
          }
          while (v14);
        }

        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        objc_msgSend(v101, "deletedEntries");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v128;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v128 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * k);
              v30 = *(void **)(v1 + 56);
              objc_msgSend(v29, "objectID");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKey:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
                objc_msgSend(*v2, "addObject:", v29);
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
          }
          while (v26);
        }

        v3 = v102 + 1;
      }
      while (v102 + 1 != v100);
      v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v155, 16);
    }
    while (v100);
  }

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v33 = *(id *)(v1 + 72);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v124;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v124 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * m);
        v39 = *(void **)(v1 + 56);
        objc_msgSend(v38, "objectID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = objc_msgSend(*(id *)(v1 + 80), "indexOfObjectIdenticalTo:", v41);
        if (v42 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(*(id *)(v1 + 88), "addIndex:", v42);
          v43 = *(void **)(v1 + 56);
          objc_msgSend(v38, "objectID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "removeObjectForKey:", v44);

        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
    }
    while (v35);
  }

  objc_msgSend(*(id *)(v1 + 80), "removeObjectsAtIndexes:", *(_QWORD *)(v1 + 88));
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v45 = *(id *)(v1 + 48);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v120;
    do
    {
      for (n = 0; n != v47; ++n)
      {
        if (*(_QWORD *)v120 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * n);
        if ((objc_msgSend(v50, "isDeleted") & 1) == 0)
        {
          v51 = *(void **)(v106 + 56);
          objc_msgSend(v50, "objectID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKey:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            objc_msgSend(*(id *)(v106 + 64), "addObject:", v50);
          }
          else
          {
            +[PXFeedSectionInfo sectionInfoWithCloudFeedEntry:](PXFeedSectionInfo, "sectionInfoWithCloudFeedEntry:", v50);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = *(void **)(v106 + 56);
            objc_msgSend(v50, "objectID");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setObject:forKey:", v54, v56);

            v57 = objc_msgSend(*(id *)(v106 + 80), "indexOfObject:inSortedRange:options:usingComparator:", v54, 0, objc_msgSend(*(id *)(v106 + 80), "count"), 1024, *(_QWORD *)(v106 + 128));
            objc_msgSend(*(id *)(v106 + 80), "insertObject:atIndex:", v54, v57);
            v58 = *(void **)(v106 + 96);
            v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v57);
            objc_msgSend(v58, "pl_adjustIndexesForInsertions:", v59);

            objc_msgSend(*(id *)(v106 + 96), "addIndex:", v57);
          }
        }
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
    }
    while (v47);
  }

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v60 = v106;
  v105 = *(id *)(v106 + 64);
  v61 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v115, v149, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v116;
    do
    {
      for (ii = 0; ii != v62; ++ii)
      {
        if (*(_QWORD *)v116 != v63)
          objc_enumerationMutation(v105);
        v65 = *(void **)(v60 + 56);
        objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * ii), "objectID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKey:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = objc_msgSend(*(id *)(v60 + 80), "indexOfObjectIdenticalTo:", v67);
        if (v68 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v69 = v68;
          if (objc_msgSend(v67, "isLoaded"))
          {
            objc_msgSend(v67, "reload");
            objc_msgSend(*(id *)(v60 + 104), "addIndex:", v69);
          }
          if (v69 < 1)
          {
            v70 = 0;
          }
          else
          {
            objc_msgSend(*(id *)(v60 + 80), "objectAtIndex:", v69 - 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v69 >= (unint64_t)(objc_msgSend(*(id *)(v60 + 80), "count") - 1))
          {
            v71 = 0;
            if (v70)
              goto LABEL_74;
            goto LABEL_75;
          }
          objc_msgSend(*(id *)(v60 + 80), "objectAtIndex:", v69 + 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v70)
            goto LABEL_75;
LABEL_74:
          if ((*(uint64_t (**)(void))(*(_QWORD *)(v106 + 128) + 16))() == -1)
          {
LABEL_75:
            if (v71 && (*(uint64_t (**)(void))(*(_QWORD *)(v106 + 128) + 16))() != -1)
              goto LABEL_77;
          }
          else
          {
LABEL_77:
            objc_msgSend(*(id *)(v106 + 80), "removeObjectAtIndex:", v69);
            v72 = objc_msgSend(*(id *)(v106 + 80), "indexOfObject:inSortedRange:options:usingComparator:", v67, 0, objc_msgSend(*(id *)(v106 + 80), "count"), 1024, *(_QWORD *)(v106 + 128));
            objc_msgSend(*(id *)(v106 + 80), "insertObject:atIndex:", v67, v72);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v106 + 136) + 8) + 24) = 1;
            PLCloudFeedGetLog();
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              v146 = v69;
              v147 = 2048;
              v148 = v72;
              _os_log_impl(&dword_1A6789000, v73, OS_LOG_TYPE_DEBUG, "Section move detected (%li -> %li)", buf, 0x16u);
            }

          }
          v60 = v106;
        }

      }
      v62 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v115, v149, 16);
    }
    while (v62);
  }

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v74 = *(id *)(v60 + 112);
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v111, v144, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v112;
    do
    {
      for (jj = 0; jj != v76; ++jj)
      {
        if (*(_QWORD *)v112 != v77)
          objc_enumerationMutation(v74);
        objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * jj), "asset");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "cloudFeedAssetsEntry");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = *(void **)(v106 + 56);
        objc_msgSend(v80, "objectID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "objectForKey:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          v84 = *(void **)(*(_QWORD *)(*(_QWORD *)(v106 + 144) + 8) + 40);
          if (!v84)
          {
            v85 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v86 = *(_QWORD *)(*(_QWORD *)(v106 + 144) + 8);
            v87 = *(void **)(v86 + 40);
            *(_QWORD *)(v86 + 40) = v85;

            v84 = *(void **)(*(_QWORD *)(*(_QWORD *)(v106 + 144) + 8) + 40);
          }
          objc_msgSend(v84, "addObject:", v83);
        }

      }
      v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v111, v144, 16);
    }
    while (v76);
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v106 + 136) + 8) + 24) && objc_msgSend(*(id *)(v106 + 120), "count"))
  {
    v88 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v89 = *(_QWORD *)(*(_QWORD *)(v106 + 152) + 8);
    v90 = *(void **)(v89 + 40);
    *(_QWORD *)(v89 + 40) = v88;

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v91 = *(id *)(v106 + 120);
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v107, v143, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v108;
      do
      {
        for (kk = 0; kk != v93; ++kk)
        {
          if (*(_QWORD *)v108 != v94)
            objc_enumerationMutation(v91);
          v96 = *(void **)(*(_QWORD *)(*(_QWORD *)(v106 + 152) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * kk), "updatedAssets");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "unionSet:", v97);

        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v107, v143, 16);
      }
      while (v93);
    }

  }
}

void __87__PXFeedSectionInfosManager__getEarliestDate_mostRecentEntries_forBatchWithLatestDate___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0D71618], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", *(_QWORD *)(a1[4] + 8), 0, a1[5], a1[8], a1[9], 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v20, "count") >= a1[8])
  {
    objc_msgSend(v20, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryDate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = objc_msgSend(v20, "count");
    do
    {
      v13 = v12--;
      if (v12 < 1)
        break;
      v14 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      objc_msgSend(v20, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "entryDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "compare:", v16);

    }
    while (v17 != -1);
    objc_msgSend(v20, "subarrayWithRange:", 0, v13);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = v20;
    v7 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
  }

}

void __49__PXFeedSectionInfosManager__rebuildSectionInfos__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D71618], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "fetchLimit"), objc_msgSend(*(id *)(a1 + 32), "entryFilter"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __69__PXFeedSectionInfosManager_indexesOfInvitationsReceivedSectionInfos__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "sectionType");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  *a4 = 1;
  return result;
}

void __64__PXFeedSectionInfosManager_reconfigureToIncludeCloudFeedEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setEarliestDate:", v2);
  objc_msgSend(v3, "setFetchLimit:", 0);

}

void __55__PXFeedSectionInfosManager_loadSectionInfosAtIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isLoaded") & 1) == 0)
  {
    objc_msgSend(v5, "reload");
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

uint64_t __68__PXFeedSectionInfosManager_indexesOfUnloadedSectionInfosAtIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isLoaded");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

+ (NSDate)mostRecentCreationDate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSDate *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D719A8], "cloudSharingPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71618], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", v2, 0, 0, 1, 3, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71618], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", v2, 0, 0, 3, 4, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__86417;
    v27 = __Block_byref_object_dispose__86418;
    v28 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__PXFeedSectionInfosManager_mostRecentCreationDate__block_invoke;
    v20[3] = &unk_1E5148AA8;
    v22 = &v23;
    v21 = v3;
    objc_msgSend(v2, "performBlockAndWait:", v20);
    v6 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 0;
  }
  objc_msgSend(v13, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = 0;
    v10 = 0;
    if (!v6)
      goto LABEL_12;
    goto LABEL_11;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__86417;
  v27 = __Block_byref_object_dispose__86418;
  v28 = 0;
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __51__PXFeedSectionInfosManager_mostRecentCreationDate__block_invoke_2;
  v17[3] = &unk_1E5148AA8;
  v19 = &v23;
  v18 = v7;
  objc_msgSend(v2, "performBlockAndWait:", v17);
  v9 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  if (v6 && v9)
  {
    objc_msgSend(v6, "laterDate:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v6)
  {
LABEL_11:
    v10 = v6;
    goto LABEL_12;
  }
  if (v9)
  {
    v10 = v9;
    v9 = v10;
  }
  else
  {
    v10 = 0;
  }
LABEL_12:
  v11 = (NSDate *)v10;

  return v11;
}

void __51__PXFeedSectionInfosManager_mostRecentCreationDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entryDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__PXFeedSectionInfosManager_mostRecentCreationDate__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entryDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
