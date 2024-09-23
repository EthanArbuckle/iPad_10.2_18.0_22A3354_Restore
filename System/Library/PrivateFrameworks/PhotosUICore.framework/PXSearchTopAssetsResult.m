@implementation PXSearchTopAssetsResult

- (PXSearchTopAssetsResult)initWithAssetUUIDs:(id)a3 priorityAssetUUID:(id)a4
{
  id v6;
  id v7;
  PXSearchTopAssetsResult *v8;
  uint64_t v9;
  NSArray *assetUUIDs;
  uint64_t v11;
  NSString *priorityAssetUUID;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXSearchTopAssetsResult;
  v8 = -[PXSearchTopAssetsResult init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    assetUUIDs = v8->_assetUUIDs;
    v8->_assetUUIDs = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    priorityAssetUUID = v8->_priorityAssetUUID;
    v8->_priorityAssetUUID = (NSString *)v11;

    -[PXSearchTopAssetsResult _curateThumbnailAssets](v8, "_curateThumbnailAssets");
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerChangeObserver:", v8);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXSearchTopAssetsResult;
  -[PXSearchTopAssetsResult dealloc](&v4, sel_dealloc);
}

- (void)setTopAssetFilter:(id)a3
{
  void *v4;
  id topAssetFilter;
  void *v6;
  void *v7;
  id v8;

  v4 = _Block_copy(a3);
  topAssetFilter = self->_topAssetFilter;
  self->_topAssetFilter = v4;

  -[PXSearchTopAssetsResult topAssetsFetchResult](self, "topAssetsFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXSearchTopAssetsResult topAssetsFetchResult](self, "topAssetsFetchResult");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchTopAssetsResult _filterTopAssets:](self, "_filterTopAssets:", v7);

  }
}

- (void)_filterTopAssets:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  id v7;
  PHFetchResult *v8;
  PHFetchResult *topAssetsFetchResult;
  id v10;
  id v11;

  v10 = a3;
  -[PXSearchTopAssetsResult topAssetFilter](self, "topAssetFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXSearchTopAssetsResult topAssetFilter](self, "topAssetFilter");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v10);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v6;
  }
  else
  {
    v7 = v10;
  }
  v11 = v7;
  +[PXSearchTopAssetsResult _fetchResultForTopAssets:](PXSearchTopAssetsResult, "_fetchResultForTopAssets:", v7);
  v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  topAssetsFetchResult = self->_topAssetsFetchResult;
  self->_topAssetsFetchResult = v8;

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NSArray *removedObjects;
  void *v22;
  uint64_t v23;
  PHFetchResult *v24;
  PHFetchResult *topAssetsFetchResult;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  NSArray *hiddenObjects;
  uint64_t v41;
  NSArray *v42;
  PXSearchTopAssetsResult *v43;
  void *v44;
  void *v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSearchTopAssetsResult topAssetsFetchResult](self, "topAssetsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "removedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      -[PXSearchTopAssetsResult removedObjects](self, "removedObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[PXSearchTopAssetsResult removedObjects](self, "removedObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (NSArray *)objc_msgSend(v10, "mutableCopy");

      }
      else
      {
        v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      }

      -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v7);
      removedObjects = self->_removedObjects;
      self->_removedObjects = v11;

    }
    objc_msgSend(v6, "changedObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");
    if (v8 || !v23)
    {
      if (!(v8 | v23))
        goto LABEL_21;
    }
    else if (!-[PXSearchTopAssetsResult _shouldRecurateForChangeDetails:](self, "_shouldRecurateForChangeDetails:", v6))
    {
LABEL_21:
      if (objc_msgSend(v22, "count"))
      {
        objc_msgSend(v6, "fetchResultAfterChanges");
        v24 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
        topAssetsFetchResult = self->_topAssetsFetchResult;
        self->_topAssetsFetchResult = v24;

      }
      v26 = 0;
      goto LABEL_26;
    }
    -[PXSearchTopAssetsResult _curateThumbnailAssets](self, "_curateThumbnailAssets");
    v26 = 1;
LABEL_26:
    if (objc_msgSend(v7, "count") || objc_msgSend(v22, "count"))
      -[PXSearchTopAssetsResult _notifyDelegateOfAssetChanges:newCuration:](self, "_notifyDelegateOfAssetChanges:newCuration:", v6, v26);

    goto LABEL_45;
  }
  -[PXSearchTopAssetsResult removedObjects](self, "removedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v12, "mutableCopy");

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v43 = self;
  -[PXSearchTopAssetsResult removedObjects](self, "removedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v14)
  {
    v15 = v14;
    v46 = 0;
    v16 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v4, "changeDetailsForObject:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 && (objc_msgSend(v19, "objectWasDeleted") & 1) == 0)
        {
          objc_msgSend(v45, "removeObject:", v18);
          v46 = 1;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v15);
  }
  else
  {
    v46 = 0;
  }

  -[PXSearchTopAssetsResult hiddenObjects](v43, "hiddenObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v27, "mutableCopy");

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[PXSearchTopAssetsResult hiddenObjects](v43, "hiddenObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(v4, "changeDetailsForObject:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
        {
          objc_msgSend(v34, "objectAfterChanges");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectBeforeChanges");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isHidden");
          if (v38 != objc_msgSend(v37, "isHidden"))
          {
            objc_msgSend(v44, "removeObject:", v33);
            v46 = 1;
          }

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v30);
  }

  if ((v46 & 1) != 0)
  {
    -[PXSearchTopAssetsResult _curateThumbnailAssets](v43, "_curateThumbnailAssets");
    -[PXSearchTopAssetsResult _notifyDelegateOfAssetChanges:newCuration:](v43, "_notifyDelegateOfAssetChanges:newCuration:", 0, 1);
    v39 = objc_msgSend(v44, "copy");
    hiddenObjects = v43->_hiddenObjects;
    v43->_hiddenObjects = (NSArray *)v39;

    v41 = objc_msgSend(v45, "copy");
    v42 = v43->_removedObjects;
    v43->_removedObjects = (NSArray *)v41;

  }
  v6 = 0;
LABEL_45:

}

- (void)_notifyDelegateOfAssetChanges:(id)a3 newCuration:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PXSearchTopAssetsResult__notifyDelegateOfAssetChanges_newCuration___block_invoke;
  block[3] = &unk_1E51473C0;
  v10 = a4;
  block[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (BOOL)_shouldRecurateForChangeDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSArray *v18;
  NSArray *hiddenObjects;

  v4 = a3;
  objc_msgSend(v4, "fetchResultBeforeChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fetchResultAfterChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchTopAssetsResult hiddenObjects](self, "hiddenObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PXSearchTopAssetsResult hiddenObjects](self, "hiddenObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "mutableCopy");

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  if (objc_msgSend(v6, "count"))
  {
    v12 = 0;
    v13 = 0;
    do
    {
      if (v12 >= objc_msgSend(v6, "count"))
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v12 >= objc_msgSend(v8, "count"))
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
        {
          if (v15)
          {
            v17 = objc_msgSend(v14, "isHidden");
            if (v17 != objc_msgSend(v16, "isHidden"))
            {
              objc_msgSend(v11, "addObject:", v16);
              v13 = 1;
            }
          }
        }
      }

      ++v12;
    }
    while (v12 < objc_msgSend(v6, "count"));
  }
  else
  {
    v13 = 0;
  }
  v18 = (NSArray *)objc_msgSend(v11, "copy");
  hiddenObjects = self->_hiddenObjects;
  self->_hiddenObjects = v18;

  return v13 & 1;
}

- (unint64_t)itemType
{
  return 2;
}

- (void)_curateThumbnailAssets
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[16];

  PLPhotosSearchCurationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "TotalTimeDuration", ", buf, 2u);
  }

  -[PXSearchTopAssetsResult priorityAssetUUID](self, "priorityAssetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[PXSearchTopAssetsResult priorityAssetUUID](self, "priorityAssetUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  v9 = -[PXSearchTopAssetsResult numberOfTopAssets](self, "numberOfTopAssets");
  -[PXSearchTopAssetsResult assetUUIDs](self, "assetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchTopAssetsResult sampledAssetUUIDsFrom:numberOfTopAssets:maxNumberToSample:rangeToSample:](PXSearchTopAssetsResult, "sampledAssetUUIDsFrom:numberOfTopAssets:maxNumberToSample:rangeToSample:", v10, v9, 160, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v11, "containsObject:", v8) & 1) == 0)
    {
      -[PXSearchTopAssetsResult assetUUIDs](self, "assetUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v8);

      if (v13)
      {
        objc_msgSend(v11, "arrayByAddingObject:", v8);
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
      }
    }
  }
  +[PXSearchTopAssetsResult _fetchAssetsForAssetUUIDs:](PXSearchTopAssetsResult, "_fetchAssetsForAssetUUIDs:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotosSearchCurationGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);
  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v30 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FireAssetFaults", ", v30, 2u);
  }

  v20 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v15, "fetchedObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotosSearchCurationGetLog();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_END, v17, "FireAssetFaults", ", v29, 2u);
  }

  +[PXSearchTopAssetsResult sortedPreviewAssetsFrom:priorityAssetUUID:numberOfTopAssets:](PXSearchTopAssetsResult, "sortedPreviewAssetsFrom:priorityAssetUUID:numberOfTopAssets:", v22, v8, v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchTopAssetsResult _filterTopAssets:](self, "_filterTopAssets:", v25);
  PLPhotosSearchCurationGetLog();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v27, OS_SIGNPOST_INTERVAL_END, v4, "TotalTimeDuration", ", v28, 2u);
  }

}

- (unint64_t)numberOfTopAssets
{
  return 8;
}

- (NSDictionary)debugDictionary
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%p"), v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("self"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXSearchTopAssetsResult itemType](self, "itemType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("itemType"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_assetUUIDs, CFSTR("assetUUIDs"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PXSearchTopAssetsResult assetUUIDs](self, "assetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("previewAssetsCount"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PXSearchTopAssetsResult topAssetsFetchResult](self, "topAssetsFetchResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("previewAssetsFetchResultCount"));

  return (NSDictionary *)v3;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[PXSearchTopAssetsResult debugDictionary](self, "debugDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PXSearchTopAssetsResult)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchTopAssetsResult.m"), 402, CFSTR("%s is not available as initializer"), "-[PXSearchTopAssetsResult init]");

  abort();
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (PHFetchResult)topAssetsFetchResult
{
  return self->_topAssetsFetchResult;
}

- (PXSearchTopAssetsResultChangeDelegate)delegate
{
  return (PXSearchTopAssetsResultChangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)topAssetFilter
{
  return self->_topAssetFilter;
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (NSArray)removedObjects
{
  return self->_removedObjects;
}

- (NSArray)hiddenObjects
{
  return self->_hiddenObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenObjects, 0);
  objc_storeStrong((id *)&self->_removedObjects, 0);
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong(&self->_topAssetFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

void __69__PXSearchTopAssetsResult__notifyDelegateOfAssetChanges_newCuration___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v2)
  {
    objc_msgSend(v3, "didChangeThumbnailAssetsForSearchResult:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "changedIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didChangeThumbnailAssetsForSearchResult:atIndexes:", v4, v5);

  }
}

+ (id)_fetchResultForTopAssets:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_fetchAssetsForAssetUUIDs:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[16];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLPhotosSearchCurationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "FetchAssets", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CD1570], "px_searchAssetFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setInternalPredicate:", v9);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotosSearchCurationGetLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_END, v5, "FetchAssets", ", buf, 2u);
  }

  return v12;
}

+ (id)sortedPreviewAssetsFrom:(id)a3 priorityAssetUUID:(id)a4 numberOfTopAssets:(int64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  os_signpost_id_t v48;
  void *v49;
  id v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  int64_t v54;
  char v55;
  unint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[8];
  _BYTE v67[128];
  _BYTE v68[128];
  _QWORD v69[5];

  v69[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLPhotosSearchCurationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CurateAssets", ", buf, 2u);
  }

  v14 = (id)objc_opt_new();
  v15 = objc_msgSend(v7, "count");
  if (v15 <= a5)
  {
    v39 = v7;
    v38 = v14;
    v14 = v39;
  }
  else
  {
    v16 = v15;
    v47 = v10 - 1;
    v48 = v10;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v18;
    v46 = (void *)v17;
    v69[0] = v17;
    v69[1] = v18;
    v44 = (void *)v19;
    v69[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      v20 = 0;
      v21 = 0;
      v55 = 0;
      v53 = v16 / a5;
      v54 = a5;
      v52 = v16 % a5;
      v49 = v14;
      v50 = v7;
      do
      {
        if (v21 >= v52)
          v22 = v53;
        else
          v22 = v53 + 1;
        v56 = v22;
        objc_msgSend(v7, "subarrayWithRange:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v23;
        if (v8 && (v55 & 1) == 0)
        {
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v63;
            while (2)
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v63 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                objc_msgSend(v29, "uuid");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "isEqualToString:", v8);

                if ((v31 & 1) != 0)
                {
                  v14 = v49;
                  objc_msgSend(v49, "addObject:", v29);
                  v55 = 1;
                  v7 = v50;
                  goto LABEL_34;
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
              if (v26)
                continue;
              break;
            }
          }

          v14 = v49;
          v7 = v50;
          v23 = v57;
        }
        objc_msgSend(v23, "sortedArrayUsingDescriptors:", v51);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v24 = v32;
        v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v59;
          while (2)
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v59 != v35)
                objc_enumerationMutation(v24);
              v37 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
              if (objc_msgSend(v37, "pixelWidth") && objc_msgSend(v37, "pixelHeight"))
              {
                objc_msgSend(v14, "addObject:", v37);
                goto LABEL_32;
              }
            }
            v34 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
            if (v34)
              continue;
            break;
          }
        }
LABEL_32:

LABEL_34:
        v20 += v56;

        ++v21;
      }
      while (v21 != v54);
    }

    v13 = v47;
    v10 = v48;
    v38 = v46;
  }

  PLPhotosSearchCurationGetLog();
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v41, OS_SIGNPOST_INTERVAL_END, v10, "CurateAssets", ", buf, 2u);
  }

  v42 = (void *)objc_msgSend(v14, "copy");
  return v42;
}

+ (id)sampledAssetUUIDsFrom:(id)a3 numberOfTopAssets:(int64_t)a4 maxNumberToSample:(int64_t)a5 rangeToSample:(int64_t)a6
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t i;
  int64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  os_signpost_id_t spid;
  int64_t v28;
  uint8_t v30[16];
  uint8_t buf[16];

  v8 = a3;
  PLPhotosSearchCurationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SampleAssets", ", buf, 2u);
  }

  v13 = objc_msgSend(v8, "count");
  if (v13 <= a5)
  {
    v25 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v14 = v13;
    spid = v10;
    v15 = (void *)objc_opt_new();
    if (v14 >= a4)
      v16 = a4;
    else
      v16 = v14;
    if (v14 / v16 <= 1)
      v17 = 1;
    else
      v17 = v14 / v16;
    v18 = a6;
    if (v17 < a6)
      v18 = v17;
    v28 = v18;
    if (v14 >= 1 && v16 >= 1)
    {
      v19 = 0;
      for (i = 0; i < v16; ++i)
      {
        v21 = v19;
        if (a6 >= 1)
        {
          do
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v21, spid);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

            ++v21;
          }
          while (v21 < v19 + v28);
        }
        v19 += v17;
        if (v19 >= v14)
          break;
      }
    }
    PLPhotosSearchCurationGetLog();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      *(_WORD *)v30 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_END, spid, "SampleAssets", ", v30, 2u);
    }

    v25 = (void *)objc_msgSend(v15, "copy");
  }

  return v25;
}

uint64_t __52__PXSearchTopAssetsResult__fetchResultForTopAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

@end
