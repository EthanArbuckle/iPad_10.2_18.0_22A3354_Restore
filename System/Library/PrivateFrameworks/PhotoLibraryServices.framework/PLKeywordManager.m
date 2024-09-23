@implementation PLKeywordManager

- (PLKeywordManager)initWithPathManager:(id)a3
{
  id v6;
  PLKeywordManager *v7;
  PLKeywordManager *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *writeQueue;
  void *v12;
  objc_super v13;

  v6 = a3;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 34, CFSTR("PLKeywordManager must be initialized in assetsd"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PLKeywordManager;
  v7 = -[PLKeywordManager init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pathManager, a3);
    v9 = dispatch_queue_create("com.apple.photos.assetsd.keywordWrites", 0);
    writeQueue = v8->_writeQueue;
    v8->_writeQueue = (OS_dispatch_queue *)v9;

  }
  return v8;
}

- (BOOL)setKeywords:(id)a3 forAssetUUID:(id)a4 managedObjectContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 76, CFSTR("%s must be called in assetsd"), "-[PLKeywordManager setKeywords:forAssetUUID:managedObjectContext:]");

  }
  +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[PLKeywordManager _setKeywords:forAsset:managedObjectContext:](self, "_setKeywords:forAsset:managedObjectContext:", v9, v12, v11);
  }
  else
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Asset with uuid %@ cannot be found.", buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)setKeywords:(id)a3 forAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;

  v7 = a4;
  v8 = a3;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 87, CFSTR("%s must be called in assetsd"), "-[PLKeywordManager setKeywords:forAsset:]");

  }
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLKeywordManager _setKeywords:forAsset:managedObjectContext:](self, "_setKeywords:forAsset:managedObjectContext:", v8, v7, v9);

  return v10;
}

- (BOOL)setKeyword:(id)a3 forAssets:(id)a4 managedObjectContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 92, CFSTR("%s must be called in assetsd"), "-[PLKeywordManager setKeyword:forAssets:managedObjectContext:]");

  }
  v12 = -[PLKeywordManager _setKeyword:forAssets:managedObjectContext:](self, "_setKeyword:forAssets:managedObjectContext:", v9, v10, v11);

  return v12;
}

- (BOOL)setKeyword:(id)a3 managedObjectContext:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 97, CFSTR("%s must be called in assetsd"), "-[PLKeywordManager setKeyword:managedObjectContext:]");

  }
  v9 = -[PLKeywordManager _setKeyword:forAssets:managedObjectContext:](self, "_setKeyword:forAssets:managedObjectContext:", v7, 0, v8);

  return v9;
}

- (id)createOrLookupKeywordForTitle:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__50556;
  v32 = __Block_byref_object_dispose__50557;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__50556;
  v26 = __Block_byref_object_dispose__50557;
  v27 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__PLKeywordManager_createOrLookupKeywordForTitle_photoLibrary_error___block_invoke;
  v17[3] = &unk_1E366F518;
  v17[4] = self;
  v10 = v8;
  v18 = v10;
  v11 = v9;
  v19 = v11;
  v20 = &v28;
  v21 = &v22;
  objc_msgSend(v11, "performBlockAndWait:", v17);
  v12 = v29[5];
  v13 = (id)v23[5];
  v14 = v13;
  if (!v12 && a5)
    *a5 = objc_retainAutorelease(v13);

  v15 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

- (void)_inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext:(id)a3
{
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *keywordCache;
  id v8;
  _QWORD v9[4];
  id v10;
  PLKeywordManager *v11;
  SEL v12;

  v5 = a3;
  if (!self->_keywordCache)
  {
    v8 = v5;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keywordCache = self->_keywordCache;
    self->_keywordCache = v6;

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__PLKeywordManager__inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext___block_invoke;
    v9[3] = &unk_1E3677C40;
    v11 = self;
    v12 = a2;
    v10 = v8;
    objc_msgSend(v10, "performBlockAndWait:", v9);

    v5 = v8;
  }

}

- (void)_invalidateKeywordCache
{
  pl_dispatch_sync();
}

- (id)_inq_keywordObjectsForKeywords:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  NSMutableDictionary *keywordCache;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  PLKeywordManager *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v7;
  -[PLKeywordManager _inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext:](self, "_inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext:", v7);
  v47 = self;
  if (self->_keywordCache)
  {
    v45 = v8;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v44 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v59 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v47->_keywordCache, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v57 = 0;
            objc_msgSend(v46, "existingObjectWithID:error:", v15, &v57);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v57;
            if (v16
              && (objc_msgSend(v16, "title"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19 = objc_msgSend(v14, "isEqualToString:", v18),
                  v18,
                  v19))
            {
              objc_msgSend(v45, "setObject:forKey:", v16, v14);
            }
            else
            {
              PLBackendGetLog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v65 = v15;
                v66 = 2112;
                v67 = v17;
                _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "keyword cache miss for %{public}@. Error: %@", buf, 0x16u);
              }

            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v54 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
          objc_msgSend(v45, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            +[PLManagedKeyword entityName](PLManagedKeyword, "entityName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v29, (uint64_t)v46, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
              goto LABEL_27;
            objc_msgSend(v30, "setTitle:", v27);
            objc_msgSend(v45, "setObject:forKey:", v30, v27);
            -[NSObject addObject:](v21, "addObject:", v30);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      }
      while (v24);
    }
LABEL_27:

    if (-[NSObject count](v21, "count"))
    {
      v52 = 0;
      v31 = objc_msgSend(v46, "obtainPermanentIDsForObjects:error:", v21, &v52);
      v32 = v52;
      if (v31)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v33 = v21;
        v34 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v49;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v49 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
              keywordCache = v47->_keywordCache;
              objc_msgSend(v38, "objectID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "title");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](keywordCache, "setObject:forKey:", v40, v41);

            }
            v35 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
          }
          while (v35);
        }

      }
    }
    v8 = v45;
    objc_msgSend(v45, "allValues");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v44;
  }
  else
  {
    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch keywords.", buf, 2u);
    }
    v42 = 0;
  }

  return v42;
}

- (BOOL)_setKeywords:(id)a3 forAsset:(id)a4 managedObjectContext:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqual:", v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "libraryURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 199, CFSTR("KeywordManager libraryURL and moc libraryURL mismatch: %@ != %@"), v30, v32);

  }
  pl_dispatch_sync();
  PLBackendGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "uuid");
    v17 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v17;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Setting keywords for asset: %{public}@", buf, 0xCu);

  }
  PLBackendGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v9;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Keywords: %{public}@", buf, 0xCu);
  }

  if (-[NSObject count](v9, "count"))
  {
    -[NSObject allObjects](v9, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLKeywordManager _inq_keywordObjectsForKeywords:managedObjectContext:](self, "_inq_keywordObjectsForKeywords:managedObjectContext:", v19, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v10, "additionalAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mutableSetValueForKey:", CFSTR("keywords"));
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setSet:](v22, "setSet:", v23);

      PLBackendGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v22;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "asset keywords now contains: %{public}@", buf, 0xCu);
      }

      v25 = 1;
    }
    else
    {
      PLBackendGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "uuid");
        v27 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v27;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to fetch existing keywords for asset %@", buf, 0xCu);

      }
      v25 = 0;
    }

  }
  else
  {
    PLBackendGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "Setting keywords to nil", buf, 2u);
    }

    objc_msgSend(v10, "additionalAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setKeywords:", 0);
    v25 = 1;
  }

  dispatch_resume((dispatch_object_t)self->_writeQueue);
  return v25 != 0;
}

- (BOOL)_setKeyword:(id)a3 forAssets:(id)a4 managedObjectContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyword"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moc"));

LABEL_3:
  -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "libraryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqual:", v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "libraryURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeywordManager.m"), 234, CFSTR("KeywordManager libraryURL and moc libraryURL mismatch: %@ != %@"), v29, v31);

  }
  pl_dispatch_sync();
  v34[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLKeywordManager _inq_keywordObjectsForKeywords:managedObjectContext:](self, "_inq_keywordObjectsForKeywords:managedObjectContext:", v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "count");
  if (!v19)
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v9;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch existing keyword %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v18, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[NSObject assetAttributes](v20, "assetAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithSet:", v22);

    objc_msgSend(v10, "valueForKeyPath:", CFSTR("additionalAttributes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v24);

    -[NSObject setAssetAttributes:](v20, "setAssetAttributes:", v23);
LABEL_10:

  }
  dispatch_resume((dispatch_object_t)self->_writeQueue);

  return v19 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordCache, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
}

void __63__PLKeywordManager__setKeyword_forAssets_managedObjectContext___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __63__PLKeywordManager__setKeywords_forAsset_managedObjectContext___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __43__PLKeywordManager__invalidateKeywordCache__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

void __83__PLKeywordManager__inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedKeyword entityName](PLManagedKeyword, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v6 = (void *)a1[4];
  v28 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[5], CFSTR("PLKeywordManager.m"), 128, CFSTR("Failed to fetch existing keywords: %@"), v8);

  }
  v9 = (void *)a1[4];
  v27 = v8;
  v10 = objc_msgSend(v9, "obtainPermanentIDsForObjects:error:", v7, &v27);
  v11 = v27;

  if (v10)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v7;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v22 = v11;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v17, "title");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1[5] + 24);
          objc_msgSend(v17, "objectID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v20, v18);

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v14);
      v11 = v22;
    }
  }
  else
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to get permanent IDs for keywords: %@", buf, 0xCu);
    }
  }

}

void __69__PLKeywordManager_createOrLookupKeywordForTitle_photoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "setKeyword:managedObjectContext:", v3, v4);

  if ((_DWORD)v2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    +[PLManagedKeyword keywordForTitle:context:](PLManagedKeyword, "keywordForTitle:context:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Failed to create keyword");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 41003, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

+ (id)keywordsForAssetWithUUID:(id)a3 managedObjectContext:(id)a4
{
  void *v5;
  void *v6;

  +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_keywordsForAsset:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keywordsForAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x19AEC1554](v7);
        objc_msgSend(a1, "_keywordsForAsset:", v11, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

+ (id)_keywordsForAsset:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "additionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keywords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "title", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

@end
